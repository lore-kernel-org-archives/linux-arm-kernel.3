Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9118CD5C0C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIXKP+RHW4XCjdsq76k5coFeMmA2KINbHEm689Ip5fU=; b=GKe9COxondX0SP+fzJ9ea/8jB1
	WlsC1h8mSUKG38ZwVLmCZQy6P3guKX+ucY1tmEyjOLhzg5jdHlF9FFiEmS3v/3BUL3oCIO7X1KxQ1
	MaO8SkKlnKSB6a62vVRwZ9SHuyyvfMZuQDuqA4ve6xDd/bnzmUDQ3/5W1SgViu4DF/iWMlCLEsIFx
	mc02W0L2gSWp760gVIlKmvuARV/lFJd8qe2WQV3H6Mqhk4axJKNtGpDToL2MeRhMl7a5y8Cpe1Q0Y
	EBZBMEYVK35sEmsLTnnwbYyzvQYvOycv4BTWfXTCt4Cue6K6IyZJKeALELL5OgfUrhe1/qSuIVJbO
	VdWtISCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PBi-0000000Ai6F-42z0;
	Fri, 08 Nov 2024 13:38:10 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9P4g-0000000Agq0-0rEb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:30:57 +0000
Date: Sat, 9 Nov 2024 00:29:12 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1731072651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UIXKP+RHW4XCjdsq76k5coFeMmA2KINbHEm689Ip5fU=;
	b=Tb5YOYZtj1JEeci4IP+D3ftq3ruIwUPUHeJ8qPzlbNcF7xnPlBBSs6hOMFNjZGrcenze6h
	zHvPkaEqTsl8VjT2uU85t69ZM79EKJH5FkgoFUXwkmMDAp56dgOs8SUlc+Y/bG6NggMUXj
	FyAU+M+ZmtWY1eXU/07Zu7dyQneaZ/qEfLBhuCuobk3bP14vC80Pdu2sBD8p8rszkjN7WK
	vZ+pBO81+zvuphinfTKzhtSq4RJy5zD83Pj/c1rnMd91P3C4v7t2jzysDJm+K8zEswXgJk
	xpdCkiL65jh+aWAcW/02ihU+aIsALl68B0xGSbQryn2QzBjFeamzOa/6MMRO2w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <Zy4SKCBwce3q0yj5@titan>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108115357.691b77b0@donnerap.manchester.arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_053055_167914_C42AB31C 
X-CRM114-Status: GOOD (  22.95  )
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

On Fri, Nov 08, 2024 at 11:53:57AM +0000, Andre Przywara wrote:
> Hi John,

Hi Andre!

> Can you say *why* this patch is needed? Is there something broken that
> needs fixing? Where does this show and why wasn't this a problem before?

Oops, that's a good point. There is currently a bug where the LCD output will
be tinted. I have full context here which I should have probably linked in the
patch description:

https://lore.kernel.org/linux-sunxi/Zn8GVkpwXwhaUFno@titan/T/#u

> To be honest, given the isolation on this patch, I'd rather wait for this
> full fledged solution, especially if there is no pressing need (see above).

I'd be interested to hear if that's still the wanted solution given the link
above. This currently blocks many people from having working LCD output.

Doing it the proper way might be overkill for now unless someone deliberately
tries to run two DEs to the same output. I haven't seen this use case.

Allwinner kernel fork initially sets them up to values like these then makes
sure both DEs can't be set to the same TCON.

> > -	writel(0, regs + TCON_TOP_PORT_SEL_REG);
> > +	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);
> 
> Sorry, but that looks weird:
> First, please explain the 0x20. Is it bit 5? If yes, what does that bit
> mean? The commit message suggests you know that?
> 
> And second: the comment above clearly states that those two writes just
> *clear* some registers, to have some sane base line. So please adjust this
> comment, and copy in some of the rationale from the commit message.
> Explaining things in the commit message is good (so thanks for that!), but
> having at least some terse technical explanations near the code, in a
> comment, is better.

Bit 5 is value 3 of TCON_TOP_PORT_DE1_MSK. The R40 datasheet explains the
values of both masks as follows:

00: TCON_LCD0
01: TCON_LCD1
10: TCON_TV0
11: TCON_TV1

So this sets DE1's input to DE0.

> 
> Cheers,
> Andre

Thanks,
John Watts

