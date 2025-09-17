Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA7ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy7kdzIRoahwzaXq+ZGvnPXEqK5VVBRIst3tKW3Ibxs=; b=1vYEPrSLJjAYVuP6uIFBvQiL3I
	TcowLmDAEIvIHsXHS4yG8T5IxFLDeLd1eTipnZuSqIAnT2my38XY1l8rpXF6E84fpCWqJ/3SJZlio
	KpIf8nkXFqH6+yR77J83LKyOh61jyv0Kl5Z2DZPt0qUhkbIXCT/xKUStJHRs2fd5DtDNObYy0s408
	JK92SpmVIYCt1lDXKh6R38/iT+Vp+wqHlOSJBEHjSUR25WmrxbvIagpidbaa0FE4WlYvJiYqO+/+h
	G7qKSE42c12LFaLtM37Fpjll6+z4CM+N2g6T0X64Fu0iAmKK+Gdg8PKL7DCMeHUfy2QvcPoB15zRd
	TCnHtXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytw5-0000000Cdw2-0ABg;
	Wed, 17 Sep 2025 15:19:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytw4-0000000CdvY-08zs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hy7kdzIRoahwzaXq+ZGvnPXEqK5VVBRIst3tKW3Ibxs=; b=b5sLabD2LK/4L+iY9tbHQeOi3U
	jtaVCyti7WY0/tt/M/fEKfiVOMCxONG3cnHsk0IdEZFBa0A0DbEAyEGeDKSePBvOIQtNo1efLPRYE
	ozB9x6Fjzog9sE6vMVvNT0Qmc/4I51sP5qQZ/hcIkgdJid4dM7et1yy8WmqNNksstPiH4gsaCvBOD
	3ljHpH/qThya+O24WYKq3LhoEOTdbsdgz2LJnGrCNF5JxW12+9GBEYxYfebf7zgSN3u2qQpHtaY8k
	kyqXVynTj8TpjsmubfL4CTzZgTXboeZUSGbYIVjAlpu/Lw/8q7FvN14DfbPAKGWjCGLmazrqafrvB
	JCSrvHgw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytw0-00000007QCf-2B5D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758122340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hy7kdzIRoahwzaXq+ZGvnPXEqK5VVBRIst3tKW3Ibxs=;
	b=WkP4W/PrzIWZmV6prRwjdw9frFLgeZUNmHuR1DhvPWEEp8l5121iI3wkzfxckzuvDRPkjJ
	oUKN9aNZclAdzj6iaNNXN0KRvCo80ZgDtG28+XweS0XlshhQjHeHMaksqRTSzZW634Mdup
	enHuKivdSp7h41nFqiCYKZayy+QfbfI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758122340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hy7kdzIRoahwzaXq+ZGvnPXEqK5VVBRIst3tKW3Ibxs=;
	b=WkP4W/PrzIWZmV6prRwjdw9frFLgeZUNmHuR1DhvPWEEp8l5121iI3wkzfxckzuvDRPkjJ
	oUKN9aNZclAdzj6iaNNXN0KRvCo80ZgDtG28+XweS0XlshhQjHeHMaksqRTSzZW634Mdup
	enHuKivdSp7h41nFqiCYKZayy+QfbfI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-cq7zEzuGMK-_MpCsnxIaaQ-1; Wed, 17 Sep 2025 11:18:57 -0400
X-MC-Unique: cq7zEzuGMK-_MpCsnxIaaQ-1
X-Mimecast-MFC-AGG-ID: cq7zEzuGMK-_MpCsnxIaaQ_1758122336
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45b990eb77cso8437405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122336; x=1758727136;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hy7kdzIRoahwzaXq+ZGvnPXEqK5VVBRIst3tKW3Ibxs=;
        b=RZ/r++RZeld77gemaz1a1hPLGxatAdJXTJoHIbSGbau34AZN14r2IYIQdeq4ae5AFS
         mpidSfdXbGthoUobTwJ7ksECyUdabsNY5XB9/2VJC66AXxlNY7CD1rKZT3J6paywHvb+
         6z+D/2aql/gY05GbjtZCJkfcAcG98xAye2FZMYhz5AbUIIVZO2zI+dSfK39aHJQkHBZi
         zBHiqS32oMvehOUYagUERdGKdNDcn4dxd3A9yeU5ydL/Q/yiT51vIQdQkYmXEKIzpNOK
         ZEXCIjGX4+wqOHjWlvcdncnCT+xbYfTv0Z+g6bK0955MWjzDvU1VCNN6S/UK62L5ztSu
         6JkA==
X-Forwarded-Encrypted: i=1; AJvYcCUSq9o2fGfXFrxg5FnE+M/txb5IZKQQiQds3uLeOGAbqtkyX/okGM/dP365wAIDu/egtfIIq7xjuNfBAZHE+by9@lists.infradead.org
X-Gm-Message-State: AOJu0YxhwFjjPDcEfKdz2YgJWl3k2TddzoMpoBXJ9IZNMW4cVCp7E64/
	nSU1J9XWvJ92jwBDEY63DXwntruIJz6zKAdJC2IiB8+EePY3T8raeJ16GTBMYZtIGi90a85YIce
	iGJfqn/2r5rdGcK89/1QaUiK3gD11Q12BAPEPeM41oKrbYeISpR/CCq/RHSziWtb0Bl7GS4BIQP
	BG
