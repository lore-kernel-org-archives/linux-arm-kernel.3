Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC3FD64079
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 19:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=X/YH5u+uVD0X+IYthPhg6GmXA/jaE5JARCEDgbJjUV8=; b=rGxfKCB+Y+iqZI
	4Gdn46kY9Hejsru1cegNVzMg4QWyoA1pRNhI9uevYbhXbDF3SOqSsXlqthUczAe6O8dtafTumO/5d
	OgkMVwh8DUjj/r2uE3n97FlAcTlL5MNEcwojsuKRFTivLaI2y5GeRpZy7oN+FOd9IRHgRXgV7YewS
	wPkbQ5TtKYZrg2jQDcLp5V2GcHQZLcRVsPIHup19WJztHnhaz8MGJaCMD9R6KBPkDCL8+BbDV8QYk
	ZLvwFtebFH0XV3K8L8En2Sl8kyoVB1M2MrzheoYD3KZFSepCNWDa3SicycqSXhW05Mgk1BWYtGi97
	QR8hQyZsCoGgz+EM3Rzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UI4-0000000Bgyo-3xKT;
	Fri, 08 Nov 2024 19:05:04 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UER-0000000BgJr-1EMH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 19:01:20 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea33140094so46844907b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731092477; x=1731697277; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/YH5u+uVD0X+IYthPhg6GmXA/jaE5JARCEDgbJjUV8=;
        b=irgJSPHel+T4I39ZNK6FLGmX+eSL/PGhZRETNxqSfcz1TtQYSfoN4snwbXfXfAjW/Q
         GlbJgwVp/jH6Eb/a8/0MybZsAugoakk78uUbN07UyKntq00KUlkjuZviiBGzlkgo3Eay
         o1zts4SxF+1EwCpmc/GSvqWQn0NIK0KsbdIIb2kjZvpLDLDJGZOV8zK14DazE6/zM1of
         pvrdg8PvpZm/zkVn4tuTQIlMqa8+FWvmNrFgFc6jbf87xWhqD+U6w/z3g8AqcTLXC5SI
         feeJ+o2Q/UUbZ2mqvsdssT0MSDWNmvsSvYkeQ+zx2o6Srn4sTBy9IADOrgTyB0L4sbtN
         Bj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731092477; x=1731697277;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/YH5u+uVD0X+IYthPhg6GmXA/jaE5JARCEDgbJjUV8=;
        b=H0ev8yfbK33Nxp5JSUzpQmodSxJSfIp/IqLvtXkgezXKw+wsYHxXvFVYnrO6tx+cNu
         y3vY3lpczZavwrWaXSXCZtogNknUzyfbPJegN/4HVBXke28eTEzae+SvkJn5evs4QUah
         mWJpXJZaVs9suo8CJBDyL6CVLbk24z2eOiZZsMmvvwD/NKloP275cbGHw5vwc9Bwp8D+
         uj4odJQm1IKPUsY7RPY8eHQXelczv4TZYSUtwr4WPv54mWFAcVzXZrerxqj5rdETypYv
         jwU5i7tX++NQ0WvkqVT2xRIoUA5p6qHKw9NnLrkugkiKkA8C6qOMdOdxzOHXlDLY39+0
         BuNA==
X-Forwarded-Encrypted: i=1; AJvYcCXNc0TTxAy7r4H6120vlgJBaRJOurF6pVwtVHwnZchEItzjO1hfjazSN/PZpHou/5PP1uTpmsgl383CumVoJIEb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrao46x5sc2ZwGtssowJOv8JFIndlnZLVf+qNz012me48JcbdY
	w9IP1UXajYQSO0ySonilM3dxajDxRGKdWtieEe0KgNwhO0016tmbdlzdgrQTP/D38ycl6S71gL8
	VWZK9VrEZtxAnQgPaK/RNig==
