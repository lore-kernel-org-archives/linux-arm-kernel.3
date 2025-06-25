Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02B3C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHGMxWQbZUfx5rxew21QNDJgOEcH1o1jkSM2EH9oDbQ=; b=se1yj6xGN4AKP2YqiHYBdDUYB7
	oV4IOZXVu2+JTI6zcj1M6mpiMAwobWoFynvw4sog0Sl86ptkkv6c0ncFuqzsMqF/wmPYvSaPKrZr1
	jey+yswiuEQyoC+xT2vjFC/5h6oqa4PYltxrpsHOBUBNrvJnHQkvaesaAAf535ZcbbiwiHWY42l2x
	AcWqHH18bie60IczZPtJ7G8gByxWW1dBys7Dv8tvSUf03cnDi6nqfG+Tu7Ukos1K5aChD0vL/xbg8
	Q6tdwEtFQop5GM8O+78jytGjXM/8ABrm+sElgqS8Aa5ZKOl2j7l8NNzg32t+TiICVcQ3DgR7Q1Vs5
	SFTbJawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQw4-00000008vfb-2OrB;
	Wed, 25 Jun 2025 14:17:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNoU-00000008OQy-3cxU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:57:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9837D106F;
	Wed, 25 Jun 2025 03:56:49 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E65E3F58B;
	Wed, 25 Jun 2025 03:57:04 -0700 (PDT)
Message-ID: <94e6bb2c-22b8-4911-a970-d030ec4ac501@arm.com>
Date: Wed, 25 Jun 2025 11:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, Karim Manaouil <kmanaouil.dev@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
 <20250614145021.7yve56wcxf3dlvwg@ed.ac.uk>
 <1c7ba21a-7038-4edf-8734-fdba0c617c52@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <1c7ba21a-7038-4edf-8734-fdba0c617c52@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035710_940956_D584A889 
X-CRM114-Status: GOOD (  14.36  )
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

On 19/06/2025 05:03, Dev Jain wrote:
> 
> On 14/06/25 8:20 pm, Karim Manaouil wrote:
>> On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
>>> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>>>> +        if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
>>>> +            return -EINVAL;
>>> I guess the point here is to assert that the searched range _entirely
>>> spans_ the folio that the higher order leaf page table entry describes.
>>>
>>> I'm guessing this is desired.
>>>
>>> But I'm not sure this should be a warning?
>>>
>>> What if you happen to walk a range that isn't aligned like this?
>> My understandging is that the caller must ensure that addr is
>> pud/pmd/pte-aligned. But, imho, since -EINVAL is returned, I don't think
>> the WARN_ON_ONCE() is needed.
> 
> I don't really have a strong opinion on this. Ryan may be better fitted
> to answer.

IMHO it's a pretty serious programming cock-up if we ever find this situation,
so I'd prefer to emit the warning.

apply_to_page_range() (which we are replacing here) emits WARN_ON_ONCE() if it
arrives at any non-page leaf mappings, which is stronger than what we have here;
it expects only to modify permissions on regions that are pte-mapped. Here we
are relaxing that requirement to only require that the region begin and end on a
leaf mapping boundary, where the leaf can be at any level.

So for now, we still only expect this code to get called for regions that are
fully pte-mapped.

This series is an enabler to allow us to change that in future though. Yang Shi
is working on a series which will ensure that a region that we want to change
permissions for has its start and end on a leaf boundary by dynamically
splitting the leaf mappings as needed (which can be done safely on arm64 when
FEAT_BBM level 2 is supported). This will then open up the door to mapping the
linear map and vmalloc with large leaf mappings by default. But due to the
splitting we ensure never to trigger the warning; if we do, that is a bug.

Thanks,
Ryan


