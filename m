Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD3EC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 04:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+gJeU2dc10TfJV4Gm5lOdGKUdKdZ06S42Vqs2ccrTI=; b=oWgmOXoxh6WLqioVMHDoRV5AA/
	Njb9SZBwEXFqL4d03ywiGB4ft05ySidVBxiudMz81GTr0VLyjEgDMruhUy+CcPzS4ewBsYHC8NJz3
	yG+QwqWk9TDC2SHK0LI2z9DCCmoMszvCf4gocFnscPNiu4nNqXFoTOD4oHzu1kEWTW9n2dLIYbk3O
	Ov7dTofLn4uF5tGqfvT0MtS+y+xwkGbF4WazN7puAA8iPqZJ6kvlxj9sLFG+qmV8inXCVQdLv7M++
	9i+o0Z1vjAtelDN82QgDhAvmkCxiW/TgW0Vkc0TYY9/S3Hidap89uM4b87VDcyyljwxbszWuBt7T+
	EOafTGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz5N7-00000001t38-0hD8;
	Wed, 26 Aug 2026 04:36:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz5N6-00000001t2x-0D43;
	Wed, 26 Aug 2026 04:36:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 52A1D437B6;
	Wed, 26 Aug 2026 04:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7EC1F000E9;
	Wed, 26 Aug 2026 04:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787718979;
	bh=T+gJeU2dc10TfJV4Gm5lOdGKUdKdZ06S42Vqs2ccrTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S6cdIBw8TwHvQD8GPFRr78Ke1orCC5v2BfndzPKmYejPOHwCEDMlCuqUirhYwx1X9
	 Wk4sRbTWZoxI8wN8jG6QLGAe2jzeVgZ5b8rMIQQx34JjsN+HoA4/GsDEA0fIQNQZ2m
	 2s09Xa+aj5L5ZAA5LFWgf1UrY8pNFir8e2meH2fupUDmWY3zHK5vVmIkYs42Dpw4HJ
	 QEyV7yva3TpHU++kdi7CUraRcHBR6fh0Xp2uXQlfWwNG/hS3tWxJL7/YIbqd4OChsY
	 MLqslnJMk9lcwpnK/pL1PEnecNKmVa8WSiDmL1483H1oqQd95ro/9llpZwFQeent+l
	 PnyxBzGVuSPgg==
Date: Wed, 26 Aug 2026 04:36:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Wanming Gao <wanming.gao@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wallace.yu@mediatek.com,
	Jarried.Lin@mediatek.com, vince-wl.liu@mediatek.com
Subject: Re: [PATCH] watchdog: mediatek: Enable pretimeout support
Message-ID: <ao5tP40Wi-9jJgKk@google.com>
References: <20260824132914.2662346-1-wanming.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824132914.2662346-1-wanming.gao@mediatek.com>
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

On Mon, Aug 24, 2026 at 09:29:12PM +0800, Wanming Gao wrote:
> The watchdog pretimeout interrupt needs to be deasserted after the
> hardware pretimeout event is received. Add IRQ level control handling
> to the MediaTek watchdog interrupt handler so the interrupt is cleared
> before notifying the watchdog core.

This could be clearer.  Please merge this with the third paragraph to
explain the why rather than just the what (e.g., explain that the hardware
uses level triggering and requires an edge transition to clear the
interrupt, if that is the case).

> Serialize all WDT_MODE read-modify-write operations using the existing
> watchdog spinlock. Initialize the lock before registering the interrupt
> handler and hold it across the complete 70us IRQ level toggle sequence.
> This prevents concurrent watchdog start, stop, or pretimeout updates
> from overwriting the temporary IRQ level state and disrupting the
> deassert pulse.

Please expand on the why here as well.  The 70us delay specifically needs
to be explained in the commit message (e.g., waiting for the clock domain
crossing to the 32KHz clock).

> 
> This avoids leaving the watchdog pretimeout interrupt asserted, prevents
> a potential interrupt storm, and allows the kernel to handle the
> pretimeout event properly before the final watchdog reset.

As mentioned above, please merge this with the first paragraph.

> 
> Test: Boot ok, trigger watchdog pretimeout case and verify the
>       pretimeout interrupt is received and handled before watchdog reset.

It is expected that patches are tested before submission.  Unless you are
specifying the exact board/platform you tested against, please drop this
section.

> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
...
> +static void mtk_wdt_deassert_irq(struct watchdog_device *wdd)
> +{
> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
> +	void __iomem *wdt_base = mtk_wdt->wdt_base;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&mtk_wdt->lock, flags);
> +	reg = ioread32(wdt_base + WDT_MODE);
> +
> +	if (reg & WDT_MODE_IRQ_LEVEL_EN) {
> +		reg &= ~WDT_MODE_IRQ_LEVEL_EN;
> +		iowrite32(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> +		/*
> +		 * Wait for two 32KHz watchdog clock cycles so the
> +		 * hardware can latch the IRQ level change across the clock
> +		 * domain.
> +		 */
> +		udelay(WDT_IRQ_LEVEL_SYNC_US);
> +		reg = ioread32(wdt_base + WDT_MODE);
> +		reg |= WDT_MODE_IRQ_LEVEL_EN;
> +	} else {
> +		reg |= WDT_MODE_IRQ_LEVEL_EN;
> +		iowrite32(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> +		udelay(WDT_IRQ_LEVEL_SYNC_US);
> +		reg = ioread32(wdt_base + WDT_MODE);
> +		reg &= ~WDT_MODE_IRQ_LEVEL_EN;
> +	}

Is the main purpose of toggling WDT_MODE_IRQ_LEVEL_EN simply to clear the
interrupt?  Since the value of the bit doesn't seem to matter.

> +	iowrite32(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> +	ioread32(wdt_base + WDT_MODE);

This read deserves a comment.  Otherwise, it looks like a NOP and might be
accidentally removed by someone in the future.

> +	spin_unlock_irqrestore(&mtk_wdt->lock, flags);
> +}

The function can be simplified a bit, e.g.:

    /* Trigger a state change */
    reg ^= WDT_MODE_IRQ_LEVEL_EN;
    iowrite32(...);

    /*
     * Wait for two 32KHz watchdog clock cycles ...
     */
    udelay(...);

    /* Restore to its original state */
    reg = ioread32(...)
    reg ^= WDT_MODE_IRQ_LEVEL_EN;
    iowrite32(...)

