Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9FCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whfBl3Oi2rCM9H5B9AuU1XbX6JklFkv0AY/WgaO+6/Y=; b=HPmturv1dWI9pJglQwC5qTPeiy
	gM+E1c4gtT4f0qOXTzhVT5iYSayWNi+PHBTgPxM5FpslMST1ty/FTTCRFI0jLqRQqxwxdkP+KeytI
	goJLLpacv9ovVWm0jTnTnVqUpUjnTs/gIuMuO9Bnky1MoON7OBsM8D3etQ98S7zAIKBF14xKrfzWB
	faBqK46R7RCGsz+v5iwVQN7gM0HSvK1G24jHc552FQZLuwRAYP0RcQbXxviqcK6DiWmxVpomAftLo
	12T4EGuxXeMHA65kyYarC+xKd+yT9qA1t1q091zC/ERyc7D0+H1QxejcaaGR/yXRjH9AqQRi+4ZVP
	6RjBEPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pq-0000000EBak-2T14;
	Mon, 29 Jun 2026 09:36:34 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pg-0000000EBW7-441T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:36:27 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-472a798fc7cso616683f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782725783; x=1783330583; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=whfBl3Oi2rCM9H5B9AuU1XbX6JklFkv0AY/WgaO+6/Y=;
        b=pNE3Kh6VUtNMAIUaG3jjl/CO1zBJarv5IhNY4mit1NlR3N4MKoPY90HtpsSs/R1Ngv
         PJoFgaaYzFH1LEOvKdRBUPxHdjLPoRzYVby5lQPSQYWakUOgvvna8Vwx4kSvP4S7hEE/
         Itkc2qiAakseOAokzQL5OMr57uSY0saMc68WM1JUNdqLeqvE/W0jEfdfXPzJHb+V9ZMs
         sHt9f2iopcf2iButaDX8q3Wk/Q8Ag8OxX2thflljuO5WpMBZg86uAFxwcO0YkeJ9FoJR
         B6kk77kHCA9U8vqvC1dQ1Z9Yy3yBQztl4sNUE0lZCCoPFI0/roC9Yj6gVVgcv3GA20Rg
         O5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725783; x=1783330583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whfBl3Oi2rCM9H5B9AuU1XbX6JklFkv0AY/WgaO+6/Y=;
        b=WC1CLf4gCp343WlbnPTA9ZHCR+ck+dGzajfA2pIUCRHrQBz/DPMnKBeuTNGTuAzXzK
         sVUsqXM4YJ86FYsS/6gLKPT9RVZt/s4NjWD3GtVCb4DdgmnsWFsJH861J/4zU2fSdl42
         2q5sLDZR8y5fp24m9fqh0Xjj5We0PnqtR0fQAn9NITqg2A6xcQ6kaTX4c9JFnsdxFEG4
         3iDKQovHbH471sJOqBKoSzCMQoFEXv0c4he+q3HaQi7QoInF/cQGASyUDQy/4lQXbwXl
         ZnORUr10D3VXFj+7/1wX+b+vYhpmD2NFTo+OBbFjI9soz/SLjXF3vMZHgOVnOXs/53Kz
         wqZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Dq5GSSZvHasnYtH2M5ewenkgAaOkBXzk6ZxfT2yXD6kGzMTV9DZ9TdFpJAovrg1BJI1eyUzpkB5OgvbUUEi6o@lists.infradead.org
X-Gm-Message-State: AOJu0YxyU+Z2C+kf/zGAhAKGiLGFduPJGZbingKWDugyZ/VuNDMoVTCZ
	xmW8Gz30wDBs3rMGJaH6Yhv+EIuhcycH7QPnMP2j7e3uEu10qHsNn8z1tLUUvtTZm3+KTNr8cE9
	HbsmwIXgsXwZCDZop4wfw/k4Lkog3eQ==
X-Received: from wmlm15.prod.google.com ([2002:a7b:ca4f:0:b0:487:3739:c5c4])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c118:b0:492:6881:1114 with SMTP id 5b1f17b1804b1-49268811131mr188559705e9.0.1782725782622;
 Mon, 29 Jun 2026 02:36:22 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:35:58 +0000
