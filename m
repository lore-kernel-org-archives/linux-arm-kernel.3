Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62184FD2D6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBw8//o/FKk+iSUCDuIRcFnfCH+1hN6m93POT/Oa1kE=; b=CwGZ159ueKzijYq0z8Wb3bK1fM
	aWidUAGyJmEf9irbwUnPHrVMPi5bfB0Vo3r/jP1e7zvjQ5Lj1Fs+sG7qfEPB8kDrUCn2D8D4N555G
	wGmm4oYDms0iLdkeHdQA0mcwLPSd7NizSpw1IGgwelKvHcZPGC0SSpu8a3fU0lJpOHgeHicI0Auiv
	VVUKQgC45XAtCy53GXraqg9cNdGBxPQhepW2cLSu5EYQVgx48d0A9KeAUblVuOgRw15kLDPirtyfB
	3fjMn9t3wH7vUqNpKrIw0Qcl6qm4V8B+0ewvB2WP6XS0og8ewoyk2cK3YT28nMxJ7ucEXmXAAi+Yi
	xBfrYReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX5-00000009W94-2NPT;
	Tue, 10 Mar 2026 12:49:55 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX0-00000009W4H-1Qzu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:51 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4853a9467c5so13650605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146988; x=1773751788; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBw8//o/FKk+iSUCDuIRcFnfCH+1hN6m93POT/Oa1kE=;
        b=2HHpJLjFRsxlNX3zXXUP9shlg0GnIgrSwhqoSiyFKQapWcaVJsJSDawwz+Dc6KxNyS
         VrZACcVE9Rz5zolDZKOXDc/hTHhExnymstT809aFQbeTQSsCB3SkvunCh6tybEpLwIso
         e5Pb9Y6nwKRBSCMKPuu2wK46KeeklItNk6Wj+yJ+Ido5wfE923jM6KnooU0Eq4jNq0I/
         njZKyR9zvtEuvXcXl8BY4YgyPpAhIHBafNH02hPf5eSd2d8apEQOPVPJkz7m5araWsvA
         gEaPFqhTlolPNb5NavjQubnl2faFUhyGVCrZ/heSthOwNPVFtYnd2cPDRabEDoTvapej
         52Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146988; x=1773751788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBw8//o/FKk+iSUCDuIRcFnfCH+1hN6m93POT/Oa1kE=;
        b=Fzbe+z67gm52YZDXHIvwZVtniPGBW93FVa0oGQ5aiYsBpjfUTqKMUqs/DZSMiFRakM
         lpT4R/oCWui3wKZ8OleLpsP4s3Q8JxAetLLbUw8KLjxsn1oYJtBJnowktwM30smWQL2D
         y1tKo0mVSERiA2y/+o6SppeM91Ov2q7zauB64LWb67fYE55g/XRLUdsA5vzZ4hmzqp3l
         KkyOR71AKn3L6svy6pM6e4F1yWtm4AKIzw3S2HxUS3J34gD/20qUrFZmWQA0xP7htb+v
         e0cFfY45CQgSOZcPJ7CSXiZ9CHVw/tg9L3yre5wGy3/CguvuKJyrWYzPmdtEvu551QV1
         fphw==
X-Forwarded-Encrypted: i=1; AJvYcCWTWBtLXCJz6IudsvhTTfwLn/x585sxe1lwbORHq7nCSn783PRMt4R5OFU9PKewy8nXZ243gbg+8OWKcJ+XdKYf@lists.infradead.org
X-Gm-Message-State: AOJu0YyqHVcspDjY254hLRyjrKk75b3V+LepdEFc3jD/RfgRfSY+5Ugp
	bmNCqMJc1OgYYWTOF687uXM78FU2NbM0UuhD+IW4AmCjse4M8UyxzezgfNQ2oTafsj2qIa0z+pC
	+4l//38rwr4PQSiER7Qo1j3OyE5q+TA==
