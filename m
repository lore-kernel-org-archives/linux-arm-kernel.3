Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD449EE0AE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAYqk4DRnLJySzZvJ+CbI3KuexRezXL2JdrRdPMpeQI=; b=Hep0iGNeKFJF4F/M4ouUTO6JK4
	FfE7fm5/YUXA28y/YsX7DW14cHcbNxc1uYUTsiAlM/NVOsBna5Z2/WAbJ1xQ4mzjce5oZXQiyYggf
	Ix4m8Ce+F/F/tk9DRSBqlFiSCA/diGKCIiHxKEu5fP+zpYr/UplczmTw6a76rlKSd6kx0GtmYsC0h
	A1Hy6QfEclts1Jt6o6fSjv5Sr2GGfL1qEwkCPbFg1DozuafgJIXA6WcYs6yS6ftMawRjqquF9FNxq
	Y7DOdRJOJPOB7hjN4dtGxJgo9FS7AT2t3Wsdc3DFOOUHk4wAWf3Sj6xa/2CPrDP2mSqfEmy6NjQiI
	UVw0CAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voplm-0000000Cmbn-2JZM;
	Sat, 07 Feb 2026 21:23:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voplj-0000000CmbQ-47FA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 21:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19BDC41A48;
	Sat,  7 Feb 2026 21:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C30C116D0;
	Sat,  7 Feb 2026 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770499383;
	bh=WbQjMhOPtfr910QnshnlTPVJ9QLKcXL9+3iN1npfDkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U4sh1Dr+33+z2Az4uQQxZlCV185e+HSGN69pUjK+oAu6xX5lSpfOqk2Uk1JbEYue6
	 xoRKzNQ49/AilbKlwUrgxnogdzN+HHNwgGIW1x+nNdCKGCapzLXO/Vb8gWZY4YEpaL
	 sBiVXDZxRTJ1GNZwaxvwWAbHe4j6sdl+YE6uxqYmE+gN5y5FamH5cklisvr3PGkgVq
	 GtB0ILwj09xwIn4nZEXm+3X2z3HjwX2KbAoIYbWb6EvmedV1t7uaX/A3Np3bUUVDPA
	 oBhylSMw7KGelu550GrblwHyOP+nyPcvMFFMnYnn+8Y1zNogvRzVL1w/LUIXTJl6tF
	 8f6NcP1140CzQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] irqchip/gic-v3-its: Limit number of per-device MSIs to
 the range the ITS supports
In-Reply-To: <20260206154816.3582887-1-maz@kernel.org>
References: <20260206154816.3582887-1-maz@kernel.org>
Date: Sat, 07 Feb 2026 22:22:56 +0100
Message-ID: <87h5rsb64v.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_132308_040965_68888D4E 
X-CRM114-Status: GOOD (  10.21  )
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

On Fri, Feb 06 2026 at 15:48, Marc Zyngier wrote:

> The ITS driver blindly assumes that EventIDs are in abundant supply,
> to the point where it never checks how many the HW actually supports.
>
> It turns out that some pretty esoteric integrations make it so that
> only a few bits are available, all the way down to a. single. bit.
>
> Enforce the advertised limitation at the point of allocating the
> device structure, and hope that the endpoint driver can deal with
> such limitation.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org

Can you please provide a Fixes tag?

Thanks,

        tglx

