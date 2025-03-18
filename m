Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD88C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 05:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bRckNhjjE5iZo3QBeEySwPoVgurOwdH1LnDXB/YAYM=; b=mFBQ32EHLSbaGKQ7EAGCsaaLJP
	mG3vmiffaUUsnfSaJ32x2DCK2KMVCKnp54mCkwk0EOaqtStIMTDvpA8sGY5jkruJ+XgefN6iWWYWv
	skTrrYBAxfJTrhqsdzfQZ41cv+45AKAuyjEy4RZD2I1+3dsfng+Jg/OeWZVDSrVNUK36TIUkzmAZl
	Tn++cnJvnWpQ8fvZrznSifgos1AhwB545flQVUjt5IqRgzS1cFW2L3ueAG962lD7UrEsDsH+JRwR/
	H1fkLCCUBme4CJEji9vwvveYJYBfsTNl6fk3q9Vhyc7H3eh/0npndycB4Ly79zzGdQM5lk60l0UF1
	kLh09Fdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPwM-00000004llP-3dea;
	Tue, 18 Mar 2025 05:56:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPue-00000004lYG-43V0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 05:54:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD1A0152B;
	Mon, 17 Mar 2025 22:54:59 -0700 (PDT)
Received: from [10.163.44.33] (unknown [10.163.44.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B70BA3F63F;
	Mon, 17 Mar 2025 22:54:48 -0700 (PDT)
Message-ID: <9abeecc3-2b19-43ba-8619-ea286d54db8e@arm.com>
Date: Tue, 18 Mar 2025 11:24:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64/mm/hotplug: Drop some redundant WARN_ON()
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20250221094449.1188427-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250221094449.1188427-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_225453_053708_9A4CCD55 
X-CRM114-Status: UNSURE (   9.06  )
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

On 2/21/25 15:14, Anshuman Khandual wrote:
> This series drops some redundant WARN_ON() tests which are not required any
> more while unmapping and freeing up kernel page table pages during a memory
> hot remove operation.
> 
> This series applies on v6.14-rc3
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (2):
>   arm64/mm/hotplug: Drop redundant [pgd|p4d]_present()
>   arm64/mm/hotplug: Replace pxx_present() with pxx_valid()
> 
>  arch/arm64/mm/mmu.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 

Gentle ping, any updates on this series ? This simplifies WARN_ON()
checks during memory hotplug operation, after subsequent changes to
page table helpers such as pxd_present() etc.

