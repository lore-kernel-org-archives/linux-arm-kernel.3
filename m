Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BD3CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4k5J8VkcsZOGowc/PhE+thWQDtpKbu6223a2JTLS/I=; b=3MP+A1tVLnWJ6GnpAudzAH2zNi
	VI1x3RZ6vZjS3PkBZkhsFjHGkYGAlnst+yYiSsFJUwDd/rZ3DQ5NF3/4QdKSCxUxiiWSP6JYEp2uj
	U7IlhNYQAMVHxiaSuKvyCHsFVLvUwIgq/jcOGs43/C6PJNNNhMgjlSxBWJ0sD/NnWE4cma2+IECM9
	s1JoJv/kp81AjnfbDmXUkrHmNvwdrDBf+uJV6IUrTIDjQHREI2DdUZV/os3EeOkOTCgpTpoELOeRQ
	UMkLc4m6EpeScsY3PNqD3dmSFKyG6lEAwE5TNU+wGfG5rUawyaPVgeRfJj2i8zVCk+NJ03djoic1r
	qIZVTfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu9K-0000000Cjex-2fRo;
	Wed, 17 Sep 2025 15:32:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu9J-0000000Cje9-2eIK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V4k5J8VkcsZOGowc/PhE+thWQDtpKbu6223a2JTLS/I=; b=bUzQYP/WsYKqkWMm2REp+pgJ/7
	9cGOTNkjPwhAmD8NeseFWNNY6blw8B8HQqylP44dYaKf6DafxBAJkV5/Rl/J5cdcd75WO6IF0sMow
	OMBreYaKzzieQq82fb6VGmF5gFT1jsulR9R5hX1VHUA+cqurPKW5dVu1lHcJ8EeV0rZkHpAywPeON
	SrOSRJEY41f6uwFqZWVk9CTqpj1fs9KG27quG17Lq8IqVHLWl6q/Tq2OKPVxPLz0HAlLc2zbf11ij
	Salz+GDYZXx6woahknwvuViM2HJiGvsR+pjsFSSwVOrqMJUrCIyNtTVViFR3HhA6Jg4OQtR9EFcD0
	ZlL2pXGg==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu9G-00000007R6o-2fem
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:32:48 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso8617666a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758123164; x=1758727964; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4k5J8VkcsZOGowc/PhE+thWQDtpKbu6223a2JTLS/I=;
        b=sdUFz0Qp9u+JQKtXK1m/2rJfGYkfJAwV4HAvYl4kfYgBRB9xeF36Nsx24a042ugQNX
         wHtfMSy0DMJjDrc/0uyJiBaPLu17P5fjZpw106pnHZO14DvxpCzW0bmN7TW+49zSp1MD
         toXL8/0OsvjfZ/nPJx8hfgAmoMqNmdMfVqy/9gVnm9iDoLRPnkyXKoiS4pE58WMbSX2I
         gTkF5FgbjD4uG6WrNG9gxuCX/5IKio8FcVm5oteaLcnd7AIF2NLhmgaLuxNMuvhT1KDC
         5Rr//y6o43cw9re9DSsZaXX/0By6vLVtUA6meExf9IvCPswKMsEbe39fyFW1cqP5fBr9
         hwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758123164; x=1758727964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4k5J8VkcsZOGowc/PhE+thWQDtpKbu6223a2JTLS/I=;
        b=bkg5uM4a7hVrCh3qUBsaDZ9EH0M0UbI3F/YO4R9bkUiVTtCVI7XKlGVkdn8F7BC0VA
         Mnh9NcERBWPCCFqOzodMFuMdUYnyU3BQ1Rl6S+1tStGbyzHRZ7JxUEP0CtaL6Ad2dkPK
         4sJMuuUsPIlWF5fvEmCR0JeeiTbPd9PHJ42WNaPoeIyRXUfxwKxf+cTdLtAyO4Z2NAEn
         5n9i4cRaehI/6Yt5pFZI+BuVJP+3m+xzcj3rh0pLY//c8saEB3GbedrbvlPGkUhRcBLv
         mQklSZy+u+YQuaQbZbMHwlQMaEb71+8bay9YaY4JTChhE9daiCGEVnr6eihZ1bk6kQ06
         8+JA==
