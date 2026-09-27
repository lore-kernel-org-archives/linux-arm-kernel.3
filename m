Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A68C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKitTAlwTBExXI+cI2+8578Ap+v+wKyXIoUr5i+JPl8=; b=e39aIdD33WXT98fhV5k4sn98zn
	GBUxR8UNbY6C0SUqitaTLtuywOxnHdTkszDQS4YL8x5mamrPtEvFDQoPOz1/TUo6TVMC7idts3VZV
	yNVnr5tuh9qxIW6sRRrvkNjrf6Uh2m0G6JEF2ciFtv+178TC8HOFJjL/a7cnlyGNsXHnR0bpl9c2K
	GMUgL0eCwXwOMIklZaDUGdrBwZSWHs9lD0XO3hgtpzjOy5hkljfqx0SMVrGuxL897SII1UMaZTeaK
	Qs8Dl7//2V2nGtL13+P/1g8552i/WZNDfvLkeMshFPISEbQKnhycE/jN4VM5KOEp6tvMskU7UKVFV
	OiyRIUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAt60-0000000Gg2b-1xGq;
	Sun, 27 Sep 2026 17:55:28 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAt5x-0000000Gg2C-3qWw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 17:55:27 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887635e952so983481f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531723; x=1791136523; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nKitTAlwTBExXI+cI2+8578Ap+v+wKyXIoUr5i+JPl8=;
        b=oE4H4RPmZnXTTuuxTj3nJJvo5C7I8VivmK8rzc0U7NMjuBQ0wmwXTIGaZiKDTFu9Zx
         os5uxCMYYJxHYni4tpB1+c3hqzgvOExrowI7Qo3ZBIItn5v1B0ZvNyro/yoLcpxfKdK4
         7zHBrW455HBdHvPItGbdeeSf41Rdkbd0qBvjFEa8OGpMak23nSNTDqEI6spFkO0Zk+DE
         v+BAPJ900SseX0ZArPb/YfXW0dIwpof+dTJGS35PYUGGpwv45Ma+ej9pF77X+mk1S8gU
         nAroBLy3gaUC2qmO85eDvkEJA8FkzAbzq2089rHzYjJ79czOuROl9W24SCigv2wEwP8H
         Ju0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531723; x=1791136523;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKitTAlwTBExXI+cI2+8578Ap+v+wKyXIoUr5i+JPl8=;
        b=RXzl/I93Ieq2H6XOjK73Tq5KFHBfSnYONuaI9rvH5bjh7axGrQKlqRr0aXQAw7+McY
         9Xf2JnWog2VfiplDBVlq1FAlepTi3vhS+5lV5d2hI7dRJDVvAEmpLiv/R78WxKkD9viF
         3RdrL1a4c5MkDXoJLFDQoRY0g5ZgfA6seGazVqdERMyD5aqR6A2sQjbLxy/JkXpNYJyD
         tlFsPP8aVqe+MB9Hl13oMxRhg5nJBo+tYGo0JJFgLS0fV8WtYSw2oBC1G4ryU3J+loT4
         9Vo1S1XsIZ8msCysZZ2fYP6hlnVbIp/2lUHFFjBRumMbJXAywVcPHdNNslyIJWfVGS60
         ZDIw==
X-Forwarded-Encrypted: i=1; AKwUvBxMv1/HWYU7W2/QCuumg6GUlgek8nkM0aB0tl3qYeiSM88ZGyP/4UDoPkMEurZPkM4fIXlRydkj3FSbJcOmYDOd@lists.infradead.org
X-Gm-Message-State: AFq9FYIxpCBFes9R3Dpe8C42KvEFIlBfuHc2Z9ChrNJIBBBSeDo2JPFQ
	LhiFyZTR4HlzUvExp39DejdpRP9YXgBvHFF8y4qKPguyOuYsS3sqYQWE
