Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA86D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GJ5E8z9IAG02tIa6zRu8hniKsaqoJVZeW93ACvhTNk=; b=Q+SSJF25cHzSgHw+9mGeB6K28X
	kOvXZ7DTM0heINjvUe8r5DAMCLCCE6/rJU+kBzxpNVAND5TvmS6SW27dBQ3/R663ltjjWXaSwJEPc
	+q7NWHQuwKD28s8yoMnKr6WxCL0D+ZrOFzcHbBvWKht+0AY9cFTTyKKCuk44fGefFoa1EIwFdUuIk
	e+KfC/THti56yaUjq/s9WeglDb/khc0WdWghUHK4lWvWe7JcZgZh4gBc8gT3Pt2P6Nd1k2pj/blnX
	Qo5yR+olcSr1s7SrKZHpWLDK2mZ8pnRCc06tjWGrvVDEy7o/bWEq6x5Ibbqgc54XIk3YCARLtinvo
	gtH3pQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fL0-00000003G8y-4Aiu;
	Wed, 06 Nov 2024 12:40:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fBq-00000003CWW-2nKe;
	Wed, 06 Nov 2024 12:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730896273;
	bh=A90cgTlUFFZc5KiS7CX3bzI9MZt05fj3oUZ7b1bgZxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NyTq7xisbYlabWUUc2K6qfI2wmbfSFW3KysBoZPNfPboGrQNmJk9AZRBVzMofpnYg
	 FuK93OA5HA3VEPgysk6Gu7wOzc3tmnUnEcT+H7PKR+iBYtrD6e7a0Tp8U9gZSUBEdD
	 f3/YBkGJPcL4P2dK+wbxFuWgEK2UHpmC3dI7Z4AmYFMmvAorQfSO4CwVFMXJkqpq/C
	 /cbJOc1ufSCCmMDFSUlexp6/LXd3m5iAuGki2yHxGWsPAhOLzj0LCt6WGQmEGRev5z
	 rkqxrbszgEAji/rmNeIqa8CJx4nCD51II/TI29DicPLOy550PMnsul9qLff86pwgkv
	 FvU6E7Vvb6VIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7A7817E3629;
	Wed,  6 Nov 2024 13:31:12 +0100 (CET)
Message-ID: <2bd7a02d-c5bc-4926-8aee-0eed6eb490a2@collabora.com>
Date: Wed, 6 Nov 2024 13:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] watchdog: mediatek: Fix mtk_wdt_restart
To: Yassine Oudjana <y.oudjana@protonmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
 <20241106104738.195968-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106104738.195968-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_043114_906670_F610CDDF 
X-CRM114-Status: GOOD (  16.92  )
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

Il 06/11/24 11:47, Yassine Oudjana ha scritto:
> Clear the IRQ enable bit of WDT_MODE before asserting software reset
> in order to make TOPRGU issue a system reset signal instead of an IRQ.
> 
> Fixes: a44a45536f7b ("watchdog: Add driver for Mediatek watchdog")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

I'd be more comfortable with a title like:

watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()

or along those lines, saying what's this commit about, because a generic
"fix" doesn't really mean anything...

About the commit description - that's good.
Btw, I wonder if maintainers can fix the title without you sending a v3...

Anyway - you can get my:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index c35f85ce8d69c..e2d7a57d6ea2e 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -225,9 +225,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>   {
>   	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>   	void __iomem *wdt_base;
> +	u32 reg;
>   
>   	wdt_base = mtk_wdt->wdt_base;
>   
> +	/* Enable reset in order to issue a system reset instead of an IRQ */
> +	reg = readl(wdt_base + WDT_MODE);
> +	reg &= ~WDT_MODE_IRQ_EN;
> +	writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> +
>   	while (1) {
>   		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
>   		mdelay(5);



