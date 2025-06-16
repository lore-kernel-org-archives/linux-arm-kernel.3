Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEB8C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdiI/smVJOY0cX4ZuH0mmdvKWwyCh8vEN4C+U7z3NJo=; b=QDpBHbWtjpepZAQQYW/eBE2g4N
	CA4Ybfx+6kHBI9awn/4gbtu6s7TRpEpIcSRmQXROjqwQXVAoCLARpPUdSGq8RK0bLAAhJG91k3AC1
	wttCHxC0yW4tfGvEW2GEHDNKKKVTIYl6cDYNoCZWKk2miwZHjwBYnwPnxY88H6SG36CFD0Pvnz+GK
	PT+YLjVZL3+arwVZtwjpAMuNFE9ebMW1iJ8xjfwZhK0seX9Bk7TVfUDgPT0L677iO13pGbApPXNpo
	TgdTFJXKxKlQlfkX5+Lxj4WWFvcVaLA+3wMgy649W3nlowmRKdGFPDW1h5B4vz6I/EKYakigzNlR2
	Ca9Sxv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7oA-00000004Adw-2stm;
	Mon, 16 Jun 2025 11:15:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6pp-000000042ds-08cR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:13:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-addda47ebeaso861056966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 03:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750068779; x=1750673579; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdiI/smVJOY0cX4ZuH0mmdvKWwyCh8vEN4C+U7z3NJo=;
        b=BZo+D1VqjkZtpLRiLTuV9MmfKVdb97mI5ngTz4/QuRg+QzeqmgltBPmsC90Stc2meR
         4qpZR9iGm2iAmXuGMHNAfU6TnO96Zb/qKKd2ZbWpnBFwVMF5no3SX/DdE6ckol0wXzFL
         F+Avhneiu1cE4P9ZaoU87a0ojf3MxEqtOh5ARZZ3v8zsEUlqLM0fkR3OaMYc7xmAQRg1
         g7eV8HcCArtMnhyjpdKgRauSY+rOdN3LywDvg5rtnHZo8A6bMm/p88ImAfDuIv85v1iv
         pQc11BIdtITfora28Mq3K7F4RFOOTJd4h1LKixw+kZYME3MnR2KFA/L8atwaEV99yDB2
         HqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068779; x=1750673579;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdiI/smVJOY0cX4ZuH0mmdvKWwyCh8vEN4C+U7z3NJo=;
        b=oQy+DWC2ihebNnbFMroP7esOCcHJYKDk43d5rzdw5Xn7Hko148rqDkAfR3/s0AnGX9
         QXTCmRiAUJbbDCg106CtiRCjKOQCkYEQPb81UYQhLpoDWhubO7l7axc9nu3cQYb7vlN7
         cSvM3c0uuIpyCenUdvuHaGTaBAwPZJAmDNfyFQTB+AegceLSfSnVpCRxuRcDOUMlP70F
         GRQCwZW2HUumSC8RYqs4gh2UxAIj5A2RJbRRtR5wEV2gnFVAO6lgRVPq7zRBexJQ3VwO
         Pq4KDD18KUqYCm3dyUiSqf378KBNa497giJy0h0ZrM8uC9SPxxpOujXKfGrmmZgFCFLZ
         I32Q==
X-Forwarded-Encrypted: i=1; AJvYcCWr9IAOvjhweLRHIcUuGoHpVQRcmLTA5WgRMbr/HDdGP2/R9wTB1v32IjueTzvn5oFgNJj2UqxKBfxsIyq0O6Hb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx83PvjkywEqmYUoTkcdNZcnlO7U/HsvWJ4QHsk8/fiiMzqDLr
	P6Y+xFGJymrM15d2NrGS1XwAYpoiADGTGffwjNxZ/XJ2aVHkmS3EfyNENzxjjGWiwzE=
X-Gm-Gg: ASbGncs4nV9w4JjW9rG3/Rz7KfqxcpE4TA331mi/2kHvuMt/eE5C2Jn1YUVzXCsd7U6
	do0vCZjn+mZhxQ7x4C3APBqZXxD8B4XG8nJ0a20JWMNpVvvWw0ZydZF0zR/+28O44KqrcZvs313
	2EXdJK0XzZq2AjsnEWDTvXIr5k9nCInN6V6jYO8ENKiHRso8F5/djN4AgxNclBG0aGYbx7s1TKm
	ZfVZhmw/kDLcUGAssWmjXtf3WcFoe2Q8T0RdKmU9gzbRj43+0YWFLth7bBgKL5eRULHx5UZZyoz
	6WgINH7qwMHjeW0USFKWYX/nMX3AG210kctlCTI3/DF15a84++WPHthhwi21BsBAQud6x5vIJ2/
	eW85p
X-Google-Smtp-Source: AGHT+IGarxBcmQbjxtZfqg39/812dZL7oJLKKdvVC7LLX0AVrEROcYWKaHBGWjIfiBnmq6KNQDjrVw==
X-Received: by 2002:a17:907:db15:b0:ad5:8594:652e with SMTP id a640c23a62f3a-adfad469cf2mr788992566b.35.1750068779409;
        Mon, 16 Jun 2025 03:12:59 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897ac3dsm626980266b.155.2025.06.16.03.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:12:59 -0700 (PDT)
Message-ID: <6a493968-744a-4fa2-803c-3f64a8e7225e@linaro.org>
Date: Mon, 16 Jun 2025 13:12:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 andersson@kernel.org
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
 <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
 <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org> <87ikkzpcup.ffs@tglx>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <87ikkzpcup.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_031301_104237_54B806D9 
