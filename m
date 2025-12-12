Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24836D59D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3FXn5oKHBMgqIJsfuynoMoNzKyF0I0AGnsGa5FlNVAQ=; b=XeK8aR44XXc9CH
	gz9LCuyzOdkveCA2KL9xSDjerf1K7RUI8cKTmoGA78KQPSDqZ72tP6B5beZZntpTGBWyo3Gg4Uk8+
	mqH4XwgEUV1S6e3UCr+ByZMhwC9LnZ6PDni08bdhRy6ngy5/izCnoq8R5yd24Dyy0c9Wjd3hzoko2
	RvGZAPb6Ypwx6Dd6gRVdSKMkdJR8/EIj4frQAuy5QYejo57TXwhKURYvFaE0MPOuN8TtXmwiVckU9
	xGf12lOt3uGj+EPbJcLF4MMaQteoOeIIi+mEeDflPNFLLMJVZZLGmbB7G8pQvAuj/5XmecBdyHSUp
	8P4Jxpg6FlXUcbij7Ctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUA9z-000000015OX-2Ibc;
	Fri, 12 Dec 2025 20:54:43 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUA9x-000000015O1-16OH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:54:42 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-450178eaf86so1348564b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 12:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765572879; x=1766177679; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FXn5oKHBMgqIJsfuynoMoNzKyF0I0AGnsGa5FlNVAQ=;
        b=285BVCfVD9pRexBk+0W60F8GYn6hYFILdBy0I0WsbbZQfQnvu0icGhVcsCbRgzAxrq
         /palC8QHDcF7kXhWa2GjB7HzoIK92SoPNTvk9X7Z7EgwVsktzkDGV/jh1JKFe3rCvgL6
         3a7A9Lzx5yYOF6iB/n1OusUNI+H9zrC3cG4FUGXGC1GoQb64GN+ytFwtQkMXbARVoMiY
         qePhg4Aq74jGBjw06lz3T6WG/jubhSqzporXIHHjDqCkHI4gyzzxcU5ekEJSbmeXU38H
         cUc8dGWfjmEgX5f3dZTqHvOCsqbM7MvmXJg2KtlpFFzizEz32aK1NVxKVIey7OD/pIPI
         MdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765572879; x=1766177679;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FXn5oKHBMgqIJsfuynoMoNzKyF0I0AGnsGa5FlNVAQ=;
        b=Cg6Oe8I4RCkaL09LjgVN8ez+TFl8WOAxEcjG3d8xwthy3V5NJta8zeSHsBYIIHoSzB
         v/3vuYONDMPpvrOaMIad8DV84lT7y//meg2rPV+P4IJw6VHQKP6CgpjsFamUF9NkYf16
         R1Jn/0NL4NXBY9jEghs+eruZvfUpkwWMEq/hqBkWx//QfLLfP1v6ARFsyF284r+33hxA
         C3MXwBFog3ubkklS7lnpcK4VdFm1t/PW3vgzqKPGwbc9g2wPj9KeTFRreGS6S2Ak2A6Y
         6nUVpPmpvw3Oo7NXH5yS6Ci5f/zOlphNhJhmQYFgOfiDOYHSB587i/Z1p7Eo6+kN04dU
         epIw==
X-Forwarded-Encrypted: i=1; AJvYcCXexVk5qQlDTpi68qRO1RKMBkq4Mpx9Zdfx27X2dNC6fVQSphg4p9vyg/dShoB0wjz3SNm3kzMEuWR8tu8hGGpt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq3GTK1ioLhLXWBBvkt7XZeNzHBJR4X2AC4y9q9W3PSYIyN0HO
	gKk0QZlv15ltUOty+kCDI9apx84vT5sOcbMs/ny0xhf7yaBeO5HHJhnn3fegBKXE26t3dFQiqgP
	B7041kRxFuUak6N2Yf5xhuszQQQ==
X-Google-Smtp-Source: AGHT+IH6fb4UumzYsfcjXdyetsttD/1JFDYI7F758xyq6M3c7XHveoyP9rAiScoRQhR1KR8axHNUmY6AiGo2XvKjTQ==
X-Received: from oaeh14.prod.google.com ([2002:a05:6870:170e:b0:3f5:b0db:411a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1814:b0:450:d504:9295 with SMTP id 5614622812f47-455ac957f68mr1619808b6e.44.1765572879590;
 Fri, 12 Dec 2025 12:54:39 -0800 (PST)
Date: Fri, 12 Dec 2025 20:54:38 +0000
In-Reply-To: <aTiRG0I1FZzntHtH@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 13:14:03 -0800)
Mime-Version: 1.0
Message-ID: <gsntv7ib2zg1.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 12/24] KVM: arm64: Use physical PMSELR for PMXEVTYPER
 if partitioned
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_125441_309251_D4C35498 
X-CRM114-Status: GOOD (  16.86  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:09PM +0000, Colton Lewis wrote:
>> Because PMXEVTYPER is trapped and PMSELR is not, it is not appropriate
>> to use the virtual PMSELR register when it could be outdated and lead
>> to an invalid write. Use the physical register when partitioned.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/include/asm/arm_pmuv3.h | 7 ++++++-
>>   arch/arm64/kvm/sys_regs.c          | 9 +++++++--
>>   2 files changed, 13 insertions(+), 3 deletions(-)

>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h  
>> b/arch/arm64/include/asm/arm_pmuv3.h
>> index 27c4d6d47da31..60600f04b5902 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -70,11 +70,16 @@ static inline u64 read_pmcr(void)
>>   	return read_sysreg(pmcr_el0);
>>   }

>> -static inline void write_pmselr(u32 val)
>> +static inline void write_pmselr(u64 val)
>>   {
>>   	write_sysreg(val, pmselr_el0);
>>   }

>> +static inline u64 read_pmselr(void)
>> +{
>> +	return read_sysreg(pmselr_el0);
>> +}
>> +
>>   static inline void write_pmccntr(u64 val)
>>   {
>>   	write_sysreg(val, pmccntr_el0);
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 0c9596325519b..2e6d907fa8af2 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1199,14 +1199,19 @@ static bool writethrough_pmevtyper(struct  
>> kvm_vcpu *vcpu, struct sys_reg_params
>>   static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct  
>> sys_reg_params *p,
>>   			       const struct sys_reg_desc *r)
>>   {
>> -	u64 idx, reg;
>> +	u64 idx, reg, pmselr;

>>   	if (pmu_access_el0_disabled(vcpu))
>>   		return false;

>>   	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 1) {
>>   		/* PMXEVTYPER_EL0 */
>> -		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, __vcpu_sys_reg(vcpu,  
>> PMSELR_EL0));
>> +		if (kvm_vcpu_pmu_is_partitioned(vcpu))
>> +			pmselr = read_pmselr();
>> +		else
>> +			pmselr = __vcpu_sys_reg(vcpu, PMSELR_EL0);

> This isn't preemption safe. Nor should the "if (partitioned) do X else do  
> Y" get
> open-coded throughout the shop.

Okay. I had not known the register access stuff wasn't. I'll fix that.


> I would rather this be handled with a prepatory patch that provides
> generic PMU register accessors to the rest of KVM (e.g.
> vcpu_read_pmu_reg() / vcpu_write_pmu_reg()). Internally those helpers
> can locate the vCPU's PMU registers (emulated, partitioned in-memory,
> partitioned in-CPU).

That seems like a good idea.

> Thanks,
> Oliver

