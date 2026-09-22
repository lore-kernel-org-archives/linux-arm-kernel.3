Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D014FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aai3CsCP6YioLAW5MeiIsLHvBjwFsN0GGOUwY/D/HGM=; b=mj6cuHhqOqlK1AaPXLgc4pDzub
	63BVmIVdPk3yC2SwzjoCo3YxNWygx9sffW4TRfmdYGrquqqOPDPbIgEHHN/r0dMXbxOLlS79gqYjy
	SymCUdCwi6kxzPQmkd0hTvMHlUhuV/y/c7Df69vILsY0zqrA+84jlM9mlml7VY26qJK5EiExQDQYs
	Dqvx7h5FOx7KunAxPC62gpExOmlETbm7Z+rAYK0jtqHtgEoFmxVYAFBqnGNb0BhUwBNJ13MipgAhj
	RP9OnCWa/KBIAlPt2AfNHRjDmtSQcILqLZ4Vj/1xPJunoZA+ST1bYN1txINva9Qy4CVIHhzXQkHM2
	HSPdyxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xGw-00000004zah-2h0T;
	Tue, 22 Sep 2026 09:58:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xGv-00000004zaU-2MUf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:58:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53BDC438A6;
	Tue, 22 Sep 2026 09:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE5E1F000FF;
	Tue, 22 Sep 2026 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790071125;
	bh=aai3CsCP6YioLAW5MeiIsLHvBjwFsN0GGOUwY/D/HGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Spa809y277oKylDB4yqxACYtY+WeTrUwHt95v/68/LegW4tQecygUu1j87R9Cp5vx
	 mmGPccHLIYeSB+rtabZjd7q9edEql93lGusIRdTX2FSQOUQpO7erZVHvOR9I7/33La
	 hU1Y43i2Uh1Wj+cx3uOewQON5YGra7d4Ry/2qs0PVyfTdOZ07r4yJ8v+q7W22u6KSX
	 DFUt4UP9kqqwkwK7poqxU8RNZ/K8hMGBUaAlc4m5GuMgs+lNi5qpQLCP4P0eiShGzi
	 7sQ6eI5blbL8+fxQMySE4QGl1LZvQHcn736Li52Y7CHADFGihTgBimcgnIH1iQaQF2
	 8/lAiCW2cP1AQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Jack Thomson <jackabt@amazon.com>,
	Jack Thomson <jackabt.amazon@gmail.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Leo Soares Passos <Leo.Bras@arm.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v2 00/13] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
In-Reply-To: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
Date: Tue, 22 Sep 2026 15:28:33 +0530
Message-ID: <yq5abj9p38vq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

"Lorenzo Stoakes (ARM)" <ljs@kernel.org> writes:

> This series implements the KVM stage 2 page table pre-faulting feature for
> arm64.
>

> == Foundations ==
>
> The series begins by establishing the required foundations:
>
> 1. Update kvm_s2_fault_desc to store the exception syndrome register (ESR)
>    value independently, and update all code paths to use this value
>    exclusively.
>
> This is required to generate a synthetic fault for pre-faulting without
> inadvertently obtaining an incorrect ESR from elsewhere.
>
> 2. Update kvm_s2_fault_desc to store the kvm_s2_mmu independently, and
>    update all code paths to use this value exclusively.
>
> This is similarly required to generate a synthetic fault against the
> canonical stage-2 MMU. It would make no sense for pre-faulting to modify
> nested shadow page tables, so the code must not obtain an incorrect MMU
> from elsewhere.
>
> 3. Update the abort paths that consume kvm_s2_fault_desc to also return a
>    kvm_s2_fault_result.
>
> Pre-faulting needs to know the granule size handled by the fault, so the
> abort paths must return that information.
>
> 4. Pass walk flags to kvm_pgtable_get_leaf() to allow page-table walks
>    under the MMU read lock.
>
> This is Jack's patch verbatim. It allows KVM_PGTABLE_WALK_SHARED to be used
> when walking page tables under the MMU read lock.
>
> The API permits pre-faulting to run in parallel, and the read lock prevents
> the page tables from being torn down during the walk.
>
> == Implementation ==
>
> Pre-faulting is implemented in kvm_arch_vcpu_pre_fault_memory(), which
> pre-faults the stage-2 page tables for a specific GPA (the guest IPA on
> arm64).
>
> kvm_vcpu_pre_fault_memory() calls this function for each GPA in the range
> requested by userspace through the KVM_PRE_FAULT_MEMORY ioctl.
>
> The implementation is straightforward: walk the stage-2 page tables for
> the GPA and, if it is unmapped, populate the mapping by handling a
> synthetic page fault.

 [ ... 47 lines skipped ... ] 

>
> pKVM is not supported regardless of whether the VM is protected or
> not.
>
> This is because pKVM instantiates vCPUs upon run,
>

Can pKVM instantiate the hyp vCPU during pre-faulting ?


> but pre-faulting is  typically performed before a vCPU is run.  It would be confusing and
> inconsistent to error out on non-running vCPUs but to pre-fault running
> ones.


I use KVM pre-faulting when transitioning pages from shared to private
with CoCo guest. This ensures that a trusted device can DMA to private
memory before the guest accesses it.

-aneesh

