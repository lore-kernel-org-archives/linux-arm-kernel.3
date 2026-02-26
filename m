Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11ACFC592F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ixhCa3Zfg2EExxxzuPNd3mbKcLIPIeWkv+b0ZXWUiU=; b=dOoO971UBJRodbx14XJysbtT0K
	Ret28BmB2bABrqoc6mmbu5cFaWzsPmFdFr9W/1LkJ4affzRrmAGuXShcccjAw0XeO+OWvDqp4iREw
	AYAYR3EsJVAiXgTxcFqKa3UWV7IF6iMVMMS+tZh0Lq91opzTm+/kDNGvgKnQBZ8eDLK44t27BTKIp
	75hhbiNT/AkILJig1hCNpEq8zCCSlcRkMi0/Ps40NZJrAM9ZlKuTrUuiglfv01EZOLSdtkleejb2Z
	DY4ipGuDshCJsXvMlcSdC0cMnG4NDQm8K8+G5GnnPHXONFdRYXjunBwNK/fMIuuZSA7/q3HFMXfP1
	OnpqQI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZw7-000000064Dn-3VLI;
	Thu, 26 Feb 2026 11:53:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZw6-000000064DQ-078N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:53:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D9441516;
	Thu, 26 Feb 2026 03:53:34 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82DF23F62B;
	Thu, 26 Feb 2026 03:53:39 -0800 (PST)
Date: Thu, 26 Feb 2026 11:53:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
Message-ID: <aaA0QbVbAvrCJ1QV@J2N7QTR9R3>
References: <20260225064028.1525192-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225064028.1525192-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_035342_104125_6E49DAC2 
X-CRM114-Status: GOOD (  18.90  )
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

On Wed, Feb 25, 2026 at 06:40:28AM +0000, Anshuman Khandual wrote:
> TTBR1_BADDR_4852_OFFSET is a constant offset which gets added into kernel
> page table physical address for TTBR1_EL1 when kernel is build for 52 bit
> VA but found to be running on 48 bit VA capable system. Although there is
> no explanation on how the macro is computed.
> 
> Describe TTBR1_BADDR_4852_OFFSET computation in detail via deriving from
> all required parameters involved thus improving clarity and readability.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This applies on v7.0-rc1
> 
> Earlier context can be found here.
> 
> https://lore.kernel.org/linux-arm-kernel/aRb8ezhQd0c0jp9G@J2N7QTR9R3/

As with my comments last time, I have no strong feelings on this either
way; I'll leave it to Cataln and Will.

Mark.

>  arch/arm64/include/asm/pgtable-hwdef.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
> index 5e6809a462c7..72f31800c703 100644
> --- a/arch/arm64/include/asm/pgtable-hwdef.h
> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
> @@ -285,9 +285,12 @@
>  #endif
>  
>  #ifdef CONFIG_ARM64_VA_BITS_52
> +#define PTRS_PER_PGD_52_VA (UL(1) << (52 - PGDIR_SHIFT))
> +#define PTRS_PER_PGD_48_VA (UL(1) << (48 - PGDIR_SHIFT))
> +#define PTRS_PER_PGD_EXTRA (PTRS_PER_PGD_52_VA - PTRS_PER_PGD_48_VA)
> +
>  /* Must be at least 64-byte aligned to prevent corruption of the TTBR */
> -#define TTBR1_BADDR_4852_OFFSET	(((UL(1) << (52 - PGDIR_SHIFT)) - \
> -				 (UL(1) << (48 - PGDIR_SHIFT))) * 8)
> +#define TTBR1_BADDR_4852_OFFSET (PTRS_PER_PGD_EXTRA << PTDESC_ORDER)
>  #endif
>  
>  #endif
> -- 
> 2.30.2
> 

