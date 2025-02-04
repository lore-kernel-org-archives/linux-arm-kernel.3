Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3126BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAf6I6x8Ixyhwl4g5QnQwYXZIRw06z5WdjsdkIZQ9pE=; b=eNBMdrG8VgmXpcVfgdR2dS+Dfl
	DyWv8z0xkmUJLtMFSdvIRBttf964OUS5lwQRDwTVaSG/wpqNoZrCG6eWaWukHHppmUjnnvJ3eECiv
	M0MQdlGy/7TB4Bdn2WrI4bJLIiHlTX99hk0vSibAnypezFEAuSeGw2cy6RUUlADLnEIxiHChN02Xe
	nkIOm0efV7WK3oad2UwLJ+k2rtTKfKRqlMrD0ve+gwwMa1Jcot1NWX8Vbws1ssgRXQzdpHVp/1DuC
	xzaJRa3UDosPkjub8Tw0XtE00gXGX8V/1PvQ8uGeNwH1/j+CrxEfQeLx5dClhgrsvH35jbHnfK+k/
	x8rE6gCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHHf-00000000IXZ-3iI6;
	Tue, 04 Feb 2025 11:40:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHGL-00000000IJk-1lKr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738669120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dAf6I6x8Ixyhwl4g5QnQwYXZIRw06z5WdjsdkIZQ9pE=;
	b=SS65qDpNZJQneShSL4JIeIERZlo8hL79p0LlVJtejAAdHLgnDW6YfOybZgZMShcDOcuHKb
	SFpksMskmKqsv4UvZ1qIseuHi3IfiJFahg3hBzID7qjPwJmCrA1LkRi1FEK6DZVQCOSFnL
	lL2C6Z9powAqZec74Nh2CM/VAKu4Pnc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-nNGCWKGjNtmzP9Ko5jU8fQ-1; Tue, 04 Feb 2025 06:38:36 -0500
X-MC-Unique: nNGCWKGjNtmzP9Ko5jU8fQ-1
X-Mimecast-MFC-AGG-ID: nNGCWKGjNtmzP9Ko5jU8fQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4362f893bfaso1439675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 03:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669115; x=1739273915;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dAf6I6x8Ixyhwl4g5QnQwYXZIRw06z5WdjsdkIZQ9pE=;
        b=eM6Kcv6JIl2VPtF3i2KmPEu7UBCwosTU796kxhmlyNbaSPCsRB0GC77CeohnU4pNlm
         Dn5mbEU3TiVujLrpe99nZoN0uNv3Eph7/LLzjHnboxlokEs3pW5MHuoG4Ndx+aHeAFyW
         sBy4WyHlGxZuq75VPv7nCIETNIWmkzf7CdSYsWPlT1i2/DcCwsuYJEvLHtHaoDdfSUpX
         PZCfdEdwFTXHb86iKf6UWV8Vbk2BUoSsgyIYsarjY8yJRLskH8ejzNPhslzGiptBCOqV
         Y1wXZLQx/f8Bnphvs33fokNb9tNbK35gH2CSt1NfBeaB3qhA4whWolAScBWibX6gLE3j
         3fQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl1J2k7ifSNY4kxUnh7u55+DHDyvJMTwtM1vhxtTA0sO6WEC22PgkesaBURoRLH291JX0ir6wavIJ3E0KrDOxh@lists.infradead.org
X-Gm-Message-State: AOJu0YxukofB2e7k1eFANT7Jg7fFPJZEXSisQyEgBiyBdTgKYDLnoWpa
	fzcG040/ROMRZ9XJi3viN1sd0YfVLGBuk6O2dCfHEEQmYJiQ+S9RmuB5aZgTdx6VworK0uQggyY
	sHw6iSS5Q4+yhE2Lmtg0DrCU5adQyxznEZDT9WvSholfdSmkLv53RcmfrNyKigkYpUQorwPnn
X-Gm-Gg: ASbGnctZ0qvBN88lndDqLhRHKS7PKwyeYh7+T2slQkNllTiWtn+mkzZ5HzvN6GvK725
	8OalZn3rDqrZMWJEe+bXE0A5GnmcVwUOm9Y73AtNWxUMmfSUHM4jXrfwK83hAP+AiP/0vXn/vWr
	CDGQ97Ry58P55sjOjXjqDF9ujgeVOoXP5h5u61XwssIHd34oX7d4uYAq//B2iKujXh2fWcIFZF4
	OdaEbMuFG2aao0Xqf6v3ea3p+0950+54fgHm1ioNmhBFo6lQplXs/Geuh4xj++3gTIfATdjXlgk
	t4cqnusGkAW/Drr8ttDFRoHa/EtqKfQokB2ZFR0Wwfi1jnZiZ5ptstLyZZEa4uxOzVa8UhOKtzQ
	u6jFJ2h25g87MU9YLKEH1m9ne8Yg=
X-Received: by 2002:a5d:64e6:0:b0:38d:ae2b:8374 with SMTP id ffacd0b85a97d-38dae2b8a1amr977187f8f.52.1738669115328;
        Tue, 04 Feb 2025 03:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVHbCkqlzOrzhIL5tsJnUc5CY0X5I+EABZF7WUoOmHjZ083H4rwma8rlO41Xl3jBripWoeMA==
X-Received: by 2002:a5d:64e6:0:b0:38d:ae2b:8374 with SMTP id ffacd0b85a97d-38dae2b8a1amr977163f8f.52.1738669114978;
        Tue, 04 Feb 2025 03:38:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa2fsm15861718f8f.91.2025.02.04.03.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 03:38:33 -0800 (PST)
Message-ID: <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
Date: Tue, 4 Feb 2025 12:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250115033808.40641-1-21cnbao@gmail.com>
 <20250115033808.40641-4-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250115033808.40641-4-21cnbao@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k6Fw28TzMmS9_F2gzZIosyYVqYTOitNG8tfJl9ceRfA_1738669115
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_033841_526103_22DF2F21 
X-CRM114-Status: GOOD (  12.17  )
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

Hi,

>   	unsigned long hsz = 0;
>   
> @@ -1780,6 +1800,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   				hugetlb_vma_unlock_write(vma);
>   			}
>   			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> +		} else if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> +				can_batch_unmap_folio_ptes(address, folio, pvmw.pte)) {
> +			nr_pages = folio_nr_pages(folio);
> +			flush_cache_range(vma, range.start, range.end);
> +			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
> +			if (should_defer_flush(mm, flags))
> +				set_tlb_ubc_flush_pending(mm, pteval, address,
> +					address + folio_size(folio));
> +			else
> +				flush_tlb_range(vma, range.start, range.end);
>   		} else {

I have some fixes [1] that will collide with this series. I'm currently 
preparing a v2, and am not 100% sure when the fixes will get queued+merged.

I'll base them against mm-stable for now, and send them out based on 
that, to avoid the conflicts here (should all be fairly easy to resolve 
from a quick glimpse).

So we might have to refresh this series here if the fixes go in first.

[1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com

-- 
Cheers,

David / dhildenb


