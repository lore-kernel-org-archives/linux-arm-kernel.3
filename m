Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C034CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7efdXg49cd0dO4HNsPgED93u6J0FRsteNdyMBWuRc0=; b=mc/pkSq4uSVRN1GZ6syYCybzcp
	QfYC3/B9UrCEGrRqHk3yatA+701rh1AuW0wOyWJFCByS2dGSLNQTitqwiWgivUHLYOUW5hGLUvd2n
	BFp3Zy9Sz7MI0FRqUvZQHJQ5p+WDbAJ9CL48x1zDnkaZF4EkL8G75fROBxB7iDFwS/RIKCYBNfiAg
	6+iBl31h1v7wd/OsgctDTeq5vYGf9HSgkjXcNzT4Z/fNdDGr3Wy8t2bsdfmF1BGhXFY/k5yJLmGE3
	J50fAh89K67GT3i6rsP5+Vp8bOibPXFdElIMKqSKjW1xWRBgfBU2dq4Iqx6HyA0Vs0cHw8+fZQVag
	xRrrEYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzF56-000000000Go-0Y3A;
	Thu, 18 Sep 2025 13:53:52 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzF54-000000000G3-164z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:53:51 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b07ba1c3df4so179936766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758203628; x=1758808428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7efdXg49cd0dO4HNsPgED93u6J0FRsteNdyMBWuRc0=;
        b=sXyImLb1zFRMTTolWgpLmGN0VjFnfoG/hIa+W4H3AU2PZKPp+KdkCp1P82YU/04tWH
         J4m/4We1rey2Goalb1ABIOs1+eXw16TjsuCe4gcA87F6bvVI2aKpNrQfKK0QWX9RjPa7
         6vPhX//mZgrrbfSaoakfrLTvc8SxcdhUpd3j0w6Y+I25RqL10i31HlSpPxgcx2xDMkFi
         H1//dXu69NgNuOGJp5PRm76flfqSui+LUHWwgz7yhleTRISIrkTsV7vw+ZS5ceUr9V+U
         tOpLhPMRhI3nkaIqgmoC1AjwM9aeoJQZ4047VqhYnDjj8y3J7Ko2OXGegQwNz6s6gxjB
         M+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203628; x=1758808428;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7efdXg49cd0dO4HNsPgED93u6J0FRsteNdyMBWuRc0=;
        b=tsFcFTu9ibGgsSTrfwSKxG6TZUPl8DEIprQG0oZdH9dzX9CTtSP94oN/axL02ckoVd
         hhJUS0J8WUGD33e985TXIQTOuEetWg8gML7ngSYlVJA2tCST2XNeEc6DZUPXPh2aVSH/
         oHLEh/n9iIwK5xvLNL+QAy/iW+WZDyAnwAc4sS/GAEvj/mCJMP3U4Djzyr/YRymjaGmy
         JtyFUx4HmoFBQ9M8Uyyvi+tlptOa+/B0zNRctxBdw8hQAAxE9MBzw4qCJiWWwFA7NPmd
         zRq73gU2VAoT05+8Bamw42BL5Y2kf6aCg8UMYHqm7uygMB0GOVJCkehli/X9HhG6mWcY
         xBhg==
X-Forwarded-Encrypted: i=1; AJvYcCVCOW6NnVIJDOWw6WPN0LT69Js5tijSSB26rfD4AOPlfgatknF7rpjnMTDMHDfWgX9lw65pQkXp7JRRcN5T/QI8@lists.infradead.org
X-Gm-Message-State: AOJu0YzW/qZsF3dxuMQOuysaodLCX+ZBe23grOdN9SUl0YDi8OeHeuGs
	acbvvWJ5+JnjoirP8UkFqBjv1mxS80OeFKeyy4euUohkFqRJVZitikhly4GNFYL5z+0=
X-Gm-Gg: ASbGncsFGQJhUQXnhjNaWbXTh1d6MbkluB72HoIqkcBkpvnXw2/qY49uBJo5PLSln6Q
	ygYcO4nORqF3k0t+dAl28i1u9dqPcCXEg+CBAb0vw1L/RBPFyDVNUXfB8xHvtd1VCx/Ja0N9fNK
	6ZbPBBlcv8Ty1DsJpx9DDIIIABxyFiisZByZyuxI2qzMgsiIcfOeGL3KiwmFmSkP5KH9gHupwSa
	sn6hLVgNa6mY0Ctai6jG6dUlYghdUwfIpo9XW7yuJed79JUAgLeYm2SdUkMH10ZZhX0qpdZ1g1h
	tmovioYcX2DtML3NO/uhxBc9/48BE6SzCFMACTUdqFtoAZxzC0ogw1cmM86cKsRDKcpyF58ovHN
	wURyBF0Z3VXx6NARPiW/mB9aBsmhxyq2HwwNVj0omjQjjm2V5KEQ=
