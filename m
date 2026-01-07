Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0951ED0D145
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvrNfQ5ZK0gxsmbD5PcSDWK+cO5x+iJha8St6cmcRNg=; b=NZdhUMgaR7cgeH2bNSyLgn4+MZ
	om0COzXkOlhs9EclJMGvpxx6bmbNHm6lciEgcNcX3Kx2PXk17e3cO64NE+e5BfM450Ud7o5seGDDH
	NorHu8Hj81CxLI56LVNJBl+X1GJ9xd0fty/JmLwMamaBkJsCZScl4rvWgsvqkeeKkQUJ868ky6n++
	QZQaDtqTS7FhfGY+x1xyWLXoOHMcWnwJ7dhud3ee4KlDs94VUZB7gGGoQ264B/RrVxsg7jFvEz2UG
	tVwh9dfi3Ly9VW6Nqd52VAqHIXG2bU1ehBIUjUd2dTO5FDy0B2yUWLmWiZzp1bW9sol4cnBGRj12i
	1RKHrL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXlB-0000000FPcR-1JJW;
	Wed, 07 Jan 2026 17:55:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXl9-0000000FPbU-3WFR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Jan 2026 17:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NvrNfQ5ZK0gxsmbD5PcSDWK+cO5x+iJha8St6cmcRNg=; b=GVqRnTvCkdCDnItkZEA2mO3l24
	A6yB7jFK1NWPGS/ACeHBu7I11beR0PP0+USg8/0SNmRkEba08E0y025mC4YOvkpfyxt/pWeCdQ2oE
	76/+MHGFNAsbR+5r5Pv39ru14uAzkCeFzV1uYO4bVuhqJ6diHsom5ucHs+fgplObsO/COF82qOAKc
	PnBmm8xG/wZklbHvCCn+uaaV6UcCA6WP2v9Q1/o5/W8qjYyZoeuRf0a8Qx7tYWYqBUFndy7I9AjHZ
	rpV7F+KHNiPNb5Xk4I0v+93wqwP/LTcB1vQQXY4Il7hmmhBi4lTOANI8odMccbnLZ+OCCNApA5jpP
	ueyTx62Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXl6-0000000BpvB-0S3P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 17:55:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F046497;
	Wed,  7 Jan 2026 09:55:38 -0800 (PST)
Received: from [10.57.48.49] (unknown [10.57.48.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1A763F5A1;
	Wed,  7 Jan 2026 09:55:42 -0800 (PST)
Message-ID: <7cd7b4f0-7aa5-4ca0-adc6-44d968c1ed48@arm.com>
Date: Wed, 7 Jan 2026 17:55:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Workaround for SI L1 downstream
 coherency issue
To: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Lucas Wei <lucaswei@google.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 sjadavani@google.com, kernel test robot <lkp@intel.com>,
 stable@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, smostafa@google.com
References: <20251229033621.996546-1-lucaswei@google.com>
 <87o6ndduye.wl-maz@kernel.org> <aV6K7QnUa7jDpKw-@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aV6K7QnUa7jDpKw-@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_175548_924871_CD40A573 
X-CRM114-Status: GOOD (  31.44  )
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

On 2026-01-07 4:33 pm, Will Deacon wrote:
> Hey Marc,
> 
> On Thu, Jan 01, 2026 at 06:55:05PM +0000, Marc Zyngier wrote:
>> On Mon, 29 Dec 2025 03:36:19 +0000,
>> Lucas Wei <lucaswei@google.com> wrote:
>>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>>> index 8cb3b575a031..5c0ab6bfd44a 100644
>>> --- a/arch/arm64/kernel/cpu_errata.c
>>> +++ b/arch/arm64/kernel/cpu_errata.c
>>> @@ -141,6 +141,30 @@ has_mismatched_cache_type(const struct arm64_cpu_capabilities *entry,
>>>   	return (ctr_real != sys) && (ctr_raw != sys);
>>>   }
>>>   
>>> +#ifdef CONFIG_ARM64_ERRATUM_4311569
>>> +static DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
>>> +static int __init early_arm_si_l1_workaround_4311569_cfg(char *arg)
>>> +{
>>> +	static_branch_enable(&arm_si_l1_workaround_4311569);
>>> +	pr_info("Enabling cache maintenance workaround for ARM SI-L1 erratum 4311569\n");
>>> +
>>> +	return 0;
>>> +}
>>> +early_param("arm_si_l1_workaround_4311569", early_arm_si_l1_workaround_4311569_cfg);
>>> +
>>> +/*
>>> + * We have some earlier use cases to call cache maintenance operation functions, for example,
>>> + * dcache_inval_poc() and dcache_clean_poc() in head.S, before making decision to turn on this
>>> + * workaround. Since the scope of this workaround is limited to non-coherent DMA agents, its
>>> + * safe to have the workaround off by default.
>>> + */
>>> +static bool
>>> +need_arm_si_l1_workaround_4311569(const struct arm64_cpu_capabilities *entry, int scope)
>>> +{
>>> +	return static_branch_unlikely(&arm_si_l1_workaround_4311569);
>>> +}
>>> +#endif
>>
>> But this isn't a detection mechanism. That's relying on the user
>> knowing they are dealing with broken hardware. How do they find out?
> 
> Sadly, I'm not aware of a mechanism to detect this reliably at runtime
> but adding Robin in case he knows of one. Linux generally doesn't need
> to worry about the SLC, so we'd have to add something to DT to detect
> it and even then I don't know whether it's something that is typically
> exposed to non-secure...
> 
> We also need the workaround to be up early enough that drivers don't
> run into issues, so that would probably involve invasive surgery in the
> DT parsing code.

Indeed even if we did happen to know where the interconnect registers 
are, I'm not sure there's any ID bit for the relevant configuration 
option, plus that still wouldn't be accurate anyway - it's fine to have 
a downstream cache/PoS *without* any back-door observers, so the actual 
problematic condition we need to detect is outside the SI IP altogether. 
It's a matter of SoC-level integration, so AFAICS the realistic options 
are likely to be:

  - SMCCC SOC_ID (if available early enough)
  - Match a top-level SoC/platform compatible out of the flat DT
  - Just trust that affected platforms' bootloaders will know to add the 
command-line option :/

>> You don't even call out what platform is actually affected...
> 
> Well, it's an Android phone :)
> 
> More generally, it's going to be anything with an Arm "SI L1" configured
> to work with non-coherent DMA agents below it. Christ knows whose bright
> idea it was to put "L1" in the name of the thing containing the system
> cache.

I'm still thankful the Neoverse product line skipped "MMU S1" and "MMU 
S2"...

>> The other elephant in the room is virtualisation: how does a guest
>> performing CMOs deals with this? How does it discover the that the
>> host is broken? I also don't see any attempt to make KVM handle the
>> erratum on behalf of the guest...
> 
> A guest shouldn't have to worry about the problem, as it only affects
> clean to PoC for non-coherent DMA agents that reside downstream of the
> SLC in the interconnect. Since VFIO doesn't permit assigning
> non-coherent devices to a guest, guests shouldn't ever need to push
> writes that far (and FWB would cause bigger problems if that was
> something we wanted to support)
> 
> +Mostafa to keep me honest on the VFIO front.

I don't think we actually prevent non-coherent devices being assigned, 
we just rely on the IOMMU supporting IOMMU_CAP_CACHE_COHERENCY. Thus if 
there's an I/O-coherent SMMU then it could end up being permitted, 
however I would hope that either the affected devices are not behind 
such an SMMU, or at least that if the SMMU imposes cacheable attributes 
then that prevents traffic from taking the back-door path to RAM.

Thanks,
Robin.

