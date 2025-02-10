Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lzHw714PzF5qAtLwyye/sMwRzBfQHNnYhqs6NaSr+rg=; b=zlPlUY7yyHeQ0ULHbGL0+xIjai
	g2sHL/mKlmRxhC9BwufgsRTfJvGs6fxdCnkKqDJWw+eRQbTTleT4r4YBiYRp4EzMBfxfyfDmw3O3c
	wSyDqXXnUT52d8SdPerXAmmnGE//yIGoElbwFJWRHrKiPSvKG4KJxtN6y8qcO0/tkk16Hgex2cHNI
	xdMDO159N4AqZRxdf8YT5U3WS1TmXgSChyng7qG6F0WIJwokdyKw286jhuAOsCmgU4BekGKWOwio6
	/ryIgmgzimjDJuZgmILKlRzLWqOcX4RVcUV1yOBYdJtMwraeP53kqdDNADfKwFSKcxdNrngE8H7Mj
	WEGt9Ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSBb-0000000HH4U-2LIw;
	Mon, 10 Feb 2025 11:42:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thS0N-0000000HDty-2p8v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:31:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38dd011ff8bso2133072f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 03:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739187069; x=1739791869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzHw714PzF5qAtLwyye/sMwRzBfQHNnYhqs6NaSr+rg=;
        b=eHJgI8ors+1zZbmNwlYT9TgNXDaSXfVi5XSyGIZgPvJSdX41WcMlbPFnsQ19Tb2aMc
         QOUfZXOy6Un616tpR3n5PXvGFdtQsYxgAiBuCpN42/3gT2XQRF1evOaXIHt/KVxJ3f8e
         W+eqAH17yKptqaujYmLHtGN9ZeC7axnnkh2Y+qnv2l4CzkdWcs86k/nu3yj7VQlWw6k8
         EIsiElVKk9Rfw3sNTBEl1cOKlfkrNHITwccbH+WU0nlf6dbfFv9Ry/D4DprhRs9KdmDu
         m9Cmn4nUjbvXKqbRouSckCMOlfzA2F6VUEZDI8avAq4pWionZo+8fcBNEKQfdSC1Gtl+
         DxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187069; x=1739791869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzHw714PzF5qAtLwyye/sMwRzBfQHNnYhqs6NaSr+rg=;
        b=sQvEB7YSpfvhVGaJ/+dOA6n9HjsXt8fq/AowMe/5KTMJZFF/Xgvms68LCxx62Cm3R7
         NvLQxvprfJAKMubKr+fVqsm3A3R5CXCq4tQ1bS/XEDz87i7+XQDplesT7c0IzZpzfYk4
         NbNKdMCBDN6Rh0Ag/ktgaLwS0CmT4H9IpRqJWhvOLzPuoo+J11bdPOdAWeH/zT28HnBd
         5NXAtO/bP6Mfgh7/Q4xtO4HMAHrp8kwwZj5dUqkf1GAu5WvFMOyR8djpJ/ixl+zFltsC
         BTtbHjk01x4ihNdKibEnNnEwUC4KhQxyshSXLq8Rix4JjXEZz4V+MLnkL7N5LOILIDgW
         H+Cw==
X-Gm-Message-State: AOJu0YzWJGhFCEqwhSKA2OzH2fMXAbn/SKjZMOgBy/szHyPWolbgLc5D
	uWbk+NE2DUraIFDiiFWfp9EtXB4ICnjyz7/N67jUKwKQIfRPmBj9rOsUozTuSXrmP7ay0PkiyxJ
	lhVc=
X-Gm-Gg: ASbGncuj7mAhSx8ZJHncKEZa8Y+4xWutZtL2nmq51sTBH3OR+pJ+5cwarX8+y/fNsOI
	x95o+eYNQvPjsyPkBrChMUDQ4/0Aia7P6+A1QJiyLCO//7XEGap0du1RqTRYPTNtl0G3zP4nbQB
	NOLhDjj6azaDtIxRUZvHORKhJKqcajJxn4f28Ja10T8megw6B+Gb3thoSPRSGkx6kyAa6/0/+y7
	6fBvAsj31CKukekhAcoW6NGmI57s8DMDnlv8XpxaBhtAoKH5PLDvrEFoSoX74fHx7gSH/k2jQSi
	zd7xCsYMWIzfoWys
X-Google-Smtp-Source: AGHT+IHKcL4ZL3Lp7yWuGRAHIS1vVg/lf60vesFvPUVhRkXB5Nb1+tzm4zRQXrtnLLUgCVs9ciXSrA==
X-Received: by 2002:a05:6000:1a8a:b0:38d:dfdc:52b6 with SMTP id ffacd0b85a97d-38ddfdc5416mr2178948f8f.37.1739187069584;
        Mon, 10 Feb 2025 03:31:09 -0800 (PST)
