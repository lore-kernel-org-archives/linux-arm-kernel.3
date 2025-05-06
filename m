Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEB7C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VZZVGzbcYYx5hdX5nvsFRseHivi3VPKSjmAFBb2pNs=; b=W/MNCs5oJqurqdzwYjE46ncjJ4
	LZs3Zt7xjZ/89ZrNmoXyz0mRMRsK0mNvFHQx0ioKbNLQeUSZOq7nx8w8JGY0o6ZQObTKrWMEoIydA
	xILaRNAomsgXRg78dmSvaWhAYVJIzhttTOhIZ3kDuQuqCkTZkC3UEnJMs8xe/AJaskKIEP8GNCztU
	2O9IJ3mVPBmIqiW/Nzm+TEG4BA3RY3U7hu+KdVU+UW5GotWCTl1q6fkFdDaDVo0EqpxGmHIl21vuT
	ZCh3pWdbF2gVexA3DfOklY1zjs8M+6rAYlDoJLtykrlcRvTnoihYUaijqTVDzax2dQx8m4GEKu7+c
	PIPv77hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpC-0000000Dfnc-1iuJ;
	Tue, 06 May 2025 23:35:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKp8-0000000CcSj-3qCe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:07:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22e331215dbso16475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746547634; x=1747152434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+VZZVGzbcYYx5hdX5nvsFRseHivi3VPKSjmAFBb2pNs=;
        b=iVniRfTQG12Ox/eP0eEoNP6bTAwGW0M1r8gBX0LYnd9WDolDRw7JBFmhLSEDhiotro
         A0GtPRgL0owMT/TqtjYALU16UbQVv11ilgL4oR54qdZ1N+iMb1Qj7kEhlqrXxMU9sB7g
         Bad9MDybBNsIEVNXWJo0YXFeug6yGAHPUaoVr5ih6+qyq6n5WttPVIZOZXr6SNAYA6T2
         SJNpGmblq+mQmnaALYBN1yfLGcltMMogUcHbG+yUs2bZ8b1Qk1UQHpQ2zqPT54/sqsdX
         TCVWuTLd2iZSxLRFPNgYZymexRF1TednUKWZdrNCe9egAyBs33MaGZyckbIHkmERDpno
         wdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547634; x=1747152434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VZZVGzbcYYx5hdX5nvsFRseHivi3VPKSjmAFBb2pNs=;
        b=dJvAsDJ9BnpAoTBd2b5lThHe2YBFkyBeeS6XSJy9vjql5R/m17VmU7YNFsxQlZ59RN
         3Uty0ar14MtfJJe1zzej5MMX3f27pxXDsaAAKQBu5akAnhD9gUffHDXyPJroz03x9/ks
         5rLHehU1i0XT/GL6mBchAZjazMKnQ9p9qb9a7C71ZWLlgYhADYJAON78V8c9aRg5S0kz
         tlkniTXlibHrsnOxotHbMunfQupz3kb1PyYw76LjY0nkwrF07JyjynttKthSudvxT3Ed
         4TMkDR7CstpHmiW4Xlaie0X3hYQ9SYXG9Qc38a5qcG6jl+98dUZ3CqoFTvfswvKvFziA
         S/lg==
X-Forwarded-Encrypted: i=1; AJvYcCWRMdYVk1THu/VDm6aQkvSXbcdsRQKYacRUxmVnPeIwDZY4QhZM4/qAW1lwhkgTjOc3US2TIGg0eCnMbUESRYIx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzwuc2oNL5/YVYKXUz7W5WzWzmwWDeoeFdzxrg0wGsL/KZfMST
	OHd1gSdeM666O7igGJ/KiWseJin/ltrVRXXp+AP2vmMOxx6hT4Kf
X-Gm-Gg: ASbGncsngmA4Op2wbZTyala1LhI6h92Olby2uoYQ7hu6R70KhhvsdDcLtbcdunEijco
	2uaHgPlVzC2zheqTWVDoVKySX8eZoQHrxT0H9g0UQ5hm2gKyP39S/IXKJ1MIXmL5S3bD5M6TyL3
	Meaq9pFoEJKOT8/LgJ3XNynTUnW09n0mr9Owy1LgQQ1qk0aHG+CFlFOmINQ6I0+PAy7Cz33FvID
	aDgpwFthQTPopNvejGfkIgE8ijDLvY9aGEErgwDjoclTFE+9nF/RQtgh2YhkklLpVBy9qOm4DW6
	xzdOnZIY7pWHC9q2GzpH+nenQ8LMBa8F38klFqIo+QrjXtIMIV0f0nx8YGEFRYPnRGU+8j5Q5QX
	dco/catZs0GbJrg==
X-Google-Smtp-Source: AGHT+IEDY9vBp/pIzu68i4CFkgzkeq79wAIqKzRU7oNMRLAhiQ/uElBDfTlVuqGc6Qc1+lNzWzKU2Q==
X-Received: by 2002:a17:903:41c1:b0:22e:5a9c:2853 with SMTP id d9443c01a7336-22e5d667e5bmr4368905ad.12.1746547633893;
        Tue, 06 May 2025 09:07:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91dasm9091614b3a.44.2025.05.06.09.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 09:07:12 -0700 (PDT)
Message-ID: <d7af43e4-6892-4f8b-a2a6-0c121429af32@roeck-us.net>
Date: Tue, 6 May 2025 09:07:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Fix up memory allocation tracing
To: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>
Cc: David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250506144531.3434190-1-linux@roeck-us.net>
 <62cf4450-c765-4641-b042-66cca71d5912@suse.cz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <62cf4450-c765-4641-b042-66cca71d5912@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_090714_963331_89727F62 
X-CRM114-Status: GOOD (  13.23  )
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

On 5/6/25 08:13, Vlastimil Babka wrote:
> On 5/6/25 16:45, Guenter Roeck wrote:
>> intcp_init_early() calls syscon_regmap_lookup_by_compatible() which in
>> turn calls of_syscon_register(). This function allocates memory.
> 
> CCing people for intcp_init_early()
> 
>> intcp_init_early() is called well before kmalloc caches are initialized.
>> As consequence, kmalloc_caches[] entries are NULL, and NULL is passed as
>> kmem_cache argument to __kmalloc_cache_noprof(). While slab_alloc_node()
>> handles this just fine, the trace code unconditionally dereferences it.
>> This results in crashes such as
> 
> OK, so we have crashes that are not deterministic. But also
> intcp_init_early() deterministically fails, right? This means it's called
> before mm_core_init(), and given the "_early" part of the name that's
> probably expected (i.e. I don't think it's due to some random initcall

Yes, it is called before mm_core_init(), from setup_arch(). And, yes,
you are correct, the call to syscon_regmap_lookup_by_compatible() from
intcp_init_early() does indeed fail with -ENOMEM. That is interesting;
I did not realize that. Thanks a lot for noticing.

Please forget this patch; I'll submit an alternative specifically th address
the integratorcp problem. Sorry for the noise.

Guenter


