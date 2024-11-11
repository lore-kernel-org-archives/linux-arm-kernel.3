Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F7ED2E9D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yezwXuy1oqB/Mlke0JXcT/QliEzB4XcNQBVIjSWzpa8=; b=nbAu6gW1NTOBAM84aFu6ARIYgr
	1x6WkIWbzvPRZMNGuckjCZIk5OiQ13xMp8dCzaOrcgfhXwIVt6spBTkIfV/hjPgDvJPK/LQ+216rt
	7jitaEJ3GaeWfN1O344tgfyeCbdMGwAbxvAXLxvL9MBxoVJaPYfVVvdjAZDs/efiT+jn6HNCjFKQN
	Ivgrw61TU60wCZVUcSaMC5/paurnfxSgHW6fpYs3xykuAXrl/IU5RQHlTlJ8u4+fktj28ykHdC72P
	JsUwq7ApylcZeevbO+/deaC+gEajm88yXAp4v7yUIbZ+oesklhW92kA4mVTUdyBnnzsTpowdXwJLi
	gKac/jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARPB-0000000HEkl-3MmG;
	Mon, 11 Nov 2024 10:12:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARKr-0000000HECr-3kKb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 10:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731319671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yezwXuy1oqB/Mlke0JXcT/QliEzB4XcNQBVIjSWzpa8=;
	b=ir1++/RYzBN3raGNY5KvNfoiYqZuKvFQCSC+dUtHCFkJAoKPbXfmQLJDYoFU3zKBulNVhN
	WbQdNSSjS3e8erB0skM8861pt4CaR9RY6vxJIjYZZl7tVKAG5DyYtiy6s5aSx+DjvUGpad
	NXEI/s60F1IxiOZ/BTfCSLTFgA3PFxk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-pS0gYeUQP9qzIa48rSoWxw-1; Mon, 11 Nov 2024 05:07:50 -0500
X-MC-Unique: pS0gYeUQP9qzIa48rSoWxw-1
X-Mimecast-MFC-AGG-ID: pS0gYeUQP9qzIa48rSoWxw
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e9b723c384so2774902a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 02:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731319669; x=1731924469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yezwXuy1oqB/Mlke0JXcT/QliEzB4XcNQBVIjSWzpa8=;
        b=MwbzLWUlccGcE0yTzuXfQTlw7a2uIwz4hZRy2+Vn1M9wzx8oImgdZQlBBCNxx0srtI
         ZiKDUbZoRJZzJG5ZJ8fz9HUAo02X326cKIk+31Izc32gJX02NlTWJ3YK1QPV0cDd8oo7
         S+Cawa/lXF+SZOtpi1HCT7pW750D3ir7+wme4nnbN5pZ8op6ZRkiLgyiX/KuIel2GfCV
         LoUXHPuf3HgAx/NJXvtSt1sV4chpxPaHIf5EgAGdLtoK80GOcnyu/Wbp+jzOTzokJzhN
         IVEknei1+HjKZ+3GPKbvjR8QshDR/LZPqMUSZWI5GARPdrKZndG1NlRty5VYV/lyANDj
         z6zA==
X-Forwarded-Encrypted: i=1; AJvYcCW4tsb+00pJJ5BHQJ5UYbYLlW3lt65ZssWdq5dAOPAWj7hcYgNh8zwygwJQlmfDIX27+nDb4dY8dmJ00q6qbS7B@lists.infradead.org
X-Gm-Message-State: AOJu0YysIMAmtT1rmA0bIi3D2dA3Iy/TGVy5yynddrR6fdsVpWaeRwEY
	ml5KmlfqT/A8wgfAbebjDZUYRjJ+SXdcW6V57r7j61SgV4wfZ0em0SCfNuX1Swu0fJFjQerZlsu
	uLEeUue3VDGMi5AKrdgp+5RHglwsbMn0bpCnlUc/2G5WVNfcvHHbvm4KbuGzHo7IlAgaq5mwe
X-Received: by 2002:a17:90b:4d0f:b0:2e2:e91b:f0d3 with SMTP id 98e67ed59e1d1-2e9b17730f0mr15948437a91.29.1731319669094;
        Mon, 11 Nov 2024 02:07:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQkNwwiHyh2arF/dEtQ9CoiCRLtC7ejiIPDEIh4JQE97bKk655Gfxfl4GXdPX+ZWkfZBB+LQ==
X-Received: by 2002:a17:90b:4d0f:b0:2e2:e91b:f0d3 with SMTP id 98e67ed59e1d1-2e9b17730f0mr15948419a91.29.1731319668715;
        Mon, 11 Nov 2024 02:07:48 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6a06asm72304995ad.235.2024.11.11.02.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 02:07:48 -0800 (PST)
Message-ID: <dad7496b-265e-4910-986e-98cefea1b4d0@redhat.com>
Date: Mon, 11 Nov 2024 20:07:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Change protval as 'pteval_t' in map_range()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20241111075249.609493-1-anshuman.khandual@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241111075249.609493-1-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YEaJOggqGHEJkXX38lyEMyZlHaiYcz8OOd7WrNN6NfM_1731319669
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_020754_043470_C1EF21C0 
X-CRM114-Status: GOOD (  12.19  )
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

On 11/11/24 5:52 PM, Anshuman Khandual wrote:
> pgprot_t has been defined as an encapsulated structure with pteval_t as its
> element. Hence it is prudent to use pteval_t as the type instead of via the
> size based u64. Besides pteval_t type might be different size later on with
> FEAT_D128.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This applies on v6.12-rc7
> 
>   arch/arm64/kernel/pi/map_range.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


