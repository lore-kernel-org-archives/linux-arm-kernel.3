Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E584CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDugfFalF/+E2XIqgWe3ZPKkgGU5y0RPt1+YG9Yq6zI=; b=wg+c6HB2NWUijXsr5t0Sk/7qKb
	N+PkrNNmMUFBPZSoJYXq00ZJgFTxORgbdvM0CEMSlutqo6p/Vrzt8CQukLJuyOi78aQXBZ81pHbMJ
	sp+6zEIugPstU0FGZFED/AF26e2drBlnAdAnII4qyUgmOTOXcxZXysMD1Q0M0Cc5D5mI0FHC6ztWv
	eaTIaQuHLfwa321xqnCoUrTg9Kj/aAJ7bc6VPkP/yej4JXCGXFiAnxGJR3QTu2XJcGLNAHe7PAkPE
	hOHsTU+yK7aybw799HRfyExds4Oz8GanjgGG7Gj0nJDPWWElXHUoQlNpFypbEWP3eRqAkQfNOoRK6
	KkcD7mYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNQq-0000000HTXY-1j00;
	Fri, 07 Nov 2025 14:27:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNQp-0000000HTXM-0fm1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DC7761916;
	Fri,  7 Nov 2025 14:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912E6C4CEF8;
	Fri,  7 Nov 2025 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762525633;
	bh=Pzo7tfIaHjLpftx/B0TKs+rcupOkEug4Caccn3F0lig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaP1BGy3T71n9873EJJSuRsl/8HamSIhcGxLlMEM0oxVZB7oBHT+ZDHodCwwmy5QN
	 DCxldO4nQ9daC9l32//xRryV5Nk1BoS8ftLL7s/8CYGyMD7T5xChQPWZV06n5SuIGI
	 NtozWcoRwGAnRWWDPRDzKbrxW1d3P8rewz7tokQpyHWyuB8S7A1frE4cuiQUMNB3tw
	 fq3um2ZF0ht/mFb7uYoIvUuz2vP2X2pvXYxKPqAX7mlT8146hQ2DuPIKuVUPtLX48K
	 2zw6KcbsQMXXrEs2uOJwvqU8f8tUaww59+KVzFKuzpUcdr4Rm1elTFkSGdMlpY6GMu
	 7m87AYHK0nynw==
Date: Fri, 7 Nov 2025 14:27:09 +0000
From: Will Deacon <will@kernel.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: catalin.marinas@arm.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com
Subject: Re: [PATCH] arm64: Remove assertion on CONFIG_VMAP_STACK
Message-ID: <aQ4BvRzFWP7rKLqi@willie-the-truck>
References: <20251103152345.175463-1-dawei.li@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103152345.175463-1-dawei.li@linux.dev>
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

On Mon, Nov 03, 2025 at 11:23:45PM +0800, Dawei Li wrote:
> CONFIG_VMAP_STACK is selected by arm64 arch unconditionly since commit
> ef6861b8e6dd ("arm64: Mandate VMAP_STACK").
> 
> Remove the redundant assertion and headers.
> 
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  arch/arm64/include/asm/vmap_stack.h | 4 ----
>  arch/arm64/kernel/sdei.c            | 4 ----
>  2 files changed, 8 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

