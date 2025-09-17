Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0279CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovZ8mJqkmoqvvz8O8MVpBxVpu4t3oTHY8vOE+XFxYc0=; b=iojCOWj0sxpu9ajPm6zIAL1NKu
	9FRzM2qtdEKXMighfiHrlY6O3Dzxqqd/nfi9pQVXiNPQWf62hdG0dMBikLtfkNtmonCUoBg0t8KbZ
	mTPNW3P4GDvCrzoEasfC//J3xWI0atV7su1T4/Bqy7qs37GVw3untuIGJf72h8G2EQuZB1tAE/0Fk
	w5ysSgGQA8LJhCFs8K8g92Ef+lHS6Cxp+Lx6xyLNWuE6OUYRVxQf47jKsifiqNpAbmNyEGE8gW9wo
	HGmfJ7rVqqWP09IMFx+lOxJtWFRXZkp6JbUsdBVcxZe0j/a5P19/ALhUf9C8CTaQHa+BImXa10/JC
	ILQ71vqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytQq-0000000CMjg-33m5;
	Wed, 17 Sep 2025 14:46:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytQo-0000000CMh9-0Kwu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758120409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ovZ8mJqkmoqvvz8O8MVpBxVpu4t3oTHY8vOE+XFxYc0=;
	b=IOyADgdKt11LVqkfb2tNPg0U1n0WOIl5f75SJ3RgMBeLsLfWU/JL0hPjc8axKwwEAy3ij2
	WGFuBcfsKyGnuNCidXOGdJhN5295wRufh/DMKR+vEfDAKocU9auHOSyaLEUJwQ1Oi9Dily
	WFeyWLM0nX51APBD+5yCxj4y9t+Hnwc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-t9kL3uW7NyKcWB4JpBhQHg-1; Wed, 17 Sep 2025 10:46:47 -0400
X-MC-Unique: t9kL3uW7NyKcWB4JpBhQHg-1
X-Mimecast-MFC-AGG-ID: t9kL3uW7NyKcWB4JpBhQHg_1758120406
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b990eb77cso8086485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758120406; x=1758725206;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovZ8mJqkmoqvvz8O8MVpBxVpu4t3oTHY8vOE+XFxYc0=;
        b=lT010G8sGjZ3fVRhIbioMAg10LYMdF0q9ihpbXI1bAhk3AE3Poi6LNBZqVtYx487zw
         5o+sCg2LyDd6Iy/ViTPUVEBqFnzKPU+MJ7uf9UYVQ1oqhhNiYU84s8wwCxRj4xoYyKFo
         DrMWhUQ5slQi4T+qJJDLHRrngGtXfPm13LpPVplj60cjYICKBjxh5nJi+MxbE+Vkt96b
         VnEVRx/ohvIwrhADwCJcnAr2UrHopUREUSnnUydZxXoaiOXMf6bK/dXs8K7FZ9FM1pVm
         GscWPPqlAbyzWkg66HUlHqyH8y7U2jJsVjKJfQrjlq8r9a5SQlPX2/GMNDVZSFZwt1H8
         Zbqw==
X-Forwarded-Encrypted: i=1; AJvYcCWrRIfCWzO9OlWcisEYLncQmI4hwIwh1ZhBBmkEganFtyARzE3JRFhVxIL0ao1hhnJ+MOUosGXJaCgTr6G49Wqk@lists.infradead.org
X-Gm-Message-State: AOJu0YxAs2l+cHFj2AxTFetCYJv48tzaz7Up0mQD0Zd7iKM9cXKp7sLc
	Lm4q29vkL0OpfcQpjoz5ZrZ2lUMVtqkw2GYb+froUPoxNK2Wz8pax2/BB2K47fl1N9knDGALmYd
	WmyNw/hQi+7CLb2fJED1HGDMmSjw5aaIELa7/ee7jYzsDvLI06juGGLwQeE8ntOWqVPSTyvHYep
	l5
X-Gm-Gg: ASbGncuROivREHNT5wIkRPGWV+NIYN1Gnubx5nQvOaHNnYCg7KnrliBegM18tTsDmJg
	/VyPx0Eva3iVIVZQPJPF9qZOv+1cl0yfFNiPDdVhkxKp/Kw0tJAYY3LA8BkDPrgqtw7uuCfA/D4
	tUi2t2WWgRYBbgch3L9bboVgRlGSuXFI3YAAUsBzYjk0QHws5vBpp1eZdQREdkDG5jgNe9toaUG
	wh3HCk42cuU/auIjU/HwB6WAR2fWOU/1kMTwxMea4vkfyIg04tABLAOuYByo6t4bB4g/Kvw7HVI
	JV2VsX8277nO8VaBDLwNFUx2LR9DYudpOtwWx3KXWPx46gSNKXmXLQwCFrszDJJxsKpt0HrJ+DA
	CGkYuMjghG11yG2r9Z1xrjaEh/kVgGb99Baa95Fkt1/UziQfb+A01ClIAkmmtQiFW
