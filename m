Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F0FCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2O+YpFdrat6Z+OWdtzL/T/F6ubPYSmkO7DCAVXANdMw=; b=GhDlBNPr8/QcUCUUROVJNwxiuz
	5ivgP61PnXCo3Qo30P74mFCuslKxn7M840tDQI4wHOWJWkZmCelZr4CW1FDAonWrwY8vE7RM81I1k
	HndNHoSvjk3ynSiD2WfqHpxMD9N2c8QvIcm3IpLhu4t5PCIg4UinbUOdTmujPyHbhhMvqhfWnqO47
	9bpUOBXl+3/tTdrLeWJuS0Oe6uo7fWKNB/3Jsz/d+xZU5tO/jZQqpE6cAPVIWkSUoEEDCDCE6/GRh
	knxiInTMAScB2kWRIagMtDRSSSYRmXS4YW0UfCl8NsxPG9DL9nfwe5vTGc+hkW57RJ9ugfy5qQpAd
	3kKEblDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcLv-00000009Bym-18Ab;
	Thu, 11 Jun 2026 10:09:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcLt-00000009Byf-30iu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 10:09:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 286ED4378C;
	Thu, 11 Jun 2026 10:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755EA1F00893;
	Thu, 11 Jun 2026 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781172573;
	bh=2O+YpFdrat6Z+OWdtzL/T/F6ubPYSmkO7DCAVXANdMw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HbVv/1BPi5cphjIYqcqt9CSgxy4GLILFmzXk5gM8lhFpVSdu9eZT/MEJvD0i/iOny
	 PkQiOwDN54P9nu0KjiQwY8TdlMTFsbp2JX4ZSUR9ziGSnRYWDqRUrCsyZu2cwJw830
	 7vkzX+iigaMJ+NFT90uMnM4f5heCoDQEho6pwhR/uIH4rxQwRe0nj91+hvcgv+nfeb
	 pl+X05JQmPCTgdlxGq/xJJ3n+6Tn3Z9XJq3zTPEl7GoFo+9jjKSQbiba0sjJi15WA5
	 xkyUHS8go8JuY2iOGwSDPYOcfAIZZg4nzBEl2KG4nljwfsTBQwb0zSbrz1N2ZkuWbm
	 HCRDOUq9aVXow==
Date: Thu, 11 Jun 2026 11:09:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260611110923.2f55d280@jic23-huawei>
In-Reply-To: <20260611-axiado-ax3000-ax3005-saradc-v2-2-913c9de7c64c@axiado.com>
References: <20260611-axiado-ax3000-ax3005-saradc-v2-0-913c9de7c64c@axiado.com>
	<20260611-axiado-ax3000-ax3005-saradc-v2-2-913c9de7c64c@axiado.com>
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

On Thu, 11 Jun 2026 02:37:44 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> Add support for the SARADC controller found on Axiado AX3000 and
> AX3005 SoCs.
> 
> The driver supports single-shot voltage reads through the IIO
> subsystem. The number of available input channels is selected from
> the SoC match data, allowing AX3000 and AX3005 variants to use the
> same driver.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Hi Petar,

Looking good. There are a few formatting things that I think need a little
more polish though.  Given IIO is closed for this cycle, there is lots
of time so if you can clean those up for v3 (rather than me tweaking whilst
applying), that would be great.  Obviously give it a few days on list first
as others may take a look!

Jonathan

> diff --git a/drivers/iio/adc/axiado_saradc.c b/drivers/iio/adc/axiado_saradc.c
> new file mode 100644
> index 000000000000..d2f4071c932c
> --- /dev/null
> +++ b/drivers/iio/adc/axiado_saradc.c

