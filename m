Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1FBC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t7v1Qkb8L6FlMwponX2mZyIWEvjJH1SZ0cHZtJhckdo=; b=vGV2SMOkjH0+LbUkmWNj7xoG/p
	NGSPf2tA73dcZzu/SLvsT0rTFCXJYi2DiY1suZLMkUgCDZ+wLBgQUgL4uC6dVOnkB/FX82R+EZsxt
	TBgfAjn3yyimyxEdTcoAyFpMNpC/azfe8AjzhJKiHM/LdIiCO8m2FJyM5rHuumAYdN8sRXT0IObve
	eIfYI12cBeVKlWZUcx73fabYN8Azrfdb923AKOwXsGQzKI++Y5h2zYiq8QfGSgl89RIDfbGs9FQZI
	Ebos5kDszNt7LRwSnNYrM5KtIDYS0e2HmMp/UvhXVTsVNESBuTk6xk9mYEOVlBc6ANx/f7vfoHs4+
	dCA7b0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn3s-0000000C9y7-3FpB;
	Thu, 13 Mar 2025 18:13:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmol-0000000C60Y-2ejL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 17:58:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2240b4de12bso34540695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741888682; x=1742493482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7v1Qkb8L6FlMwponX2mZyIWEvjJH1SZ0cHZtJhckdo=;
        b=RJIMb7ZGzPj2ym9U0204zCzluXVr52xP2/DaHY6Fk/h8RNaHqp5RrJj1ZlnPT8ey1C
         84x34tD/Qvo4sFMsaZiWoSgvB0+Ht4XrHFZl7BxubUCJxUiRm3P1eCe39w+S1mdsY83J
         40H6+cZIOBIrSrYq92b/owyUOeXKGmz3JH7a0Za9wzx0HMlbxy6W6OVza2rnVmA4Xl3T
         wJ6w+nHZkEBtzRFvnEo9praC/gTnQPMuKZY+KbD5fJRGAXD1tzFJXJxhZ8hADyXRozay
         NoaJFdD4Cwe0BXMuugYWGb4hhAYJollCRgrH9dohX1ZzeUu8h05BirRPd/nPGXA2/CyT
         DVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741888682; x=1742493482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7v1Qkb8L6FlMwponX2mZyIWEvjJH1SZ0cHZtJhckdo=;
        b=Os0KrP3K+QGsdGUC9M3fQJB4N8Nd0RAppqOm1ULUd568iYA8evZJMb+RrT0ZyW/b2f
         XojUjfWq1/kiJUjpziRm4C8BY+ryiTN9DhQtXDiv3SBHKTMjMTkGztJVaOl6XMQQqnoT
         1b9UqOjRSSSOzF/0VEbfCb188UgdQzo413G7n6CkDVh2GssFEc+6UlDFFJYW4/apt3bb
         qanMPimdNeXUFGoJH5tvbOZzjVSXEo1YN1TNOY2t7UECQJufMU/RRG+7OFBqysgwkkxe
         AmRIR5BVMJeOWzgKpcaPOxqmehmNSHWFDf8VL3kqVFa95uCu6CoamricZwcn6Ha8byb0
         T+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWq3vUJSCkM9jEVCHQbnNjOmrmeuCHAhjhIAd4L/GTcMwOewPEFwqY/NEfn8W48ibK/Lb/GENIIDWnIMdJbCRrJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxugWQtaL/gHla6Y9ChageXZf/9IrY7NGLOGfF8pzOcDslJaRM3
	mRCKfof/7gzwOWkPrruzIzkArthM27TXW6lmhNANCylwnI1eDGFuqYsSiQ==
X-Gm-Gg: ASbGncsPaqzebvQVSuLxofWoCpAXvfaTGaEmsx9YBrShQc15CpwRbAHIe6ydKyDNSnX
	dnlcyoG93aKNdTrO+XVOa0DqttemQ4cGYeBVG7bkfmyWFNZ0/GuOgql+xdmB/ak6n0bwBTCZgPF
	5GdjuC39aW2XoI5O7thFmIXBiEiS2KKHinKMmHjIIc/GiFLK5PshAUCTs/WhQsiqkvstVa7HsGJ
	WXyVzMWo/2ojkJSLNJpc4m4+q3uGDJkl3Kt1uI8LuvPD8OxVA17fwuVRFvx13M5F2fY+icMjgLs
	Bqqx4We4rkyKp0UJS/2G/ZJ/dh+RDBZ2YlXY3sV63E7RJtqKbLa0aYqaP9o=
X-Google-Smtp-Source: AGHT+IFRRUvqj0O9I5WXVWC/ciIqdS7Vqabcfjv6S8Y/Ld1N1H21yqO9vl98/qGFXLxeYxTxDkE4+g==
X-Received: by 2002:a05:6a00:2e17:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7371f0d6230mr500593b3a.7.1741888682280;
        Thu, 13 Mar 2025 10:58:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:abab:f7ee:5b0a:8554])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115749f2sm1632720b3a.80.2025.03.13.10.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 10:58:01 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx31/imx6: Use flash as the NOR node name
Date: Thu, 13 Mar 2025 14:57:52 -0300
Message-Id: <20250313175752.1532299-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_105803_674142_5A67C96D 
X-CRM114-Status: GOOD (  11.97  )
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

From: Fabio Estevam <festevam@denx.de>

According to mtd-physmap.yaml, 'nor' is not a valid node name.

Change it to 'flash' to fix the following dt-schema warning:

nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx31-lite.dts         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx31-lite.dts b/arch/arm/boot/dts/nxp/imx/imx31-lite.dts
index d17abdfb6330..630f8fa69ba8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx31-lite.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx31-lite.dts
@@ -157,7 +157,7 @@ &uart3 {
 &weim {
 	status = "okay";
 
-	nor@0,0 {
+	flash@0,0 {
 		compatible = "cfi-flash";
 		reg = <0 0x0 0x200000>;
 		bank-width = <2>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts
index f08b37010291..bba82126aaaa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts
@@ -279,7 +279,7 @@ &weim {
 	ranges = <0 0 0x08000000 0x08000000>;
 	status = "okay";
 
-	nor@0,0 {
+	flash@0,0 {
 		compatible = "cfi-flash";
 		reg = <0 0 0x02000000>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
index a381cb224c1e..2587d17c5918 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
@@ -854,7 +854,7 @@ &weim {
 	ranges = <0 0 0x08000000 0x08000000>;
 	status = "disabled"; /* pin conflict with SPI NOR */
 
-	nor@0,0 {
+	flash@0,0 {
 		compatible = "cfi-flash";
 		reg = <0 0 0x02000000>;
 		#address-cells = <1>;
-- 
2.34.1


