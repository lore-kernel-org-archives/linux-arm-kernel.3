Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C125AC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnRqsahB6ixCE+V/kYk/AxHHS7DMqiBEI4yNzskZKCQ=; b=x1cD13a8txUM3erlyoO8rADDLX
	My4okt0Z12TweRYfzSYM0Q14RPTzMsNzO5ZwNU/G+WCpO/lU6U4eYfYLPrMBNPfEUk/BLA+NrtAqI
	/XdhgcMnVs2BF6MguYVNsk2JFMggXh/BAnnkNE8mraiA8dKT3u/fVGgEWW2MsgrmVgt10ltZh8UIP
	G4yAa+UN8pni4WtIgg/nUJa7+PjHj6TcejDOjb6/1v+iolL17o4MaMeS1ewRe4u03fXn9Cn7ft+tE
	A/InnGFdCbCfkEuMWeA0WyNSisHEp/rzmxRDBWS9yJen6vT0DGBBbS+tdyaB25Hogdz+qmC+vGbjY
	YI8OQxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPnX-00000007K71-3hR0;
	Mon, 11 Aug 2025 10:30:35 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPdA-00000007ImJ-3Ytp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:19:54 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-459d7ed90baso32850965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754907591; x=1755512391; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hnRqsahB6ixCE+V/kYk/AxHHS7DMqiBEI4yNzskZKCQ=;
        b=bHggPiL65GDQGbJP96VlC8gu2wiKwT/wtGeBVZppFk/Mj32TtIBOCiZCxIz2VzkP9j
         9my0jYBh+d/bB3/DG6zIJWY/PYpdK+fs4tQl6vunHG4UE42khPWY6VTmSV2nkTXusPAV
         zYVseUmiBav1PrLLvj5GwKDf5A0ZeHb0HaNk8Lo8yUDdQI8Jjh8PyKRd5kHCW6uuxNHO
         RN9HgGIDypWAHPb0CWZd8CrIkLOKdBEsXvtUpZGWnCVdogvdWoyUwGaA/ePi0urUc3P3
         C9AyrCEBOS9vs9T0osdIEd7aJbpVx3G5cSoPcSENnyu6tB9no9uIUbhbsRjItpVRu6dl
         QAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907591; x=1755512391;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnRqsahB6ixCE+V/kYk/AxHHS7DMqiBEI4yNzskZKCQ=;
        b=jZUK4YQA13/zHQfHGuaA3UJ6IZRWkJp+IV/iQM46Xf7U8kj8kcZFexDdLRWJdWOBsb
         tk7a8DnqnTv23E8iiAe7I3e//VOgjzXzRRv+hQ5ZJFL+Jo8xoFfuDT3Ke8Nx7RCgdYVU
         jLKIc7YJpYkHfGcYjF3s4r+dDo3GAAwAmjk1Xg/hDF9cGX6L4ihunxosEQXqsaJFly7o
         UMrBaL/iBlpY+nMT3jtTrqXtNhmomBKmjQS5qZdsA6vvY+F16MAgeNrv1EmYS3Cu8dME
         M81+aLnCp4lfyq7KV6hOCuC7wXeuxKxv9oiModbXgygTRi96QU5Rp+hSr2h5xG18sPVf
         uVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJuTlJW4zhbs6z8GRM6db/qzBijzSN+3hSDQ+4sAHebZtMxRr+9CdATYyikKK1a2MA7AWWAVKWeTcyGkT8ia5t@lists.infradead.org
X-Gm-Message-State: AOJu0YzsDrap8iq2mMAeHVkfTgv+TWes/JgoAb/CZQ06TEgnnD0CLeVG
	rzXkTcfFIp22nGtJPqiFvndTlHX8XjoR+8ifi/Ggjo8ZeD/FeXorMfEFcQgKJiORefKgZqRYgQ+
	2/A==