X-Forwarded-Encrypted: i=1; AJvYcCUWw41ZMxposWSnEFB8a3qOA+lLyJ9Uvbx3MBfUWPwd67RpVQ27jTG2lAF4wZ2qV83bLZV2o8w9IuaSgSomYgPu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw89j/nMeM4cHeIm7WfsBOWhs5cgXgIdOCJx4kzWfOobBjgKFm3
	iG5T+rM8xwS1Qjaly8eiF8K37y6LZ/B9oG4AWQGIKi9mmNyd6LrECcl8zW7ojLXD5aI=
X-Gm-Gg: ASbGncsV9hoGCgor6xnb42iy1iCjRbdHEpcjKXM1Sx3h7d+S7pZfwksdUPqALcukaLC
	9J5ZHN40SwsMtNYDSh84jMR94ARMJ0dVhgWlSdOpRZQ8ESUlBc9Go7x99uepmpWRCbzoPw/jX59
	sw/pdmMYadoA0gzSEwUM6ZoJtm0pPAmX8Yzaj2imqAcCDAFfyiUQEnUA0bbOFa7dYCnWr2kXq90
	7dmnzWzhnXCY4y3tuOL8XuR2qpRwkYDcoMynpScVRiMM+TtUK2Ce3jK2516+UBEStCNk3DpILHZ
	m4D5fr5vn0FPOXwXqebEMB215gsT3uc3zEcvnj/5nLuKTSQLYLS6DbQ5IOnlcGInbqEEunTUl29
	U/wIdIHmOasp+clgQC+kOy3m88NFuleH1XWTALQhzxss=
X-Google-Smtp-Source: AGHT+IE8ZMv8HN0yNwSikwv6pMskOhk9zA0LwfuIGCKmhTnIQQy04Vwmljxv3YCiPD4eKH8iHrC6Ug==
X-Received: by 2002:a17:906:6a09:b0:b04:a1a4:4bec with SMTP id a640c23a62f3a-b1bc020111bmr330491066b.58.1758123164384;
        Wed, 17 Sep 2025 08:32:44 -0700 (PDT)
