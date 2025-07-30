Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234C8C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INvhw9PaQlqHnlfqMb8yKpdneujvD9kPiqSCHTmOp+c=; b=wJNa9CdalSoG9VhO5wnurSroyM
	rbJZ6WPIs4d8h2uNVZSeGp5p4FTTexY+th9+P8dj4o7Cn84vWvYzDddQtdY2CskoWK4DTZlUynOO4
	PaP8JQTbU0/cYXq9yDWHJxKrJ1P1HpGoMOoKvTz2FTzg2NQgvyby4fvuI6e+y5aF2CwPg6N3hWC1O
	XbG8PmYRSbJ3+eRoX3R5vzjiVyGGwNa8QFvYcdxRw0wKkM9PAWnMJTNi2UFd0C+O7EmoRTzPPh8N/
	DWHHXLL4MJn5qrZukli/wU4dwdzjgKKZGeDnomYJ8xAK/FzJ6uQsZAphU0mp4+Qn3XqUeKi2I98an
	MXnF3ixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Ow-00000001gWe-3mzU;
	Wed, 30 Jul 2025 14:03:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Eh-00000001eVX-43NZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753883570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=INvhw9PaQlqHnlfqMb8yKpdneujvD9kPiqSCHTmOp+c=;
	b=NnmcbnfJhU2/NmsRFZVrdqjNb5iMgOgQqbzK9LVodq8aDOuY6kCm/h/jNenCXHLdwak9Bf
	6ihB/pUr2EfVQrfdqua1RmzzPZ1u+oQnEvsbeFbIqa1oGKbROs286G+gCPjrvmr2REfDDw
	Ese/ZybnmLWigjzY9x/lgBKwH0D3M4Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-aJZWaThENPeiQak9qUKS7w-1; Wed, 30 Jul 2025 09:52:49 -0400
X-MC-Unique: aJZWaThENPeiQak9qUKS7w-1
X-Mimecast-MFC-AGG-ID: aJZWaThENPeiQak9qUKS7w_1753883568
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ae3c8477f1fso86589166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 06:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753883568; x=1754488368;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=INvhw9PaQlqHnlfqMb8yKpdneujvD9kPiqSCHTmOp+c=;
        b=btGwgVXXYkqD7c6Gnw/etNHraGoQykIEOeQzk9kIeZHRu4w/DIpNGQ1G3aIVcD9y7k
         O6e2SieehAMIxJQCRY/O4gFds0k6eKKOzNYvjg4fea3k3PyPHY2RwsXb99jzJhtQ0Ii1
         A4+Nk/LZYOueXL9J5fJmW6bRLI3aLB+fq/bxtAiaHxb9ssd48ipiOAdAzmC0LO4bnDmz
         s0D51iy7YKKY+SJSJpupmxbLt5gbXG8pIDbxHHCUWRA7Rs/e21WTg+PFnB8oGPENmVvj
         NMXPHsjkH7Hm7lCU3z17GdOJd5a+hTJcxdF7v49z6lTnTQ8sp1di1pJ5HHwUaWt/JRAI
         RewA==
X-Gm-Message-State: AOJu0YzH2bns+5bWYJNpF1UNl/wwfmc4IlrPH2pWCUv8FXreP4fqum9e
	nHsp8nAEe0TP0Ufd2WK0DSdG9ZU9P4W+KmjhMhc1qfGHiDeG6AvYZScKcPWNQY8ds0hXEpheQq/
	CXa7oQnqf87mpf+yMVG4h/vOOJ3XzUdAcwqeUQM7Bh+tuuESGAnOLEB2PdTd+fZzWdo8PplHagg
	hP
X-Gm-Gg: ASbGncu1Vmi3nk2OWYj1yxiSe0BUHSuaYr8kaenAfoKtsXa4xQ3ycyR/BuVSVRjjNsz
	A4YXJ9wsN8P46yWxlHbr43gCM+LvO4wOgKRgBvMCJ4xcTLopl4EZ9/NGj4rErt7Ie0rSyMKjuS9
	kyZp2Ekd2UF9v5y9bjceRc+SLvTHxheC6YxjZgHasNYSffIvwXgcJk+Hv7+7mTpefFl9Z0wL61o
	BMZaV42gA8+/EF83SXIN9Of4GLqbQlpJNobwlQxtfhdVSYz2TRrvCbey95kGmknncuVx6j5kwBy
	6AJ0/tqZh8eevreKGMDuCSQ+HMRBQmpZtnOgvhQ8mLTlwLv9sMIg3I00dHbDFA==
X-Received: by 2002:a17:907:7252:b0:ae6:e25b:2413 with SMTP id a640c23a62f3a-af8fda42a6emr459883766b.44.1753883567586;
        Wed, 30 Jul 2025 06:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2KhtHgQZ228r5yO4JfetEAu342+CZE6Zr5/g2fkWHPp7n9P5vjQqg7A7lY87sHfovdnuCuA==
X-Received: by 2002:a17:907:7252:b0:ae6:e25b:2413 with SMTP id a640c23a62f3a-af8fda42a6emr459879766b.44.1753883567129;
        Wed, 30 Jul 2025 06:52:47 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af8f1b172f2sm210258566b.80.2025.07.30.06.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:52:46 -0700 (PDT)
Message-ID: <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
Date: Wed, 30 Jul 2025 15:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250724135512.518487-23-eugen.hristev@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4FcQmC6Wrr8d8_G1KlfQ7Ruz9L8Gj1HZ9R1uhWs5Paw_1753883568
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_065252_261309_721714C2 
X-CRM114-Status: GOOD (  16.47  )
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

On 24.07.25 15:55, Eugen Hristev wrote:
> Annotate vital static information into kmemdump:
>   - node_data
> 
> Information on these variables is stored into dedicated kmemdump section.
> 
> Register dynamic information into kmemdump:
>   - dynamic node data for each node
> 
> This information is being allocated for each node, as physical address,
> so call kmemdump_phys_alloc_size that will allocate an unique kmemdump
> uid, and register the virtual address.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>   mm/numa.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/numa.c b/mm/numa.c
> index 7d5e06fe5bd4..88cada571171 100644
> --- a/mm/numa.c
> +++ b/mm/numa.c
> @@ -4,9 +4,11 @@
>   #include <linux/printk.h>
>   #include <linux/numa.h>
>   #include <linux/numa_memblks.h>
> +#include <linux/kmemdump.h>
>   
>   struct pglist_data *node_data[MAX_NUMNODES];
>   EXPORT_SYMBOL(node_data);
> +KMEMDUMP_VAR_CORE(node_data, MAX_NUMNODES * sizeof(struct pglist_data));
>   
>   /* Allocate NODE_DATA for a node on the local memory */
>   void __init alloc_node_data(int nid)
> @@ -16,7 +18,8 @@ void __init alloc_node_data(int nid)
>   	int tnid;
>   
>   	/* Allocate node data.  Try node-local memory and then any node. */
> -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
> +	nd_pa = kmemdump_phys_alloc_size(nd_size, memblock_phys_alloc_try_nid,
> +					 nd_size, SMP_CACHE_BYTES, nid);

Do we really want to wrap memblock allocations in such a way? :/

Gah, no, no no.

Can't we pass that as some magical flag, or just ... register *after* 
allocating?

-- 
Cheers,

David / dhildenb


