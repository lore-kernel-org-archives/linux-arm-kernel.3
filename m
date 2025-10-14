Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B4ACCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2/pl56RibYUoklQ5dQ8O9eQmT//+IdeeagASCrWmlc=; b=jF9PzWz1K6uutNMtUv9/7hGxLl
	0FSkd/MJ7ErMyxAgf9tpbWpl0HVt6SVh3DB1Z9w5MTYiwkU8ZXOAsGZOxZSwag14Hx7XD+YJLpEvO
	1nIuY5gAoiLXOiq7xqG7w8pnHJYhzL2+GsusPnOGqGLm0HQA0SasMVhaSMqEe04MsmVsYpSmOSgjY
	50XwWX0ku2L2crUK1yGT7iTKKhy/HmD7yXunAACZb2UiMdbV2HSQb9lV2MOQcWXkM3oKUjJp3+Bjs
	EwGbvIeWN9/peY0yMAATo4T9CCQ9Nd5rBUqoIG9OmxFNEgUTTOtoFlOIky90ME+/I7Op0PG+/z8nJ
	iPquA/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gAI-0000000Ge7P-3lkQ;
	Tue, 14 Oct 2025 14:38:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gAF-0000000Ge6q-3pGy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760452690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y2/pl56RibYUoklQ5dQ8O9eQmT//+IdeeagASCrWmlc=;
	b=QJc6e7mEPyXNtFxQjuUT5E4g07crNRXjRtun/ehtZy6aaKAJd/5xpHsWaUfrclpNOfd/4o
	jiTo4pJX74pvIObHerlThsUgfIiWzaCkRpugzUr35z8xUJUX6aR/5Xp6uufvoWEp5Fjfav
	RbPpCVSy3Gows+HD/1z1IBSfKfnM/hE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-Z2lcAdxoNBC-mYuB1jlxvw-1; Tue, 14 Oct 2025 10:38:09 -0400
X-MC-Unique: Z2lcAdxoNBC-mYuB1jlxvw-1
X-Mimecast-MFC-AGG-ID: Z2lcAdxoNBC-mYuB1jlxvw_1760452688
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e36f9c651so38721805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760452688; x=1761057488;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2/pl56RibYUoklQ5dQ8O9eQmT//+IdeeagASCrWmlc=;
        b=pcLu3M0Hi9bB7lV7yZu228VtxZPhT8tbArITs8sctQUsWCWwnVCm5553S26snJaRgj
         IlGpiiUt+6jLiyw4KqKO6vKse3Hkao5O8WsmMioblBVe5dVVRrMWd1YRxOzR7h8qi8in
         NjtXCp8FXfZ1QFgEtStHdjeb4ZudrCp+Qco4IOlaj+84MPefLEJaJO0AdvKkSFdslycW
         es2t2zx4EDf2d3BR6rP2QIcMc3yFaKwqcEekFkt6iODEoxyLj40p5+YkUu4QpltIGTJd
         c9RmujKgaVBxAkumW70EiesB/iEo+NaqvvRoEWRRMvqpNULgYkdoXgpqk2Oep+V41I2Y
         u+mg==
X-Forwarded-Encrypted: i=1; AJvYcCVVxjJXiR+8kW6Zp5CMGV2gCnJPOqAutvVJSlSNiSryNe739ql0sqWHZkp127bKJO4ryw/Bwt3R1TvQq9rXez0J@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8zcfFZuoQlwLXaiICmcapFQzt5eBkVXFK+DYtLMNfG64yKZgl
	xxY186hDnTTF929MyiazulFpi1xKOG/EpvRj7GDEaV65SgmQe4Fl+Og009slwJeAM7ElfsJwA/G
	AbXckhXh/88/tBED1tJRzcHyV5f4XSb8Ddci8N83Br/YbYgmEe8mFsV3F0K9iy5c/CtDKBrJH5S
	SW
X-Gm-Gg: ASbGncsakAsWFuGo1i8K4d/DDy7GKJFeMSUd7jpwDRoLlAcI3X2wY5yrVShVNQcgPYj
	LuF+C+FfBOvbuJA1uTc+UzsNdeI+Qf4CNNGaz1yrlfSdooI8WXE/DAFTIlK+roL/6RwqxJwGPct
	cElMlLYjccRtszo19ImYGydiOcNGLgAM8S2TGAad+VGFxhQ6l6hMUfYSPQEnzRcxzdyn1Y00e2w
	3rgUPHNEmsAVdvl0yRQ/ArDIr8BKKFiHcJPdojrQw+1QnrDxGVB30oow35G6C0RfevzhTqhLxTH
	9VfqWRSPyhiP5quOUxOt6zF84iDeT2nFNYaIYADSvO/sJdDwZU9SSnPCAvvm/A3g6yP7VowT0Q=
	=
X-Received: by 2002:a05:600c:c083:b0:46f:b32e:5292 with SMTP id 5b1f17b1804b1-46fb32e5338mr100816105e9.8.1760452687894;
        Tue, 14 Oct 2025 07:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+85bHywL95AGPc4rVVpN4sLObPxyXn+eTRLQq0mKm3kp+YVI++XU9krnHNWQYv6fsnjY3Ng==
X-Received: by 2002:a05:600c:c083:b0:46f:b32e:5292 with SMTP id 5b1f17b1804b1-46fb32e5338mr100815935e9.8.1760452687519;
        Tue, 14 Oct 2025 07:38:07 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4982b25sm246894965e9.7.2025.10.14.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:38:07 -0700 (PDT)
Message-ID: <2861a35d-4f8e-4ee1-bd11-b915580c9ce3@redhat.com>
Date: Tue, 14 Oct 2025 16:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v2 1/2] mm: add spurious fault fixing support for huge
 pmd
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Huang Ying <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Yin Fengwei <fengwei_yin@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-2-ying.huang@linux.alibaba.com>
 <4c453dcc-2837-4f1a-905b-3462270f5e31@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <4c453dcc-2837-4f1a-905b-3462270f5e31@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bGNy45gIXgczCpybpc1mrOrmSaKX9LY8iwojTwj4bAM_1760452688
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_073812_049305_095E708A 
X-CRM114-Status: GOOD (  14.51  )
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


> 
> 		/* Skip spurious TLB flush for retried page fault */
> 		if (vmf->flags & FAULT_FLAG_TRIED)
> 			goto unlock;
> 		/*
> 		 * This is needed only for protection faults but the arch code
> 		 * is not yet telling us if this is a protection fault or not.
> 		 * This still avoids useless tlb flushes for .text page faults
> 		 * with threads.
> 		 */
> 		if (vmf->flags & FAULT_FLAG_WRITE)
> 			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
> 						     vmf->pte);
> 
> 
> So I don't see why it's so egregious to have the equivalent here, or actually
> ideally to abstract the code entirely.

Let's definitely not duplicate such comments whereby one instance will 
end up bitrotting.

When talking about spurious faults I assume the educated reader will 
usually find the right comments -- like you easily did :P

However I agree that ...

> 
> In commit b22cc9a9c7ff ("mm/rmap: convert "enum rmap_level" to "enum
> pgtable_level"") David introduced:
> 
> 	enum pgtable_level {
> 		PGTABLE_LEVEL_PTE = 0,
> 		PGTABLE_LEVEL_PMD,
> 		PGTABLE_LEVEL_PUD,
> 		PGTABLE_LEVEL_P4D,
> 		PGTABLE_LEVEL_PGD,
> 	};
> 
> Which allows for sensible abstraction.

... if there is an easier way to just unify the code and have the 
comments at a central place, even better.

-- 
Cheers

David / dhildenb


