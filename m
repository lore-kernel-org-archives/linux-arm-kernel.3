Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA253C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhPYci9Dt8OvtEtcy4b+McdMFRjiobjic+3G8cI6QZI=; b=qHzz3GDogQAupKTc4g/yu5oBgH
	up1DLuYx1ZKaMqqX9U9ue6teCoEL2XIUDac8J1trD6lMfiay0tscGxwGwoVxSpRZLjfkCW8bvCM0F
	DjLqpINlmN0dPmMjCIJ03PGM6/b6qkKmeBZSge8balMYq0YwYgdJ7Lzi5A84C0c3nSFBWTMormE8y
	YgFIFCjrx7eU7F3L6X4BCDwmL7mcgGtp9oHPbMfEZHSwk7gX1/9INcXW3kDKCXsSmRkffzF8hQcsk
	o+Kuy3sZh5IGojjZM9Z83BPfQsNSfG2CrDM06M//Y1QY66wgEszy5ZfZNJfOzE6ymzgNKI3YysN8M
	z3K94L7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiR3i-00000006GSo-1FlA;
	Sat, 11 Jul 2026 06:19:30 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiR3e-00000006GSS-43vW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:19:29 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66B6IoIf015927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 11 Jul 2026 15:18:50 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=jhPYci9Dt8OvtEtcy4b+McdMFRjiobjic+3G8cI6QZI=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783750731; v=1;
        b=TIktfliCWLwpd/+swlM0LiA65CD4UnKwP+vi5ebo48IQszOhpbBoisXZWlKlE/dX
         uAHImhHe1u8Zjp9F1SsNkKIkUb/AXZ9u8Z7NdTlKN2jqD5SOEswuQpbbITyDpknr
         bQMy8wc6V8eb3bRh5OuNVsh/Fytdus3Lti0kugfIaALxVXZL20RQVbBjguL04sMs
         aXEazALRVK84+npwac+koioVcBKj9dDnwEKFkIHUTtN1H8w/Ua72wDLMM7mvGBzF
         WYg5KFzUg1+rIbfhz4gWL1L0e/OW6ioPVpTinpDdvu87eF5MyhfkfpurgzIcIBhd
         q2uPRk28yyDaK3zl+/06dA==
Message-ID: <0e5e64ea-2f3c-4ce6-88ac-08b66f13027c@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 11 Jul 2026 15:18:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvgIWqBjAp_VA_A@kernel.org>
 <e03f17b2-a765-4912-adf6-3da26e7eeecd@rsg.ci.i.u-tokyo.ac.jp>
 <ak1DVUs0bgkpZh0N@kernel.org>
 <7bf6c440-5f14-4326-9800-9821adc4e2e4@rsg.ci.i.u-tokyo.ac.jp>
Content-Language: en-US
In-Reply-To: <7bf6c440-5f14-4326-9800-9821adc4e2e4@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_231927_477970_BC828D5D 
X-CRM114-Status: GOOD (  21.15  )
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

