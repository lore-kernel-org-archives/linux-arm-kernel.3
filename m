Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958A0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmFw3mXH/exEQe+/QLbl03MUiMl4ucnB+5XoLqj1sUc=; b=oAM5POmn7NAnHXtb5jYpRwHB5a
	Q763Wq9hAvJ47f/SFBayPkCRV0ZnzaJ04rN5Jx2iM//KwUKfY0+E94e/mLfO4EBTesYkGe30HPZur
	TBFJJ1/zDB92WArXIJ/i4g0b5SODAwfnsGCll00C963yCADFchktYDbaWR7pBdwZOtxQzUYJGJ884
	rnDyzs/nnam7qUY0hY6UG5JDU7JRJ4ZCamp+WH9dg+l/k8imERYwO7PDhNPBA0eIwe1Zhm1ooIIcS
	XRjxKY2HbQ7qtxh/fbFfORlWYdE4U/db7YL2B/qcydiRrNoE2OI+sgJgD6JEUD7ZGk4qi9eu0ID6Y
	xFF45d/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhsuO-00000006T25-0Epd;
	Fri, 01 Aug 2025 16:47:04 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhsrl-00000006SlM-1nBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 16:44:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31f65d519d3so3135568a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754066660; x=1754671460; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cmFw3mXH/exEQe+/QLbl03MUiMl4ucnB+5XoLqj1sUc=;
        b=M0So+0GuDbMMq8FaK9LkhUiEKnXtIyp55oZCWAkLbCkS3Y37DA4S1IBIqRijHuaXsY
         I8aL0qpFlyl8XapIZp/zxpggHd5sbkDlNwCFQK2/Lr4+Vy+aIAynzKzQnFDnDSNk+myU
         cCLxWxT2vyX9g5yM/co3U2ePM6jAlUZGQjGpk0P24wkaHPcC+KKIKTSKXYYqLbQm8NsG
         vJDhdkUOYu+LR8Pnw7Mdgl01iRQYY6arVVSx5X6WSJ5Ca92zAB/pMILNfo+8MwWbbU8U
         kkD/5IeI+vol19rLvfaOGLRfm1ppi9Z1wjbPdGMBQTvfgJHAIQdZ/9DiAGaWcLjxE5i6
         xWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754066660; x=1754671460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmFw3mXH/exEQe+/QLbl03MUiMl4ucnB+5XoLqj1sUc=;
        b=asSxZgrv/SXNidL3V7hW6NlhLyhntmhouqaZmC/QTtcnuVIDVuaglQjxYHHF9HdRFx
         1jkM/OjRqv2M4QyG6deSgZ+Fxyj0qxEydZqGM/LG2x8feAoPyTtiz5OIGmOgupMirYgm
         RrOGRKPQ6V6LFzEgsuf6iJ+PL6vm6Ky7534aq6O3u4Icax+LxasTy/aH9xqAQYMEjKzo
         YERior8yjN0IDToEMFvlr22BG80ZB4oT8igNFGR+MeuV9Feg5LJmSi2FmRLnqHgrVYjp
         CPvL0iARnclZcja384cJn3OEHcx8XaCm3CGiiElfQsQlH0h4HFhJoWqF+/YNZl3g8vOt
         f2bw==
X-Forwarded-Encrypted: i=1; AJvYcCVdfm2pKgRzHR4IR/AeKOLPNArzZjmvLeoCSDB6VTQFmgnRZ/OgRtcZDIvZCJxuchfyqMuWesgBw3wZIKUPAR2x@lists.infradead.org
X-Gm-Message-State: AOJu0Yydh5q6YxokJdQ/kKvix4PnA/17p56ud65SxpQn94Z3HtTFAXDL
	6QPMbsMZiWv6Shg5jYzl8eCLGpwLSBqRetAs2td0/vrtUNsPYCqmT+/sc1LJh9U8zcQqXkoaKjZ
	dA4lNoQ==
