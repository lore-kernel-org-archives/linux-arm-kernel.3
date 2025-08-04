Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 19:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpzbDczQOWTEz8VKaqJRRztpG2xgJNR5kMd2gtLvEkQ=; b=Xow7XNse54AOKesTjgqrTZ1jXi
	ySyu4f2TWhC7zLeuWHsyPY+QdvB6eitKG4I7rq1wD1btM6N30WL+6wlAFWrVqTMhI4NhVbdNk+j3b
	3RGYbDKqAnAVS20K1U0LS06cgLsRmj5sHpYUC3frIAtRMLRFo2AkiEW32jEoRGjIx3VZkj5k78cxk
	mMxDj4yWom1HHDtFU+w7covQEut3W+laKDmEoLyE+2+Z4iwQwH59YrzoyhaZET/XapPC8D0eXLOIj
	SB4ZBcVsMW7NBPmsiqqorMfLfRbKUrfzO3OzdYmEcmHMMxuk69P3Whx2PopAxb4m910Sdj0WLsBCN
	NygFEjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj0cF-0000000BCV4-3U2x;
	Mon, 04 Aug 2025 19:12:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj0Zi-0000000BCO9-0mfR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 19:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754334621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QpzbDczQOWTEz8VKaqJRRztpG2xgJNR5kMd2gtLvEkQ=;
	b=WvKhWxAqimsr7uLaDJmgJpJflm93NlMEYrArUWax9DnvEsZ3w7LsCHscoeYzX1Pif5W/3W
	ncPyuY1Fx0CzVHAKr0bpxx10Z5mjrDBLQvf96CqR998vAV4itOhigrtOoIq4bpniE3jERL
	hqja9NC84QAc93yal1idMAbtCvsS1w4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-jY65Z_yMN6q_c462J9txoQ-1; Mon, 04 Aug 2025 15:10:18 -0400
X-MC-Unique: jY65Z_yMN6q_c462J9txoQ-1
X-Mimecast-MFC-AGG-ID: jY65Z_yMN6q_c462J9txoQ_1754334616
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-459de8f00cfso3517905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 12:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754334616; x=1754939416;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QpzbDczQOWTEz8VKaqJRRztpG2xgJNR5kMd2gtLvEkQ=;
        b=RVVNf/gT/ZLEPQZXc6fXnxprQJiJfOojpjztYgO0GZzJYybtp36JbHFJO2S8juwnqf
         69IbIMYV8+V5ObJ5ReLPckQwhE1r5LwHCLdyUenlijr8IkUdHW6pRsvrpBgezFEgOZtn
         35/J5IEtojiA+CDvje7sR3+iDIyZDtJ8794e4j/l2Z6keJ7KaupKICOYdFPZQX+YMZY7
         cobr9R83Gits/Xfg4eFZgjZHFdlewmdp6SONwBqhGJOVr48cyE8SFGc19AYwL5U8QkdQ
         P9vGzQk1jhG3eHgjawxvXlUUuytGwPQeLZWp9Ak3jORW6ADkLP7Y4ufqLnvfgJU5K5IV
         WtqA==
X-Forwarded-Encrypted: i=1; AJvYcCUpxL4wSqFFzC4hJr/0KzMySoW9XxDTQWN35SusB/25LsZTlwmoySzFK7DAW7b/leYsjdCq1+0YnMTyh5BWL+TB@lists.infradead.org
X-Gm-Message-State: AOJu0YzOqGEFtPCLyTFM26qKi3ml0txXFLj9pKHTjLqYrBHiPhWDm98k
	7Y08p1aK9h1NkKNUzmPvR7hR+dMtfR66Grb6/BubIKt0nhCznB7QLmE/QCdkAoC3eoFmXSCHu1h
	spa+zcHoYGhu24OxeHSQpXqcWyOsNDK0TfcT3oqGz9cCx/5NChZUIs/GBBM4dmqxW19QOWKzxRy
	eU
X-Gm-Gg: ASbGnctPO9rCFdWB5MEiD+a2Jf21KMKDILKV3at+17FwkGjcwk51y9V3mF0WoXS+0u2
	p9Yb8939aulH63p24yj/91lkN1yQVMY3YLybSRKlJ2FryY0Cnh1GIox57AQf2o2oQK/F0SmnZkL
	6I2xwZ6DHmo8H6lvdloVT+CsxlQYMykGyWUmGEDO41UBQ361BS00DUE+YAMhOIDO2Zqruvjtxbv
	uvI90HFbQI12cJ9wbl2W8NI97kkQSI2rOD+lmaCNsA0U8eCXby/Ou59Nkn7Iru4iJBTAovn5Z21
	OgIdJrxF24bsP0d+RXfr7Ue56Y4t9QW0B6kwLKJYfRuqpz06oNFcU9m/wEtuN2xLXyCd+k9MW5Q
	2/3otJWqsSbNyHiTCGJ2BAZMyaZZe9FaMWMwTDHTe9mdCnZzbPu6ELsyCWbMXyQMrw0c=