X-Gm-Gg: ASbGncvCETAmDc30xo2kYg0XwCGPGS+a/ENneuh8iNartc0AzDIpKzUL1sjZmPCRyn/
	ejYejUOCqc5hsGI9BVxzPHVzogRNnzOk+7I3xh/5+AFlxonYH0zoLercLWdDaz2n49df4kWBYfj
	YzToQIrYbdlCjip57x0vO2UsGz4Yf6GprjKomAF32O+xdECzImm3FJ/w9/BKiCFZf/vpduCLYDq
	ARFdjvVZHa2XrOb3LGmBoFEZRdGW3nTo19hMUbGVKo3VAJxBlAFrdWGV/ZBQWYvHY8oWjmiuyiL
	aN5DVNw0deDqz0WrlbF8ijHq4HZSoja2+3x+rkHPxRI7pWqQ/+I25IfRM1r73QV6Ov92WiVlayJ
	ybwqmBqc412/7uWniewsGBy9Bls/enVI/HjtwnAShx0RGLhPTdEMJv2vlJjC0Tx+Y
X-Received: by 2002:a05:600c:c0c2:b0:45d:e201:1603 with SMTP id 5b1f17b1804b1-45ffbb87d0fmr44805845e9.15.1758122335831;
        Wed, 17 Sep 2025 08:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZJXZpzuRjgrByrwR+JkhhVX9lJLsNt0iPyJ6yeH+tCAOWNZvmbwXLVLzskDHw5XXeFtjkaQ==
X-Received: by 2002:a05:600c:c0c2:b0:45d:e201:1603 with SMTP id 5b1f17b1804b1-45ffbb87d0fmr44805575e9.15.1758122335350;
        Wed, 17 Sep 2025 08:18:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f3211e8c7sm40537455e9.3.2025.09.17.08.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:18:52 -0700 (PDT)
Message-ID: <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com>
Date: Wed, 17 Sep 2025 17:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Eugen Hristev <eugen.hristev@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3_Rxi8CnwR2XFc_iXUL7lr8c3OasFk8PdAk4g3yDAYs_1758122336
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_161904_803708_1917908B 
X-CRM114-Status: GOOD (  33.48  )
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

On 17.09.25 17:02, Eugen Hristev wrote:
> 
> 
> On 9/17/25 17:46, David Hildenbrand wrote:
>> On 17.09.25 16:10, Thomas Gleixner wrote:
>>> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>>>> On 17.09.25 07:43, Eugen Hristev wrote:
>>>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>>>> I pointed you to a solution for that and just because David does not
>>>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>>>> their carefully localized variables.
>>>>
>>>> It would have been great if we could have had that discussion in the
>>>> previous thread.
>>>
>>> Sorry. I was busy with other stuff and did not pay attention to that
>>> discussion.
>>
>> I understand, I'm busy with too much stuff such that sometimes it might
>> be good to interrupt me earlier: "David, nooo, you're all wrong"
>>
>>>
>>>> Some other subsystem wants to have access to this information. I agree
>>>> that exposing these variables as r/w globally is not ideal.
>>>
>>> It's a nono in this case. We had bugs (long ago) where people fiddled
>>> with this stuff (I assume accidentally for my mental sanity sake) and
>>> caused really nasty to debug issues. C is a horrible language to
>>> encapsulate stuff properly as we all know.
>>
>> Yeah, there is this ACCESS_PRIVATE stuff but it only works with structs
>> and relies on sparse IIRC.
>>
>>>
>>>> I raised the alternative of exposing areas or other information through
>>>> simple helper functions that kmemdump can just use to compose whatever
>>>> it needs to compose.
>>>>
>>>> Do we really need that .section thingy?
>>>
>>> The section thing is simple and straight forward as it just puts the
>>> annotated stuff into the section along with size and id and I definitely
>>> find that more palatable, than sprinkling random functions all over the
>>> place to register stuff.
>>>
>>> Sure, you can achieve the same thing with an accessor function. In case
>>> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which
>>
>> Right, the challenge really is that we want the memory range covered by
>> that address, otherwise it would be easy.
>>
>>> do not expose the information already for real functional reasons adding
>>> such helpers just for this coredump muck is really worse than having a
>>> clearly descriptive and obvious annotation which results in the section
>>> build.
>>
>> Yeah, I'm mostly unhappy about the "#include <linux/kmemdump.h>" stuff.
>>
>> Guess it would all feel less "kmemdump" specific if we would just have a
>> generic way to tag/describe certain physical memory areas and kmemdump
>> would simply make use of that.
> 
> The idea was to make "kmemdump" exactly this generic way to tag/describe
> the memory.

That's probably where I got lost, after reading the cover letter 
assuming that this is primarily to program kmemdump backends, which I 
understood to just special hw/firmware areas, whereby kinfo acts as a 
filter.

> If we would call it differently , simply dump , would it be better ?
> e.g. include linux/dump.h
> and then DUMP(var, size) ?
> 
> could we call it maybe MARK ? or TAG ?
> TAG_MEM(area, size)

I'm wondering whether there could be any other user for this kind of 
information.

Like R/O access in a debug kernel to these areas, exporting the 
ranges/names + easy read access to content through debugfs or something.

Guess that partially falls under the "dump" category.

Including that information in a vmcore info would probably allow to 
quickly extract some information even without the debug symbols around 
(I run into that every now and then).

> 
> this would go to a separate section called .tagged_memory.
> 

Maybe just "tagged_memory.h" or sth. like that? I'm bad at naming, so I 
would let others make better suggestions.

> Then anyone can walk through the section and collect the data.
> 
> I am just coming up with ideas here.
> Could it be even part of mm.h instead of having a new header perhaps ?
> Then we won't need to include one more.

I don't really have something against a new include, just not one that 
sounded like a very specific subsystem, not something more generic.

-- 
Cheers

David / dhildenb


