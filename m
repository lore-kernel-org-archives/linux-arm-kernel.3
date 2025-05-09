Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A925C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKzg6Tm8zaAbtvoy/XEMcd0MdCi6ul9qDrO+BvYkWhA=; b=b094c1EYrvq89Zice3PwZAXeBq
	FLHEr5CXdAH0il8LNXYog/iWQzoYNvMExfvGWOUdISd6ecZ/+/GZozLl/ViLNZAoV4udpxGZ5glaD
	5W54KjhM4AfI7o5WWZHWg8At+4N0ZX51aK9Ijx6aYcuE3BW7KvGv3mol4CMaTVfEvFIbSYR3SAQ5s
	MTGsX20WaN9ZZyy1UZCXP/xrEMh5cMNXrli/8xqurtUN+GEXoOHBjhQYg3yHG8UcKKQbaodvYUw30
	+6dwWrztWYdcgDLa1Fy3j21AkU93AO02iztW9QZyGE/QVacL9RLORyi1mRgPJHGaJix51SN4bH//n
	DivvrCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU84-00000004jNH-1gF6;
	Fri, 09 May 2025 20:15:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPBT-000000040iz-48gn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:58:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50B921595;
	Fri,  9 May 2025 07:58:32 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEE023F58B;
	Fri,  9 May 2025 07:58:38 -0700 (PDT)
Message-ID: <03f55e7b-9629-4c8e-9483-8c626e55fe2c@arm.com>
Date: Fri, 9 May 2025 15:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v6 1/3] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
 catalin.marinas@arm.com, jean-philippe@linaro.org, robin.murphy@arm.com,
 joro@8bytes.org, akpm@linux-foundation.org, paulmck@kernel.org,
 mark.rutland@arm.com, joey.gouly@arm.com, maz@kernel.org,
 james.morse@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
 baohua@kernel.org, david@redhat.com, ioworker0@gmail.com, jgg@ziepe.ca,
 nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, kevin.tian@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20250428153514.55772-2-miko.lenczewski@arm.com>
 <20250428153514.55772-4-miko.lenczewski@arm.com>
 <20250506142508.GB1197@willie-the-truck>
 <78fec33d-fe66-4352-be11-900f456c9af3@arm.com>
 <20250509134904.GA5707@willie-the-truck>
 <9bb94fe8-d605-49b4-91f0-0ad6d527b320@arm.com>
 <20250509142852.GA5845@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250509142852.GA5845@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_075844_113278_C055C45A 
X-CRM114-Status: GOOD (  41.89  )
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

