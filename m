Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCA6CF65DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkux+EitG9JzPydAe2E8YwQFUS9lBx4JpjL6QxsZSNw=; b=OIMlQQyk0efFtr3FFPqXMr6vSA
	HOr2gZuaFRlCbfmP5QZR5F3848BtwHLJZjHmFldOi/Fg0qoeLi5jiVTpEuOsQ45Fi9GaVB8K7hodY
	lGct+1HS2yf2UEJjaI/0PEXg8h0X0fymO/CTwSDSpn5u97IZ4E3KWUC0ckCYPCUMh2sZ0RB4yrsBS
	3C4MDk9+ptK3/NFV4ZQ5CtbMU/9AzTRAbVoCVnLiU7a5NJgr+9TNKR433BnGyBlpKcQ2k+w0guRjB
	oiTtFRejRUGhFn68zG6zGAG2x5nwOro2H4NC+933X7shCoVgZcRVsZ4TzSfZEGt5CshtZPp4cUv2N
	Fu0/oZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJyd-0000000CIvb-1Db6;
	Mon, 26 Jan 2026 10:37:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJya-0000000CIuf-3AUN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:37:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48049955f7fso36773705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769423862; x=1770028662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xkux+EitG9JzPydAe2E8YwQFUS9lBx4JpjL6QxsZSNw=;
        b=KAYPYy7r65Z6xXW7jIv+RuBKoBG7BT/X0qMOdKJL8q52OinHU8kKvLFDHGE0Jz4ONQ
         7IYfEhpS2OPQOUKDYZplaTJOogfDFaJlZLiNdR4GZDrC5jc3qE681+AY9VuLIvFXv2rL
         8DAt2Bj8tFJwLZCmfyFACZL2aCwMCmv5smi1eaRLR5IZftcNR1Dm/OLv1m5th0DGwque
         yVmrcfKTUFdeX0N6CQcF5x8t6XppYmx5KsOpBK4hPy6eY6T0CRiSv+iBbogG1p39a3gi
         s/j+IAewRQMTY16DT+f+jfmlhY3OPpMmRf/MSJd78iOk6zCeUzSUCzsVvUlW8xfyDygy
         8Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423862; x=1770028662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkux+EitG9JzPydAe2E8YwQFUS9lBx4JpjL6QxsZSNw=;
        b=TzI92ROQke+uNEcUJpi4QCqcLJuVaXvrgkZ02cJPWIqdszMLIZ0/aK02AnSXQdIwzM
         GcfbJd9e96w2LdvqO1PWu8MdFtm091iD4ClqVju5b4hJcWybwuhlfZRqca/5pLoz2+xS
         eoVFeJot+lWGGBipGCSJjuLo2a+LoiYZWDEvesGW3MzdwJKbUusPuS0xOoTcy3VeDKX5
         MtHSIq41V//OAx6ddNd8Yv4qVn7Jd+noAp8RvDgwZFQyPg7vA5ySkIF/uIizGZn5pVwr
         i1ghe09AzLfqe6A0LNYep3M8SbL36+98KDbBqcb724EbvCImIlg3QCAmzAXu58pgLFTJ
         jpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc8S6JaOqg/diX9KUqNY5m6SOJuFalrV8ZT3bwzmX7lcLBp1MPF0xUVxXWSN4q1JeLIlWlUiJ/hv66H2E+TbcU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0d3J8gB3eW9s3/xo4X+cz1NAhJbrXIWwUSiEc2NBQtQR+gPRg
	kajMRsZq07Qk1xLc0NtQPbcHHIB/upn6yYBr5jtlYirC1lFtkocV6Lm+
