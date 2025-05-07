Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAECC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tx2+qp5fUFaxyyKDyJusWn86x0QDSb7v4Cx5Hi7px0E=; b=YSO2sFtrn3jg7RZV3mv9zlrNNX
	BrM1ZG4khZF0/8vJBFjXByOen/lyaB3q9Ccm/MaZGvG/p9sMHlp7I+4rE7QlX3Kkd4HFCI5HjTi9S
	KWAyfZoI7wDccYPI2QsdEgGaYq0HSUexid518yR334cqdFHW/c6Q6ec8tReSkaD1K+tA9uqYoe/fA
	sJaiP38rKkSJY/GSHtFgWMQGcQDsBMLCImReBPTRqD6s7GQDzwonHVzrPMbMffrFtgZ93MbzGAy1N
	386zvp48rXkS5uPP/trNbdgIjYzs+K3LGzSgyaONZPAimOk3dmsvwbaAE9x0WztdCZy7Ozas1maoq
	QySFv8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgEk-0000000FsL6-3h22;
	Wed, 07 May 2025 14:59:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfmb-0000000FmH1-0Ied
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:30:02 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-af6a315b491so6305976a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628200; x=1747233000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx2+qp5fUFaxyyKDyJusWn86x0QDSb7v4Cx5Hi7px0E=;
        b=aZzNt4xnZPJa/CaPq9EdCue0neSIKlPIAyhHMevcKJDvc1I38wub6bsNEfQ4twWq3e
         nGsrclDOUf+2puHLTpJG2b8yHyHJL39XMTd9An0v8HHh++dGzfJVXyN3xR0XRe7G4iWF
         fBIBBy1kyvRNZqbNWU2NaLn3U57aOcGvI6qYCSlluzAvbcDRB/kFk0MIdN+IhsEdlMwV
         NjdkmqcFv9zfIBNM76S2i/DQDE/1PWFS+/mvIZnhm5TJI40B7yLbOXANmyDdIIuZYPFh
         qSgWzRrGUXZGFUAhcx77mwHogY0PRvRYNdj01Qde/Xxd9CW4w50asEBNP1UvuVpQQH7s
         r7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628200; x=1747233000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tx2+qp5fUFaxyyKDyJusWn86x0QDSb7v4Cx5Hi7px0E=;
        b=JJlUVI0wDCac/5uAo8vVzi60fA7vxwyEUNWy7chjximFp4yFi1xRPYK8q23Uh2/a/e
         P2US1Rf/dtoOsCOCHn9D2ugUPqSKEZ5PMvDQZMBiMdtW7whn8zP2QEvQEvOGSdG4rwl1
         dDoJxhCb0llzQ/loeUoGGJZsQ5H74Rurbnt2zN3tLYt8rmVL9b49pV4gxImSnfisYpfq
         x/6eb1BJvT3C3mk5ijFJeX3Jvfn9/unKXGUFsjx9D+Q8PuTTCmDrrX1c1Vxv1DrVKZcC
         31rLolLLLIKbhsPIEz9nzI5BiljGMgn26sJqvrIxLbhbPnHxwjhD/PMMTiigNaSxqjSn
         ycqg==
X-Forwarded-Encrypted: i=1; AJvYcCUA9pMsklqTfTWWwtI01s0wUwue32iBo6GUZRcwyJVixVUVpxjUTUVJfEMCR9Np0TDSmd8LA3QMgB/TTcxlG4L8@lists.infradead.org
X-Gm-Message-State: AOJu0YxIFzUJ/qcHtsJBn1s8FzIWYWhIZi5WLUWXBjGDBb6c7gwxyHG5
	N1XznOSaykNagVqsdzfSPrprxpVGzvg138ejBcHBkQC2mc4beBCE
