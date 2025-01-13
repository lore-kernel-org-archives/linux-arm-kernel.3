Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328E0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N545VQJ4bn+y0pSdJjf/mDvicZgnxEN0HYSjLOeVRco=; b=SgMRtGLQ+hY+UQQlfVBdcNjkyo
	DMAhplfa5Jl1Ww9UKeCte9DA5/g4GnG4E97Zn6jssGy2weSgFXT4Gl3QSTFZDBRp4Fiso5Kbg0UUL
	zsHRdVv/uN3OnNf2xvXEYTPE8Rs17x/JFGBEpfPM0pph3LmhMWdaTX3mvsVkzAbi+DCVcPRoPwLcr
	3y3GJrQuXNMCtBAH+TZUWRZnE9Svx2OSH6nCH8/XWo9z2QjIebDo5lfwU/uuLAEX/4oq6m7RPv6tz
	NKAG8HZV/iXmoeh2u+gRG+3W2gAHDbk+65So1HfTIJDWGozj74qgk/IEgg8AooD+BmbjCJ/I0dtg/
	AcZh8iFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPpp-00000006KUB-3rjC;
	Mon, 13 Jan 2025 19:10:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPoa-00000006KH2-3NsK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A2CBA40BA4;
	Mon, 13 Jan 2025 19:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB76EC4CED6;
	Mon, 13 Jan 2025 19:09:28 +0000 (UTC)
Date: Mon, 13 Jan 2025 19:09:26 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v2 5/7] KVM: arm64: MTE: Use stage-2 NoTagAccess memory
 attribute if supported
Message-ID: <Z4Vk5gTnd8o7VKWL@arm.com>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
 <20250110110023.2963795-6-aneesh.kumar@kernel.org>
 <Z4Fk58k8YptDkVgm@arm.com>
 <yq5amsfxtrlw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5amsfxtrlw.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_110932_913129_CD9ABAB2 
X-CRM114-Status: GOOD (  24.18  )
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

On Sat, Jan 11, 2025 at 06:49:55PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Fri, Jan 10, 2025 at 04:30:21PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> Currently, the kernel won't start a guest if the MTE feature is enabled
> 
> ...
> 
> >> @@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >>  		if (!vma)
> >>  			break;
> >>  
> >> -		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
> >> +		if (kvm_has_mte(kvm) &&
> >> +		    !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) {
> >>  			ret = -EINVAL;
> >>  			break;
> >>  		}
> >
> > I don't think we should change this, or at least not how it's done above
> > (Suzuki raised a related issue internally relaxing this for VM_PFNMAP).
> >
> > For standard memory slots, we want to reject them upfront rather than
> > deferring to the fault handler. An example here is file mmap() passed as
> > standard RAM to the VM. It's an unnecessary change in behaviour IMHO.
> > I'd only relax this for VM_PFNMAP mappings further down in this
> > function (and move the VM_PFNMAP check above; see Suzuki's internal
> > patch, unless he posted it publicly already).
> 
> But we want to handle memslots backed by pagecache pages for virtio-shm
> here (virtiofs dax use case).

Ah, I forgot about this use case. So with virtiofs DAX, does a host page
cache page (host VMM mmap()) get mapped directly into the guest as a
separate memory slot? In this case, the host vma would not have
VM_MTE_ALLOWED set.

> With MTE_PERM, we can essentially skip the
> kvm_vma_mte_allowed(vma) check because we handle all types in the fault
> handler.

This was pretty much the early behaviour when we added KVM support for
MTE, allow !VM_MTE_ALLOWED and trap them later. However, we disallowed
VM_SHARED because of some non-trivial race. Commit d89585fbb308 ("KVM:
arm64: unify the tests for VMAs in memslots when MTE is enabled")
changed this behaviour and the VM_MTE_ALLOWED check happens upfront. A
subsequent commit removed the VM_SHARED check.

It's a minor ABI change but I'm trying to figure out why we needed this
upfront check rather than simply dropping the VM_SHARED check. Adding
Peter in case he remembers. I can't see any race if we simply skipped
this check altogether, irrespective of FEAT_MTE_PERM.

-- 
Catalin

