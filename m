Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D15C624D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY/D94kuwUw3EuPTsso237XfSk0Z/pXvWdO7f/q58aY=; b=NtZW/fhgLLyDjleQR7taqzdbpL
	rsD0jDH5juo+yruVQANdcs11udg2jBgs1Msc4E5BHpu5f3jd03jabyo23pYLa/Wi5C+Sz7WjEYlxC
	LvdD+I6TbC919LtrLC3+LGe7VffYz6R4nIxMIUHOKcP6PTWIVoyoANTTPLIvEysbZqgV6TuXhaANn
	9m4Q7LnOHNXg4NkO+v340L81mfGSYlGFn0sHe2TfUFkoX+Pk0TnIsqslCnxrq9d1EwB0nFnUTTpny
	VkxwzebaWgcdhe6fWWcXOHaj1mytT/LrP5ij5FEeHEe/M4PZHkRWgWvhzTmL9QwwQ22AfJ+gPmNrO
	XBTbKF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZD-0000000BCt5-3mDL;
	Tue, 01 Sep 2026 08:10:03 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZB-0000000BCmP-0qrQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:02 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c213d5fb55aso449131566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250198; x=1788854998; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EY/D94kuwUw3EuPTsso237XfSk0Z/pXvWdO7f/q58aY=;
        b=jxFALt/4M7pgnfZTURqMn/K5DQApR+nExBk0d+5bV7WieL0G4uwr8rXvCD+J7zHnRG
         PcSjmpysPZw3NOUNb+RWIll9Ziw50Oc8cU/KHtqedesJMtMOvpnI0nNI1nqsIlgHd6Oe
         JPGwA6mFGkX0pQu/n1LkUft9gE88g0JeuzQ7VLTcnc0M2jKFIedTbmFd8mZl9XaOFNCh
         85zGafc2MbIt8CC0oQOLiUD6t4wzVmFMqvYQfu/YJPv0gWXF67yiuNMhruXmr8trLaeK
         oPxQwy7/FPKl5ONRuqGLa6hYeiT8Qjdm0i4uGZd8RlCnoVEuA9JPA77CtdB693yLHh1P
         WszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250198; x=1788854998;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EY/D94kuwUw3EuPTsso237XfSk0Z/pXvWdO7f/q58aY=;
        b=HbbZqy9+7NFIzLlnX0X6WTAwYUO7Wm9T2U0hRFaUQPp/MK4N/dyHdVZugnV8RLwYnN
         8mXUfGe3yJ0daW/F3n8wJB68/CVr/KZMq0vVgXIfEwugoBGsYftr8tFvIL8P71VnuP91
         8ZLuLI1cY1ZqeF06DXevwxutplEXV8inMSmqC/fHSyROd6Nw97NkcsJUWuClZyRj6nAY
         dFCXFfJgbESnhS+PtUZXwbdtT9xVYBq0fNn3w1Nwq3hPnTEdaWoMiUKP0QLoloo7f+Mr
         W/jBiwTJ9d07kAZcdqbbARk7LtUkNSxr8Ndzl41zZBVx9MIK/Qrqz0Ltw9im0XZYSKo6
         wNJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCXCnnKGsY10i7EfvJZeSCKILmkgrspu73m2CPmBqaF8wqZ8cA/b6u8UpIiAmfsM7/cOKlvHSaR2puRzjNXaRP@lists.infradead.org
X-Gm-Message-State: AFuF++ka/NgjVbi7h6zxx/GvaLiOoZ5c1pEmvIKmPA7eY/tUrAzGPGkE
	6UrytD0YEIN4RFaDqa5p0J3Q7Ftf3ucyp0HpfFNdcRDalyf5fu+Vfu2aqDtnu6UUq2hRHxROQvH
	xhvrfRJ/Ww8tYK6blSmOkhQ==
X-Received: from ejen10.prod.google.com ([2002:a17:906:88a:b0:beb:e0ab:b990])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:94c1:b0:c25:6230:dfcd with SMTP id a640c23a62f3a-c256230e4d2mr1626513366b.15.1788250198134;
 Tue, 01 Sep 2026 01:09:58 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:31 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-9-vdonnefort@google.com>
Subject: [PATCH v5 08/18] KVM: arm64: Add reclaim interface for the pKVM heap alloc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_011001_270008_25A970BE 
X-CRM114-Status: GOOD (  14.39  )
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

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

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
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 0e590261f1cc..62567560e1a5 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -851,6 +851,42 @@ static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
 }
 
+static void handle___pkvm_hyp_reclaim(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
+	DECLARE_REG(unsigned long, target, host_ctxt, 2);
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
+	cpu_reg(host_ctxt, 1) = ret;
+	cpu_reg(host_ctxt, 2) = host_mc.head;
+	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
+}
+
+static void handle___pkvm_hyp_reclaimable(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
+	unsigned long reclaimable = 0;
+
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		reclaimable = hyp_alloc_reclaimable();
+		break;
+	default:
+		reclaimable = 0;
+	}
+
+	cpu_reg(host_ctxt, 1) = reclaimable;
+}
+
 static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
@@ -960,6 +996,8 @@ static const hcall_t host_hcall[] = {
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
2.55.0.897.gb25b4bd76c-goog


