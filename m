Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FE1C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7LpNHnJQKnpbcCKx4tRkiCp2RK7r/SykfSI2xLMzv0=; b=hlmOUHJJ2wgVfEr+ztxgyc9WMx
	vpsZUvN9/9CSSKy5Lj/s3K7+4o3WwI5FDbhjz1SIJAG1H/PtGfwIXOwxL/z3XoLjCksZPYJjHzWLX
	wC/QcHSdckTtmoRy8VYTK6xohdhoSBcJYqvLNZGqN6qhr8xp0iUrHtNKM6E8gibDuNrdvy9YTkMLj
	HBCL6Jixc9WliDX1UeGavp5itZKdCzAy0QMTzsmTW238h6Q3LXvK9zwU6Otp1WeZobgVaWMhK82ag
	wst5xaQTjPPhN4D1mJb2e2sgOq2yxksV+bnMhViHZ6Bmt0fKqOEDvHMr+euA4jwHY0OxYbeHntghB
	x1ci/11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txncV-0000000B7Zm-32v3;
	Thu, 27 Mar 2025 13:50:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnZC-0000000B771-3NnC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:46:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40BA91063;
	Thu, 27 Mar 2025 06:46:47 -0700 (PDT)
Received: from [10.57.86.146] (unknown [10.57.86.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D86D3F63F;
	Thu, 27 Mar 2025 06:46:37 -0700 (PDT)
Message-ID: <5582c321-9297-4d92-9e1f-497afa17f8be@arm.com>
Date: Thu, 27 Mar 2025 09:46:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] Perf improvements for hugetlb and vmalloc on
 arm64
Content-Language: en-GB
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <Z-VBgcl9LJGlEzy2@pc636>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z-VBgcl9LJGlEzy2@pc636>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_064642_907924_80D37F3F 
X-CRM114-Status: GOOD (  13.84  )
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

On 27/03/2025 08:16, Uladzislau Rezki wrote:
> On Tue, Mar 04, 2025 at 03:04:30PM +0000, Ryan Roberts wrote:
>> Hi All,
>>
>> This is v3 of a series to improve performance for hugetlb and vmalloc on arm64.
>> Although some of these patches are core-mm, advice from Andrew was to go via the
>> arm64 tree. Hopefully I can get some ACKs from mm folks.
>>
>> The 2 key performance improvements are 1) enabling the use of contpte-mapped
>> blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
>> were already hooks for this (used by powerpc) but they required some tidying and
>> extending for arm64. And 2) batching up barriers when modifying the vmalloc
>> address space for upto 30% reduction in time taken in vmalloc().
>>
>> vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
>> Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
>> test was repeated 10 times.
>>
> I will have a look and review just give me some time :)

Thanks for the reviews - appreciate it!

> 
> --
> Uladzislau Rezki