> +/* Register offsets */
> +#define AX_SARADC_GLOBAL_CTRL_REG 0x0004
> +#define AX_SARADC_MANUAL_CTRL_REG 0x0008
> +#define AX_SARADC_DOUT_REG 0x001C
> +
> +/* GLOBAL_CTRL register fields */
> +#define AX_SARADC_GLOBAL_CTRL_CH_EN_MASK	GENMASK(31, 16)
> +#define AX_SARADC_GLOBAL_CTRL_SAMPLE_MASK	GENMASK(6, 5)
> +#define AX_SARADC_GLOBAL_CTRL_MODE_MASK		GENMASK(4, 3)
> +#define AX_SARADC_GLOBAL_CTRL_PD		BIT(2)
> +#define AX_SARADC_GLOBAL_CTRL_ENABLE		BIT(0)
> +
> +/* GLOBAL_CTRL register values */
> +#define AX_SARADC_GLOBAL_CTRL_SAMPLE_16		\
> +	FIELD_PREP(AX_SARADC_GLOBAL_CTRL_SAMPLE_MASK, 0)
> +
> +#define AX_SARADC_GLOBAL_CTRL_MODE_MANUAL	\
> +	FIELD_PREP(AX_SARADC_GLOBAL_CTRL_MODE_MASK, 1)
> +
> +/* MANUAL_CTRL register fields */
> +#define AX_SARADC_MANUAL_CTRL_ENABLE           BIT(0)
> +#define AX_SARADC_MANUAL_CTRL_CH_SEL_MASK      GENMASK(4, 1)
> +
> +#define AX_SARADC_MANUAL_CTRL_EN(ch)           \
> +	(AX_SARADC_MANUAL_CTRL_ENABLE |          \

Why tabs to place the \ above and spaces here?  I don't mind
that much which you use, but aim for consistency.

> +	 FIELD_PREP(AX_SARADC_MANUAL_CTRL_CH_SEL_MASK, ch))
> +
> +#define AX_RESOLUTION_BITS 10
> +#define AX_SARADC_CONV_CYCLES 13
> +#define AX_SARADC_CONV_DELAY_MARGIN_US 10
> +
> +struct axiado_saradc {
> +	void __iomem *regs;
> +	struct clk *clk;
> +	unsigned long clk_rate;
> +	int vref_uV;
> +	struct mutex lock; /* Serializes ADC conversions. */
> +};
> +
> +static int axiado_saradc_conversion(struct axiado_saradc *info,
> +				    struct iio_chan_spec const *chan, int *val)
> +{
> +	unsigned long usecs;
> +
> +	guard(mutex)(&info->lock);
> +
> +	/* Select the channel to be used and trigger conversion */
> +	writel(AX_SARADC_MANUAL_CTRL_EN(chan->channel),
> +	       info->regs + AX_SARADC_MANUAL_CTRL_REG);
> +
> +	/* Hardware requires 13 conversion cycles at clk_rate */
> +	usecs = DIV_ROUND_UP(AX_SARADC_CONV_CYCLES * USEC_PER_SEC,
> +			     info->clk_rate);
> +	fsleep(usecs + AX_SARADC_CONV_DELAY_MARGIN_US);
> +
> +	*val = readl(info->regs + AX_SARADC_DOUT_REG) &
> +	       GENMASK(AX_RESOLUTION_BITS - 1, 0);
Align as:
	*val = readl(info->regs + AX_SARADC_DOUT_REG) &
		     GENMASK(AX_RESOLUTION_BITS - 1, 0);

Check for any other instances of not aligning after the (.
I may well have missed some!

> +
> +	/* Stop manual conversion */
> +	writel(0, info->regs + AX_SARADC_MANUAL_CTRL_REG);
> +
> +	return 0;
> +}


> +static void axiado_saradc_disable(void *data)
> +{
> +	struct axiado_saradc *info = data;
> +
> +	writel(AX_SARADC_GLOBAL_CTRL_PD,
> +	       info->regs + AX_SARADC_GLOBAL_CTRL_REG);

See below. If you change that one to be on one line, then this one should
probably be so as well for consistency.

> +}
> +
> +static int axiado_saradc_probe(struct platform_device *pdev)
> +{
> +	const struct axiado_saradc_soc_data *soc_data;
> +	struct device *dev = &pdev->dev;
> +	struct axiado_saradc *info;
> +	struct iio_dev *indio_dev;
> +	u32 regval;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info = iio_priv(indio_dev);
> +
> +	info->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(info->regs))
> +		return PTR_ERR(info->regs);
> +
> +	info->clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(info->clk))
> +		return PTR_ERR(info->clk);
> +
> +	info->clk_rate = clk_get_rate(info->clk);
> +	if (!info->clk_rate)
> +		return dev_err_probe(dev, -EINVAL, "invalid clock rate\n");
> +
> +	info->vref_uV = devm_regulator_get_enable_read_voltage(dev, "vref");
> +	if (info->vref_uV < 0)
> +		return dev_err_probe(dev, info->vref_uV,
> +				     "failed to get vref voltage\n");
Really minor but I'd prefer the 'side effect free' route of:

	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
	if (ret < 0)
		return dev_err_probe(dev, ret, "failed to get vref voltage\n");
	info->vref_uv = ret;