X-Google-Smtp-Source: AGHT+IHTCPWlBsVY++6yRHnsFzrU+E4U0uWTRC0q7DUxzgBPU0wzo6RMGy3C5kq+eZLK/o+LJzUMjGasNMs=
X-Received: from pjf12.prod.google.com ([2002:a17:90b:3f0c:b0:311:462d:cb60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1812:b0:311:da03:3437
 with SMTP id 98e67ed59e1d1-321162b44b8mr568364a91.27.1754066660052; Fri, 01
 Aug 2025 09:44:20 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:44:18 -0700
In-Reply-To: <b27f807e-b04f-487d-be13-74a8b0a61b42@intel.com>
Mime-Version: 1.0
References: <20250729193341.621487-1-seanjc@google.com> <20250729193341.621487-6-seanjc@google.com>
 <b27f807e-b04f-487d-be13-74a8b0a61b42@intel.com>
Message-ID: <aIzu4q_7yBmCIOWK@google.com>
Subject: Re: [PATCH 5/5] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
From: Sean Christopherson <seanjc@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, Kai Huang <kai.huang@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_094421_471682_A0E0300A 
X-CRM114-Status: GOOD (  31.45  )
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

+Chao

On Fri, Aug 01, 2025, Adrian Hunter wrote:
> On 29/07/2025 22:33, Sean Christopherson wrote:
> > +static int tdx_terminate_vm(struct kvm *kvm)
> > +{
> > +	if (kvm_trylock_all_vcpus(kvm))
> > +		return -EBUSY;
> > +
> > +	kvm_vm_dead(kvm);
> > +	to_kvm_tdx(kvm)->vm_terminated = true;
> > +
> > +	kvm_unlock_all_vcpus(kvm);
> > +
> > +	tdx_mmu_release_hkid(kvm);
> > +
> > +	return 0;
> > +}
> 
> As I think I mentioned when removing vm_dead first came up,
> I think we need more checks.  I spent some time going through
> the code and came up with what is below:
> 
> First, we need to avoid TDX VCPU sub-IOCTLs from racing with
> tdx_mmu_release_hkid().  But having any TDX sub-IOCTL run after
> KVM_TDX_TERMINATE_VM raises questions of what might happen, so
> it is much simpler to understand, if that is not possible.
> There are 3 options:
> 
> 1. Require that KVM_TDX_TERMINATE_VM is valid only if
> kvm_tdx->state == TD_STATE_RUNNABLE.  Since currently all
> the TDX sub-IOCTLs are for initialization, that would block
> the opportunity for any to run after KVM_TDX_TERMINATE_VM.
> 
> 2. Check vm_terminated in tdx_vm_ioctl() and tdx_vcpu_ioctl()
> 
> 3. Test KVM_REQ_VM_DEAD in tdx_vm_ioctl() and tdx_vcpu_ioctl()
> 
> [ Note cannot check is_hkid_assigned() because that is racy ]
> 
> Secondly, I suggest we avoid SEAMCALLs that will fail and
> result in KVM_BUG_ON() if HKID has been released.
> 
> There are 2 groups of those: MMU-related and TDVPS_ACCESSORS.
> 
> For the MMU-related, the following 2 functions should return
> an error immediately if vm_terminated:
> 
> 	tdx_sept_link_private_spt()
> 	tdx_sept_set_private_spte()
> 
> For that not be racy, extra synchronization is needed so that
> vm_terminated can be reliably checked when holding mmu lock
> i.e.
> 
> static int tdx_terminate_vm(struct kvm *kvm)
> {
> 	if (kvm_trylock_all_vcpus(kvm))
> 		return -EBUSY;
> 
> 	kvm_vm_dead(kvm);
> +
> +       write_lock(&kvm->mmu_lock);
> 	to_kvm_tdx(kvm)->vm_terminated = true;
> +       write_unlock(&kvm->mmu_lock);
> 
> 	kvm_unlock_all_vcpus(kvm);
> 
> 	tdx_mmu_release_hkid(kvm);
> 
> 	return 0;
> }
> 
> Finally, there are 2 TDVPS_ACCESSORS that need avoiding:
> 
> 	tdx_load_mmu_pgd()
> 		skip td_vmcs_write64() if vm_terminated
> 
> 	tdx_protected_apic_has_interrupt()
> 		skip td_state_non_arch_read64() if vm_terminated

Oof.  And as Chao pointed out[*], removing the vm_dead check would allow creating
and running vCPUs in a dead VM, which is most definitely not desirable.  Squashing
the vCPU creation case is easy enough if we keep vm_dead but still generally allow
ioctls, and it's probably worth doing that no matter what (to plug the hole where
pending vCPU creations could succeed):

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d477a7fda0ae..941d2c32b7dc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4207,6 +4207,11 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 
        mutex_lock(&kvm->lock);
 
+       if (kvm->vm_dead) {
+               r = -EIO;
+               goto unlock_vcpu_destroy;
+       }
+
        if (kvm_get_vcpu_by_id(kvm, id)) {
                r = -EEXIST;
                goto unlock_vcpu_destroy;

And then to ensure vCPUs can't do anything, check KVM_REQ_VM_DEAD after acquiring
vcpu->mutex.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6c07dd423458..883077eee4ce 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4433,6 +4433,12 @@ static long kvm_vcpu_ioctl(struct file *filp,
 
        if (mutex_lock_killable(&vcpu->mutex))
                return -EINTR;
+
+       if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu)) {
+               r = -EIO;
+               goto out;
+       }
+
        switch (ioctl) {
        case KVM_RUN: {
                struct pid *oldpid;


That should address all TDVPS paths (I hope), and I _think_ would address all
MMU-related paths as well?  E.g. prefault requires a vCPU.

Disallowing (most) vCPU ioctls but not all VM ioctls on vm_dead isn't great ABI
(understatement), but I think we need/want the above changes even if we keep the
general vm_dead restriction.  And given the extremely ad hoc behavior of taking
kvm->lock for VM ioctls, trying to enforce vm_dead for "all" VM ioctls seems like
a fool's errand.

So I'm leaning toward keeping "KVM: Reject ioctls only if the VM is bugged, not
simply marked dead" (with a different shortlog+changelog), but keeping vm_dead
(and not introducing kvm_tdx.vm_terminated).

Thoughts?

[*] https://lore.kernel.org/all/aIlzeT+yFG2Tvb3%2F@intel.com