X-Gm-Gg: ASbGncvJd6eM+1+dL7FXGBUFf+OZN73Ehzd1P+zPijAuBu+a4gx2q5kHSnGx/Xv4DhE
	kNU7qlPN9nXEvs3JCRD5HpyM9OamNHEjLssdWxfJdtf6zUhzk9NNpfS3Ux3opF21bgTutrkLizD
	MVKIzTwavWj4kGC7pCWC/8t24HXLHAz0NyXRdeY8ozBObgB46SUaX+ud6Qw1/CGBjZkHT7chJsD
	UYQI96vVRqPF+TZyOaiXAR73vF9SgUBasfkMHM7s+RPioDi+y48T62U9AdYtnUylNyeO4Gf717v
	/YShMN27UT/mRWfUjOw1/Vs175GclV2ihHsFtTFYcA6se7w4w5sauJ2/4zKM6dW8FV9aFzIpJjj
	AKI3xvNXt3MNHbfA=
X-Google-Smtp-Source: AGHT+IEfTnLrQfaILn2a1qg9FhcKbdkfEWk7UApwdzBZ8svWHw/KZHdECBQt/Ccuap4IqQpbIJLUkg==
X-Received: by 2002:a05:6a20:3950:b0:20b:a75e:fa32 with SMTP id adf61e73a8af0-2148d42d024mr5379907637.40.1746628199672;
        Wed, 07 May 2025 07:29:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fd2f96ec2sm5819027a12.13.2025.05.07.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:29:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Date: Wed,  7 May 2025 07:29:51 -0700
Message-ID: <20250507142953.269300-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073001_117410_FA41E4C5 
X-CRM114-Status: GOOD (  23.13  )
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

In situations where mapping/unmapping sequence can be controlled by
userspace, attempting to map over a region that has not yet been
unmapped is an error.  But not something that should spam dmesg.

Now that there is a quirk, we can also drop the selftest_running
flag, and use the quirk instead for selftests.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Sending v2 stand-alone, since I'm not quite ready to send a new
iteration of the full VM_BIND series.  And with selftest_running
removed, I think this patch stands on it's own.  (And maybe there
is still time to sneak this in for v6.16, removing an iommu dep
for the VM_BIND series in v6.17?)

v2: Drop selftest_running and use IO_PGTABLE_QUIRK_NO_WARN_ON for
    the selftests

 drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
 include/linux/io-pgtable.h     |  8 ++++++++
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f27965caf6a1..a535d88f8943 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -253,8 +253,6 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
 	       (data->start_level == 1) && (oas == 40);
 }
 
-static bool selftest_running = false;
-
 static dma_addr_t __arm_lpae_dma_addr(void *pages)
 {
 	return (dma_addr_t)virt_to_phys(pages);
@@ -373,7 +371,7 @@ static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
 	for (i = 0; i < num_entries; i++)
 		if (iopte_leaf(ptep[i], lvl, data->iop.fmt)) {
 			/* We require an unmap first */
-			WARN_ON(!selftest_running);
+			WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 			return -EEXIST;
 		} else if (iopte_type(ptep[i]) == ARM_LPAE_PTE_TYPE_TABLE) {
 			/*
@@ -475,7 +473,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		cptep = iopte_deref(pte, data);
 	} else if (pte) {
 		/* We require an unmap first */
-		WARN_ON(!selftest_running);
+		WARN_ON(!(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 		return -EEXIST;
 	}
 
@@ -649,8 +647,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
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
@@ -660,8 +660,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
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
@@ -976,7 +978,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
 			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
-			    IO_PGTABLE_QUIRK_ARM_HD))
+			    IO_PGTABLE_QUIRK_ARM_HD |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1079,7 +1082,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	struct arm_lpae_io_pgtable *data;
 	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
 
-	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1320,7 +1324,6 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 #define __FAIL(ops, i)	({						\
 		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
 		arm_lpae_dump_ops(ops);					\
-		selftest_running = false;				\
 		-EFAULT;						\
 })
 
@@ -1336,8 +1339,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 	size_t size, mapped;
 	struct io_pgtable_ops *ops;
 
-	selftest_running = true;
-
 	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
 		cfg_cookie = cfg;
 		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
@@ -1426,7 +1427,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		free_io_pgtable_ops(ops);
 	}
 
-	selftest_running = false;
 	return 0;
 }
 
@@ -1448,6 +1448,7 @@ static int __init arm_lpae_do_selftests(void)
 		.tlb = &dummy_tlb_ops,
 		.coherent_walk = true,
 		.iommu_dev = &dev,
+		.quirks = IO_PGTABLE_QUIRK_NO_WARN_ON,
 	};
 
 	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
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


