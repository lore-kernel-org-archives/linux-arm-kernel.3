Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FCCC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 03:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p37WslwqTFupVnWRtqZCqX3Mp6C7WdJ7OYa7IZcx95c=; b=Z4L0xBBL2HAODdIYFmpfIckVxG
	sG7SXRZE0ZfpOmKOKeh0MGX2lujqoMyxA09WDhE+itdsUyhmq76EPwVApoKIILhYkdRmjTxY+0WhM
	Ii9TLlehMQuqMU/Epg9uCdlaZUddnHo+d1VHQ9r42HedY9zeXPtnUcHld3sJT+RGTznGYrJ3z5bvI
	4URFOBnX3L+9iO0WtDbZ3mhTLGGQ1wt/YyfRkrIhe2Smc0a/ZvJkB0oYIj+aEg51fCyv19xqQyZG1
	rnzR0+WqwHTMKKYbO2cR470cRtBR0o3W7iOAB7kYDWaov/5q6Xy+Hdy2lC+GItk8EzPr8qtuVGKI8
	gd7bTZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72XA-0000000AVmr-1Ld0;
	Thu, 17 Sep 2026 03:11:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72X9-0000000AVml-0ywT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 03:11:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B27F34333F;
	Thu, 17 Sep 2026 03:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694AF1F000FF;
	Thu, 17 Sep 2026 03:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789614694;
	bh=p37WslwqTFupVnWRtqZCqX3Mp6C7WdJ7OYa7IZcx95c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SGKSNR4BNiuhH49T9JrWbbHOuGhiTLb1cXJdXzG4jnexsmtdIXJl3nTKQLLojFw/l
	 cpco9bN9dYkVlOCK7DqU0t6cbOr6pmoHz6TbCU3wJ3VV+Pvk52GgR94wvY3Z4AoMff
	 1F1iWLu3Ikd11dR5PIZ9Cvcp0j9yIzotetrW4ZpX0ZrNGWya8EQwSRBPBlPObGGV+D
	 wInEn4zq9vBS64HutZuFL8FFburZbtHB2+yBXzWOKbverFJhBwNlTumFFlofD9K0an
	 YvJzKygGesTc8b9HZzHjy9uukIOAq6wToh0VG8FnPw/ZeG0mVztPcbhoJyFNX1eUVp
	 di0tLs8GXuP2A==
Date: Thu, 17 Sep 2026 04:11:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, Eugen Hristev
 <ehristev@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] iio: adc: at91-sama5d2: disable autosuspend on remove
Message-ID: <20260917041128.6d10a2f6@jic23-hlaptop>
In-Reply-To: <20260914145339.00002f0b@gmail.com>
References: <20260914113422.1689331-1-lgs201920130244@gmail.com>
	<20260914145339.00002f0b@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 14 Sep 2026 14:53:39 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Mon, 14 Sep 2026 19:34:22 +0800
> Guangshuo Li <lgs201920130244@gmail.com> wrote:
> 
> > at91_adc_probe() enables runtime PM autosuspend with
> > pm_runtime_use_autosuspend(). The probe error path correctly undoes
> > this setting with pm_runtime_dont_use_autosuspend(), but the normal
> > remove path only disables runtime PM.
> > 
> > The runtime PM API requires pm_runtime_use_autosuspend() to be undone
> > with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
> > was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
> > set therefore leaves the runtime PM state incompletely cleaned up after
> > the driver is unbound.
> > 
> > Add the missing pm_runtime_dont_use_autosuspend() call to the remove
> > path.
> > 
> > This issue was found by manual code inspection.
> > 
> > Fixes: 75d7556ac0e4 ("iio: adc: at91-sama5d2_adc: add runtime pm support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/iio/adc/at91-sama5d2_adc.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> > index e8a5285bb6d4..e68632e628c7 100644
> > --- a/drivers/iio/adc/at91-sama5d2_adc.c
> > +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> > @@ -2487,6 +2487,7 @@ static void at91_adc_remove(struct platform_device *pdev)
> >  
> >  	pm_runtime_disable(st->dev);
> >  	pm_runtime_set_suspended(st->dev);
> > +	pm_runtime_dont_use_autosuspend(st->dev);
> >  	clk_disable_unprepare(st->per_clk);
> >  
> >  	regulator_disable(st->vref);  
> 
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Applied.

Please make sure to take into account both Joshua and Krzystof's
feedback that multiple near identical changes to drivers in the
same subsystem should be in a series.

Thanks,

Jonathan

> 


