Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B88CD5BA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LEAsRafSmZYwpP5pAMy7aN+qLEXxlxStYW+NCVLHFs=; b=ucr7189fhqh7Z8wuuERu6ww/zV
	BNCENu2IFy8q14cnJJsupKHcxVyLWWn0ARGT/uzgSFc9rVcJmGMDF/o5GPpq0ESHqCpYHwGSZYDIZ
	cDfuXqYMdWyxmfSjoTRIyrOlu5R7EB0aW1rUbThl8dIei/qlhUtfoj1RZChvCuNhl9HchP6grP8LQ
	5y2W39ofVBevvSSuLdQWDIupera38c6lZXfRqhreApoijuqWWvz5Wq2BM8YPPUUQf7gh+7tredH7C
	FasIRfUdymOw7M51hoGJXas74lCwSF6iwkSDaRpp8T1CpPcpqixn2gXqwuCMmiVdS7X6Xb3xvvGzf
	CPqtBKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTTh-0000000AAwr-0pN3;
	Thu, 13 Nov 2025 09:18:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTTe-0000000AAwY-3iUz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:18:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D06112FC;
	Thu, 13 Nov 2025 01:18:41 -0800 (PST)
Received: from [10.163.74.57] (unknown [10.163.74.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D4783F66E;
	Thu, 13 Nov 2025 01:18:46 -0800 (PST)
Message-ID: <a1306c3a-5d2e-48e0-aaa8-4e19ea81bef3@arm.com>
Date: Thu, 13 Nov 2025 14:48:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64/mm: TTBRx_EL1 related changes
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251103052618.586763-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_011850_991894_08035E09 
X-CRM114-Status: UNSURE (   9.60  )
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

On 03/11/25 10:56 AM, Anshuman Khandual wrote:
> This series contains some TTBRx_EL1 related changes, aimed at standardizing
> TTBRx_EL1 register field accesses via tools sysreg format and also explains
> 52 PA specific handling methods via a new macro along with in code comments
> 
> This series applies on v6.18-rc4
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (6):
>   arm64/mm: Directly use TTBRx_EL1_ASID_MASK
>   arm64/mm: Directly use TTBRx_EL1_CnP
>   arm64/mm: Represent TTBR_BADDR_MASK_52 with TTBRx_EL1_BADDR_MASK
>   arm64/mm: Ensure correct 48 bit PA gets into TTBRx_EL1
>   arm64/mm: Describe 52 PA folding into TTBRx_EL1
>   arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
> 
>  arch/arm64/include/asm/asm-uaccess.h   |  2 +-
>  arch/arm64/include/asm/assembler.h     |  3 ++-
>  arch/arm64/include/asm/mmu_context.h   |  2 +-
>  arch/arm64/include/asm/pgtable-hwdef.h | 23 ++++++++++++++++++++---
>  arch/arm64/include/asm/pgtable.h       |  5 +++--
>  arch/arm64/include/asm/uaccess.h       |  6 +++---
>  arch/arm64/kernel/entry.S              |  2 +-
>  arch/arm64/kernel/mte.c                |  4 ++--
>  arch/arm64/mm/context.c                |  8 ++++----
>  arch/arm64/mm/mmu.c                    |  2 +-
>  10 files changed, 38 insertions(+), 19 deletions(-)

Gentle ping. Beside [PATCH 4/6] (which can be dropped as indicated by Mark)
any concerns regarding reset of these changes here ?

