Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899FBC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MaMi87RWhMSAus5qN4EIk8TtDM9x9f0bzGDNP+s4l8=; b=C0udVN0zcxhpt9f+e+PHgMQE+I
	KqznRP/9VH9hVpPMGx1n/2On1Pu0TbfKPfoIhUykmmKgQe8UjpE9pbh0iZatKyToKRG3RJgD/KE47
	Ociv9dgUKHzeke79JEmBmjkvUDBr5+58UquVBm+YcjghW7T8i2jJofyyoc/Ejw4eAW02/JBv7exmg
	Vd8UHEs7mPpRbBAs9bIZQIcAOZXX8Dreefga4LO1C92RwS7iRzocZwcOa1EZDXMn0yElMSh0b2jLp
	Xc6UEoycz1DeldT45C1LCbWjVN08E4VaHM59gXz1w+FYRYfiELemf2LbpV8Ig6Quvm7ZlrSHQ/cd+
	fWAnAwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKOA-00000009dHr-0RWW;
	Thu, 30 Jul 2026 06:37:06 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKO5-00000009dGN-1gdy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:37:05 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66U6aH4o056545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jul 2026 15:36:17 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=/MaMi87RWhMSAus5qN4EIk8TtDM9x9f0bzGDNP+s4l8=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1785393378; v=1;
        b=CR02EmMJ6YJKNFkKLren40kXzZGtLt35yQRS20Az0NGX7Jm0IItpOIiJ48tk4D+j
         rVeOUQaPTaJLIRQMGQGPymW+FcXh4R5wmIxwBqX6xun4O/ZABjohzvFq452q1ev/
         YrSg6ACGWGVzhxeqB01mYofr+/ZJgWbwtqkkbmyAAP/YRm1+e7Rz3/UVkgzaU6Wt
         dr0B0wZv9b+dBkyktdOfUGGcH10DMnIhloYmuEY1CnDswT7VJRMVYCyf8ra5Kb4s
         ZKZderu/9rHc0ARcUKa3rC1OPfvFkqbg9UXc7WcR4S+1DZISyboyD9RQ+jn0zfbV
         viziw2KISB01Nbt8FTXigQ==
Message-ID: <e023d791-38c3-47b4-9b09-3420fe78d9ea@rsg.ci.i.u-tokyo.ac.jp>
Date: Thu, 30 Jul 2026 15:36:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/16] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <20260720-hybrid-v9-14-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <CA+EHjTx0zNQ_yPCz38vGYpBssshE4b3KWaoUxjzuerGgzB=JSQ@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <CA+EHjTx0zNQ_yPCz38vGYpBssshE4b3KWaoUxjzuerGgzB=JSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_233701_668334_785FF3A6 
X-CRM114-Status: GOOD (  18.99  )
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



On 2026/07/30 3:18, Fuad Tabba wrote:
> Hi Akihiko,
> 
> On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
> <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
> ...
> 
>> +/**
>> + * kvm_pmu_create_perf_event - create a perf event for a counter
>> + * @pmc: Counter context
>> + */
>> +static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>> +{
>> +       struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>> +       struct arm_pmu *arm_pmu = vcpu->kvm->arch.arm_pmu;
>> +
>> +       if (kvm_pmu_fixed_counters_only(vcpu->kvm)) {
>> +               do {
>> +                       arm_pmu = kvm_pmu_probe_armpmu(READ_ONCE(vcpu->cpu));
>> +
>> +                       if (!arm_pmu) {
>> +                               pr_warn_once("kvm: Unsupported PMU variation detected.\n");
>> +                               add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
>> +                               return;
>> +                       }
> 
> Sashiko flagged that this can leave the perf event out of sync with
> the sysreg, which looks plausible: on a pCPU with no registered pPMU
> this returns without recreating the event, so a guest event-type
> change there updates the sysreg but not the event, and after migrating
> back to a pCPU the original pPMU covers, kvm_pmc_enable_perf_event()
> re-enables the stale event instead of recreating it.
> 
> I know you treat the no-pPMU case as out of spec, but the dropped
> update lands once the vCPU is back on a normal pCPU. Is this intended?

"[PATCH v9 06/16] KVM: arm64: PMU: Recreate events after MDCR_EL2 
changes" calls kvm_pmu_stop_counter() in kvm_vcpu_reload_pmu(), so it 
does not matter whether this function calls kvm_pmu_stop_counter().

The other changes that require recreating the event are currently not 
handled at all as Sashiko complains [1]. I'll fix that as done in 
MDCR_EL2 setters in the next version.

That said, I do not intend to add any extra complexity to provide any 
guarantee for a system with unsupported PMU variation except that the 
user can notice and react to that (i.e., the taint is reported and no 
oops happens due to NULL dereference). The patch message is somewhat 
misleading in this aspect so I'm going to fix that in the next version.

[1] 
https://sashiko.dev/#/patchset/20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp?part=6

Regards,
Akihiko Odaki

