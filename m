Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00975E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yto1nLUN+brke/yKao1WpnrxULRnM1bGzCYYblYRVN4=; b=eOZOYwjFqQsl4JMqPaB5tAQPNd
	6JiRKl10IcHezXN1L9m+cBBwdcyBedX6BaUpbX2pEFkTLrtXqV+9a2lkkxs/rH+7YwQWFKTlf270W
	WdewbcS/yaMVammq/PC4uo/dyJ1NFow089Ogxq6cv9AGKdXriYwr3WP+hy50/B1eKHeKZqhAdM1qE
	WBrXONoHrQtvhwDiMSQuQdPvFGQdzlEAq/oP6IWWZU3AxbUdkQaS9Flh75D3T5JdGZ58TqwwQMwue
	92inxhxF+Eoi9xGZIEgtQJrwhuAGLJLWFAVvHizUmIbGMEz5dPOzd0BTtc4LBdkv+kM7NBLk0pt2v
	EI2/UkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMWi-00000002tmh-0zyJ;
	Thu, 19 Dec 2024 19:49:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMUY-00000002tQB-2ewx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1163C5C68F3;
	Thu, 19 Dec 2024 19:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4FEC4CED4;
	Thu, 19 Dec 2024 19:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637645;
	bh=W4xG6C/P7SwhesGX8h+yHj5UUkat50dMpNFG4ndH9bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qs0/pnelDnGSWqhbSLCiLjNasihTl6OSWLlLmQtA6GXUUqVBDVQ7zVcp1VeHsTNS/
	 sIWBLOwxzi35hhtz3XKOJvbX9R/0atqvRqc5x4eexjbUQOhwCtnFh0uAU3HJEbsJh9
	 89/SYOFHScgrXTpPeqybXKeI+xl/QFN2Zux5YHQrCqNZXs/7EZinL8O7zII+XzUfrP
	 5izZ9BAr5CFkkoEmd1+gwxXs43KuXMqqZyBBiKaJZZhJkT95KU2znKGr1ecqcT21+x
	 J8C/PXOSvCZ7kLVye8mwtSFd3voe1MwmUYyaaIduPPQjDQBpVCDyoVBy7xOza581Bl
	 WDEoKOnlgVKJg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Quentin Perret <qperret@google.com>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: Clean up and simplify PA space size handling
Date: Thu, 19 Dec 2024 19:47:08 +0000
Message-Id: <173462903479.3930132.9019084013797129885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241212081841.2168124-8-ardb+git@google.com>
References: <20241212081841.2168124-8-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114726_712130_AD9CB698 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, 12 Dec 2024 09:18:42 +0100, Ard Biesheuvel wrote:
> This series addresses a number of buglets related to how we handle the
> size of the physical address space when building LPA2 capable kernels:
> 
> - reject 52-bit physical addressess in the mapping routines when LPA2 is
>   configured but not available at runtime
> - ensure that TCR.IPS is not set to 52-bits if LPA2 is not supported
> - ensure that TCR_EL2.PS and DS match the host, regardless of whether
>   LPA2 is available at stage 2
> - don't rely on kvm_get_parange() and invalid physical addresses as
>   control flags in the pKVM page donation APIs
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/6] arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
      https://git.kernel.org/arm64/c/bf74bb73cd87
[2/6] arm64/mm: Override PARange for !LPA2 and use it consistently
      https://git.kernel.org/arm64/c/62cffa496aac
[3/6] arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
      https://git.kernel.org/arm64/c/f0da16992aef
[4/6] arm64/kvm: Avoid invalid physical addresses to signal owner updates
      https://git.kernel.org/arm64/c/9d86c3c97434
[5/6] arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0 sw PAN
      https://git.kernel.org/arm64/c/92b6919d7fb2
[6/6] arm64/mm: Drop configurable 48-bit physical address space limit
      https://git.kernel.org/arm64/c/32d053d6f5e9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

