Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A67FED9EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB+uCcFAXOshYh+MB8f6XacJ/BFUkrFfAbj0tIlciyQ=; b=UA8WnG4MCzqqT+cHqoRrRAhGks
	2LxMWVFQ/FqReRvJMnQgelbpWM6bQ9Io1YPoGcwLAICSNTt+a0P10gxCEGgDM4cqRB7HBloARBdRt
	bEhyvuP/ysaH6/ss9Qhti4k5xNc/5qXIGVqLOImURtbvw9hmtIeGGYAU5Eo15ZFy/YtpDceV2UeOM
	VDW087KpG2xHNp2kODvZpJje6Lc6WeHog75t0vx1GMsD8PHQFZZGewHxejyRvbf0ev9QF+138whu1
	pZOJMm7ZGEHliEJD6s0Gqz1XUmV8X0Bobz9CpDA9JxsB/pesp2D/+CPU806NrnsLNsIFFucuBjG+8
	vhYXyAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XpW-00000006sts-17Sb;
	Tue, 17 Mar 2026 17:03:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XpU-00000006stL-2TQf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:03:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C35171477;
	Tue, 17 Mar 2026 10:03:31 -0700 (PDT)
Received: from [10.57.20.100] (unknown [10.57.20.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80E293F778;
	Tue, 17 Mar 2026 10:03:36 -0700 (PDT)
Message-ID: <65fd6905-f753-41cd-8ce5-c788ef67e748@arm.com>
Date: Tue, 17 Mar 2026 17:03:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] KVM: arm64: More user_mem_abort() rework
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260316175451.1866175-1-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_100340_679017_E29D7447 
X-CRM114-Status: GOOD (  14.45  )
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

On 16/03/2026 17:54, Marc Zyngier wrote:
> Piqued by Fuad's initial set of patches[1] splitting user_mem_abort()
> into more "edible" functions, I've added my on take on top of it with
> a few goals in mind:
> 
> - contextualise the state by splitting kvm_s2_fault into more granular
>    structures
> 
> - reduce the amount of state that is visible and/or mutable by any
>    single function
> 
> - reduce the number of variable that simply cache state that is
>    already implicitly available (and often only a helper away)
> 
> I find the result reasonably attractive, and throwing it at a couple
> of machines didn't result in anything out of the ordinary.

Indeed a very nice cleanup both of you ! Thanks for making this
pleasing to the eyes and easier to reason about.

FWIW:

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> 
> For those interested, I have stashed a branch at [2], and I'd
> appreciate some feedback on the outcome.
> 
> [1] https://lore.kernel.org/all/20260306140232.2193802-1-tabba@google.com/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=hack/user_mem_abort-rework
> 
> Marc Zyngier (17):
>    KVM: arm64: Kill fault->ipa
>    KVM: arm64: Make fault_ipa immutable
>    KVM: arm64: Move fault context to const structure
>    KVM: arm64: Replace fault_is_perm with a helper
>    KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
>    KVM: arm64: Kill write_fault from kvm_s2_fault
>    KVM: arm64: Kill exec_fault from kvm_s2_fault
>    KVM: arm64: Kill topup_memcache from kvm_s2_fault
>    KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
>    KVM: arm64: Kill logging_active from kvm_s2_fault
>    KVM: arm64: Restrict the scope of the 'writable' attribute
>    KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
>    KVM: arm64: Replace force_pte with a max_map_size attribute
>    KVM: arm64: Move device mapping management into kvm_s2_fault_pin_pfn()
>    KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
>    KVM: arm64: Simplify integration of adjust_nested_*_perms()
>    KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc
> 
>   arch/arm64/kvm/mmu.c | 428 ++++++++++++++++++++++---------------------
>   1 file changed, 223 insertions(+), 205 deletions(-)
> 


