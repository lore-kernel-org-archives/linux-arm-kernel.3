Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3A5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 21:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0atQVDH0XvpcRUPqJkcf4AWQNWnOP+JsltT1upRf5sI=; b=js2hch0Rx2u7Yd49KXetUPlHxv
	im2C1p9pH1EBNVBV6Wl3oLF56B7T4pup7ob9F+06PL+Ah993ZTt6nZ92WPSyhrqnO07y1mlg+TF6u
	Idsv5EZHKX5ONmzrae/KwBxjVvWq/t1VQGEXpoGyXEm7olwNq/0bNDKfbRZJf3HKP6IZ1EPYjJ1jw
	tBRKhYl41SR5Fd3n4sn27xttREJ7rdb3i7YTF2IsdbZot4wIO5XnMusS9IAQBtMpWZU/uZXyD7xSf
	vHuZXS2Z8sqT3Iqg8TVsU7XgJ5xFwPPXs599lAv0fiAqu6+FnmKMs/o3mfAptGjj1DJ0xjjYGY75D
	FWOkim/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83wp-0000000FOik-0nSF;
	Thu, 24 Apr 2025 21:17:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83ua-0000000FOJ0-3XV2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 21:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745529311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0atQVDH0XvpcRUPqJkcf4AWQNWnOP+JsltT1upRf5sI=;
	b=cS4HLolTJOguJw2FBoLenMbr7l+Tw+pRbrvB/xr9AG+0py+X9yYmxE0MlQWy/g9o0yWIE7
	US287EEA4geCJ8I8GAHJULSuWkEC7kdzK9y75na0R8UMuARM+rVRbuj6waEyRvTIVcJzCE
	7zQTZzCRvw6U3kuMCDQcD/LknHidGJE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-VzmMyPVxOP-y092Yl5he2g-1; Thu, 24 Apr 2025 17:15:10 -0400
X-MC-Unique: VzmMyPVxOP-y092Yl5he2g-1
X-Mimecast-MFC-AGG-ID: VzmMyPVxOP-y092Yl5he2g_1745529310
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-440a4e2bad7so371495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 14:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529309; x=1746134109;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0atQVDH0XvpcRUPqJkcf4AWQNWnOP+JsltT1upRf5sI=;
        b=hx+W1Z8LxXYtoDO5z8XWwfCyOf9dTSdOpdZgQWjrdUYzJQHFFcPmA52jmHr/7NpdSx
         q4JyeYIozGKgR7zmuzJxnRTDAfy7eaQj+oEB0A8dqv0citO2+WHKdWGqeA3LTOxAhO1r
         nXqdWpg5suLFYrx1RLmIlr7kybGaCUnda0zNLlZ92wVC1dRMc4VYw2AC2qGXdeH/02Vh
         jYgbxd7weMSXONoczQnbmz8dDKXeIcOvpR6OUEf6UQLmNy1JjiSNVt2I/cMm6yDNTwau
         BNiM++heH0Ou0bsOjlIKAeRK+8jtMEM8JlBM3xoxex8/oF+0BmGk8JVYk82Drlb8o6LV
         +Rjg==
X-Forwarded-Encrypted: i=1; AJvYcCX4FQx9ndPOVeU2ZDsMOMQKDyhZGrU8S5IyuYgD/JMTbkc3B/LeJVxJVrJuCypDhQifrK0noQA/3Wllw9RzXyQE@lists.infradead.org
X-Gm-Message-State: AOJu0YyIQsQCRKehNQFemiu1KQA3+Dw7ktztrx5TyTt4Fy7wTAyd61Xn
	17agesEIaxbNgz6y/fFggLY+NDAVKrt9P0ruoCkJsZNVYqiIKJscUxCq0NhZgIgLe9Mu2LZGOo5
	AlJJRpWqQ8+R/SVwyvk2owTBrmMNQcfnz6T5i4bmdiau9qg7ZxOEUIgj/ZAkL/3dhkCptkGxO
X-Gm-Gg: ASbGncshifwzrIMQuShY4fb40SqP60lUqqChkD1E5IDoRFrWOMiPkGbvFh3Egd1R398
	LAAak5cVCCHPKczCG7RL9dYNF7nCimOmBdciDwnl0JBMO4pnCiKdiVy466Wqbv4Y0VY7RV7yy1p
	jlOR2J5GPAkv+UPjvXrA5q6vWgvtznhk7B431lcG0WY9Fn4CRCwsTGPLGh5M7neJlHJvImdfPhF
	Dv3tMy/HaabdRURtL5A5Z+wDqBzqR5D6bFL4GeWkr92iJE21lYoMuPqkfrgiqD+JTIA2517+/qv
	5glnmgKERYL0cpe4C8e1LdiDgRKQCUlPTIO0iU7it0zeV1Ltz7NCD8e0jHNx13A9XLKWBn/3wti
	4DkeM7NgNz9PL+7851ZK7E1GJJ5PNGZ5H4g2x
X-Received: by 2002:a05:600c:450a:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-4409c4ddbbamr31013635e9.15.1745529309471;
        Thu, 24 Apr 2025 14:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT7y3gX6fJnA7SugEtZIcpQd8krrY3RV3TcuqMt0VhvZW5tlI9puDVvH0e/UJAxRgT/uTzZg==
X-Received: by 2002:a05:600c:450a:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-4409c4ddbbamr31013415e9.15.1745529309144;
        Thu, 24 Apr 2025 14:15:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a021sm1708575e9.29.2025.04.24.14.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 14:15:08 -0700 (PDT)
Message-ID: <1838f050-b4d0-4bbe-b76e-86c718f24162@redhat.com>
Date: Thu, 24 Apr 2025 23:15:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] mm: Use for_each_valid_pfn() in memory_hotplug
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
 <20250423133821.789413-7-dwmw2@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250423133821.789413-7-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ERLnM7GuMmfX-XOO59J7Ag8v4hx2lZw-6soYHsl4Cec_1745529310
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_141512_956029_975AEF29 
X-CRM114-Status: GOOD (  17.42  )
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
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   mm/memory_hotplug.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 8305483de38b..8f74c55137bf 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1756,12 +1756,10 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
>   {
>   	unsigned long pfn;
>   
> -	for (pfn = start; pfn < end; pfn++) {
> +	for_each_valid_pfn (pfn, start, end) {

                           ^

>   		struct page *page;
>   		struct folio *folio;
>   
> -		if (!pfn_valid(pfn))
> -			continue;
>   		page = pfn_to_page(pfn);
>   		if (PageLRU(page))
>   			goto found;
> @@ -1805,11 +1803,9 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
>   	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
>   				      DEFAULT_RATELIMIT_BURST);
>   
> -	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
> +	for_each_valid_pfn (pfn, start_pfn, end_pfn) {

			  ^

Is there a reason for this space that I am unaware of? :)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


