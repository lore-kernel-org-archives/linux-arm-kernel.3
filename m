Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD60EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 21:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQuvSU+rvn/LSkKpcRyfWMx1R3fVRsbIfemsxe/bHdc=; b=kcZTXTznm9hR++vxyY0l/1SNB9
	tuO5BWJyDiMlnI/rN+e3r/RdL2jUpczo2wuVa0HGR56GLotvTzXlKMhDyRaR02vB2DxNZxofjS0Dq
	JwNaGadjJ4Xg0+YVfoXpwendCPFEglY8pSzUn5vU6izi+rfz6Yef8FuY5/M233MLGgaM/RSODC1Xb
	On+/OO+s5/Y6bkB7sEP3sOzbdWQuD6RslxL2rzECVVx/j0gJ1aL0piZvq7xRmTCvlZqpGDvofbpr7
	ZKW9f3RtMXUEQ18Zs/SXMrcSL7nD0ZpdF2nzeO9YygOy71/4FJVaElgELIu2pAbfmKzQB3sW83GVE
	P+My9KWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOYE-0000000ATTF-3X7N;
	Mon, 13 Jul 2026 21:50:58 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOY9-0000000ATSq-31ri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 21:50:57 +0000
Received: from [192.168.10.145] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66DLoXiN028776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jul 2026 06:50:33 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=YQuvSU+rvn/LSkKpcRyfWMx1R3fVRsbIfemsxe/bHdc=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783979433; v=1;
        b=q+pvPfzKFHSCkTHNmb/RFGkEuDeEHQA9xBGPxWZit+9tf2IF+rWDbWtk7ztw/ptF
         +qts/pQlOV9MYwwhT3TkFKpq2vAKva18A6kqasaKTynJQB/QJtST5nTTqqB2fcl/
         /5t1BcqsT9i0r95mZuDPBghdn3PFh1cJ/jsWRa8768dzLqpPDCsV96BWN5Il9p+3
         +1zD5gjHAmkatHOVvDZdrYIR7JFnj9FpWL2OipiA+Z5seE6lR8R0A9GOZ0hu49Zu
         NrB/4ds5LcG2XzYsOY/IDjrwpDZi4as/XfAcGpqGMwZ2QQg1i+Opw04aroZk8XgY
         sSmITQApacG55s+3lNKtSg==
Message-ID: <bb1224e8-ff4b-4e5d-babb-b6a2970219ab@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 14 Jul 2026 06:50:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/11] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
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
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <20260710-hybrid-v8-9-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <alSWtwHVfYh0zdPy@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <alSWtwHVfYh0zdPy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_145056_403815_71B612BB 
X-CRM114-Status: GOOD (  13.56  )
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

On 2026/07/13 16:41, Oliver Upton wrote:
> On Fri, Jul 10, 2026 at 08:15:03PM +0900, Akihiko Odaki wrote:
>> @@ -813,6 +842,15 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>>   	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
>>   		return;
>>   
>> +	/*
>> +	 * IMPDEF PMUv3 traps are non-architectural, and KVM cannot assume a
>> +	 * uniform PMUv3-compatible arm_pmu is available on all CPUs.
>> +	 */
>> +	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS)) {
>> +		kvm_info("Non-architectural PMU, tainting kernel\n");
>> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
>> +	}
>> +
> 
> This is an unrelated change, and really the taint should be added with the
> .cpu_enable() for this capability. That's the point where we flip the
> magic bit.

I'm abandoning this change because it does not effectively cover all 
corner cases we don't want to support:
https://lore.kernel.org/all/0e5e64ea-2f3c-4ce6-88ac-08b66f13027c@rsg.ci.i.u-tokyo.ac.jp/

> 
>> +void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu)
>> +{
>> +	if (!kvm_pmu_fixed_counters_only(vcpu->kvm) || vcpu->cpu == last_cpu || last_cpu == -1)
> 										^~~~~~~~~~~~~~
> 
> Does this do anything other than avoid a spurious reload on the first KVM_RUN?

Yes. Without this check, the value will be passed to cpu_max_bits_warn() 
in the following call chain, resulting in a warning ifdef 
CONFIG_DEBUG_PER_CPU_MAPS:

1. kvm_vcpu_load_pmu()
2. kvm_pmu_probe_armpmu()
3. cpumask_test_cpu()
4. cpumask_check()
5. cpu_max_bits_warn()

Regards,
Akihiko Odaki

