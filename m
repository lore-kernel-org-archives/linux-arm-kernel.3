Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CDBC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kR9rfnoVOVe16EyLIxGv6T9MzhuL6wq8eecdODEGjBs=; b=4FXgewMEOSGsy+siVWioTx0ify
	rNiF/BhMGXkw05iiXQYka+907wTEJ2qCic0fE4cn2DiO/El1IJ9LfP0dI1YhtDV3euYNp62ThCrPD
	zQq5/EMpZ3k7XZ8emLEqBLztzDS7hATNCiN+QWjkINXqc3pXzx+6MiUIJ4pVVn4VwitFUq+O+Opp9
	29FDOUm3C19uebn8FM8z78FBHNSAnWrCQioBxuH5cgE6+DjyFsZx1GqjXdRNgG8TicT2tfIEMORkF
	n0Cq7LBcRNFCHapR5cXgB6MT1WSsEOnQ2T4y6zkLYTjKDmkRVxYwGMemkvcsO2sceCKZ22RMb5Uww
	VDn/+Hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUnM-00000004Cfk-2Zcs;
	Tue, 01 Jul 2025 06:48:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUNj-000000048Au-3Ykr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751350935; x=1782886935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kR9rfnoVOVe16EyLIxGv6T9MzhuL6wq8eecdODEGjBs=;
  b=W/iBDONX+KrLai9x14FTNdxwITlUSjuor1BB1qeF/4468PBBaVwsHNtg
   oqRvTfZgCEAzl84YXrc2lEeUao38lE6VgY5YzxyMMmhq2/FejAiDbRRWb
   bzyxzdI2o5f4SfhJQQfKDQy/73aNvnjzaYmEkpeJcTGaFRD6QZOrO9bgP
   C2qe9iPswboR4LZjk7Ybr60JAKoQ6AH6WEFWrbDKiJTukvIw3tneq2jmM
   hWRQK/c+CX8RwUq6FUp+MfzFmZacIFduiS6L9GZb4EgzLlyRzx0LMJUAO
   GP4lHE5R7izU1NoxOmpUbU94HelJEKXLy+RXAz6e7O03ORJ02LH6OdIps
   g==;
X-CSE-ConnectionGUID: qDvpkikBQVqD4xT6d3HzGQ==
X-CSE-MsgGUID: +tlzL95wQu+Nu0ooHrAyGA==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943278"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:22:13 +0200
X-CheckPoint: {68637E95-51-F34124BF-F8CE6E96}
X-MAIL-CPID: 1DBD312352FCC5035A60DE205D2263D9_4
X-Control-Analysis: str=0001.0A006374.68637EA1.0059,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F9E3167F67;
	Tue,  1 Jul 2025 08:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751350929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kR9rfnoVOVe16EyLIxGv6T9MzhuL6wq8eecdODEGjBs=;
	b=HoGaA2xHrnI+dqY64XbGlGmCZJM00O40EPMWjDSgcwXrFoNDb4r5/iN+mQRBQq7EBxxJoK
	YcsMX9v6ZfCcaWVO0G5wN55WZmo5xdzIBynLnvUXYP65Ar78k03pH0kvstLYI5EHJ7BIGA
	qFyEOKod4oeXMHrhvyVDZZI5YIvnfYHC6toa9xiSPEffM7lZXWS48AMUwBRRwLbi/v9VI7
	9qQtTzlX5toi1S8WSigCQqIee3JYTfmb08ebgAJ4zYn7R0Kl8YWjLnt6v8sUA70YesYV21
	UbnB2/5+wKcqWqCXE7dD3yx6196cYWLtOpwboTBPhoEoFBGM7Tc6vUx+RXkyVA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: fsl-ls1046a: Add missing DMA entries for I2C & LPUART
Date: Tue,  1 Jul 2025 08:21:55 +0200
Message-ID: <20250701062157.514969-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
References: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_232216_399864_AFF37FC6 
X-CRM114-Status: UNSURE (   8.56  )
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

Only i2c0 had it's DMA channels configured. Add the missing one.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0baf256b44003..d4681c491b33a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -523,6 +523,9 @@ i2c1: i2c@2190000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			scl-gpios = <&gpio3 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 36>,
+			       <&edma0 1 37>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -535,6 +538,9 @@ i2c2: i2c@21a0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			scl-gpios = <&gpio3 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 34>,
+			       <&edma0 1 35>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -547,6 +553,9 @@ i2c3: i2c@21b0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			scl-gpios = <&gpio3 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			dmas = <&edma0 1 40>,
+			       <&edma0 1 41>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -633,6 +642,9 @@ lpuart0: serial@2950000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 32>,
+			       <&edma0 1 33>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -643,6 +655,9 @@ lpuart1: serial@2960000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 30>,
+			       <&edma0 1 31>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -653,6 +668,9 @@ lpuart2: serial@2970000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 28>,
+			       <&edma0 1 29>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -663,6 +681,9 @@ lpuart3: serial@2980000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 26>,
+			       <&edma0 1 27>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -673,6 +694,9 @@ lpuart4: serial@2990000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 24>,
+			       <&edma0 1 25>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -683,6 +707,9 @@ lpuart5: serial@29a0000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
 			clock-names = "ipg";
+			dmas = <&edma0 1 22>,
+			       <&edma0 1 23>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.43.0