X-CRM114-Status: GOOD (  40.56  )
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



On 6/14/25 00:10, Thomas Gleixner wrote:
> On Fri, Jun 13 2025 at 17:33, Eugen Hristev wrote:
>> On 5/7/25 13:27, Eugen Hristev wrote:
>>>> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
>>>> kmemdump specific section and then kmemdump can just walk that section
>>>> and dump stuff. No magic register functions and no extra storage
>>>> management for static/global variables.
>>>>
>>>> No?
>>>
>>> Thank you very much for your review ! I will try it out.
>>
>> I have tried this way and it's much cleaner ! thanks for the
>> suggestion.
> 
> Welcome.
> 
>> The thing that I am trying to figure out now is how to do something
>> similar for a dynamically allocated memory, e.g.
>> void *p = kmalloc(...);
>> and then I can annotate `p` itself, it's address and size, but what I
>> would also want to so dump the whole memory region pointed out by p. and
>> that area address and size cannot be figured out at compile time hence I
>> can't instantiate a struct inside the dedicated section for it.
>> Any suggestion on how to make that better ? Or just keep the function
>> call to register the area into kmemdump ?
> 
> Right. For dynamically allocated memory there is obviously no compile
> time magic possible.
> 
> But I think you can simplify the registration for dynamically allocated
> memory significantly.
> 
> struct kmemdump_entry {
> 	void			*ptr;
>         size_t			size;
>         enum kmemdump_uids	uid;
> };
> 
> You use that layout for the compile time table and the runtime
> registrations.
> 
> I intentionally used an UID as that avoids string allocation and all of
> the related nonsense. Mapping UID to a string is a post processing
> problem and really does not need to be done in the kernel. The 8
> character strings are horribly limited and a simple 4 byte unique id is
> achieving the same and saving space.
> 
> Just stick the IDs into include/linux/kmemdump_ids.h and expose the
> content for the post processing machinery.
> 
> So you want KMEMDUMP_VAR() for the compile time created table to either
> automatically create that ID derived from the variable name or you add
> an extra argument with the ID.

First of all, thank you very much for taking the time to think about this !

In KMEMDUMP_VAR, I can use __UNIQUE_ID to derive something unique from
the variable name for the table entry.

The only problem with having something like

#define KMEMDUMP_VAR(sym) \
	 static struct entry __UNIQUE_ID(kmemdump_entry_##sym) ...

is when calling it with e.g. `init_mm.pgd` which will make the `.`
inside the name and that can't happen.
So I have to figure a way to remove unwanted chars or pass a name to the
macro.

I cannot do something like
static  void * ptr = &init_mm.pgd;
and then
KMEMDUMP_VAR(ptr)
because ptr's dereferencing can't happen at compile time to add it's
value into the table entry.

> 
> kmemdump_init()
>         // Use a simple fixed size array to manage this
>         // as it avoids all the memory allocation nonsense
>         // This stuff is neither performance critical nor does allocating
>         // a few hundred entries create a memory consumption problem
>         // It consumes probably way less memory than the whole IDR/XARRAY allocation
>         // string duplication logic consumes text and data space.
> 	kmemdump_entries = kcalloc(NR_ENTRIES, sizeof(*kmemdump_entries), GFP_KERNEL);
> 
> kmemdump_register(void *ptr, size_t size, enum kmemdump_uids uid)
> {
>         guard(entry_mutex);
> 
> 	entry = kmemdump_find_empty_slot();
>         if (!entry)
>         	return;
> 
>         entry->ptr = ptr;
>         entry->size = size;
>         entry->uid = uid;
> 
>         // Make this unconditional by providing a dummy backend
>         // implementation. If the backend changes re-register all
>         // entries with the new backend and be done with it.
>         backend->register(entry);
> }
> 
> kmemdump_unregister(void *ptr)
> {
>         guard(entry_mutex);
>         entry = find_entry(ptr);
>         if (entry) {
>                 backend->unregister(entry);
>         	memset(entry, 0, sizeof(*entry);
>         }
> }
> 
> You get the idea.
> 
> Coming back to the registration at the call site itself.
> 
>        struct foo = kmalloc(....);
> 
>        if (!foo)
>        		return;
> 
>        kmemdump_register(foo, sizeof(*foo), KMEMDUMP_ID_FOO);
> 
> That's a code duplication shitshow. You can wrap that into:
> 
>        struct foo *foo = kmemdump_alloc(foo, KMEMDUMP_ID_FOO, kmalloc, ...);
> 
> #define kmemdump_alloc(var, id, fn, ...)				\
> 	({								\
>         	void *__p = fn(##__VA_ARGS__);				\
> 									\
>                 if (__p)						\
>                 	kmemdump_register(__p, sizeof(*var), id);	\
> 		__p;
>         })
> 

I was thinking into a new variant of kmalloc, like e.g. kdmalloc() which
would be a wrapper over kmalloc and also register the region into
kmemdump like you are suggesting.
It would be like a `dumpable` kmalloc'ed memory.
And it could take an optional ID , if missing, it could generate one.

However this would mean yet another k*malloc friend, and it would
default to usual kmalloc if CONFIG_KMEMDUMP=n .
I am unsure whether this would be welcome by the community

Let me know what you think.

Thanks again !
Eugen

> or something daft like that. And provide the matching magic for the free
> side.
> 
> Thoughts?
> 
> Thanks,
> 
>         tglx


