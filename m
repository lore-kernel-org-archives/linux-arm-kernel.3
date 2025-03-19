Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC4AC35FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CKiUxIsp+RiAjt+4CW+mXa9kqAZnMY4uY5XJZebADk=; b=yoQ694FCyvB9hG/IGyN/JBInPr
	zYhNUjCf9rJO29OeJpnXbG/osbS4ZMSJxviBhc1OxIzGJpWfkkFY/DbxGNDL9MJCNOaUdE6GboDQp
	TTWyUBdrk1fIr63zObix0ZlLFpyZXH/gX0/fZBmt0r1utvPWs0VnoifEtrMZP/2W2yeOCbjTqlUyg
	9PB2WppNm6PkaFQgMvR3Op1nk3e8O3OECpux5Kdnow5e/xB+ZeiuaKAhKXIBV7w+jAbzb9I/qc71O
	3WVe993prX+Ka71lqOv2vMAauA75UyggTXIlq77uo6IcJYgOIFE3KXS0W920so/6jjnlGmJ7Wp+lm
	l+g9FEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tutET-000000093SI-0Fcr;
	Wed, 19 Mar 2025 13:13:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutCm-000000093F1-09GH;
	Wed, 19 Mar 2025 13:11:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223594b3c6dso146764685ad.2;
        Wed, 19 Mar 2025 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742389891; x=1742994691; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/CKiUxIsp+RiAjt+4CW+mXa9kqAZnMY4uY5XJZebADk=;
        b=bL8AZfjklLVj059Dttc5wuB6ud2vygeTSU4nUGphgE0McSIZY80+FQFnrn2jCSZNTN
         kQphc+ucqwleds1jaZQnEb8I+KrdG/w7z/Iw7QGMnfMJIg3lU6rmc/954zX4pCwSQSXz
         NvNvcEHOygH1nabhvV/CFuglMEnqHmGABk8AqET1yRh9yVkNYueHXFobOuuTCCYJLC2H
         G6gcmu+xsSGTJ/Wnws6zVl2iGNo3pvkLzblApyvPGNfiL/rFkdeQHlFd5uxTv29Mx7vT
         6f4ky93awgIebeePZPR+Rffe5uAXX+g7euCfPZMWsf2MrXBY5zeUnLM33KQ0uyPqpiA1
         tFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742389891; x=1742994691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CKiUxIsp+RiAjt+4CW+mXa9kqAZnMY4uY5XJZebADk=;
        b=aCN6UauzzvKMBROi2y7v5vKluZHAXXJjffRIQl989OsKFRMaGc0SEWW7zEsD604F95
         ByT4Pg2PbsuRNcTCjYqQrsdNCUOu/BbpToqgEtYf8XXkYhqUUgAZSc7d5ls8hKh06vN4
         7VAsFJgoIGL65UpgiF66ykJGKxRp/1aB5mhpzIxwccjQLIXjod0VA+138du/Cp5MSWXw
         Hk9hzyS4683USJagzLj6HqmbjygORw57fcJ5DNkYDkQvvzK9c0mW3mqbhrfKEZ2/ig/K
         y3MDKCm+IJwQOoHOwqWzHeMj0349MGAYM+Ad0pYJHXcFNTQokwtbmFTQS44A48haFDfZ
         KFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDDvGkXVAChERLjGMweBsilf3Jps23SvQW1vwini7z7QXFOBxUDd61l+D9y92WGYtgwkCNv6tgMIOYkmc=@lists.infradead.org, AJvYcCVEKhLjLzOhu6Jqw/rdt0tYS75tNvRAEJqImhLSq12RyWtg2gsgZkFuiSv1Qo06eTCw2IvPI0+beKLMg2T3il2L@lists.infradead.org
X-Gm-Message-State: AOJu0YxP7uenUmiaWLke2GEBj+Y0HU/7x56idsHCkpX+PpON5d73FiKK
	/KHXM2zUqvb/I652XaOZeoxu80T0dm8uwsGfCSgHpoTxo2rND3VT
X-Gm-Gg: ASbGncu4W0LyYpGVz/dPwdVavVDhpoPCle2GESs4o7aoMsOIMs6pAySKBzUz7k8X0GD
	2F/bnCsAluHu6UTWdIajT7zDb/YDxy6BRmTvSLWeEAxkfmv7zHmwc5As3OWULXKf0RakI15mLJq
	oWuvQxBqWc7YHh2hPO0IrMJQnc1kfbFjhOvtGGbuquqVoqtpgabNceBb+snsaXm1C1aSd4L8HhB
	mI3HFAqrTy2X9I3Zehvy5MigzHx5OTCbrQtDa/unakMMIOA89+9GmOoZzhIj/pakT2us+EN7xuz
	2Y3BAmyEPt1RQPATWFY2fv0O11B3ym/cXssu5IW05koFNu+niwRLTSuuWqg7VtOH2M3qpwV+iCe
	4e7Gb9GPWdrEr52Bncw==
