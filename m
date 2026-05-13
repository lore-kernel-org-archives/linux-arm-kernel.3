Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91403CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyCK1a4Azw7zotShzprJBGPTGWYwyQAfEUdfOJBC1ag=; b=ZQWgoMi3qh/r3NVm/EH9uUs5YY
	8komaCzuBrt6AKVf+J93p2QFATz00k8KFUEEpsQcQUify5v33N03+aFfbvBdMvrnuBFLrqqlzBif8
	YUyQcKvvIA1g5xuBL+FWDk7M6HoMGBsRgNBvtIk9I0s1mqzKfSgnpQbfUn90/+fCOQjy2UA4uyC21
	wSPOwJMTwACnxqlmAfAi8q3FZPEuCkPuiGlrLf2ljj1juOzYB4Uo9dYXve9qtOzR/41O+oD64BUym
	hD5Da/WPbMlziUeRCvAfKlmM3nmakBFM8HfLecULbE/+mvGrAYsW2rGbW5rrvP3g9VbJhd53tOVxA
	hPYv24Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAFp-00000002sVJ-3Rw4;
	Wed, 13 May 2026 14:08:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAFn-00000002sUe-35nM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AC7340BEA;
	Wed, 13 May 2026 14:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8871C19425;
	Wed, 13 May 2026 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778681282;
	bh=UcCnX+hZhQbVEDIyzBzB508ARtnF3/FoxfXkEhQY/d8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=URinv1wdoSFbocNtRMotJr7U4dQDvjLcrLhC92vrR29B7glDq9U0AXgeDBf/jNcEg
	 dMNTgpdtKzh9fTDh5Wxr+Zz5ATDDsSQ49j+r154KpG3x/AhvPawlGDho/VNnk2cRBJ
	 00UK+kMQzsvQI9Xn4J30J/D9k0xpixlejDbJcpWzsDD5PDHEkTsY+EJLR5klKs3yxA
	 8Na3x+Yx9RfA9cKjs62qeZqe60AM9Rv0Pz7pZpXPcV1sVWtxOzU1wzx3ujV+w27B87
	 URNGuBZvuh9r77jAhuwtcyMGujSZWfPIakebqVcxq4YFeM5elVV2Fd9vTFKtUHPpXy
	 ffufUSuRYYSag==
Date: Wed, 13 May 2026 15:07:51 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 11/11] iio: dac: add mcf54415 DAC
Message-ID: <20260513150751.3305bf99@jic23-huawei>
In-Reply-To: <20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
	<20260513-wip-stmark2-dac-v2-11-fcdae50cf51a@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_070803_826917_003A6632 
X-CRM114-Status: GOOD (  25.19  )
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

On Wed, 13 May 2026 11:14:35 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add basic version of mcf54415 DAC driver. DAC is embedded in the cpu and
> DAC configuration registers are mapped in the internal IO address space.
> 
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> are respectively 0 and 0xfff, left untouched in this initial version.
> 
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mode
> is high speed, default format is right-justified 12bit on 16bit word.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>

As for all new IIO code, Sashiko will eventually take a look at it - I think
it's running about a day behind at the moment.  Once it catches up please
take a look (so far it's not even listing the series as pending!)

Looks good to me. Some trivial stuff inline. Only one I'm that fussed about
is not having a macro for the definition of a single channel. 
Superficially looks like no compile time dependencies between this and
the rest of the series I think so once people are happy with the whole thing
I'll pick this up through the IIO tree.

Jonathan

> diff --git a/drivers/iio/dac/mcf54415_dac.c b/drivers/iio/dac/mcf54415_dac.c
> new file mode 100644
> index 000000000000..e95ab6b89b17
> --- /dev/null
> +++ b/drivers/iio/dac/mcf54415_dac.c
...


> +static void mcf54415_dac_exit(void *data)
> +{
> +	struct mcf54415_dac *info = data;
> +
> +	regmap_update_bits(info->map, MCF54415_DAC_CR, MCF54415_DAC_CR_PDN,
> +			   MCF54415_DAC_CR_PDN);

regmap_set_bits() just to be a tiny bit more compact.

> +}
> +
> +#define MCF54415_DAC_CHAN \
> +{ \
> +	.type = IIO_VOLTAGE, \
> +	.output = 1, \
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
> +}
> +
> +static const struct iio_chan_spec mcf54415_dac_iio_channels[] = {
> +	MCF54415_DAC_CHAN,

For a single channel case like this I'd skip the macro - it's just
making things a little harder to read. i.e.
	.type = IIO_VOLTAGE,
etc here

> +};
> +

> +static int mcf54415_dac_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
Given the type passed to iio_priv() is very well known this
isn't really bringing any type safety - so you could just do

	struct mcf54415_dac *info = iio_priv(dev_get_drvdata(dev));
here and in resume.
I don't really care either way!


> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +
> +	mcf54415_dac_exit(info);
> +	clk_disable_unprepare(info->clk);
> +
> +	return 0;
> +}
> +
> +static int mcf54415_dac_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct mcf54415_dac *info = iio_priv(indio_dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(info->clk);
> +	if (ret)
> +		return ret;
> +
> +	mcf54415_dac_init(info);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
> +				mcf54415_dac_suspend,
> +				mcf54415_dac_resume);
> +

Trivial but might as well wrap as:
static DEFINE_SIMPLE_DEV_PM_OPS(mcf54415_dac_pm_ops,
				mcf54415_dac_suspend, mcf54415_dac_resume);

And save us scrolling one line extra.



