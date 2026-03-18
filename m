Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077B0103E179
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n226cTQo7HXeyALY/WS5jRXXBORyR/AeC4LnRev1Kx0=; b=D2vkfi/MRpQbRzczXMOjjBgeUb
	tbduswl3PjH7iQZVDnMQs9QFyPf2Dpgnub+dTW2anRQU/6oNfZbB1tXSvKBAWuWYSMO71+QiaGsIo
	Cx0jgU5UpD7XYTALBlq76wQ4rTDmZqeHg4XsdEx7tk9YtvmZoW0nmRdLdj8ClgVcm/ttsbjaXGYzT
	mO4Gs/zMGVjaYZIxLFhYCx56O2C8r6CnAieLSWrxwB/PMsr1r8FiKL/H2T+4rLkMJcGJNTz1pRtr5
	XujjrPjwjKeV14crUDquJV3vg6J5Zh6rAusECa2CvMHO5Cjs7yr5DKFROWwaLLHO8osnmSayjVDgE
	CzJEi8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2r6z-00000008UnN-2fDQ;
	Wed, 18 Mar 2026 13:39:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2r6x-00000008Umx-0z11
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=n226cTQo7HXeyALY/WS5jRXXBORyR/AeC4LnRev1Kx0=; b=vclGRwYd+AjNihq5c4sx5BBFGe
	Ke+AQgTQPKqMJ2dI86hh+OXB1Sg9rF/pxtCggQZqKwsj9VcsxJVok9ODsh+k96l8/OprRYeNs/Q6/
	/DLiNAHNQdUqESdntoNopGbYQQDpTYOyBVS4ss46hIfrk9NDCzQBNK9zszbrw1WT61Wg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2r6s-00CCoL-Kb; Wed, 18 Mar 2026 14:38:54 +0100
Date: Wed, 18 Mar 2026 14:38:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Li Jun <lijun01@kylinos.cn>
Cc: gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm: mvebu: fix null pointer when access
Message-ID: <4ba47ee5-a353-4083-a16e-b46afddd0d81@lunn.ch>
References: <20260318085923.2610585-1-lijun01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318085923.2610585-1-lijun01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_063859_293895_3BF3DBCE 
X-CRM114-Status: GOOD (  13.33  )
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

On Wed, Mar 18, 2026 at 04:59:23PM +0800, Li Jun wrote:
> the kzalloc&kstrdup may return null pointer, will cause kernel panic.
> 
> -Fix null pointer.
> 
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  arch/arm/mach-mvebu/board-v7.c      | 10 ++++++++++
>  arch/arm/mach-mvebu/coherency.c     |  6 ++++++
>  arch/arm/mach-mxs/mach-mxs.c        |  4 ++--
>  arch/arm/mach-versatile/versatile.c |  6 ++++++

4 versions in less than 24 hours....

Also, please don't mix different machine architectures together in one
patch. They have different Maintainers.

> diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board-v7.c
> index 04ad651d13a0..a3b1aa48162b 100644
> --- a/arch/arm/mach-mvebu/board-v7.c
> +++ b/arch/arm/mach-mvebu/board-v7.c
> @@ -128,11 +128,21 @@ static void __init i2c_quirk(void)
>  		struct property *new_compat;
>  
>  		new_compat = kzalloc(sizeof(*new_compat), GFP_KERNEL);
> +		if (!new_compat)
> +			return -ENOMEM;

When you compiled this, did you get any sort of warning? As you can
see above i2c_quirk() is a void function.

    Andrew

