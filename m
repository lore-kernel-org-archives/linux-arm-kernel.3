Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96F2C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsudyBjgePvtjD6+k96cWTwnxq5OCaJZMhVExCjpMvg=; b=RUvYA6Ul1iSo+EAW45Luc6QSzC
	/vPYnX70+3eJMyE6AieHU4970+0gQ0fOErqkCcZLbQNce62Qt5q7h9e4kMxPrXwBX6qOAHqZI5YMY
	rWPxHsSLhPrnuvsn2a8r1VV3Qp2m8FOc8qqcpj4Gf4JwZQ2RC4kRg8l/QJ7yxXtEjaTK/tdZJOvFW
	oSrZn4XTs7Otv+Ns8rkILnH49/HlA05knTnfihBLZYi6PJYJwzLJUiUIAbAe4oeFgn7LTmSaLUZT0
	6QQX0Q4tGqFjdylJqVWrDsRrs43FXgJ0bUMybs3JOtNFJBsS6vPPQulx8FIspl98EqhNgW0UooGHJ
	ic3FyZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZN-00000000Zxb-3437;
	Tue, 25 Feb 2025 17:18:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyHP-00000000VC0-3aol
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740502773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsudyBjgePvtjD6+k96cWTwnxq5OCaJZMhVExCjpMvg=;
	b=Ahej7ZzWC9+kIfCPdsf3lBxqHqZfFS+sTSIdOX2YEkIgk1y1UYuYWhXJwBPpDIm53Q7uTG
	iKe+aSMupqncYSFPkIFB63fWAd/N2KpqupbRAv5M0i7qnbLmAoBkP1N+UVtDXayCBuli24
	Pj8R7sdsz690km14iyEolRpimXcfovs=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-fOlnlvhsMwavYbGWDVzjbQ-1; Tue, 25 Feb 2025 11:57:57 -0500
X-MC-Unique: fOlnlvhsMwavYbGWDVzjbQ-1
X-Mimecast-MFC-AGG-ID: fOlnlvhsMwavYbGWDVzjbQ_1740502677
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3f40e8dabdbso1144716b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740502677; x=1741107477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsudyBjgePvtjD6+k96cWTwnxq5OCaJZMhVExCjpMvg=;
        b=ASmZNO7UpHFpU8EoZW58/wUjwfrg/3A7GBJOmgbtwu7NoAz6xA16CFqhlZOxPTaJIF
         9vPANrc7P0yXiZuGu51HlkA2bOdEM+dlHQHjdrfR0+eDhB6eBFVdOLTlovAnExfKXCiD
         0FMzmbQThtQsLvmEwaSKkO1PtcXFDLwN2imp6+O+ij3hP1vieFmrO/pKxUtBcEz21HoG
         8DotEQdz9nHyzFP8o+BjWatZ3XfHcVOHXTM3bDswkRbn0ppEXOljAqu2bfyvgZL2CypI
         fmLSdiWDEU/h12IOjCiE60//yFDVkWRuvmzodcdVTU9PlVp3pw/aMBMVX2RWhwMYm4lA
         vxeQ==
X-Gm-Message-State: AOJu0YzfRuP5Ctfy/7PmVW+mm4NxwJVnPqjgu14m9MVXQuWVixmf8adv
	LlMLH1ZXjMnyRPkKYPF7uIVQB+EKAY6XwmUgyADEYoc/jqEyACANS+REK9h4CH6B8mgaIJK1m5i
	C/NjJbe7GysnmqhzkSRFZsLQFFEO/2WqtMqsee42EiGqeTQvtdHlaE/95rVliQ4JsDJy9gmqFWR
	+LRJN5
X-Gm-Gg: ASbGncsG9PBdwST/JkRVsaZHI53YMB/L/ZsDONI6QEMLW6labduKJxaEv34I+ANnCpe
	omUf2OSXO47hSBGFkAygCJtd/ChtoywP7q6v/ecuH9pYNAzXDcAmbPq+4x9z2ne0P8DmZnn3NgV
	uSTewKoEDrR72AyBFkdewplUHCacZC/pSKAtGglefvoReni/AyttpNL5IzOwtL7IIds7sSTQrSI
	cSRXDK374MOodIsZhpwCRC1jhcLxfzYNfGQ0vK521hUpUHGeV8bkvpRT4HHLLK8d67SbC0yNIzH
	Kz4yQWpkSnMf5Fk=
