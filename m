Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF44CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIUjmKGGbQEJsCoFeZig1jDOJNxeqR+9vgxX7Gkos/k=; b=OEnDhLCUeq1/S1DQigjB82Mrhy
	QH8/fnDcihwqAaKrakZ/RvjU8tr3YGuUOWI6dyoQNrGua8fl7ppVMGvjR9g0+qaHK2QG3ceI0Xa9m
	cQXG4zvVSUEBs3kXQme1mLvSirBAiR8Lv97NreLZ9fVZLivU87FW/I0NiW+swLGqXadkH5ziAtFyu
	EBrkcMrHeV+vESrOchf0i2EXmXTCUcw+WJNqrduiHyDA1cl8ZcWafzLwYncfJtWiRJjr+nnGpD+69
	RRHbAVf0V72zVxJgtH6Ad8Ba3u2hffA857HSn/O9g4Ftu7giZsrGZs1omXqhyAO9HlwmXh2A45p6B
	r9E0N2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytg6-0000000CWAG-3oRL;
	Wed, 17 Sep 2025 15:02:38 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytg4-0000000CW7t-1OTv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:02:37 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1038482866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758121354; x=1758726154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIUjmKGGbQEJsCoFeZig1jDOJNxeqR+9vgxX7Gkos/k=;
        b=XT88mgYBbuAW5++5Kjq99ObtG69lzM8tQScTu5c+l+kIWMQNimeez6IU4nJGd5dXnS
         7XK4KG4BkTf7DVQrjdEAzuP3NapbFyWYpSSPR/lBYWF+2D64fuF1ft4yWutkH+Yp8+rE
         TtTe46qAvuUPtY8xwiqfNqEBJ46FQHEz8ijLB4hPbHrcApxYFe/RPUXUXXJZ76IGkO9d
         s0EJAVuf/9L0V7oUyQ7c0tjqcAodCp76nCxRmqlMB8c9GGSH+WqJvl/gBe2iQR1DEq9u
         1hlSBl4WFJDTZYZSTLZ4+ONNFNgTPt/kjHRhuJuI6Bq7vf5Q1KFxSd5K3Aa3rTjR6aJ+
         uHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121354; x=1758726154;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lIUjmKGGbQEJsCoFeZig1jDOJNxeqR+9vgxX7Gkos/k=;
        b=WMEFis7PJf8EUIQEm+eqPOkCbOPFI/LJM/9OsVjUOSvY++87oHjXBEQYnuQclrjW08
         2zy2jCzA0liGpUxP0Sct1z1xhybIQPwD2hYPOwXPMPDhVoUpzeurmwBHBAcvZsihq9Q6
         E95yv/Ta9y5saEjgPnCiIDnihHVJeEcIIq4FwnglbBzYYw1mXDH2oKCSeP6iQvGoHVLf
         0U3IQhf5Lkf2cgMmp64h0EKwEYLKyPNV+M1uIQa+l43W5KQSle1tHJzWnK7mBZ21HW2s
         r7vjmiEP15TzwozjqiCYWRZhOkUhjzHFgPr8NiLPpqfHi8LZwhwzMfYFnQeZv9u0E+31
         g62w==
X-Forwarded-Encrypted: i=1; AJvYcCXAGClYM+2C6xsPyPk0T+q0mhLhhx6AdhE/+xWTY8YaEOXTq1fgSsjQLrjPAq8yJcC8Rg4vumeRteUSaqA06y9T@lists.infradead.org
X-Gm-Message-State: AOJu0YzOSZ8hd0l6toU4vgtlPY3UEAlL0V3d1/JARPxqWMyRwStnjVi/
	OdMzelCD8tRyp5o1pX7KXTG+vEINAhztJZSiOTihP4Jcc1B5/tVV5SLOndU9Sdb1LbM=
X-Gm-Gg: ASbGnctwZP2GYnLBwIH87IF1rHdLOn/LJant0yLvJPZpht7By+sZzpv6EvI3o5EWaty
	bC6veDP0M5m3mLKBrCxgB0V2ZLQeTrEsM9WZwQ5jivVwcijFGHRFNHXdcYv7D53ZFanOyumIAMs
	TlB5lHwVPaPjFacx5CbgTEQe/1yU2tHZlGbUDLftJ/Uxpz3vnrIeatL+ia+L8uswY8aloUUNpIE
	8caA5fyvjGAo2wbScRweJi1rD1wn2UoG7D9XEyrwMP3ZCVLeFkWZCAmGH37Xb5N7oDcTQLwMps5
	ugpxqzVzjVMCX6y082zZobFRUPm7bb3Bs3/3vbufdSVKnrXSs2PmrUuMnfsu63EjVsw4OrMgwX/
	pbV73nSEYWcZVzs8hGO9dDpNfGUvKea9S
