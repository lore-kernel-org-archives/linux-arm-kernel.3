Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B08E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkBIlhUGkIaiKofFxUVhr74VClg7J+Yj/5BHdg57D+8=; b=XEvf7zoP3lAHE/URoB9SG2+Wop
	tw4v6O8ZVHtiFTKkMa/jRrJxeYvZKWYPVo9ijjL3egqF+woDU/AW8I8pPEYj00pflyDRHvJbzlqz9
	SCKGw6U77+zV87b2avBGnLGIrjQAAjilnF1Ob33VCqGwLGemjvLbMNzQhJSdoapCEULgIRfFvD9Ck
	myItIbhk2nCcNE6x1VqNJGUkOG5GRkeblYzUJziOO+RFML9C1BlyDXC7iv37bxxOgXxouG/RFoZEP
	NGVC6guuHY0TeFTGq0C3MOkUayqNjByWNfnNGkgsnVxfuX6DXA8egZOoTaQPP5xM4QM/Ry2Je+Nz7
	cS518dBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM47x-00000003cgF-2Sa0;
	Fri, 13 Dec 2024 11:46:37 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM46s-00000003cTd-1841
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:45:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E3731049DA13;
	Fri, 13 Dec 2024 12:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734090325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkBIlhUGkIaiKofFxUVhr74VClg7J+Yj/5BHdg57D+8=;
	b=WCmUgeosX4tvXaGOiHRdoD6VWNxfDTxSEKj4CLn7/x4aFicr3aW5a8/LadGjHRtv/5575d
	gCmNC2ojQGczCqkDM7MbJZu40HJus9y8cdZSvdjdYc/UysZ/eEF0VD2Xmms4Bk782EGaVq
	GGTVzilaiwLKOWrN6BMM+ZVnB6TR9UFBil3njXfibn6sPYRxHmZJUCXZc5ugdwLsQJITeK
	DxaFNzxIw+E3S5Pqa87fuxAePTuCZnktgamau651x8PqReAS4Z16bvY3Ybml4Q1E+kNe+O
	q+jvIDdzZz3l1EtJwK532EgUamcK35ZbRJFup2FuF1bHw4QWTX6BkjtMpsRbzQ==
Message-ID: <a47b567d-96a6-4a87-9f60-33a311c281ae@denx.de>
Date: Fri, 13 Dec 2024 12:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>, antonio.borneo@foss.st.com
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com,
 fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241213010948.2623382-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241213010948.2623382-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_034530_457720_2AB9DFEE 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

On 12/13/24 2:09 AM, Mingwei Zheng wrote:

[...]

> @@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	return 0;
>   
>   err_clk:
> -	clk_disable_unprepare(bank->clk);
> +	clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);


Should this be

-clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
+clk_disable_unprepare(pctl->clks[bank->bank_nr].clk);
                                   ^^^^^^^^^^^^^

?

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

i++

