Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F027CF36BA4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 03:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHdIs+WY6R5DaoZ/DJBQW/O2KE9/mI5VCbJg5HKZ1ms=; b=UPS4Df+GemWlGl1bciluNkPlHx
	SvXQ8I4ugh7AZMo5L+fMGDywrqMCtsPL2SGEsSeZHK7AUTx6zowWlXEZIIQis8W2nzreKEjuIJpqS
	FMGLHKf05hYeqS1VulyyEgIs4O4deSAzdHAZ8c+aZy0PIdcrpy5SfvaqsQzsyo2sfomoJjAnSmrIw
	9EBA0W8oJ5zD00Lbw2UPWWL2169Xb3biXB6DW/MFSRXjBHx2NTQeAB4ScGXHyPXqD23dUBTIGo+qw
	F+iDZhLm6s+9yZ2k0HfXAMQPw6/GAmjT41t7eGSNpzEDx45t9s2e+J+N5mVWz4NaNd3bw3iGJxOdp
	1/bE9lkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2SH-0000000BXEW-0aoJ;
	Fri, 10 Apr 2026 03:22:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2SE-0000000BXEB-2A7j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 03:22:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB3061C25;
	Thu,  9 Apr 2026 20:22:36 -0700 (PDT)
Received: from [10.163.181.107] (unknown [10.163.181.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEDB83F641;
	Thu,  9 Apr 2026 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775791362; bh=R3qfDw7crVOy8R1j2TZwYuQoVv5jXQP+cKnUXI5OagA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G+yp2+waAu91yxXfiqb8dbQfzSXCQ1iHAvULnso7HPiYfR827OieVKrhS5V8+wMqa
	 q1uW/KbgMfpSlCI44/PT4LXYYbfuLIob2IuOvEmmbUJ3kc2wPSsuZiSlD7bfEPfKmU
	 dGKDbHoGuZZS/wmvK934atJ8TP8nhwh7yAPgkalg=
Message-ID: <ac73cc87-8663-4d45-8c0f-4a01ffc0fc29@arm.com>
Date: Fri, 10 Apr 2026 08:52:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 14/16] arm64/mm: Enable fixmap with 5 level page table
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-15-anshuman.khandual@arm.com>
 <4382c90a-bc92-470e-9aa7-4666753479ca@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <4382c90a-bc92-470e-9aa7-4666753479ca@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_202246_699049_E210A547 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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



On 08/04/26 5:59 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 06:11, Anshuman Khandual wrote:
>> Enable fixmap with 5 level page table when required. This creates table
>> entries at the PGD level. Add a fallback stub for pgd_page_paddr() when
>> (PGTBALE_LEVELS <= 4) which helps in intercepting any unintended usage.
> 
> Can you add the "why" ?

Following reworded commit message should work ?

------------------------------------------------------------------
arm64/mm: Enable fixmap with 5 level page table

FEAT_D128 halves PTRS_PER_PXX thus shrinking the VA range coverage 
for each page table level. Hence in order to preserve all existing
VA range configurations, some geometry now need to become 5-level.

Since fixmap is used to build and manipulate page tables early on
during boot the mapping must also gain that additional level which
was not required earlier.

Enable fixmap with 5 level page table when required. This creates table
entries at the PGD level. Add a fallback stub for pgd_page_paddr() when
(PGTBALE_LEVELS <= 4) which helps in intercepting any unintended usage.
-------------------------------------------------------------------