X-Received: by 2002:a05:600c:3ba5:b0:459:d616:25c5 with SMTP id 5b1f17b1804b1-459d6162762mr52351895e9.12.1754334616365;
        Mon, 04 Aug 2025 12:10:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqKOc0puZuFe2BKSfXuUO51+TKPaxeerEzpJWBflJeShfRYpvNjoQBexxKd7V/4fPDOXF5Ng==
X-Received: by 2002:a05:600c:3ba5:b0:459:d616:25c5 with SMTP id 5b1f17b1804b1-459d6162762mr52351565e9.12.1754334615920;
        Mon, 04 Aug 2025 12:10:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0e:2c00:d6bb:8859:fbbc:b8a9? (p200300d82f0e2c00d6bb8859fbbcb8a9.dip0.t-ipconnect.de. [2003:d8:2f0e:2c00:d6bb:8859:fbbc:b8a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ececdsm45294775e9.1.2025.08.04.12.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 12:10:15 -0700 (PDT)
Message-ID: <5bf65002-8d2f-4b9b-8f22-3ba69124335c@redhat.com>
Date: Mon, 4 Aug 2025 21:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: Zi Yan <ziy@nvidia.com>
Cc: Juan Yescas <jyescas@google.com>, akash.tyagi@mediatek.com,
 Andrew Morton <akpm@linux-foundation.org>,
 angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org,
 Brendan Jackman <jackmanb@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com,
 Michal Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, wsd_upstream@mediatek.com,
 Kalesh Singh <kaleshsingh@google.com>, "T.J. Mercier"
 <tjmercier@google.com>, Isaac Manjarres <isaacmanjarres@google.com>
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
 <8A3D2D44-DCE9-48FC-A684-C43006B3912F@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <8A3D2D44-DCE9-48FC-A684-C43006B3912F@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QY9TrStLfUaaN_uJajcFBI9qKm5PDogqroG8W2lG1tM_1754334616
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_121022_314260_3D098BAC 
X-CRM114-Status: GOOD (  18.88  )
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

On 04.08.25 21:00, Zi Yan wrote:
> On 4 Aug 2025, at 14:49, David Hildenbrand wrote:
> 
>> On 04.08.25 20:20, Juan Yescas wrote:
>>> Hi David/Zi,
>>>
>>> Is there any reason why the MIGRATE_CMA pages are not in the PCP lists?
>>>
>>> There are many devices that need fast allocation of MIGRATE_CMA pages,
>>> and they have to get them from the buddy allocator, which is a bit
>>> slower in comparison to the PCP lists.
>>>
>>> We also have cases where the MIGRATE_CMA memory requirements are big.
>>> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 500MiBs.
>>> These cases would benefit if we have THPs for CMAs.
>>>
>>> Could we add the support for MIGRATE_CMA pages on the PCP and THP lists?
>>
>> Remember how CMA memory is used:
>>
>> The owner allocates it through cma_alloc() and friends, where the CMA allocator will try allocating *specific physical memory regions* using alloc_contig_range(). It doesn't just go ahead and pick a random CMA page from the buddy (or PCP) lists. Doesn't work (just imagine having different CMA areas etc).
> 
> Yeah, unless some code is relying on gfp_to_alloc_flags_cma() to get ALLOC_CMA
> to try to get CMA pages from buddy.

Right, but that's just for internal purposes IIUC, to grab pages from 
the CMA lists when serving movable allocations.

> 
>>
>> Anybody else is free to use CMA pages for MOVABLE allocations. So we treat them as being MOVABLE on the PCP.
>>
>> Having a separate CMA PCP list doesn't solve or speedup anything, really.
> 
> It can be slower when small CMA pages are on PCP lists and large CMA pages
> cannot be allocated, one needs to drain PCP lists. This assumes the code is
> trying to get CMA pages from buddy, which is not how CMA memory is designed
> to be used like David mentioned above.

Right. And alloc_contig_range_noprof() already does a 
drain_all_pages(cc.zone).

-- 
Cheers,

David / dhildenb


