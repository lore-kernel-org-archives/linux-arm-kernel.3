Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8DAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lE/Xbmf2Ixrc28FsjZgb8nI+zXNn9Xk4Te6a4EkWyLs=; b=1qbxLSPlcejqGxxhLJJlIYLPa/
	5h3VaZDqHZEtbBtVq3qtBcvEz6dQxju9PIj/8ptQOZjZlB5aHwtIgM2UvmHcDHWiQYm1POb7wtY44
	yGl9u6IYGXQpWNKQ34ZQ1ymkYSLcd3iaw3Km3y9tob2useDw0bFmTi9Xy19OfIUTRlW9JeUohLRGk
	TJt94UTiP+rkyLGgjlCm8NwUpPcX18Fq3zPzWpn9Me8Lw37CfR2ea/NuIrwqsR++x03+8tV7lVHsi
	motqWCKtBmePC18bOey52bNnEC/P/tsvwFLqoGl6lmUX5QS2G5G8T6N2lMqmc4kN2ifDolKdU5lJ1
	JZThEphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJrT-00000004S5Z-3gH1;
	Wed, 26 Feb 2025 16:02:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJoE-00000004R4L-1pTg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D2885C71DE;
	Wed, 26 Feb 2025 15:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22248C4CED6;
	Wed, 26 Feb 2025 15:58:50 +0000 (UTC)
Date: Wed, 26 Feb 2025 15:58:48 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] KVM: arm64: Drop mte_allowed check during memslot
 creation
Message-ID: <Z786ODqxlYNpj40l@arm.com>
References: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
 <Z7xSfVME4z2ComUm@arm.com>
 <86ldtvr0nl.wl-maz@kernel.org>
 <Z7yElHKrJGn8XuPS@arm.com>
 <86jz9fqtbk.wl-maz@kernel.org>
 <yq5aseo3gund.fsf@kernel.org>
 <86ikozqmsl.wl-maz@kernel.org>
 <yq5a8qptauyl.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a8qptauyl.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_075854_585984_240C1006 
X-CRM114-Status: GOOD (  27.65  )
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

On Wed, Feb 26, 2025 at 03:28:26PM +0530, Aneesh Kumar K.V wrote:
> Marc Zyngier <maz@kernel.org> writes:
> > On Mon, 24 Feb 2025 16:44:06 +0000,
> > Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:
> >> >> On Mon, Feb 24, 2025 at 12:24:14PM +0000, Marc Zyngier wrote:
> >> >> > > On Mon, Feb 24, 2025 at 03:09:38PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> >> > > > This change is needed because, without it, users are not able to use MTE
> >> >> > > > with VFIO passthrough (currently the mapping is either Device or
> >> >> > > > NonCacheable for which tag access check is not applied.), as shown
> >> >> > > > below (kvmtool VMM).
[...]
> >> >> > My other concern is that this gives pretty poor consistency to the
> >> >> > guest, which cannot know what can be tagged and what cannot, and
> >> >> > breaks a guarantee that the guest should be able to rely on.
[...]
> >> What if we trigger a memory fault exit with the TAGACCESS flag, allowing
> >> the VMM to use the GPA to retrieve additional details and print extra
> >> information to aid in analysis? BTW, we will do this on the first fault
> >> in cacheable, non-tagged memory even if there is no tagaccess in that
> >> region. This can be further improved using the NoTagAccess series I
> >> posted earlier, which ensures the memory fault exit occurs only on
> >> actual tag access
> >> 
> >> Something like below?
> >
> > Something like that, only with:
> >
> > - a capability informing userspace of this behaviour
> >
> > - a per-VM (or per-VMA) flag as a buy-in for that behaviour
> 
> If we’re looking for a capability based control, could we tie that up to
> FEAT_MTE_PERM? That’s what I did here:
> 
> https://lore.kernel.org/all/20250110110023.2963795-1-aneesh.kumar@kernel.org
> 
> That patch set also addresses the issue mentioned here. Let me know if
> you think this is a better approach

From the patch linked above:

| @@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
|  		if (!vma)
|  			break;
| 
| -		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
| +		if (kvm_has_mte(kvm) &&
| +		    !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) {
|  			ret = -EINVAL;
|  			break;
|  		}

we also have the same ABI change every time FEAT_MTE_PERM is present.
TBH, I'd rather have it from the start as per the patch in this thread,
irrespective of FEAT_MTE_PERM. I'm fine, however, with better exit to
VMM information though.

If we don't want to confuse the VMMs, we could skip the
kvm_vma_mte_allowed() check only for VM_ALLOW_ANY_UNCACHED and
VM_PFNMAP vmas, maybe the latter only with FEAT_MTE_PERM. I don't think
the VMM would get it wrong here since a VFIO mmap() would not support
MTE anyway.

-- 
Catalin

