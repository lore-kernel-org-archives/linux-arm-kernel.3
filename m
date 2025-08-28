Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A26CCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JfYQ5wQeWPqj3q6NX8K9M3CLRkWa1reIgFJFV3niqMA=; b=gG6XAKWAkzANIluZ35P1QNT0ra
	ESjtWMyDTNhiJT20NgCGuL1nfK9DI0teb4Cadf9W5G567kPlAmBTCgrkykuRYEPJFeM7ojt6g5XRW
	06anSM193RV3CiX2SltcCCdePkf/Kcbu4CG8b2aKCekwhAesEpEoM/9NvT1iG5XI1XNfOM+/0S+Ct
	5VjYPsLygO/cE3eNZW9pZ6k2pSERsIhnwSdYqAbsKzmXjFQm6Bp/XOoen66MlrijE6HIVTKU68cMB
	KDq9YEroHrZM77ZXpjRrVSJXPJWHTShKLiGrsYza/xi0kMyM97nYgQJAs75h5nIsyMI4mOlvKkAYH
	BUG8zZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjXD-00000003Ddj-3N46;
	Thu, 28 Aug 2025 20:47:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfad-00000002H3a-3yOS;
	Thu, 28 Aug 2025 16:35:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so7402655e9.1;
        Thu, 28 Aug 2025 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756398906; x=1757003706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JfYQ5wQeWPqj3q6NX8K9M3CLRkWa1reIgFJFV3niqMA=;
        b=biM0aznlFUKzOfuYLpgi1Wu+PGZBrZ0zgMh5mqipfTXUj1kGrleTbWwCeQ02uQRzqj
         t+rKHTTzSh0XW/XaF6kzFNOMhcbHu+uI630f51HcAJQbLEeiNl03EnWciQY7g+dWg3pG
         RLHyGX0IDdJ47CdsKPZxEV9Ee2i9jugc6hABonQGvB7SsN/5N6w0oEj4VRSBCAMiP9nX
         20HZRGHl4I6nBPijR3mjMC54lp4XIC6QrdZXsx/X7AmDIm59v3oPr82DdUEg+V6OvM+T
         XlnKDhJEs+Qvj1qczgkqhiCng1vc4onN1BdkfILgeYEjYHzuFXMCWUTOm41JX9nOa6fR
         muhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756398906; x=1757003706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfYQ5wQeWPqj3q6NX8K9M3CLRkWa1reIgFJFV3niqMA=;
        b=mtHCDbkTpDQEskJNiMKlU3knKIjFYoN8FLy2HQolxGSKxvr/3/DLOzmNRiKGUA1OPS
         t2M6CbK0wZQw9+abx79bIFi5WDVv+gQOot4nTq4rOrB+CmXaaHvAFvkjz00MhGWEYg1H
         QpVBBHRLljj2Cs55wpLB2tMrfbTHd3PM8GZI6AnBgkDQY54BeDvZc6LWJ1WTaAvIBQQD
         2vK1qUevri6ePS0CLcc280RSzO/K1nSnpd+aQ/QAddI2/vOneQlGFUzKGrXrrYVqO4Mw
         Yu5AprUPg5UNh8yhcCYAVTfUhDmnayXhw+FvI4WMqmvzPhxatU+Ah8TXKP075WXzZJJn
         F+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBCK/6KwFCqR4ZBvpvEvF2Op5xnf0d1WbetWiTNlBGe+1A331eNII4zY8EuFFrMMS1o5PnHKmuFdKwU0xyZ2Y=@lists.infradead.org, AJvYcCXInvsJH/kuUYqSLRGNnufcbSCdBCbGfZN7j0Q79vwoQ4j64Yhg+gyLrmVL28Oc1G14/FWMX3k8+kiznxHhrV+J@lists.infradead.org
X-Gm-Message-State: AOJu0YxP04bq4uFIecKxhSQZki4PBHIADvjemYTINUSqMb/sVShDGSEt
	I+lZIYwlDjosiYjH8iFFWiAMZbZkIfQuGOxtzsXnSvnmv55/VY4UUMUYC+/hTA==
X-Gm-Gg: ASbGncv+mp/+/kf81TTc3M09Ft2RGA6CvCOO45bCsjyB9Efeb7u7AyzUXfuePrgDYY+
	UgABy9S9OsiVJChO/c2a2pk7gfAxCRWotLiIXql13MyfF86qW3xwlmeK/Qy5kgHuqk7SxO4oC+M
	ZxAdstcF7uxso/MYqrb/JvvecEjBXEuIsriRZpGU13VxoVCVDn41i8KFtFm3JlvCgjEGh3UpZV7
	LraMbMMVIfPB19f13REVSi8wT1WH5kb17RChts5J8UX1ZQwwdQRMjVAZaDuAIT4w6GKCTJEFZdP
	ZmgNvCFrfUSqZH2z6hqyLO3pK3Xl4vCrWPoi0GVJlmo36G0YJwvCF071uklkbZbUaDaLZyEI6Oo
	YiY1p77S/Pwtna4VoJGnRuwrYP47Q/s7yfmJs+Q==
X-Google-Smtp-Source: AGHT+IHTw1bI2QA56HfNvV10B5zkkRdlJjRVGOQb4dNonItwDze8Jpvoj6Zs4dslyNbDt2NCzDeisQ==
X-Received: by 2002:a05:600c:3583:b0:45b:7e68:c6a3 with SMTP id 5b1f17b1804b1-45b7e68c7admr2936725e9.16.1756398905752;
        Thu, 28 Aug 2025 09:35:05 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66c383b1sm61069365e9.3.2025.08.28.09.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:35:05 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: add HDMI audio to rk3288-miqi
Date: Thu, 28 Aug 2025 16:35:01 +0000
Message-Id: <20250828163501.3829226-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_093507_984273_8CA8F0B9 
X-CRM114-Status: GOOD (  10.85  )
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

From: Alex Bee <knaerzche@gmail.com>

Add the sound and i2s nodes to enable HDMI audio output on
the MiQi board.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
index dd42f8d31f70..20df626547bd 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
@@ -78,6 +78,21 @@ vcc_sys: regulator-vsys {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "HDMI";
+		simple-audio-card,mclk-fs = <512>;
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s>;
+		};
+	};
 };
 
 &cpu0 {
@@ -283,6 +298,11 @@ &i2c5 {
 	status = "okay";
 };
 
+&i2s {
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
 &io_domains {
 	status = "okay";
 
-- 
2.34.1


