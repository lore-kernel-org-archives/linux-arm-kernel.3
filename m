Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7ADC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1fBINfZ6JID6RqZQJ4drYuXl6tsEZyZulBDdG/NX4Q=; b=FwjWEAmD6ZVfmJbHQu0Gyh8pQr
	8x8ZY8xPi2bpb1Il3VMj9XjseKuPWDtMTu5IkgmkaQhX80WTbue55pwTtV/byrLWtBRrhB0oWEWRo
	Ueb4QjnqnM4YoDz1wYdiPCXlU7oYN+8qYJjqbGVoGk614xBchs7JDIoRzQxKiJQhtTYXZ10jS0fVt
	EExy1MXtQMDOgvsXUEPOLwIjK7Z2sP8STHPIjCjo0ON9ofFi2wCoZDbvk5ToSDfgz2+7dGMTkPXez
	pThq4bx8TshRPb1GAbMPH4ZLrfH7fqh3WiilaMFtT9QoTmI8X8t4VTib7NLeHbtu6WtZtztts829z
	YX+JoDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWYv-0000000DLlq-0yqO;
	Mon, 24 Feb 2025 11:23:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWHp-0000000DHFB-1AoN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 11:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC58D6119E;
	Mon, 24 Feb 2025 11:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551EBC4CEE6;
	Mon, 24 Feb 2025 11:05:36 +0000 (UTC)
Date: Mon, 24 Feb 2025 11:05:33 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] KVM: arm64: Drop mte_allowed check during memslot
 creation
Message-ID: <Z7xSfVME4z2ComUm@arm.com>
References: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
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

On Mon, Feb 24, 2025 at 03:09:38PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Before commit d89585fbb308 ("KVM: arm64: unify the tests for VMAs in
> memslots when MTE is enabled"), kvm_arch_prepare_memory_region() only
> rejected a memory slot if VM_SHARED was set. This commit unified the
> checking with user_mem_abort(), with slots being rejected if either
> VM_MTE_ALLOWED is not set or VM_SHARED set. A subsequent commit
> c911f0d46879 ("KVM: arm64: permit all VM_MTE_ALLOWED mappings with MTE
> enabled") dropped the VM_SHARED check, so we ended up with memory slots
> being rejected if VM_MTE_ALLOWED is not set. This wasn't the case before
> the commit d89585fbb308. The rejection of the memory slot with VM_SHARED
> set was done to avoid a race condition with the test/set of the
> PG_mte_tagged flag. Before Commit d77e59a8fccd ("arm64: mte: Lock a page
> for MTE tag initialization") the kernel avoided allowing MTE with shared
> pages, thereby preventing two tasks sharing a page from setting up the
> PG_mte_tagged flag racily.
> 
> Commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag
> initialization") further updated the locking so that the kernel
> allows VM_SHARED mapping with MTE. With this commit, we can enable
> memslot creation with VM_SHARED VMA mapping.
> 
> This patch results in a minor tweak to the ABI. We now allow creating
> memslots that don't have the VM_MTE_ALLOWED flag set.

As I commented here:

https://lore.kernel.org/r/Z4e04P1bQlFBDHo7@arm.com

I'm fine with the change, we basically go back to the original ABI prior
to relaxing this for VM_SHARED.

> If the guest uses
> such a memslot with Allocation Tags, the kernel will generate -EFAULT.
> ie, instead of failing early, we now fail later during KVM_RUN.

Nit: more like the kernel "will return -EFAULT" to the VMM rather than
"generate".

> This change is needed because, without it, users are not able to use MTE
> with VFIO passthrough (currently the mapping is either Device or
> NonCacheable for which tag access check is not applied.), as shown
> below (kvmtool VMM).

Another nit: "users are not able to user VFIO passthrough when MTE is
enabled". At a first read, the above sounded to me like one wants to
enable MTE for VFIO passthrough mappings.

> [  617.921030] vfio-pci 0000:01:00.0: resetting
> [  618.024719] vfio-pci 0000:01:00.0: reset done
>   Error: 0000:01:00.0: failed to register region with KVM
>   Warning: [0abc:aced] Error activating emulation for BAR 0
>   Error: 0000:01:00.0: failed to configure regions
>   Warning: Failed init: vfio__init
> 
>   Fatal: Initialisation failed
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/kvm/mmu.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ef53af6df6de..1f1b5aa43d2d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2178,11 +2178,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  		if (!vma)
>  			break;
>  
> -		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
> -			ret = -EINVAL;
> -			break;
> -		}
> -
>  		if (vma->vm_flags & VM_PFNMAP) {
>  			/* IO region dirty page logging not allowed */
>  			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

