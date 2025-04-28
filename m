Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32484C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk38dcNFpb3NyuTUUvlalQvIOAhpTp/gtGWIAYmjz3E=; b=zhUCUfR/fS5GhIHqljKGgWbkhb
	QLNJmuGbcZuzm8mPnm/xPQ1IBHEbWga92rftf/AK1/fEoUDbXK/SKxWc86riD8pMJy1m2fP8JzNhl
	mxK7dC+kTL1B1mpeQoW3dRUFltF/lE7FO3IzH5UdN0IIWMWLH0MvorXDC9WaEndc9LUas6q9MazfJ
	u2OaDkWalp7+nnmduXbzW9vuHQg0KSBLSBwm5ukGRKu2ZLbFcofl7Tc6Fg1vGpCUywsnrgW7PDZe6
	Om3LI7Xe+wYq1PF1hGOYgjeU+RlDS91+3SGXhIbV/zK0Ts7V8beVtGlAfJhwP9FZ9JVlsLG9DaAJt
	yo/7SqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IoF-00000005ECZ-1aQA;
	Mon, 28 Apr 2025 07:21:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ifn-00000005D40-2qez
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745824382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yk38dcNFpb3NyuTUUvlalQvIOAhpTp/gtGWIAYmjz3E=;
	b=ORdrVM0KHpmE4E/n1mJ6yRuRQZske46lgjqkusIdg9AsJqta8rbfMYUQ9AXx8ouLFtSroc
	ZGbcJko481oPHZHfrgzQuGr1pQWC0o0KwXw+wyc718MJbRn0ry2BwE3/p1qEK0yIulvtul
	TSM2Jp1BziRe2a4R19RNmo9W+W+4/LM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-A1tgBQJ1M2epO10ohbItOA-1; Mon, 28 Apr 2025 03:13:00 -0400
X-MC-Unique: A1tgBQJ1M2epO10ohbItOA-1
X-Mimecast-MFC-AGG-ID: A1tgBQJ1M2epO10ohbItOA_1745824379
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39134c762ebso1235576f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 00:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824379; x=1746429179;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yk38dcNFpb3NyuTUUvlalQvIOAhpTp/gtGWIAYmjz3E=;
        b=wYpvuuh5IGSfO02pBZ2MrD5gt7OYeiEZSHZEi0aYmpPtaTaHAvMnGweIL/5JHhveKU
         tNSpR3dpFRwojW5IPzYCSCmDj2769N85ffmlcNmrRiqDuHkrglDc9nPna2kI2aMVtSjB
         v9D0xE5Xa+yBSW19KB4jaqnzbWxaS+dGA5wuNYfn13rZnNpkk4IJ/kOZcQZlcZ5UkDB/
         LwADAlyHzBA7RlY4JFBx1HxNlmQv7USFCH3oFh2+GlPVz913cQaFuBky8iKFYsOlQ869
         VVry5G1tezYbPsf4rY2+A8WSu+VH0G0E7HV8Em00isMKiLJG2trDPKL6QbS5YVUhGlef
         YD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiSEGII5O+18Bo9X5sH7EX7FwYuuVJupXYBSzVWW1zkidb8S68aqKdI/oVyDhrYHm74gDFB6aS+qThO1Qf13kH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Kb8XwOdVjgr6CtAlCBLIPhUWdJkevB924/QZH/W7W5/waRrq
	raJaaZpN9bbTMTwKiHaQt2kO5SiTnxycVjYlWxL66Yqm/kVbuurqdvjnMn9Rk106wQgi/Li5Noo
	gJxIklMKcWAVoRg4ILxgzme2iO1wbRfZhcJ2QlmMA7IP/utElb/w8Z5hHpTmOq3ox9GlX1UdG
