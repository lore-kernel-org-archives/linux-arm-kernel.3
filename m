Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEC6C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heGJaT8pu0zxBpZh0rGBHvZD2Wf0HXTD26JsNXiCq4k=; b=USNRuzjZQQIqHovsI6pFLuhq61
	jlHwAKsin9uhBbgmN023K9rFkUpXCCydJH84vwXvgUkj5CxfmBrhKqFXSKVkMKgJgmKM/PiE+/iB6
	3CfqVcZ78fmQP7qv2oJLKGiaz/8JAdTx7OU5N8icBG2lCGo6jgNoAhwZ2yykdw2O7nj/F//gZozoo
	+i2478DRgx+GcdlcLy+aHTyhHw0o4wIkPjAdzyxiIDzQ9AD5k5g7FC0BhO9si8d21LMlIAWlqNdCT
	HNm4F5k6cPC1wUK+b4jrYkB5mDheUzZ3tI9SyrA4jetJTcUjKamXADeMndOGFfhsndSXp8C8dLF+l
	khV/WA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHM-0000000Dn4A-3hVR;
	Mon, 24 Feb 2025 13:13:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXL2-0000000DduI-2xpj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF6111756;
	Mon, 24 Feb 2025 04:13:48 -0800 (PST)
Received: from [10.1.27.150] (XHFQ2J9959.cambridge.arm.com [10.1.27.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 391C13F6A8;
	Mon, 24 Feb 2025 04:13:27 -0800 (PST)
Message-ID: <e4b5f389-e3c6-48f5-8d13-a4a6f364fd92@arm.com>
Date: Mon, 24 Feb 2025 12:13:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Fixes for hugetlb and vmalloc on arm64
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
 Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <Z7YsqO7ykGgcBFEI@arm.com> <20250221153501.GD20567@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250221153501.GD20567@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_041332_790841_1EE57B43 
X-CRM114-Status: GOOD (  20.41  )
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

On 21/02/2025 15:35, Will Deacon wrote:
> On Wed, Feb 19, 2025 at 07:10:32PM +0000, Catalin Marinas wrote:
>> Will, Ryan,
>>
>> On Mon, Feb 17, 2025 at 02:04:13PM +0000, Ryan Roberts wrote:
>>> This series contains some fixes for hugetlb on arm64, and is split out from v1
>>> of a wider series at [1]. While the last patch is technically targetting core-mm
>>> and is not directly related to arm64, I'd like to to go via the arm64 tree so
>>> that the wider performance improvement series (v2 to be posted shortly) that
>>> depends on this series doesn't have to be robust to the fix not being present.
>>>
>>> I've included maintainers/reviewers for all the arches that are (trivially)
>>> touched due to the API changes, hoping for some ACKs.
>>
>> These fixes look fine to me and I think we should get them in for 6.14.
>> I think Andrew was ok with them going in via the arm64 tree:
>>
>> https://lore.kernel.org/linux-arm-kernel/20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org/
> 
> I think the diffstat looks worse than it really is, as the arch changes
> are reasonably mechanical. I'd like to let it sit in next for a few days
> though, so I'll pick this up once we've resolved my comment on patch #2.

Sounds good to me; if you're happy with my proposal in the patch 2 thread, then
I'll respin.

> 
> Ryan -- did you find all of these issues by inspection, or are you aware
> of anybody hitting them in practice?

All by inspection. So I guess they are not urgent to fix from that perspective.

> 
> Will