X-Google-Smtp-Source: AGHT+IHnDWpjM1umgSyHsR6OREF3QxVVNfm6x8W+jII5XcXDsJKZeNe+EM7x++buErDbKkF9QmRQfw==
X-Received: by 2002:a17:907:7e93:b0:b02:a093:eac9 with SMTP id a640c23a62f3a-b1bc1169518mr637192866b.53.1758203628349;
        Thu, 18 Sep 2025 06:53:48 -0700 (PDT)
Received: from [172.20.10.3] ([109.166.131.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f44bbcsm203026466b.5.2025.09.18.06.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 06:53:47 -0700 (PDT)
Message-ID: <c3ab4a21-183f-495a-b3b5-cc74b392eebc@linaro.org>
Date: Thu, 18 Sep 2025 16:53:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand
 <david@redhat.com>, linux-arm-msm@vger.kernel.org,
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
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com> <87segk9az5.ffs@tglx>
 <f8d3c2d4-8399-4169-8527-3c87922f2ef1@redhat.com> <87jz1w88zq.ffs@tglx>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <87jz1w88zq.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_065350_338538_929EB066 
X-CRM114-Status: GOOD (  30.45  )
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



On 9/18/25 11:23, Thomas Gleixner wrote:
> On Wed, Sep 17 2025 at 21:03, David Hildenbrand wrote:
>>> As this is specific for the compiled kernel version you can define an
>>> extensible struct format for the table.
>>>
>>> struct inspect_entry {
>>> 	unsigned long	properties;
>>>          unsigned int	type;
>>>          unsigned int	id;
>>>          const char	name[$MAX_NAME_LEN];
>>> 	unsigned long	address;
>>>          unsigned long	length;
>>>          ....
>>> };
>>>
>>> @type
>>>         refers either to a table with type information, which describes
>>>         the struct in some way or just generate a detached compile time
>>>         description.
>>>
>>> @id
>>>         a unique id created at compile time or via registration at
>>>         runtime. Might not be required
>>
>> We discussed that maybe one would want some kind of a "class" 
>> description. For example we might have to register one pgdat area per 
>> node. Giving each one a unique name might be impractical / unreasonable.
>>
>> Still, someone would want to select / filter out all entries of the same 
>> "class".
>>
>> Just a thought.
> 
> Right. As I said this was mostly a insta brain dump to start a
> discussion. Seems it worked :)
> 
>>> @properties:
>>>
>>>          A "bitfield", which allows to mark this entry as (in)valid for a
>>>          particular consumer.
>>>
>>>          That obviously requires to modify these properties when the
>>>          requirements of a consumer change, new consumers arrive or new
>>>          producers are added, but I think it's easier to do that at the
>>>          producer side than maintaining filters on all consumer ends
>>>          forever.
>>
>> Question would be if that is not up to a consumer to decide ("allowlist" 
>> / filter) by class or id, stored elsewhere.
> 
> Yes, I looked at it the wrong way round. We should leave the filtering
> to the consumers. If you use allow lists, then a newly introduced class
> won't be automatically exposed everywhere.
> 
> Thanks,
> 
>         tglx


So, one direction to follow from this discussion is to have the
inspection entry and inspection table for all these entries.
Now, one burning question open for debate, is, should this reside into mm ?
mm/inspect.h would have to define the inspection entry struct, and some
macros to help everyone add an inspection entry.
E.g. INSPECTION_ENTRY(my ptr, my size);
and this would be used all over the kernel wherever folks want to
register something.
Now the second part is, where to keep all the inspection drivers ?
Would it make sense to have mm/inspection/inspection_helpers.h which
would keep the table start/end, some macros to traverse the tables, and
this would be included by the inspection drivers.
inspection drivers would then probe via any mechanism, and tap into the
inspection table.
I am thinking that my model with a single backend can be enhanced by
allowing any inspection driver to access it. And further on, each
inspection driver would register a notifier to be called when an entry
is being created or not. This would mean N possible drivers connected to
the table at the same time. ( if that would make sense...)
Would it make sense for pstore to have an inspection driver that would
be connected here to get different kinds of stuff ?
Would it make sense to have some debugfs driver that would just expose
to user space different regions ? Perhaps something similar with
/proc/kcore but not the whole kernel memory rather only the exposed
inspection entries.
Now, for the dynamic memory, e.g. memblock_alloc and friends ,
would it be interesting to have a flag e.g. MEMBLOCK_INSPECT, that would
be used when calling it, and in the background, this would request an
inspection_entry being created ? Or it makes more sense to call some
function like inspect_register as a different call directly at the
allocation point ?

Feel free to throw your opinion at each of the above.
Thanks for helping out !

