Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7A7C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPMg8qYY6woJwUtyf2x+IAiV5yepPU5ZWaNNfhk/IJY=; b=XDuU2L8fEfxr9gd0k+O1qUBUlk
	TIqYa0cs6u0MpB56nvgg0mV9/4lPJmJa+mV8T1tMZEu6JPDOwsnRKXydLgYJIy8NSCD7+jjXswNlM
	MRWia2a67gXbU/cZXocRJfx8ZXnmbXbjlc3ESah6tr8QZs/hBZzFBhLLVojBB4jLJ9euVstTXgn0v
	GYAO/JwFcuguWZOt8F/yYIdpjlz/HMWrdIklAUy+JhwvmLXHpyOVHEImrelAbwBrhKAev2WrKzPyx
	5F84n8xUkQof0aTuZZcLa/EjGSHpALeoniB3zyu4VYbmZjt9ijWrIm+2E/xFgJetJq35NGE7zQabO
	FhHlw2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2dn-00000000H44-1lIz;
	Mon, 03 Mar 2025 10:03:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2cD-00000000GpN-2U8u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740996096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XPMg8qYY6woJwUtyf2x+IAiV5yepPU5ZWaNNfhk/IJY=;
	b=WXCZRqyUT53/CF1fJqPmyZX86uwX4JS95QE3alHFKfCZBMx+RAxiF7Qn7fnUrpcP2WIFFE
	acws0BTiMwH87VEkOkBFiC7B+tgfB+K/zsYpfQoSErXz0/i1ccEMThrZyC6X6F+O3IKVdb
	DX3DEmR/YSwcGDAQUNsJlBTdVaWe0xA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-JRvtL1JVMTWRDv0mccojQg-1; Mon, 03 Mar 2025 05:01:28 -0500
X-MC-Unique: JRvtL1JVMTWRDv0mccojQg-1
X-Mimecast-MFC-AGG-ID: JRvtL1JVMTWRDv0mccojQg_1740996087
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390f365274dso1032692f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 02:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996087; x=1741600887;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XPMg8qYY6woJwUtyf2x+IAiV5yepPU5ZWaNNfhk/IJY=;
        b=tbUoMMuD7lzcQbxw+Q8Iv0GKOXzlxVcSOj1DpuZqxK+HZong4fmjhLqDjHhny8c+ry
         p5HYjLjvqdv8yGAY7/LdoacCFOXoI/IeyVAfHj3H0uzOPehMDjR3lqm1wicy+Q8Xgee0
         N71gfafXizKqDoIXOSOvcRrhpobWj0Eaj1f1Jm4sa6lbBXXIbNfhVOypXVI39S41sc8j
         ii7JTbIQSYXirnUPrNLOt1zfm5hvCSuN2SnZY5dVqAxuiU8GITR46BI367RJ6OUpm/R5
         WY/rinJqGlLmoawU3jRNqk34waKQFQufNQhi3JOhChA7S2vP3BYSdXGmSZojo5TfRkXM
         qnKA==
X-Forwarded-Encrypted: i=1; AJvYcCWh53u1nl+oWgqiSCeg8upuBn30YDDKb08Qxu0w1hpCI4N9TuVycPpxRXRbB1lCXuUU1/3I6H/i+sQ1oABS27iW@lists.infradead.org
X-Gm-Message-State: AOJu0YxXGVm6I4ZYkz6f7JrIKclNfVHDf6MREjpVysJ5OVrYSxQTVHP8
	dZAWkDy9N8Mf06qtvzB6uVpuyakIncOzPywf1Sg11YaGDeW5nF3O/KWJ9NQE8dShQbcqR8Hcmq6
	3PJpUsiZ+KRAf5d/1kXnbCC+J/DjYX1bxoXI6OVJc3l2l9KNmInHFN85mdkLGEZkE0bAnZxnY
