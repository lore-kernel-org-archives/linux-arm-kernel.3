Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6924C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 06:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjn7589sn0todta5MMbg+BG3V2sZPDUGxLyydNTxbQc=; b=1FljUpBhHIZPibGzvFd/ZHyP3D
	KedesNmXAQiYAo0+/+FOG0j2J/u0YsBWzm8enlaBV50+ZnPQVN7fVm4jx9iKExLOFoMEuhgTgT0jX
	9gX9mfL4yRco0Ro5iWfdi4axLfXU1CBid3ufyySsqtLFNinmfF3VXHNGu4e03JE/dziIWOuO4/lwX
	Oh7DVXHe7yuRLNbpqyFLPliHRYYwmKsQFNfz6ntiH62S0xPoy3tjJM74zbXruz5RsZ0Fao+I6K+x8
	cLnJpt68V/HrP1lzyLfbduZNstlSIv4P/pg4M2G59QYoGfhItDs5FlJhPTeR7PlkWNFjC0TpjgG+d
	kBRaKuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukczx-00000004BYY-0Kka;
	Sat, 09 Aug 2025 06:24:09 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukcxQ-00000004BOw-3PtE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 06:21:34 +0000
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5796FeEc068583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 9 Aug 2025 15:15:41 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=tjn7589sn0todta5MMbg+BG3V2sZPDUGxLyydNTxbQc=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1754720141; v=1;
        b=WakBQInh0cpfd1IgkkB74HPobXmSXxTLBu+vowlNpmhZVyQcXV5KEfxgIlhumpDg
         0mCLcq34OsW9yBbXPxv/4xNnLOWAXY5rrxZyt1yXGIENC7Inaadqn8rkDGmjYrSh
         EioPFP/iMmiWtTi9Wc7OCd8QAm0mj1UQ7Kkwkju3Vl2xl0+/pSDvbSXPPogRYVOR
         PBRddWDA3RUOKATSyOwHf9bEMlwr3wT9Gg2FN18XMXYSGwvVzVhqeLozF9q0YA4D
         +sKngJ+4IpJfvUzq0MrYGh0jrM2tZ2P42r3jPvrVbl9E3pToCF5iL+lERP20A4n0
         liPykRyaCidMaytalVSdQg==
Message-ID: <e33c21eb-d4d3-4c38-aab8-60399c7ae210@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 9 Aug 2025 15:15:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/2] KVM: arm64: PMU: Introduce
 KVM_ARM_VCPU_PMU_V3_COMPOSITION
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devel@daynix.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
 <20250806-hybrid-v2-1-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
 <aJOO99xUrhsrvLwl@linux.dev>
 <276fdfb8-f1ca-44ad-b310-a811684b265a@rsg.ci.i.u-tokyo.ac.jp>
 <aJQJdElbZJ6KzQxD@linux.dev>
 <62494f54-13c6-4b9f-86a1-9a19ce58e91f@rsg.ci.i.u-tokyo.ac.jp>
 <aJaDYhme_St2b2sM@linux.dev>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <aJaDYhme_St2b2sM@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_232133_076879_8756BF11 
X-CRM114-Status: GOOD (  30.75  )
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

On 2025/08/09 8:08, Oliver Upton wrote:
> On Thu, Aug 07, 2025 at 11:06:21PM +0900, Akihiko Odaki wrote:
>>> The only cross-PMU events we will support are the fixed counters, my
>>> strong preference is that we do not reverse-map architectural events to
>>> generic perf events for all counters.
>>
>> I wonder if there is a benefit to special case PERF_COUNT_HW_CPU_CYCLES
>> then; the current logic of kvm_map_pmu_event() looks sufficient for me.
> 
> I'd rather we just use the generic perf events and let the driver remap
> things on our behalf. These are fixed counters, using constant events
> feels like the right way to go about that.
> 
> kvm_map_pmu_event() is trying to solve a slightly different problem
> where we need to map programmable PMUv3 events into a non-PMUv3 event
> space, like on the M1 PMU.

It is currently also used to map non-programmable PMUv3 events.

I want to understand the motivation better. The current procedure to 
determine the config value is as follows:
1) If the register is PMCCFILTR_EL0:
    a) eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES.
2) If the register is not PMCCFILTR_EL0:
    a) Derive eventsel by masking the register value.
3) If map_pmuv3_event() exists:
    a) The config value is map_pmuv3_event(eventsel).
4) If map_pmuv3_event() does not exist:
    a) The config value is eventsel.

