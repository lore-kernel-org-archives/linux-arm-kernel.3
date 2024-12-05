Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7B9E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 05:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWyo9Bu5l9XOsB4Q8M1dSJaLQtxfsxiyf7xxvykE+sk=; b=TdueJpQBpd+DocGos+U4Y+3+24
	yH4eCQvSF5eaCXIQLWzI+x5opYl0hMrc3EyMqy2R+QvjRssRIzo0Ia/77j+DXQDyGvXa+j5rloZDf
	J4zEjfTeSvmylfwWfCkwkYHEb0ljQlILLSe4nMnKodBOKbjkaDX4MsTKnjmFriooKlCdMynVOoDAU
	KixEcOrzKYbIfva32FmKQY5jHZlU5W1ERl1DRkRM9hEe0qMf5rqj0/cje2H+VbMt1ttKi2N5XmKob
	/WZF4NKcLna21n9KLP8Gid3KTlupgdmi6rd4eAfHeQmUxrhbhSyY2MCJqyA+iKrUbDljkA3T9jyS4
	g+05vUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ4Bq-0000000Emoh-1f06;
	Thu, 05 Dec 2024 05:14:14 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ4Ap-0000000EmjH-2ViE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 05:13:12 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E6F8C88EDD;
	Thu,  5 Dec 2024 06:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1733375588;
	bh=dWyo9Bu5l9XOsB4Q8M1dSJaLQtxfsxiyf7xxvykE+sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SstSwugAf14DWGV0olpYo99gQMHuNa+3siS4StFcJh/xEgnrORDiQssMO2Li27VH3
	 401H97eV0rRm0NbmB6ei5GhU/JrlUrBdG/6OCb+8Aeykufm/pJCiLP6rmXOKCOhjBf
	 fuuE8RIqUFBGgJOcNyVQS/oaImdI8HeOPC8/PG2AM1jvK1EehTfMpmGy8Rfi9KHDB1
	 fB18rdFu5bJaMxU7TA0XkCCrt4YUklofs56efQjO/8v1qfBuHoxzFycT/jI+Tk1COJ
	 trpyNocUyirAsChlZITCNZw6jj/uONDppuWKyAyN9JQNOvl6We6A3A23w+RnQ6XOkn
	 0dbwhMVeE69Vw==
Message-ID: <3c809cae-991b-4b13-8d8b-bd6cbcc9a9b9@denx.de>
Date: Thu, 5 Dec 2024 06:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241205045942.2441430-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241205045942.2441430-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_211311_799311_5A42EF2E 
X-CRM114-Status: GOOD (  17.70  )
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

On 12/5/24 5:59 AM, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error. Add a cleanup loop to disable clocks already enabled in case
> of an error during clock enabling for subsequent banks.
> 
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 5b7fa77c1184..eb7b2f864d88 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1738,10 +1738,16 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
>   {
>   	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
>   	struct stm32_pinctrl_group *g = pctl->groups;
> -	int i;
> +	int i, j, ret;
>   
> -	for (i = 0; i < pctl->nbanks; i++)
> -		clk_enable(pctl->banks[i].clk);
> +	for (i = 0; i < pctl->nbanks; i++) {
> +		ret = clk_enable(pctl->banks[i].clk);
> +		if (ret) {
> +			for (j = 0; j < i; j++)

Instead of this open-coded loop, can you please convert the driver to 
clk_bulk*() API and then do simple clk_bulk_enable()/clk_bulk_disable() 
here and everywhere ?

Thank you

