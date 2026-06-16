Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEE6CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5yEFgPXn8B9bdRFZCXWSa8UhuAuZNwO3v29Jko7dXc=; b=Da3VsbIHgHznEEvxW4WV5PmpnS
	iKssNS1AkGM8do/nzmc5sHUHtEUGFaBGfCgMPlODCqHN5Wn6YdJ+/Su+v1bAdd5IT5xUepwr/jmCF
	M5Xx6DNN1P2lU2U494+2mH5cHFDXRcwsxGxikQxMoh6QheBM65vkEla1K/v7osCiQEK7ClptLmVg5
	SgdQ6EM2Ks6V022aAqJtQbDPcnQJtJwKJS3HJ9aK64zyJc5lN85DYnU2iooSFnbkNxBWvuYnJMoMM
	oZTeRU2hIf+/cFTngGuDHIv+JiUjkdUG/dutlOvQGfqaU0fmcBjHghAkKUOAO/uXp9+WU0sw2CeGc
	1O7DOncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvW-0000000G26o-2Hsr;
	Tue, 16 Jun 2026 15:42:10 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVvT-0000000G24M-2dlL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:42:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b3ec3f7fso30475485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781624525; x=1782229325; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5yEFgPXn8B9bdRFZCXWSa8UhuAuZNwO3v29Jko7dXc=;
        b=iqwROHvgX+zNkP4yekbTufJhkJixLH69Xdw79PBNz3JU9/Ec6XOFjmmY8kR8UnAeD+
         6QpSQ3yETZVvb0ZX/z+36VdBqEeYK14YEuC2PUxVJKRh/AWWREoWUr53NyBayUUjzJk0
         gLUytBQDz0hduksfGEc2CX/sD9/hBaKMkZeG2F7NtLZFMuf6tAGNwDICPadNDL7oGNho
         h32Wxb7utsayWSZHDOu93BRgmj5vWEPZRN0yxwUSPlj/yg91ZcI984beoHl70XAkrmHd
         ExF6YPLqdtsjohhWxKR2bnaHba+QzdZLs7HZh2ZNIh3DsHJU4r0t7y+D2OcC4mdtNphi
         pVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624525; x=1782229325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5yEFgPXn8B9bdRFZCXWSa8UhuAuZNwO3v29Jko7dXc=;
        b=L8gAdCiaPdILRHP8Qx92pM58zFwZT/S0oo1NJQAo8SxaNJS0N2Ex8XGExrxmcdDpy2
         vXq07Vb0AGwGSV586drWdHVINmvHwhojDoV3S2x5EKtUkeO58xksJf6yLuPyZpYzenEv
         dtBYDXVK25l1+ZHsTjtJARoMl4qw1qGwJkDFvjCn5Y8TIL3sh3c61a/JKAfsOccjmaMS
         1NJoVxxfWpXd1QfizlTgFrtt3o1gdmykvCfz6hlI4OaiZz1DHNI5p/JNxRFF1UOUF1yB
         Q17q7vpdp+y0fsvEPHMs73GiiiKJQv+AqA8b7iyn9KB0D7FgFwETjIQP9UOet3V+F3UX
         RUxg==
X-Forwarded-Encrypted: i=1; AFNElJ92EWui7ncO9va99LID8t5iZ9ETPRaWvFWVKBHLDC/XjZqiyNWZ4DjRcpZtIrLizIQ4UHvsRUmH9S4u7G/KZWpR@lists.infradead.org
X-Gm-Message-State: AOJu0YzTBr9dOhfySSCJ8d1mtmfxsGPZd+2m0VOlSJx3t+63YhXv2Gvz
	ITEdAvO9EtJNcMKtSCn2WC8aQstcLUQKz6+ddxudcsJNEq31/AYcgLclQtE9k4SGR/EFw0VtDRL
	QoHac2a6eaF06B8VL3ThOr+k6MFuN3Q==
X-Received: from wmxa14-n1.prod.google.com ([2002:a05:600d:644e:10b0:490:b555:8215])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:33a9:b0:492:2f59:4969 with SMTP id 5b1f17b1804b1-492333ca3c3mr224855e9.22.1781624524184;
 Tue, 16 Jun 2026 08:42:04 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:41:43 +0000
In-Reply-To: <20260616154149.2763214-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260616154149.2763214-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616154149.2763214-2-sebastianene@google.com>
Subject: [PATCH v4 1/7] KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
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
X-CRM114-CacheID: sfid-20260616_084208_140691_BCD95E73 
X-CRM114-Status: GOOD (  12.34  )
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
index 1af722771178..c64c704f22f8 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
 static bool has_version_negotiated;
 static hyp_spinlock_t version_lock;
 
+static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
+{
+	int reg;
+
+	for (reg = first_reg; reg <= 17; reg++) {
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


