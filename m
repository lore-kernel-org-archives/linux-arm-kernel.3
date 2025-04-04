Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78B3C36014
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3DMfaX7enMK+CS7Fw8aqK7Kb4zBw5LAQWIhlF/2oKY=; b=bYBlzGLCW1aWU4w3TBhEF4AT22
	B1S5iBMDa/SvxEgUOX7wXXfnQzt0KyIlqYin8A0JK4AtiT2sqE502WotB0gLIHiWeRmSwHp8r+ETv
	scD8IjpzQIt1ul0sLUQbQPkYfw9Fa4WMSN/J/0gALYA8yscToW9GhRTMYt+I5ClRzyMu/Y1JhM7aX
	/0RZNtjakqFPu01ztAd3IgXizkOVGQMNCCIU8Biz8IqWgeH8BzTk5ehlV/ptXw78VrlYlENlKQOEE
	itpsKjTAxdfMcAp/LB9y7thVAlXDdxtr26Mj+ROsk0JuM3aRBPEebGuWnvfKiNZ1iauCrml81MB7s
	MC4ytpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gdL-0000000BkBV-0imc;
	Fri, 04 Apr 2025 12:58:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gbb-0000000Bjx0-2HUG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 12:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743771426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q3DMfaX7enMK+CS7Fw8aqK7Kb4zBw5LAQWIhlF/2oKY=;
	b=W/m5ye6BAMjdyUPwYUi3MY6Ue4voDXa/DnXL2mY45icYLVomJeYYxKBJnR+krk+tM50uXB
	vPZrq3fDAsjhzH1Fd708AAzRl4mSXFlx1gJ+9OmXxV/+KXK7VWSZcWvdwPYJcQTOFZqw6T
	Khec+bBZ3J0l03RSPCCctqqtSB3l7xw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-pLlm0CZANLWuOVyqZyGLsQ-1; Fri, 04 Apr 2025 08:57:05 -0400
X-MC-Unique: pLlm0CZANLWuOVyqZyGLsQ-1
X-Mimecast-MFC-AGG-ID: pLlm0CZANLWuOVyqZyGLsQ_1743771424
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ea256f039so16645475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 05:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743771424; x=1744376224;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3DMfaX7enMK+CS7Fw8aqK7Kb4zBw5LAQWIhlF/2oKY=;
        b=ZJeryEhciGpjBmGSTbifU700GflH6B3mcUj8yUJvEq2KEhbslyKMsZqCTRJ7RF/L74
         4Smlb+LBTVTxVhu8PKachVrf7+zoXxL6tkBxG0wtOxIEriaYz6nh0+tWJA/SdiaUcOtV
         kZZt3WuDgK8AOuexDh7cXwb0fZzhmjQrLEZ8NDLHpX0dTghLdMK2P4c1cjVK6bHgf/Uz
         Q8za0HlQPGLa8yGIS3I1KbpwuKl4JLh85+cuQme/QoN75pxC6nlEdnwVziTpLfYtYTBg
         K3PHBza6V1OdyRr5YjhyxKDFB15meHK+Kg03VTJZCHXsS5p8D35eCPp5VY97OwUtZrQw
         DoVA==
X-Forwarded-Encrypted: i=1; AJvYcCXSmq7zFHaroGZC4gGXOj8TaR7TZxQkzxVMR0FDQvC3/B13QzHOqr5vYUtByr7P0Gm2Ipwfdnv4+cLvvuq2EI84@lists.infradead.org
X-Gm-Message-State: AOJu0YwkKf/tV6/qppyOBa9nMzBCm+5i4MuNmuBtpVGZu1jpCpgIHEP+
	Ym8Dy8S5lJYQqSmgGksPNAO2XdvHBVDJk13auale2hC+emZBdw0tvOmX7PjRf63Y/n8nVSeexa7
	F1o1FZvWUMwVdZYbi5dTp4wAAU9fyTE1UOI+VHvsDKbtr+3o7tTKSgw5tVHuu7W4FSJSB12ZL
X-Gm-Gg: ASbGncvdrKbs81ksG08wVspl0ER4F/5zuDP/OdUUSNTtW3OWuJWQjGGrqJidSoIpNuj
	9VlGy1CPiP9o6M195S4r+R9hNOaqdH1JjP+ZPadc3dI4IW4lDxgclRc1Cks4hkg7lriDRI2gWin
	20LYG399xxrkiOzM+xA/WjrOTUz37LvFHA4oCXhZ0qVBP2afKpNP1BHGnJYNNjyjdkcPewwt7se
	LJqD1rDmoieZad9Nl3ZsfAbUyXPVOZ5qbNAlupEYko49wLlyoNdOD4re9EwrgHjfWuNWYdS3RzX
	xs5sjBFW/ya57wHiYYycWhJ7ytuNnG38xcueMDTJPBL6t+/62ZtAq4GgZ6Fbei4slOC8yE8g1HN
	h/Ziw40OnmFEP+JwHkv2+PvHMCZO50jdhubGd8dvP3GA=
X-Received: by 2002:a05:600c:3b14:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43ed0bf6aeemr26013865e9.11.1743771424055;
        Fri, 04 Apr 2025 05:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsTD0NEe/13x1nCp/BwHj5jtQGwunCbeDSGxQPUJ97SNdpBIw8pTlFFk7pwqO9xIGqvwm+/w==
X-Received: by 2002:a05:600c:3b14:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43ed0bf6aeemr26013625e9.11.1743771423678;
        Fri, 04 Apr 2025 05:57:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366a88csm44392385e9.37.2025.04.04.05.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:57:03 -0700 (PDT)
Message-ID: <75884033-9474-4d0c-b737-d9b6aebe298b@redhat.com>
Date: Fri, 4 Apr 2025 14:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 ryan.roberts@arm.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403052844.61818-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250403052844.61818-1-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CiB-at1UY1DNkZoZ6HF-sN_7p1U1ZwLfWH1-XMdsSA0_1743771424
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_055707_655901_C62E3DC6 
X-CRM114-Status: GOOD (  20.90  )
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

On 03.04.25 07:28, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
> which does not support changing permissions for block mappings. This function
> will change permissions until it encounters a block mapping, and will bail
> out with a warning. Since there are no reports of this triggering, it
> implies that there are currently no cases of code doing a vmalloc_huge()
> followed by partial permission change. But this is a footgun waiting to
> go off, so let's detect it early and avoid the possibility of permissions
> in an intermediate state. So,  explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> v1->v2:
>   - Improve changelog, keep mention of page mappings in comment
> 
>   arch/arm64/mm/pageattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..04d4a8f676db 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -96,8 +96,8 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	 * we are operating on does not result in such splitting.
>   	 *
>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Those are guaranteed to consist entirely of page mappings, and
> -	 * splitting is never needed.
> +	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> +	 * mappings are updated and splitting is never needed.
>   	 *
>   	 * So check whether the [addr, addr + size) interval is entirely
>   	 * covered by precisely one VM area that has the VM_ALLOC flag set.
> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	area = find_vm_area((void *)addr);
>   	if (!area ||
>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    !(area->flags & VM_ALLOC))
> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>   		return -EINVAL;
>   
>   	if (!numpages)

Makes sense to me. Whenever required, we can improve the checks (or even 
try supporting splitting).

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