X-Google-Smtp-Source: AGHT+IH30uplY82utdrU9T7Dyp89uUZLy9OYpPpZfnqv2x2yCGVqH4bKpd1FnewjvmvV1dBnafhklA==
X-Received: by 2002:a17:907:6ea4:b0:b04:85f2:d272 with SMTP id a640c23a62f3a-b1bb935d70fmr292343066b.49.1758121353549;
        Wed, 17 Sep 2025 08:02:33 -0700 (PDT)
Received: from [172.20.10.3] ([109.166.135.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3347b90sm1362672466b.109.2025.09.17.08.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:02:33 -0700 (PDT)
Message-ID: <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
Date: Wed, 17 Sep 2025 18:02:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: David Hildenbrand <david@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_080236_419728_DF591017 
X-CRM114-Status: GOOD (  39.05  )
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



On 9/17/25 17:46, David Hildenbrand wrote:
> On 17.09.25 16:10, Thomas Gleixner wrote:
>> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>>> On 17.09.25 07:43, Eugen Hristev wrote:
>>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>>> I pointed you to a solution for that and just because David does not
>>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>>> their carefully localized variables.
>>>
>>> It would have been great if we could have had that discussion in the
>>> previous thread.
>>
>> Sorry. I was busy with other stuff and did not pay attention to that
>> discussion.
> 
> I understand, I'm busy with too much stuff such that sometimes it might 
> be good to interrupt me earlier: "David, nooo, you're all wrong"
> 
>>
>>> Some other subsystem wants to have access to this information. I agree
>>> that exposing these variables as r/w globally is not ideal.
>>
>> It's a nono in this case. We had bugs (long ago) where people fiddled
>> with this stuff (I assume accidentally for my mental sanity sake) and
>> caused really nasty to debug issues. C is a horrible language to
>> encapsulate stuff properly as we all know.
> 
> Yeah, there is this ACCESS_PRIVATE stuff but it only works with structs 
> and relies on sparse IIRC.
> 
>>
>>> I raised the alternative of exposing areas or other information through
>>> simple helper functions that kmemdump can just use to compose whatever
>>> it needs to compose.
>>>
>>> Do we really need that .section thingy?
>>
>> The section thing is simple and straight forward as it just puts the
>> annotated stuff into the section along with size and id and I definitely
>> find that more palatable, than sprinkling random functions all over the
>> place to register stuff.
>>
>> Sure, you can achieve the same thing with an accessor function. In case
>> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which
> 
> Right, the challenge really is that we want the memory range covered by 
> that address, otherwise it would be easy.
> 
>> do not expose the information already for real functional reasons adding
>> such helpers just for this coredump muck is really worse than having a
>> clearly descriptive and obvious annotation which results in the section
>> build.
> 
> Yeah, I'm mostly unhappy about the "#include <linux/kmemdump.h>" stuff.
> 
> Guess it would all feel less "kmemdump" specific if we would just have a 
> generic way to tag/describe certain physical memory areas and kmemdump 
> would simply make use of that.

The idea was to make "kmemdump" exactly this generic way to tag/describe
the memory.
If we would call it differently , simply dump , would it be better ?
e.g. include linux/dump.h
and then DUMP(var, size) ?

could we call it maybe MARK ? or TAG ?
TAG_MEM(area, size)

this would go to a separate section called .tagged_memory.

Then anyone can walk through the section and collect the data.

I am just coming up with ideas here.
Could it be even part of mm.h instead of having a new header perhaps ?
Then we won't need to include one more.

> 
> For example, wondering if it could come in handy to have an ordinary 
> vmcoreinfo header contain this information as well?
> 
> Case in point, right now we do in crash_save_vmcoreinfo_init()
> 
> 	VMCOREINFO_SYMBOL_ARRAY(mem_section);
> 	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
> 	VMCOREINFO_STRUCT_SIZE(mem_section);
> 
> And in kmemdump code we do
> 
> 	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_mem_section,
> 			     (void *)&mem_section, sizeof(mem_section));
> 
> I guess both cases actually describe roughly the same information: An 
> area with a given name.
> 
> Note 1: Wondering if sizeof(mem_section) is actually correct in the 
> kmemdump case
> 
> Note 2: Wondering if kmemdump would also want the struct size, not just 
> the area length.

For kmemdump, right now, debugging without vmlinux symbols is rather
impossible, so we have all that information from vmlinux.
> 
> (memblock alloc wrappers are a separate discussion)
> 
>>
>> The charm of sections is that they don't neither extra code nor stubs or
>> ifdeffery when a certain subsystem is disabled and therefore no
>> information available.
> 
> Extra code is a very good point.
> 
>>
>> I'm not insisting on sections, but having a table of 2k instead of
>> hundred functions, stubs and whatever is definitely a win to me.
> 
> So far it looks like it's not that many, but of course, the question 
> would be how it evolves.
> 


