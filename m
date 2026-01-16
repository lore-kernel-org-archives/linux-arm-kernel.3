Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC888D4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJ0Kd+SlEJxKbaePbsW3EtzVjRrjQZdOLYvse/lYkyc=; b=VifJpVHjyMf+febKbCwNGk4VUw
	PQDlcnU5DM83u0Ol2J4Ug5+LAFtzhHE5LFlVGeYxzAu8ixW6lTZjH+YFUWNCOShguuknLMMCOYfGg
	+/MrQlNPBGoVoP0txSYzVqEQzYNTXsdauUdet5A6eiULvFotPHbZpLVlQQEj2yzyaKNFbGZBkvAK4
	RHewgKUkLWVtW4yIMj7YIhiPa9KBaIYPvWgjHO8guGUnYtbqiand1q/bO3+U4qaMqUsy481Y6py59
	Reu1Qxabt3+hjr8Rrr4s6Z3l1M+J+N/KAA98Ni46jj/cN1Mnb2Bv38xxoXDjRmPmdexFxjq0rpmV5
	EUe4Xi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjxN-0000000EC8z-2nTE;
	Fri, 16 Jan 2026 13:33:41 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjxK-0000000EC8c-3UPO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:33:40 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59b72c87109so135410e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 05:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768570416; x=1769175216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ0Kd+SlEJxKbaePbsW3EtzVjRrjQZdOLYvse/lYkyc=;
        b=VztGMlv5qAhLlOvO1HeW8Iy6ZTMCAGHQoZX9Dq5L9QH/dkv9m2uqfgEm6OOoBgl+Co
         4rPDRF35aApptTcH78Ul0eivjj6WytqlSMZfZcE5MlSgdCF4gEU7qH5UENcPVabFnOWh
         SWd108gR9wl/LyGTKmNCq1NgubYqhFzGOCO356jcoke3k+NLEVzxRPLDt6ll/cLIwUOm
         lMKPmaKN5VKcM+OG3QLkWaHZLlY1OOxotWirA1Lks1TmDcCIKgXkz9iguXj51Nw093QL
         2M8flu4cMY62B9w6ajwFIoY23fUKbyQpq0gZ+AJPSG6pmYFD3KDsOcvOWdeYD53Bi50t
         l8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570416; x=1769175216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJ0Kd+SlEJxKbaePbsW3EtzVjRrjQZdOLYvse/lYkyc=;
        b=IR2WubocfqYbn5eh+xU8aGsOx6DfflMba/9GFBrn/UvcBUrZEubdGaOMZ2Ht5ZCK3Z
         M30HBGiofjobOqdsjn+/ES/2uconCUJinEtoimN9mSCPkAkh7TJrsRXEJAVIE/noMFNc
         LNuLwKgRRoMR/qHv5oQHuAr2fr6LUrdoLITImUMGDhw6u3nEFWCL2ayRJJq4v6mgcyBL
         Mi5wWtrchKzcKPJPUWCrmP+QITCr+u3hveqOsqxfedxVQWFZGk7bQJQE4l4e0QhKlouZ
         pbSgSoAmBTddRiO84oQAMt5RXJ7CD2PckJMCTAH/BvMGSypuyOHE898o3LrDe9t05SWy
         JRYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3ka47uv/bR12VXv1yX43xSqJqJDmp8PLbuGc4ercKK5MoyB91kPUQ07ALZTpie8tjMvB/F7S8YWOt0P2YYokH@lists.infradead.org
X-Gm-Message-State: AOJu0YyoHMqHOl5KMCAUs3n1tGv/ce+k7ecT1jgc2VkbE0bDCwYFQeLP
	308UnXogAcmrgpQzVkpxAZGahBrSdlkDmb6p9XKHoV9BT+ruVfsuf/d3
X-Gm-Gg: AY/fxX5B26YBqwFB5eV9Dnzh4DKd+Ab833dJI5U2imHUidkcH75h2K7canDr9UENi+i
	vDB00U4KeeRinUdh2HQBqqJ8npa6TfZphh+vzfWlw9n58KO+ym5ZGrSolPDN2bY/y2oVhnpf+Q5
	pSBG+8/Tq0qqszoaJQXXf7ULUZsZ1+9CxzLykQ8f3avDW/Wgg1LBgCZQ4FxXj+ZE/FfgRLYsklm
	zRA7NyqIUFpWePOJEjxtwlibKFXwGgItKOh2u8Wvi23lukN0n0/sSMupKNQF5qwWXQ8G2U/g6Xb
	g4ADZBA7xav9+c2L0NKgCiXjYjW+BuYo8ofklfoM3SCrQmBGrfRopZ2IZT96h2JsVtandc7KWhi
	vIowXuRJffJqV5NFE7kypXJ/Zpb1c2lpUqWJKwR9fRfRPbKPTrK4+5+h3CL02vzZWFCb79EV9uu
	Q34D1m7LAbMSS4PtRyTg==
X-Received: by 2002:a05:6512:6184:b0:59b:9fc6:f66 with SMTP id 2adb3069b0e04-59baeeffec8mr547766e87.4.1768570416127;
        Fri, 16 Jan 2026 05:33:36 -0800 (PST)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm763752e87.24.2026.01.16.05.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 05:33:35 -0800 (PST)
Message-ID: <c9841bb2-b82a-4daf-99fa-17aec157e2c2@gmail.com>
Date: Fri, 16 Jan 2026 14:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/14] kasan: arm64: x86: Make special tags arch
 specific
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <be136bf8d1a6ae9ef98686c3ba0b6a4e2ea2e780.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <be136bf8d1a6ae9ef98686c3ba0b6a4e2ea2e780.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_053338_936212_0E02FC68 
X-CRM114-Status: GOOD (  17.06  )
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

On 1/12/26 6:27 PM, Maciej Wieczor-Retman wrote:
> From: Samuel Holland <samuel.holland@sifive.com>
> 
> KASAN's tag-based mode defines multiple special tag values. They're
> reserved for:
> - Native kernel value. On arm64 it's 0xFF and it causes an early return
>   in the tag checking function.
> - Invalid value. 0xFE marks an area as freed / unallocated. It's also
>   the value that is used to initialize regions of shadow memory.
> - Min and max values. 0xFD is the highest value that can be randomly
>   generated for a new tag. 0 is the minimal value with the exception of
>   arm64's hardware mode where it is equal to 0xF0.
> 
> Metadata macro is also defined:
> - Tag width equal to 8.
> 
> Tag-based mode on x86 is going to use 4 bit wide tags so all the above
> values need to be changed accordingly.
> 
> Make tag width and native kernel tag arch specific for x86 and arm64.
> 
> Base the invalid tag value and the max value on the native kernel tag
> since they follow the same pattern on both mentioned architectures.
> 
> Also generalize KASAN_SHADOW_INIT and 0xff used in various
> page_kasan_tag* helpers.
> 
> Give KASAN_TAG_MIN the default value of zero, and move the special value
> for hw_tags arm64 to its arch specific kasan-tags.h.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> Co-developed-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Acked-by: Will Deacon <will@kernel.org> (for the arm part)
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

