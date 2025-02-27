Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14F3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5f7cp01etSGqQcJpVMZaoL9eSKNoSeKF/3ov9ybZvxo=; b=eJeo59UnQkY/hka8GohmG1XxU+
	Tj3ZGsfnRe/hLbTF+CZBz4hcxlf2xJav9nFhTlpTCSmkCV2fedIZAV71xcJQ+xPrV/0s4egMlnIXC
	zPNLiNr0nwOAJ5G5nKZwyyT6gUgd0H/s2nKTnveBnGvAXXLg0i955vcCQljN9K/epi2+xI3PNS/Zr
	V9WQCgXuBOEGdBpkXxihjw/uilL01+KIw9XyEn2iWW5fZ//n/WLRjXqfk5tTBLRRDqiNX3Sl744bV
	XWrbn2Z8We/wL4U/Nf2Kz7nNVmLZaHpeMpaPpF4tMpOV/YENBXz9DfzUC6BhuSs27nlHv2+diiqTq
	av8CMw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnnd-00000009DxO-49Py;
	Fri, 28 Feb 2025 00:00:17 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnkU-00000009DYo-1wlP;
	Thu, 27 Feb 2025 23:57:07 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2c11ddc865eso462161fac.3;
        Thu, 27 Feb 2025 15:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740700621; x=1741305421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5f7cp01etSGqQcJpVMZaoL9eSKNoSeKF/3ov9ybZvxo=;
        b=cD6muYyx21Nvc4zp20+jBGQrK3f2jopK+Jaih/ZDyNfeUUs35O/lNUx//x3a2FvwWy
         DNSngQJsGI0KQ9uD4tmWOqHHd4EGeSVULyWKMacA8mTqBJkdaEAd7FtU9WwJfw0LS+Te
         vzUUybyoTrod7Kz9TomuBqliX7jgPdNUZeow9JkidsnlLkNY3egRH6WhgNBkPmgNTnm/
         p8mHBde94of/Cw8suFdFLYWKWO8KaxDCxa/GXHd8msTeKhGNzUxQTVNM9wdPvxKbvpS5
         PfqAAw1DwpATP30FiiyNTtuXd9WS5h58BqNIydbnqVkKsGjAS82uCZlD5/HcjOWQgejO
         4qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740700621; x=1741305421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5f7cp01etSGqQcJpVMZaoL9eSKNoSeKF/3ov9ybZvxo=;
        b=R9YLXpBxw1Sglk3qGZYYhyPj1qj/2pvTSQfuxPMyIBRFUHn1Bem9c1HTFd10k565lY
         HmFmngY9QB8Kc/8DxfcYMILPt8TaM65Jo5wUf7IVJU6zV8J6/56SgqSdUPcYVNLyDt8N
         JEhRj2eLkpOWc037d+a6ivVBmE/vzMeS5AJnMdJJ5XCtWHqxACJfRlFMu3Sl9DeVNNSv
         0gdbepNLRDf6tlKaIkzUHPzVUcb19AhiyZPzIjw3QKA9Ox8+WZu0C/elSuHmdI7VwYpZ
         1Lpbk68i/9u+npcu0MzYuj9mP29t4wu0gpxv6E3HdGgHJNV1VjJj0xTCiEVqc834SytP
         SIoA==
X-Forwarded-Encrypted: i=1; AJvYcCWQyq7R1K3tdKvavYJScwsK+LGsgKUnwOG+3OuFw924a7Hig7kYERCOoJF7JtsVBiH3GC1hzOOmmdehwsMIFu4=@lists.infradead.org, AJvYcCXVVy6n1rIPZ+4IwwhBkkWmP7RjV7L17KQtC4fQGx7oD6NMG+k+aOkZ4SnEEe236p5+dYCXAyKHyoaXm2jUcYbq@lists.infradead.org
X-Gm-Message-State: AOJu0YwqYde72o74O4RSTP96ag2J9gAh/Tfn6tIGt5RGkcsyBJ5yjJdH
	TJ3OTVCIDERv1+Z/icrEUg8GTE0uw5IS1mOa//t4vijwY61MjM0g
X-Gm-Gg: ASbGnctox0sEN2LekncOcZHHyACgMphCQ13QF3ok9DZAYIGH9GLsnNvlXSwvGZARuYd
	v4j3Sc2unaxVakBl7ePcCFbP+cBm9rmco0Trdg8WFwj6CTgQ8I0mVq0575FKu8C3rzaNSqDEi1G
	QCNS/fci6MHeJEuRAEK7k4Hh6UgIx41uGh2Nwb0/cD5S0BAyoZHX5jO2XXX1QtV8WhyCprfE0Tv
	j6I5+lDXCcVbATnG1B0l2Ef1dkvtkvfj2doB88ueal2+m7GfxYtuy/n4Q/bI0tUxDod7jByjkzG
	FgvEbH9+PhM3LsA77dCfFlqyftgJWC1co+g=
X-Google-Smtp-Source: AGHT+IHeUEKjz+4sGoCB5gVNYNI3uQzQx3hNsvSywy0xjlxhu59fctjx6SgN7YI3BUYwIqr3Z5ffAA==
X-Received: by 2002:a05:6871:5314:b0:29e:4c37:b471 with SMTP id 586e51a60fabf-2c17873227cmr783286fac.30.1740700621592;
        Thu, 27 Feb 2025 15:57:01 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:87c8:8ae4:f338:6188])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-728afd7694fsm443893a34.50.2025.02.27.15.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:57:01 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Florian Klink <flokli@flokli.de>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Ondrej Jirman <megi@xff.cz>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 1/4] arm64: dts: rockchip: Enable HDMI0 audio output for Orange Pi 5/5B
Date: Thu, 27 Feb 2025 17:56:20 -0600
Message-ID: <20250227235623.1624-2-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227235623.1624-1-honyuenkwun@gmail.com>
References: <20250227235623.1624-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_155702_498652_835820CC 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

HDMI audio is available on the Orange Pi 5 HDMI0 TX port.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 9e16960b8705..3fef11f79788 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -197,6 +197,10 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -355,6 +359,10 @@ &i2s1m0_sdi1
 	status = "okay";
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
 &mdio1 {
 	rgmii_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.48.1


