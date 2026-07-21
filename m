Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B140C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfWdRZXwCZWTjpXRBjExV4qV7rFFjXzRwdQYYfQD53s=; b=wCDwWZ95yPqKzGd6IRc7AEzfP7
	gHeiirhczi81CBluSp0SMNfYhhuuCYJoYNzDFtD0EE4za50j4ZLP0DQ/1FQ5ZG6dwgWJjDgEcrABZ
	Phuu+kTSGPu2QbE3up69e9yrTlN8ZBe8AyI27ZfqKkeyeL3Ao/HDP/HjR8cwU8+R86EWMutCus05+
	HjV63Dz4dsWF3Ihl97reff/OYnqibg9Lz7A5uUNevs2RAzJJOiiM5CxbnHigPexCW6t9w/K6h/4u9
	op1Oz6QsQW7wuZgIrIk3ORI3c+755emKrMbS1SueD+moRNGz+yI9RM3pDDH5RSrcMQ6nXWRilZab7
	zMY2sqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6V4-00000008w5Z-0eU3;
	Tue, 21 Jul 2026 09:10:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6V1-00000008w4x-18lr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:10:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE4971595;
	Tue, 21 Jul 2026 02:10:43 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E9643F66F;
	Tue, 21 Jul 2026 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784625048; bh=J/TTouf1smFaZ0wJ/GLwH9QNxA9AZu7fNFGLM19UhfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kj0yFMLPYPXndUtCQvXAlYvq4RU/cOZHL44M5H8vsTft5co+1shTfNX7W37kujWnD
	 NyBEr1jK/y901NxBVRHG7yRnwSfYyztbJGAJ26h5CoAhpJCSFGIc1ve4awJ8gHy2VZ
	 lGS+l8zHYVzQ89zmHJR5LharzDNb6spmSclGNa0Y=
Date: Tue, 21 Jul 2026 10:10:43 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH v2] KVM: arm64: Reject guest_memfd memslots when the VM
 has MTE
Message-ID: <al83k-ijRGy10Qmp@raptor>
References: <20260720130942.135033-1-alexandru.elisei@arm.com>
 <864ihtfyue.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ihtfyue.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_021051_349584_81FC2BB5 
X-CRM114-Status: GOOD (  21.42  )
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

Hi Marc,

On Mon, Jul 20, 2026 at 04:46:33PM +0100, Marc Zyngier wrote:
> On Mon, 20 Jul 2026 14:09:42 +0100,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > 
> > The user cannot use MTE on VMAs created by mapping a guest_memfd file,
> > as arch_calc_vm_flag_bits() does not set VM_MTE_ALLOWED.
> > 
> > When creating a guest_memfd backed memslot,
> > kvm_arch_prepare_memory_region() rejects the memslot if MTE is enabled for
> > the VM and if guest_memfd has been mapped in a VMA that intersects the
> > memslot.
> > 
> > However, the documentation for KVM_SET_USER_MEMORY_REGION2 explicitly
> > states that the only condition for userspace_addr is for it to be a legal
> > userspace address, but the mapping is not required to be valid nor
> > populated at memslot creation.
> > 
> > If userspace sets userspace_addr to an address that hasn't been mapped, or
> > if userspace_addr belongs to a VMA that isn't backed by the guest_memfd
> > file, or if the VMA doesn't intersect the memslot, memslot creation is
> > successful and KVM ends up with a VM with MTE and guest_memfd-backed
> > memslots.
> > 
> > The same happens if the order is reversed: when userspace enables MTE, KVM
> > does not check if memslots backed by guest_memfd are already present.
> > 
> > Fix both issues by rejecting guest_memfd-backed memslots when MTE is
> > enabled, and by reject MTE when guest_memfd-backed memslots are already
> > present.
> > 
> > Fixes: 32e200bd6e44 ("KVM: arm64: Enable support for guest_memfd backed memory")
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> This looks reasonable to me, but you probably want to capture some of
> that in the documentation one way or another, because this will leave
> the amateur VMM author puzzled for a bit...

Of course, will do that in v3.

Thanks,
Alex

