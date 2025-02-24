Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E77C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v5D6OdVX0pKgyapyw7j+h+74TccfpzpMjmN75/n62w=; b=qiCtlzNVOitLL9GzP2cKOrH3Be
	002dGUIOLCkppLCjbRW6jSseRvCaaDKlGtGjbTaoJhLak+qOLZs9/PIS4I6JMvsukniaZxqu+GHnO
	XMNgXNElzzA6XFnPDczc/tx+kIhsdpQPrgp3FKELrt+GgQldt2mLx2tiUpnQJlp/OHAU2G6FhtXri
	YpsIxTZYg69GrYSDkeH8S7L2gPQHIE38vXaSSAF8jxHbEOfwEnSOa5N7SJ8JLA3p40ohzTsJjyxC7
	KRXoV2up+rv/OTv2wp4DL36vwHhSBbWgDCNQId/Qn8HWreJiF9HYgFTBu2LSP2d+K20GCRnl+2KMO
	RAEQcYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcm3-0000000EifB-0AdA;
	Mon, 24 Feb 2025 18:01:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmckV-0000000EiT4-27Ey
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D972E5C3885;
	Mon, 24 Feb 2025 17:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C54EC4CED6;
	Mon, 24 Feb 2025 18:00:08 +0000 (UTC)
Date: Mon, 24 Feb 2025 18:00:05 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] KVM: arm64: Drop mte_allowed check during memslot
 creation
Message-ID: <Z7yzpeIKcYiw6q5a@arm.com>
References: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
 <Z7xSfVME4z2ComUm@arm.com>
 <86ldtvr0nl.wl-maz@kernel.org>
 <Z7yElHKrJGn8XuPS@arm.com>
 <86jz9fqtbk.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86jz9fqtbk.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_100011_654312_3EC407EB 
X-CRM114-Status: GOOD (  22.09  )
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

On Mon, Feb 24, 2025 at 03:02:39PM +0000, Marc Zyngier wrote:
> On Mon, 24 Feb 2025 14:39:16 +0000,
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > This patch still prevents such MMIO+MTE mappings but moves the decision
> > to user_mem_abort() and it's slightly more relaxed - only rejecting it
> > if !VM_MTE_ALLOWED _and_ the Stage 2 is cacheable. The side-effect is
> > that it allows device assignment into the guest since Stage 2 is not
> > Normal Cacheable (at least for now, we have some patches Ankit but they
> > handle the MTE case).
> 
> The other side effect is that it also allows non-tagged cacheable
> memory to be given to the MTE-enabled guest, and the guest has no way
> to distinguish between what is tagged and what's not.

It can distinguish in the same way as the host does it, e.g. based on
the firmware tables it gets - only assume the standard RAM can be
tagged. Any device in its IPA space does not support tagging and, if
mapped incorrectly, can trigger external aborts etc. But it's the
responsibility of the VMM to set up the memory slots correctly. If those
non-MTE slots are only used for device assignment, we'd not get any
-EFAULT returns.

Having the requirement that all address ranges assigned to a guest
support MTE makes MTE and device assignment exclusive. FEAT_MTE_PERM
doesn't help either, it only allows cacheable MMIO into guests safely
(from an SError/random accesses perspective).

Anyway, I think I get what you mean. For those memory slots potentially
mapped as cacheable at Stage 2 (e.g. a file mmap()), you'd rather block
them upfront than confusing a potentially buggy VMM later with the
-EFAULT (or some other error).

Do we have another way to tell in kvm_arch_prepare_memory_region()
whether the memory is going to be mapped as Device/NC at Stage 2 or
whether later we'll have FEAT_MTE_PERM set for it? We don't have any
physical address at this point. However, we have vma->vm_page_prot but I
was a big fan of this. Ankit's series for Cacheable VFIO is relying on
this IIRC.

For VFIO specifically, we could do something like below. It won't
trigger any -EFAULT exists. I think it's safe for VM_PFNMAP as well
since these would not be mapped as Cacheable at Stage 2 AFAICT but we
could add some additional checks.

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..c48382567f2f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2184,7 +2184,12 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		if (!vma)
 			break;
 
-		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
+		/*
+		 * VM_ALLOW_ANY_UNCACHED vmas will be mapped as Normal
+		 * NonCacheable at Stage 2 and safe with MTE in guests.
+		 */
+		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma) &&
+		    !(vma->vm_flags & VM_ALLOW_ANY_UNCACHED)) {
 			ret = -EINVAL;
 			break;
 		}

-- 
Catalin

