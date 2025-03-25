Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD21FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 19:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uusw5Mfq776t99OEEpC16y3um4OcX5n1LocwgSdxeo=; b=w8oLW63fHjSluqQ+Uq+8f1gtVg
	r/eiHRwG7OVSpS2w5PUMqztBgxNXuIU0jUZSb1ZEe4lNWhX4rY/R/+FrFY/Lge/mXi+MAApgwnoqN
	ukvreuV1UNwHCLR29jGJOcedFj4o9MKjzOkEPwz00zedVEQi+WWyi6L2JDeIlXvzrUzD14NBGxlew
	4nLgKQKxCBWXcDWgFil4zgLsg6RnJQUwiXcxWCXQ9s+QypI6oTIGK+fowXU7c1a6Phf0MM6ftyZm8
	dveI+jr0uIMmjEaIDlvhndT1NECeK77cyL+7uACm7PCLS6A3RRc04Sdbw1D6N7YqH/XzNkDP5vrbo
	hLitDjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9sR-00000006rOV-3MBm;
	Tue, 25 Mar 2025 19:23:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9qi-00000006r2r-1j9R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 19:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742930527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4uusw5Mfq776t99OEEpC16y3um4OcX5n1LocwgSdxeo=;
	b=CNKs7I7UhFhCn24rWHS0dFIBNww+U+zrRW2SBVma4fkzWydf/rne754cWHLkzpF/TkHW5z
	l2HTtb7sMvD4GPwSdelcrLIMLm8u3tcCvOC6mkvaPEOiA1FXXmbOXHAnp/uks8bdyp5JMj
	QqjsRi3S4HxDZk4HBayAlrGxvVSQ51s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-Yv_IJAaDNACrhnLLH_QPVw-1; Tue, 25 Mar 2025 15:22:06 -0400
X-MC-Unique: Yv_IJAaDNACrhnLLH_QPVw-1
X-Mimecast-MFC-AGG-ID: Yv_IJAaDNACrhnLLH_QPVw_1742930525
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e9f6e00so25444385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 12:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742930524; x=1743535324;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4uusw5Mfq776t99OEEpC16y3um4OcX5n1LocwgSdxeo=;
        b=h6i/AE5ivZVGjfMdc1Y2g138n0T2mfLgWnfZl4hBufNhFSQqBz/PbiZnqdq/Gs///S
         mEAEpv5eRy1xC1Z1kIUHeI98sylMJEaa+6zEnEwoaL8uG+8+i/fOpjh5LySCS6SMZveR
         sauHgfaOEQpfHJrlq0cNFuwNNsViwm4wjeLmBjAJEw6g9jnGBDto//HZ+yVcadksXrmw
         JvZ1SOYwSuHacZ+d7EHnAswy/UPjLBjZenBq0NejdULVffEt+omL24EDSRL4K3xWsT/s
         ruqiJs9UCNN4W5Rfwu4HY0WhlcFWY9mOWLWZ69sHAbFIsaaD/UsjphiuytIL0ud1YwBl
         hEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3B50CZtkRvPacQvHiTOsz9qpBRPndvp/VXqKZHd08GnBZDWFyr3x25tbSjuvyVxqNQsT8IMkJiQk4id1Eweko@lists.infradead.org
X-Gm-Message-State: AOJu0YxUiAggnhQ4hi1FgL9/wC0M/jFhQc0iTGhJoPLEJC28mGpdanpF
	xqx/Ljm1dat099uOGH/anGJp0TJfM4We39GE2QBz6hroOjt5Gnl9CPf332VJpqV0Ya8SOeLkeMi
	xEDDpxSQQH9X6sxLjhaU2TqQm28ilklKX/DBYMo0v9Auq1X1rGvKIsCGrsEt0LTcpHzD0i7FB
X-Gm-Gg: ASbGnct+FdCS/efM4pWCoh/RD4/In/f1H8uNXBWm9+HpOHD/kKeXUb7Pc6XO4UZPGLU
	kNQXPtrouboSSvTaKI1uOK8vCwaMgwaJaK3o7LR9+wgEP/uctB2D49HaDGIc4SHzkha2fjgPczr
	lbxt8DI8uhMChq6FjBz6ys8aaSJA07ePKTq2nEBIalXqzqudcImIMcrt1NzWRq3PSRW69KPKdlX
	7CfB8etlYHouQK8D8hbHmZiaxhp9R5LJQmrMIa1gSlvqxFOzayIf6vfB2nD3aB2tOkE2pL9z2Bd
	OnhwJ84b6U0i
X-Received: by 2002:a05:620a:1d03:b0:7c0:a264:4de1 with SMTP id af79cd13be357-7c5e494b431mr151018585a.24.1742930524604;
        Tue, 25 Mar 2025 12:22:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEXSfDMRz0JKf36Wpss30g3vtLjnFK8ezZQX4sG9FZ6Z+Fvfb2FbRMSHP6VydBgJHZ4ZfB+g==
X-Received: by 2002:a05:620a:1d03:b0:7c0:a264:4de1 with SMTP id af79cd13be357-7c5e494b431mr151015185a.24.1742930524235;
        Tue, 25 Mar 2025 12:22:04 -0700 (PDT)
Received: from [172.20.3.205] ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92ec63dsm668951985a.62.2025.03.25.12.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 12:22:03 -0700 (PDT)
Message-ID: <1767a68b-cb2e-425c-86bb-bc8e5289ee99@redhat.com>
Date: Tue, 25 Mar 2025 20:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Correct the update of max_pfn
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>, anshuman.khandual@arm.com,
 catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, ardb@kernel.org, yangyicong@hisilicon.com,
 joey.gouly@arm.com, quic_cgoldswo@quicinc.com, quic_sudaraja@quicinc.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com
References: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QNJyk1mxb5J_NhnumHSsEu5Vzew-ZhUhWXxHqgcsG14_1742930525
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_122208_522450_E7E6F056 
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

On 21.03.25 08:00, Zhenhua Huang wrote:
> Hotplugged memory can be smaller than the original memory. For example,
> on my target:
> 
> root@genericarmv8:~# cat /sys/kernel/debug/memblock/memory
>     0: 0x0000000064005000..0x0000000064023fff    0 NOMAP
>     1: 0x0000000064400000..0x00000000647fffff    0 NOMAP
>     2: 0x0000000068000000..0x000000006fffffff    0 DRV_MNG
>     3: 0x0000000088800000..0x0000000094ffefff    0 NONE
>     4: 0x0000000094fff000..0x0000000094ffffff    0 NOMAP
> max_pfn will affect read_page_owner. Therefore, it should first compare and
> then select the larger value for max_pfn.
> 
> Fixes: 8fac67ca236b ("arm64: mm: update max_pfn after memory hotplug")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>   arch/arm64/mm/mmu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 1dfe1a8efdbe..310ff75891ef 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1361,7 +1361,8 @@ int arch_add_memory(int nid, u64 start, u64 size,
>   		__remove_pgd_mapping(swapper_pg_dir,
>   				     __phys_to_virt(start), size);
>   	else {
> -		max_pfn = PFN_UP(start + size);
> +		/* Address of hotplugged memory can be smaller */
> +		max_pfn = max(max_pfn, PFN_UP(start + size));
>   		max_low_pfn = max_pfn;
>   	}
>   

Yes, that's the right thing to do. (I always wonder if these values 
should be atomically updated ...)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


