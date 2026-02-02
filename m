Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921A7E73146
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoMXA35bVdlKlGkNfp2fyYW/VHkakTsU1N9xkHjNqUY=; b=Hf7S6N/REA8VkobGcEphAaa2Ni
	OkqzB9NQ0r4BtjNRKkHBt0IxsLpr0x/6kNktamKfBNrop/XO1g8mj5a+F5R4ryvj4S64ARVetIgj4
	fsh4RPfXSZjrvQg0IdpA3Ol3IcL1sJTWhTlmnw1mg/U1lHzFIquUZ16FGkXFH0HpeRarsyfpClL08
	Qm/p4wQWC6vpB52hNXu0a4GFHre/FARsBaMCxa1nq2K2f3AZMFwNxYiPsSOS274zQsqb56TkTZ9ad
	rtD7g8RdIzR+pr5HjWYK5OFEgmNRInfqZcl3ItrdUyMdYHWaKFsOeON+9Jg/gW9Ne9IjtTmSeWwKC
	YDOJuhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpkO-00000004fj3-0ARY;
	Mon, 02 Feb 2026 08:57:28 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpkL-00000004fhb-2fQL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:57:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48025e12b5bso60845065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 00:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770022643; x=1770627443; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OoMXA35bVdlKlGkNfp2fyYW/VHkakTsU1N9xkHjNqUY=;
        b=TyMg/7eqI45g+tdjStaegcIplI7/8PAh6JSKA4fI8oBhSSV9DQCbsD8B8YUXNRm9UY
         Gr7Ij2I+oSPfrBlYSBUQu2iTdqqz0mTMuKNe9ncv6M4NRpP/WXJZGPBIEs+vioQQrv27
         /L/j6tqfMkudFovBPDlBKZof8Rr0fB34x/9ped/V1ECM/6mVDyIdSMXngTyS8GyferBf
         LkuTPfy7bFiC96FF/3rwk3binU/+UDghcqPXfvkcxT9Yz6ZNamWmMME2QYGztr4XL9oz
         J8whjUpm5sV0lczCtoZHUYcnrRmBCw86kBBdIgM3GfDnoKUMgzYh5C+K//dqiISG4+u9
         nrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770022643; x=1770627443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoMXA35bVdlKlGkNfp2fyYW/VHkakTsU1N9xkHjNqUY=;
        b=vf05UYd3+NO5DQb9cR7zQrsMB6gsX1kit+LfEkIzCwGgVHNC2vcRyRGsDSZJJjh0qL
         iZ/iUI33i2LFkLV4v//3CpnYlnbe5JYugj4rOO5zyjiPdRlPmUOrrxlFMl486wXsWbbG
         whLc7h7kexdnmF9j3Y1BwxnUr6HvY+8ovWaGcsuHSrNUDTswBzihGmVl/jpI7f2iPu58
         xGiVwgeaDEkPsTMFbpP0IxlrenbgkBCe9PE+rx0hxvITDXTirfbrGNqsR3GP0+wn2A5+
         a2KC3kk7iZiVg64Wy0MnXu8G5H8uBNPXBfmxlB871JjzeLCP2d53saWMF2NDAN8gxU/z
         11yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZQHsoaE8dCAX9MhY6UIGZP1G+wEJAAmcEbjytrNpiv5NRNI/Yha/8LH4trCyotZVGcBXYkO8QpRuERMILDMkW@lists.infradead.org
X-Gm-Message-State: AOJu0YzsqPEfknmOfqzsB4/vgvFR1JljY0/U45X+7D1qkGEkU/TLUzCv
	ryzocVGHEjE19R3284i0Z0TtUxk44vJWiJSDjyEKixUbgXyvdCSBdqrZHEmngYyegymDqw8Pdxf
	DZw==
