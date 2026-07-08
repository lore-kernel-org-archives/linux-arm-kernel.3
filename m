Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A5EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE0Ute93tZYNyM/ptOJZ4hDRYpAdgE2IvA/+HRQtmKs=; b=jYp+xdpV3LA8vbPzOOYSgW1Wz1
	yQp3TDHaX6Kzf0kDYcJ9ba2jvIIe2Cfg7Ir0uBld7xxrYpUojSu45rB43vmvzDpx0jq3zkaU+gbGk
	wn/8GrThJTt3njNxJSpgPyN6cViZTtWHJdcEa9qIKm5Wc+fPj8/PWjKCwdjsnYK3WMkCt0JL+TwNK
	5hVMSsQjrJM834A/PRLI9dNcSgg4/8XpVK15mlPuG/V2Z2NWP3UUjl7XudwuUYMpydseWeaUo/T8F
	GBeLAxtgLzN+9dzIv3otSwek01ltwPLNqo6vlOg50CbF+TsdqH+R/3Bb2odJixAOTJAMQ2Mpgs+g6
	NkiTSH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNiE-0000000Gcwi-3yWV;
	Wed, 08 Jul 2026 08:32:59 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNiB-0000000Gcvy-29vC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:32:57 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 6688WKbc097244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 8 Jul 2026 17:32:20 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=CE0Ute93tZYNyM/ptOJZ4hDRYpAdgE2IvA/+HRQtmKs=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783499541; v=1;
        b=ZiFIfM95K+oOjjYwp9L1z9EKyqwpu4VPlhs0nyMnWoctpX/G6HUndJyHy9FFN1z/
         neri5+DSRWnKKNke2RFzpZgjUoxG3NbV9aqpSQbp1xNzKceqMYM6/12aLhXwEhZy
         ODNcSHI1/pmWB+a29oR0TlimAr0jZvBhIU/LdUkYz6rx7ZpSSdzi6/TUC+EVSXky
         kc/lCR0J4/rZ08bUkhGfIEGjis4TLL3K6n5xD6ovdVZqKSB/9W82xlZvsZpN8e0G
         7ynZZSeiwbxcWAqRSTGi9tzp+Dxe4pVnemAPliUgzZk5hBoLaNJ+6j3+IanDRzF3
         HfT8XOd9Jk/lD9fWn456aQ==
Message-ID: <7bf6c440-5f14-4326-9800-9821adc4e2e4@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 8 Jul 2026 17:32:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
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
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <ak1DVUs0bgkpZh0N@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_013256_006297_7391751A 
X-CRM114-Status: GOOD (  21.08  )
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

On 2026/07/08 3:20, Oliver Upton wrote:
> On Tue, Jul 07, 2026 at 08:08:03PM +0900, Akihiko Odaki wrote:
>> On 2026/07/07 2:04, Oliver Upton wrote:
>>> Hi,
>>>
>>> On Mon, Jul 06, 2026 at 07:03:24PM +0900, Akihiko Odaki wrote:
>>>> Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
>>>> PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
>>>> That covers systems where PMUv3 is absent or non-uniform, as well as
>>>> systems where IMPDEF PMUv3 sysreg traps are unavailable.
>>>>
>>>> However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
>>>> sysregs, but the pPMUs registered with KVM only cover a subset of
>>>> possible CPUs.
>>>>
>>>> Reject vPMU unless the registered pPMUs cover every possible CPU.
>>>> This avoids carrying support for partial pPMU coverage into the
>>>> fixed-counters-only UAPI introduced later in the series.
>>>
>>> Doesn't CPU hotplug screw this up? I could online a CPU that doesn't
>>> have a PMU after creating the VM.>
>>> I'd rather just change ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to become a
>>> system feature. That way any CPU which breaks the system-wide assumption
>>> cannot be onlined.
>>
>> ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS only says that IMPDEF PMUv3 sysregs are
>> trapped. It does not say that KVM has a driver-backed PMU usable for PMUv3
>> emulation. This patch checks that extra requirement.
>>
>> I re-checked CPU hotplug. Onlining a CPU without a PMU later does not make
>> an accepted VM unsafe, since the check is against cpu_possible_mask.
> 
> Sorry, I missed that this was against the possible mask.
> 
>> The problem is the reverse case on ACPI: this check can disable vPMU when a
>> possible CPU is offline. DT populates supported_cpus at boot, while ACPI
>> initially populates it only from online CPUs and grows it as matching CPUs
>> come online.
>>
>> That makes this patch too conservative. In practice, I do not expect systems
>> to mix CPUs with and without a usable PMU. A better approach is probably to
>> treat such a host as out of spec and add TAINT_CPU_OUT_OF_SPEC. We already
>> do that for architectural PMUv3 by detecting mismatches in
>> ID_AA64DFR0_EL1.PMUVer; we can do the same for
>> ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS with non-standard PMUs.
> 
> The presence of the workaround is, by definition, out of spec. I just
> never bothered tainting the kernel because these machines are already
> TAINT_CPU_OUT_OF_SPEC by way of the broken VGIC.
> 
> Ok, so how about you keep the check that you're doing here and promote
> IMPDEF_TRAPS to a system-wide feature? That would satisfy the two
> preconditions we have for PMU emulation, which is system register traps
> and a backing arm_pmu that understands PMUv3 events.

This check turned out to be faulty: it can disable PMU emulation on ACPI
systems when a possible CPU is offline, because ACPI grows
arm_pmu::supported_cpus as matching CPUs come online.

My current plan is:

- drop the possible-mask coverage check, to avoid breaking ACPI;
- promote ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to
   ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE, so the system will have the
   feature only if all online CPUs implement it;
- explicitly taint hosts with ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS,
   matching what KVM already does for non-architectural VGICs. The
   comment will make it clear that this is out of spec because KVM cannot
   make the usual architectural assumptions about PMUv3 sysreg traps and
   uniform driver-backed PMU availability.

That lets the code keep assuming uniform PMU availability without adding 
an ACPI-hostile possible-CPU check, and makes that assumption explicit 
for humans like me and tools such as Sashiko [1].

[1] 
https://sashiko.dev/#/patchset/20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp?part=6

Regards,
Akihiko Odaki


