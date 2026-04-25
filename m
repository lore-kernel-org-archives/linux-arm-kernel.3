Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3721BFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpmB/hlNnXbYecxtmhYN/4xhpumBsob/Ury7LiUFdhw=; b=xHzWt6iaDwIdkKm1sD5SdlTa1/
	Fox3gGah2yHMIiNmD29B8/Vsi8GS+y4EqwuZXlKINAmcuUu+Vc9QaZux/AXAmr2frCY5KzXz8hO9M
	4ZRyqVRBfBvqWxiuMU5e7peU3hgovEAP3d/6tPcz3o7Z0KxlBIvROhb+MoYfqAd5MUTGLFxSLiR41
	ttUn/ZjLEe4bANmLId0OODW6BFlAlaARlioyLf6v7DsIjsKkowdFqN7gyoGaXuG+un20Mdxrx/+kp
	CjQOtuIKF9m1DFPqT6UaZL8yYN5XfvRw4+ZXTWZDTU90YtG/2mRmuftN6P4NTGiin8bYUykb5Z+WG
	DKVsw+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhzO-0000000Eje9-4BG6;
	Sat, 25 Apr 2026 18:44:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhzM-0000000Ejdt-2lbZ;
	Sat, 25 Apr 2026 18:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A688B60052;
	Sat, 25 Apr 2026 18:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE0DC2BCB0;
	Sat, 25 Apr 2026 18:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777142663;
	bh=hn1z0b4zV4WFbjbMYJCntmVWjUXd67V4CvRoUKBAu0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tJQo1X9qgCqTDOi7MqNayuOZ9xsm5pwykysVI8u9GxrhhKgvaoTyKRG4mDnTWynaI
	 VXAJN4KYYtQxQwxoBTrvmCCQNf7mCreJ4e9IufGej2Ny3P+oLoc2rwxa5LirQvpwHK
	 htQfPPy6cuqnMygg/gDzEHE5fNzFPO7ZKdgeYPaFCdSIjoD8lughcd0uZNLKbw1vWn
	 s+9jlG4xocgsoRlEdcnf00kj9MyH+Yy3m/VMHLj3kdGYpM8qJ5rvyqsZja7dIEybW9
	 J+0RChqDl/GbDqYQF/F7pb4X5kw0Sv8lvBCacWlf+cxo8/IS2YAtZ7OFhO+freqBS1
	 kZV/4tSoj3F5Q==
Date: Sat, 25 Apr 2026 19:44:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Felix Gu <ustc.gu@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rosen Penev <rosenp@gmail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
Message-ID: <20260425194412.1872eff8@jic23-huawei>
In-Reply-To: <84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com>
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
	<84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com>
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

On Sat, 25 Apr 2026 11:17:18 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 4/25/26 11:07 AM, Felix Gu wrote:
> > meson_sar_adc_temp_sensor_init() allocates a buffer with
> > nvmem_cell_read(), but the old code leaked it if
> > syscon_regmap_lookup_by_phandle() failed.
> > 
> > Switch buf to __free(kfree) so all return paths release it.
> > 
> > Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/iio/adc/meson_saradc.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> > index 23991a3612bd..9708ddcc4919 100644
> > --- a/drivers/iio/adc/meson_saradc.c
> > +++ b/drivers/iio/adc/meson_saradc.c
> > @@ -786,7 +786,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
> >  static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
> >  {  
> 
> Nice to see one of these cleanup.h patches that is actually fixing a bug.

It's not fixing anything as far as I can see.
The syscon_regmap_lookup_by_handle() is earlier in the function and
nvmem_cell_read() isn't called if that fails.

So this is just a code simplification and so small benefit if anything.

Maybe there is an old version that does things in a different order?


> 
> Should `#include <linux/cleanup.h>` though rather that relying on it being
> included through another header.
> 
> With that fixed...
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 