On 09/05/2025 15:28, Will Deacon wrote:
> On Fri, May 09, 2025 at 03:16:01PM +0100, Ryan Roberts wrote:
>> On 09/05/2025 14:49, Will Deacon wrote:
>>> On Tue, May 06, 2025 at 03:52:59PM +0100, Ryan Roberts wrote:
>>>> On 06/05/2025 15:25, Will Deacon wrote:
>>>>> On Mon, Apr 28, 2025 at 03:35:14PM +0000, Mikołaj Lenczewski wrote:
>>>>>> +static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int scope)
>>>>>> +{
>>>>>> +	if (!IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT))
>>>>>> +		return false;
>>>>>> +
>>>>>> +	if (scope & SCOPE_SYSTEM) {
>>>>>> +		int cpu;
>>>>>> +
>>>>>> +		/*
>>>>>> +		 * We are a boot CPU, and must verify that all enumerated boot
>>>>>> +		 * CPUs have MIDR values within our allowlist. Otherwise, we do
>>>>>> +		 * not allow the BBML2 feature to avoid potential faults when
>>>>>> +		 * the insufficient CPUs access memory regions using BBML2
>>>>>> +		 * semantics.
>>>>>> +		 */
>>>>>> +		for_each_online_cpu(cpu) {
>>>>>> +			if (!cpu_has_bbml2_noabort(cpu_read_midr(cpu)))
>>>>>> +				return false;
>>>>>> +		}
>>>>>
>>>>> This penalises large homogeneous systems and it feels unnecessary given
>>>>> that we have the ability to check this per-CPU. 
>>
>> In case you didn't spot it, cpu_read_midr() is not actually reading a remote
>> cpu's midr. It's reading the cached midr in a per-cpu data structure. So I don't
>> think this will be very expensive in reality. And it's only run once during boot...
>>
>> static inline unsigned int cpu_read_midr(int cpu)
>> {
>> 	WARN_ON_ONCE(!cpu_online(cpu));
>>
>> 	return per_cpu(cpu_data, cpu).reg_midr;
>> }
> 
> I know it's not reading a remote MIDR, that would be crazy :)
> 
> But iterating over per-cpu variables sucks and we should be able to avoid
> it because this code already knows how to detect features locally.
> 
>>
>>> Can you use
>>>>> ARM64_CPUCAP_BOOT_CPU_FEATURE instead of ARM64_CPUCAP_SYSTEM_FEATURE
>>>>> to solve this?
>>>>
>>>> We are trying to solve for the case where the boot CPU has BBML2 but a secondary
>>>> CPU doesn't. (e.g. hetrogeneous system where boot CPU is big and secondary is
>>>> little and does not advertise the feature. I can't remember if we proved there
>>>> are real systems with this config - I have vague recollection that we did but my
>>>> memory is poor...).
>>>>
>>>> My understanding is that for ARM64_CPUCAP_BOOT_CPU_FEATURE, "If the boot CPU
>>>> has enabled this feature already, then every late CPU must have it". So that
>>>> would exclude any secondary CPUs without BBML2 from coming online?
>>>
>>> Damn, yes, you're right. However, it still feels horribly hacky to iterate
>>> over the online CPUs in has_bbml2_noabort() -- the cpufeature framework
>>> has the ability to query features locally and we should be able to use
>>> that. We're going to want that should the architecture eventually decide
>>> on something like BBML3 for this.
>>
>> For BBML3, we're looking for a minimum value in the BBM field of the FFMR, and
>> in that case the framework can handle it nicely with
>> ARM64_CPUCAP_SYSTEM_FEATURE. But the framework doesn't have any support for the
>> case where we need to look at all the midrs. So Suzuki came up with this method.
>>
>> If/when we have BBML3 I was thinking we could retrospectively treat the CPUs in
>> the midr list as having an erratum that they don't advertise BBML3 when they
>> should (since the semantics are basically the same I expect/hope/have been
>> trying to ensure), so we can just implement workarounds to make it look like
>> they do have BBML3, then the framework does it's thing. Perhaps we can live with
>> this hack until we get to that point?
> 
> I think if you want to go down that route, then this needs to be detected
> locally on each CPU.

Yes that's my point; once we have BBML3 it will be detected locally for each CPU
because the framework can handle that for MMFR fields. But until we get there,
we are stuck with a midr list.

> 
>>> What we have with BBML2_NOABORT seems similar to an hwcap in that we only
>>> support the capability if all CPUs have it (rejecting late CPUs without it
>>> in that case) but we can live without it if not all of the early CPUs
>>> have it. Unlikely hwcaps, though, we shouldn't be advertising this to
>>> userspace and we can't derive the capability solely from the sanitised
>>> system registers.
>>
>> Agreed.
>>
>>>
>>> I wonder if we could treat it like an erratum in some way instead? That
>>> is, invert things so that CPUs which _don't_ have BBML2_NOABORT are
>>> considered to have a "BBM_CONFLICT_ABORT" erratum (which we obviously
>>> wouldn't shout about). Then we should be able to say:
>>>
>>>   - If any of the early CPUs don't have BBML2_NOABORT, then the erratum
>>>     would be enabled and we wouln't elide BBM.
>>>
>>>   - If a late CPU doesn't have BBML2_NOABORT then it can't come online
>>>     if the erratum isn't already enabled.
>>
>> That's exactly the policy that this cludge provides. But it's using the midr to
>> check if the CPU has BBML2_NOABORT. I'm not sure I follow your point about a
>> "BBM_CONFLICT_ABORT" erratum?
> 
> I was hoping that it would mean that each CPU can independently determine
> whether or not they have the erratum and then enable it as soon as they
> detect it. That way, there's no need to iterate over all the early cores.

OK, I don't understand the framework well enough to fully understand your
suggestion; I'll talk to Suzuki and have a dig through the code.

Thanks for the review!
Ryan

> 
>> I'm also at a massive disadvantage because I find the whole cpufeatures
>> framework impenetrable :)
>>
>> I'll ping Suzuki to see if he can chime in here.
> 
> Thanks,
> 
> Will