X-Gm-Gg: ASbGncubgPXOOBRfXW4cTh+KdnE37bufIhCTSsaa1X+vtkqYn2nLcJN/cuBFIoMgwgM
	RTpV6gAB5vKaTyQ8vqBbZNdIGbcMtJjRMilFbxb9H3RbcJ8wpqXxXUBakY8gAUd1QEj/yGugg9j
	hYh34F8b5a9KVygnK5yRbi5TjdZG0PgQ8kiChipeoBqbF/gkPMy5NMCO2lsGypfkn1zUbYnWhd1
	y+7cbtrJ4AKnYxznipol+AdhgWj0V1xgI43r2Y7pVb862fLtzjSVU2437xUT4iMw/nobdYZOJKa
	jgODwY/7euWwVHH1oG+ELySisfsDs/EWN1cC6V4d7UkdMm4q0UALYjDS7csjFr5hYOlRdZMmdJ1
	HDtrAsLUXqmv/dR51RnEoqFfFpWNXhMk+O7N2NxRkcJw=
X-Received: by 2002:a5d:59a2:0:b0:390:ff84:532b with SMTP id ffacd0b85a97d-390ff845589mr3552475f8f.7.1740996087029;
        Mon, 03 Mar 2025 02:01:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXZqIa1M7mGR2dYNXiAZ4lWYbl7hOIdDdeUw6ofOE6vBxI8shgA38Lt8+iwmpijQWMi3sT/g==
X-Received: by 2002:a5d:59a2:0:b0:390:ff84:532b with SMTP id ffacd0b85a97d-390ff845589mr3552443f8f.7.1740996086689;
        Mon, 03 Mar 2025 02:01:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb? (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737043aasm152241565e9.14.2025.03.03.02.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 02:01:25 -0800 (PST)
Message-ID: <78d55e35-6cda-4f5e-8e52-0a54b1e64592@redhat.com>
Date: Mon, 3 Mar 2025 11:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: mm: Populate vmemmap at the page level if not
 section aligned
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>, anshuman.khandual@arm.com,
 catalin.marinas@arm.com
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
 stable@vger.kernel.org
References: <20250219084001.1272445-1-quic_zhenhuah@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250219084001.1272445-1-quic_zhenhuah@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W499eNm18C1NvyNih87GGIwXoHB3kLcJcD3BZvDWdZM_1740996087
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_020137_721456_5459F8EA 
X-CRM114-Status: GOOD (  24.46  )
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

On 19.02.25 09:40, Zhenhua Huang wrote:
> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
> to 27, making one section 128M. The related page struct which vmemmap
> points to is 2M then.
> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
> vmemmap to populate at the PMD section level which was suitable
> initially since hot plug granule is always one section(128M). However,
> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
> existing arm64 assumptions.
> 
> The first problem is that if start or end is not aligned to a section
> boundary, such as when a subsection is hot added, populating the entire
> section is wasteful.
> 
> The next problem is if we hotplug something that spans part of 128 MiB
> section (subsections, let's call it memblock1), and then hotplug something
> that spans another part of a 128 MiB section(subsections, let's call it
> memblock2), and subsequently unplug memblock1, vmemmap_free() will clear
> the entire PMD entry which also supports memblock2 even though memblock2
> is still active.
> 
> Assuming hotplug/unplug sizes are guaranteed to be symmetric. Do the
> fix similar to x86-64: populate to pages levels if start/end is not aligned
> with section boundary.
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
> Hi Catalin and David,
> Following our latest discussion, I've updated the patch for your review.
> I also removed Catalin's review tag since I've made significant modifications.
>   arch/arm64/mm/mmu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b4df5bc5b1b8..de05ccf47f21 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1177,8 +1177,11 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>   		struct vmem_altmap *altmap)
>   {
>   	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
> +	/* [start, end] should be within one section */
> +	WARN_ON(end - start > PAGES_PER_SECTION * sizeof(struct page));
>   
> -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
> +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> +		(end - start < PAGES_PER_SECTION * sizeof(struct page)))

Indentation should be

	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
	    (end - start < PAGES_PER_SECTION * sizeof(struct page)))


Acked-by: David Hildenbrand <david@redhat.com>


Thanks!

-- 
Cheers,

David / dhildenb


