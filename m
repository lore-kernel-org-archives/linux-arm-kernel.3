Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BE4CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4bziSJL9UR/Qm6TyxCwaAd6httEA1G3wcOzxZ9HxEk=; b=OnYoXX6Qq6uzROv0D50HQmelas
	oujjXw8ZgyrS+ZIrDB6ElEBA0VyOzy55PxYb+EvTDnSl8wwEBkCbLUJ00sJvJgZ+j9ror2HeEyZds
	5kWd+OkHjn86dYWbSaeLCOd0Y3oH8KfNUK1Kxhy21SkeeCfkZNJ68Vea6HWXbDvUzu7uZIYtCTZSz
	IWxbiKocMg7ECgVKH/gXTAqTX5ykK8Qqax21XexhTYJSPJQxCnka2UqsASQ5jufFvRVxT0SYKM8PE
	CPKZar9KxJC2XHgjoC/pAxnmQLptdedGwK4oMNfWVv9IAdc9Ejtim5KMUU8Fdsb0eC5PS16damuiL
	kkKZkjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bhh-00000009eWg-2pdK;
	Mon, 22 Sep 2025 08:15:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bhd-00000009eUr-410Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758528916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y4bziSJL9UR/Qm6TyxCwaAd6httEA1G3wcOzxZ9HxEk=;
	b=ddLcxK5vxnAAS63zYPbQrsYo8WbJyEn2/RVRiEASn1clfwTOYtPF7GW9T2hVWj5Ya2aS6O
	fIRlvhzck2YuQ81ws0mBcpuOTwj0Ptwk7PswaziHe54lbS0ZtRKwC3eiN1kIhDs3ajxH+0
	W6MuEVKPCO+n2xeuHJ94R016cGYc4kU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-_YXWORqhPQivv_JRzkNuzQ-1; Mon, 22 Sep 2025 04:15:13 -0400
X-MC-Unique: _YXWORqhPQivv_JRzkNuzQ-1
X-Mimecast-MFC-AGG-ID: _YXWORqhPQivv_JRzkNuzQ_1758528912
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45b98de0e34so36292815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 01:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528912; x=1759133712;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4bziSJL9UR/Qm6TyxCwaAd6httEA1G3wcOzxZ9HxEk=;
        b=le+0QESUsy0ci8LawhZLGIadkmK2XF0xqkNYHfal7bmE657yC39HIkgr1szjPDjdQv
         YW5vSW6CpRIv9hgu6fOFTSZxnQZCLJEY3zq9IHPSLo3YiMPBWTEe1dW9ErNTQTuQ04tm
         6/qcOuzPLv2xn9PCb0yMtPcKxmQF+PQcYl9s9tubE0AV1zIjj3ASd6cqk0cndm4TO8xf
         j1jyf0DsZ5xsfxjO+emQJGnz9BdarGqIvOKWQKnfO7MCL3sp+z8uw4n79M4MqA64ALW6
         K67KkF2Wzr4glB1PtlgyqvYB2sMEl1YnCeaENEGW3Uq+FSDFyney2x4RNQvMpV5efxoC
         0dSA==
X-Forwarded-Encrypted: i=1; AJvYcCWmtHDwnZE2yEHhHrNks1CI46KajB4f3SQA7lPbDZ9pfD8J4dw0e6EjPwECgvR9T/H96d/3IzEbnv+7Klm2zUnP@lists.infradead.org
X-Gm-Message-State: AOJu0YxpPpI3cmEw49eGYDqgK4dAYmT1y3j3it5U9w5Mvt7ZKR5V9Svt
	BdhGJz2uUxtqiYE0S8e9yD5CNOJj11hoiNGOLPEgTsvrDqesk9tjfGx3XM99uIkf+op0IxZXkY/
	H7oiQX5JhWMHvff2N3gezPsAdox5Lr39LTPzdRZ/SfYPmuHwNJsmFElnzGUsDdKACGGWs9cbeRX
	Y9
X-Gm-Gg: ASbGncs1/u3TYWbz/kOuaUZjCmlo5j2LLYMtkbF0DSBPbEinBTmajbRmT99n/LXiCHP
	7xzRJntlMIKGZCTDV0otflXxBax2SBJ7sElpb5a8oByGrW/dP5t2IPRauRkJuO7CLI4VdBIY02C
	/q0FhBd+LaIrsO27PD2pTsaUyZQHzmH0q0iDerN8jFKBVCVDKxatYWLQjutAOjm0dy6BlSFG3Qy
	6Q+JGn9mWkAzhN9sT4wn+Fhps/UvjLGgSk1vNubXyLaVmlIY/LB9kRyjyxFKCrtL+4TDcgwOz/w
	FEZ8Dcpncz9f0vB5O/ZaPk0XAy/zs7Jnp2xEtYNgyo4nnPXB+ApJbNXMKHakRx7kAoIM9CmElxY
	x9eG6q8S2RNCPF+DXW+XPTGvQkHf5YL5J1rP69k8lFFoKCSUK4Uyhl7H+Bv1I6xE=
