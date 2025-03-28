Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EFAC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 22:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=; b=3hmvJt8MOuCP6AF3FMAZaxSOu6
	oeSuOBQ4FxvVBJuYvA3joQaT0n2RR8ImQ/Z5VDV66yZ6V1zoVJtyajOJpjKxwuZuzOjf6HsimM6eH
	r7dgn3/mc8Ztlfivc1982Yt24gQosWHsHUbXU1mjPyniroINBrOQxa2lAxMgqbskWlxPDcrBLPuyp
	3lNTk5IGuHVoxzXnLjVNqxD8bHMrCBYZ1D5nyDE9o+vFw3+UzFGYyYNDxt0F4zzgXTsSwdalEe0pr
	WQY/6PhtDvD9a3SkIp/PI0jzNWpr7lSSWRetzC0JeO33bimoPaObxkN1TTUMJy2YMer6mHdreyr3N
	FGBjAocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyI0N-0000000EOMz-3rx7;
	Fri, 28 Mar 2025 22:16:47 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyHyd-0000000EODz-2KlC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 22:15:00 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so9401335ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200098; x=1743804898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=Th7+HsSlWiBico6V0kDZ/tqCfoBO1YA7c8OhukjFq2epgd852XhssimYjHF4OQtHix
         Jpi6swO89ZaGJVG2f53kRiNYy7o0EnuUPWmVW2P2nnSlb7TbRwjcaL4XYEY3LvZnKP0j
         jMuko5MGItIIv0UzN+xY0gRGXFWuDsb0kbCeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200098; x=1743804898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=qq67cXk+tiamcXbX15O/EghrECmHlnzk4O2G4yVSeHfRp6gOYzzgqfOgszcS8MNwn1
         kdBKNrInE6OcEiUHYjO+XDSXKfrHAJUopCrQ+LZduGUVRdwUDLt/C0lQ0mlaovxZ/2lZ
         nbfGCqGOPaN45AdV+oM4IshwOxyDfNgbQNrMMC5oQyPvBIDCwUj5kZKlra4KXwxKlEcD
         qLn0347stbX5SafT0E1uhQ7rTynhqsXgckNQcCFR5ZY6eSCgdctBM4pcGX37ec3k7PAM
         vsyVXEipzUJmtoxhr4uI76+msjoe2k4peMgDvG1cpza1TlEvsWy1nf1ABSUpZWOKJq95
         IzZg==
X-Forwarded-Encrypted: i=1; AJvYcCVF9Vk/xGPnf8wYx8zePHboIKvsQuagkryDOw3qVIMg10RUPJBOMsR97RAbBWGLVBsRGo0TmJXBRfr072HlxepL@lists.infradead.org
X-Gm-Message-State: AOJu0YxT15aG2bLstlJKXTFTbYZUNsDJ8kqJUOmmTilfSsmtMVECAcyF
	JOCOKwxpWfb8JY4XXOrwVfkhHpDm1UwvGAFFWoyfuN94MQME0VTxteTSz/TJ8EQ=
X-Gm-Gg: ASbGncu5kwn0qseMIqZAQIsKhes4KSz/a7rIe7CRbSjf4bMEWEyjUfI1SQeUc77gj1m
	M/0KoBSqc9etO6xnQSBiT2bGdCEYvWubXbgOc4z7zsrc1MCZ2Cr+Cr55uJ4w8G1pWSEVe2eC2ZP
	rYhngJgghwLAzq2l6/Vda23/5HETH3iHEiRWboIaWsP5rvcKT8oGNcl13gXZxLVUYJSNRb7Q9tL
	yn5vFFzaraSYFIWis/+78q4tu+QxmduL9M2puZ+U9jceq5nf+aRXLu+QG+r7DzH9fYvLnAXeIwF
	iiNpCKpCiwBoKMZFh08TWg9VdWu9+ilpDFmWzY0BnHQs3rnMdB9J4eA=
X-Google-Smtp-Source: AGHT+IHAgQaNQm7V/HQ9xhZOQz/Fs6tsLI4+HRU2b6hOJkb/FR7IJnx7J0M2QjLjv4gsNmH0eGf+NQ==
X-Received: by 2002:a05:6e02:3807:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3d5e0a004a5mr11036025ab.19.1743200097993;
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751ebasm643215173.57.2025.03.28.15.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Message-ID: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:14:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo
 <arthurgrillo@riseup.net>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
 <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_151459_723177_41E7E3EA 
X-CRM114-Status: GOOD (  12.62  )
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

On 3/13/25 16:05, Andrew Morton wrote:
> On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
>>>>
>>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
>>>> very noisy tests much easier to deal with.
>>>
>>> And for the record, we're also affected by this in DRM and would very
>>> much like to get it merged in one shape or another.
>>>
>>
>> I was unable to get maintainers of major architectures interested enough
>> to provide feedback, and did not see a path forward. Maybe Alessandro
>> has more success than me.
> 
> I'll put them into mm.git, to advance things a bit.

I haven't heard from kunit maintainers yet. This thread got lost
in inbox due to travel.

David/Brendan/Rae, Okay to take this series?

Andrew, Okay to take this through your tree - this needs merging.

thanks,
-- Shuah


