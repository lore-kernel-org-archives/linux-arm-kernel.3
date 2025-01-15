Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED86C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xk9ND6zqF0jESwbuIRO6RnHT1buOxt1b96KLLw1rGSk=; b=ypwvOi2O6/47nAFBeBea+IoFdy
	hwNsJrHShMz42ZYBwFjPFSBPfU1ImxLqW+FmHYsZMbxw3E92lensYOPYds8WyBVDJJR3JWvNU0gNA
	PjAcnwCn2FFBC/TWZL0BlC+V7MM1eDSIdHGe55pzCpYxIG5fqpplU4rYPV4OB+DQlrp9nzHAY+95D
	9EU6WH4idhqzJ7uzK3pBef0JGa85LL4ECzRNpgvxSoiTpvwKi6Y8LZsZkEbeO6WQJelhPaZuxJOea
	IDJz+Ji/lz5zbs9t1piNypiyOb34vXOM8UBFgBb9ARQwGhJ1sMtFLnxHb+cKEMB2mb+n87po//v5i
	tGJl+P0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3G9-0000000Bx2Q-1IVL;
	Wed, 15 Jan 2025 13:16:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3Et-0000000Bwmq-1T6G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BA2E5C5C85;
	Wed, 15 Jan 2025 13:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BF0C4CEDF;
	Wed, 15 Jan 2025 13:15:16 +0000 (UTC)
Date: Wed, 15 Jan 2025 13:15:12 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 5/7] KVM: arm64: MTE: Use stage-2 NoTagAccess memory
 attribute if supported
Message-ID: <Z4e04P1bQlFBDHo7@arm.com>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
 <20250110110023.2963795-6-aneesh.kumar@kernel.org>
 <Z4Fk58k8YptDkVgm@arm.com>
 <yq5amsfxtrlw.fsf@kernel.org>
 <Z4Vk5gTnd8o7VKWL@arm.com>
 <CAMn1gO4huP4D_1mFdC8FsmvHkaQn+hC02ULcfBuS30VDM9=9gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMn1gO4huP4D_1mFdC8FsmvHkaQn+hC02ULcfBuS30VDM9=9gA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_051519_474609_8CAB09E1 
X-CRM114-Status: GOOD (  35.57  )
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

On Mon, Jan 13, 2025 at 12:47:54PM -0800, Peter Collingbourne wrote:
> On Mon, Jan 13, 2025 at 11:09 AM Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > On Sat, Jan 11, 2025 at 06:49:55PM +0530, Aneesh Kumar K.V wrote:
> > > Catalin Marinas <catalin.marinas@arm.com> writes:
> > > > On Fri, Jan 10, 2025 at 04:30:21PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > > >> Currently, the kernel won't start a guest if the MTE feature is enabled
> > >
> > > ...
> > >
> > > >> @@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> > > >>            if (!vma)
> > > >>                    break;
> > > >>
> > > >> -          if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
> > > >> +          if (kvm_has_mte(kvm) &&
> > > >> +              !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) {
> > > >>                    ret = -EINVAL;
> > > >>                    break;
> > > >>            }
> > > >
> > > > I don't think we should change this, or at least not how it's done above
> > > > (Suzuki raised a related issue internally relaxing this for VM_PFNMAP).
> > > >
> > > > For standard memory slots, we want to reject them upfront rather than
> > > > deferring to the fault handler. An example here is file mmap() passed as
> > > > standard RAM to the VM. It's an unnecessary change in behaviour IMHO.
> > > > I'd only relax this for VM_PFNMAP mappings further down in this
> > > > function (and move the VM_PFNMAP check above; see Suzuki's internal
> > > > patch, unless he posted it publicly already).
> > >
> > > But we want to handle memslots backed by pagecache pages for virtio-shm
> > > here (virtiofs dax use case).
> >
> > Ah, I forgot about this use case. So with virtiofs DAX, does a host page
> > cache page (host VMM mmap()) get mapped directly into the guest as a
> > separate memory slot? In this case, the host vma would not have
> > VM_MTE_ALLOWED set.
> >
> > > With MTE_PERM, we can essentially skip the
> > > kvm_vma_mte_allowed(vma) check because we handle all types in the fault
> > > handler.
> >
> > This was pretty much the early behaviour when we added KVM support for
> > MTE, allow !VM_MTE_ALLOWED and trap them later. However, we disallowed
> > VM_SHARED because of some non-trivial race. Commit d89585fbb308 ("KVM:
> > arm64: unify the tests for VMAs in memslots when MTE is enabled")
> > changed this behaviour and the VM_MTE_ALLOWED check happens upfront. A
> > subsequent commit removed the VM_SHARED check.
> >
> > It's a minor ABI change but I'm trying to figure out why we needed this
> > upfront check rather than simply dropping the VM_SHARED check. Adding
> > Peter in case he remembers. I can't see any race if we simply skipped
> > this check altogether, irrespective of FEAT_MTE_PERM.
> 
> I don't see a problem with removing the upfront check. The reason I
> kept the check was IIRC just that there was already a check there and
> its logic needed to be adjusted for my VM_SHARED changes.

Prior to commit d89585fbb308, kvm_arch_prepare_memory_region() only
rejected a memory slot if VM_SHARED was set. This commit unified the
checking with user_mem_abort(), with slots being rejected if
(!VM_MTE_ALLOWED || VM_SHARED). A subsequent commit dropped the
VM_SHARED check, so we ended up with memory slots being rejected only if
!VM_MTE_ALLOWED (of course, if kvm_has_mte()). This wasn't the case
before the VM_SHARED relaxation.

So if you don't remember any strong reason for this change, I think we
should go back to the original behaviour of deferring the VM_MTE_ALLOWED
check to user_mem_abort() (and still permitting VM_SHARED).

-- 
Catalin

