Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C9CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=; b=tll0Kpy6dr14hqd+OSBAN9w/Fi
	CAk7F9bzYpVgnqPFcT+JmtuaDdU/8k/O4PGpwS4SAqWDnUmprhHf0rcGXtgW/cohV349kWrerUHjb
	ebOsiaUq9PmgrL2VovWukdKqjqzIKSn4n8AynojgntJJDRXKRhFmgwet1NlhM8Xtykl7Yq1IIl9AX
	+k/1cMsK/CUw3TqqW8ULm2HpMcG1Gy60L3go541Hi7TgAIzZY28q8gKNMxTYDvfpmC28JdBx7+oH3
	Xs8HzJ41ArmZg8DgcgesE/C0VlbLORQitTt0BvR/jMs4wfJtldnUgGOz7ek2yIvyviokZHogQt2tv
	m9GlowAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ15-00000004mg8-1hEB;
	Thu, 30 Oct 2025 20:13:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYz4-00000004kJS-3AVb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=; b=XyB2zmhedsu7wxyZSedT8hjaER
	wLUxWQJRM0fjmNuZyI4BdlddLoPTqSpXaj6HjwgY2axlFrxw8PIs+TSBGuszWli63p5abxBCG6PuO
	OXjsCuPeYKUVQOGyD12ON3nNZqoK2k9SAR64Oi3ECwrjaAUYKPwsTJa93L2+3q76nUJ6sFg2/PECu
	N8spqgacCl2IFXWZrJhEmA7eQCdolewX+oJLAdzJBt1DDlw8YDvyioaoKE/I2uI97dSTpBuR5WOEz
	t1KD1+w0+p1I5dcG5I3AF0kk1ANPhNSHjOQs3XbUr/OseDFzZ5nnquVQvxnxkjYaYD1EJx1trWLyn
	dgMYR0dQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyz-0000000C5oG-48OG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so2548919a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855052; x=1762459852; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=;
        b=hdbYCOHRyiQ0L/jEJh1DbvL59dqhV5ibzwLLgfdJo3yW9zVfZK+gsHJwW6Psz++JX4
         WR0bnkbmmOHCkTXYyf7KYv2U2tm84arCXcYXiQeyzn7MOgHwle4o70639ZDpt5jLb69r
         i0pretToQSHN8ObqTYElFPBqgJJd02ApCNaf/1M8I2sqTtroUPGllUFcvHby1c2FE/LB
         P3HoVXeXYuivnp0XKk5BLNGSPMxg3KqYkHKi0EQw+Np7CftF8iiXubpdI1wJY1JmgsO+
         D9evqLk1weMFq0m66A9Xh7idJv2w1jJTQuhZB3XbqezkPlLc3CNENs54PXJNRteXAiGG
         yZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855052; x=1762459852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=;
        b=HJBdsC3MZhcuOXfGlrzeeaNT3PRxQuHEueb8+s9qz2rqSdkfhXUHp/N6radlrnB3K7
         N6QaJ318qCC/DOXKCkBv13jedZcLKKPJjBIZVWSUiRU3JoX3n9Ny7AY56Rsrmm51GuxE
         LEIrJJRd7CO0V6LQv628VtZLyzEVaq8bMlC10LFaeHrA3YlfooSgKLp8l9zpuHZ78JRK
         XfPLGU56pv/lrv+3m3aeFsz0Q1QfE885LWLune9k4Vktsw4HKud4nwcq3EGXQXHiqaZC
         PFYjaFlcjpMbuvYtIbww1QDXEBF0W8aLsGIfL433xzBgg6Yeas5nlznRNSQSVfgwD8ml
         0MqA==
X-Gm-Message-State: AOJu0YyDgk8HUZYpTgrbk+oNK9FLqkvFJNZ0Q9Vk3c2K2CzgpgT9GBjN
	DU7U1NilTkh0CgIKKktGQybZnzQdgS5gkOJSYQxVLgAS2wC0pB0B8IjKrkQFGzG/jVIrBhvYYeh
	oX/JjpQ==
