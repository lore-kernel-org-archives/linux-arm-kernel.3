Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F247BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 20:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pJiSLLI54pE+AH2rNKBeQYn4gxRhjAlCuHklWimmK0=; b=NKTNLF2InO7e3O+xCdgFQdoJlJ
	4oyiIe88L2ZolHVWM3kLLaDBTsdtBcFV4QvvYqg2qRoOg99m3JFuHYIUV49Lv9wv0J8anY/8GpV7a
	DY1NBvP/Wdg6bkPsLpGgB2I3wBugt/RMVL7QQxaEln2VFKYNFzVykQCtXMXcImUznOdaOTaQCBp0p
	G/dhwvzg06DfjdobdBrIXNihdIOXnuEqfHweJOnaBEcHiZe4hMXnGB/HpLjXVaxnODCjHejz2/g2f
	qask0ArnaGCPCi+nS01sCCW6I4p+DegT1Csvdfg1V1Egm47JGGkT+MBWkJdkvSmstHIGV2kSYO6Ai
	POheGjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPO0-00000003BLL-2ufT;
	Mon, 14 Jul 2025 20:02:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPLZ-00000003B6n-0SpW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 20:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 917515C6457;
	Mon, 14 Jul 2025 20:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CA4C4CEED;
	Mon, 14 Jul 2025 20:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752523220;
	bh=1EuLxQcoalPrJoC0+kKDMPul2uferMAfFFNpnRudPHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eB/iQEuncCntN2Vi1sK+eMQKX9USnt+MYbYVTV6W4ubG7df0HECYUmwXf3h8uBl5h
	 3+D0Y74sD7ZQ2OxqvBKcaxe7Z0HfGN8MqPCWuaW13bAKgcxmk3dpu7Td/rlWHcK56A
	 Slu9qaMm7yTG2a4cSmwilcoj/4p9rsPpHHWzKbD+5KGISkdcTnThyqLWGFjnj3NagH
	 58FRM29G/yPrnVIZyQTPprUDXv4arfvUol06PIN9H6/SWe40aYQtYXUuu5S23+jEVx
	 B1hI17jKL8pdDt1EXTD34pmP2iSCizqW0fQU4eZ8z98W7wFpHqxXcNDrtP6lmWV/i4
	 dFwgMvJTANRoA==
Date: Mon, 14 Jul 2025 13:00:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Rob Landley <rob@landley.net>,
	Martin Wetterwald <martin@wetterwald.eu>
Subject: Re: [PATCH] ARM: Fix allowing linker DCE with binutils < 2.36
Message-ID: <20250714200016.GA3444087@ax162>
References: <20250707-arm-fix-dce-older-binutils-v1-1-3b5e59dc3b26@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-arm-fix-dce-older-binutils-v1-1-3b5e59dc3b26@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_130021_192022_B8D7D9F3 
X-CRM114-Status: GOOD (  19.93  )
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

On Mon, Jul 07, 2025 at 12:39:26PM -0700, Nathan Chancellor wrote:
> Commit e7607f7d6d81 ("ARM: 9443/1: Require linker to support KEEP within
> OVERLAY for DCE") accidentally broke the binutils version restriction
> that was added in commit 0d437918fb64 ("ARM: 9414/1: Fix build issue
> with LD_DEAD_CODE_DATA_ELIMINATION"), reintroducing the segmentation
> fault addressed by that workaround.
> 
> Restore the binutils version dependency by using
> CONFIG_LD_CAN_USE_KEEP_IN_OVERLAY as an additional condition to ensure
> that CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION is only enabled with
> binutils >= 2.36 and ld.lld >= 21.0.0.
> 
> Cc: stable@vger.kernel.org
> Fixes: e7607f7d6d81 ("ARM: 9443/1: Require linker to support KEEP within OVERLAY for DCE")
> Reported-by: Rob Landley <rob@landley.net>
> Closes: https://lore.kernel.org/6739da7d-e555-407a-b5cb-e5681da71056@landley.net/
> Tested-by: Rob Landley <rob@landley.net>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 3072731fe09c..962451e54fdd 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -121,7 +121,7 @@ config ARM
>  	select HAVE_KERNEL_XZ
>  	select HAVE_KPROBES if !XIP_KERNEL && !CPU_ENDIAN_BE32 && !CPU_V7M
>  	select HAVE_KRETPROBES if HAVE_KPROBES
> -	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_CAN_USE_KEEP_IN_OVERLAY)
> +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_IS_LLD) && LD_CAN_USE_KEEP_IN_OVERLAY
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_NMI
>  	select HAVE_OPTPROBES if !THUMB2_KERNEL
> 

I have dropped this in the patch tracker with an updated set of tags
since Martin reported the same issue after I sent this to the list.

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9450/1

Cheers,
Nathan

