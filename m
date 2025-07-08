Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA7CC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sSGE81kG8MSU1EuzRA4Ju+fw25jrq48Z8DcwNvLiEVI=; b=KurIO197yp4y5M
	wdIsX2QeqPDhrcfjBce5fwpsV4XLDulXdrIg4s9rQ2GLWaH3T8Q7jyDTulGu5b6T/VLG06/fsQQQK
	LDB0P4+N+0m0pb4wNpMwtfZ0TnVRUkY+hvQWAxj6e85Kw0vZqAEBFcHsYNgTlDQHTOIiXzsgjzXI8
	zisaDlI41frVAgMxA36jZC2EfZe1+dv1rMwdJoZ6wgbRudN1u15GYOmYQJAu8H3ICIrboWEnNkX1W
	JVC3LZ+HAHUT6959X2SeWRmnqK2jKwI9gF3IM4nZ8m/Shy52vSDjGlqbMK7jSs39iFq3NI3DcWCcV
	S7ZFUbTzR+INp+vmvK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZH1Y-00000006p6J-12HW;
	Tue, 08 Jul 2025 22:42:52 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGx2-00000006oTu-1nTq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:38:13 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-875bd5522e9so422704339f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752014291; x=1752619091; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sSGE81kG8MSU1EuzRA4Ju+fw25jrq48Z8DcwNvLiEVI=;
        b=WjYuJNh8l1h5YkZ6K6jWOYBanVqkPmOm4CP4SnuCdNbcMZOMfWp5cY+YZ/DhE9x7A2
         qvtCkknkVK1uccpavuooq9uLV1BeONF1GuFD5MyYQ27c7AlNovcn2579IA58XF3jqJPP
         Zc/8WJNNTQ4j/2SE0G7Jw0F5JrnVaPONjLbqr9LyI5x93YP/IJKGvM+S3PBT4KDGdxAm
         4QNIO3SWoXRq3mzskI+WZLbREwAhqW3gGQ7I1BMZltzLFN/sbkBuz17hjvEnaIp9Ioy7
         b5FPwVKZ7WIm8UhiYj+2QZfjMcUq4XOIuGeJ9jCaClS1fMmrP9cT6RoJN9rXO75Zthbr
         kjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752014291; x=1752619091;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSGE81kG8MSU1EuzRA4Ju+fw25jrq48Z8DcwNvLiEVI=;
        b=KluaSmk7NOXQEVQ91FzjaY1Q0DMkKxUCOZMfe9NxTNk6O+uda+/HEyJODfpZt+Ad1u
         JScS0YJxJy441k1/PuLPA/fYqoYS51LGyBgRAIiXvyZyOmdTriKFtkdCYzFos8zti3ZV
         /xcBQ8jCaTxRl0wBQ4iEl9B9l/9kbn3JDKmFW1Ug2OwUBI4EflqmyHTHQfR543h/E7kC
         rmVBlgGJapfKdHcoG1flKvxAWjI1RdqSiuL8fhCbkQAvgnFx/ekfiT59q+RvL1xMUDCL
         ccWo7we1wcrkoqwe3csKUxOdWZw9BVZIDS0msLeV3hEhWxTEvwJ0r3W00mH0k2F57Ri4
         P6yg==
X-Forwarded-Encrypted: i=1; AJvYcCVwscdupY/tAZ4KwDvc3/9nk1Zaqka/ABVhLseaxAYzrXgk6BEwZhEp+hhSg1vU8hhq3joSDxjl4Ib4EOgGhax1@lists.infradead.org
X-Gm-Message-State: AOJu0YyeO0ePhcksPNZsFAm8Zp+3HjeBkSQbVkrWvw4BVdGUIJkEJl1Z
	mLMPSmn+ld4Xxu0dk0GFH+qa6TOgTJJIUDwdE3EHOhGJu8EgUb05qY6N2jV8VHoqSqK5tb1pK00
	jjStD2YGuqsDO8JKKEDydgwoqUw==
X-Google-Smtp-Source: AGHT+IElZSU1mvIYmkS4wS1+niCRVTirXhRKz2Czs2rKpnrIyPxUWzZESy39W+5ywF5yW6YiMbWYADPEahU+1UGQ7Q==
X-Received: from ilbea23-n1.prod.google.com ([2002:a05:6e02:4517:10b0:3df:34b7:24e5])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1a8d:b0:3df:2f47:dc21 with SMTP id e9e14a558f8ab-3e16711a372mr4583915ab.22.1752014291170;
 Tue, 08 Jul 2025 15:38:11 -0700 (PDT)
Date: Tue, 08 Jul 2025 22:38:10 +0000
In-Reply-To: <aGv8vgrZTET0aXjQ@J2N7QTR9R3> (message from Mark Rutland on Mon,
 7 Jul 2025 17:58:38 +0100)
Mime-Version: 1.0
Message-ID: <gsntzfdez4tp.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 07/22] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_153812_468199_54399C43 
X-CRM114-Status: GOOD (  13.95  )
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

Mark Rutland <mark.rutland@arm.com> writes:

> On Thu, Jun 26, 2025 at 08:04:43PM +0000, Colton Lewis wrote:
>> The OVSR bitmasks are valid for enable and interrupt registers as well as
>> overflow registers. Generalize the names.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> FWIW, this looks fine to me, so:

> Acked-by: Mark Rutland <mark.rutland@arm.com>

> Mark.

Thanks.
>> ---
>>   drivers/perf/arm_pmuv3.c       |  4 ++--
>>   include/linux/perf/arm_pmuv3.h | 14 +++++++-------
>>   2 files changed, 9 insertions(+), 9 deletions(-)

>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> index 6358de6c9fab..3bc016afea34 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -513,7 +513,7 @@ static u64 armv8pmu_pmcr_n_read(void)

>>   static int armv8pmu_has_overflowed(u64 pmovsr)
>>   {
>> -	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
>> +	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
>>   }

>>   static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
>> @@ -749,7 +749,7 @@ static u64 armv8pmu_getreset_flags(void)
>>   	value = read_pmovsclr();

>>   	/* Write to clear flags */
>> -	value &= ARMV8_PMU_OVERFLOWED_MASK;
>> +	value &= ARMV8_PMU_CNT_MASK_ALL;
>>   	write_pmovsclr(value);

>>   	return value;
>> diff --git a/include/linux/perf/arm_pmuv3.h  
>> b/include/linux/perf/arm_pmuv3.h
>> index d698efba28a2..fd2a34b4a64d 100644
>> --- a/include/linux/perf/arm_pmuv3.h
>> +++ b/include/linux/perf/arm_pmuv3.h
>> @@ -224,14 +224,14 @@
>>   				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)

>>   /*
>> - * PMOVSR: counters overflow flag status reg
>> + * Counter bitmask layouts for overflow, enable, and interrupts
>>    */
>> -#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
>> -#define ARMV8_PMU_OVSR_C		BIT(31)
>> -#define ARMV8_PMU_OVSR_F		BIT_ULL(32) /* arm64 only */
>> -/* Mask for writable bits is both P and C fields */
>> -#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C  
>> | \
>> -					ARMV8_PMU_OVSR_F)
>> +#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
>> +#define ARMV8_PMU_CNT_MASK_C		BIT(31)
>> +#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
>> +#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
>> +					 ARMV8_PMU_CNT_MASK_C | \
>> +					 ARMV8_PMU_CNT_MASK_F)

>>   /*
>>    * PMXEVTYPER: Event selection reg
>> --
>> 2.50.0.727.gbf7dc18ff4-goog


