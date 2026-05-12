Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A79ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPt8aqJjigRU2CZSpEcU4uvqllHbLP1OAV/T78Qqolw=; b=c9PfYeTN+wqz+B7NwbGefPvuex
	5/K8W+0h+pXUeWCRTpj/wDbCNKtc6xCQSQa8b8v3rt2iBeMbkmWacNfCK1XQCuGoDgcO5iZ4fWhPL
	xnYdAGrDA3QADS2rdA1UbdV6Y0Zq+y5Vfle1GnJILnN1EeXRwzKNY/QQmf1BXDcyryNa0rt9GB0TP
	9Ir51favtBwcLQFaAbpClvII+SXtspaMq1HV7aD2r2PEFHR1CPfV8hpU3IAgh3X+68SLT+BWzINlb
	EMxWsx/xvHa99rpkKzRDRc+73ou0AmfDxV20vzK9u3V/99WCe/2WemNk4zNzURygd/wAnv/JYh/P2
	jcHWyOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMldy-0000000GbnF-0SwQ;
	Tue, 12 May 2026 11:51:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMldv-0000000Gbmk-1ZOE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 11:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51D6841A15;
	Tue, 12 May 2026 11:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B77C2BCF5;
	Tue, 12 May 2026 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778586678;
	bh=WwtAEaqrbtuEVAX/vXP89IUrWEza728BCI7n+J1nGLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mMQZJaJLv45V6KsaO3pklTKlKQhPyIF11vtRvSavicYEwqAvBXa3tsFr7d1ioRk2H
	 lAtjgai6EQQznJp4zj9Vqt6nI27MNmRyD+lwlA3wDus8TgdfGRWaRqdb0F9mWEjd6s
	 KkPxGUcHTGwCsWtu78pc4XDIjmzuZ4svCZjpyuHyDtm2sYzuNYTrXWAlhJe+yiu7V5
	 A9wY4seQs0kv3daJ7hzNOswDVlld81RowGlbTTfzeH9PUx45a5CZNkzyvwtJUgIhqU
	 gJpHpOFm2o9JyfoLOjyvA5GGoiaL0syM9dvfU/RJooD+Pt1+fjS2J7iVtugQgItIEL
	 8PcJtJG17a+Fg==
Date: Tue, 12 May 2026 12:51:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maksim
 Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
Message-ID: <20260512125106.718d48d9@jic23-huawei>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-2-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
	<20260510-sunxi-a523-gpadc-v1-2-4f6b0f4000fb@mmpsystems.pl>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_045119_440625_6B0497E1 
X-CRM114-Status: GOOD (  18.46  )
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

On Sun, 10 May 2026 14:57:23 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

> A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
> clock and module clock.
> 
> Change driver to enable all clocks.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
I'm expecting this to change given comment on not being quite compatible so
I'll wait for v2 before reviewing.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/sun20i-gpadc-iio.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
> index 861c14da75ad..dd4c7e6e3d76 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -180,7 +180,7 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
>  	struct iio_dev *indio_dev;
>  	struct sun20i_gpadc_iio *info;
>  	struct reset_control *rst;
> -	struct clk *clk;
> +	struct clk_bulk_data *clks;
>  	int irq;
>  	int ret;
>  
> @@ -205,9 +205,9 @@ static int sun20i_gpadc_probe(struct platform_device *pdev)
>  	if (IS_ERR(info->regs))
>  		return PTR_ERR(info->regs);
>  
> -	clk = devm_clk_get_enabled(dev, NULL);
> -	if (IS_ERR(clk))
> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n");
> +	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
>  
>  	rst = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(rst))
> 


