Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C98ED6204A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO01J4uiai6Bdm6iCmgSXEAxegyNC+z3dTZp0lYTxj4=; b=sCxdEQ4yIAAn9I9w5sFG0smeEc
	l8bX2rfa9mQ7XQa/p72QEE/FOkUExn+YeeIpumbA/+MMwUpNkT1NL8i2q/1YLnk71Dsq7qmpd8vVB
	jdEKT629il129Asv9VET1MQg1xmN7i3db0cQhC5kHJKCTz74tTBmA1OLX3mk7NKwkbhB+ee457uya
	vZiWFq8eJF5P4+Eoed6KRAybPG8uCXxa/LSZ0eI8KTPSY20pmnyUswMfyUlaUs0CyFO8ZdzN3PMe4
	pjfkvFlvYGO4kVSiz4Yl5dnGPHd6SgA5ThRA1ncRtjAzbRdor6Zz/ZqHVuilJ3iquYarZp9OVIclL
	9ZuNklEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKVw-0000000BtSL-2OBp;
	Tue, 19 Nov 2024 09:27:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKV0-0000000BtKD-1LTe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 09:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C177EA427B4;
	Tue, 19 Nov 2024 09:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCD8C4CECF;
	Tue, 19 Nov 2024 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732008377;
	bh=7mePgQRSkpmfIveXMK9lb5lPmV+fFAPKdLmVe2Fi60A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GHfigUYs7mnM49q4h+91RIdknDmcVyeysT+2BAWJW5HgPzkbL01OM+N8KUiqTTQwR
	 gIpcLQPuilmBvDRcjlo6g1idMTOyNOjyS2MFOaEfaYDBaYekxgCiCr9m4Oe2kDowh4
	 B3hmjuH6pqBJiHSYsfju8/mhCcbfKEtZEHuBR1587M5gkhEJuuTCb0rmdtsMy5UjBM
	 +a185obDtQ/DDZ85J79VFpJGTYyYnPPKAF76eIUJIE9qlzzngnQvk588ApeOAaNdOa
	 Juu7yfodN5ccE3sk/ztOa12A1TX0aAml6kPVo6cTsf289SGESEUQb7Y3WjJi96blk+
	 OZu0t1Td0ClDQ==
Message-ID: <2ccbf862-2b3e-4c08-b6bd-d9571e88a675@kernel.org>
Date: Tue, 19 Nov 2024 10:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] pinctrl: s32: convert the driver into an mfd cell
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-5-andrei.stefanescu@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241113101124.1279648-5-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_012618_488870_9C763CA5 
X-CRM114-Status: GOOD (  18.81  )
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

On 13/11/2024 11:10, Andrei Stefanescu wrote:
>  
> -static inline void s32_pin_set_pull(enum pin_config_param param,
> -				   unsigned int *mask, unsigned int *config)
> +static void s32_pin_set_pull(enum pin_config_param param,
> +			     unsigned int *mask, unsigned int *config)
>  {
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> @@ -762,15 +757,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
>  	grp->data.name = np->name;
>  
>  	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
> -	if (npins < 0) {
> -		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
> -			grp->data.name);
> -		return -EINVAL;
> -	}
> -	if (!npins) {
> -		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
> -		return -EINVAL;
> -	}
> +	if (npins < 0)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to read 'pinmux' in node %s\n",
> +				     grp->data.name);

I do not see how this change is related. Looks you are mixing cleanups
with refactoring into MFD cell. These are two different things.

> +
> +	if (!npins)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "The group %s has no pins\n",
> +				     grp->data.name);
>  
>  	grp->data.npins = npins;
>  
> @@ -811,11 +806,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
>  	/* Initialise function */
>  	func->name = np->name;
>  	func->ngroups = of_get_child_count(np);
> -	if (func->ngroups == 0) {
> -		dev_err(info->dev, "no groups defined in %pOF\n", np);
> -		return -EINVAL;
> -	}
> -
> +	if (func->ngroups == 0)
> +		return dev_err_probe(info->dev, -EINVAL,
> +				     "No groups defined in %pOF\n", np);
>  	groups = devm_kcalloc(info->dev, func->ngroups,
>  				    sizeof(*func->groups), GFP_KERNEL);
>  	if (!groups)
> @@ -838,57 +831,42 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
>  static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  				struct s32_pinctrl *ipctl)
>  {
> +	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
>  	struct s32_pinctrl_soc_info *info = ipctl->info;
> -	struct device_node *np = pdev->dev.of_node;
> -	struct resource *res;
> -	struct regmap *map;
> -	void __iomem *base;
> -	unsigned int mem_regions = info->soc_data->mem_regions;
> +	unsigned int mem_regions;
> +	struct device_node *np;
> +	u32 nfuncs = 0, i = 0, j;
> +	u8 regmap_type;
>  	int ret;
> -	u32 nfuncs = 0;
> -	u32 i = 0;
>  
> +	np = pdev->dev.parent->of_node;
>  	if (!np)
>  		return -ENODEV;
>  
> -	if (mem_regions == 0 || mem_regions >= 10000) {
> -		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
> -		return -EINVAL;
> -	}
> +	/* one MSCR and one IMCR region per SIUL2 module */

How is this related to converion into MFD cell?

Still looks like an ABI break.


Best regards,
Krzysztof


