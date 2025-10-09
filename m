Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED80BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 07:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+XtmwdKc8QKMPTZ9xcrxbfmEnkdKPymPLn6kJMJIBg=; b=TsYx52G87IUt8IjNQoXiFtwoG8
	yx30m7kArNw8tvHx3QBPv6Kbv/qfMfcnV9RCRZLWKnboMQHYE17bVmnHIogBThverbcB6x44OETZb
	WXLVK2BHurth1dZKMrhCMJpT8fJZ3ixZZfsaDpS5ULKM/U6VUoxRuOETs80dOVMGmeAx6IpeE7KPZ
	r8hcFaWLWNYGd3vhtPVGT1FuNdr6r6dngSn7Cg9VrwCNWinwo8/WbPgIykCdH47LGnIxDFdEdMV/q
	1J5dP+DWeqfzB1nPioKXH1HxFRszKwB88zkOpBalli+Hlryv1OJ4YjWvPjXY6bMyNKN99wBkxujRo
	hTn3wKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lQ5-00000005P08-3DN8;
	Thu, 09 Oct 2025 07:50:37 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lQ3-00000005OzU-385m;
	Thu, 09 Oct 2025 07:50:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj22T4GVLz9sSy;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-hrpkSiMM5A; Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj22T2bCVz9sSq;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E1858B768;
	Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iEsvyTlwygx4; Thu,  9 Oct 2025 09:44:33 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4940A8B767;
	Thu,  9 Oct 2025 09:44:31 +0200 (CEST)
Message-ID: <1fb2259f-65e1-4cd0-ae70-b355843970e4@csgroup.eu>
Date: Thu, 9 Oct 2025 09:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (bisected) [PATCH v2 08/37] mm/hugetlb: check for unreasonable
 folio sizes when registering hstate
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
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
 wireguard@lists.zx2c4.com, x86@kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-9-david@redhat.com>
 <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
 <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_005035_951513_E6E81DCD 
X-CRM114-Status: GOOD (  10.00  )
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



Le 09/10/2025 à 09:22, David Hildenbrand a écrit :
> On 09.10.25 09:14, Christophe Leroy wrote:
>> Hi David,
>>
>> Le 01/09/2025 à 17:03, David Hildenbrand a écrit :
>>> Let's check that no hstate that corresponds to an unreasonable folio 
>>> size
>>> is registered by an architecture. If we were to succeed registering, we
>>> could later try allocating an unsupported gigantic folio size.
>>>
>>> Further, let's add a BUILD_BUG_ON() for checking that HUGETLB_PAGE_ORDER
>>> is sane at build time. As HUGETLB_PAGE_ORDER is dynamic on powerpc, 
>>> we have
>>> to use a BUILD_BUG_ON_INVALID() to make it compile.
>>>
>>> No existing kernel configuration should be able to trigger this check:
>>> either SPARSEMEM without SPARSEMEM_VMEMMAP cannot be configured or
>>> gigantic folios will not exceed a memory section (the case on sparse).
>>>
>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> I get following warning on powerpc with linus tree, bisected to commit
>> 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes when
>> registering hstate")
> 
> Do you have the kernel config around? Is it 32bit?
> 
> That would be helpful.

That's corenet64_smp_defconfig

Boot on QEMU with:

	qemu-system-ppc64 -smp 2 -nographic -M ppce500 -cpu e5500 -m 1G



Christophe