If we use PERF_TYPE_HARDWARE / PERF_COUNT_HW_CPU_CYCLES, the procedure 
will look like the following:
1) If the register is PMCCFILTR_EL0:
    a) The config value is PERF_TYPE_HARDWARE / PERF_COUNT_HW_CPU_CYCLES.
2) If the reigster is not PMCCFILTR_EL0:
    a) Derive eventsel by masking the register value.
    b) If map_pmuv3_event() exists:
       i) The config value is map_pmuv3_event(eventsel).
    c) if map_pmuv3_event() does not exist,
       i) The config value is eventsel.

It does not seem that using PERF_TYPE_HARDWARE / 
PERF_COUNT_HW_CPU_CYCLES simplifies the procedure.

> 
>>> This isn't what I meant. What I mean is that userspace either can use
>>> the SET_PMU ioctl or the COMPOSITION ioctl. Once one of them has been
>>> used the other ioctl returns an error.
>>>
>>> We're really bad at getting ioctl ordering / interleaving right and
>>> syzkaller has a habit of finding these mistakes. There's zero practical
>>> value in using both of these ioctls on the same VM, let's prevent it.
>>
>> The corresponding RFC series for QEMU uses KVM_ARM_VCPU_PMU_V3_SET_PMU to
>> probe host PMUs, and falls back to KVM_ARM_VCPU_PMU_V3_COMPOSITION if none
>> covers all CPUs. Switching between SET_PMU and COMPOSITION is useful during
>> such probing.
>>
>> COMPOSITION is designed to behave like just another host PMU that is set
>> with SET_PMU. SET_PMU allows setting a different host PMU even if SET_PMU
>> has already been invoked so it is also allowed to set a host PMU even if
>> COMPOSITION has already been invoked, maintaining consistency with
>> non-composed PMUs.
>>
>> You can find the QEMU patch at:
>> https://lore.kernel.org/qemu-devel/20250806-kvmq-v1-1-d1d50b7058cd@rsg.ci.i.u-tokyo.ac.jp/
>>
>> (look up KVM_ARM_VCPU_PMU_V3_SET_PMU for the probing code)
> 
> Having both of these attributes return success when probed with
> KVM_HAS_DEVICE_ATTR is fine; what I mean is that once KVM_SET_DEVICE_ATTR
> has been called on an attribute the other fails.

By probing, I meant checking if a host PMU is compatible with KVM.

More concretely, QEMU implements the following procedure to detect a PMU 
backend compatible with all host CPUs:

1) Traverse /sys/bus/event_source/devices
    a) Check if the device has the cpus and type attributes.
       If it doesn't, skip it.
    b) Try to set the device's type with KVM_ARM_VCPU_PMU_V3_SET_PMU.
       If successful, the device is compatible with KVM.
    c) Check if the device's cpus cover all host CPUs.
       If it does, use it with KVM_ARM_VCPU_PMU_V3_SET_PMU.

2) Check if the union of the cpus attributes of compatible devices
    cover all CPUs. If it does, use KVM_ARM_VCPU_PMU_V3_COMPOSITION.

3) If it failed to find a usable backend until this step,
    there is no PMU backend compatible with all host CPUs.

Here, 1b) calls KVM_SET_DEVICE_ATTR with KVM_ARM_VCPU_PMU_V3_SET_PMU 
during probing.

> 
>>> On a system that has FEAT_PMUv3_ICNTR, userspace can still use this
>>> ioctl and explicitly de-feature ICNTR by writing to the ID register
>>> after initialization.
>>
>> Now I understand better.
>>
>> Currently, KVM_ARM_VCPU_PMU_V3_COMPOSITION sets supported_cpus to ones that
>> have cycle counters compatible with PMU emulation.
>>
>> If FEAT_PMUv3_ICNTR is set to the ID register, I guess
>> KVM_ARM_VCPU_PMU_V3_COMPOSITION will set supported_cpus to ones that have
>> compatible cycle and instruction counters. If so, the naming
>> KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY indeed makes sense.
> 
> Perfect. Ideally SOC vendors do the sensible thing and ensure that
> FEAT_PMUv3_ICNTR is consistent on all implementations in a machine. We
> will hide the feature in KVM if it is not.

M1 PMU also implements a fixed instruction counter, fortunately on all 
CPUs. I hope they continue to do so (and ideally they implement 
FEAT_PMUv3 and FEAT_PMUv3_ICNTR).

Regards,
Akihiko Odaki

