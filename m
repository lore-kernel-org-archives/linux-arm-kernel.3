Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141C8CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLLq1R13uyDoTfMnvHZDH/2dbxOMckf2plTOpZS7OhQ=; b=s6xPNhdWLsoNrHiq82NwmKsZLN
	LvZjNNgdnYMxXdqVAYIkYnmdH7E3YELFANaJZukmZy82zLuKc1BEY4+9J9jEijFDC9RmMO7CNCmEK
	eOZKOPc1eWTG9SVKhI4mV8nlotLTwbXCVuRsZgkRIC01PtRBlpyVAH4vHv+NoB0d1+3iP5id+Q9j7
	QvPp74UMZBIHIYlJXixXzsP6Z7PMShASq3MMtywfl/D9pd/xxrUkkRJ8dAWC8WOpUNRHBwbTiBPxb
	bYNeFiEYI6J5DY860P+jmkB3vWfRpV9vqBb9uM410C//mUVTKzeSkBAtuDMQITeOOFp6ZxK3IY52h
	5uSZ+jMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyao-000000007K8-1tHQ;
	Tue, 06 Oct 2026 06:24:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyak-000000007Iw-3Xpk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791267837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLLq1R13uyDoTfMnvHZDH/2dbxOMckf2plTOpZS7OhQ=;
	b=d+525Zx7h/e+KpJVNOOAPUkoMx0+Y+i3LIadOdKs8TpdkroQ2E2Ub/evfGQa4h6wjrU/XI
	ZivwCuzVEWoW2StqVvHxcArRMgLT2yVOWa5pngfIUkbo3k7ZmhNy0pPBCYUQJ8oNlbjR3w
	VMXDHzeCwPViPeKBDq8raqFYrBg8P7s=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-IBc5gVfFMs6ISXArynMiJQ-1; Tue, 06 Oct 2026 02:23:56 -0400
X-MC-Unique: IBc5gVfFMs6ISXArynMiJQ-1
X-Mimecast-MFC-AGG-ID: IBc5gVfFMs6ISXArynMiJQ_1791267835
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so499446a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267835; x=1791872635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLLq1R13uyDoTfMnvHZDH/2dbxOMckf2plTOpZS7OhQ=;
        b=DYQEMsHY6beEMKbJ4xfnizT38YEbTwjKttIugQWBrGUyJ6gfVMEhocLGOyPTMsiRlv
         nJbUG969C1h/SUVzrjLFciI2AMh73hH9SFP5H//s85fKi1scAKT9rsHYa0nRAPg8M1FR
         VV1uznHwsEuZAX+bR5SQ9KJTDzMq0yF5w4r4TJOfHBAB6GDq/P41xlNpbOJ6GPvEJpNS
         JRJBg8g1mNbi4oIm96NO1KGjFaupiD1lf20rA/gkMFqhG/yreRQjme8siEc+8tyrNtg3
         mMbExtDF3gE0pTz2YTwlFSc3hbyo7K99uaekuMcVe3MRT5pq+S8QfbgITS6RS26+60lS
         C2Hg==
X-Forwarded-Encrypted: i=1; AKwUvBzbp80R+kusxUvBxZBQLL6ytsm6fRuCoHWy1YPdhj6f7xJkce0vHOc8r4lSe2j/7sDBofRP/tfHToZERK38EAQV@lists.infradead.org
X-Gm-Message-State: AFq9FYJYGmg6sCXYh9AiPwK3MjopMS4FbvDAvJRRDxRxkQUmNGyJ4VEL
	Hi7LXmsnBjsPMry0T4dDPuDM/EG03zhskldoAPATjPsXOKjDAAch1+F/IYtkzU84w7ldvA048Hh
	A3TIAY5xlkOqBBoXoYDoFgmwpT8dbwV8MfBgJR5oqEb9UF+r0KZfSiYZtouw2L3Nt0Wab2Qrj3O
	MS
X-Gm-Gg: AYBFou0SqnvMRnX2K9YC5Wta45ndsQo+8gWnBO8Y2lL5Kh/0Kk8tDtDm/J+qJ6tknHJ
	NngpwwyoxoXxzrSXM5vfVtvGl7M3AL8qH887E7tK8SSPfW7OAUF0zSM79UJLHazDv+0E2O/+CJe
	kW1APgAVWd+B2Jxj34WfCQfz+8w02jqQm61x845iR0Gq3vcp3C9ZE4+1ZFiycXfaQmRVP3lL8KI
	goLQS3EypGcNOMr+217VG5I5qvPbCTiehIcp1QTLkv8MW04fjHJluOeQSykBIlqD9fyDmdQx9xj
	3Z6yhMOGX7ylcBSmYNXol/1ySKP1CkV9pshH0p4YfcYbzwdZ3cGiNlETm8qtqOCjgxUKr2U9lWW
	1GlPbVnordAcw5VzMmNpTCpwo4Hixie2z8cxWX5UqAg==
