Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4CBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfwoFskvac32DMGJaG2VVgg3dFe4kwMlCOX61uyPLDE=; b=uxi/FUbLOQDrc94T0XUaq+t2le
	OlujkJkf34SGjMOooHKXWRz4Dy2Z4Z4xAoEfxyl+VjaO5miyfTtxhp+Bzp7Iaq4Zl2rAZHcdzoyRd
	ek0zZ+AedU+ietd/feCyM8KQY0LpAmGbjBVBIbrN/eMwm/61AUaWf6KNKd9e28fqBfaR+Z7Nj9kME
	1Nno6ZSjw1oEl9XSwb3psNmmHXgo0wkt7azwQtY8zzFPuziFg4k5mlMmlYO2H637XOggZuVZa+Ey0
	U1JS4JFLnPNvJRTDZeubPjK5Ahke/kdH+ACF6DQNkscQJdWgkvbHETDf5jbER4cJwLfJDM+Ru4dzk
	Axl7Zp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRxFt-00000003hmy-1sZT;
	Sun, 29 Dec 2024 17:39:09 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRxEb-00000003hgh-3pZa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 17:37:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4757104811E4;
	Sun, 29 Dec 2024 18:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735493865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfwoFskvac32DMGJaG2VVgg3dFe4kwMlCOX61uyPLDE=;
	b=KSVapUJBrd09Vwg/G5+Osz47EjxrzwoxxD5bJljCnJ4m92W0MeUuf1j+hai1P7q0slT5GP
	RUjHqtEWsRcmOt1I4s9LjHm5zamXHQRDFRQGMikQWFBE0dlNkAgIN0Knp5A6sphx2WPdCe
	cD9FYRmBHKO+wftSdPT05Nl+L0y4hH5DoGcg4DHucURTM2Fnsl1QJJ4G47V3o4FjZrhfWL
	OtkpJdAJh3wsPiDcyA9QWTmQWdneCSg5xlS7am2yVWQ0LBuSbVPmMtFCVV1whF7YvGZwTY
	M4EWyP0bUsES0SioAUSu2CVz/1iUdlVavxMwoRJiy/NWH+GJBp1WoObhj9xkYg==
Message-ID: <b2f2f1e6-a539-4d1b-876f-6715c126ac3e@denx.de>
Date: Sun, 29 Dec 2024 18:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: antonio.borneo@foss.st.com, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241224200608.84923-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241224200608.84923-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_093750_105007_1DD47EDC 
X-CRM114-Status: GOOD (  12.42  )
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

On 12/24/24 9:06 PM, Mingwei Zheng wrote:

[...]

> @@ -1390,15 +1379,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	err = gpiochip_add_data(&bank->gpio_chip, bank);

There is one other nasty problem here -- this gpiochip_add_data() needs 
to be undone (*) below, otherwise ...
...

> +	ret = clk_bulk_prepare_enable(banks, pctl->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
> +		return ret;
> +	}
> +
>   	for_each_gpiochip_node(dev, child) {
>   		ret = stm32_gpiolib_register_bank(pctl, child);

... if this stm32_gpiolib_register_bank() fails for second or later bank 
, then ...

>   		if (ret) {
>   			fwnode_handle_put(child);
> -
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> -
> -			return ret;
> +			goto err_clk;
>   		}
>   
>   		pctl->nbanks++;
> @@ -1658,6 +1642,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   	dev_info(dev, "Pinctrl STM32 initialized\n");
>   
>   	return 0;
> +
> +err_clk:
> +	clk_bulk_disable_unprepare(banks, pctl->clks);

... this clk_bulk_disable_unprepare() will disable all bank clocks, 
including the clocks for the banks which got successfully registered.

Before calling clk_bulk_disable_unprepare(), it is necessary to 
unregister the GPIO chips again, i.e.:

i = 0;
for_each_gpiochip_node(dev, child) {
   struct stm32_gpio_bank *bank = &pctl->banks[i];
   gpiochip_remove(*bank->gpio_chip);
}
clk_bulk_disable_unprepare(banks, pctl->clks);

Otherwise I think the patch is pretty good, thank you !