Received: from [172.20.10.3] ([109.166.135.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b317124esm1395390166b.46.2025.09.17.08.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:32:43 -0700 (PDT)
Message-ID: <10540b3e-09ca-403d-bc20-b9412a7fe28a@linaro.org>
Date: Wed, 17 Sep 2025 18:32:41 +0300
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
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_163246_864972_C78FDBED 
X-CRM114-Status: GOOD (  43.09  )
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



On 9/17/25 18:18, David Hildenbrand wrote:
> On 17.09.25 17:02, Eugen Hristev wrote:
>>
>>
>> On 9/17/25 17:46, David Hildenbrand wrote:
>>> On 17.09.25 16:10, Thomas Gleixner wrote:
>>>> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>>>>> On 17.09.25 07:43, Eugen Hristev wrote:
>>>>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>>>>> I pointed you to a solution for that and just because David does not
>>>>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>>>>> their carefully localized variables.
>>>>>
>>>>> It would have been great if we could have had that discussion in the
>>>>> previous thread.
>>>>
>>>> Sorry. I was busy with other stuff and did not pay attention to that
>>>> discussion.
>>>
>>> I understand, I'm busy with too much stuff such that sometimes it might
>>> be good to interrupt me earlier: "David, nooo, you're all wrong"
>>>
>>>>
>>>>> Some other subsystem wants to have access to this information. I agree
>>>>> that exposing these variables as r/w globally is not ideal.
>>>>
>>>> It's a nono in this case. We had bugs (long ago) where people fiddled
>>>> with this stuff (I assume accidentally for my mental sanity sake) and
>>>> caused really nasty to debug issues. C is a horrible language to
>>>> encapsulate stuff properly as we all know.
>>>
>>> Yeah, there is this ACCESS_PRIVATE stuff but it only works with structs
>>> and relies on sparse IIRC.
>>>
>>>>
>>>>> I raised the alternative of exposing areas or other information through
>>>>> simple helper functions that kmemdump can just use to compose whatever
>>>>> it needs to compose.
>>>>>
>>>>> Do we really need that .section thingy?
>>>>
>>>> The section thing is simple and straight forward as it just puts the
>>>> annotated stuff into the section along with size and id and I definitely
>>>> find that more palatable, than sprinkling random functions all over the
>>>> place to register stuff.
>>>>
>>>> Sure, you can achieve the same thing with an accessor function. In case
>>>> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which
>>>
>>> Right, the challenge really is that we want the memory range covered by
>>> that address, otherwise it would be easy.
>>>
>>>> do not expose the information already for real functional reasons adding
>>>> such helpers just for this coredump muck is really worse than having a
>>>> clearly descriptive and obvious annotation which results in the section
>>>> build.
>>>
>>> Yeah, I'm mostly unhappy about the "#include <linux/kmemdump.h>" stuff.
>>>
>>> Guess it would all feel less "kmemdump" specific if we would just have a
>>> generic way to tag/describe certain physical memory areas and kmemdump
>>> would simply make use of that.
>>
>> The idea was to make "kmemdump" exactly this generic way to tag/describe
>> the memory.
> 
> That's probably where I got lost, after reading the cover letter 
> assuming that this is primarily to program kmemdump backends, which I 
> understood to just special hw/firmware areas, whereby kinfo acts as a 
> filter.

If there is a mechanism to tag all this memory, or regions, into a
specific section, what we would do with it next ?
It would have a purpose to be parsed and reused by different drivers,
that would be able to actually use it.
So there has a to be some kind of middleman, that holds onto this list
of regions, manages it (unique id, add/remove), and allows certain
drivers to use it.
Now it would be interesting to have different kind of drivers connect to
it (or backends how I called them).
One of these programs an internal table for the firmware to use.
Another , writes information into a dedicated reserved-memory for the
bootloader to use on the next soft reboot (memory preserved).
I called this middleman kmemdump. But it can be named differently, and
it can reside in different places in the kernel.
But what I would like to avoid is to just tag all this memory and have
any kind of driver connect to the table. That works, but it's quite
loose on having control over the table. E.g. no kmemdump, tag all the
memory to sections, and have specific drivers (that would reside where?)
walk it.

> 
>> If we would call it differently , simply dump , would it be better ?
>> e.g. include linux/dump.h
>> and then DUMP(var, size) ?
>>
>> could we call it maybe MARK ? or TAG ?
>> TAG_MEM(area, size)
> 
> I'm wondering whether there could be any other user for this kind of 
> information.
> 
> Like R/O access in a debug kernel to these areas, exporting the 
> ranges/names + easy read access to content through debugfs or something.

One idea I had to to have a jtag script read the table , parse it, and
know where some information resides.
Another idea is to use Uboot in case of persistent memory across reboot,
and Uboot can read all the sections and assemble a ready-to-download
coredump. (sure this doesn't work in all cases)
What can be done in case of hypervisor is to implement there a routine
that would read it, in case the OS is non-responsive, or even in the
secure monitor.
Another suggestion I had from someone was to use a pure software default
backend in which to just keep the regions stored, and it could be
accessed through userspace or read by a crash analyzer.

> 
> Guess that partially falls under the "dump" category.
> 
> Including that information in a vmcore info would probably allow to 
> quickly extract some information even without the debug symbols around 
> (I run into that every now and then).
> 
>>
>> this would go to a separate section called .tagged_memory.
>>
> 
> Maybe just "tagged_memory.h" or sth. like that? I'm bad at naming, so I 
> would let others make better suggestions.
> 
>> Then anyone can walk through the section and collect the data.
>>
>> I am just coming up with ideas here.
>> Could it be even part of mm.h instead of having a new header perhaps ?
>> Then we won't need to include one more.
> 
> I don't really have something against a new include, just not one that 
> sounded like a very specific subsystem, not something more generic.
> 


