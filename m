Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740AEC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UHlymsuGJ3Sl8WG5Aq3yhutdRMJDhj2uirfH8/AuPM=; b=aWJdXMTF1Snp7RAnIpHJQkPqqL
	tw/nlECp3cIbcvRn3H0UEX20L8VU8linST2sJ1bq88SJ6SykBzfdOIwB1mS8Pt1MwTb+j/Bs7M/PH
	/R9N4/KtaWKjhKCFzaD/g8+YK9J3cOAUx216Wm/ZtfZ2m6TY5tneRFPj8M5Nd48qUPWf27deJ/kvf
	b2Bm6RJR5N5kbDHZDYAVwQm7YAHq43XcBic771Fp5Q2cp0LhDSrMIHcKHsv4n3P7Y0NVe8jXZSoAN
	5ClCLMQ6s6sjO/9UVJg1Ec4SYQUAmU/LMGB2k2W1xCTC08kYd5lQmBFSKoc9PKXxWKAv5jTJTObxD
	EvyrFMXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IcZ-00000005CVG-1zu8;
	Mon, 28 Apr 2025 07:09:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ia3-00000005BvY-2d6n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745824025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3UHlymsuGJ3Sl8WG5Aq3yhutdRMJDhj2uirfH8/AuPM=;
	b=ExWBBHACq/Vnd3bGuTgWZPHw656SQSE/E9w0CLXGy9LZpSqcI1Ijgoi/is/R+sxKzClpLD
	yy5ipUimXQOjsIaCnPvS88yYO03o/p5/eyj7IRdo6bJ864fVm9l+suPtLN+2a2s0nGcBZK
	dUjcLSAKl1CfuFrTNGuHQ9+cEjhuJ28=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-nZmGZr2eN-SqUZJYHSZLNA-1; Mon, 28 Apr 2025 03:07:03 -0400
X-MC-Unique: nZmGZr2eN-SqUZJYHSZLNA-1
X-Mimecast-MFC-AGG-ID: nZmGZr2eN-SqUZJYHSZLNA_1745824021
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so29446175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 00:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824021; x=1746428821;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3UHlymsuGJ3Sl8WG5Aq3yhutdRMJDhj2uirfH8/AuPM=;
        b=f6ccfBYB0UB8Mw8qynmLqB5P5ZS4Kx/kIf5sP7fqJ84wqA0zq4JAhDtrX79IIQ50og
         sQ2WYKp2UrErGapbWPckspVfJJ3aG28s2HfqPvtVXYEp4p7t7lyVcv6CDKLWhuPgVYPD
         XYaNHgRaLLj/xeQYGMpP2B/9OehGFVHbtwYpaWPWzoWyOcSe7qM6W4c9T/LvAl62peXz
         wuOxHT9m4QaKvgepc1s1gx/kAUAtp6XQ3BSPqK60z/aguiRUrMjqQsrBxpvRj6ENiHgh
         Ep39GgWDt8c8OHZctz4OYi4NwEJgLMCtuoh240WJVrwZFw7Gw2bLoQQJHZYysm1fqbSG
         M78A==
X-Forwarded-Encrypted: i=1; AJvYcCVF/WPOF4jOLuQg4xdjtUehdIxaYTlxSNBm4+De9nJlffx2kLmZ/qBd96Bk0sn+X31LS5GRBNSdcwIZxb6zB0m9@lists.infradead.org
X-Gm-Message-State: AOJu0YwDDjbAniltSm9t589JB5AcQqb1KMpPX0jMkRl5SrHqxYLFcLb8
	HfBuYwKzEfZmVaR8frFPSAC9jGXI14xlKrWjfZL4TgiKrGEV251DAL+Y5zlVvphvEeci5Ujorr3
	AQZPLJd1R3RCfAr1rp3lWIM3KMjA0xXyxVEGQEVcZ78Rt0HYz+AlFLBtgF+muek+dQPUhxRzF
X-Gm-Gg: ASbGnct5VrG1kQhkEmUZOxdIAoRgMJw0aETJeuS7udr7fChR6MjhLnq6vJPRTGNHJH6
	58sgfQGIfpj1VKenJ5yCreFuixhtIo7M97ubSQxce3tnUchy184bxQ0rZJ8/3Ujh06wGaHGZQxp
	zOP2tTfEzhIidmBlmnxiyaHpoOQicKRb4ozhZbZg9Bu5yMzGE69uQinknRmuvQFEojy/Jj8XAfZ
	PgjgaiaHzvlYqqDcglk/fUq4L1M19O0y3tivqj/qqqECm4rRGBfD3CSoX9dOEGGpiUYa797wfQE
	SAQL+XLKoPDLBbOb2io4vkJyRWlPO5LK7CK8TeIVTIeNPGqjp250kWVIFoJ6Zed3MhYekA/3RWe
	DN+Ucfr9BvieX8vPrZFpGTakGOWmaItvLd5+iJmU=
X-Received: by 2002:a05:600c:34ca:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-440a66aaf1bmr84021915e9.24.1745824020825;
        Mon, 28 Apr 2025 00:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5vI+QUcSRxc3VofS2FREQCSTlw1QzEVbQsEVMMtzbDu9hLqKcCFkP0GlDjwtwlzDGi/rqKg==
X-Received: by 2002:a05:600c:34ca:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-440a66aaf1bmr84021655e9.24.1745824020445;
        Mon, 28 Apr 2025 00:07:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1ddsm115057995e9.30.2025.04.28.00.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:06:59 -0700 (PDT)
Message-ID: <e3e33130-35ab-499b-b86f-f0c2b3121cf2@redhat.com>
Date: Mon, 28 Apr 2025 09:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] mm: Introduce for_each_valid_pfn() and use it from
 reserve_bootmem_region()
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
 <20250423133821.789413-2-dwmw2@infradead.org>
 <0eae5cc8-5714-44dc-97b4-e1b991c0e918@redhat.com>
 <d828f037583bf1a4380fd02b1156befa11128d89.camel@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d828f037583bf1a4380fd02b1156befa11128d89.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bLwfYAEC6jeDBZaTYQfTo70FRRdPXtqfZWHxeIWhSyA_1745824021
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_000707_747010_763493BF 
X-CRM114-Status: GOOD (  13.29  )
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

On 26.04.25 00:01, David Woodhouse wrote:
> On Thu, 2025-04-24 at 23:11 +0200, David Hildenbrand wrote:
>>
>>> +	unsigned long pfn;
>>>     
>>> -	for (; start_pfn < end_pfn; start_pfn++) {
>>> -		if (pfn_valid(start_pfn)) {
>>> -			struct page *page = pfn_to_page(start_pfn);
>>> +	for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {
>>
>>                             ^ space should be removed
> 
> 
> I was treating for_each_foobar() like for(), which always *does* have
> the space before the parentheses. But a quick grep shows that that's
> the minority, by at least two orders of magnitude. Fixing it locally;
> thanks.

Yeah, it's frowned upon. Note that checkpatch will properly complain:

WARNING: space prohibited between function name and open parenthesis '('
#70: FILE: mm/mm_init.c:782:
+       for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {


-- 
Cheers,

David / dhildenb


