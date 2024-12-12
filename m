Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZxQMQu4cbyziwIooPRheQAiraNBUGRcC5SFKfDzOkk=; b=bocUukk9LLzdxWw42ojUaTKqtR
	ua6xkOPZbkrD3wKZc0da/Roovefga92l5KGm2y56kwOVFodfAaAlSpBpIas9Z8NE0A3iKO+/4fqLU
	NSifUX43q5iHDs75z86wFpYmiAhykCH5NzXXYjYzIQaF4Bl2oZnQ1uFc8gS8BTZh0/iAXAxZhjdwa
	lDgGOok+uE9KE/PFKtUDq30eayWUyyJeEBA+LRWjE6myk6V4DFprPeny+OdOV2mTKOesOOiJheFks
	Ram6X78aagnu9hmfUgmKuds/p8rfs8fdb07nquu4DAGBEbOQH+BiTMFDub9aF4lT96FykPF6GY3DI
	+TBfoDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnbZ-00000001KbO-1Apn;
	Thu, 12 Dec 2024 18:08:05 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYS-00000001JWN-3GVQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:04:53 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434fb9646efso8342115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026690; x=1734631490; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZxQMQu4cbyziwIooPRheQAiraNBUGRcC5SFKfDzOkk=;
        b=vP1QOjdM6jbhytUMc8XC4NUkYcxYpo3kcb1u3Ja3lGl2Lhw9SCNMRKAsZDeGLGNJfF
         Vx3otdpmOBpfnbFsd2GwPcJLc/H/eLwQnJD14evWuVFqmz9R6Uv/uIg6r1Ue/M69BOmx
         Vp/28UghaWMnjB6Pv8QhYhpCsZpcGfzAErR0XpDMq0Lmk3ZGMi1jW70cxUdxzAQxlpve
         SvL78NeZzOjks6f96s2FtHGnhHwxdMDOK7Joi37t+6ZQjZexxjDeEzJHzpkTdQm8TeEQ
         i7rH0uh1m6KHGjJRBH/SQr1qJUhvDcIpHH8WCbE7RcsyXi7VRgYyedN/0vTyCaG0TW9+
         Ug7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026690; x=1734631490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZxQMQu4cbyziwIooPRheQAiraNBUGRcC5SFKfDzOkk=;
        b=MoyqPPXTriei4fKXnKC4Et0eu+PLXwHBOrSkLGAy7WGc0JhdnPibBjY9/gF8+cIVDP
         jQt25WR8mugQBIcmsWz2qVZ+r9oRCZrDIf/IniUY84+h05yZerE4stL9jsE/ePuDCbqf
         esCEUmXp9PRZDbOMos4X8mX8sDaP7wXebgXXPaaRhGFN2UI3nTglvHSPbz3aEbRLm7XI
         gDCwhYCBDB3PcXiC+veh/b5LuidP6poQNYJShEK5XdiZndn29CssSxB0K/unvrLiM19T
         riszr3W7ut4wbitdrMOoXafcKBGk9cWoPbQDiJ1wC7TGb6jHOFG+DX3h1bwXuPjWvBwU
         fBUg==
X-Forwarded-Encrypted: i=1; AJvYcCVMX5eOv0oQ5NSffne8FmqbU/X5GyNS82PaThVkWer/qi7+nTP93i/P5zF5awgRvDolLUXe90cYQSounGb85lr+@lists.infradead.org
X-Gm-Message-State: AOJu0YyCmdOk33vNAEkWjRVHq0/vG/gw6vPlMYufvSezlDZBjITKLwKS
	c+QPtuzKa+im3n/Yk8DV+ZA/049w8mi7pFq8fdlmMmZCs3u25ZONyZlue9oHDYq7aSK69lN36rc
	g99z3uUX/5g==
