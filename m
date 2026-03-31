Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACA7109B462
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 12:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2cLRzPgMh1jzUyXR5ubz7SX1AzTAShSPRbVtdWw9nFk=; b=alJiAJzQsSY2YT/+qSF1tIoh3W
	08xdJ/gckAuCxEfdpZ+YcwJp6hlcLCG49BZ1kVgcwmtth3dgs/mnrZgG1hZXU92xz+/o5xN/xDfhy
	BBrIBWsFk6mBOSStZmo48c3uTtik5xdZb/oc5RLiONSYs6yPR5+2grxMiPqZp7xSjKsyiMC2fbvB9
	eOI2IR61ckhjoIg/7eSebOmRAAEXdiZwHs/1zFquqzxPueQSQb448LUd1RfFqqzGECbFzYyxWWy3B
	mgiWLMnKLQImR4ZznvYQjkiR1PkSE0ZQyDkHQzfV2gU8NNQ7FVIxa8VcbHJbMMKM4PP6XXYbFVH+m
	YGuPAJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yfs-0000000CyLr-1tms;
	Tue, 31 Mar 2026 12:58:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yfq-0000000CyLP-0UE7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 12:58:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so41599445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774961904; x=1775566704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2cLRzPgMh1jzUyXR5ubz7SX1AzTAShSPRbVtdWw9nFk=;
        b=HafacbbX3iNKy1R0yK2phmdZ9u7WS5zUD1ogh7lOwf+/WZIFL+gk88RkmJrlv1UOIy
         fm5AbYZIgPGMEAguoxPDqqCtHtocCaUwB+MCbllWU9ymidxNNuGhnaLQBU8Oj+DJYs3p
         fjaL6Sb235wWbA5jPKiv2LJue4imsSDLNUiZ88+HxstWsV9vixV4JSR4o2IK/o67xu3l
         6A1YYVRua2zVK5ulTqSghsploj/kn51CaeJnWlDwScyjjqqoYKvhoY8fMjLRyliucKg/
         eODR+mIlxSWPm064a4IGYNEqLjBxMxSZ4VTFup0syaAmruvvj2gWVviv/5djhdR+88lo
         k+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774961904; x=1775566704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cLRzPgMh1jzUyXR5ubz7SX1AzTAShSPRbVtdWw9nFk=;
        b=ZCkjU/0gK4H9bQRSa3k8igLLeQmTy1gzbWLmJY1GZPGaHVuSvMJ3mkBaveH8WRA1Ys
         4KCAu9nIsGM4vMANpcqdFYEFXpef88RWrLVWNAfko2TwYN/xUTozjV/3EhiST7zO7T0/
         GNqFqWNSLKrhcwr7ZN2CWejj/c//dIempmIoUX2nbIapsUQVV5mGH2dy/SFPd7uymv8B
         9ZbCp+F/CaMF5m9WPrgUJ48ozT2nXcjQ2qJaUd2mZn+wkJJ8lQ+qG7uNIsuuICjqTgcE
         Q0P4lY9LMA4LHzR/S1eoLsVAjsrUW2mHxr/7bCPDiwUZ29oV70qNDY5svR8m4gHfWVCn
         i/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUrWJ2Mav+Ya/W4jE7R6OqgPIrTheFRvLOQFOVs+DSZH0d4JrFaWp2SF8EaYeMTczDtbCILHEdWyZQucChjohnI@lists.infradead.org
X-Gm-Message-State: AOJu0YySGkz1VGwPJB5Qjf8U62ViLpNIuS2JinG3Jud0uq+U5umHtEuk
	6tmeMKmlVYUky1aa4/tlwuAO8fwoQ37hnt9UMt7jg0uvKq+eeHjgg2o4
