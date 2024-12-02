Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648ECD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeMvm5EnFdrIdqfp6aMO3RZ6O6x0CMFFsFBU61eAI9Q=; b=YpFT/PrFoOfoi2mnzAcYRYR5MY
	QmMUdJBZrDE17bx4d/jp75uXYHkOXDBLMV+H0OIgpTByAPmk5A7e7OLiburW1nPWbbQWvEukqYW8j
	4Wb82NBwAFk09VfrNjeiRGlWr0O+d64drScfkUX94kmu2mHV2rpgI/7aQk47i/yEM8m3Pxqhq3Txm
	uAwf5HCCetlWOVOwooBSgxL6EZMaI1PrpCFQoNovfwx6LqjMbRI/xu0ca50lTdZcnCupbBwpa2smw
	SmT9uH3MPh15GWeIew6l4U+NG0epgXU+V9QLeAIdvtvoprI5v/21PZnsbcwpLqFWoeeR7UKGUQity
	zlU1o9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9H9-00000006qWV-1fXG;
	Mon, 02 Dec 2024 16:27:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI90u-00000006nFX-3Tl9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733155865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UeMvm5EnFdrIdqfp6aMO3RZ6O6x0CMFFsFBU61eAI9Q=;
	b=MXlSuJSbKY1d3nuoNALS+/MDNpWiegYAXVxnJsu7/seJIMIkcxZOSo+9zEXYRgTyBenWqy
	JihcLC2Nbbk17Ya10kvD8C0gRbrp/X2zYVYlt+/cZAqrcJeymkyEcIXKZMMXohEY+jRGIS
	teLFkUtq3ZH7zxuj+22gSQ6/d8xE6AM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-wgsSA5f6OySjwiYp6uJaDQ-1; Mon, 02 Dec 2024 11:11:04 -0500
X-MC-Unique: wgsSA5f6OySjwiYp6uJaDQ-1
X-Mimecast-MFC-AGG-ID: wgsSA5f6OySjwiYp6uJaDQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385e1fd40acso1342856f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 08:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155863; x=1733760663;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UeMvm5EnFdrIdqfp6aMO3RZ6O6x0CMFFsFBU61eAI9Q=;
        b=HIBgz/OCnQoHQV0xXrVRJD/E3gXEqt/JLdaCdSMRHdmloKif7JHXQIv0LuyOvn12mb
         siq2bAwhIbYVcR+pLW+/2PCcTlVlGRKQoje6W3e1m54wDWdrsRnHjEDSmg+we5xsuf2z
         bTWoi3c5M6IW3fWxNZfYNEeyycnDN0CgEqkHoeG7mPiYlNAXNrUPBVxj9zJ2h8bfadxp
         TOHQIHHLPBVesDeG4SAfUfDaqxNsdy3m0rdN3wVDUrNYtXIMTp7z2vBVPySzsq9bKRRe
         qXRyjIQmd3q7cCPNcpB8JgecuW4Q7p8zurhcRuUTVCMLLFLSCDWejDajEA2QdC8iSp6P
         a/2A==
X-Forwarded-Encrypted: i=1; AJvYcCXHhCok/EQwlIe9tOTbUVpAH02rzQv/47aVOzc3oxq56KIyv7TepyPB/ijAnPM2IcLOhIzOkugQdN/7ZUVuqF2D@lists.infradead.org
X-Gm-Message-State: AOJu0YwLS2y5N9DNBprZoYN1VXk9IgA1WXEHXHlQTPyJtG/QIt69SXud
	cWz6L7Fg9a3UYfubBBgxz+TiijCdPl2135+HglAXkFz19yXGTTHiDoG1X0UW78SuGVdwCaGh8xK
	SgupimY9E4P9cBjmVLBHBH9Gopr39kZvqEHO99eTp/g2p4mVW1snfKX5k5dyYiycRTK0lL5/6
X-Gm-Gg: ASbGncv2Qk/Tjldt4IiUFhkH8VHg9SLk3g8OkxIaFK6IsNIHXkVqoFiydV7VPk0eYUv
	ucNiiFgq6FmNIjE9skUtOkf8eMnfwLX8iLUQBX5XcYl5EG4MSZzsAI0OTPRm99wAVaeK+fOm0qj
	6AHol3goPoWl50UO0j94vc1HXAu1ZOjOtcUFXArcP6pWewURuslJ06zMcXGJmHFgjspr805ZKey
	UOlMFLuxWFfQQ2mZvLvR9vomVHg86+5BBiRkzi4reL17SS1A1h/NNN2xkL8TELWiF1G5auM/yXi
	6dGSPOFT1bbS2c6+YoT7Oy3baa5R5swXx0DX9HFtEn5HWPj/qtCbxqQ1AEhs2XOZlYfa+RJzzFm
	gfg==