X-Google-Smtp-Source: AGHT+IFzpfMVwcRrV2/gqjEcPWIIertEvfaFJMhjw3EeYh/NSeVQCIM7XVIoTxUlYOdKn5XnKjOATZ6q1zompA==
X-Received: from wmbay15.prod.google.com ([2002:a05:600c:1e0f:b0:434:ff52:1c7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a011:b0:434:f623:a004 with SMTP id 5b1f17b1804b1-4361c3a157cmr72244495e9.16.1734026690208;
 Thu, 12 Dec 2024 10:04:50 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:27 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-4-smostafa@google.com>
Subject: [RFC PATCH v2 03/58] iommu/io-pgtable: Add configure() operation
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100452_824003_48DB6C2E 
X-CRM114-Status: GOOD (  16.11  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Allow IOMMU drivers to create the io-pgtable configuration without
allocating any tables. This will be used by the SMMUv3-KVM driver to
initialize a config and pass it to KVM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 16 ++++++++++++++++
 drivers/iommu/io-pgtable.c     | 15 +++++++++++++++
 include/linux/io-pgtable.h     | 15 +++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 8d435a5bcd9a..e85866c90290 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -148,6 +148,13 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	return NULL;
 }
 
+static int arm_64_lpae_configure_s1(struct io_pgtable_cfg *cfg)
+{
+	struct arm_lpae_io_pgtable data = {};
+
+	return arm_lpae_init_pgtable_s1(cfg, &data);
+}
+
 static struct io_pgtable *
 arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 {
@@ -178,6 +185,13 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	return NULL;
 }
 
+static int arm_64_lpae_configure_s2(struct io_pgtable_cfg *cfg)
+{
+	struct arm_lpae_io_pgtable data = {};
+
+	return arm_lpae_init_pgtable_s2(cfg, &data);
+}
+
 static struct io_pgtable *
 arm_32_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 {
@@ -264,12 +278,14 @@ struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns = {
 	.caps	= IO_PGTABLE_CAP_CUSTOM_ALLOCATOR,
 	.alloc	= arm_64_lpae_alloc_pgtable_s1,
 	.free	= arm_lpae_free_pgtable,
+	.configure	= arm_64_lpae_configure_s1,
 };
 
 struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns = {
 	.caps	= IO_PGTABLE_CAP_CUSTOM_ALLOCATOR,
 	.alloc	= arm_64_lpae_alloc_pgtable_s2,
 	.free	= arm_lpae_free_pgtable,
+	.configure	= arm_64_lpae_configure_s2,
 };
 
 struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns = {
diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index 8841c1487f00..be65f70ec2a6 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -99,3 +99,18 @@ void free_io_pgtable_ops(struct io_pgtable_ops *ops)
 	io_pgtable_init_table[iop->fmt]->free(iop);
 }
 EXPORT_SYMBOL_GPL(free_io_pgtable_ops);
+
+int io_pgtable_configure(struct io_pgtable_cfg *cfg)
+{
+	const struct io_pgtable_init_fns *fns;
+
+	if (cfg->fmt >= IO_PGTABLE_NUM_FMTS)
+		return -EINVAL;
+
+	fns = io_pgtable_init_table[cfg->fmt];
+	if (!fns || !fns->configure)
+		return -EOPNOTSUPP;
+
+	return fns->configure(cfg);
+}
+EXPORT_SYMBOL_GPL(io_pgtable_configure);
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index d7bfbf351975..f789234c703b 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -49,6 +49,7 @@ struct iommu_flush_ops {
 /**
  * struct io_pgtable_cfg - Configuration data for a set of page tables.
  *
+ * @fmt:	       Format used for these page tables
  * @quirks:        A bitmap of hardware quirks that require some special
  *                 action by the low-level page table allocator.
  * @pgsize_bitmap: A bitmap of page sizes supported by this set of page
@@ -62,6 +63,7 @@ struct iommu_flush_ops {
  *                 page table walker.
  */
 struct io_pgtable_cfg {
+	enum io_pgtable_fmt		fmt;
 	/*
 	 * IO_PGTABLE_QUIRK_ARM_NS: (ARM formats) Set NS and NSTABLE bits in
 	 *	stage 1 PTEs, for hardware which insists on validating them
@@ -241,6 +243,17 @@ struct io_pgtable_ops *alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
  */
 void free_io_pgtable_ops(struct io_pgtable_ops *ops);
 
+/**
+ * io_pgtable_configure - Create page table config
+ *
+ * @cfg:	The page table configuration.
+ *
+ * Initialize @cfg in the same way as alloc_io_pgtable_ops(), without allocating
+ * anything.
+ *
+ * Not all io_pgtable drivers implement this operation.
+ */
+int io_pgtable_configure(struct io_pgtable_cfg *cfg);
 
 /*
  * Internal structures for page table allocator implementations.
@@ -301,11 +314,13 @@ enum io_pgtable_caps {
  *
  * @alloc: Allocate a set of page tables described by cfg.
  * @free:  Free the page tables associated with iop.
+ * @configure: Create the configuration without allocating anything. Optional.
  * @caps:  Combination of @io_pgtable_caps flags encoding the backend capabilities.
  */
 struct io_pgtable_init_fns {
 	struct io_pgtable *(*alloc)(struct io_pgtable_cfg *cfg, void *cookie);
 	void (*free)(struct io_pgtable *iop);
+	int (*configure)(struct io_pgtable_cfg *cfg);
 	u32 caps;
 };
 
-- 
2.47.0.338.g60cca15819-goog