X-Received: by 2002:a05:600c:4888:b0:459:d577:bd24 with SMTP id 5b1f17b1804b1-45f32d0869fmr46709685e9.7.1758120405810;
        Wed, 17 Sep 2025 07:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Ufl1M6AshTZE+vFOVXEwIa1YoUqQ1InS/YuHHadh0wrsGDimF+1HMnmk4PGp9MwHqliWqQ==
X-Received: by 2002:a05:600c:4888:b0:459:d577:bd24 with SMTP id 5b1f17b1804b1-45f32d0869fmr46709295e9.7.1758120405326;
        Wed, 17 Sep 2025 07:46:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f325a32f6sm40132415e9.2.2025.09.17.07.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:46:44 -0700 (PDT)
Message-ID: <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
Date: Wed, 17 Sep 2025 16:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>,
 Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <87v7lh891c.ffs@tglx>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iV2qbjEXqb84Hcth14wmK8lpQxpkRK-xGc-19LqI3fI_1758120406
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_074650_183859_63F33371 
X-CRM114-Status: GOOD (  31.25  )
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

On 17.09.25 16:10, Thomas Gleixner wrote:
> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>> On 17.09.25 07:43, Eugen Hristev wrote:
>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>> I pointed you to a solution for that and just because David does not
>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>> their carefully localized variables.
>>
>> It would have been great if we could have had that discussion in the
>> previous thread.
> 
> Sorry. I was busy with other stuff and did not pay attention to that
> discussion.

I understand, I'm busy with too much stuff such that sometimes it might 
be good to interrupt me earlier: "David, nooo, you're all wrong"

> 
>> Some other subsystem wants to have access to this information. I agree
>> that exposing these variables as r/w globally is not ideal.
> 
> It's a nono in this case. We had bugs (long ago) where people fiddled
> with this stuff (I assume accidentally for my mental sanity sake) and
> caused really nasty to debug issues. C is a horrible language to
> encapsulate stuff properly as we all know.

Yeah, there is this ACCESS_PRIVATE stuff but it only works with structs 
and relies on sparse IIRC.

> 
>> I raised the alternative of exposing areas or other information through
>> simple helper functions that kmemdump can just use to compose whatever
>> it needs to compose.
>>
>> Do we really need that .section thingy?
> 
> The section thing is simple and straight forward as it just puts the
> annotated stuff into the section along with size and id and I definitely
> find that more palatable, than sprinkling random functions all over the
> place to register stuff.
> 
> Sure, you can achieve the same thing with an accessor function. In case
> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which

Right, the challenge really is that we want the memory range covered by 
that address, otherwise it would be easy.

> do not expose the information already for real functional reasons adding
> such helpers just for this coredump muck is really worse than having a
> clearly descriptive and obvious annotation which results in the section
> build.

Yeah, I'm mostly unhappy about the "#include <linux/kmemdump.h>" stuff.

Guess it would all feel less "kmemdump" specific if we would just have a 
generic way to tag/describe certain physical memory areas and kmemdump 
would simply make use of that.

For example, wondering if it could come in handy to have an ordinary 
vmcoreinfo header contain this information as well?

Case in point, right now we do in crash_save_vmcoreinfo_init()

	VMCOREINFO_SYMBOL_ARRAY(mem_section);
	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
	VMCOREINFO_STRUCT_SIZE(mem_section);

And in kmemdump code we do

	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_mem_section,
			     (void *)&mem_section, sizeof(mem_section));

I guess both cases actually describe roughly the same information: An 
area with a given name.

Note 1: Wondering if sizeof(mem_section) is actually correct in the 
kmemdump case

Note 2: Wondering if kmemdump would also want the struct size, not just 
the area length.

(memblock alloc wrappers are a separate discussion)

> 
> The charm of sections is that they don't neither extra code nor stubs or
> ifdeffery when a certain subsystem is disabled and therefore no
> information available.

Extra code is a very good point.

> 
> I'm not insisting on sections, but having a table of 2k instead of
> hundred functions, stubs and whatever is definitely a win to me.

So far it looks like it's not that many, but of course, the question 
would be how it evolves.

-- 
Cheers

David / dhildenb


