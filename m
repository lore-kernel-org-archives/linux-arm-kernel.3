Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C91ECFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcAhY9XKnHu1x87JeH4LIsyajgYsI9qpkRkMGgbtVeI=; b=m4ffd8lmPAwTQBr2zwW613RBRw
	DmY9RHaBqxlpIHn5AZOo8r+YPueq4oSZVBKSjXL7xKoVZ07Z7okYV7BGbtcFwXLTFdO1WCTmcxVAQ
	VW796zgN6KH9A3ldAG1PLfl2GStP3UoF8rlaffvAY7p7uRw6CbCDWeaVyBc2KL6174RlQm0uZwFMn
	6GEzQghR5sB3gIIRFljDa+NOK0DFHNZpqVegJIRQsHMj4OHXVQM1A9tcn94+z69OTqWnZX42Vvujx
	R5QrntKbU6wT19xNZ1+X59/XxI/vSjdfA2o+VizbBxJbLR0/JNNU2gskLao7A9q5R+14ouhoHHjbm
	gHWewa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMmh-000000057fd-0UBS;
	Tue, 02 Dec 2025 09:34:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMme-000000057fD-1145
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:34:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA922153B;
	Tue,  2 Dec 2025 01:34:47 -0800 (PST)
Received: from [10.57.87.167] (unknown [10.57.87.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 314403F59E;
	Tue,  2 Dec 2025 01:34:53 -0800 (PST)
Message-ID: <340b05dd-d3d3-48bc-8201-7e4de0c02516@arm.com>
Date: Tue, 2 Dec 2025 09:34:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across
 arches
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251127105958.2427758-1-ryan.roberts@arm.com>
 <20251127105958.2427758-3-ryan.roberts@arm.com>
 <CAMj1kXFY1RXk8T4f46bkm_sr0nJfBoO+ii68JK4+CsRiDwKdCg@mail.gmail.com>
 <9097505d-b18b-4f85-a02c-7f2865ad8bca@arm.com>
 <CAMj1kXHX1W2Kz5NJehtzDhOCKWEd6y1sp8+ViOMHGsq9e8=7Pw@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXHX1W2Kz5NJehtzDhOCKWEd6y1sp8+ViOMHGsq9e8=7Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_013456_362171_26FCE050 
X-CRM114-Status: GOOD (  18.11  )
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

On 02/12/2025 09:15, Ard Biesheuvel wrote:
> On Mon, 1 Dec 2025 at 19:20, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 28/11/2025 11:01, Ard Biesheuvel wrote:
>>> On Thu, 27 Nov 2025 at 12:00, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>

[...]

>>>>  static inline void random_kstack_task_init(struct task_struct *tsk)
>>>>  {
>>>> -       current->kstack_offset = 0;
>>>> +       if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>>>> +                               &randomize_kstack_offset)) {
>>>> +               prandom_seed_state(&tsk->kstack_rnd_state, get_random_u64());
>>>
>>> We should either fix prandom_seed_state() not to truncate the u64 to
>>> u32, or even better, refactor prandom_seed_full_state() so we can
>>> reuse it here, and use a 128-bit seed directly.
>>
>> How about something like this:
>>
> 
> Looks good to me, but it does make we wonder why a full prandom state
> (i.e., one per cpu) isn't sufficient here, and why we are putting one
> in every task. Is it just to avoid the overhead of dis/enabling
> preemption on every syscall entry?

Good point, I'm not sure there is a good reason. It's just the shape I ended up
with after the first patch that fixes the bugs. But given we are removing the
second API call in this patch, the migraiton bug goes away. As you say, we could
disable preemption around the prandom_seed_state() call and it should all be
safe. I'll benchmark it.

> 
> 
> 
> 
> 
>>
>> ---8<---
>> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
>> index f2ed5b72b3d6..9b651c9b3448 100644
>> --- a/include/linux/prandom.h
>> +++ b/include/linux/prandom.h
>> @@ -19,10 +19,11 @@ struct rnd_state {
>>
>>  u32 prandom_u32_state(struct rnd_state *state);
>>  void prandom_bytes_state(struct rnd_state *state, void *buf, size_t nbytes);
>> -void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state);
>> +void prandom_seed_full_state_one(struct rnd_state *state);
>> +void prandom_seed_full_state_all(struct rnd_state __percpu *pcpu_state);
>>
>>  #define prandom_init_once(pcpu_state)                  \
>> -       DO_ONCE(prandom_seed_full_state, (pcpu_state))
>> +       DO_ONCE(prandom_seed_full_state_all, (pcpu_state))
>>
>>  /*
>>   * Handle minimum values for seeds
>> diff --git a/lib/random32.c b/lib/random32.c
>> index 24e7acd9343f..50d8f5f9fca7 100644
>> --- a/lib/random32.c
>> +++ b/lib/random32.c
>> @@ -107,24 +107,28 @@ static void prandom_warmup(struct rnd_state *state)
>>         prandom_u32_state(state);
>>  }
>>
>> -void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state)
>> +void prandom_seed_full_state_one(struct rnd_state *state)
>>  {
>> -       int i;
>> +       u32 seeds[4];
>>
>> -       for_each_possible_cpu(i) {
>> -               struct rnd_state *state = per_cpu_ptr(pcpu_state, i);
>> -               u32 seeds[4];
>> +       get_random_bytes(&seeds, sizeof(seeds));
>> +       state->s1 = __seed(seeds[0],   2U);
>> +       state->s2 = __seed(seeds[1],   8U);
>> +       state->s3 = __seed(seeds[2],  16U);
>> +       state->s4 = __seed(seeds[3], 128U);
>>
>> -               get_random_bytes(&seeds, sizeof(seeds));
>> -               state->s1 = __seed(seeds[0],   2U);
>> -               state->s2 = __seed(seeds[1],   8U);
>> -               state->s3 = __seed(seeds[2],  16U);
>> -               state->s4 = __seed(seeds[3], 128U);
>> +       prandom_warmup(state);
>> +}
>> +EXPORT_SYMBOL(prandom_seed_full_state_one);
>>
>> -               prandom_warmup(state);
>> -       }
>> +void prandom_seed_full_state_all(struct rnd_state __percpu *pcpu_state)
>> +{
>> +       int i;
>> +
>> +       for_each_possible_cpu(i)
>> +               prandom_seed_full_state_one(per_cpu_ptr(pcpu_state, i));
>>  }
>> -EXPORT_SYMBOL(prandom_seed_full_state);
>> +EXPORT_SYMBOL(prandom_seed_full_state_all);
>>
>>  #ifdef CONFIG_RANDOM32_SELFTEST
>>  static struct prandom_test1 {
>> ---8<---
>>