X-Received: from wmoo8-n1.prod.google.com ([2002:a05:600d:108:10b0:485:4553:1a97])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4f:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-4853f7233b2mr80282675e9.11.1773146987881;
 Tue, 10 Mar 2026 05:49:47 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:24 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-6-sebastianene@google.com>
Subject: [PATCH 05/14] irqchip/gic-v3-its: Prepare shadow structures for KVM
 host deprivilege
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054950_423862_2186E487 
X-CRM114-Status: GOOD (  22.00  )
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

Expose two helper functions to support emulated ITS in the hypervisor.
These allow the KVM layer to notify the driver when hypervisor
initialization is complete.
The caller is expected to use the functions as follows:
1. its_start_deprivilege(): Acquire the ITS locks.
2. on_each_cpu(_kvm_host_prot_finalize, ...): Finalizes pKVM init
3. its_end_deprivilege(): Shadow the ITS structures, invoke the KVM
   callback, and release locks.
Specifically, this shadows the ITS command queue and the 1st level
indirect tables. These shadow buffers will be used by the driver after
host deprivilege, while the hypervisor unmaps and takes ownership of the
original structures.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 drivers/irqchip/irq-gic-v3-its.c   | 165 +++++++++++++++++++++++++++--
 include/linux/irqchip/arm-gic-v3.h |  24 +++++
 2 files changed, 178 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 291d7668cc8d..278dbc56f962 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -78,17 +78,6 @@ struct its_collection {
 	u16			col_id;
 };
 
