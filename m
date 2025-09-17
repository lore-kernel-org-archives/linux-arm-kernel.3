Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8506CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpnwFPyAVLaLtl8xU8eYUnBiKZjwriewDafMiNX98Uo=; b=eKgPzKJa9KaqrHRwPMnP2Z8rgH
	LtSBLvq0S5ltNj0IrlnW9w+844euhPhDXTNLRcjjRzjcFZ9UbKJ8+futYOaYnbLofOLkVmpB7XyRv
	ueocC1ZQgHVTjjm8f9vp/eNv0WZog3bYEX4j6Inw6j0mcvibOcA2eVeG5mrk+T0f71b+ezB2snWIt
	mdBmhlkcFqrwUZZF0G8bHecd5Weytmvf50ZLBSFiWLtmgtLnjaaW1l1MmN9T32aPbu9WwYXJyrT4L
	bHSyxMEIUS3owQXULMJo/0OFmt8Z1SWPHUvZlXd87hQGuWh5SWkImfpdwKk2MqX1/OyKKUhyo+bFH
	BIKzNp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuBt-0000000Cka7-3jXW;
	Wed, 17 Sep 2025 15:35:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuBs-0000000CkYT-15La
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97EDB6022A;
	Wed, 17 Sep 2025 15:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7E0C4CEE7;
	Wed, 17 Sep 2025 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123327;
	bh=epbbumuF/07bqlEvab2zERySAUlqgpP+5wWIA0A9XNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpeLMcZVPYDp1xvxWCy55CjA/XKfFCmX2ara8/Vy+b3Jd4a2X/3dcUBHqoHadEWfK
	 QDv4J1KaklWoVTnmoRmrnM+GHey6bj1+y0expTrF2H2jMchRmwzVzl6E3Ggxad+GtY
	 zXnbc2N/w77qf8OWEBz67i0PaXADA1s6Ckp9+soQuPxlVEfBw4tFDZTbkVzswbgrmv
	 Gn3CSnNZmtprYsr7isogRoy8iyHrpVL1zjy7ryqXbOdlwqex83DAw6PLhBbbua8qFR
	 WYyjtTJBaZYZURHN3ZSROOFbzca1QX3OOVkx/ZBTxdi0WyyyW+35vpFPO74Np3xSk8
	 9ytuTYzZiI0xw==
Date: Wed, 17 Sep 2025 16:35:22 +0100
From: Will Deacon <will@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v2] arm64: mm: Move KPTI helpers to mmu.c
Message-ID: <aMrVOmOro930Bgob@willie-the-truck>
References: <20250912073908.404924-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912073908.404924-1-kevin.brodsky@arm.com>
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

Hey Kevin,

On Fri, Sep 12, 2025 at 08:39:08AM +0100, Kevin Brodsky wrote:
> create_kpti_ng_temp_pgd() is currently defined (as an alias) in
> mmu.c without matching declaration in a header; instead cpufeature.c
> makes its own declaration. This is clearly not pretty, and as commit
> ceca927c86e6 ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
> function signature") showed, it also makes it very easy for the
> prototypes to go out of sync.
> 
> All this would be much simpler if kpti_install_ng_mappings() and
> associated functions lived in mmu.c, where they logically belong.
> This is what this patch does:
> - Move kpti_install_ng_mappings() and associated functions from
>   cpufeature.c to mmu.c, add a declaration to <asm/mmu.h>
> - Remove create_kpti_ng_temp_pgd() and just call
>   __create_pgd_mapping_locked() directly instead
> - Mark all these functions __init
> - Move __initdata after kpti_ng_temp_alloc (as suggested by
>   checkpatch)
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> v1..v2:
> * Removed create_kpti_ng_temp_pgd() instead of making it a wrapper
>   [Ryan's suggestion]
> * Added Reviewed-by's.
> ---
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/mmu.h   |  6 +++
>  arch/arm64/kernel/cpufeature.c | 97 ----------------------------------
>  arch/arm64/mm/mmu.c            | 96 +++++++++++++++++++++++++++++----
>  3 files changed, 93 insertions(+), 106 deletions(-)

Thanks, this looks fine to me. However, it conflicts with ceca927c86e6
("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc function
signature") which landed after -rc1 so I'll either queue this late
(after merging in for-next/fixes to for-next/core) or we can defer it to
-rc1.

If we get to -rc2 and it's not in Linus' tree, then please repost
because it means I forgot about it :)

Will

