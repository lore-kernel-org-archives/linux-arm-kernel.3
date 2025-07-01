Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6ECC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVB9kTjPjsCcDiQ3MDFZvRa2zhNJTySbnw345PI712g=; b=cPZ0zUUhZlb43FsuMRGCZu9duF
	b7w+yCJOkgUpYR0PtYJoReT7it2GS2qdbN7mar088anISWq0fN2Kvl5WP8nUpwbNF7SlFNug9HzaK
	Ieu/miW0mM78D1Z16fT3fPmVUbOcLtJ5RxPJbTPu89svP4bMPoRISx/mevoJAsptZS7mjUXD2FTsF
	bChx2sVAIzZohjLGZVQZTQCo+vD9U8WUrN4k55SwceU9udOozzZXX5Ih5jOigE4oANc7in9MsL/o9
	shvaUg1vwoL4Y6MRb5EXeoPaEeNw8lCeZsW9a7JHXNRTfjgYff3chukJ27n5JvaEPWEtqI83oYt7i
	4szYpoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDO-00000006PAd-01DA;
	Tue, 01 Jul 2025 19:00:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdfj-000000060Me-2Lfa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751386646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lVB9kTjPjsCcDiQ3MDFZvRa2zhNJTySbnw345PI712g=;
	b=giIn2jrWUJgZWy2P1HNTqozeUN1fpJv4iOn8u/WRaEx7r6p34I1JPQ76U1VLAfi1al+eJc
	0sudPIGCwAuA0Pzon8sXq60TlVhXa6F5oXIZzrz8sg8UOlGLQgUOZ3tz4jw1Ta9gIzj6L1
	mgkHP2ajdcXFi5zGooTLVhHzUNjCtI0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-Rjk_AqzsMTmhSnjRYxnd3A-1; Tue, 01 Jul 2025 12:17:25 -0400
X-MC-Unique: Rjk_AqzsMTmhSnjRYxnd3A-1
X-Mimecast-MFC-AGG-ID: Rjk_AqzsMTmhSnjRYxnd3A_1751386644
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4538f375e86so31703195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 09:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386644; x=1751991444;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lVB9kTjPjsCcDiQ3MDFZvRa2zhNJTySbnw345PI712g=;
        b=sUP53+NCcZMsQW9CkfeRp8ZebsSLA9aAy3pvsAREitCxKFwK2NK209P6XQcweDaisX
         TvSw9m8AGV9GiPlKLMZwwh9nGqLI90u2tAvmRLvGWf+X6bV1TPOU2go1UV1p4ixwrh7L
         x98JXD47wDim/kLMo8U+128CoPWL8+ifstTLDm6QymmaUHIfL74nB/forTz224GOQnR5
         ECYospj1gG37pwk/tYdo7WCmf/D93f/N7B4gHC2cpNhJ8qKQqb58c3ZLN37WsIga2G1n
         zLoL50/Cs6F+Y6gqRziYjHysmQCEcG95XuZ3E1Y3y2l9vLEo/IhmlRIcb48RvmUXZDBU
         vvfg==
X-Forwarded-Encrypted: i=1; AJvYcCWYnAvxlaqCFDe1J3wawrQ+sFPEHbqOpM438u+NQSfhy5losM4XT7Y0ZHS0lf2mAiqub3CBG8K2XJZ9gv/Ou8sh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9kPFBtC+yQROdqVdBWl1yowBQi9Y4gtHeAI2OcBGWwkLAycba
	0qo6XbeRWz1C9O0lHgud57x3x6IWc8FqsZ+AfcRd8nIA4TQmzRb2Iq+BYGw1MrNQ00iTFcelEzd
	2ETeD6ROm5pCaR/vMZ8uwIoq16s/jcKYcdBIMAO5p4OoAFSKXHT/+qVZQGGylbblKtk6SE3eFIi
	ep
X-Gm-Gg: ASbGncs5wC8CnyffB8q6sQMcyS4r29njTmZmH61nSODL8vl1jQVqOy9+wkIIJhYsBuq
	apSxDOXhn+b2DHcB9NgEGw9VV4l8jKnBkrq2MSEIv8FV0JUiPj5GiEH/fs14fq6UXq47EVz0JVW
	5JRvvtYisAGKapq6gR8txqQV1bTJKcZzMbLPP9nWd3fBNsjHNK+cJTzie1a6gA30YplZJlr/IID
	S1EKQ1z6X7TkT4KU6phcIZXvGZ5Ituoh6zD16QAWsP2hjBTwOPwsyhbPSaKfZ4O6jWT9/+O+i0z
	ghdw+Jyv2d2pOqErDNBsENOaDXVOGwRQf6VHYHboBeMQLj764YcWnKEW5pTibm4rlMqyrnAALUc
	mxsOMQ9Uvr1j1w428Sl6A3/5rO6wr7/Cm9KZfhq4tpNY0LF6Z7Q==
X-Received: by 2002:a05:600c:a48:b0:453:58e8:a445 with SMTP id 5b1f17b1804b1-45396a94e32mr124259345e9.11.1751386643607;
        Tue, 01 Jul 2025 09:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvGN3FklTl4ux1tT9v67V+eF7W0w2RvDhr+maKyotoG8OCwBMycQHzwIksow9IVBXZa7R8rg==
X-Received: by 2002:a05:600c:a48:b0:453:58e8:a445 with SMTP id 5b1f17b1804b1-45396a94e32mr124259065e9.11.1751386643178;
        Tue, 01 Jul 2025 09:17:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e598d2sm13581910f8f.76.2025.07.01.09.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:17:22 -0700 (PDT)
Message-ID: <05f3517a-754e-40e3-a0e1-bc654f6ed3c9@redhat.com>
Date: Tue, 1 Jul 2025 18:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Harry Yoo <harry.yoo@oracle.com>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250214093015.51024-1-21cnbao@gmail.com>
 <20250214093015.51024-4-21cnbao@gmail.com> <aGOyhvR-GaUYgLwQ@hyeyoo>
 <aGPiQq4cIPDt-Ue-@hyeyoo>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGPiQq4cIPDt-Ue-@hyeyoo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DBDFVHlnK2lUQG4VohJRIUEPtw3nMfBPfSUZDQyLI1c_1751386644
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_091727_680627_5F3ADB83 
X-CRM114-Status: GOOD (  11.36  )
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


>>> +			/* Nuke the page table entry. */
>>> +			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
>>> +			/*
>>> +			 * We clear the PTE but do not flush so potentially
>>> +			 * a remote CPU could still be writing to the folio.
>>> +			 * If the entry was previously clean then the
>>> +			 * architecture must guarantee that a clear->dirty
>>> +			 * transition on a cached TLB entry is written through
>>> +			 * and traps if the PTE is unmapped.
>>> +			 */
>>> +			if (should_defer_flush(mm, flags))
>>> +				set_tlb_ubc_flush_pending(mm, pteval, address, end_addr);
>>
>> When the first pte of a PTE-mapped THP has _PAGE_PROTNONE bit set
>> (by NUMA balancing), can set_tlb_ubc_flush_pending() mistakenly think that
>> it doesn't need to flush the whole range, although some ptes in the range
>> doesn't have _PAGE_PROTNONE bit set?
> 
> No, then folio_pte_batch() should have returned nr < folio_nr_pages(folio).

Right, folio_pte_batch() does currently not batch across PTEs that 
differ in pte_protnone().

-- 
Cheers,

David / dhildenb


