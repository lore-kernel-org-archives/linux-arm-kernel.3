Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C132D59F50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=N/EpAY/5dCiD3IjULhAafgPlfUZK5B6r3caqhqftDLw=; b=P6X8J76hL3C5RE
	SuUfRJMXdh/Y8CS592gSWimuqna8bETD3keGKiOMmO7DuW9E5M1S+9/QLFQ14pizYZXLQ1LDAGDR2
	MtMa/c4QlvHuuiFvB/OCdqGd+GuyHEDMWG/q6n57v1Yt0GHMrH8w9XBgNUsMLssec4Ge5MtvP9jIY
	BFxnQ1g0d8ckQC8k4IeAxzNWwhPRlqlLqWJ80xTTqrSmxCkHQ/AEAaBMknxqbyeaaINrLZete4OG4
	TeJWMWmCJjz6sSam7jcjtGqivTD3h23erAjKTN3Hd1Tgxxif1QjDXk9EBMMRj/vjBVYFMCDeeKZZ8
	J1rY6Qot9YEOdpLyLarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBAk-000000018Fq-4Au8;
	Fri, 12 Dec 2025 21:59:35 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBAi-000000018FC-3wxu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 21:59:34 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-65747f4376bso2407179eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 13:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765576772; x=1766181572; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/EpAY/5dCiD3IjULhAafgPlfUZK5B6r3caqhqftDLw=;
        b=nfV4N7rt8a6BEHLhrh0bxGjvaXbCq4GqnEvPCM6Jba+B5zaPEdy96UZkjSBj6ek3tt
         2vmGAExHK47onbdOEpGKtPOofkgUbfHgOosFs/loHfevJ0rMn1BszUNnjJ67iQmLfdsn
         fpu90MZnSUiK2+MmcRxJff5rD1Ux/Rd9Nj3OsPTG3I1OmL9e+cgG9d59qebqe/Cs7ONY
         dJgx8ufb/vRJ8jm/EKOQCyOOBmfTwy/O/vCjaCmpxJiFleRMSCZRwLe4PPOZ+NaiLqCr
         Gu77KQq2bIOwMHHBHlstFqP5ui1TsySOnyixNgHyAqt4lFcDSQ1IwtTi/C0BoLzLxQj2
         X2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765576772; x=1766181572;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/EpAY/5dCiD3IjULhAafgPlfUZK5B6r3caqhqftDLw=;
        b=TgV2orc1LXz2ZII9yBi8hAZ7gWcwDBN4BGWmtdwRa73npqvXBjbC6lu7X7CF+k4d1l
         YLFmwjgesKrImuReltgdProb2O1UBHk+uLr1rQUXHBtMDuKYkVLg5LOCPNctkE2518G4
         QhUQJx344sHSxCfEJ9/HJgTUqH/GrNzhCGWXP2fTf0zi1QEDid5hAGJ+lYf2bwKlm4a0
         9W/zWl40eA87cDSFg6DBMiYtUNyqlL5JlHAFD5tC9aZy6S98Gn/2zmZop71cSe1G5HCK
         G93weTEevSybqEz5/mXS5fAwfylBQTMZylb6/exAk5rS7up9iPwWp8lEt/cIW7d1w4ru
         C+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUNDhpqTuArZZBj8Id+zVFNJRmlhkGapU6jQJGSSSJX+MGCzsbClktWt7Z3I7cyYKNq5de98a8id3z69M6zh3tf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/NMgDFD0P4/zYrGMTsQUm0Zx8BGreDJB6pCqGfqyqB6IDr7j0
	miDybbs2uN7yQqXgxy6ZZUUUv+I7jpIkBsMDYPQBAHnXaYT8xtsbG23ptFVU5lZdPnMrw01wWA8
	JhwnTYhv7ThwzVpcU2LU1Nv1PdA==
X-Google-Smtp-Source: AGHT+IF0CbQ2D3A1j2krEFoQZv301Z7CiO1P+3KpILDRxaeGjkRt5qjZ/Vujtj48CE91VIyGHYcc/uN+dXFfoTP2HA==
X-Received: from ilbee24.prod.google.com ([2002:a05:6e02:4918:b0:438:237b:ed42])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1344:b0:659:9a49:8eb6 with SMTP id 006d021491bc7-65b4525d320mr1663961eaf.58.1765576771672;
 Fri, 12 Dec 2025 13:59:31 -0800 (PST)
Date: Fri, 12 Dec 2025 21:59:30 +0000
In-Reply-To: <aTicD5hlKhZ3rkIn@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 14:00:47 -0800)
Mime-Version: 1.0
Message-ID: <gsnth5tv2wfx.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 18/24] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20251212_135932_983126_35B83606 
X-CRM114-Status: GOOD (  21.56  )
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

> On Tue, Dec 09, 2025 at 08:51:15PM +0000, Colton Lewis wrote:
>> The KVM API for event filtering says that counters do not count when
>> blocked by the event filter. To enforce that, the event filter must be
>> rechecked on every load since it might have changed since the last
>> time the guest wrote a value. If the event is filtered, exclude
>> counting at all exception levels before writing the hardware.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/pmu-direct.c | 44 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)

>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index 71977d24f489a..8d0d6d1a0d851 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -221,6 +221,49 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>>   	return nr_host_cnt_max;
>>   }

>> +/**
>> + * kvm_pmu_apply_event_filter()
>> + * @vcpu: Pointer to vcpu struct
>> + *
>> + * To uphold the guarantee of the KVM PMU event filter, we must ensure
>> + * no counter counts if the event is filtered. Accomplish this by
>> + * filtering all exception levels if the event is filtered.
>> + */
>> +static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
>> +{
>> +	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
>> +	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
>> +		ARMV8_PMU_EXCLUDE_EL1;
>> +	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
>> +	u8 i;
>> +	u64 val;
>> +	u64 evsel;
>> +
>> +	if (!pmu)
>> +		return;
>> +
>> +	for (i = 0; i < pmu->hpmn_max; i++) {
>> +		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
>> +		evsel = val & kvm_pmu_event_mask(vcpu->kvm);
>> +
>> +		if (vcpu->kvm->arch.pmu_filter &&
>> +		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
>> +			val |= evtyper_set;
>> +
>> +		val &= ~evtyper_clr;
>> +		write_pmevtypern(i, val);
>> +	}
>> +
>> +	val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
>> +
>> +	if (vcpu->kvm->arch.pmu_filter &&
>> +	    !test_bit(ARMV8_PMUV3_PERFCTR_CPU_CYCLES,  
>> vcpu->kvm->arch.pmu_filter))
>> +		val |= evtyper_set;
>> +
>> +	val &= ~evtyper_clr;
>> +	write_pmccfiltr(val);
>> +}

> This doesn't work for nested. I agree that the hardware value of
> PMEVTYPERn_EL0 needs to be under KVM control, but depending on whether
> or not we're in a hyp context the meaning of the EL1 filtering bit
> changes. Have a look at kvm_pmu_create_perf_event().

That's where I got the ideas for this code. I'll look at the handling
for hyp context too.


> Thanks,
> Oliver