X-Received: by 2002:a17:90b:1f92:b0:3a4:e635:a8c3 with SMTP id 98e67ed59e1d1-3a8545cceb1mr1330585a91.20.1791267834672;
        Mon, 05 Oct 2026 23:23:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1f92:b0:3a4:e635:a8c3 with SMTP id 98e67ed59e1d1-3a8545cceb1mr1330556a91.20.1791267834199;
        Mon, 05 Oct 2026 23:23:54 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6f734ae3dsm9932948a91.2.2026.10.05.23.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 23:23:53 -0700 (PDT)
Message-ID: <7bbee080-e8b9-4f8e-a4bd-c24f0b3b815f@redhat.com>
Date: Tue, 6 Oct 2026 16:23:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 23/23] KVM: arm64: CCA: Control user register access
 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-24-suzuki.poulose@arm.com>
 <52e3e45a-751e-40b2-8dd3-3db589ddebee@redhat.com>
 <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: phPJXDfV6gv-liO4Z0fNXaRaXekR7WpPUrX7Y6fufO4_1791267835
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_232358_960080_4084A1AF 
X-CRM114-Status: GOOD (  18.39  )
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

On 10/6/26 4:01 PM, Suzuki K Poulose wrote:
> On 06/10/2026 06:47, Gavin Shan wrote:
>> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>
>>> The RMM restricts the access to the register states that the host can
>>> read/modify for a given Realm.
>>>
>>> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>>>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>>>        requests.
>>>        MMIO emulation in the unprotected space.
>>>
>>> Additionally we use the sysreg configuration to advertise/configure the
>>> following Realm parameters, which are required before the Realm Descriptor
>>> is created:
>>>   - SVE Vector Length
>>>   - Number of HW Breakpoints/Watchpoints
>>>   - PMU Counters.
>>>
>>> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and SVE_VLS for
>>> the configuration of Realm creation parameters. We don't support PMUs for
>>> the Realm VMs yet, so PMCR is not exposed.
>>>
>>> The RMM makes similar restrictions for reading of the guest's registers
>>> (this is *confidential* compute after all), however we don't impose the
>>> restriction here. This allows the VMM to read (stale) values from the
>>> registers which might be useful to read back the initial values even if
>>> the RMM doesn't provide the latest version. For migration of a realm VM,
>>> a new interface will be needed so that the VMM can receive an
>>> (encrypted) blob of the VM's state.
>>>
>>> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
> 
>>>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>>>   {
>>>       int size;
>>> @@ -553,6 +572,9 @@ static int copy_core_reg_indices(const struct kvm_vcpu *vcpu,
>>>           u64 reg = KVM_REG_ARM64 | KVM_REG_ARM_CORE | i;
>>>           int size = core_reg_size_from_offset(vcpu, i);
>>> +        if (vcpu_is_rec(vcpu) && !kvm_realm_validate_core_reg(i))
>>> +            continue;
>>> +
>>>           if (size < 0)
>>>               continue;
>>> @@ -598,6 +620,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>>>       if (!vcpu_has_sve(vcpu))
>>>           return 0;
>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>> +        return 1; /* KVM_REG_ARM64_SVE_VLS */
>>> +
>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>           return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>
>>
>> Aren't above two checks conflicting to each other?
> 
> Do they? We allow SVE_VLS only for the Realms and we allow that
> before the vCPUs are finalized. For normal VMs, depending on
> whether the vcpus are finalized, we either send 1 or the full list.
> 

num_sve_regs() can be called for 3 cases: (a) non-finalized realm vCPU; (b) finalized
realm vCPU; (c) Other finalized vCPUs, correct? The check "if (kvm_vm_is_realm(vcpu->kvm))",
which would be "if (vcpu_is_rec(vcpu))", covers (a) and (b). The second check
"if (!kvm_arm_vcpu_sve_finalized(vcpu))" isn't used. The check here would be something
as below after this series is applied:

	/*
	 * Only KVM_REG_ARM64_SVE_VLS is visible on realm vCPUs no matter if
	 * they have been finalized.
	 */
	if (vcpu_is_rec(vcpu))
		return 1;

Besides, this check "if (vcpu_is_rec(vcpu))" belongs to PATCH[22]. Hope I make myself
clear :-)

>>
>>> @@ -625,6 +650,10 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>>>           return -EFAULT;
>>>       ++num_regs;
>>> +    /* For Realms only support SVE_VLS */
>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>> +        return num_regs;
>>> +
>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>           return num_regs;
>>
>> Same question here.
> 
> As above.
> 
> Suzuki

Thanks,
Gavin


