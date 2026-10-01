Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6D7CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4T99T3TB8dvRshTDEDVSJZNJ9yGL6DvbnmzYOdgUiRk=; b=FD5bBC1y/ZaBWiJIEPcp0bST2h
	l5DFEv0sT0yXRGGHSpUoz4FNVT05EbbUdrfBhyHpIOggovuwF1jv4Se81UAxGdhp7rjX3br2AWELQ
	FV7QEnGm7xPA+3SBT2XoDH69iVlWU3fJANri0IPRISmWIHqbcNmhOycxiBkEd5EqZ/mHZjtXnuWqY
	dtCS1FOwVFJzpWYmqqZqmDph39fCNqRPQ+nhSyP6JPc1E9Njk4BqIP7Im66MPZnZja8tM+vkcBD7G
	j+k3lGk60E9ZT6tI9pgheCoOXRg75ZQn1MYmy/UkB4EROu2p7xYZRkz4AaYGjAolhLVg5D6cm7n4+
	XQUl8H9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmd-00000009NLy-1DZR;
	Thu, 01 Oct 2026 14:29:15 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmX-00000009NCV-2LrF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:11 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a01eb045feso10659375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864947; x=1791469747; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4T99T3TB8dvRshTDEDVSJZNJ9yGL6DvbnmzYOdgUiRk=;
        b=dRafnRq7cY3pKiJ3AQ8Q2rawL1Hhz3DU3253QWLSnUnx/Sw38Iwvc/M4nAY+x0pUZL
         2c/g8pcQ/tIhP+pw+kJ9lXxA0kZPZ5sWr7SccYkaFvNW8q+wFjsoiXOeT5w7atUFFbdt
         Jf3dhEmy+4A5LAdfKabmQqqKZcCD2y4dJHI83a3J0tut+6pKt1VKyB1V3pOaKZA7KT8k
         4UOrzzDgwPsz4pPCAv3NsFZFzbuTeBQf0h3C9ubH/Tk8aJZNaCS/2QBKKVl8P4DT4a+F
         TGzm3/zOVUXGykryRB3R3an5NH25PPYcLD7qJij5k3eK51Mtcu8B3+aECyE2FNs0GiEp
         C60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864947; x=1791469747;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4T99T3TB8dvRshTDEDVSJZNJ9yGL6DvbnmzYOdgUiRk=;
        b=r1/Y8NzqkPYKH24KQbi9Dn7Hmt47oUG2K9+eaeDj82g60wh4xUhK8wo0Ojq5qY/iUH
         wX89VtEZxg1Fr2hkvNhDXIvGE9VkfjZxd7ePkWkqG0qG4qJLxCupc5nKvZqpdKj6quik
         +Eo9j7NGW8ErqepL6fRSM926wqLtOOswCWieO2QW9pUygC6953XzAXJXwbTjQ+MkK5vK
         l3M8az7oczm1YPSLgxhxrjElUvqLMy0Hod+oEqIaQzo8iwXKl/W42rQZ/4gi6rHjtyj4
         N8yxk+qlUElrNcyzsvmLkt8/vMcp97g7rrnZYx3+VHCZQ4CXqir0ENtwxUMbIHjkBQVw
         cIjA==
X-Forwarded-Encrypted: i=1; AKwUvBzYXLicEEPToddN38lW9LnU6W4kAEh9t8BANDgevl78W71bn3zjV3YuH9pNrahuXZGUSc/v5Vrb40Z7gUYmVKTW@lists.infradead.org
X-Gm-Message-State: AFuF++mTgBymczU2o+pro+4xT8jhYjbK9AfVp1NiK7WF7CSEf31h/hdR
	xe0bRs4xgny9vFWuCsfMOetGcrXcv84BdZwaZoD5dEvLEcNgPV9kT3MM+vPKiR4KfBFuxwJsfFA
	OgQ0SzZGDOxGUAUg1xhZquQ==
X-Received: from wmer17.prod.google.com ([2002:a05:600c:4351:b0:4a0:1efb:4825])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6405:20b0:4a0:1b14:d00c with SMTP id 5b1f17b1804b1-4a01b14d05dmr62965735e9.3.1790864946825;
 Thu, 01 Oct 2026 07:29:06 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:39 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-9-vdonnefort@google.com>