X-Received: from wmpd26.prod.google.com ([2002:a05:600c:4c1a:b0:480:4a03:7b7d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6214:b0:480:1c53:208b
 with SMTP id 5b1f17b1804b1-482db49da0bmr129922045e9.36.1770022643392; Mon, 02
 Feb 2026 00:57:23 -0800 (PST)
Date: Mon,  2 Feb 2026 08:57:19 +0000
In-Reply-To: <20260202085721.3954942-1-tabba@google.com>
Mime-Version: 1.0
References: <20260202085721.3954942-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260202085721.3954942-2-tabba@google.com>
Subject: [PATCH v1 1/3] KVM: arm64: Use standard seq_file iterator for idregs debugfs
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_005725_734936_1331D98C 
X-CRM114-Status: GOOD (  18.18  )
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

The current implementation uses `idreg_debugfs_iter` in `struct
kvm_arch` to track the sequence position. This effectively makes the
iterator shared across all open file descriptors for the VM.

This approach has significant drawbacks:
- It enforces mutual exclusion, preventing concurrent reads of the
  debugfs file (returning -EBUSY).
- It relies on storing transient iterator state in the long-lived VM
  structure (`kvm_arch`).
- The use of `u8` for the iterator index imposes an implicit limit of
  255 registers. While not currently exceeded, this is fragile against
  future architectural growth. Switching to `loff_t` eliminates this
  overflow risk.

Refactor the implementation to use the standard `seq_file` iterator.
Instead of storing state in `kvm_arch`, rely on the `pos` argument
passed to the `start` and `next` callbacks, which tracks the logical
index specific to the file descriptor.

This change enables concurrent access and eliminates the
`idreg_debugfs_iter` field from `struct kvm_arch`.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 --
 arch/arm64/kvm/sys_regs.c         | 50 +++++--------------------------
 2 files changed, 8 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ac7f970c7883..643a199f6e9e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -373,9 +373,6 @@ struct kvm_arch {
 	/* Maximum number of counters for the guest */
 	u8 nr_pmu_counters;
 
-	/* Iterator for idreg debugfs */
-	u8	idreg_debugfs_iter;
-
 	/* Hypercall features firmware registers' descriptor */
 	struct kvm_smccc_features smccc_feat;
 	struct maple_tree smccc_filter;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 88a57ca36d96..035bf049e2e4 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4995,7 +4995,7 @@ static bool emulate_sys_reg(struct kvm_vcpu *vcpu,
 	return false;
 }
 
-static const struct sys_reg_desc *idregs_debug_find(struct kvm *kvm, u8 pos)
+static const struct sys_reg_desc *idregs_debug_find(struct kvm *kvm, loff_t pos)
 {
 	unsigned long i, idreg_idx = 0;
 
@@ -5005,10 +5005,8 @@ static const struct sys_reg_desc *idregs_debug_find(struct kvm *kvm, u8 pos)
 		if (!is_vm_ftr_id_reg(reg_to_encoding(r)))
 			continue;
 
-		if (idreg_idx == pos)
+		if (idreg_idx++ == pos)
 			return r;
-
-		idreg_idx++;
 	}
 
 	return NULL;
@@ -5017,23 +5015,11 @@ static const struct sys_reg_desc *idregs_debug_find(struct kvm *kvm, u8 pos)
 static void *idregs_debug_start(struct seq_file *s, loff_t *pos)
 {
 	struct kvm *kvm = s->private;
-	u8 *iter;
 
-	mutex_lock(&kvm->arch.config_lock);
+	if (!test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
+		return NULL;
 
-	iter = &kvm->arch.idreg_debugfs_iter;
-	if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags) &&
-	    *iter == (u8)~0) {
-		*iter = *pos;
-		if (!idregs_debug_find(kvm, *iter))
-			iter = NULL;
-	} else {
-		iter = ERR_PTR(-EBUSY);
-	}
-
-	mutex_unlock(&kvm->arch.config_lock);
-
-	return iter;
+	return (void *)idregs_debug_find(kvm, *pos);
 }
 
 static void *idregs_debug_next(struct seq_file *s, void *v, loff_t *pos)
@@ -5042,37 +5028,19 @@ static void *idregs_debug_next(struct seq_file *s, void *v, loff_t *pos)
 
 	(*pos)++;
 
-	if (idregs_debug_find(kvm, kvm->arch.idreg_debugfs_iter + 1)) {
-		kvm->arch.idreg_debugfs_iter++;
-
-		return &kvm->arch.idreg_debugfs_iter;
-	}
-
-	return NULL;
+	return (void *)idregs_debug_find(kvm, *pos);
 }
 
 static void idregs_debug_stop(struct seq_file *s, void *v)
 {
-	struct kvm *kvm = s->private;
-
-	if (IS_ERR(v))
-		return;
-
-	mutex_lock(&kvm->arch.config_lock);
-
-	kvm->arch.idreg_debugfs_iter = ~0;
-
-	mutex_unlock(&kvm->arch.config_lock);
 }
 
 static int idregs_debug_show(struct seq_file *s, void *v)
 {
-	const struct sys_reg_desc *desc;
+	const struct sys_reg_desc *desc = v;
 	struct kvm *kvm = s->private;
 
-	desc = idregs_debug_find(kvm, kvm->arch.idreg_debugfs_iter);
-
-	if (!desc->name)
+	if (!desc)
 		return 0;
 
 	seq_printf(s, "%20s:\t%016llx\n",
@@ -5092,8 +5060,6 @@ DEFINE_SEQ_ATTRIBUTE(idregs_debug);
 
 void kvm_sys_regs_create_debugfs(struct kvm *kvm)
 {
-	kvm->arch.idreg_debugfs_iter = ~0;
-
 	debugfs_create_file("idregs", 0444, kvm->debugfs_dentry, kvm,
 			    &idregs_debug_fops);
 }
-- 
2.53.0.rc1.225.gd81095ad13-goog