X-Gm-Gg: AYBFou36eSkhvsRvR4jA+Q0STrLrH55ngsbCFezOW4cgYXgXCnIB/OCNqrd+D0vYne0
	XNMAs6HkFtx4fdCMQ3bDc0DQ6Uy7BF6G3A844NSRtzkrtY+gBvEDnNK+BzN6p4QW5YJRQsdXvJl
	zzhytsrM03E+rwKnYxGP+kcU9sJMZ7E1Ba4zBTu2EQgrhD4P21Za4No/YuKgixHdSe1huzibaoO
	kzVO198Rie8U3ABbR+7bQaJvLcBj6wqQv0Mwon/ub1KWiqT2INf+XdJo11/LKBPgTWXhtYxCr2Y
	451WvZpRygg97tBhV9LaAuCFZumvxpD1gDcuqiw9o/revz8HO9/SnOWo+z5D8af/xOuW746VmKv
	KVT+jytk0s3QCO6yfye9bkmVA+gZsJ2BQJFDNcsFEuboru9joM1OsYhIh8LE03XRRSIpKUwSyMy
	5dbuTllTDMvQmVWtXglxf7Q9XHCbhbXL7KDN7xx53TbfVl3B0/psvir3ZLYlMNXwcrSG3Fz76PM
	HApfVHadaTSY3qakgc0S7XpuqoUSp6Bdow+tpBxR6wOAcFMX5sDnfjzRH4GkFOEgJ92J2Sdqwl/
	/zmnK52d+SgwhfY0LbUDylm/J01OuAglxmLKU4nIh1HuLR/brt+Lh7vwfINfdIRgQWuObqE1AqO
	5GTM33R5nXo8wHJcnroFaTa82zRWcejc=
X-Received: by 2002:a05:6000:468c:b0:488:76f5:c7d with SMTP id ffacd0b85a97d-48876f50d2bmr11484821f8f.6.1790531722779;
        Sun, 27 Sep 2026 10:55:22 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm22726735f8f.4.2026.09.27.10.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:55:22 -0700 (PDT)
Date: Sun, 27 Sep 2026 19:55:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, Eugen Hristev
 <ehristev@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] iio: adc: at91-sama5d2: disable autosuspend on remove
Message-ID: <20260927195519.76c2885b@systembl0wer>
In-Reply-To: <20260917041128.6d10a2f6@jic23-hlaptop>
References: <20260914113422.1689331-1-lgs201920130244@gmail.com>
	<20260914145339.00002f0b@gmail.com>
	<20260917041128.6d10a2f6@jic23-hlaptop>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_105525_980558_F8A52E4B 
X-CRM114-Status: GOOD (  26.30  )
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

On Thu, 17 Sep 2026 04:11:28 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon, 14 Sep 2026 14:53:39 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > On Mon, 14 Sep 2026 19:34:22 +0800
> > Guangshuo Li <lgs201920130244@gmail.com> wrote:
> >   
> > > at91_adc_probe() enables runtime PM autosuspend with
> > > pm_runtime_use_autosuspend(). The probe error path correctly undoes
> > > this setting with pm_runtime_dont_use_autosuspend(), but the normal
> > > remove path only disables runtime PM.
> > > 
> > > The runtime PM API requires pm_runtime_use_autosuspend() to be undone
> > > with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
> > > was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
> > > set therefore leaves the runtime PM state incompletely cleaned up after
> > > the driver is unbound.
> > > 
> > > Add the missing pm_runtime_dont_use_autosuspend() call to the remove
> > > path.
> > > 
> > > This issue was found by manual code inspection.
> > > 
> > > Fixes: 75d7556ac0e4 ("iio: adc: at91-sama5d2_adc: add runtime pm support")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > > ---
> > >  drivers/iio/adc/at91-sama5d2_adc.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> > > index e8a5285bb6d4..e68632e628c7 100644
> > > --- a/drivers/iio/adc/at91-sama5d2_adc.c
> > > +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> > > @@ -2487,6 +2487,7 @@ static void at91_adc_remove(struct platform_device *pdev)
> > >  
> > >  	pm_runtime_disable(st->dev);
> > >  	pm_runtime_set_suspended(st->dev);
> > > +	pm_runtime_dont_use_autosuspend(st->dev);
> > >  	clk_disable_unprepare(st->per_clk);
> > >  
> > >  	regulator_disable(st->vref);    
> > 
> > Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>  
> Applied.
> 
> Please make sure to take into account both Joshua and Krzystof's
> feedback that multiple near identical changes to drivers in the
> same subsystem should be in a series.
> 

FYI, patches like these will become redundant as I have a patch adding
this to pm_runtime_reinit() so driver core calls this automatically on
unbind queued for 7.4 [1].

[1] https://lore.kernel.org/all/20260919-move-dont-use-autosuspend-v1-1-f6e2d1315c23@gmail.com/

-- 
Kind regards,
Joshua Crofts

