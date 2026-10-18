Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1942CCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3vg7IqzjZiEQ62NPia2RyXT3ORHAoyMO+p50jGOtZw=; b=YJj6JH4iyh1MtIe83UpFMovRD/
	ArA+Mchjf/RwfMeOf7ukjWwPAxWKj/tdHVKJcu/93IrjUHVtASIzyjcbSksKkPfm67jjAOXNnIU1p
	gCzPThsMGxnBcqt8bgEFGhGOEc0hRDzHScc34ycU9HnWwinUxqYqEAvpQrtMIHCv7mzGFz4qpdyhM
	Fnvl7gvbBAPlF/ExKuQ/MwKA0B09gxcM+gbtgkQ3lHYhfdKRngZpLMWfS1anTku/i//ic/LTHA7AB
	Ll9gDpn6wJ/7Qr0yFG9/ajJnuV+qn6OnSPvmYZP4Y+WwhCc2nJxPaiS0tJJdeS4BXrM/UD9XWekTQ
	ZMBmzGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIXNP-00000006Cd9-11Qj;
	Sun, 18 Oct 2026 20:21:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIXNN-00000006Cd1-3n6E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 20:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51D364012A;
	Sun, 18 Oct 2026 20:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8DC1F000C4;
	Sun, 18 Oct 2026 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792354861;
	bh=K3vg7IqzjZiEQ62NPia2RyXT3ORHAoyMO+p50jGOtZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DN42uhjssBH86VQizcq5jBM/pAM5XiupkNkSlWnHTZxjUsb17kYByLHKkxkkceroo
	 Ospc1wcLZnHmMoXh1HlQRyFFxqPGFFU7JM6McYvhA5pIvd4QC5En9m+/bv78D9AbM4
	 VSPnCQY3CvOQ+E5u0Pq585FUTBtl5lnIZ1dxUDGTy676NAnSUxOUA5bOZo8mAE6hG8
	 tERVSLls3RlCTRXt2jduw6obubdpKJzCfP8d2e6wSMtNZ496KeFMxiUHml7n0uGFBG
	 fZhlV6uCZfK7c7TdDI5YZs421v85yOpSn6eua6appsTGcMuVrwpQLq8WjwkwY3t3/e
	 5xeOZjueFgFRA==
Date: Sun, 18 Oct 2026 21:20:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Brian Norris <briannorris@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, <linux-stm32@st-md-mailman.stormreply.com>, David
 Lechner <dlechner@baylibre.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <linux-kernel@vger.kernel.org>, Fabrice
 Gasnier <fabrice.gasnier@st.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/5] iio: adc: stm32-adc: Drop runtime_idle()
Message-ID: <20261018212053.66b7ba14@jic23-hlaptop>
In-Reply-To: <39d56818-922f-488e-842d-19a194654921@foss.st.com>
References: <20261002230714.507921-1-briannorris@chromium.org>
	<20261002160309.5.Ica1e32ae51d7975844386684d2b6a097f3ca9122@changeid>
	<39d56818-922f-488e-842d-19a194654921@foss.st.com>
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

On Tue, 6 Oct 2026 14:42:51 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 10/3/26 01:03, Brian Norris wrote:
> > This runtime_idle() implementation was added in commit c537d3457542 ("iio:
> > adc: stm32-adc: fix runtime autosuspend delay when slow polling"), to work
> > around a suboptimal behavior in the runtime PM core. It should no longer
> > be necessary as of "PM: runtime: Propagate last_busy from dependent to
> > dependency".
> > 
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Cc: Ulf Hansson <ulfh@kernel.org>
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> > I do not have these devices to test. I have tested other drivers, and I've
> > verified this behavior in unit tests as well.  
> 
> Hi Brian,
> 
> I've been able to reproduce on stm32 earlier behavior by applying this patch only.
> With the full series, so far, everything seems fine from my point of view.
> 
> I haven't deeply inspected all the series, at least for the stm32-adc driver, you can add my:
> 
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
I'm fine with this going through whatever tree you like
Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

It seems unlikely to cause merge conflicts with other changes
to that driver, but might be worth an immutable branch, just in case.

> Thanks,
> Best Regards,
> Fabrice
> 
> > 
> >  drivers/iio/adc/stm32-adc-core.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> > index a42d82d61cb8..e9e113a46ccf 100644
> > --- a/drivers/iio/adc/stm32-adc-core.c
> > +++ b/drivers/iio/adc/stm32-adc-core.c
> > @@ -836,17 +836,10 @@ static int stm32_adc_core_runtime_resume(struct device *dev)
> >  	return stm32_adc_core_hw_start(dev);
> >  }
> >  
> > -static int stm32_adc_core_runtime_idle(struct device *dev)
> > -{
> > -	pm_runtime_mark_last_busy(dev);
> > -
> > -	return 0;
> > -}
> > -
> >  static DEFINE_RUNTIME_DEV_PM_OPS(stm32_adc_core_pm_ops,
> >  				stm32_adc_core_runtime_suspend,
> >  				stm32_adc_core_runtime_resume,
> > -				stm32_adc_core_runtime_idle);
> > +				NULL);
> >  
> >  static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {
> >  	.regs = &stm32f4_adc_common_regs,  
> 