X-Received: by 2002:a05:600c:45c9:b0:45f:286e:49a8 with SMTP id 5b1f17b1804b1-467eaa88162mr121467055e9.30.1758528912061;
        Mon, 22 Sep 2025 01:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENAOUSzL/l8cJci7x47KhzFNMFxxaLQqca9eiUHlRz0tCsa6t/rZmY1rYxxG86TEOI2EXtEA==
X-Received: by 2002:a05:600c:45c9:b0:45f:286e:49a8 with SMTP id 5b1f17b1804b1-467eaa88162mr121466795e9.30.1758528911668;
        Mon, 22 Sep 2025 01:15:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2a:e200:f98f:8d71:83f:f88? (p200300d82f2ae200f98f8d71083f0f88.dip0.t-ipconnect.de. [2003:d8:2f2a:e200:f98f:8d71:83f:f88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee074121b2sm18833236f8f.27.2025.09.22.01.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 01:15:11 -0700 (PDT)
Message-ID: <91041fd5-ca37-4a6f-981c-74aa92bb2291@redhat.com>
Date: Mon, 22 Sep 2025 10:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] ARM: memory-failure: not select RAS and
 MEMORY_ISOLATION
To: Xie Yuanbin <xieyuanbin1@huawei.com>, linux@armlinux.org.uk,
 akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
 rmk+kernel@armlinux.org.uk, ardb@kernel.org, nathan@kernel.org,
 ebiggers@kernel.org, arnd@arndb.de, rostedt@goodmis.org, kees@kernel.org,
 dave@vasilevsky.ca, peterz@infradead.org, Minchan Kim <minchan@kernel.org>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, liaohua4@huawei.com,
 lilinjie8@huawei.com
References: <20250922021453.3939-1-xieyuanbin1@huawei.com>
 <20250922021453.3939-2-xieyuanbin1@huawei.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250922021453.3939-2-xieyuanbin1@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 94Q4VSCB70ldhA5kHzHuEt3u5YtZkWDI0acZOGxM6oA_1758528912
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_011518_081780_CC37756E 
X-CRM114-Status: GOOD (  19.42  )
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

On 22.09.25 04:14, Xie Yuanbin wrote:
> For memory-failure on ARM, these features do not seem necessary.
> 
> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
> ---
>   mm/Kconfig          | 4 ++--
>   mm/memory-failure.c | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 034a1662d8c1..22eefc4747d5 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -742,22 +742,22 @@ config DEFAULT_MMAP_MIN_ADDR
>   	  This value can be changed after boot using the
>   	  /proc/sys/vm/mmap_min_addr tunable.
>   
>   config ARCH_SUPPORTS_MEMORY_FAILURE
>   	bool
>   
>   config MEMORY_FAILURE
>   	depends on MMU
>   	depends on ARCH_SUPPORTS_MEMORY_FAILURE
>   	bool "Enable recovery from hardware memory errors"
> -	select MEMORY_ISOLATION
> -	select RAS
> +	select MEMORY_ISOLATION if !ARM
> +	select RAS if !ARM

I'm trying to figure out why we need MEMORY_ISOLATION at all.

MEMORY_ISOLATION is mostly required for memory offlining and 
alloc_contig_range()/cma -- it controls the availability of the 
"isolate" bit in the pageblock.

What CONFIG_MEMORY_FAILURE soft-offline support wants is migrate_pages() 
support. But that comes with CONFIG_MIGRATION.

And isolate_folio_to_list() has nothing to do with CONFIG_MEMORY_ISOLATION.

We added that "select MEMORY_ISOLATION" in commit ee6f509c3274 ("mm: 
factor out memory isolate functions").

Turns out we remove the need for that in add05cecef80 ("mm: 
soft-offline: don't free target page in successful page migration") 
where we removed the calls to set_migratetype_isolate() etc.

Can you send a patch to remove the "select MEMORY_ISOLATION" independent 
of any arm changes?

-- 
Cheers

David / dhildenb