X-Gm-Gg: AZuq6aJhA/fBLmPCX4FP3W0K+grym/yN8nZsSm2OoZwQbiHYiW9924zfkQ9Nsm0hzAn
	7CXWG5hUSw0ARCYdvtosrz72W6uXX6tjqRTM5+r9OYzvfYaz0OMxE2C2P2KpIbkgcuPndj5fBaw
	4pZFNytHFqMnizm434MF33iQyY35H8vk+sDvK76sDVN0QlDtldLEcESwNA6JcVZEgeHuWFp6cfo
	qX1TBHyH1W0a1V6yhFWremdS9daB6ufG3KE9KJIn4Qnhnnd6frpp/5ne6jg6uKTfZNuHfp6gmdc
	9kzgDdKlyJ/zinEZ0Dxr0+0S7aAcc7+70t88cbgwPf7MS73dfhGno0v54O8dmQRkiiK1oLUdmtZ
	gO95YPJXkidl/igraGtMy0bfXyvCd9yHX3V8o0oD/zy2XgJ5W/B7qkQVZe2Iiz6nVPRlaXKAF/n
	dyvlaH5AsguU0bMNYpwjlpuDLsv1TGnQNwIjDiGbXEpYnDsdJKfQZfrz/L19AN7X0UoIJlK8ZGX
	0aOPivGoXFuRbFD5mdGOrqir6HSlvnMhBIjyql7EOn/AxyqetieW+3iATCT
X-Received: by 2002:a05:600c:35c4:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-4805cf673f5mr69370895e9.30.1769423862239;
        Mon, 26 Jan 2026 02:37:42 -0800 (PST)
Received: from ?IPV6:2a02:8440:260e:5ad0:867f:b0c6:e80c:5b42? (2a02-8440-260e-5ad0-867f-b0c6-e80c-5b42.rev.sfr.net. [2a02:8440:260e:5ad0:867f:b0c6:e80c:5b42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d6160d2sm104298055e9.2.2026.01.26.02.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:37:41 -0800 (PST)
Message-ID: <ed300810-14c9-40de-b50b-f60cd4241bb7@gmail.com>
Date: Mon, 26 Jan 2026 11:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] pinctrl: stm32: add firewall checks before
 probing the HDP driver
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, jens.wiklander@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_023744_834682_4A004378 
X-CRM114-Status: GOOD (  23.31  )
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

Hi Gatien,

Thank you for the patch

On 1/23/26 11:39 AM, Gatien Chevallier wrote:
> Because the HDP peripheral both depends on debug and firewall
> configuration, when CONFIG_STM32_FIREWALL is present, use the
> stm32 firewall framework to be able to check these configuration against
> the relevant controllers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
> index 0b1dff01e04c..cce477e86ef9 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
> @@ -4,6 +4,7 @@
>    * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
>    */
>   #include <linux/bits.h>
> +#include <linux/bus/stm32_firewall_device.h>
>   #include <linux/clk.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/gpio/generic.h>
> @@ -46,9 +47,11 @@ struct stm32_hdp {
>   	void __iomem *base;
>   	struct clk *clk;
>   	struct pinctrl_dev *pctl_dev;
> +	struct stm32_firewall *firewall;
>   	struct gpio_generic_chip gpio_chip;
>   	u32 mux_conf;
>   	u32 gposet_conf;
> +	int nb_firewall_entries;
>   	const char * const *func_name;
>   };
>   
> @@ -615,6 +618,13 @@ static int stm32_hdp_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   	hdp->dev = dev;
>   
> +	if (IS_ENABLED(CONFIG_STM32_FIREWALL)) {
> +		err = stm32_firewall_get_grant_all_access(dev, &hdp->firewall,
> +							  &hdp->nb_firewall_entries);
> +		if (err)
> +			return err;
> +	}
> +
>   	platform_set_drvdata(pdev, hdp);
>   
>   	hdp->base = devm_platform_ioremap_resource(pdev, 0);
> @@ -670,8 +680,12 @@ static int stm32_hdp_probe(struct platform_device *pdev)
>   static void stm32_hdp_remove(struct platform_device *pdev)
>   {
>   	struct stm32_hdp *hdp = platform_get_drvdata(pdev);
> +	int i;
>   
>   	writel_relaxed(HDP_CTRL_DISABLE, hdp->base + HDP_CTRL);
> +
> +	for (i = 0; i < hdp->nb_firewall_entries; i++)
> +		stm32_firewall_release_access(&hdp->firewall[i]);
>   }
>   
>   static int stm32_hdp_suspend(struct device *dev)
> 

Reviewed-by: Clément Le Goffic <legoffic.clement@gmail.com>

