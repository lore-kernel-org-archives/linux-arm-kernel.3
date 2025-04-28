Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZWdv895QF2g5ZazrpGEqIZ+CNyMWOJKJzfuDlETcFA=; b=GTEpDIuE35VdX8jkFdTLGDYIHE
	M3F/qHp4f/hdOWV7aqPIbD9CCFvkSYHQo0ZTxX1pjx8i5t1mMJd94Sda5dz6aw1rt7QgPpjTzmrYn
	cjlvKAF5R5e04Ul3LtjNLo8AITzl+ltFAp2qYXQLUCy2I04IivfzaRPtYRDFitVKkPi7URTMuPJlw
	FnzhMG/ibapdhXPylqAE5ZIUPMy+HBMPrto5jEmKfBQLnjxH03x+gTKIsCnZEmWVwDEsNSJ84lm+Q
	Iib2n7J00v6dmAJfoZLxbJkIsGWtoxw1SZoeaKrte5uTG4ubjFxdhpXlDOzsdAVaNlet6Apv/woOf
	91uU92wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vbs-00000007Xv9-2HAn;
	Mon, 28 Apr 2025 21:01:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VWn-00000007WWA-49A0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:56:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-736aaeed234so4470869b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873797; x=1746478597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZWdv895QF2g5ZazrpGEqIZ+CNyMWOJKJzfuDlETcFA=;
        b=dyX2Y68sMPwRyxuReZ6CRvzV0i1slCaIrN2JPNnTeLUNeyzBFiD6lNXeSvUQv+PO/y
         TCbXYIwzp+jUoh8jRCCJwM9f8JFkVvNmqglAWrtvQJML2Iw3885vv2t3b/D+KgoQi07T
         dTRVoGLbeJMra7dvfN43YPAng4gWncUkRXsPERVUe3xAxYt2R8gcK8y7BANQVdn7fHoU
         XEn1U4VMEfVfaQgYiBqeZcnW9z6ZhVPVg2CTSdluodpkDZuQAUn1Fwz8G7ldXdUlxiHV
         6ZzGG0+yc3ncZmUNXjf8ovXDAY7C4ooavFT8GXc5bAnSPauZUvf7KGj4AyBXC7MAiUK5
         sgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873797; x=1746478597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZWdv895QF2g5ZazrpGEqIZ+CNyMWOJKJzfuDlETcFA=;
        b=EhgiPo2RWDpTslVsiMnKvKg0QSfGihaHhHbcZ7hpMMXlhi4A3f0MKdmFYnXj3WvGHD
         IBA2X9vXn4PO7ujQpbZIYjWdxXbSDOk4qFh95Gy12HD7o6dJxHZTTD2D+NHno5q4YgVK
         TIJ71Hamf3Djgq5ToZxV0xkp/16Jf09Klw1egfS+ze8eboNL3UwDgAVDICO3pJqczfbm
         KhHuaIZZcL5syAyJ3TPoQmlkOrtm/V6AYyUkc+83/wpVmfl60b02ZoxQtgquW0/+8q68
         8JCOqtSdFI12vNX5754DJbtr5QLCeJTK3S2TRIqLW3Q6wlePLuD5wzJyMSwVOX5rAEux
         ITNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEZ2VuSPNjxniatQzQjTgutKH3iity5ISCTr3fLWPQepG6n+isOcTX6yQQ+SF4GKOJE0si1tT5uC3ff68SYI8N@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxiy0iySFbVvZ1RewzUDTcyD84PuXrHDwADuwzjUw4dRCpXp1d
	RGY0jHsOj6vhEqkW1XL2YIiVE46h6nD9aCc7mRPxtoXg/tJ3Tc0F
X-Gm-Gg: ASbGncviXBa7RtcGMqZ4TPSynzvtmkXnsoi8d09mBik66x6h/sdf9dFl8nUEMzz80uv
	ByPVvAWXjD0XNGNfDTs+N0xFX8SlUT1dMcay6yB2FWi8RjwNts2OAUGjC1YKyM9YGxgHle/gDIF
	GQhn+oNz9dSrPP++kk8bWcS2ki3XMV2p50VS4mDDXkhO1QgGsTmE2eL3e5YWs6awWol6A5lC/Ul
	gIPkWOg+N1rZQoTVyRSC3HCK8lw5M/YALlj48NpbdPHieez7qJ7NBEK6afkFb5CaYPEVnAAc5Qw
	PrCdPPkqx/flHJwDGUIpsBjg8Zs9yr+24yifC8EvZgdkuY36AlubYlDJS0ZONdwaE5erTboWAr8
	eun3NqWNSVuwXcpU4fX+aUHvoFA==
X-Google-Smtp-Source: AGHT+IEiI0PIx8sG0Cs/BBXwMjUjK2HcinX0Gfd8jPjSIhMKMTJcc2LognCvLHlEUKydTsw79aws8Q==
X-Received: by 2002:a05:6a00:3927:b0:732:2923:b70f with SMTP id d2e1a72fcca58-740271689ffmr1632804b3a.11.1745873797293;
        Mon, 28 Apr 2025 13:56:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9abf2sm8405360b3a.122.2025.04.28.13.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:56:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Date: Mon, 28 Apr 2025 13:54:10 -0700
Message-ID: <20250428205619.227835-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_135638_034915_3D53F564 
X-CRM114-Status: GOOD (  19.66  )
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

From: Rob Clark <robdclark@chromium.org>

In situations where mapping/unmapping squence can be controlled by
userspace, attempting to map over a region that has not yet been
unmapped is an error.  But not something that should spam dmesg.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 18 ++++++++++++------
 include/linux/io-pgtable.h     |  8 ++++++++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f27965caf6a1..99523505dac5 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -475,7 +475,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		cptep = iopte_deref(pte, data);
 	} else if (pte) {
 		/* We require an unmap first */
-		WARN_ON(!selftest_running);
+		WARN_ON(!selftest_running && !(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 		return -EEXIST;
 	}
 
@@ -649,8 +649,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
 	ptep += unmap_idx_start;
 	pte = READ_ONCE(*ptep);
-	if (WARN_ON(!pte))
-		return 0;
+	if (!pte) {
+		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
+		return -ENOENT;
+	}
 
 	/* If the size matches this level, we're in the right place */
 	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
@@ -660,8 +662,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 		/* Find and handle non-leaf entries */
 		for (i = 0; i < num_entries; i++) {
 			pte = READ_ONCE(ptep[i]);
-			if (WARN_ON(!pte))
+			if (!pte) {
+				WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 				break;
+			}
 
 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
@@ -976,7 +980,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
 			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
-			    IO_PGTABLE_QUIRK_ARM_HD))
+			    IO_PGTABLE_QUIRK_ARM_HD |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1079,7 +1084,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	struct arm_lpae_io_pgtable *data;
 	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
 
-	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index bba2a51c87d2..639b8f4fb87d 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -88,6 +88,13 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
 	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
+	 *
+	 * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
+	 *	mappings, but silently return -EEXISTS.  Normally an attempt
+	 *	to map over an existing mapping would indicate some sort of
+	 *	kernel bug, which would justify the WARN_ON().  But for GPU
+	 *	drivers, this could be under control of userspace.  Which
+	 *	deserves an error return, but not to spam dmesg.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
@@ -97,6 +104,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
 	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
 	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
+	#define IO_PGTABLE_QUIRK_NO_WARN_ON		BIT(9)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
2.49.0


