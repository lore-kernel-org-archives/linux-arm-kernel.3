Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C105C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDB1LzJ1pbRFDGil5fJl9RA8U8ZLM6S0+T1y5ufVtMc=; b=YCALbO6lzhj9hZjyED3KK2rbiZ
	B814mtKmaC9mQLz3Zwl1arsUqFNVdmI/fBmWVOfzdE7vme/MFWsSu0YbyFbxFDQ12JrPinGKxoagJ
	eM1vBMvo7+zYUhthjUh3dIYeibJqu26GVOO2EChFmwnOwrC2/JrUQxNoGbMuakF8vzExNfxfvtASP
	MbzGN7mZzavuUeEWHt6tNuFBm16Se7+Hfa00nCPHzsspWn3NIJcat1l81T1OPfiUn9HCq6LxG5cJy
	qABATUGk2sQqSW+s0fofi39OfMAqnOS0FK9eT0/d2nW7DPSwq17kV2zbPTpJqNXhZeHfzLYb+rp7x
	kf3a2tWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqZY-00000003IQt-1TbJ;
	Mon, 07 Jul 2025 18:28:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpbO-00000003ALg-4126
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 17:26:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8A7C168F;
	Mon,  7 Jul 2025 10:25:49 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652A03F66E;
	Mon,  7 Jul 2025 10:26:00 -0700 (PDT)
Date: Mon, 7 Jul 2025 18:25:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, leo.yan@arm.com, kernel-team@meta.com
Subject: Re: [PATCH 0/8] arm64: set VMAP_STACK by default
Message-ID: <aGwDJXTGAdV_VqY2@J2N7QTR9R3>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_102603_039949_3912AD93 
X-CRM114-Status: GOOD (  18.13  )
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

On Mon, Jul 07, 2025 at 09:01:00AM -0700, Breno Leitao wrote:
> Hi all,
> 
> This patchset select VMAP_STACK on arm64 by default, and cleans up the
> code by removing all associated CONFIG_VMAP_STACK conditionals.
> 
> This is a suggestion from Will Deacon from another discussion[1].
> 
> With VMAP_STACK now always enabled on arm64, the code can be
> significantly simplified, reducing complexity and potential for
> misconfiguration.
> 
> Overview of Changes
> 
>     * Remove all #ifdef CONFIG_VMAP_STACK and related runtime checks
>       throughout the architecture codebase.
>     * Replace runtime checks with build-time assertions where
>       appropriate.
> 
> Link: https://lore.kernel.org/all/aGfYL8eXjTA9puQr@willie-the-truck/ [1]
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Nice!

Aside from a minor comment on the first patch, this all looks good to
me. For the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
> Breno Leitao (8):
>       arm64: Enable VMAP_STACK support
>       arm64: efi: Remove CONFIG_VMAP_STACK check
>       arm64: Remove CONFIG_VMAP_STACK conditionals from THREAD_SHIFT and THREAD_ALIGN
>       arm64: remove CONFIG_VMAP_STACK conditionals from irq stack setup
>       arm64: remove CONFIG_VMAP_STACK conditionals from traps overflow stack
>       arm64: remove CONFIG_VMAP_STACK checks from stacktrace overflow logic
>       arm64: remove CONFIG_VMAP_STACK checks from SDEI stack handling
>       arm64: remove CONFIG_VMAP_STACK checks from entry code
> 
>  arch/arm64/Kconfig                  |  1 +
>  arch/arm64/include/asm/memory.h     |  6 +-----
>  arch/arm64/include/asm/stacktrace.h |  6 +-----
>  arch/arm64/kernel/efi.c             |  5 -----
>  arch/arm64/kernel/entry-common.c    |  2 --
>  arch/arm64/kernel/entry.S           |  6 ------
>  arch/arm64/kernel/irq.c             | 13 -------------
>  arch/arm64/kernel/sdei.c            |  8 ++------
>  arch/arm64/kernel/stacktrace.c      |  4 +---
>  arch/arm64/kernel/traps.c           |  3 ---
>  10 files changed, 6 insertions(+), 48 deletions(-)
> ---
> base-commit: 9dd1757493416310a5e71146a08bc228869f8dae
> change-id: 20250707-arm64_vmap-fa70ba3c9cfb
> 
> Best regards,
> -- 
> Breno Leitao <leitao@debian.org>
> 