Received: from pop-os.. ([209.198.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm10302764f8f.79.2025.02.10.03.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:31:09 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: coresight: Finish removal of Coresight support in arch/arm/kernel
Date: Mon, 10 Feb 2025 11:29:26 +0000
Message-Id: <20250210112927.623872-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_033111_716821_DB0FBAD0 
X-CRM114-Status: GOOD (  15.85  )
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

Commit 184901a06a36 ("ARM: removing support for etb/etm in
"arch/arm/kernel/"") removed asm/hardware/coresight.h which is included
by this file. Therefore this is dead code so delete it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm/include/asm/cti.h | 160 -------------------------------------
 1 file changed, 160 deletions(-)
 delete mode 100644 arch/arm/include/asm/cti.h

diff --git a/arch/arm/include/asm/cti.h b/arch/arm/include/asm/cti.h
deleted file mode 100644
index f8500e5d6ea8..000000000000
--- a/arch/arm/include/asm/cti.h
+++ /dev/null
@@ -1,160 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASMARM_CTI_H
-#define __ASMARM_CTI_H
-
-#include	<asm/io.h>
-#include	<asm/hardware/coresight.h>
-
-/* The registers' definition is from section 3.2 of
- * Embedded Cross Trigger Revision: r0p0
- */
-#define		CTICONTROL		0x000
-#define		CTISTATUS		0x004
-#define		CTILOCK			0x008
-#define		CTIPROTECTION		0x00C
-#define		CTIINTACK		0x010
-#define		CTIAPPSET		0x014
-#define		CTIAPPCLEAR		0x018
-#define		CTIAPPPULSE		0x01c
-#define		CTIINEN			0x020
-#define		CTIOUTEN		0x0A0
-#define		CTITRIGINSTATUS		0x130
-#define		CTITRIGOUTSTATUS	0x134
-#define		CTICHINSTATUS		0x138
-#define		CTICHOUTSTATUS		0x13c
-#define		CTIPERIPHID0		0xFE0
-#define		CTIPERIPHID1		0xFE4
-#define		CTIPERIPHID2		0xFE8
-#define		CTIPERIPHID3		0xFEC
-#define		CTIPCELLID0		0xFF0
-#define		CTIPCELLID1		0xFF4
-#define		CTIPCELLID2		0xFF8
-#define		CTIPCELLID3		0xFFC
-
-/* The below are from section 3.6.4 of
- * CoreSight v1.0 Architecture Specification
- */
-#define		LOCKACCESS		0xFB0
-#define		LOCKSTATUS		0xFB4
-
-/**
- * struct cti - cross trigger interface struct
- * @base: mapped virtual address for the cti base
- * @irq: irq number for the cti
- * @trig_out_for_irq: triger out number which will cause
- *	the @irq happen
- *
- * cti struct used to operate cti registers.
- */
-struct cti {
-	void __iomem *base;
-	int irq;
-	int trig_out_for_irq;
-};
-
-/**
- * cti_init - initialize the cti instance
- * @cti: cti instance
- * @base: mapped virtual address for the cti base
- * @irq: irq number for the cti
- * @trig_out: triger out number which will cause
- *	the @irq happen
- *
- * called by machine code to pass the board dependent
- * @base, @irq and @trig_out to cti.
- */
-static inline void cti_init(struct cti *cti,
-	void __iomem *base, int irq, int trig_out)
-{
-	cti->base = base;
-	cti->irq  = irq;
-	cti->trig_out_for_irq = trig_out;
-}
-
-/**
- * cti_map_trigger - use the @chan to map @trig_in to @trig_out
- * @cti: cti instance
- * @trig_in: trigger in number
- * @trig_out: trigger out number
- * @channel: channel number
- *
- * This function maps one trigger in of @trig_in to one trigger
- * out of @trig_out using the channel @chan.
- */
-static inline void cti_map_trigger(struct cti *cti,
-	int trig_in, int trig_out, int chan)
-{
-	void __iomem *base = cti->base;
-	unsigned long val;
-
-	val = __raw_readl(base + CTIINEN + trig_in * 4);
-	val |= BIT(chan);
-	__raw_writel(val, base + CTIINEN + trig_in * 4);
-
-	val = __raw_readl(base + CTIOUTEN + trig_out * 4);
-	val |= BIT(chan);
-	__raw_writel(val, base + CTIOUTEN + trig_out * 4);
-}
-
-/**
- * cti_enable - enable the cti module
- * @cti: cti instance
- *
- * enable the cti module
- */
-static inline void cti_enable(struct cti *cti)
-{
-	__raw_writel(0x1, cti->base + CTICONTROL);
-}
-
-/**
- * cti_disable - disable the cti module
- * @cti: cti instance
- *
- * enable the cti module
- */
-static inline void cti_disable(struct cti *cti)
-{
-	__raw_writel(0, cti->base + CTICONTROL);
-}
-
-/**
- * cti_irq_ack - clear the cti irq
- * @cti: cti instance
- *
- * clear the cti irq
- */
-static inline void cti_irq_ack(struct cti *cti)
-{
-	void __iomem *base = cti->base;
-	unsigned long val;
-
-	val = __raw_readl(base + CTIINTACK);
-	val |= BIT(cti->trig_out_for_irq);
-	__raw_writel(val, base + CTIINTACK);
-}
-
-/**
- * cti_unlock - unlock cti module
- * @cti: cti instance
- *
- * unlock the cti module, or else any writes to the cti
- * module is not allowed.
- */
-static inline void cti_unlock(struct cti *cti)
-{
-	__raw_writel(CS_LAR_KEY, cti->base + LOCKACCESS);
-}
-
-/**
- * cti_lock - lock cti module
- * @cti: cti instance
- *
- * lock the cti module, so any writes to the cti
- * module will be not allowed.
- */
-static inline void cti_lock(struct cti *cti)
-{
-	__raw_writel(~CS_LAR_KEY, cti->base + LOCKACCESS);
-}
-#endif
-- 
2.34.1


