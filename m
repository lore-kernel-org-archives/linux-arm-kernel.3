Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA27C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvWciJfaVsMWvx3Zdk//3quO7yVMEY+q9znYmRIhlXA=; b=Cjx2pDE/6rH9oI/5dyEra/9lJg
	Z371KeaWk8JT1YAio7RliOWgcMKR1R5gTliIQcv2yI9Xd0dDxf065sEnVbBByKu0wV3HHuDZWwfma
	xQDqVeVxNZDZe82vEHomulOcfRVshadrfsq6pc1hREjjCTKC1CTVBKIZjYXgqjbFp+GmikTblV3sY
	XmLXk35ukmItbBVihxD3jK7oDtVD4M72ZyM3Mc/XwHy13MtWdUUigbFKZ689Vwr+LvYtm46eIGrtw
	UWxmn9uPPfZquZJLPVxaK9mpeRbabqBQvnmG+/UmRDhu7XM/LMMjmaLOyh/TYNwjuH9zo+yQVenqP
	IdlgXu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTy8-0000000HXeG-0S7v;
	Thu, 15 May 2025 08:29:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTrl-0000000HVPp-2dwL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:22:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5D5C14BF;
	Thu, 15 May 2025 01:22:44 -0700 (PDT)
Received: from [10.162.40.26] (K4MQJ0H1H2.blr.arm.com [10.162.40.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CD1A3F673;
	Thu, 15 May 2025 01:22:53 -0700 (PDT)
Message-ID: <4904d02f-6595-4230-a321-23327596e085@arm.com>
Date: Thu, 15 May 2025 13:52:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
To: David Hildenbrand <david@redhat.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: ryan.roberts@arm.com, anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250515063450.86629-1-dev.jain@arm.com>
 <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012257_728091_2F300C52 
X-CRM114-Status: GOOD (  13.39  )
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



On 15/05/25 1:43 pm, David Hildenbrand wrote:
> On 15.05.25 08:34, Dev Jain wrote:
>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller 
>> only
>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>> pmd_free_pte_page(), wherein the pmd may be none.
> The commit states: "The core code already has a check for pXd_none()", 
> so I assume that assumption was not true in all cases?
> 
> Should that one problematic caller then check for pmd_none() instead?

 From what I could gather of Will's commit message, my interpretation is 
that the concerned callers are vmap_try_huge_pud and vmap_try_huge_pmd. 
These individually check for pxd_present():

if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
	return 0;

The problem is that vmap_try_huge_pud will also iterate on pte entries. 
So if the pud is present, then pud_free_pmd_page -> pmd_free_pte_page 
may encounter a none pmd and trigger a WARN.

> 
> If you were able to trigger this WARN, it's always a good idea to 
> include the splat in the commit.

I wasn't able to, it is just an observation from code inspection.

> 


