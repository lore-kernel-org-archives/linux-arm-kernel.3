Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7CECA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utCrFA9SyGV3mLz3PcpHz6c/4tyzaXDXayD3hFRPQRM=; b=H/K7IqvjoZJGYim1NXBE+TNQKw
	bHm3jPeoUpBmL5jyZayROorFV/WqNqlKsiqeBy1eG4oY9c6+vhlSVrzFJw4zJlKAe7/6/d0Cfc/dT
	/xjErD9WWLE6VhP5e85E5fbgj61Y0feT+iBv4lY/nFwRUbB/NvbW1kGrjMQlb9zlVBr6h8PqoJA2w
	r8RnGIDtF9LJk/N1iYkdJLC3dU5T4xbqWOzdhv43e+DY6NKbbTbvOgOWxnpY8hpGWUslFFOSjdFSV
	uiP6wHLCyu675W2TkkRD3UniUWm0m5Jg0lJWpSSf9tn7fJFSScy9WlkMFuFmO+CjGQ53spwcgCKJw
	xpDCTkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0NN-000000065gO-0Nkr;
	Fri, 29 Aug 2025 14:46:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw45-00000005Gh4-25Yj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756462236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=utCrFA9SyGV3mLz3PcpHz6c/4tyzaXDXayD3hFRPQRM=;
	b=DlCqGzuxpSUnEC5RbIm7bgsWh8H5Kkgaw8NA8Aklb27ibHHlzz0GsbvTp0IqTKAD5paVIq
	9PyirXekDKNsrT7Zs4X8rFHduUyL6MVYFJ+aWtqO/B86od4Ci/XrErWYgtcT6mbadxU//Y
	mfAxhuj58AjdWgmiqK1B3mRedRTBEAE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-OH0TFWq0Mzu06NbHOu8uQA-1; Fri, 29 Aug 2025 06:10:35 -0400
X-MC-Unique: OH0TFWq0Mzu06NbHOu8uQA-1
X-Mimecast-MFC-AGG-ID: OH0TFWq0Mzu06NbHOu8uQA_1756462234
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3cef6debe96so560557f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 03:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462234; x=1757067034;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utCrFA9SyGV3mLz3PcpHz6c/4tyzaXDXayD3hFRPQRM=;
        b=NmxzAQFvw6d4p8Msq/I7eislnom+gsYHBxH4K+XSaM5KzQYACwt1xR4MzF+Dc1D5Ys
         LThIv8Hhh0tqwOAPUWpJL8Bm+bADPTe2UI+D3X7hZjE4SyFmpw8RK9dKoOnKcC/MFYpe
         NBc6c9+J1p1kjs8x6VHfDeSN+ajNsT8aXX8XbuuT4R85WYaCfolyXjdpklSqTu4Ce+xE
         WFUzXeaGKrW9QseotHAlHyqJO5mQY9W+63ZWP/opF7PAcnzjQkvnCq7TV9qvIld4JF+M
         C1oRQrHsWXsrApQAWY01OIMbCZxhfCTpdtKvs0ANgOn24tdheCvEHOkfXBIV2PvRPrs3
         FBjw==
X-Forwarded-Encrypted: i=1; AJvYcCUCnsCFYwILXR1oD1bK1Ap7y6y2WsEH1Cs8fj/KzqvTqjuJQjScCtQc7Tbn4BeM59l7QAp8xjYAh7r/aC7GoW17@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ZGCAWcLhkXn8LobBNPB7u72f7PLQLN51NJ4nCpTdmpS8yNkM
	dhAVbyFbneEv+AdUSHBi4wOymKXoDqJ/T0MkBIH6kbw66LJ5YgJFaYUqE07ImiVp5leiQM+7tTv
	CCMeYGznLq29WiKQhUkuitpgUO6qjobQwZPkdtSfW19TjFPSw4pS/f4GSfVwrcw60+fDl/FquDQ
	Pi
X-Gm-Gg: ASbGncu4hw1T9l96BdQiPq6G1RbPdXlSTMbjLyc33/eu5Sk/CxfMQ7ITqGt4tdRvn76
	d1/jV5x07yJHrnhwhAS0OqGlL+PUpJD1JcwwAMPyyaEygNlmRa7Xw6L5c7cSR5NztnqLM2xTYTz
	3vF0XseDRm5V/Y4vnAly6gsNNiiRj/aeYGNNO5g1c2C7C+xTMr9PylMR33IUPY3AHTyL4qfbe2W
	u6wAO167Gn9omm0LdlKcdXfOD5E9or3gElgnlSnTX8og/qwI1VD7IonSEemk/U3BYE/x/bUGot0
	YCCURODldVTbBEptIJr+BR5SGNjRDZb9uwHt0vKDcC/4eo4arRt59s5Gn4DX6wkr4F0u07qX/S3
	sti5XxN/8B9gLxEcrItk9VvAhuRiE3ZsWjp5tj56Ur6FTGf2O2XoKtUIPGfddTPEq
X-Received: by 2002:a05:6000:4011:b0:3d0:bec0:6c35 with SMTP id ffacd0b85a97d-3d0bec06f52mr1040113f8f.34.1756462234005;
        Fri, 29 Aug 2025 03:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5N+hXboXv1Pvz2Dg0jTDmYwZsPnkQwUsFPtQ8nUdHm9G3EJc3XR4ExkZX65hTeoyT3mXdJQ==
X-Received: by 2002:a05:6000:4011:b0:3d0:bec0:6c35 with SMTP id ffacd0b85a97d-3d0bec06f52mr1040061f8f.34.1756462233448;
        Fri, 29 Aug 2025 03:10:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854? (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de. [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm31221455e9.12.2025.08.29.03.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 03:10:32 -0700 (PDT)
Message-ID: <a9b2b570-dc81-43dd-b2f3-a82a8de37705@redhat.com>
Date: Fri, 29 Aug 2025 12:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/36] mm: sanity-check maximum folio size in
 folio_set_order()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-11-david@redhat.com>
 <f0c6e9f6-df09-4b10-9338-7bfe4aa46601@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <f0c6e9f6-df09-4b10-9338-7bfe4aa46601@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1J1wmREoe-2RixOC97FehtDFkgyFtZhuL0Hi9dr3bpw_1756462234
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031037_615075_9F12592F 
X-CRM114-Status: GOOD (  17.86  )
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

On 28.08.25 17:00, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:14AM +0200, David Hildenbrand wrote:
>> Let's sanity-check in folio_set_order() whether we would be trying to
>> create a folio with an order that would make it exceed MAX_FOLIO_ORDER.
>>
>> This will enable the check whenever a folio/compound page is initialized
>> through prepare_compound_head() / prepare_compound_page().
> 
> NIT: with CONFIG_DEBUG_VM set :)

Yes, will add that.

> 
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> LGTM (apart from nit below), so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   mm/internal.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 45da9ff5694f6..9b0129531d004 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -755,6 +755,7 @@ static inline void folio_set_order(struct folio *folio, unsigned int order)
>>   {
>>   	if (WARN_ON_ONCE(!order || !folio_test_large(folio)))
>>   		return;
>> +	VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
> 
> Given we have 'full-fat' WARN_ON*()'s above, maybe worth making this one too?

The idea is that if you reach this point here, previous such checks I 
added failed. So this is the safety net, and for that VM_WARN_ON_ONCE() 
is sufficient.

I think we should rather convert the WARN_ON_ONCE to VM_WARN_ON_ONCE() 
at some point, because no sane code should ever trigger that.

-- 
Cheers

David / dhildenb