X-Received: by 2002:a5d:64c3:0:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-385faaaa0famr1211527f8f.35.1733155863049;
        Mon, 02 Dec 2024 08:11:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjInTc7ygfnAmD6TjdglitCOoutWAV+90CVhwOGIUhKaDe+qMP4cJZO6lUHPEL2rPPpjKvlA==
X-Received: by 2002:a5d:64c3:0:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-385faaaa0famr1211475f8f.35.1733155862595;
        Mon, 02 Dec 2024 08:11:02 -0800 (PST)
Received: from ?IPV6:2003:cb:c73b:ba00:bcff:e7c1:84bd:9486? (p200300cbc73bba00bcffe7c184bd9486.dip0.t-ipconnect.de. [2003:cb:c73b:ba00:bcff:e7c1:84bd:9486])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bd06sm159755685e9.3.2024.12.02.08.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 08:11:00 -0800 (PST)
Message-ID: <789f8be8-a423-43aa-baa7-b808d6c59072@redhat.com>
Date: Mon, 2 Dec 2024 17:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
To: Catalin Marinas <catalin.marinas@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>
Cc: Sasha Levin <sashal@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
 <Z0STR6VLt2MCalnY@sashalap> <Z0TLhc3uxa5RnK64@arm.com>
 <0c09425b-c8ba-4ed6-b429-0bce4e7d00e9@os.amperecomputing.com>
 <Z0dhc-DtVsvufv-E@arm.com>
 <dc5e8809-825f-4c38-b487-b16c7d516311@os.amperecomputing.com>
 <Z0h6Qtleb-znhX3u@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z0h6Qtleb-znhX3u@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fVemAAUomZRhuo9oxIaIoMQCcapDymNWr4LP7lkrirE_1733155863
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_081108_942146_858831CA 
X-CRM114-Status: GOOD (  20.94  )
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

On 28.11.24 15:12, Catalin Marinas wrote:
> On Wed, Nov 27, 2024 at 05:21:37PM -0800, Yang Shi wrote:
>>>> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
>>>> index 87b3f1a25535..ef303a2262c5 100644
>>>> --- a/arch/arm64/mm/copypage.c
>>>> +++ b/arch/arm64/mm/copypage.c
>>>> @@ -30,9 +30,9 @@ void copy_highpage(struct page *to, struct page *from)
>>>>     	if (!system_supports_mte())
>>>>     		return;
>>>> -	if (folio_test_hugetlb(src) &&
>>>> -	    folio_test_hugetlb_mte_tagged(src)) {
>>>> -		if (!folio_try_hugetlb_mte_tagging(dst))
>>>> +	if (folio_test_hugetlb(src)) {
>>>> +		if (!folio_test_hugetlb_mte_tagged(src) ||
>>>> +		    !folio_try_hugetlb_mte_tagging(dst))
>>>>     			return;
>>>>     		/*
>>> I wonder why we had a 'return' here originally rather than a
>>> WARN_ON_ONCE() as we do further down for the page case. Do you seen any
>>> issue with the hunk below? Destination should be a new folio and not
>>> tagged yet:
>>
>> Yes, I did see problem. Because we copy tags for all sub pages then set
>> folio mte tagged when copying the data for the first subpage. The warning
>> will be triggered when we copy the second subpage.
> 
> Ah, good point, copy_highpage() will be called multiple times for each
> subpage but we only do the copying once for the folio.
> 

It makes me still a bit nervous that we assume both the src and the 
destination folio have the same #pages (and in particular, that both are 
hugetlb folios :) ).

Hopefully that's an invariant that will always hold :)

> Now, I wonder whether we should actually defer the tag copying until
> copy_page() is called on the head page. This way we can keep the warning
> for consistency with the non-compound page case:
> 
> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> index 87b3f1a25535..a86c897017df 100644
> --- a/arch/arm64/mm/copypage.c
> +++ b/arch/arm64/mm/copypage.c
> @@ -30,11 +30,13 @@ void copy_highpage(struct page *to, struct page *from)
>   	if (!system_supports_mte())
>   		return;
>   
> -	if (folio_test_hugetlb(src) &&
> -	    folio_test_hugetlb_mte_tagged(src)) {
> -		if (!folio_try_hugetlb_mte_tagging(dst))
> +	if (folio_test_hugetlb(src)) {
> +		if (!folio_test_hugetlb_mte_tagged(src) ||
> +		    from != folio_page(src, 0))
>   			return;
>   
> +		WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
> +
>   		/*
>   		 * Populate tags for all subpages.
>   		 *
> 

Yes, looks better. A comment describing the oddity of "copy single page 
but copy all tags on head page access" might be reasonable.

-- 
Cheers,

David / dhildenb