-/*
- * The ITS_BASER structure - contains memory information, cached
- * value of BASER register configuration and ITS page size.
- */
-struct its_baser {
-	void		*base;
-	u64		val;
-	u32		order;
-	u32		psz;
-};
-
 struct its_device;
 
 /*
@@ -5232,6 +5221,160 @@ static int __init its_compute_its_list_map(struct its_node *its)
 	return its_number;
 }
 
+static void its_free_shadow_tables(struct its_shadow_tables *shadow)
+{
+	int i;
+
+	if (shadow->cmd_shadow)
+		its_free_pages(shadow->cmd_shadow, get_order(ITS_CMD_QUEUE_SZ));
+
+	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+		if (!shadow->tables[i].shadow)
+			continue;
+
+		its_free_pages(shadow->tables[i].shadow, 0);
+	}
+
+	its_free_pages(shadow, 0);
+}
+
+static struct its_shadow_tables *its_get_shadow_tables(struct its_node *its)
+{
+	void *page;
+	struct its_shadow_tables *shadow;
+	int i;
+
+	page = its_alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO, 0);
+	if (!page)
+		return NULL;
+
+	shadow = (void *)page_address(page);
+	page = its_alloc_pages_node(its->numa_node,
+				    GFP_KERNEL | __GFP_ZERO,
+				    get_order(ITS_CMD_QUEUE_SZ));
+	if (!page)
+		goto err_alloc_shadow;
+
+	shadow->cmd_shadow = page_address(page);
+	shadow->cmdq_len = ITS_CMD_QUEUE_SZ;
+	shadow->cmd_original = its->cmd_base;
+
+	memcpy(shadow->tables, its->tables, sizeof(struct its_baser) * GITS_BASER_NR_REGS);
+
+	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+		if (!(shadow->tables[i].val & GITS_BASER_VALID))
+			continue;
+
+		if (!(shadow->tables[i].val & GITS_BASER_INDIRECT))
+			continue;
+
+		page = its_alloc_pages_node(its->numa_node,
+					    GFP_KERNEL | __GFP_ZERO,
+					    shadow->tables[i].order);
+		if (!page)
+			goto err_alloc_shadow;
+
+		shadow->tables[i].shadow = page_address(page);
+
+		memcpy(shadow->tables[i].shadow, shadow->tables[i].base,
+		       PAGE_ORDER_TO_SIZE(shadow->tables[i].order));
+	}
+
+	return shadow;
+
+err_alloc_shadow:
+	its_free_shadow_tables(shadow);
+	return NULL;
+}
+
+void *its_start_depriviledge(void)
+{
+	struct its_node *its;
+	int num_nodes = 0, i = 0;
+	unsigned long *flags;
+
+	raw_spin_lock(&its_lock);
+	list_for_each_entry(its, &its_nodes, entry) {
+		num_nodes++;
+	}
+
+	flags = kzalloc(num_nodes * sizeof(unsigned long), GFP_KERNEL_ACCOUNT);
+	if (!flags) {
+		raw_spin_unlock(&its_lock);
+		return NULL;
+	}
+
+	list_for_each_entry(its, &its_nodes, entry) {
+		raw_spin_lock_irqsave(&its->lock, flags[i++]);
+	}
+
+	return flags;
+}
+EXPORT_SYMBOL_GPL(its_start_depriviledge);
+
+static int its_switch_to_shadow_locked(struct its_node *its, its_init_emulate init_emulate_cb)
+{
+	struct its_shadow_tables *hyp_shadow, shadow;
+	int i, ret;
+	u64 baser, baser_phys;
+
+	hyp_shadow = its_get_shadow_tables(its);
+	if (!hyp_shadow)
+		return -ENOMEM;
+
+	memcpy(&shadow, hyp_shadow, sizeof(shadow));
+	ret = init_emulate_cb(its->phys_base, hyp_shadow);
+	if (ret) {
+		its_free_shadow_tables(hyp_shadow);
+		return ret;
+	}
+
+	/* Switch the driver command queue to use the shadow and save the original */
+	its->cmd_write = (its->cmd_write - its->cmd_base) +
+		(struct its_cmd_block *)shadow.cmd_shadow;
+	its->cmd_base = shadow.cmd_shadow;
+
+	/* Shadow the first level of the indirect tables */
+	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+		baser = shadow.tables[i].val;
+
+		if (!shadow.tables[i].shadow)
+			continue;
+
+		baser_phys = virt_to_phys(shadow.tables[i].shadow);
+		if (IS_ENABLED(CONFIG_ARM64_64K_PAGES) && (baser_phys >> 48))
+			baser_phys = GITS_BASER_PHYS_52_to_48(baser_phys);
+
+		its->tables[i].val &= ~GENMASK(47, 12);
+		its->tables[i].val |= baser_phys;
+		its->tables[i].base = shadow.tables[i].shadow;
+	}
+
+	return 0;
+}
+
+int its_end_depriviledge(int ret_pkvm_finalize, unsigned long *flags, its_init_emulate cb)
+{
+	struct its_node *its;
+	int i = 0, ret = 0;
+
+	if (!flags || !cb)
+		return -EINVAL;
+
+	list_for_each_entry(its, &its_nodes, entry) {
+		if (!ret_pkvm_finalize && !ret)
+			ret = its_switch_to_shadow_locked(its, cb);
+
+		raw_spin_unlock_irqrestore(&its->lock, flags[i++]);
+	}
+
+	kfree(flags);
+	raw_spin_unlock(&its_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(its_end_depriviledge);
+
 static int __init its_probe_one(struct its_node *its)
 {
 	u64 baser, tmp;
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 0225121f3013..40457a4375d4 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -657,6 +657,30 @@ static inline bool gic_enable_sre(void)
 	return !!(val & ICC_SRE_EL1_SRE);
 }
 
+/*
+ * The ITS_BASER structure - contains memory information, cached
+ * value of BASER register configuration and ITS page size.
+ */
+struct its_baser {
+	void		*base;
+	void		*shadow;
+	u64		val;
+	u32		order;
+	u32		psz;
+};
+
+struct its_shadow_tables {
+	struct its_baser	tables[GITS_BASER_NR_REGS];
+	void			*cmd_shadow;
+	void			*cmd_original;
+	size_t			cmdq_len;
+};
+
+typedef int (*its_init_emulate)(phys_addr_t its_phys_base, struct its_shadow_tables *shadow);
+
+void *its_start_depriviledge(void);
+int its_end_depriviledge(int ret, unsigned long *flags, its_init_emulate cb);
+
 #endif
 
 #endif
-- 
2.53.0.473.g4a7958ca14-goog


