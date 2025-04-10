Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00E0C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7lDTk+D2aN9K2o2aETqca5tZlWTc8yezMYzKKwzeFM=; b=wP5ITZu8gB/RXd28SDlnvgVPxA
	/cixGZvQU4x2qpxW6zecFEI2veSTNhJGmekQt0UGm0I3rrcDK4XyTtPiHhq8hCUMoaWiUww9yVC2R
	wp2kEZugCIZTsxtFHL+8S6dv/5fuNHCxKKurnLe6EYB/zOsmrpm6WeF7lL9VhkuxveKSHJi58nJZ5
	XndtOKk3akRCYDxt0l3KGX3QCUzZkM8kyvff3N30GZW1jLeqqoLoQeNlMjQsikEW8im6QSiVDrhBq
	BTaVdPTL707ES+lLBookICGi05sz5rIs4PVqtlbtcqNtHu5l7qOftO/BG/TvkJLYKzK8RO6vAe0rA
	P1UFO4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gQU-00000008th9-2AjB;
	Thu, 10 Apr 2025 01:09:54 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGV-00000008sAD-3MW7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:36 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c7913bab2cso30829385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246774; x=1744851574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7lDTk+D2aN9K2o2aETqca5tZlWTc8yezMYzKKwzeFM=;
        b=LHXYfmG9Vfc+rA/I0QHtP4lQP3GuWZ1KaoiAFwylXuLawr1OpJsG5NImh+9/nOEvH5
         cUS4xIuB2TIRESNPavQVbdqrT+srgVqgsWKqkdF02Oj01MhF/xo0VTeY7IuhfDUrfH5u
         OCepgCdv5TavPG8JtilKuCBIffPiOCxd4vIIfcbk9+la3LFKWiGwjFFAM2HqqXFHmzp8
         yeNUUTUZYo+jXUohwRLfi2MQHwwGlU89ObtRUFhCmKDP6ORCDv7jWe30saTodxPKqzgy
         udOYTXm7ijEKvPO6m/7Qv/cG/SbF0SBO18yaSJjPzDl8XXN8Ikld5EyeqYHrQlpUklrU
         rffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246774; x=1744851574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7lDTk+D2aN9K2o2aETqca5tZlWTc8yezMYzKKwzeFM=;
        b=W/VDL4xTLubsr8mQvfAqsKYvmKhK9ZQ3jX+bL+aX9UANiYqNz3XGfwZxwJnuFe+yj/
         OsyCSZQmVqd3WTkXTA/gGCsPZQQcSMOzWbceQfIFnmrUKAISkt1RhUJsc4M3k4F4G948
         9T420DCglz6KiHfVywuFOjSL50x/7KyikAHBIIA6+OGZ3u2l4pIVmRgkpVc1Nko57z9S
         lnNIeZgzakU4yfqoPHonQfbBwET5tetuqzrRIQJwn1X6jB+ysOv6st14Vl/TpgCCZMZL
         lxlRxrbABaoAs0uOnxCSSLEVFhmiFZmNV2THoWt4eblPOJeUskosOdAjVoQuxK3VNZwp
         zYWQ==
X-Gm-Message-State: AOJu0YxagTOrgueqzsqqmeOMaUA2CiuKvUOYoqUIM6gJIFxWGNV5NzYK
	Xz3Dmj9k9UP0Y4hvV4XU/elXGU+uc+gliAeXznzM1b1vUtnIFss6APb1Sg==
X-Gm-Gg: ASbGncsqEVWIKK/N+YPtYNyKUd2nYVaB9D4TL2e+BdvY28Ob27XQSToABjFl3L47uY/
	AXbIIT6d6nZeXlNKpSru4X9u8ZYXOs0rIuE6G/SLmPhwugeTE5nVMD7ahfRZ6kaUnHaK4qfVnWT
	wePMJrVbohaWKbgoSANAbZHLi39L5f+WIOsVlD6IYobRs6B4YDQWXQrTz+C+QJpRlhMZNrIACGC
	ONLY6uyH75FwbbzsmRAA6bv19ZqJPF34IxVatBg9qmU2KImqWO1brWybKN3BVQ4BTG9pm27PdkP
	iGC7TSEn9Wc1C1E91Qh9/RjTixTu+pZ0txlPRlfoJkwrcl59x8tZj6d39jkRrygc14KeIfTnJDL
	O2eml8c8Tz98TR/c=
X-Google-Smtp-Source: AGHT+IHwE4DM0JUskEgUnwY5l5TziwQzQmMz//45AfxohgItU6xab/F9UoiQdWp4h++rosDEZifOkQ==
X-Received: by 2002:a05:620a:2549:b0:7c5:56c0:a8 with SMTP id af79cd13be357-7c7a7659969mr135047485a.1.1744246774043;
        Wed, 09 Apr 2025 17:59:34 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:33 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: imx8mn-beacon: Fix HDMI sound output
Date: Wed,  9 Apr 2025 19:58:59 -0500
Message-ID: <20250410005912.118732-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175935_855818_456D928A 
X-CRM114-Status: GOOD (  10.96  )
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

The HDMI bridge chip's sound card enumerates, but it does not generate
sound. This is because the sai5 node is missing the flag telling it
to set the mclk as output.

Fixes: 1d6880ceef43 ("arm64: dts: imx8mn-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
index 1df5ceb11387..37fc5ed98d7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1


