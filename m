Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9202DC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ElYCabE+oSSO7+72LtyaYucev5G72zfKCRPckt/Ke0=; b=Ryy3a+ycczaxdbmzrei89OOc/j
	KVwCJbg5/MDTDU7xxoUTkR1XvJPfjYqLunp94e3qH3Om3TXBmFyW7itKB+3HN7YubQ//DwsxEov0P
	7lss4ToEAb09yIDhBUEF4jB3RBCjG51YMc7peJTPUIU+KpiJ9mQpnaMgbrwTNghpvvw/njEkdEeky
	KbZN1dkjeFo76LKktt9cEMHgA/Mg4a5+3KL+pZt0ND45rrUZTyDWUzVnHBxSl9Gy8x+S5G4LSwGCP
	y1woPHLuRa8XLd8A4RNDRbQuPOLtcJ/g81Fj1f6GcHJqCuMQnFIp9xYgaaTYXMa0PGbWoSf7Yv4Vq
	01AclUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAA4a-0000000E6Lj-0VQs;
	Fri, 25 Sep 2026 17:51:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAA4X-0000000E6LB-03qv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 17:50:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 571AE169C;
	Fri, 25 Sep 2026 10:50:51 -0700 (PDT)
Received: from [10.57.10.17] (unknown [10.57.10.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9350F3F632;
	Fri, 25 Sep 2026 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790358654; bh=U/3AEvhYN3bQ45ip9yZFKLNi4yGIFwSVeEPN9JGNLek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dFZk2SzPVDQgWnnh4XxPw2GQ/FPJzzTgl+TPEKAtdhxC1UETQXiQp8awi2r/92qSe
	 EAU5BkUHqy0hNZw48kmRVAINYUnWkycHwuINFqNeWr8H/Alr/UhB1hnmesJNlaANuu
	 XtkgONeVIEa4++XxO6ir+TGmuhrvZCO2vBo48tfk=
Message-ID: <12e83d88-de4c-4230-aac2-1796123320ad@arm.com>
Date: Fri, 25 Sep 2026 18:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com> <arZmXFw5Jw2IbAmA@arm.com>
 <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com> <araketG70TIKeNuf@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <araketG70TIKeNuf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_105057_155699_10A14669 
X-CRM114-Status: GOOD (  29.24  )
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

Hi Catalin

On 25/09/2026 17:42, Catalin Marinas wrote:
> On Fri, Sep 25, 2026 at 04:02:24PM +0100, Suzuki K Poulose wrote:
>> On 25/09/2026 13:17, Catalin Marinas wrote:
>>> On Thu, Sep 24, 2026 at 02:51:59PM +0100, Suzuki K Poulose wrote:
>>>> From: Steven Price <steven.price@arm.com>
>>>>
>>>> Activate the RMM after the basic configuration. This is a memory
>>>> transferring stateful operation.
>>>>

...

>>>> +
>>>> +	ret = rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
>>>> +	if (ret) {
>>>> +		pr_err("RMM activate failed (%d)\n", ret);
>>>> +		ret = ret < 0 ? ret : -ENXIO;
>>>> +	}
>>>> +
>>>> +	return ret;
>>>
>>> It was raised earlier this year [1] but I'm not sure it concluded. How
>>> do we handle kexec and kdump? I think RMI_RMM_DEACTIVATE only succeeds
>>> if nothing is delegated, so it would need all realms torn down first. If
>>> that's not feasible, we could at least block (non-crash) kexec like pKVM
>>> does.
>>
>> You are right, we can't DEACTIVATE until all granules have been
>> "undelegated" back. Not just the Realms, but also the GPTs/Tracking
>> Metadata etc would need to be reclaimed (when we get to support
>> dynamic GPT/Tracking metadata). For now, we should block the kexec.
> 
> Looking more into this (and the memory hotplug story), I find it strange
> that simply having RME and a valid RMM imposes all these restrictions
> even if we never run or intend to run a realm. How common will
> RME-capable systems with RMM firmware be that are not used for CoCo? Or
> do we expect only CoCo systems to have capable/configured firmware (RME
> may be present in silicon anyway)?

There is another angle to this :

RMM may act as a TSM (as in the Trusted Security Manager in PCI TDISP)
context and provide setting up IDE connection between the RootPort/
EndPoint. So, the trigger point for the RMM activation would become the 
"First Delegate" request.

Running an RMM just for the "TSM" functionality is not ideal.
In the absence of RMM, Linux can act as the baremetal TSM. But when the
RMM is present, we must use the RMM as the TSM, especially if the
Device will be assigned to a Realm.

FEAT_RME capable systems don't need to enable RMM unless they want to
run CoCo guests.

> 
> Ideally we'd defer the RMM configuration and activation (and the
> tracking/GPT checks) until we first attempt to start a realm, keeping
> only the RMI_VERSION/FEATURES probing at boot. Not sure how feasible
> this is (memory is more fragmented by then for any contiguous donation).
> If we manage it, kexec and memory hotplug just work on hosts that never
> start a realm.
> 
> The next best thing for kexec is to tear down the realms, undelegate
> the granules and deactivate the RMM before invoking kexec (with kdump
> that's harder as we likely no longer have a controlled shutdown).

This is quite complicated, when we get the dynamic metadata support,
especially with the self-describing L1GPT and Tracking metadata.
But not impossible.

> 
> Similarly with memory hotplug, allow it if we haven't started any realms
> and refuse realm creation afterwards if untracked memory was onlined.
> Also, if the memory is onlined to ZONE_MOVABLE, neither guest_memfd nor
> the kernel allocations we delegate come from there, so we could allow
> it even with realms running.

I will double check this.

> 
>>> Kdump gets even more interesting if it starts accessing delegated pages
>>> and getting GPF.
>>>
>>> [1] https://lore.kernel.org/r/CABpDEukEO4Y_fg8fv5Nr1_Pw_qOK=2UmioXk=WyPEzoEprPcGA@mail.gmail.com
>>
>> Kdump may be a bit more easier, as the kdump kernel is supposed to use
>> the "reserved" region and vmcore access could handle the GPF and
>> provide "0"s to the reader ? May be this is one case where the
>> host needs to be able to handle GPFs.
> 
> Yes, I think so. I now realised that metadata delegation to the RMM
> doesn't come from guest_memfd, so that's another case not helped by the
> old series to unmap guest_memfd from the linear map. I'll reply to the
> GPF thread.

Ok, lets discuss on that thread.

Cheers
Suzuki



