Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B01C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTx+g/ICXN+t4dz9YafghFmb5+aFmfAwgPNFgDgkBAM=; b=pttkOU608mSdkwriUA6G45As1z
	gATTGSgX0Ftm3jJ/O49x1kV0Jg1KuUfA2VCxtGtVf++GcIS3qnYu53SmnMP2SLxOVb9Nz7lByrWDR
	KR7YwLfFGUS2EUEgIq4UvAP5wtvhjtzmZGmraqgfUpJVowq3pkMqBCK/i+VaI88i8baT/vjz7JrAt
	XSRAXjbVBNlBkyMYBnvr/KJOPFKmfwTFf+BG+MlYb+rG+KXg62VPbOf56bl7dwl9/cCjTQ0HBt+kn
	tkkqCwVPO3n89jV2FNVBJRayZHfmBEn1FGorA6mUnRFeDf/W7oVlUhBbQa+vd+VtZx6q2MgvAYGKP
	O37trQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdGE-00000005wYI-3H0B;
	Tue, 01 Jul 2025 15:51:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWba9-00000005cyp-1HpP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751378611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RTx+g/ICXN+t4dz9YafghFmb5+aFmfAwgPNFgDgkBAM=;
	b=PUEMtgxGTLz5trVFQ1Ik1Qluwa8WfQD1QashAVwvtRDXesUgBcTJS4PDNeREua2m33GqS1
	r7QzDOufIerw7y7vMbQe5u+MQMr4/d2q87qG6pwAZojXQIrarvX1EsoKgXIZQqPO8Fp5Em
	x3waDU3jhzehiqyxF9izqUN6Q+/lHCc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-RHirkJ_YMuuiUySu5ijL3Q-1; Tue, 01 Jul 2025 10:03:28 -0400
X-MC-Unique: RHirkJ_YMuuiUySu5ijL3Q-1
X-Mimecast-MFC-AGG-ID: RHirkJ_YMuuiUySu5ijL3Q_1751378594
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so2508715f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 07:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751378594; x=1751983394;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RTx+g/ICXN+t4dz9YafghFmb5+aFmfAwgPNFgDgkBAM=;
        b=MUpLqDMgqY6jiRWa3Nn+JJCjl2f5nLXDooxn+j6J6W2sKjYNH9K4AZrTeC62b0CBUJ
         VHzFv4U09Qr63NV7IH1/+CqNSx3x7NwcKjxk9O/pg0hz2cFvXEN1ST33bog26PPA17SK
         A6CADK6jkPU5Rp9qorXiWQDNrnONVWS8H6buIv6WizbDlMuGsw5038ewCyAupbWdWAj5
         4fXdiMJ4Bsd0UP+vGEzrwwKjA3PJrTSfKnFraRos5UuHzW7qcPxZISoxwiMq33Q8z0xD
         ECHAvMBAXvmPzUaU6dw85SllNTXz1dyqEmCuGGvo1amj6Fo6mJI7C54xs1Vj1qKDyWTv
         UJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCWLHztnpY0NjrivKh51SD+LxcGpz+yoTW0iQ3+39X+8qw9yokScTCTSR2PLrJ8Q+5r5qJefr/gJMoc+vFENpnwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPpeRmXngzIHAi9ePskj2G3Pp6NYa5SBD8HyPwUGWGHlGRyGtj
	xaiTjFYZ7j2win+Lrk3ZDROEn0kz2UxkcLcZxMn/5oAYXfQ/9qkMPaAPoGvuW5o7eEO3EFa5mjp
	rF4mJuqJ3srbap0n1JmgecGlBCcNeldimnWSEzoP6QjmFRzAfC8VMYoPQ9e1PYF12btW0cHtpCn
	R9
X-Gm-Gg: ASbGncu9wF+y3/PwPvAtHUFk0XfKlZ2B7YLK3RdrM23+F++OEKi+sb68SPUO5LLY7a4
	4wIpdNd+hA1/DVcmsm/i55dRWUZCueljr7RSfg/QCaA7tl0a6hjRtbkv6a8SkMde/0PAMJLFeD6
	DFZCUFqaUOyDNpwc0308g7sU7b4Rj59nw8w3IGlMIsVvYtzm3NXnbBbeoKGI0IaXiqJwcucm/Fa
	3oe9IsSPlCZwbFy+THsLqeWTgrEO201snzPCVWEEZWDncEwInUNXh9pHmeTOrpc3JzSwqMgHYmY
	//dvyiiBMHRVYcCK9ECPNW1hiH1FqY+eNlwuC/Kr81ziUc96z4Yc6c51IyGg9738VsjeXS9zbir
	sgE77v9MAQeh28lvxrD+ozXTdZk0How2HBnhSL4Igk33mwmz04A==
X-Received: by 2002:adf:b64f:0:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a8ff5201efmr11485718f8f.42.1751378591834;
        Tue, 01 Jul 2025 07:03:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7R3QME11ZBj9+BG46czHqpSceP+vF115DNdQ6LNVtWM1I1Qv3+VwohoaUOVRnSiIQOjQm8w==
X-Received: by 2002:adf:b64f:0:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a8ff5201efmr11485359f8f.42.1751378588233;
        Tue, 01 Jul 2025 07:03:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a87e947431sm13377312f8f.0.2025.07.01.07.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:03:07 -0700 (PDT)
Message-ID: <330f29ee-ba55-4ae6-a695-ddaba58d5cb8@redhat.com>
Date: Tue, 1 Jul 2025 16:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
 21cnbao@gmail.com
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>
References: <20250630011305.23754-1-lance.yang@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250630011305.23754-1-lance.yang@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s84c_U1Ibs47czt3p6-U5NyV20eEGTmObpz49j_1L0w_1751378594
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_070333_408585_22A8EA56 
X-CRM114-Status: GOOD (  14.96  )
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

On 30.06.25 03:13, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> may read past the end of a PTE table when a large folio's PTE mappings
> are not fully contained within a single page table.
> 
> While this scenario might be rare, an issue triggerable from userspace must
> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
> access by refactoring the logic into a new helper, folio_unmap_pte_batch().
> 
> The new helper correctly calculates the safe batch size by capping the scan
> at both the VMA and PMD boundaries. To simplify the code, it also supports
> partial batching (i.e., any number of pages from 1 up to the calculated
> safe maximum), as there is no strong reason to special-case for fully
> mapped folios.
> 
> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
> 
> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
> Cc: <stable@vger.kernel.org>
> Acked-by: Barry Song <baohua@kernel.org>
> Suggested-by: David Hildenbrand <david@redhat.com>

Realized this now: This should probably be a "Reported-by:" with the 
"Closes:" and and a link to my mail.

-- 
Cheers,

David / dhildenb


