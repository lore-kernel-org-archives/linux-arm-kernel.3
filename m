Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBC5D43341
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA0jUHSzGLEeakYdzs78ouYDwaL+21dHuzRZstf4Flg=; b=licOoeyuJG+y0jlb+FswIiV1k1
	VwBZpjuAEDcBZaxB5kUR0gdoMoSOiHqGHQofECdVreqlmm0KSCxHDJzzk1NNx7kY/V/p86jhSHQI+
	1bUKNXGDj3CGYx+k19m/43mkOBQ3t5IN4QgNfd9Nj+6m3VxvVJ6hbXnjbxdbV/IqUVVuVxuEGR/wF
	pXubUxYI+M2O0W+rHkU9gefZpdteqa6/AWmW1s4Umr3ZL5QPQqVqZMUinEJ+mXaSpKwzKSS3qijYj
	++gHLQvDO2LB4FfGwbwjaX2NNv8TR3SWwIWEgrKDgVhVGTeNy6me2FwkyFD/pCAnfN6XNvnzqoF0N
	Ibu9zggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90SD-00000006dkF-0LNz;
	Thu, 07 Nov 2024 11:13:33 +0000
Received: from www.linux-watchdog.org ([185.87.125.42])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Ms-00000006cLh-2gNk;
	Thu, 07 Nov 2024 11:08:04 +0000
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 7C90F40A9F; Thu,  7 Nov 2024 11:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 7C90F40A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730976040;
	bh=qm0sRgjyJYZCmmY/AhZSz8Z8fn4UGSfVYOCj0xQLmMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPRG8d3HYFQ0Avd4hWzXFR0pswWAUumDi+RYJTWINOPrlJpEj9MjYiA9uIdRtS4D2
	 5j2GbKZYMjLmQyWLx+Ryp5OMzp79ZJJeg/LNFXYrQ2s4Mmo19MfKx20mU/V5R6d8Ln
	 4nGMYvUB8vxv5Sp3HsQMT0JD8869hTIzuvFX+a/g=
Date: Thu, 7 Nov 2024 11:40:40 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] watchdog: mediatek: Fix mtk_wdt_restart
Message-ID: <20241107104040.GA5233@www.linux-watchdog.org>
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
 <20241106104738.195968-2-y.oudjana@protonmail.com>
 <2bd7a02d-c5bc-4926-8aee-0eed6eb490a2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bd7a02d-c5bc-4926-8aee-0eed6eb490a2@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_030802_848875_85A004BF 
X-CRM114-Status: GOOD (  17.87  )
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

Hi Angelo, Yassine,

> Il 06/11/24 11:47, Yassine Oudjana ha scritto:
> >Clear the IRQ enable bit of WDT_MODE before asserting software reset
> >in order to make TOPRGU issue a system reset signal instead of an IRQ.
> >
> >Fixes: a44a45536f7b ("watchdog: Add driver for Mediatek watchdog")
> >Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> I'd be more comfortable with a title like:
> 
> watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()
> 
> or along those lines, saying what's this commit about, because a generic
> "fix" doesn't really mean anything...
> 
> About the commit description - that's good.
> Btw, I wonder if maintainers can fix the title without you sending a v3...

I added it into linux-watchdog-next and changed the commit description whiledoing that.

Kind regards,
Wim.

> 
> Anyway - you can get my:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Cheers!
> Angelo
> 
> >---
> >  drivers/watchdog/mtk_wdt.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> >diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> >index c35f85ce8d69c..e2d7a57d6ea2e 100644
> >--- a/drivers/watchdog/mtk_wdt.c
> >+++ b/drivers/watchdog/mtk_wdt.c
> >@@ -225,9 +225,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
> >  {
> >  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> >  	void __iomem *wdt_base;
> >+	u32 reg;
> >  	wdt_base = mtk_wdt->wdt_base;
> >+	/* Enable reset in order to issue a system reset instead of an IRQ */
> >+	reg = readl(wdt_base + WDT_MODE);
> >+	reg &= ~WDT_MODE_IRQ_EN;
> >+	writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> >+
> >  	while (1) {
> >  		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
> >  		mdelay(5);
> 
> 