X-Google-Smtp-Source: AGHT+IEioVgtuSEfAYuAE8IAAYiDjsUn61PAgb/S9UQkSNM/19B6DRuSeEADVUHZxIm2XFZUlNalCg==
X-Received: by 2002:a05:6a21:6e48:b0:1f5:839e:ece8 with SMTP id adf61e73a8af0-1fbeb1854bcmr4348609637.2.1742389891204;
        Wed, 19 Mar 2025 06:11:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371157369bsm11469895b3a.75.2025.03.19.06.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 06:11:30 -0700 (PDT)
Message-ID: <9030a298-fcb6-48ea-a941-ad6916bf9fa7@roeck-us.net>
Date: Wed, 19 Mar 2025 06:11:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Will Deacon <will@kernel.org>, Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_061132_072764_AFD74842 
X-CRM114-Status: GOOD (  18.33  )
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

On 3/19/25 01:05, Christophe Leroy wrote:
> 
> 
> Le 18/03/2025 à 16:59, Will Deacon a écrit :
>> On Thu, Mar 13, 2025 at 05:40:59PM +0100, Alessandro Carminati wrote:
>>> On Thu, Mar 13, 2025 at 1:25 PM Will Deacon <will@kernel.org> wrote:
>>>>
>>>> On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
>>>>> diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
>>>>> index 28be048db3f6..044c5e24a17d 100644
>>>>> --- a/arch/arm64/include/asm/bug.h
>>>>> +++ b/arch/arm64/include/asm/bug.h
>>>>> @@ -11,8 +11,14 @@
>>>>>
>>>>>   #include <asm/asm-bug.h>
>>>>>
>>>>> +#ifdef HAVE_BUG_FUNCTION
>>>>> +# define __BUG_FUNC  __func__
>>>>> +#else
>>>>> +# define __BUG_FUNC  NULL
>>>>> +#endif
>>>>> +
>>>>>   #define __BUG_FLAGS(flags)                           \
>>>>> -     asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
>>>>> +     asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
>>>>
>>>> Why is 'i' the right asm constraint to use here? It seems a bit odd to
>>>> use that for a pointer.
>>>
>>> I received this code as legacy from a previous version.
>>> In my review, I considered the case when HAVE_BUG_FUNCTION is defined:
>>> Here, __BUG_FUNC is defined as __func__, which is the name of the
>>> current function as a string literal.
>>> Using the constraint "i" seems appropriate to me in this case.
>>>
>>> However, when HAVE_BUG_FUNCTION is not defined:
>>> __BUG_FUNC is defined as NULL. Initially, I considered it literal 0,
>>> but after investigating your concern, I found:
>>>
>>> ```
>>> $ echo -E "#include <stdio.h>\n#include <stddef.h>\nint main()
>>> {\nreturn 0;\n}" | aarch64-linux-gnu-gcc -E -dM - | grep NULL
>>> #define NULL ((void *)0)
>>> ```
>>>
>>> I realized that NULL is actually a pointer that is not a link time
>>> symbol, and using the "i" constraint with NULL may result in undefined
>>> behavior.
>>>
>>> Would the following alternative definition for __BUG_FUNC be more convincing?
>>>
>>> ```
>>> #ifdef HAVE_BUG_FUNCTION
>>>      #define __BUG_FUNC __func__
>>> #else
>>>      #define __BUG_FUNC (uintptr_t)0
>>> #endif
>>> ```
>>> Let me know your thoughts.
>>
>> Thanks for the analysis; I hadn't noticed this specific issue, it just
>> smelled a bit fishy. Anyway, the diff above looks better, thanks.
> 
> That propably deserves a comment.
> 
> Doesn't sparse and/or checkpatch complain about 0 being used in lieu of NULL ?
> 

__BUG_FUNC is only used as parameter to asm code, not as pointer.

 From the diff:

-                    : : "i" (__FILE__), "i" (__LINE__),                \
+                    : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\

The use is quite similar to __FILE__ and __LINE__. It might even be possible
and appropriate to just define __BUG_FUNC as 0 if HAVE_BUG_FUNCTION is not defined.

Guenter


