Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277C5CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9YtP4kly16nC//zfpWqwF2dbg0H1K+4KeRXQuDtzJU=; b=JRiADVaOey3p+cJiE6QudKqsnV
	AZF3qcISh0F1uRz+xPNC4fxdpJTftrLg+tln2k3L82XjKzjuCtRRGt871KPjYgMqUDgrxuUjhFOjZ
	go6KRaARQGp3Q2d10TVjzHDRT5zDX5T/hycNdvi1ZZTVak0ZkrmC9H9KH8tSWIXgbQKs1TP++YmVV
	L1RHgXxCBNWMTouGWBh4QV1AOrswY4AzXLFujuydEq/e3O6wI8G469C4E6ErLNnB7C9XOA9qoMyiu
	Hmg7wWYUlqY0IVcADaYalI4cHsme9nj9hBu971Czvsyz/DPfXyaiBOy4UwL91sfZxHEJPwCle5toM
	OUxPBv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRB-0000000FdI0-0AHH;
	Tue, 16 Jun 2026 10:54:33 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRR5-0000000FdEh-1ADB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:28 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b4d3d3e6so29662295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607264; x=1782212064; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9YtP4kly16nC//zfpWqwF2dbg0H1K+4KeRXQuDtzJU=;
        b=jDlEuwzW2ebdac8q8o/jqGXDWUxJ6DglMqgzVk+yTH5sRskJ4zgQEd1Mqn0jGg6Nrk
         B2CSw02YOl/AZZzfa1vqrOIT+gZDZzSCo2TS70cgGPdO52+r+U6z996xR24tas1yBXyv
         hk2Ufm9oxr7Fy9pp7Q/7rOWdiYYEqQCSU2VpsfseFWB5M5KhC8/bGJg/pTcgAO/ZdJ/D
         g0EmYvLuxWlfZdHAFElNL3bkBK++5py/GruF51CBXsWdGQLfs15fUhqnsP5wDikuL3F5
         yQOrT+Qj7CI1YUr3XlZSoIPpCPfWp/L3dNnvm/h8uwho1vYIhuL2UUbh0lPTZvEYDWk0
         QF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607264; x=1782212064;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9YtP4kly16nC//zfpWqwF2dbg0H1K+4KeRXQuDtzJU=;
        b=WGd5G5n2i6pImF+jV3pkMPz7lJozs/O4Ih5mBW3FzugyCKXSxmS4EUR88ECj1tiNYA
         LSY99STFlF2qprf7j1/PXoPsEDWXTWvKHn2nYMp9UuwsacSaJ6T+nYI2jJR8TbmKwARJ
         O39BISQULbHQZqc5Z54OA+qMmESN1Rdm5RhY2ojcj6glCMwNFowKMik0rTXhWsjZS/N6
         gprzpJf9Y+KhTTpl2Yb3C4Y6zrN4IXsQURSvd1YR2q98phR/uLYt9jaAAVZSYYYhabxd
         0fWTL88wtxGuwQi3Q//FVtI/jSNfsNJ/Q51xSY5DRsxEitEx2meyEBUtuD8u0bYlEi/t
         ZLKg==
X-Forwarded-Encrypted: i=1; AFNElJ/uAhoQojtm6KPXJBbDww1T2OZMAHFw5XYkEv2HMO9a+gzyT63mcFP0z1O+DVj15SSnoLhbRaDd1CekeczPVz4e@lists.infradead.org
X-Gm-Message-State: AOJu0YwT7YZcTDnaEexlP6cV3hj788xkp2n7d27YRcSnS5beV0ivyA1n
	r5OjmKZF1mVpWKWsxOo2sWW26uXKkQg4GZ4yOqvPNWoplpEUKUzC/YhfP6gEs7ui1fZixI0W6VS
	Z2fIYUfMDVxigxgC0KnMTmzhO8K+e5g==
X-Received: from wmaw25.prod.google.com ([2002:a05:600c:6d59:b0:48a:5334:11e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f18:b0:490:c2a2:e91f with SMTP id 5b1f17b1804b1-4922ffc05f0mr43580905e9.35.1781607264086;
 Tue, 16 Jun 2026 03:54:24 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:08 +0000
In-Reply-To: <20260616105417.2578670-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616105417.2578670-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-2-sebastianene@google.com>
Subject: [PATCH v3 1/7] KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_035427_334841_09A6569A 
X-CRM114-Status: GOOD (  12.57  )
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

Introduce a helper method ffa_check_unused_args_sbz to enforce strict
arguments checking when the hypervisor acts as a relayer between the
host and Trustzone.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..c723a21006aa 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
 static bool has_version_negotiated;
 static hyp_spinlock_t version_lock;
 
+static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
+{
+	int reg;
+
+	for (reg = first_reg; reg < 17; reg++) {
+		if (cpu_reg(ctxt, reg))
+			return true;
+	}
+
+	return false;
+}
+
 static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
 {
 	*res = (struct arm_smccc_1_2_regs) {
@@ -239,6 +251,11 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
 	int ret = 0;
 	void *rx_virt, *tx_virt;
 
+	if (ffa_check_unused_args_sbz(ctxt, 4)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out;
+	}
+
 	if (npages != (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
@@ -315,6 +332,11 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, id, ctxt, 1);
 	int ret = 0;
 
+	if (ffa_check_unused_args_sbz(ctxt, 2)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out;
+	}
+
 	if (id != HOST_FFA_ID) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out;
@@ -421,6 +443,11 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 	int ret = FFA_RET_INVALID_PARAMETERS;
 	u32 nr_ranges;
 
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
 		goto out;
 
@@ -482,6 +509,11 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	u32 offset, nr_ranges, checked_offset;
 	int ret = 0;
 
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out;
+	}
+
 	if (addr_mbz || npages_mbz || fraglen > len ||
 	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ret = FFA_RET_INVALID_PARAMETERS;
@@ -581,6 +613,11 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	int ret = 0;
 	u64 handle;
 
+	if (ffa_check_unused_args_sbz(ctxt, 4)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	handle = PACK_HANDLE(handle_lo, handle_hi);
 
 	hyp_spin_lock(&host_buffers.lock);
@@ -769,6 +806,11 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
 {
 	DECLARE_REG(u32, ffa_req_version, ctxt, 1);
 
+	if (ffa_check_unused_args_sbz(ctxt, 2)) {
+		res->a0 = FFA_RET_NOT_SUPPORTED;
+		return;
+	}
+
 	if (FFA_MAJOR_VERSION(ffa_req_version) != 1) {
 		res->a0 = FFA_RET_NOT_SUPPORTED;
 		return;
@@ -818,6 +860,11 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, flags, ctxt, 5);
 	u32 count, partition_sz, copy_sz;
 
+	if (ffa_check_unused_args_sbz(ctxt, 6)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	hyp_spin_lock(&host_buffers.lock);
 	if (!host_buffers.rx) {
 		ffa_to_smccc_res(res, FFA_RET_BUSY);
-- 
2.54.0.1136.gdb2ca164c4-goog