X-Gm-Gg: ASbGncsT4Onm4RDOGPTMmgBzA3/SeexEjQIai6fjwSA7Gd8hCjSl/bLZB4ottQQhwjP
	jSQA3ks4kS6LWXEXRSNn/A09tjGVUhvuXqCnmSRooBlTnjwYvgZskC7UH7YdHy5hBN26AScdV8n
	2AKfPQ8NydnFlL53/SXUaEtgD3TF7uxM/pFLkB9lR+pzLQ+uwwzsCvPtIYGSpDqQW1OFKPBu66W
	Kta+dHnZLTJkEP+jTwAW7Q9quHnQYNZHoiCLf2VuLMc4DEErYdGJu9Y3fmqTYpAUXbouEbC1VYm
	CrHBPjRv3YOktUvlwx8ojLRPv/VspXPscxFTXo5d9a70x5TYVnhFKt3djD+6z0QKi86/qrHh0LF
	h3Z86jbBllFlHWueCN3/CP0YEjPuTCXOOs+U4Yyc=
X-Received: by 2002:a05:6000:1889:b0:39c:3107:c503 with SMTP id ffacd0b85a97d-3a074e373ebmr8519592f8f.31.1745824379189;
        Mon, 28 Apr 2025 00:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpSAksKCbJ1VK4JeaLjNhMDHZs48tHAcNCnbpVgtIQST0BGNh5aKTscVsAHj7ABAEjwi32Bw==
X-Received: by 2002:a05:6000:1889:b0:39c:3107:c503 with SMTP id ffacd0b85a97d-3a074e373ebmr8519557f8f.31.1745824378747;
        Mon, 28 Apr 2025 00:12:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c968sm10073483f8f.8.2025.04.28.00.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:12:58 -0700 (PDT)
Message-ID: <84b46ea0-12a1-469f-921e-2d0fd6dacd0d@redhat.com>
Date: Mon, 28 Apr 2025 09:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
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
 <20250423133821.789413-8-dwmw2@infradead.org>
 <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com>
 <91CA8854-2E86-4AF3-BAD0-8C47833F59D4@infradead.org>
 <8fd728cf-bc54-433d-8701-234a67933a97@redhat.com>
 <c15100fcf6781a60b852c4dbb43bdc98a678fcf0.camel@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c15100fcf6781a60b852c4dbb43bdc98a678fcf0.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FJy_7y5p4LE4nDVkIrIf_sp97m4FPcdzQphxJ__Hdm4_1745824379
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_001303_808523_F44DDCC5 
X-CRM114-Status: GOOD (  19.06  )
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

On 26.04.25 01:04, David Woodhouse wrote:
> On Fri, 2025-04-25 at 22:12 +0200, David Hildenbrand wrote:
>>
>> In any case, trying to figure out why Lorenzo ran into an issue ... if
>> it's nit because of the pageblock, maybe something in for_each_valid_pfn
>> with sparsemem is still shaky.
> 
> Yep, I think this was it:
> 
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -2190,10 +2190,10 @@ static inline unsigned long next_valid_pfn(unsigned long pfn, unsigned long end_
>          /*
>           * Either every PFN within the section (or subsection for VMEMMAP) is
>           * valid, or none of them are. So there's no point repeating the check
> -        * for every PFN; only call first_valid_pfn() the first time, and when
> -        * crossing a (sub)section boundary (i.e. !(pfn & ~PFN_VALID_MASK)).
> +        * for every PFN; only call first_valid_pfn() again when crossing a
> +        * (sub)section boundary (i.e. !(pfn & ~PAGE_{SUB,}SECTION_MASK)).
>           */
> -       if (pfn & (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
> +       if (pfn & ~(IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
>                     PAGE_SUBSECTION_MASK : PAGE_SECTION_MASK))


LGTM, although we could make way this easier to understand:

Something like:


unsigned long pfn_mask = PAGE_SECTION_MASK;

if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP)
	pfn_mask = PAGE_SUBSECTION_MASK;

if (pfn & ~pfn_mask)
	...

-- 
Cheers,

David / dhildenb


