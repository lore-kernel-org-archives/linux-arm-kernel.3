Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE00CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/nFDMhWq8V1oJTJ8TEj89R3ylFApbzlPBSZ+h+c35U=; b=j6+sa6uFr6VZMc8rB9QiAfV7OW
	iklclpPYqHAGV+SQulEhJQKeNEbLCJl49eNuMxfC/qE2CjkhGcuOd84o9YkCt0pmmFLcw/CIW4TTA
	TBFn3RGRpUnLDlqsXxb7iJ33E6XMaZbyhBgoMJCoyFsets3f/FHkJny9p48XyLWwtb2VyuUV2Fsu8
	Ms+YYB26NFGRyHCDcxAKktAghBG/Dv0CDMAXrtUlYB+o8LAQBqzCojAX3lN9C3MZqLBeL2wXMLoBt
	7Uy9YaFlXM3gjzsyuGdrfDJj04FxqXQYhpjjFFVqT/pNMSzapruSPru/3wkH+3BTE4LTa8ZteU1+q
	QoN15coQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hx-0000000643k-24Nx;
	Fri, 29 Aug 2025 14:41:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw1P-00000005GBH-3e59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756462071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=R/nFDMhWq8V1oJTJ8TEj89R3ylFApbzlPBSZ+h+c35U=;
	b=EKqynbGJN8N/UBZZpeafhuKxcmp5NhqhQAjTPSb1b2aZYJR03BkRW56KZzY5HZSDlJQhZw
	aIlF8CUhD73Yt4CyoHofgugUnxhX03MogdBfp61FN7bTu38HcZrowFVqC3EVeqGB4BGEaL
	eP6uj2eBu68BzCEI7XqgwmaXlKnoZIQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-G2IHJuHZPGq1PU6rFjbBvQ-1; Fri, 29 Aug 2025 06:07:49 -0400
X-MC-Unique: G2IHJuHZPGq1PU6rFjbBvQ-1
X-Mimecast-MFC-AGG-ID: G2IHJuHZPGq1PU6rFjbBvQ_1756462068
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ce7f782622so647973f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 03:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462068; x=1757066868;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/nFDMhWq8V1oJTJ8TEj89R3ylFApbzlPBSZ+h+c35U=;
        b=ZI0mYZDUeqUPMeBgwuB8gZ8LtJlu60yI1fHPESa6jx1r3RVf1FsLMGkLTHRnE+PLX9
         XqelOLlaHTqALWc3aJhiXeh16hbz3COgUY4S//TCOzeOmQkX9dag//4AXm16UuT1iVqn
         QLNuREY1XZFZOgqMN2bdHUsRrBzVsLQpzMFf9DQZ/wt6vf7Ev015rn7OYyLqOSHraeeu
         cGIbF2a/PGQVO8tg1ItfJ5PRcqv9Pql/bvwkhKA/XiOU1WnmF7N2rLmJHK3QLBkuaZft
         /Ko3X3NuE7DxpMwdI0mynrIWvQYCwzxCLouZoUUSV3tp7ZfHDPbsPTsrbA4Vtl8tjNzx
         lDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJnnBA9GPaQHcuyA2L0z4/nnonQBGkWJIeSwCTUYIltNILdtK0JP6J1MKr8Dp2TSo4GIPgReNbZ2LnuuGOzfPX@lists.infradead.org
X-Gm-Message-State: AOJu0YyYbwzAZ9LV9uvhsTEtVKfEP0yR1Hn7BgyNeLcUZCCOtdOht94h
	xg+IwX199LAOaBST/RoqOcYCahqD3lfGoi7VcTX1WJJZT+67/fqfwHH+6IviyEqg8haVPPUaCn6
	BgNG3ZgS56VX1ZiWExTRIbUQYL7tNpvSTQjHJsljTnesUVztkzLGLlRT3xZJGduSH0T3SzTpKIn
	SG
X-Gm-Gg: ASbGncuRvWZGktSsXsfRnuSVs0uA90qBhP9elzSyAbAkpAKIbZl5s6iTtSAFXIAm5Vq
	qhTa2nVrbgmnJjvJTa4WfwU2PseWcPYAfgrCCXvvekzTem49u18lIJdnHiN9dKtKx4EHAvYtdul
	qlOEDlOOJ1zDZpMPavztAGqLQM0w9RVNloF2f1e7gVakXzSFSNtdhdR3nTyuycmSo8pk6AACyOX
	SWw8dEwC10skCIxGbjrqk293gfdaB1zDYyZ/qti5PhbEUZn3gnEV/zp5u0dux3i3bzt3XF1T9DJ
	3XTPFgn1L81sHQPcc8Fyu2ByJEY0iC70lsvHiFu5kPsxcJl9uzp4cik4hteHdeGN4RH6oM2AUj2
	8DAV1hxBshkrFU2IIfPP9iDwTBvf7sQBo4gHjO/8OgauHhkHT5kqyFtk60FCKJugN
X-Received: by 2002:a05:6000:1786:b0:3ce:bf23:3c15 with SMTP id ffacd0b85a97d-3cebf2345e6mr2871202f8f.26.1756462068042;
        Fri, 29 Aug 2025 03:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbF2u4cnQY/Ogsj0UXNN5LpFf/sHGS9HbsWWK0zqGpfLoa5VGc3wGgA3I8pweyh4XaTKNy7Q==
X-Received: by 2002:a05:6000:1786:b0:3ce:bf23:3c15 with SMTP id ffacd0b85a97d-3cebf2345e6mr2871142f8f.26.1756462067529;
        Fri, 29 Aug 2025 03:07:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854? (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de. [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33add7f2sm2910573f8f.32.2025.08.29.03.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 03:07:47 -0700 (PDT)
Message-ID: <5f6e49fa-4c1c-4ece-ba67-0e140e2685da@redhat.com>
Date: Fri, 29 Aug 2025 12:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/36] mm/hugetlb: check for unreasonable folio sizes
 when registering hstate
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-9-david@redhat.com>
 <fa3425dd-df25-4a0b-a27e-614c81d301c4@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <fa3425dd-df25-4a0b-a27e-614c81d301c4@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8q4glu14BhKfK0JKJnyMpji3Vdi7ocNIIUoS5W0aYB8_1756462068
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_030751_976188_A308F92B 
X-CRM114-Status: GOOD (  11.82  )
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

On 28.08.25 16:45, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:12AM +0200, David Hildenbrand wrote:
>> Let's check that no hstate that corresponds to an unreasonable folio size
>> is registered by an architecture. If we were to succeed registering, we
>> could later try allocating an unsupported gigantic folio size.
>>
>> Further, let's add a BUILD_BUG_ON() for checking that HUGETLB_PAGE_ORDER
>> is sane at build time. As HUGETLB_PAGE_ORDER is dynamic on powerpc, we have
>> to use a BUILD_BUG_ON_INVALID() to make it compile.
>>
>> No existing kernel configuration should be able to trigger this check:
>> either SPARSEMEM without SPARSEMEM_VMEMMAP cannot be configured or
>> gigantic folios will not exceed a memory section (the case on sparse).
> 
> I am guessing it's implicit that MAX_FOLIO_ORDER <= section size?

Yes, we have a build-time bug that somewhere.

-- 
Cheers

David / dhildenb


