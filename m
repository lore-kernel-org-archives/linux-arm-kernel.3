Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C4BFB5EA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VINWEtY9aZvz9HaKBZW/WHE45MWpLM833fNP+ydNw4=; b=BqgaWFhOJ6s7CVzM0YMUo9yp+V
	eI+OyPCd4PquBU77XEqJPUngCWPTvk7Ub8AeOiVyLUspMbRa5kJcfFzVy/hW0DqSrubiv0lIubF8E
	ftCG2caa+OxbZo8qaMkhX4TiT9FYoJvvUqzgpeh/wff11ICh7ldePwV03SFsKN/aF3kPomhrFaTsf
	Ops3KbJHyY5SQFXXq32jPI7gpgYpbZNUqPGTIrdPzDShZG0RKVv96qyM8kDstDRQv+knNx7JY4EPf
	p3nf7qUg0ZqMQe0e6LceSMeOnDAJB//+5KBbyHk+2lzoXuCTf3BL6Yad4RqY4cY6LFgiC5wPwSGJQ
	N0kVtvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LRP-00000005LWw-3bdU;
	Tue, 17 Mar 2026 03:49:59 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LRL-00000005LUj-46iG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:49:58 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-40ef10ec84cso3644175fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 20:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773719394; x=1774324194; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VINWEtY9aZvz9HaKBZW/WHE45MWpLM833fNP+ydNw4=;
        b=lzLBcAPYnTiT1ISF0rqDLliP4H64evqAf9iCHHeKm0m8d6Le0zErv6wHYHxzN4PDyF
         18GAV7a2HgPcE1KchOu3YobuEti0IESM6xy4FpE3o+C/UZf6sxSeMurtk5osV1wGEpQz
         Qgjsy7QWHfPgb2t3dt5Eae8KrHhA3XVj9YjFkmpnTMwHnmnSK3GtVO03IAfQUUMTkfLW
         VMPiWc4o/CPLQ/pdHPaF4QuRTXuI+J7Av3sn0a0L85nZOYw1Q4H0HI+N1pHfGAWafXhe
         1nc7lKAnWiz5YTKXez3oMaeMlgazBRhOYTPidKNldzmKKwYkDcEValsKg/QbFrOy9x+H
         wLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773719394; x=1774324194;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VINWEtY9aZvz9HaKBZW/WHE45MWpLM833fNP+ydNw4=;
        b=XghDMyTGZuvkmwYrhBTj0GFptFG2ySLmfj5t4dbwcVfk43dVUOqzvj3bYloFY6f87g
         skHJOAjgjZdxWfTRdHENnQjTykBxkJfidLZLovNySGe6ePmhJ548qB5oYQeXDXiuK5F1
         NQBrb4KLABpp9vr1zQb4zigm0AOJrdoUtM9SmIEhO6oP2nBJf+F554g/W5CHRkfD0GV0
         wgH1zHHop7GrAIn6hgA+8LPgBOd+rw7l+2syyF9tQwHhnlqRbJL6VXOBeH+8k15Qi2f0
         LGieVWw229sWHEnhZgPEqq2QAOfzRIus2YvHnGmKAcTnx4KkWmXZFvN9CzRX2TP6htJf
         /j8g==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5ZuEGce9K6OHTZoqD/H0rqQvQgtoXSJWqIwYlXkWJFO/xQQqEHpPJ3AY0tkwob8glHsiywMLHvflBZNqt+sV@lists.infradead.org
X-Gm-Message-State: AOJu0YyeOS/PKpCXIEQ8i5gXifZEqCOdyNoBFTIPn/gVSxfeqe46gCnu
	6jgDhoklDFGwfM0Be6EdHdYXOLQiL7dCEKWYg9VN2tloAIW7NrcJJVDejbpirQXCLRs=
X-Gm-Gg: ATEYQzxBzf0Q9c7MZEzDpj7dn+S7H544gH0xy3d6yKwDcYUwmx9NL5PcjHvKjaap+f4
	2FgYTuyQlGByi9qoNF72uWKXo8P03TLHOuIK7Cj9ie+rIO35WTYITlLOU2lE2I1sPvXYqkJRfSo
	JO6WufEOTNiJIjZBfEbKoyAY3aa8KxI1oXfvMI10lyScaj1ySWjiWB3kjQi6umAs5plkOKW3tlJ
	fEoalp105lJ6+ou8RsGXgjJ8WZY2A5f7xYKwgUihRJyfEA3pfYvQSI77l1icKviowdYDwTmx8jz
	1sICo0/cFfA/OMlpxal3VYSzB/QKVWf7tVc76n/+U2oNMYlpULzaI5jhye4J92RbT6zWq4YY49Z
	GnYcbi7Oye6nySEdaN8eoGlV3QTzSdMH+Gw2ZJuHgsW9rhnpUl7ryGX0NCuR8F01r/L1Snhgvel
	7+s7qXcCdG0DfQgsCEqg096aYz