X-Google-Smtp-Source: AGHT+IHf5E46yE8Goi3JQ3NCwqhgizTTCCoxt5IIbUtqVWxYQ8qv+MmQFEFlUtd8c2orQuarK4c0d4RFcTxIc3XLxg==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:25c3:b0:6e3:d670:f62a with
 SMTP id 00721157ae682-6eadde333e0mr258367b3.3.1731092477590; Fri, 08 Nov 2024
 11:01:17 -0800 (PST)
Date: Fri, 08 Nov 2024 19:01:16 +0000
In-Reply-To: <20241108153411.GF38786@noisy.programming.kicks-ass.net> (message
 from Peter Zijlstra on Fri, 8 Nov 2024 16:34:11 +0100)
Mime-Version: 1.0
Message-ID: <gsntbjypft37.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
From: Colton Lewis <coltonlewis@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, will@kernel.org, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_110119_361494_C6DC8A4F 
X-CRM114-Status: GOOD (  20.33  )
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

Peter Zijlstra <peterz@infradead.org> writes:

> On Thu, Nov 07, 2024 at 07:03:35PM +0000, Colton Lewis wrote:
>> Break the assignment logic for misc flags into their own respective
>> functions to reduce the complexity of the nested logic.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
>> ---
>>   arch/x86/events/core.c            | 32 +++++++++++++++++++++++--------
>>   arch/x86/include/asm/perf_event.h |  2 ++
>>   2 files changed, 26 insertions(+), 8 deletions(-)

>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>> index d19e939f3998..9fdc5fa22c66 100644
>> --- a/arch/x86/events/core.c
>> +++ b/arch/x86/events/core.c
>> @@ -3011,16 +3011,35 @@ unsigned long  
>> perf_arch_instruction_pointer(struct pt_regs *regs)
>>   	return regs->ip + code_segment_base(regs);
>>   }

>> +static unsigned long common_misc_flags(struct pt_regs *regs)
>> +{
>> +	if (regs->flags & PERF_EFLAGS_EXACT)
>> +		return PERF_RECORD_MISC_EXACT_IP;
>> +
>> +	return 0;
>> +}
>> +
>> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>> +{
>> +	unsigned long guest_state = perf_guest_state();
>> +	unsigned long flags = common_misc_flags(regs);

> This is double common_misc and makes no sense

I'm confused what you mean. Are you referring to starting with
common_misc_flags in both perf_arch_misc_flags and
perf_arch_guest_misc_flags so possibly the common_msic_flags are set
twice?

That seems like a good thing that common flags are set wherever they
apply. You can't guarantee where perf_arch_guest_misc_flags may be
called in the future.
>> +
>> +	if (!(guest_state & PERF_GUEST_ACTIVE))
>> +		return flags;
>> +
>> +	if (guest_state & PERF_GUEST_USER)
>> +		return flags & PERF_RECORD_MISC_GUEST_USER;
>> +	else
>> +		return flags & PERF_RECORD_MISC_GUEST_KERNEL;

> And this is just broken garbage, right?

>> +}

> Did you mean to write:

> unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long guest_state = perf_guest_state();
> 	unsigned long flags = 0;

> 	if (guest_state & PERF_GUEST_ACTIVE) {
> 		if (guest_state & PERF_GUEST_USER)
> 			flags |= PERF_RECORD_MISC_GUEST_USER;
> 		else
> 			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> 	}

> 	return flags;
> }

Ok, my mistake was using & instead of |, but the branches are
functionally the same.

I'll use something closer to your suggestion.

>>   unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>>   {
>>   	unsigned int guest_state = perf_guest_state();
>> -	int misc = 0;
>> +	unsigned long misc = common_misc_flags(regs);

> Because here you do the common thing..


>>   	if (guest_state) {
>> -		if (guest_state & PERF_GUEST_USER)
>> -			misc |= PERF_RECORD_MISC_GUEST_USER;
>> -		else
>> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
>> +		misc |= perf_arch_guest_misc_flags(regs);

> And here you mix in the guest things.

>>   	} else {
>>   		if (user_mode(regs))
>>   			misc |= PERF_RECORD_MISC_USER;

