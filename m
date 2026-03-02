Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D87FD58E78
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZe2G6eUKN1Cz6VUvWPizpuNVtCg5kCzi9w3Nv1aC7I=; b=YAusmRM/yL9Wbi75gxBduRVBpu
	UI0QH3A6LANisutxTDbSvr26YDtA1bBgKnYiDOSBNRawzPL9GY5UIMFkqBEEaiOAGF0hRzFc72/Mi
	CI5BQM7ok/cLjZGAOxlWwBzvXPgSi7X6LCvtkpeejYmApGnr+n2j736YAgO6PKvbQOnT8jj2vrVV4
	AOP8gNIvR2TbKJW1ZXpv+Qh87d3Vwn07xm0t/E98mtd9BDLhuNFeG+5VbZ+XQeJ5ZTBDWPMnR1e+T
	D3WrriA6FzH/rIdicau8S9CTZDu1294cfgsZLvLk1ue0MzL9RAqvdy6b6tp4oDbRFJOOiE7ymWDjS
	BqdTrWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxnK-0000000CQJ0-3IsT;
	Mon, 02 Mar 2026 07:34:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxnI-0000000CQIA-3dg7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:34:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F57914BF;
	Sun,  1 Mar 2026 23:34:13 -0800 (PST)
Received: from [10.164.18.51] (unknown [10.164.18.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10AD73F73B;
	Sun,  1 Mar 2026 23:34:16 -0800 (PST)
Message-ID: <6222d20a-6474-4e43-a2af-f49adbd4f6e1@arm.com>
Date: Mon, 2 Mar 2026 13:04:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/2] arm64/mm: Enable batched TLB flush in
 unmap_hotplug_range()
To: linux-arm-kernel@lists.infradead.org
Cc: david@kernel.org, mark.rutland@arm.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org
References: <20260224062423.972404-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260224062423.972404-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_233421_017971_1F106249 
X-CRM114-Status: GOOD (  14.85  )
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

On 24/02/26 11:54 AM, Anshuman Khandual wrote:
> This series enables batched TLB flush in unmap_hotplug_range() which avoids
> individual page TLB flush for potential CONT blocks in linear mapping while
> also improving performance due to range based TLB operation along with less
> synchronization barrier instructions.
> 
> It also now rejects memory removal that might split a leaf entry in kernel
> mapping, which would have otherwise required re-structuring using the break
> before make (BBM) semantics. But kernel cannot tolerate BBM, so remapping to
> fine grained leaves would not be possible on systems without BBML2_NOABORT.
> 
> This series applies on 7.0-rc1 and tested on KVM guest.
> 
> Changes in V3:
> 
> - Fixed some typos in the commit message for [PATCH 2/2]
> - Dropped copying stable@vger.kernel.org per Ryan
> 
> Changes in V2:
> 
> https://lore.kernel.org/all/20260203130348.612150-1-anshuman.khandual@arm.com/
> 
> - Renamed split_kernel_leaf_boundary() as addr_splits_kernel_leaf()
> - Dropped pte_valid()/pmd_leaf() before checking pte_cont()/pmd_cont()
> - Changed and dropped variables in can_unmap_without_split()
> - Moved can_unmap_without_split() after boot memory check
> - Renamed 'prevent_bootmem' as 'prevent_memory' across the board
> - Updated commit message in both patches
> > Changes in V1:
> 
> - https://lore.kernel.org/all/20260202042617.504183-1-anshuman.khandual@arm.com/
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Cc: Christoph Lameter <cl@gentwo.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (2):
>   arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
>   arm64/mm: Reject memory removal that splits a kernel leaf mapping
> 
>  arch/arm64/mm/mmu.c | 236 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 216 insertions(+), 20 deletions(-)
> 

Gentle ping. Any updates on this ?

