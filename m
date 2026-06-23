Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09B3CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09b+kI/zkikg9+QKQPwRY6ZbJWum8PvSur8NwEqIQDI=; b=GZGl3nE3gcgHB6ExtMECQsB3yv
	8K9LuraBYX4AvnrhrkNuN7iYqV00nrVLSjixm0slEK7ZKbCWzxQsGlQmdaCEVeRdT7iPCPQY6iOPg
	07pHCuFV8n0FsjStAMrKW22eqIXkQhWRs26vuLR9Om2rz/z7/3mbpQK/h2RAeVKlOI2UCMd3qtk/V
	9Lx3090jmfIsiSpo1LFo/dwcxgDZAJOffO0BA8z+3P5MH/VV8yKZy9qcdcFM9xF7eaanWPWRLDyfE
	YcWGnoQyaKGphvKg+id7cPEHdYqzE1Ytav1gq794464mlCdlY/SMmwH165j7JbCHWUzBYHvPkgnCx
	61PkvOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhn-00000006D30-2OpV;
	Tue, 23 Jun 2026 11:54:15 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzhi-00000006D1K-2KqB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:54:11 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-c0bd2bf3ecfso345622266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782215648; x=1782820448; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=09b+kI/zkikg9+QKQPwRY6ZbJWum8PvSur8NwEqIQDI=;
        b=RVmr80xW9AJe6xZ496aFQuAufE9Va+UA2pfsh5za79B4C67B+1TC/KzAvX4Mjw0QvX
         f2FLLtsdW2OH3r2rHrjgH6CxqK71srHs4IUlAMOmNYcxb7Gj+Dqx8EkaxoJB258pJyGc
         T0VDovJ50dbP/rwFjU7k58y9ktBHiL1ecGhX5x4UNk78QlTTiOia/DG2/ti3USYmsk1r
         g04kaeD5jq6Cynr6RLJ2tq/WsU9l6mbFUXruj5nVzTjNY4RM1dql4Hi2+xVF1TrnKU4/
         EfmlbAFQ3uzBEe+kPKWEtqeenN11BZEJxNbt40pClNJuXwV0iOUya9G8pyt32goML5bf
         JYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215648; x=1782820448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09b+kI/zkikg9+QKQPwRY6ZbJWum8PvSur8NwEqIQDI=;
        b=WYvQMrXY9PUYejqjIqeEjZSuqMaGXpM6Q7n1tH4JE87QL0hxKVX0dY+Te9RqovSl0s
         YD3YXcEDbSjnoKcFqpSNlVkGrldgZRlyCZmASU8MU/it2CtQMATJGqiExi3KLX+B6phc
         wnIQN3J4e5bWS7djDOrHB3WvUa3DcPDtkpjnIgTA3yifcoKWf7sKDaNbGG3EgoEiW2BD
         RZ9iBpe2rxKMTtCPHTWJBnjmdlQATLvBOZb692ZFGgqZJy7Ysorhxvc0ehzp2kN6MZaz
         MmQq31bwXd9erDQ3T8TFc/Vh8L0hRift860gRH+l+m6iYWD9Ln3zNmto04+Ln0xST1ah
         QGUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yHtvuAv2hN4ubuBshhlmbQWM0XlBIPBHHdebI35PmU6YwsNCOyjJtD84fJH+ww0Pla50kCKnx6Eb7dKy2ze/h@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwtb5z3RlR5tohulVqEL64LFHKKzh1fV4F/dkb3MymadBEmylm
	mDqr52rWHqHSd504QZiVoy7n+6EQAeYZflw3tC9TwB3Upd8rlbhD+ltxUWa+bz5jlqr/WlbJTKp
	bQpKvt1P4Q5RI/0/oVoFAT9q/ucLGQQ==
X-Received: from ejcse22.prod.google.com ([2002:a17:907:a396:b0:beb:297f:8f09])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a02:b0:c10:256:3d6a with SMTP id a640c23a62f3a-c107f9a5639mr127032566b.31.1782215647857;
 Tue, 23 Jun 2026 04:54:07 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:53:48 +0000
In-Reply-To: <20260623115354.632361-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260623115354.632361-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623115354.632361-2-sebastianene@google.com>
Subject: [PATCH v5 1/7] KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
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
X-CRM114-CacheID: sfid-20260623_045410_611882_B15FBB55 
X-CRM114-Status: GOOD (  12.74  )
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
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 54 +++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..78bb043b33ee 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -71,6 +71,20 @@ static u32 hyp_ffa_version;
 static bool has_version_negotiated;
 static hyp_spinlock_t version_lock;
 
+static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
+{
+	DECLARE_REG(u32, func_id, ctxt, 0);
+	int reg, end_reg;
+
+	end_reg = ARM_SMCCC_IS_64(func_id) ? 17 : 7;
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
@@ -239,6 +253,11 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
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
@@ -315,6 +334,11 @@ static void do_ffa_rxtx_unmap(struct arm_smccc_1_2_regs *res,
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
@@ -421,6 +445,11 @@ static void do_ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res,
 	int ret = FFA_RET_INVALID_PARAMETERS;
 	u32 nr_ranges;
 
+	if (ffa_check_unused_args_sbz(ctxt, 5)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	if (fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)
 		goto out;
 
@@ -482,6 +511,11 @@ static void __do_ffa_mem_xfer(const u64 func_id,
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
@@ -581,6 +615,11 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	int ret = 0;
 	u64 handle;
 
+	if (ffa_check_unused_args_sbz(ctxt, 4)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
 	handle = PACK_HANDLE(handle_lo, handle_hi);
 
 	hyp_spin_lock(&host_buffers.lock);
@@ -769,6 +808,11 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
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
@@ -818,6 +862,11 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
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
@@ -890,6 +939,11 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 
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
-- 
2.55.0.rc0.786.g65d90a0328-goog