In-Reply-To: <20260629093558.2425257-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260629093558.2425257-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629093558.2425257-8-sebastianene@google.com>
Subject: [PATCH v7 7/7] KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
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
X-CRM114-CacheID: sfid-20260629_023625_068920_BD1CF180 
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

Introduce a helper method ffa_check_unused_args_sbz to enforce strict
arguments checking when the hypervisor acts as a relayer between the
host and Trustzone.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 96 ++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 712811e89435..334f8a28d942 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -74,6 +74,21 @@ static u32 hyp_ffa_version;
 static bool has_version_negotiated;
 static hyp_spinlock_t version_lock;
 
+static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
+{
+	DECLARE_REG(u32, func_id, ctxt, 0);
+	int reg, end_reg = 7;
+
+	if (hyp_ffa_version >= FFA_VERSION_1_2 && ARM_SMCCC_IS_64(func_id))
+		end_reg = 17;
+	for (reg = first_reg; reg <= end_reg; reg++) {
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
@@ -242,6 +257,11 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
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
@@ -318,6 +338,11 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
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
@@ -424,6 +449,11 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 	int ret = FFA_RET_INVALID_PARAMETERS;
 	u32 nr_ranges;
 
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
 		goto out;
 
@@ -485,6 +515,11 @@ static void __do_ffa_mem_xfer(const u64 func_id,
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
@@ -584,6 +619,11 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	int ret = 0;
 	u64 handle;
 
+	if (ffa_check_unused_args_sbz(ctxt, 4)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	handle = PACK_HANDLE(handle_lo, handle_hi);
 
 	hyp_spin_lock(&host_buffers.lock);
@@ -764,6 +804,11 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
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
@@ -813,6 +858,11 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
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
@@ -860,9 +910,15 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
 				struct kvm_cpu_context *ctxt)
 {
+	DECLARE_REG(u32, func_id, ctxt, 0);
 	DECLARE_REG(u32, vmid, ctxt, 1);
 	struct arm_smccc_1_2_regs *args;
 
+	if (ffa_check_unused_args_sbz(ctxt, func_id == FFA_NOTIFICATION_BITMAP_CREATE ? 3 : 2)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	if (vmid != HOST_FFA_ID) {
 		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
 		return;
@@ -879,6 +935,11 @@ static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, flags, ctxt, 2);
 	struct arm_smccc_1_2_regs *args;
 
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
 		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
 		return;
@@ -900,7 +961,7 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	DECLARE_REG(u32, reserved, ctxt, 2);
 	struct arm_smccc_1_2_regs *args;
 
-	if (reserved) {
+	if (ffa_check_unused_args_sbz(ctxt, 5) || reserved) {
 		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
 		return;
 	}
@@ -926,6 +987,11 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
 		return;
 	}
 
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	if (flags & GENMASK(15, 2)) {
 		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
 		return;
@@ -947,6 +1013,11 @@ static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
 		return;
 	}
 
+	if (ffa_check_unused_args_sbz(ctxt, 3)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	if (flags & GENMASK(31, 4)) {
 		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
 		return;
@@ -956,6 +1027,20 @@ static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_info_get(struct arm_smccc_1_2_regs *res,
+				  struct kvm_cpu_context *ctxt)
+{
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, 1)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -984,6 +1069,11 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 
 	switch (func_id) {
 	case FFA_FEATURES:
+		if (ffa_check_unused_args_sbz(host_ctxt, 3)) {
+			ffa_to_smccc_res(&res, FFA_RET_INVALID_PARAMETERS);
+			goto out_handled;
+		}
+
 		if (!do_ffa_features(&res, host_ctxt))
 			return false;
 		goto out_handled;
@@ -1030,6 +1120,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_GET:
 		do_ffa_notif_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_INFO_GET:
+	case FFA_FN64_NOTIFICATION_INFO_GET:
+		do_ffa_notif_info_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.799.gd6f94ed593-goog