On 2026/07/08 17:32, Akihiko Odaki wrote:
> On 2026/07/08 3:20, Oliver Upton wrote:
>> On Tue, Jul 07, 2026 at 08:08:03PM +0900, Akihiko Odaki wrote:
>>> On 2026/07/07 2:04, Oliver Upton wrote:
>>>> Hi,
>>>>
>>>> On Mon, Jul 06, 2026 at 07:03:24PM +0900, Akihiko Odaki wrote:
>>>>> Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
>>>>> PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
>>>>> That covers systems where PMUv3 is absent or non-uniform, as well as
>>>>> systems where IMPDEF PMUv3 sysreg traps are unavailable.
>>>>>
>>>>> However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
>>>>> sysregs, but the pPMUs registered with KVM only cover a subset of
>>>>> possible CPUs.
>>>>>
>>>>> Reject vPMU unless the registered pPMUs cover every possible CPU.
>>>>> This avoids carrying support for partial pPMU coverage into the
>>>>> fixed-counters-only UAPI introduced later in the series.
>>>>
>>>> Doesn't CPU hotplug screw this up? I could online a CPU that doesn't
>>>> have a PMU after creating the VM.>
>>>> I'd rather just change ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to become a
>>>> system feature. That way any CPU which breaks the system-wide 
>>>> assumption
>>>> cannot be onlined.
>>>
>>> ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS only says that IMPDEF PMUv3 
>>> sysregs are
>>> trapped. It does not say that KVM has a driver-backed PMU usable for 
>>> PMUv3
>>> emulation. This patch checks that extra requirement.
>>>
>>> I re-checked CPU hotplug. Onlining a CPU without a PMU later does not 
>>> make
>>> an accepted VM unsafe, since the check is against cpu_possible_mask.
>>
>> Sorry, I missed that this was against the possible mask.
>>
>>> The problem is the reverse case on ACPI: this check can disable vPMU 
>>> when a
>>> possible CPU is offline. DT populates supported_cpus at boot, while ACPI
>>> initially populates it only from online CPUs and grows it as matching 
>>> CPUs
>>> come online.
>>>
>>> That makes this patch too conservative. In practice, I do not expect 
>>> systems
>>> to mix CPUs with and without a usable PMU. A better approach is 
>>> probably to
>>> treat such a host as out of spec and add TAINT_CPU_OUT_OF_SPEC. We 
>>> already
>>> do that for architectural PMUv3 by detecting mismatches in
>>> ID_AA64DFR0_EL1.PMUVer; we can do the same for
>>> ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS with non-standard PMUs.
>>
>> The presence of the workaround is, by definition, out of spec. I just
>> never bothered tainting the kernel because these machines are already
>> TAINT_CPU_OUT_OF_SPEC by way of the broken VGIC.
>>
>> Ok, so how about you keep the check that you're doing here and promote
>> IMPDEF_TRAPS to a system-wide feature? That would satisfy the two
>> preconditions we have for PMU emulation, which is system register traps
>> and a backing arm_pmu that understands PMUv3 events.
> 
> This check turned out to be faulty: it can disable PMU emulation on ACPI
> systems when a possible CPU is offline, because ACPI grows
> arm_pmu::supported_cpus as matching CPUs come online.
> 
> My current plan is:
> 
> - drop the possible-mask coverage check, to avoid breaking ACPI;
> - promote ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to
>    ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE, so the system will have the
>    feature only if all online CPUs implement it;
> - explicitly taint hosts with ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS,
>    matching what KVM already does for non-architectural VGICs. The
>    comment will make it clear that this is out of spec because KVM cannot
>    make the usual architectural assumptions about PMUv3 sysreg traps and
>    uniform driver-backed PMU availability.

I sent a new revision implementing these changes, but due to a rebase
mistake it was also sent as v8.

However, it still does not cover every case of non-uniform driver-backed
PMU availability. With ACPI, if a CPU is brought online whose MIDR was
not represented by any CPU online during PMU probing, the PMU code
cannot associate it with an existing arm_pmu or register a new one.
This can happen even when PMUVer is uniform across CPUs.

I therefore plan to take a simpler approach: when KVM cannot find a
registered pPMU for the vCPU's current CPU, emit a one-time warning and
set TAINT_CPU_OUT_OF_SPEC, matching the treatment of mismatched CPU
features.

Regards,
Akihiko Odaki

> 
> That lets the code keep assuming uniform PMU availability without adding 
> an ACPI-hostile possible-CPU check, and makes that assumption explicit 
> for humans like me and tools such as Sashiko [1].
> 
> [1] https://sashiko.dev/#/patchset/20260706-hybrid-v8-0- 
> de459617b59d@rsg.ci.i.u-tokyo.ac.jp?part=6
> 
> Regards,
> Akihiko Odaki
> 