X-Gm-Gg: ATEYQzyZBBnzmbgR3vInwwLajN8Me0rTgXtZS/ZHenTNPu3eju0xrSEf+PBfRBofNZg
	rZ2RqdeAyET1CUxgc76MnAz8a5qV1OadvtVp5UW/IjK2xKfL9ihcyXDnnK2up4OVPH3Ef95Zz4R
	n920wYsR867cWGdE4rBVh5A+l01I7BNMZ/z8TbPiZUteQ1HUfhavLFh1C1fbu9i/CBusgdILYHj
	VZT0d6yqujmy50GGhC/xJkGkrFhm9UQtiBF0235oYpifb5VebsI67L1PnrSPk1Y4XX+qm7dGJXZ
	8SEdi5l7hTsRzTECd4pWuXDSJEy/KSs9b6T7S4TS69tY0gqSYuWpG1r2rNrHnOcvCt/BYrc1Jaw
	bNY06YxKzpIXobZHuKfe2BpVNfUNWF1cU2caAegIrHqi6A2DZ86PV9za/Xrrj4f2pzqRytEi1Ot
	15Ke40GksVWQXwYboh/jQqBEJfR+CFAcdYa1SGcpCuaqahVU0Ys7krQBs=
X-Received: by 2002:a05:600c:a012:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-48727ede8d3mr291577115e9.21.1774961904134;
        Tue, 31 Mar 2026 05:58:24 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93c0cfsm38946535e9.9.2026.03.31.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 05:58:23 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: manabian@gmail.com,
	davem@davemloft.net,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] stmmac: cleanup dead dependencies on STMMAC_PLATFORM and STMMAC_ETH in Kconfig
Date: Tue, 31 Mar 2026 13:58:17 +0100
Message-ID: <20260331125817.117091-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_055826_204129_B09F2415 
X-CRM114-Status: GOOD (  13.07  )
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

There are already 'if STMMAC_ETH' and 'STMMAC_PLATFORM'
conditions wrapping these config options, making the
'depends on' statements duplicate dependencies (dead code).

I propose leaving the outer 'if STMMAC_PLATFORM...endif' and
'if STMMAC_ETH...endif' conditions, and removing the
individual 'depends on' statements.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c2cb530fd0a2..ba5473b8dae0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -20,7 +20,6 @@ if STMMAC_ETH
 config STMMAC_SELFTESTS
 	bool "Support for STMMAC Selftests"
 	depends on INET
-	depends on STMMAC_ETH
 	default n
 	help
 	  This adds support for STMMAC Selftests using ethtool. Enable this
@@ -29,7 +28,6 @@ config STMMAC_SELFTESTS
 
 config STMMAC_PLATFORM
 	tristate "STMMAC Platform bus support"
-	depends on STMMAC_ETH
 	select MFD_SYSCON
 	default y
 	help
@@ -53,7 +51,6 @@ config DWMAC_DWC_QOS_ETH
 
 config DWMAC_GENERIC
 	tristate "Generic driver for DWMAC"
-	default STMMAC_PLATFORM
 	help
 	  Generic DWMAC driver for platforms that don't require any
 	  platform specific code to function or is using platform
@@ -336,7 +333,6 @@ config DWMAC_IMX8
 config DWMAC_INTEL_PLAT
 	tristate "Intel dwmac support"
 	depends on OF && COMMON_CLK
-	depends on STMMAC_ETH
 	help
 	  Support for ethernet controllers on Intel SoCs
 
@@ -371,7 +367,7 @@ config DWMAC_VISCONTI
 	help
 	  Support for ethernet controller on Visconti SoCs.
 
-endif
+endif # STMMAC_PLATFORM
 
 config STMMAC_LIBPCI
 	tristate
@@ -381,7 +377,7 @@ config STMMAC_LIBPCI
 config DWMAC_INTEL
 	tristate "Intel GMAC support"
 	default X86
-	depends on X86 && STMMAC_ETH && PCI
+	depends on X86 && PCI
 	depends on COMMON_CLK
 	depends on ACPI
 	help
@@ -420,4 +416,4 @@ config STMMAC_PCI
 	  If you have a controller with this interface, say Y or M here.
 
 	  If unsure, say N.
-endif
+endif # STMMAC_ETH
-- 
2.51.2