Obviously makes not real difference as on failure we free info anyway,
so not worth a new version for just this.

> +
> +	soc_data = device_get_match_data(dev);
> +	if (!soc_data)
> +		return dev_err_probe(dev, -EINVAL, "failed to get match data\n");
> +
> +	ret = devm_mutex_init(dev, &info->lock);
> +	if (ret)
> +		return ret;
> +
> +	regval = FIELD_PREP(AX_SARADC_GLOBAL_CTRL_CH_EN_MASK,
> +			 GENMASK(soc_data->num_channels - 1, 0)) |

For readability that G should be under the a of the line above so it's
obvious this line starts with a parameter of FIELD_PREP.

The particular form of indentation you have here with an effective 8 spaces
after the start of the function call seems to be something I'm commenting
on a lot at the moment. Is some tool defaulting to that?


> +	      AX_SARADC_GLOBAL_CTRL_SAMPLE_16 |
> +	      AX_SARADC_GLOBAL_CTRL_MODE_MANUAL |
> +	      AX_SARADC_GLOBAL_CTRL_ENABLE;
> +
> +	writel(AX_SARADC_GLOBAL_CTRL_PD,
> +		  info->regs + AX_SARADC_GLOBAL_CTRL_REG);

Ok. No idea where that indent came from as it is not 8 spaces or
a whole number of tabs. Should be.

	writel(AX_SARADC_GLOBAL_CTRL_PD,
	       info->regs + AX_SARADC_GLOBAL_CTRL_REG);

Or I'm fine with it being just a little over 80 chars on one line.

	writel(AX_SARADC_GLOBAL_CTRL_PD, info->regs + AX_SARADC_GLOBAL_CTRL_REG);

> +	writel(regval, info->regs + AX_SARADC_GLOBAL_CTRL_REG);
> +
> +	ret = devm_add_action_or_reset(dev, axiado_saradc_disable, info);
> +	if (ret)
> +		return ret;
> +
> +	indio_dev->name = soc_data->name;
> +	indio_dev->info = &axiado_saradc_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = axiado_saradc_iio_channels;
> +	indio_dev->num_channels = soc_data->num_channels;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

> +static struct platform_driver axiado_saradc_driver = {
> +	.driver = {
> +		.name =  "axiado-saradc",
> +		.of_match_table = axiado_saradc_match,
> +	},
> +	.probe = axiado_saradc_probe,
> +};
> +

Trivial but convention common adopted which I like is no blank line
here. Keeps the macro tightly coupled with the structure.
If nothing major comes up I'll tweak this whilst applying.

> +module_platform_driver(axiado_saradc_driver);
> +
> +MODULE_AUTHOR("AXIADO CORPORATION");
> +MODULE_DESCRIPTION("AXIADO SARADC driver");
> +MODULE_LICENSE("GPL");
> 


