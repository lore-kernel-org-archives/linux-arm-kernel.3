Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA38C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zFo6TxttEqFIalCsIspeo8mg648WKT4oP0eEXrQLVXM=; b=JqJHJjuTpgIa7K
	IQwwyWvb6X6M776qi218wjWzTzYxGxTyo+CQJldUK7B2Gkeo0WHBYH60XgzIf9Gf80CpiUHKX/5cx
	0FDRQ8fH0EUDgQfRMINUg1WuyABaR5dkZLPEtt+Qn53Sqy/VmSBbNARVq9v/nxNqPN7KyZU62VEa2
	FthiZcD2CmubfVgsfnPlH51F7NSdqiNOCJ2jqE0hUFOuxVnl4HndRNMNLTi/8gEfQ+Y3/SbKNIk5p
	94K3D4F87+J9cgb8qS9qXritSzJXIjYXsEcc9YBeEDGTol4BE7oJq0/iqRSiThwOdcr55pK51jAKM
	MV0PtmmollurTtjEi1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcuiC-0000000615R-0oGz;
	Tue, 28 Jan 2025 23:09:40 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcugr-000000060xn-1qSx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 23:08:18 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-71de28807b0so3898719a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 15:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738105696; x=1738710496; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFo6TxttEqFIalCsIspeo8mg648WKT4oP0eEXrQLVXM=;
        b=jUKbaLC02j4RJ8UBMUtCheC+KV1KgFhLbxtTqkgqVjpKTR9BK1kJZHdXpKFYjLeHZA
         FD/sc3ORdQ35hw/2f+IoM8lVZsnv3zGlWEzYRH99LUDoFJB3wbmx541fwWFNO1MadoAI
         f0nqPDcqglDh9RxFYUWDUyqcR16WOEB3ISVGkZABwiXacHrnAbXqbMgnkb7SdjUmToOS
         gOlGyOz+BiVZT/oZGiGVhL8wZc+WQZrwCCdjGGlfqVyLEfJCfCwKhEADyXFqniOnXgh3
         YdW+7Dl0CtTKU1GFbZEIQWk/CIdA+I5HVlbfj6MD+B2P7S0B5GbMPyTTzD9cp7kYX4MB
         bwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738105696; x=1738710496;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFo6TxttEqFIalCsIspeo8mg648WKT4oP0eEXrQLVXM=;
        b=oB4D4DyxKZJvbph1gT4alOidnDuqREY/isXbWQtk1PANRaH1aY/MIn/RB22bYzrykt
         YxvjFskac5TUgaIRzSzJF3qPO4df9pk73S5XGsRLlq/EKzqaQDiL6P0QprQJV9BKQ4RI
         GuGMCCWpgkFasIn17gHvPjm6y5Y95dwad2wKfgO1TA8x9224Q8oP90pLpzaLGiTEJNvk
         49BgVolVNTxqR2MlC2bKx4J1bxFPAupm1chg7/zoepISjXnwV8pq+ISOrVfymRGoxVoe
         1jNdMiCSm084j9wBk9+J+od7nTi+dzFljxhfp4B799It+bfGeBTQ0Higirr+Iy0Obwif
         pAzg==
X-Forwarded-Encrypted: i=1; AJvYcCWZXC8ezjR1ANxRFX23beDgT7F4A3cZ5y2OAwfAN28QdAuDyeh5bPiphsCxK4jVDpvLDzruGMEOoIj8BDr9+f8v@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfm8XyRcihz2n9Nt6g/GubgDvRvUmhzc1DV6qb6nww9b54mY1i
	L/msaDeoY4n9gR+NzBpmWWrYhfmzxvFK6/96xHUse0ZnVKeNmaSHjFb0+8r2bkEdzHeSlGbhbgH
	CweKmgP41kLhVX9np5Rm8Ow==
X-Google-Smtp-Source: AGHT+IG5ddnY6/iHSVzZPnfbt3FF1yw2VhaZJBEOVScosdSTNCWOaSf0V1Rutk3fTReV5GNpySjV/C49wUzgPhrdpA==
X-Received: from oocx8.prod.google.com ([2002:a05:6820:8188:b0:5fa:a33d:6240])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:670f:b0:71e:1c5:4f9a with SMTP id 46e09a7af769-726568f8258mr618751a34.25.1738105695853;
 Tue, 28 Jan 2025 15:08:15 -0800 (PST)
Date: Tue, 28 Jan 2025 23:08:14 +0000
In-Reply-To: <gsntbjvq382s.fsf@coltonlewis-kvm.c.googlers.com> (message from
 Colton Lewis on Tue, 28 Jan 2025 22:08:27 +0000)
Mime-Version: 1.0
Message-ID: <gsnt34h235b5.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH 1/4] perf: arm_pmuv3: Introduce module param to
 partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: maz@kernel.org, kvm@vger.kernel.org, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, pbonzini@redhat.com, shuah@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_150817_482697_16641EEF 
X-CRM114-Status: GOOD (  12.98  )
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


Colton Lewis <coltonlewis@google.com> writes:

> Hey Marc, thanks for looking.

*for the review

> Marc Zyngier <maz@kernel.org> writes:

>> On Mon, 27 Jan 2025 22:20:27 +0000,
>> Colton Lewis <coltonlewis@google.com> wrote:

>>>    	/* Read the nb of CNTx counters supported from PMNC */
>>> -	bitmap_set(cpu_pmu->cntr_mask,
>>> -		   0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
>>> +	bitmap_set(cpu_pmu->cntr_mask, 0, pmcr_n);
>>> +
>>> +	if (reserved_guest_counters > 0 && reserved_guest_counters < pmcr_n) {
>>> +		cpu_pmu->hpmn = reserved_guest_counters;
>>> +		cpu_pmu->partitioned = true;

>> Isn't this going to completely explode on a kernel running at EL1?

> Trying to access an EL2 register at EL1 can do that. I'll add the
> appropriate hypercalls.

>> Also, how does it work in an asymmetric configuration where some CPUs
>> can satisfy the reservation, and some can't?

> The CPUs that can't read their own value of PMCR.N below what the
> attempted reservation is and so do not get partitioned. Nothing changes
> for that CPU if it can't meet the reservation.

My mistake. That does not happen. I originally did these comparisons in
armv8pmu_reset which runs for every CPU but __armv8pmu_probe_pmu
doesn't.

