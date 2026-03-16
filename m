Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B197EF53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxynn+tx6vv5zQDqDtLZx4fIGEJiKAF8uQFz9DI9N3o=; b=MLFqR+Sw9aaWj79i/vFTVI6tMp
	ALwmvnb+U3sStIGXpioTDu4jk8fieL3v+eiO4TEDcVdStIInDSpWyed+yFUHehZDQmM/BciUyWagI
	mN8BXQmDtZQAlMkFI4LuUboMgFUlb0+2fsU861VwRJs/6bF0JsgtB1/wixAf4Ga9fHWpn2g4scOgR
	RlRclU3CCZnMjh+DGzzVCAg65sQUoxvJLHcS9hBeUDvxX84rVqYw1hUjpITpBDVCQBSMFm0kR6TVM
	SZEc8DLZLhtcvPKPrIxB7zAkWk/0XAX4kOHkn6rI5F5p2U19yYXMaSFYM9Yn4wr0h97RltjoUOZFm
	BphxufWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C93-00000004cfE-1gDz;
	Mon, 16 Mar 2026 17:54:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C90-00000004cek-3K32
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:54:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14C5C1476;
	Mon, 16 Mar 2026 10:54:15 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8FD53F73B;
	Mon, 16 Mar 2026 10:54:19 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:54:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	aneesh.kumar@kernel.org, steven.price@arm.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: realm: Fix PTE_NS_SHARED for 52bit PA support
Message-ID: <abhDyc2txBPIJ6X8@arm.com>
References: <20260316161901.2410354-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316161901.2410354-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_105422_888875_F50EFFE1 
X-CRM114-Status: GOOD (  11.68  )
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

On Mon, Mar 16, 2026 at 04:19:01PM +0000, Suzuki K Poulose wrote:
> With LPA/LPA2, the top bits of the PFN (Bits[51:48]) end up in the lower bits
> of the PTE. So, simply creating a mask of the "top IPA bit" doesn't work well
> for these configurations to set the "top" bit at the output of Stage1
> translation.
> 
> Fix this by using the __phys_to_pte_val() to do the right thing for all
> configurations.
> 
> Tested using, kvmtool, placing the memory at a higher address (-m <size>@<Addr>).
> 
>  e.g:
>  # lkvm run --realm -c 4 -m 512M@@128T -k Image --console serial
> 
>  sh-5.0# dmesg | grep "LPA2\|RSI"
> [    0.000000] RME: Using RSI version 1.0
> [    0.000000] CPU features: detected: 52-bit Virtual Addressing (LPA2)
> [    0.777354] CPU features: detected: 52-bit Virtual Addressing for KVM (LPA2)
> 
> Fixes: 399306954996 ("arm64: realm: Query IPA size from the RMM")
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