X-Google-Smtp-Source: AGHT+IGdH9ACR3MS+ju/IeUipjD96kAUXZo3BjKEOn1spE0qh/NlJMuCLno+Rlt479ILTGbPCBlzBUGVIBM=
X-Received: from pjl4.prod.google.com ([2002:a17:90b:2f84:b0:339:dc19:ae60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c52:b0:338:3789:2e7b
 with SMTP id 98e67ed59e1d1-34082fd9099mr1370626a91.13.1761855052135; Thu, 30
 Oct 2025 13:10:52 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:44 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-22-seanjc@google.com>
Subject: [PATCH v4 21/28] KVM: TDX: Add macro to retry SEAMCALLs when forcing
 vCPUs out of guest
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_201055_332143_597BB7C5 
X-CRM114-Status: GOOD (  13.64  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a macro to handle kicking vCPUs out of the guest and retrying
SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
tease out which SEAMCALL is being made, but significantly reduces the
amount of copy+paste code and makes it all but impossible to leave an
elevated wait_for_sept_zap.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 82 +++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 49 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 999b519494e9..97632fc6b520 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -294,25 +294,34 @@ static inline void tdx_disassociate_vp(struct kvm_vcpu *vcpu)
 	vcpu->cpu = -1;
 }
 
-static void tdx_no_vcpus_enter_start(struct kvm *kvm)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, true);
-
-	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
-}
-
-static void tdx_no_vcpus_enter_stop(struct kvm *kvm)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, false);
-}
+/*
+ * Execute a SEAMCALL related to removing/blocking S-EPT entries, with a single
+ * retry (if necessary) after forcing vCPUs to exit and wait for the operation
+ * to complete.  All flows that remove/block S-EPT entries run with mmu_lock
+ * held for write, i.e. are mutually exclusive with each other, but they aren't
+ * mutually exclusive with running vCPUs, and so can fail with "operand busy"
+ * if a vCPU acquires a relevant lock in the TDX-Module, e.g. when doing TDCALL.
+ *
+ * Note, the retry is guaranteed to succeed, absent KVM and/or TDX-Module bugs.
+ */
+#define tdh_do_no_vcpus(tdh_func, kvm, args...)					\
+({										\
+	struct kvm_tdx *__kvm_tdx = to_kvm_tdx(kvm);				\
+	u64 __err;								\
+										\
+	lockdep_assert_held_write(&kvm->mmu_lock);				\
+										\
+	__err = tdh_func(args);							\
+	if (unlikely(tdx_operand_busy(__err))) {				\
+		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, true);			\
+		kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);	\
+										\
+		__err = tdh_func(args);						\
+										\
+		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, false);		\
+	}									\
+	__err;									\
+})
 
 /* TDH.PHYMEM.PAGE.RECLAIM is allowed only when destroying the TD. */
 static int __tdx_reclaim_page(struct page *page)
@@ -1722,14 +1731,7 @@ static void tdx_track(struct kvm *kvm)
 	 */
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
-	err = tdh_mem_track(&kvm_tdx->td);
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_track(&kvm_tdx->td);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_track, kvm, &kvm_tdx->td);
 	TDX_BUG_ON(err, TDH_MEM_TRACK, kvm);
 
 	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
@@ -1781,14 +1783,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return;
 
-	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_range_block, kvm, &kvm_tdx->td, gpa,
+			      tdx_level, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_RANGE_BLOCK, entry, level_state, kvm))
 		return;
 
@@ -1803,20 +1799,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * with other vcpu sept operation.
 	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
 	 */
-	err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-				  &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/*
-		 * The second retry is expected to succeed after kicking off all
-		 * other vCPUs and prevent them from invoking TDH.VP.ENTER.
-		 */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-					  &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_page_remove, kvm, &kvm_tdx->td, gpa,
+			      tdx_level, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_REMOVE, entry, level_state, kvm))
 		return;
 
-- 
2.51.1.930.gacf6e81ea2-goog


