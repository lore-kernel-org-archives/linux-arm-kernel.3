Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665D1C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOXhqaJnJp2+DQnqUGdABkzPsXEKdnuTwS+DW6VMcYU=; b=ptEF3mdfT9F1qv3XnSkk+3YTlA
	rLC6y17TXQLu7F9888X40u4HqVkpraZyYmy0fOup/pKrWpRf4dqGxsw1hkvpF3jBjcF7qAoi0cX+t
	h0R5PvbeAmUNLbj9Ob7pbDStgqKl91AO3a7cFdjAwYYyQhWcwENJ7B24PVFJNBjVJb9ZCw4GnazVf
	OJ66ccv8TWM+5XmA1UkkcWbCZfXrUqlPDexJXPt0sH5WMKv2B1go3uyES/+zeJIxj16tdRA5DHLRz
	gBYNjrpZmiLGP0pkDUrD+x31AvuWaYCH5aOhVNRw6phVGGkTWIP8NQPRK4jQoWDS80cpgG7wmIPxF
	GqzYyovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83uz-0000000FOMW-2FCc;
	Thu, 24 Apr 2025 21:15:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83sp-0000000FO8k-1K80
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 21:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745529202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TOXhqaJnJp2+DQnqUGdABkzPsXEKdnuTwS+DW6VMcYU=;
	b=dwGBnVQWsD8hza+FzCA18t+ZEyFZsbdkKr2E9oOXVqxepMBJjW1fDU7cbrb5JA8SD9BHXN
	JOL2CtcvgKGUpPffuvJlfrTnPbnMmjau/ILK7UIpZRXSt6hYohV3qF1/7RmhyE9hhZE/OQ
	Y8w2IADU3coCYD/We/OXp265v7Bq5sw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-4qluKZs9N8Cl7GMNumknWA-1; Thu, 24 Apr 2025 17:13:21 -0400
X-MC-Unique: 4qluKZs9N8Cl7GMNumknWA-1
X-Mimecast-MFC-AGG-ID: 4qluKZs9N8Cl7GMNumknWA_1745529200
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-440667e7f92so7623785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 14:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529200; x=1746134000;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TOXhqaJnJp2+DQnqUGdABkzPsXEKdnuTwS+DW6VMcYU=;
        b=DwvFKRvA9c7rqmp3z7t6gm1lgUr9mHOlT7w0O7rTTpLMso7lXw8ZWk866pMTYq1x2g
         rySPc3eNcsaY5yoy+yWYZaXdZGnVtgp77bxdZNndY65NxZ/tiaAFJr2Bb++XBR1d5R4U
         jt7aRaLKYe0NDu59US+AZKX2v/oRpYv8zG2tM3NtB3afrBxkh6CcQgDqB2gRJbM89jE5
         xSz4esRUB3ls40IeTUPcjBqRlHKIBR6MniXRxPiI7QtOJwqbQbtmCjgx7Q46lRzSXVKz
         mu2PAMB/eBlFYwsoIOoCVwwg/9t8cparFSElrOsf4fFAKOJjobBCGhR48H37GOu9RiIy
         tIRA==
X-Forwarded-Encrypted: i=1; AJvYcCWra5oHKNbELOHTM57KunUn2ceGlmGCE0vBCpIfWllA4t2MdtOeOtsqpYDtp9FG86Z046BKIPF3gFO52k6poMF7@lists.infradead.org
X-Gm-Message-State: AOJu0YxJFEKPXSfhzR6bi3S0xt+ZMw/EwNX9aQz5RS7khgRtfcf6vQ1+
	wDEvwRVpSkqkCsOJN/7oiPMR1SKTrzyk+qrEZ/HpzGVs9axiOMBrnyh7o5qo+5094uTNXZnTdbw
	4vTBMjcyM0XqvNlqxLpcrtV1IFhXZW6dUW6By+DeJ0Eg/eKMgbvvPS2CmbU7xd4q0wWRtk2aR
X-Gm-Gg: ASbGncsiYUjDnBKH+Dtub7LLO691iukbquJy5ttmZxDyddfhHZBDq7ritTMZa1XT66F
	y8RB3eceoxjvQORVhhYLWscLKoZNWuSTSTck2CIg93XxJfF3KmP/yTeuY31w6eR+cIk6N8gDIzG
	riLqhVIHLEHpsBPHgL5FFZQIHacWvuCd0hig7HKfY68UzFzDiDMIo6T/MtJvajxJaL3b0hxuJAI
	Pd9cBWiVObwuXiHFl0kIkEY9QLCFZ1ubXqy7KuNXthsQYqCOMGZzGgANRi1l9jS9UUsW5gtmeKC
	m60xLBi3jY9YPhurbARl/m9dIwQ7ZQ6q7NRFSgCDYYwK+pLsxjsF8G44rhMpC9O9OaaasbZUcJQ
	3Dr5l1w4WWLOzw4cA6PCX057TKWaTD1TMFqGi
X-Received: by 2002:a05:600c:524c:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-440a310818dmr7773215e9.9.1745529199951;
        Thu, 24 Apr 2025 14:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXu7rx60czPGcmWU0+8461KGJT0DcvIUYSs2uaUCrKVXSoMHpwGwItsZlEECqxxyTiY6BuTg==
X-Received: by 2002:a05:600c:524c:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-440a310818dmr7773115e9.9.1745529199621;
        Thu, 24 Apr 2025 14:13:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530f6e6sm1830695e9.17.2025.04.24.14.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 14:13:19 -0700 (PDT)
Message-ID: <5569da56-4bd7-4ebf-88bf-a9edf7310f51@redhat.com>
Date: Thu, 24 Apr 2025 23:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mm: Implement for_each_valid_pfn() for
 CONFIG_FLATMEM
To: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-3-dwmw2@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250423133821.789413-3-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: octaWdiIqdzsdz2gic046ufcOO7dYT6s74dVtJnvC2E_1745529200
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_141323_427879_57E330B3 
X-CRM114-Status: GOOD (  17.50  )
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

On 23.04.25 15:33, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In the FLATMEM case, the default pfn_valid() just checks that the PFN is
> within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).
> 
> The for_each_valid_pfn() function can therefore be a simple for() loop
> using those as min/max respectively.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   include/asm-generic/memory_model.h | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index a3b5029aebbd..74d0077cc5fa 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -30,7 +30,15 @@ static inline int pfn_valid(unsigned long pfn)
>   	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
>   }
>   #define pfn_valid pfn_valid
> -#endif
> +
> +#ifndef for_each_valid_pfn
> +#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			 \
> +	for ((pfn) = max_t(unsigned long, (start_pfn), ARCH_PFN_OFFSET); \
> +	     (pfn) < min_t(unsigned long, (end_pfn),			 \
> +			   ARCH_PFN_OFFSET + max_mapnr);		 \
> +	     (pfn)++)
> +#endif /* for_each_valid_pfn */
> +#endif /* valid_pfn */

"pfn_valid"

>   
>   #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


