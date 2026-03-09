Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49AFEFCD6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFjvF6ANCaUypXQZWwGugidl1LIo9umNiCQTrHapw/E=; b=jzO5WVowcXc0nR5h8pgty4oMC6
	03mvuTZWW+MCZBkhmCvejudS5UChRPpo1aVc/khR7HqgmcV5Mqd6wr54UUtxT8JRmILCUNF8/ab9t
	OPHz2NiPHa1GyJmxPs9M8njqsl0B1AAlVupNz8CsJqfDmEc8iXM7LY+2KooMt9HGQhoMiwd7ioCgm
	pTSgdYWf8HuXSeqIvL5e4P/lWNknlYQnzhWZyzZl76j5AHK7bcw+Vy/oeKzhsaIHxHekVAdb/ESQx
	6YZpw6+YC8Hp5auXSdT8mlOriTffQ2XwJVeH9NoCEBSd1lWrT5jzoPIIzrQUCWWlictusjm/PgU+5
	Q6n+iQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWpv-00000006xrg-3yZk;
	Mon, 09 Mar 2026 09:23:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWpt-00000006xqw-0sJV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D73D34362D;
	Mon,  9 Mar 2026 09:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC431C4CEF7;
	Mon,  9 Mar 2026 09:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773048214;
	bh=HdpYv+AK/YGT3wtX9pT1P3XlHW6w2YeAT+IqCsoGv0s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hVoNSA6VbeUuOvEG/YRgGoQiIZ14lpU77V6B1mvJhk/nFVFKx9hcsVlGxBF2N/gwf
	 xc2YpBcFA0BeItIW0YP1PQano5iDKE84YGZ8/Ki+izwCfu98+Pnqrolkv4SjPKT15v
	 mXIv6Nf4GrhBbpMA/3JHI81W+mDbkShlX0ApQaoI+i1P/QpU4W3JwzBVToVDPOb5Cd
	 CrF1FcH3OGqlAleb8yIczwiMoM8y9nDA05Si4T9Qz65xRwWIVe6E+k1itqqzUm+KEZ
	 tychkPaNiQlcquXMPOY0uANFx5DKElbbLnh92GcRPqy98Dr/rZhkzK+E2j1javF4Ry
	 w+UNDjKzdUAfg==
From: Thomas Gleixner <tglx@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach
 <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, s32@nxp.com, Christophe Lizzi
 <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo
 <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, Ciprian Marian
 Costea <ciprianmarian.costea@oss.nxp.com>, Larisa Grigore
 <larisa.grigore@nxp.com>
Subject: Re: [PATCH v4 5/8] irqchip/imx-irqsteer: add NXP S32N79 support
In-Reply-To: <20260306161555.9000-6-ciprianmarian.costea@oss.nxp.com>
References: <20260306161555.9000-1-ciprianmarian.costea@oss.nxp.com>
 <20260306161555.9000-6-ciprianmarian.costea@oss.nxp.com>
Date: Mon, 09 Mar 2026 10:23:31 +0100
Message-ID: <87jyvls6ek.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_022337_296635_5B5C50D7 
X-CRM114-Status: GOOD (  14.74  )
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

On Fri, Mar 06 2026 at 17:15, Ciprian Costea wrote:
> +/* SoC does not implement the CHANCTRL register */
> +#define IRQSTEER_QUIRK_NO_CHANCTRL	BIT(0)
> +
> +struct irqsteer_devtype_data {
> +	u32 quirks;
> +};
> +
>  struct irqsteer_data {
>  	void __iomem		*regs;
>  	struct clk		*ipg_clk;
> @@ -37,8 +44,22 @@ struct irqsteer_data {
>  	struct irq_domain	*domain;
>  	u32			*saved_reg;
>  	struct device		*dev;
> +	const struct irqsteer_devtype_data *devtype_data;

The struct was perfectly tabular formatted before....

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

>  };
>  
> +static const struct irqsteer_devtype_data imx_data = {
> +	.quirks = 0,
> +};
> +
> +static const struct irqsteer_devtype_data s32n79_data = {
> +	.quirks = IRQSTEER_QUIRK_NO_CHANCTRL,
> +};
> +
> +static bool irqsteer_has_chanctrl(const struct irqsteer_devtype_data *data)
> +{
> +	return !(data->quirks & IRQSTEER_QUIRK_NO_CHANCTRL);
> +}
> +
>  static int imx_irqsteer_get_reg_index(struct irqsteer_data *data,
>  				      unsigned long irqnum)
>  {
> @@ -188,6 +209,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	data->devtype_data = device_get_match_data(&pdev->dev);
> +	if (!data->devtype_data)
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				"failed to match device data\n");

No point for this line break. You have 100 characters. If you have the
line break, then this needs curly brackets. See the bracket rules in the
above linked document.

>  static const struct of_device_id imx_irqsteer_dt_ids[] = {
> -	{ .compatible = "fsl,imx-irqsteer", },
> +	{ .compatible = "fsl,imx-irqsteer", .data = &imx_data },
> +	{ .compatible = "nxp,s32n79-irqsteer", .data = &s32n79_data },

Tabular layout please for readability sake.

Thanks,

        tglx