Subject: [PATCH v6 08/18] KVM: arm64: Add reclaim interface for the pKVM heap alloc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072909_628795_AB6E712F 
X-CRM114-Status: GOOD (  16.08  )
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

Introduce a host interface to reclaim donated memory from the pKVM heap
allocator back to the host.

It specifically provides two helpers that will make it easier to
create a shrinker for pKVM:

  pkvm_hyp_reclaimable()
  pkvm_hyp_relaim()

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_asm.h   |  2 ++
 arch/arm64/include/asm/kvm_hcall.h |  4 +++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 34 +++++++++++++++++++++++
 arch/arm64/kvm/pkvm.c              | 44 ++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index de59e89318fa..fc3c52b03154 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -90,6 +90,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index 6d6f12400e94..bce6eb8b20e0 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -199,6 +199,10 @@ DECLARE_KVM_HOST_HCALL(void, __vgic_v5_restore_vmcr_apr,
 	struct vgic_v5_cpu_if __kern *, cpu_if)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_hyp_topup,
 	enum pkvm_topup_id, id, phys_addr_t, head, unsigned long, nr_pages)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_hyp_reclaim,
+	enum pkvm_topup_id, id, unsigned long, target)
+DECLARE_KVM_HOST_HCALL(ulong, __pkvm_hyp_reclaimable,
+	enum pkvm_topup_id, id)
 
 /* Hypercalls that are available only when pKVM has finalised. */
 DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_hyp,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 2b89eb274482..fdc39f064718 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -824,6 +824,38 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_hyp_topup,
 	return ret;
 }
 
+DEFINE_KVM_HOST_HCALL(int, __pkvm_hyp_reclaim,
+	enum pkvm_topup_id, id, unsigned long, target)
+{
+	struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
+	struct kvm_hyp_memcache host_mc = {};
+	int ret = 0;
+
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		hyp_alloc_reclaim(&host_mc, target);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	cpu_reg(host_ctxt, 2) = host_mc.head;
+	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
+
+	return ret;
+}
+
+DEFINE_KVM_HOST_HCALL(ulong, __pkvm_hyp_reclaimable,
+	enum pkvm_topup_id, id)
+{
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		return hyp_alloc_reclaimable();
+	default:
+		return 0;
+	}
+}
+
 DEFINE_KVM_HOST_HCALL(int, __tracing_load,
 	void __kern *, desc_hva, size_t, desc_size)
 {
@@ -919,6 +951,8 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__vgic_v5_save_apr),
 	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
 	HANDLE_FUNC(__pkvm_hyp_topup),
+	HANDLE_FUNC(__pkvm_hyp_reclaim),
+	HANDLE_FUNC(__pkvm_hyp_reclaimable),
 
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 9cd23978481c..fec819a9dc78 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -115,6 +115,50 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
 	return ret;
 }
 
+static unsigned long __pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
+{
+	struct kvm_hyp_memcache mc;
+	struct arm_smccc_res res;
+	unsigned long reclaimed;
+
+	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__pkvm_hyp_reclaim), id, target, &res);
+	if (WARN_ON_ONCE(res.a0 != SMCCC_RET_SUCCESS) || WARN_ON_ONCE(res.a1))
+		return 0;
+
+	init_hyp_memcache(&mc);
+	mc.head = res.a2;
+	mc.nr_pages = reclaimed = res.a3;
+	free_hyp_memcache(&mc);
+
+	return reclaimed;
+}
+
+static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
+{
+	unsigned long reclaimed = 0;
+
+	while (reclaimed < target) {
+		/* Arbitrary limit to avoid blocking in EL2 for too long */
+		unsigned long r = __pkvm_hyp_reclaim(id, min(target - reclaimed, 16));
+
+		if (!r)
+			break;
+
+		reclaimed += r;
+		if (reclaimed >= target)
+			break;
+
+		cond_resched();
+	}
+
+	return reclaimed;
+}
+
+static __maybe_unused unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
+{
+	return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
+}
+
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
 	if (pkvm_hyp_vm_is_created(kvm)) {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


