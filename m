Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A0DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWUlN+PLbCzxft2sKwGO0cj3md4o98/347iPuW6hek4=; b=G6RpYUOsNFoTvNTolJhbGrPUBJ
	Ax54geyCGNQG0ehwmYgobWmED6ydfrjn4XHQmM7H8tXj6vo0hZpHpQpjV5LxxVJGF9wrNo2gKL/4K
	emnZonvs4OouWBHhMvaGDh1mtNmdxIIGJTPxeHrngu6EBJL8zsTfrr/SAIV8q2PVKQcoUK1DUvFL9
	U9lhSAdeA69PLiGMM8HWue/+q4th+1UnCZc4QsZ+0Tx1FI0Y7kRAnp9G3MI3tz8TKmk0m0hawMYOs
	QAhxiOwS2e9oSG2JlbomtpNRDTP0j+C67msutMjzruDnDxF0p1UphGkH3xMM2WR9/bUy6DEsZkDqX
	B8pGGdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQeN-00000009Wdi-3Iiw;
	Sun, 05 Jul 2026 17:29:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQeL-00000009WdD-0cCK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:29:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 211DC1D31;
	Sun,  5 Jul 2026 10:28:53 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7F823F85F;
	Sun,  5 Jul 2026 10:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783272537; bh=Nn0UY7IDrPjzK/lXT6hguEQXCE8OQUIxdHe1hkL3bKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UhAXijQpiBPuV/526F+dgHXeewqd+rhE/0ewe7SMKY2NdsUbGa3MDQarqJqwajpoW
	 gob92GGdy8vh446kYIK1GNLd0ujz4aqmZLrINbKA8uyKC3puWkFsJwRkoFaH2MC9+6
	 MMD4uYgBBwDIkCkphsL5mdaZopYvLGNU6eaDljFU=
Date: Sun, 5 Jul 2026 18:28:36 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Tangnianyao <tangnianyao@huawei.com>, Marc Zyngier <maz@kernel.org>, 
	oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: "guoyang (C)" <guoyang2@huawei.com>, 
	"huanglingyan (A)" <huanglingyan2@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>
Subject: Re: Question about the "TLBs and I-cache are private to each vCPU"
 guarantee with VTTBR_EL2.CnP
Message-ID: <xx4obnrmf6lp5dbyo2uwn4pglq7q5nw7ccoyude4zavrgejctg@ll25qpga7qef>
References: <e85b957d-c8bc-aac0-b413-03441d05c3df@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e85b957d-c8bc-aac0-b413-03441d05c3df@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_102901_345039_0A508D5F 
X-CRM114-Status: GOOD (  23.77  )
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

Hi,

Let me try to answer this:

On Sat, Jul 04, 2026 at 03:45:56PM +0800, Tangnianyao wrote:
> Hi, all
> 
> I'm trying to understand the TLB and I-cache invalidation in
> `kvm_arch_vcpu_load()` that is intended to "guarantee that both TLBs and
> I-cache are private to each vCPU".
> 
> As I understand it, when `VTTBR_EL2.CnP == 1`, `__kvm_flush_cpu_context()`
> only performs a local TLB and I-cache invalidation, which does not seem
> sufficient to guarantee that property.
> 
> In fact, even if the invalidation were extended to the Inner Shareable
> domain, it still seems difficult to guarantee “TLBs and I-cache are
> private to each vCPU”, when `VTTBR_EL2.CnP == 1`, as long as multiple
> vCPUs from the same VM may be running concurrently on different PEs.

I think you have missed that when 2 stages are involved, both stages
have to set CnP == 1 in order to share TLB entries (Arm ARM R_ZVRZW).
So if TLB entry sharing happens, the guest kernel must have allowed it
in the first place (by setting TTBR0/1_EL1.CnP == 1), hence accidental
sharing that you are worried about won't happen.

__kvm_flush_cpu_context() is solving problems that occur when multiple
vCPUs of a VM are multiplexed on a single physical CPU.

> 
> So I have two questions:
> 
> 1. What is the rationale behind the comment that "guarantee that both TLBs
> and I-cache are private to each vCPU"?

I assume you are asking why keeping both TLBs and I-cache private per
each vCPU is required. The fundamental answer is that each physical CPU
is expected to have its own TLB and I-cache, so we must uphold that
property for vCPUs as well. vCPUs can be scheduled on the same physical
CPU, and use the same physical TLB/I-cache, obviously, so extra
invalidations need to be done.

As for how this can go wrong without __kvm_flush_cpu_context(), you can
look at commit 94d0e5980d67 ("arm/arm64: KVM: Perform local TLB
invalidation when multiplexing vcpus on a single CPU") and commit
01dc9262ff57 ("VM: arm64: Ensure I-cache isolation between vcpus of a
same VM"). The commit messages and the linked thread explained the
problems pretty well for me.

> 2. Should the effect of `VTTBR_EL2.CnP` be taken into account when
> reasoning about this guarantee?

Please see the first part of the answer.

Hope this helps!

Thanks,
Wei-Lin Chang

> 
> Thanks
> Nianyao Tang
> 

