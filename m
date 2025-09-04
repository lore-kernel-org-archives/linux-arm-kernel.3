Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B8CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+KhCel/FG+KZ+Z3G+vFcuQ+ux/WwyPr/PSbZ+GFoDU=; b=L5V6l3diIDedagxNvUyXFtrc8i
	NCdMQDzyMa+ryKndYD7tOF0F1JZBb8nDBdshrLuJHIU9XTA+Am848e7hFqhaaMzRs7XSJrDXHdrHs
	uBTrUTw0HztDEDFxbkMwn6Ao5bxr7SmFAo9npdxlqNwCadoWEyJJMik233URKgJGxFMcFA6bpcsZo
	ttNNTs8sjqFHq+E+lLFLa20ZRCMZQZ7+GIDIraTfUetEdR4bqBiKbMwqftdC98n24iVGmkoI4+M8V
	dWbuYNHGyFMbMEN2hIK6aS6pwO13mfAgsr/9nD7vnyMckEjPX+wYEtyeiLfDZB4zY1MxvHBZYqTav
	vW84JIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9IG-0000000Bdok-3kc5;
	Thu, 04 Sep 2025 12:42:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7qZ-0000000B7QM-0ZU2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 11:09:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A24E1756;
	Thu,  4 Sep 2025 04:09:34 -0700 (PDT)
Received: from [10.1.37.179] (XHFQ2J9959.cambridge.arm.com [10.1.37.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9E83F6A8;
	Thu,  4 Sep 2025 04:09:40 -0700 (PDT)
Message-ID: <74603a7e-74f7-4d8f-9c2e-7caa42f2399f@arm.com>
Date: Thu, 4 Sep 2025 12:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: mm: Optimize split_kernel_leaf_mapping()
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-5-ryan.roberts@arm.com> <aLiU9xnZl-7LBqkX@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aLiU9xnZl-7LBqkX@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040943_226546_B53B8AA8 
X-CRM114-Status: GOOD (  13.32  )
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

On 03/09/2025 20:20, Catalin Marinas wrote:
> On Fri, Aug 29, 2025 at 12:52:45PM +0100, Ryan Roberts wrote:
>> The common case for split_kernel_leaf_mapping() is for a single page.
>> Let's optimize this by only calling split_kernel_leaf_mapping_locked()
>> once.
>>
>> Since the start and end address are PAGE_SIZE apart, they must be
>> contained within the same contpte block. Further, if start is at the
>> beginning of the block or end is at the end of the block, then the other
>> address must be in the _middle_ of the block. So if we split on this
>> middle-of-the-contpte-block address, it is guaranteed that the
>> containing contpte block is split to ptes and both start and end are
>> therefore mapped by pte.
>>
>> This avoids the second call to split_kernel_leaf_mapping_locked()
>> meaning we only have to walk the pgtable once.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> And I agree with Yang, you can just fold this into the previous patch.

Yep, will do. Thanks for the review.

