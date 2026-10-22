Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC95606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kxmmBXYJ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hEObLniC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CvCWEqXaZH/iIUkBgP+o8Ay2lvbiOFHenVSVWHTDnio=; b=kxmmBXYJKPJ0J8
	RbKni0GjQplL6e/5nKlT7SbGPuRGVEcqOFhfaSvnzfNcuC/H7qZ+4Rch+zSjG1TADkYOZ71kzDs7X
	muyKq5IlfMkafO5yUQoUr/xAhhZo0Tl4W/ClDmFXan0VhQj/xNDeiCDYq97/JGmO81k07n0iucETZ
	hSR+1Og0PRIW7YqbRrlRaeByNbNyIoTJHDHuokdgsSvIritg9Qg0YlduWAYuGaMSiJCHzRRw7jmo0
	KlfBH5+t79T+hVTQ/tEaBfgWpdgezhQK7beEdHqc173UGdFmgJdoGGZcWAY+qFPEXNJEKi/FnK/+N
	6vZDqgqpOE47hHdBykyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoKm-0000000Dk3o-1Fbo;
	Thu, 22 Oct 2026 08:39:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoKg-0000000Dk3I-1FHr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:39:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD9062C46;
	Thu, 22 Oct 2026 01:39:21 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE8D93F673;
	Thu, 22 Oct 2026 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792658365; bh=uD8Z+VnaxokujgVMBewvc6O/2Oc94t5bbNpab8XT2Mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hEObLniCfO8tvUEME++blEmza9btcaiRUMVFVtYl9TdDINt/Jh+KSuOXaWp/rKmlo
	 WUhI/MoxamaYnryozypEz5akzYCHQwBT1DP41jmVMtmfcNM9rOY0pgG75S1zir53qf
	 PQfmGihfe1dbVdN8Zrb0zomrdSqiyDwI9lvPy+WU=
Message-ID: <4a086f49-14a3-43a9-ba9b-ab387f5e7f91@arm.com>
Date: Thu, 22 Oct 2026 09:39:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
 yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
 <araketG70TIKeNuf@arm.com> <12e83d88-de4c-4230-aac2-1796123320ad@arm.com>
 <70d47475-e26e-40e1-b409-b0c16aecb8c0@arm.com>
 <195cdfe4-a55a-453f-9c34-620738eca244@arm.com> <arqrZ_Auk9BYOopa@arm.com>
 <0f68dcff-1dfe-4515-9912-515ca6457674@arm.com> <arudWVBPXcnUvYNh@arm.com>
 <5d487949-9195-442f-97af-acb9e3fdfb0d@arm.com> <86ld7ryvm8.wl-maz@kernel.org>
 <atj7A1CV4paW3htS@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <atj7A1CV4paW3htS@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_013932_741875_93A21ECC 
X-CRM114-Status: GOOD (  24.41  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/2026 18:48, Catalin Marinas wrote:
> On Wed, Oct 21, 2026 at 03:30:07PM +0100, Marc Zyngier wrote:
>> On Wed, 21 Oct 2026 10:58:13 +0100,
>> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>>
>>> On 29/09/2026 12:15, Catalin Marinas wrote:
>>>> On Mon, Sep 28, 2026 at 07:28:20PM +0100, Suzuki K Poulose wrote:
>>>>> On 28/09/2026 19:01, Catalin Marinas wrote:
>>>>>> possible, to defer the RMM activation until the first user (still do the
>>>>>> RMI probing as an initcall). If we run on RME-capable hardware and
>>>>>> firmware but don't care about realms or TSM, we still get the normal OS
>>>>>> functionality.
>>>>>
>>>>> Would you prefer this in the first drop of the RMM ? Or is this
>>>>> something we could add as a separate series ?
>>>>
>>>> I think we could add the deferring as a separate patch, maybe together
>>>> with the KVM bits. An advantage of keeping it here if we merge this
>>>> first is that we still exercise the activation path without full realm
>>>> support or TSM. Otherwise a lot of this would be dead code until the
>>>> other series arrive. Either way, do it as as separate patch on top of
>>>> this series.
>>>>
>>>
>>> I have been looking at the "on-demand" activation support and came
>>> across the following design decision.
>>>
>>> * We have KVM_CAP_ARM_RME which advertises that KVM can create Realm VMs
>>>    to the userspace. A VMM could check this before it creates a Realm VM
>>>    using KVM_CREATE_VM with type=RealmVM.
>>>
>>>
>>> Now, we could delay the RMM activation as late as the KVM_CREATE_VM and
>>> kick it off while we initialise the kvm as part of kvm_arch_init_vm().
>>> But if that fails, we would fail the KVM_CREATE_VM.
>>>
>>> The question is, what should KVM_CAP_ARM_RME indicate ?  We could
>>> initially enable the cap based on the presence of RMM (but not
>>> activated). However, should we turn the KVM_CAP_ARM_RME=off when we
>>> fail to activate the RMM ? Is that senisble ? (i.e., runtime
>>> disabling a cap).
>>
>> I think this sets a bad precedent. If activation can fail, KVM end-up
>> not delivering on the promise that it makes, and that's not great.
>>
>> My take is that the least surprising behaviour is best. If you have
>> bought into the CCA kool-aid by enabling it on the kernel command
>> line, that's not by accident. You expect your VMs to reliably be
>> created when KVM tells you that CCA is available.
>>
>> So KVM_CAP_ARM_RME should indicate whether the RMM has been
>> successfully activated, and nothing else.
> 
> Tying activation to kvm-arm.mode=rmm works for me, roughly similar to
> kvm-arm.mode=protected. It's still an eager activation (just
> conditional) and KVM_CAP_ARM_RME then only reports whether activation
> succeeded. We lose kexec/hibernation but that's fine, it was explicitly
> requested on the command line.

Thank you both, I will tie the activation to kvm init, gated on the
kvm-arm.mode.

> 
> There's also the case of a host-only PCIe TSM (without realms). IIUC
> (grep'ing FIRME spec) on an RME system IDE key programming goes via the
> RMM, so this would need the RMM activated even without KVM. Not sure it
> makes sense without realms, so I think we can ignore it until there's a
> concrete use case (and add one more hook to activate the RMM).

We could, again gate this on kvm-arm.mode. RMM is not useful without
the capability to run realms. The dependency is the other way around.
If an RMM exists and would be used for any other device TSM, then it
should act as the TSM for all devices, to make sure we have a single
TSM managing the IDEs (and the SPDM connections).

So, tying this again to the kvm-arm.mode=rmm, i.e., the capability
to run Realms makes sense to me. Thoughts ?

Suzuki
> 


