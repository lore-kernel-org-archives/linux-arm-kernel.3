Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D366DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mZdvhtRvGCfpQh2PJTw1zy782LwMEIbYoJwSZ47DZ8=; b=boCEwPpq0Gcu40Fm7wscxlk+WQ
	SHgqU5f53MNsW09eB21GsUqSB4up44zfYoQZ8KAhSvAaxd9AhWoLLSVTCWO2XtJkTSgcrL+K40MR4
	3caiToaH/1TEokTBAMrzwDzIfYOwOdiDdTyNnYum4/Mg6q1BGWtZhDO54iTV/TyM9HfRXzSOPGAmP
	Qrn58FMSBOIcRW4TlmmeVnpQGtiKZXeHM1e3UcVjU8k15CJv+OnIMEMxjpJOCfxVwUZLznt94uhMr
	uPLn2MpqCe8do6pFDj9rJP5ADAcAMeDI/zFOwacsKwYMlFAXuwI/19MpqPE4ZFLHGAn1oY77lb+BK
	aXF3Bk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3jN-00000003XbA-0msc;
	Fri, 13 Dec 2024 11:21:13 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3iD-00000003XL4-0Tia
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:20:02 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAwDvD013489;
	Fri, 13 Dec 2024 12:19:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4mZdvhtRvGCfpQh2PJTw1zy782LwMEIbYoJwSZ47DZ8=; b=pWJbylCt/dHXMFLT
	nup21j37+Uh+cj5yPSAwz5H3m3pYQSkvrp6h4YN5trvJK91XoCD1GgF7KXpLE6Pp
	lY7BZpiNeETuSt0C9ZUCpPJqksMXw+F3keWTwlHto4XlzIPzg7vTANkA6uJl0+tE
	W+HFjVirm3thC15mnxOqbL/LlG7dQiUQ4HWa/jMR5pJ9y5Ld/v4n+9W5Rek10/g8
	ft256Ov1yLCBgsBTr8qf384ZxjJWFTdyNIOm1ybevxXTQRTH+rS+Ug2RUe3PRlq6
	XopHThXKsnJAMxbFj1Ury/iUMvboW36R39ueCQCCp+0K3GX6y2WTNDBG3eyoMpHW
	wJI+TQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj761y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 12:19:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C06D040047;
	Fri, 13 Dec 2024 12:18:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F671264FE2;
	Fri, 13 Dec 2024 12:16:35 +0100 (CET)
Received: from [10.48.86.108] (10.48.86.108) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 12:16:34 +0100
Message-ID: <6d893831-7a2e-4a9a-a519-2e257e249f0f@foss.st.com>
Date: Fri, 13 Dec 2024 12:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v4] pinctrl: stm32: Add check for
 clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>, <marex@denx.de>,
        <antonio.borneo@foss.st.com>
CC: <peng.fan@nxp.com>, <make24@iscas.ac.cn>, <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        Jiasheng Jiang
	<jiashengjiangcool@gmail.com>,
        <fabien.dessenne@foss.st.com>, <mcoquelin.stm32@gmail.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241213010948.2623382-1-zmw12306@gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20241213010948.2623382-1-zmw12306@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.108]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_032001_443297_9F28FAC7 
X-CRM114-Status: GOOD (  21.52  )
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


On 12/13/24 02:09, Mingwei Zheng wrote:
> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
> 
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
> Changelog:
> 
> v3 -> v4:
> 1. Add initialization for  pctl->clks.
> 2. Adjust alignment.
> 
> v2 -> v3:
> 
> 1. Convert clk_disable_unprepare to clk_bulk_disable
> and clk_bulk_unprepare.
> 
> v1 -> v2:
> 
> 1. Move int ret declaration into if block.
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 37 +++++++++++++++------------
>   1 file changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 5b7fa77c1184..427749d4f6a5 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -86,7 +86,6 @@ struct stm32_pinctrl_group {
>   
>   struct stm32_gpio_bank {
>   	void __iomem *base;
> -	struct clk *clk;
>   	struct reset_control *rstc;
>   	spinlock_t lock;
>   	struct gpio_chip gpio_chip;
> @@ -108,6 +107,7 @@ struct stm32_pinctrl {
>   	unsigned ngroups;
>   	const char **grp_names;
>   	struct stm32_gpio_bank *banks;
> +	struct clk_bulk_data *clks;
>   	unsigned nbanks;
>   	const struct stm32_pinctrl_match_data *match_data;
>   	struct irq_domain	*domain;
> @@ -1308,7 +1308,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	if (IS_ERR(bank->base))
>   		return PTR_ERR(bank->base);
>   
> -	err = clk_prepare_enable(bank->clk);
> +	err = clk_prepare_enable(pctl->clks[pctl->nbanks].clk);
>   	if (err) {
>   		dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
>   		return err;
> @@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	return 0;
>   
>   err_clk:
> -	clk_disable_unprepare(bank->clk);
> +	clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
>   	return err;
>   }
>   
> @@ -1617,10 +1617,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   	pctl->banks = devm_kcalloc(dev, banks, sizeof(*pctl->banks),
> -			GFP_KERNEL);
> +				   GFP_KERNEL);
>   	if (!pctl->banks)
>   		return -ENOMEM;
>   
> +	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
> +				  GFP_KERNEL);
> +	if (!pctl->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < banks; ++i)
> +		pctl->clks[i].id = "";
> +
>   	i = 0;
>   	for_each_gpiochip_node(dev, child) {
>   		struct stm32_gpio_bank *bank = &pctl->banks[i];
> @@ -1631,11 +1639,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   			fwnode_handle_put(child);
>   			return -EPROBE_DEFER;
>   		}
> -
> -		bank->clk = of_clk_get_by_name(np, NULL);
> -		if (IS_ERR(bank->clk)) {
> +		pctl->clks[i].clk = of_clk_get_by_name(np, NULL);
> +		if (IS_ERR(pctl->clks[i].clk)) {
>   			fwnode_handle_put(child);
> -			return dev_err_probe(dev, PTR_ERR(bank->clk),
> +			return dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
>   					     "failed to get clk\n");
>   		}
>   		i++;
> @@ -1646,8 +1653,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		if (ret) {
>   			fwnode_handle_put(child);
>   
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> +			clk_bulk_disable_unprepare(pctl->nbanks, pctl->clks);
>   
>   			return ret;
>   		}
> @@ -1726,10 +1732,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
>   int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
>   {
>   	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
> -	int i;
>   
> -	for (i = 0; i < pctl->nbanks; i++)
> -		clk_disable(pctl->banks[i].clk);
> +	clk_bulk_disable(pctl->nbanks, pctl->clks);
>   
>   	return 0;
>   }
> @@ -1738,10 +1742,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
>   {
>   	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
>   	struct stm32_pinctrl_group *g = pctl->groups;
> -	int i;
> +	int i, ret;
>   
> -	for (i = 0; i < pctl->nbanks; i++)
> -		clk_enable(pctl->banks[i].clk);
> +	ret = clk_bulk_enable(pctl->nbanks, pctl->clks);
> +	if (ret)
> +		return ret;
>   
>   	for (i = 0; i < pctl->ngroups; i++, g++)
>   		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);


Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>