X-Google-Smtp-Source: AGHT+IEmsALnIdUBObLNmVtdjI78htHxobIddAiETD6i+p9WjqtA1PEmQ3Rf3ILEnidkMpgPE0IcOJxURg==
X-Received: from wmbep23.prod.google.com ([2002:a05:600c:8417:b0:456:214c:845d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46ca:b0:459:e3f8:9308
 with SMTP id 5b1f17b1804b1-459f4eaf6e4mr98644725e9.11.1754907591072; Mon, 11
 Aug 2025 03:19:51 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:19:42 +0100
In-Reply-To: <20250811101947.3637632-1-tabba@google.com>
Mime-Version: 1.0
References: <20250811101947.3637632-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250811101947.3637632-4-tabba@google.com>
Subject: [PATCH v2 3/8] KVM: arm64: Clarify comments to distinguish pKVM mode
 from protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_031952_961285_D684C07E 
X-CRM114-Status: GOOD (  21.26  )
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

The hypervisor code for protected KVM contains comments that are
imprecise and at times flat-out wrong. They often refer to a "protected
VM" in contexts where the code or data structure applies to _any_ VM
managed by the hypervisor when pKVM is enabled.

For instance, the 'vm_table' holds handles for all VMs known to the
hypervisor, not exclusively for those that are configured as protected.
This inaccurate terminology can make the code scope harder to understand
for future (and current) developers.

Clarify the comments throughout the pKVM hypervisor code to make a clear
distinction between the pKVM feature itself (i.e., "protected mode") and
the VMs that are specifically configured to be protected. This involves
replacing ambiguous uses of "protected VM" with more accurate phrasing.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 25 +++++++++++--------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index ce31d3b73603..4540324b5657 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -29,7 +29,7 @@ struct pkvm_hyp_vcpu {
 };
 
 /*
- * Holds the relevant data for running a protected vm.
+ * Holds the relevant data for running a vm in protected mode.
  */
 struct pkvm_hyp_vm {
 	struct kvm kvm;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 6198c1d27b5b..abe173406c88 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -23,8 +23,8 @@ unsigned int kvm_arm_vmid_bits;
 unsigned int kvm_host_sve_max_vl;
 
 /*
- * The currently loaded hyp vCPU for each physical CPU. Used only when
- * protected KVM is enabled, but for both protected and non-protected VMs.
+ * The currently loaded hyp vCPU for each physical CPU. Used in protected mode
+ * for both protected and non-protected VMs.
  */
 static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
 
@@ -135,7 +135,7 @@ static int pkvm_check_pvm_cpu_features(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
 
-	/* Protected KVM does not support AArch32 guests. */
+	/* No AArch32 support for protected guests. */
 	if (kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL0, AARCH32) ||
 	    kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL1, AARCH32))
 		return -EINVAL;
@@ -210,8 +210,8 @@ static pkvm_handle_t idx_to_vm_handle(unsigned int idx)
 DEFINE_HYP_SPINLOCK(vm_table_lock);
 
 /*
- * The table of VM entries for protected VMs in hyp.
- * Allocated at hyp initialization and setup.
+ * A table that tracks all VMs in protected mode.
+ * Allocated during hyp initialization and setup.
  */
 static struct pkvm_hyp_vm **vm_table;
 
@@ -495,7 +495,7 @@ static int find_free_vm_table_entry(struct kvm *host_kvm)
 /*
  * Allocate a VM table entry and insert a pointer to the new vm.
  *
- * Return a unique handle to the protected VM on success,
+ * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
 static pkvm_handle_t insert_vm_table_entry(struct kvm *host_kvm,
@@ -594,10 +594,8 @@ static void unmap_donated_memory_noclear(void *va, size_t size)
 }
 
 /*
- * Initialize the hypervisor copy of the protected VM state using the
- * memory donated by the host.
- *
- * Unmaps the donated memory from the host at stage 2.
+ * Initialize the hypervisor copy of the VM state using host-donated memory.
+ * Unmap the donated memory from the host at stage 2.
  *
  * host_kvm: A pointer to the host's struct kvm.
  * vm_hva: The host va of the area being donated for the VM state.
@@ -606,7 +604,7 @@ static void unmap_donated_memory_noclear(void *va, size_t size)
  *	    the VM. Must be page aligned. Its size is implied by the VM's
  *	    VTCR.
  *
- * Return a unique handle to the protected VM on success,
+ * Return a unique handle to the VM on success,
  * negative error code on failure.
  */
 int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
@@ -668,10 +666,9 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 }
 
 /*
- * Initialize the hypervisor copy of the protected vCPU state using the
- * memory donated by the host.
+ * Initialize the hypervisor copy of the vCPU state using host-donated memory.
  *
- * handle: The handle for the protected vm.
+ * handle: The hypervisor handle for the vm.
  * host_vcpu: A pointer to the corresponding host vcpu.
  * vcpu_hva: The host va of the area being donated for the vcpu state.
  *	     Must be page aligned. The size of the area must be equal to
-- 
2.50.1.703.g449372360f-goog