X-Received: by 2002:a05:6808:1903:b0:3f4:210e:c104 with SMTP id 5614622812f47-3f540fc0dd6mr2734006b6e.35.1740502676666;
        Tue, 25 Feb 2025 08:57:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcGW+KRgD0DK/WjhCd4m34e6ZDNGDfc7MLwnR+fmh+Jjwhwc+WuFb1+JUAezBr3u90PAFX5A==
X-Received: by 2002:a05:6808:1903:b0:3f4:210e:c104 with SMTP id 5614622812f47-3f540fc0dd6mr2733987b6e.35.1740502676293;
        Tue, 25 Feb 2025 08:57:56 -0800 (PST)
Received: from [192.168.2.110] ([70.52.22.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f541be03b1sm362758b6e.29.2025.02.25.08.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:57:56 -0800 (PST)
Message-ID: <f53be9d0-524e-4bae-8994-aa2baa1b36d3@redhat.com>
Date: Tue, 25 Feb 2025 11:57:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250225114638.2038006-1-ryan.roberts@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DRyaeGBtpNri0X8s3HKW1208HZhS7GwcXtxMZtEC4U0_1740502677
X-Mimecast-Originator: redhat.com
Content-Language: en-US, en-CA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_085935_962564_000CDDA3 
X-CRM114-Status: GOOD (  32.58  )
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

On 2025-02-25 06:46, Ryan Roberts wrote:
> When the range of present physical memory is sufficiently small enough
> and the reserved address space for the linear map is sufficiently large
> enough, The linear map base address is randomized in
> arm64_memblock_init().
> 
> Prior to commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and
> use it consistently"), we decided if the sizes were suitable with the
> help of the raw mmfr0.parange. But the commit changed this to use the
> sanitized version instead. But the function runs before the register has
> been sanitized so this returns 0, interpreted as a parange of 32 bits.
> Some fun wrapping occurs and the logic concludes that there is enough
> room to randomize the linear map base address, when really there isn't.
> So the top of the linear map ends up outside the reserved address space.
> 
> Fix this by intoducing a helper, cpu_get_parange() which reads the raw
> parange value and overrides it with any early override (e.g. due to
> arm64.nolva).
> 
> Reported-by: Luiz Capitulino <luizcap@redhat.com>
> Closes: https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/
> Fixes: 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
> 
> This applies on top of v6.14-rc4. I'm hoping this can be merged for v6.14 since
> it's fixing a regression introduced in v6.14-rc1.
> 
> Luiz, are you able to test this to make sure it's definitely fixing your
> original issue. The symptom I was seeing was slightly different.

Yes, this fixes it for me!

I was able to boot v6.14-rc4 one time without your patch, this is probably
what messed up my bisection. But I booted v6.14-rc4 with this patch
multiple times without an issue. I agree this needs to be in for
v6.14 and huge thanks for jumping in and getting this fixed.

Tested-by: Luiz Capitulino <luizcap@redhat.com>

> 
> I'm going to see if it's possible for read_sanitised_ftr_reg() to warn about use
> before initialization. I'll send a follow up patch for that.
> 
> Thanks,
> Ryan
> 
> 
>   arch/arm64/include/asm/cpufeature.h | 9 +++++++++
>   arch/arm64/mm/init.c                | 8 +-------
>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index e0e4478f5fb5..2335f44b9a4d 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -1066,6 +1066,15 @@ static inline bool cpu_has_lpa2(void)
>   #endif
>   }
> 
> +static inline u64 cpu_get_parange(void)
> +{
> +	u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
> +
> +	return arm64_apply_feature_override(mmfr0,
> +					    ID_AA64MMFR0_EL1_PARANGE_SHIFT, 4,
> +					    &id_aa64mmfr0_override);
> +}
> +
>   #endif /* __ASSEMBLY__ */
> 
>   #endif
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9c0b8d9558fc..1b1a61191b9f 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -280,13 +280,7 @@ void __init arm64_memblock_init(void)
>   	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>   		extern u16 memstart_offset_seed;
> 
> -		/*
> -		 * Use the sanitised version of id_aa64mmfr0_el1 so that linear
> -		 * map randomization can be enabled by shrinking the IPA space.
> -		 */
> -		u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
> -		int parange = cpuid_feature_extract_unsigned_field(
> -					mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
> +		int parange = cpu_get_parange();
>   		s64 range = linear_region_size -
>   			    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
> 
> --
> 2.43.0
> 