X-Received: by 2002:a05:6870:d406:b0:409:74c7:1cbb with SMTP id 586e51a60fabf-417b906d206mr9213737fac.7.1773719394528;
        Mon, 16 Mar 2026 20:49:54 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm19148337fac.16.2026.03.16.20.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 20:49:54 -0700 (PDT)
Message-ID: <da8c8b57-6d5e-461a-83b3-9339a712aca4@sifive.com>
Date: Mon, 16 Mar 2026 22:49:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/15] mm/kasan: add document into
 kernel-parameters.txt
To: Baoquan He <bhe@redhat.com>
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, andreyknvl@gmail.com,
 ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-15-bhe@redhat.com>
 <f7054184-dca2-4c7c-9e2e-4a5e3e1c81da@sifive.com> <abjMP58VdUu_eElh@fedora>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <abjMP58VdUu_eElh@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_204956_031988_33AEEB61 
X-CRM114-Status: GOOD (  27.44  )
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

On 2026-03-16 10:36 PM, Baoquan He wrote:
> On 03/12/26 at 07:53am, Samuel Holland wrote:
>> Hi Baoquan,
>>
>> On 2026-02-25 2:14 AM, Baoquan He wrote:
>>> And also remove the relevant description in dev-tools/kasan.rst
>>> which is hw_tags specificially.
>>>
>>> Signed-off-by: Baoquan He <bhe@redhat.com>
>>> ---
>>>  Documentation/admin-guide/kernel-parameters.txt | 4 ++++
>>>  Documentation/dev-tools/kasan.rst               | 2 --
>>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index cb850e5290c2..e0115fad9e60 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -2899,6 +2899,10 @@ Kernel parameters
>>>  	js=		[HW,JOY] Analog joystick
>>>  			See Documentation/input/joydev/joystick.rst.
>>>  
>>> +	kasan=		[KNL] controls whether KASAN is enabled.
>>> +			Format: off | on
>>> +			default: on
>>> +
>>>  	kasan_multi_shot
>>>  			[KNL] Enforce KASAN (Kernel Address Sanitizer) to print
>>>  			report on every invalid memory access. Without this
>>> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
>>> index a034700da7c4..eaae83fcb5e4 100644
>>> --- a/Documentation/dev-tools/kasan.rst
>>> +++ b/Documentation/dev-tools/kasan.rst
>>> @@ -129,8 +129,6 @@ Hardware Tag-Based KASAN mode is intended for use in production as a security
>>>  mitigation. Therefore, it supports additional boot parameters that allow
>>>  disabling KASAN altogether or controlling its features:
>>
>> The sentence above is now incorrect as well. I would recommend documenting the
>> parameter earlier in the "Boot parameters" section instead of removing it from
>> this document entirely.
> 
> Good catch and the suggestion is good to me. Thanks.
> 
> Is below change OK to you?
> 
> 
> From 317be48b9c1bf9d33b8d8fff5e401e3155531d81 Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Tue, 17 Mar 2026 11:28:39 +0800
> Subject: [PATCH] mm/kasan: adjust documentation

I'd suggest something a bit more specific, maybe like "mm/kasan: document kasan=
for all modes".

> Content-type: text/plain
> 
> To reflect the change of kasan=on|off.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  Documentation/dev-tools/kasan.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index a034700da7c4..8e65bc04dbcd 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -103,6 +103,9 @@ Boot parameters
>  KASAN is affected by the generic ``panic_on_warn`` command line parameter.
>  When it is enabled, KASAN panics the kernel after printing a bug report.
>  
> +The generic ``kasan=off`` or ``=on`` command line parameter controls
> +whether KASAN is enabled (default: ``on``).
> +

This is in the middle of paragraphs describing the fault reporting options. I'd
suggest to move it to the beginning of the section.

With those fixes, you can add

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  By default, KASAN prints a bug report only for the first invalid memory access.
>  With ``kasan_multi_shot``, KASAN prints a report on every invalid access. This
>  effectively disables ``panic_on_warn`` for KASAN reports.
> @@ -127,9 +130,7 @@ modes below) support altering stack trace collection behavior:
>  
>  Hardware Tag-Based KASAN mode is intended for use in production as a security
>  mitigation. Therefore, it supports additional boot parameters that allow
> -disabling KASAN altogether or controlling its features:
> -
> -- ``kasan=off`` or ``=on`` controls whether KASAN is enabled (default: ``on``).
> +controlling its features:
>  
>  - ``kasan.mode=sync``, ``=async`` or ``=asymm`` controls whether KASAN
>    is configured in synchronous, asynchronous or asymmetric mode of


