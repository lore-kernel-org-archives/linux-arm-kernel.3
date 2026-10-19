Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A67CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0SUy48Ueh56GzaTiRmwygfsPwqE3Nw6AJaFjvfAhy4=; b=q+vXWf/MrovXxOwEDaFSpzF8bq
	VOggMSW6nfUy0b79K0jZMDuEMzqJppcBVaOUq4vOXjSKSWnZOEPfI9uGSy0tZb9uoSFnIACqRUrRf
	LPVi+1o43G4zDzYm0ehTVr1puN5tTSyDkt13Go9qKWlJ08Ls374yth2HE5sbTJeiQ1jsX98U5zVNP
	in1ITyyfc3xFluqKCd2tCzzenyvsTqd4qBzL739WvblR1ztdhfmsG7QUSebRJYHpMt/fQfEw9AdCW
	80OBzVqyuZjBZ2u8QweYhmDHR1exRzr5q+BaE9PDPa6rHMENCXxvxwzw8b3Wa9eJB4+FGdlhdTk/u
	rLXc5YuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhyb-00000006mH9-1l1M;
	Mon, 19 Oct 2026 07:40:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhyY-00000006mFe-2Ojt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 07:40:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1115631f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792395605; x=1793000405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0SUy48Ueh56GzaTiRmwygfsPwqE3Nw6AJaFjvfAhy4=;
        b=ke6cxNQxE3BIp2bnBP0l3SmtdZMKTgAA695y6RbBdJ4EQsHBKtwBOeCvOP/WJzLdIh
         F/PH067+Y0YitmsPXt2EUqfe2YrWza4aEUWxT5i+RuCOXZbhuoCFkqgjj9Mia86mwumF
         PGb4NVPS4EEwk0W5+enzf0LdYlRfNswy89lFZGqvXIPoXWa6RWrT5zAUpOGqWSwMe1Fy
         XrtMaGIksNCv8iU9RN/qA1LDY+DSiUbj9g8UE/iv9DcU+WyvQem4njZNhf7kU0Urasu0
         38ArGt2vUFRVzHQLHe5LkxrWBX+vDu4b20DWK1j27R3jsmTRBkXYGj/+yerPBDp5Ya48
         phhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395605; x=1793000405;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0SUy48Ueh56GzaTiRmwygfsPwqE3Nw6AJaFjvfAhy4=;
        b=Id6CHWcDplNsYCF1AQedhbT0gG7nx/rErIEpAjExX+J/llV290nUguO+khjc3D5hxK
         zWrgavmvytGjVpGENc3bci3Or7darYuBEoSEjU8ntnQ7XtUvxroiJ94CymYkY9zYoaGL
         ZwkKmb3ZBSuvHAZd91wEGfFQK90KhiHGKL6dXNo/BVL21B4kCdQxOjrTgnu5oBKbISV9
         BfWWTqbmIgwzC0Oxvxm6LvEkAh/uGuT8fN+IgJIGAc0FypjhzkFXHOYo6yvH1fujcSIR
         gJ+U3UF1Jd8wSiFDE/YLoiro5aUOrVOTrEiHZ5reNXPzm5AEHYuycTiYNfe7naQAOhlG
         OlMg==
X-Forwarded-Encrypted: i=1; AKwUvBxmz4HvynS4O/IrPpL6Fho6DEmP0nPgROXamlG62u+AEaAUH/3yw3PirgAojah5Akz0P7j1PU60wddSupTlZ4gP@lists.infradead.org
X-Gm-Message-State: AFq9FYJGPrcB4nA72aZ7wtdJuG+L3edCVtcjtoWTgdriIHIHDfkcwPVI
	xuShMUDSe8RkTVfPWPAYwjpg7FhDlG6DIOjzVcFUHG0Pv5Nux1raTiestlRcVRUSfX0=
X-Gm-Gg: AYBFou2oODgNXmOv7Mb3jdx+Ava98ijZzJizjKPnffhVbi1qVPG2oz10Jaw4FmgglYu
	EnUhg85AhceIturkNtoN8Pl+bTc8PMRZNKt8GetKdbkwd3rKCxOV7ouCLdB7L8PTxLLRDzJPIZd
	wV+YTpPzNKGEbIrseH4VWKkgrVxRmP30sCjKOH6Vrg7yDMBO4HE/3j9RLPjgmJafQ8RzMlcKHm1
	T5+3BSVeTxjySJUkRhNkP63vYmhW5ozsh83iJuZJNVlr+f0CQG/CchvmABTkzSySFEoNcqaQGqT
	AVAx9MZoaqUjPl9KSjKU4nwiIxAn40blU47VoIwQu2GGbWm2mClQBycAQz5rZxhG/y782vsoN6Z
	oq4+AGI9TUUmAz0/X+asYMtses8n0AEGNeT4/2Olry9kwht3utFBrRLYdDK0pC9ejab43Tc2dU2
	lAhvrJh4qvRX+Zrl5ZgrBh0D7yKKpmiLdub/SoRVs6uqve39gC7BC2cWyEkOwUwfooltxIyzr0c
	GxWGYOn7XyGgUpOMXNrvoQaAHSOXu29dANNvfqGu5l3dcnfJQ/ndQ==
X-Received: by 2002:a05:6000:29c6:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48e07bbd36emr9726692f8f.11.1792395604385;
        Mon, 19 Oct 2026 00:40:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bd9sm22298261f8f.35.2026.10.19.00.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:40:03 -0700 (PDT)
Message-ID: <98df3ac1-c6ae-4acb-b0ee-ddda92487660@linaro.org>
Date: Mon, 19 Oct 2026 09:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] i3c: master: svc: Add Amlogic A9 glue layer
To: junyi.zhao@amlogic.com, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com,
 Kelvin.Zhang@amlogic.com
References: <20261019-a9_i3c-v1-0-329d819d621f@amlogic.com>
 <20261019-a9_i3c-v1-3-329d819d621f@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261019-a9_i3c-v1-3-329d819d621f@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_004006_683812_0D6394EE 
X-CRM114-Status: GOOD (  32.12  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 10/19/26 07:34, Junyi Zhao via B4 Relay wrote:
> From: Junyi Zhao <junyi.zhao@amlogic.com>
> 
> Add support for the Amlogic A9 implementation of the Silvaco
> SVC I3C controller.
> 
> The glue layer provides Amlogic-specific operations and resource
> handling while reusing the common SVC I3C core driver.
> 
> Add a corresponding MAINTAINERS entry for the Amlogic I3C
> controller.
> 
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> ---
>   MAINTAINERS                          |   6 +
>   drivers/i3c/master/svc/Kconfig       |   7 +
>   drivers/i3c/master/svc/Makefile      |   1 +
>   drivers/i3c/master/svc/i3c-amlogic.c | 250 +++++++++++++++++++++++++++++++++++
>   4 files changed, 264 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dffc63af2..478979446 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1398,6 +1398,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
>   F:	drivers/media/platform/amlogic/c3/isp/
>   F:	include/uapi/linux/media/amlogic/
>   
> +AMLOGIC I3C DRIVER
> +M:	Junyi Zhao <junyi.zhao@amlogic.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/amlogic,i3c-a9.yaml
> +F:	drivers/i3c/master/svc/i3c-amlogic.c
> +
>   AMLOGIC MIPI ADAPTER DRIVER
>   M:	Keke Li <keke.li@amlogic.com>
>   L:	linux-media@vger.kernel.org
> diff --git a/drivers/i3c/master/svc/Kconfig b/drivers/i3c/master/svc/Kconfig
> index 14fa1e542..df3528bc1 100644
> --- a/drivers/i3c/master/svc/Kconfig
> +++ b/drivers/i3c/master/svc/Kconfig
> @@ -18,4 +18,11 @@ config I3C_SILVACO
>   	  compatible strings such as "silvaco,i3c-master-v1" and
>   	  "nuvoton,npcm845-i3c".
>   
> +config I3C_AMLOGIC
> +	tristate "Amlogic I3C support"
> +	default y
> +	help
> +	  This selects the Amlogic SoC glue layer support for
> +	  the Silvaco device driver. This driver is used for A9, C5 SoCs.
> +
>   endif # SVC_I3C
> diff --git a/drivers/i3c/master/svc/Makefile b/drivers/i3c/master/svc/Makefile
> index cf18c5da6..695863d1f 100644
> --- a/drivers/i3c/master/svc/Makefile
> +++ b/drivers/i3c/master/svc/Makefile
> @@ -3,3 +3,4 @@
>   
>   obj-$(CONFIG_SVC_I3C)	+= i3c-main.o
>   obj-$(CONFIG_I3C_SILVACO)	+= i3c-silvaco.o
> +obj-$(CONFIG_I3C_AMLOGIC)	+= i3c-amlogic.o
> diff --git a/drivers/i3c/master/svc/i3c-amlogic.c b/drivers/i3c/master/svc/i3c-amlogic.c
> new file mode 100644
> index 000000000..82300d6ae
> --- /dev/null
> +++ b/drivers/i3c/master/svc/i3c-amlogic.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +#include "i3c-main.h"
> +#include <linux/math64.h>
> +
> +/* Amlogic specific registers */
> +#define I3C_BG_RD_ADDR			0x200
> +#define I3C_BG_WR_ADDR			0x204
> +#define I3C_BG_WR_CTRL			0x208
> +#define I3C_BG_R_TT_LEN			0x20c
> +#define I3C_BG_X_CNT			0x210
> +#define I3C_BUS_MON_CTRL		0x214
> +#define I3C_BUS_MON_ADDR		0x218
> +#define I3C_BUS_MON_DATA		0x21c
> +#define I3C_BUS_MON_DATA_MAK		0x220
> +#define I3C_CLK_SLOW_DIV_CTRL		0x224
> +#define I3C_BG_R_WCNT_CLR		0x228
> +#define I3C_DEBUG_MODIFY		0x22c
> +
> +#define I3C_AO_CLK_SLOW_DIV_CTRL	0x300
> +#define I3C_AO_FCLK_DIV_CTRL		0x304
> +#define I3C_AO_FCLK_DIV_MASK		GENMASK(7, 0)
> +#define I3C_AO_FCLK_DIV_EN		BIT(8)
> +#define I3C_AO_FCLK_EN			BIT(9)
> +#define I3C_AO_DEBUG_MODIFY		0x308
> +
> +#define I3C_DEFAULT_FCLK_RATE		25000000UL
> +
> +struct amlogic_i3c_priv {
> +	int num_clks;
> +	struct clk_bulk_data *clks;
> +};
> +
> +struct amlogic_i3c_drvdata {
> +	int (*fclk_rate_init)(struct svc_i3c_master *master,
> +			      struct clk *fclk, unsigned long rate);
> +};
> +
> +static int default_i3c_fclk_rate_init(struct svc_i3c_master *master,
> +				      struct clk *fclk, unsigned long rate)
> +{
> +	int err;
> +
> +	err = clk_set_rate(fclk, rate);
> +	if (err)
> +		return dev_err_probe(master->dev, err,
> +				     "setting fast clock rate failed\n");
> +
> +	return 0;
> +}
> +
> +static int ao_i3c_fclk_rate_init(struct svc_i3c_master *master,
> +				 struct clk *fclk, unsigned long rate)
> +{
> +	unsigned int div_cnt, reg_val;
> +	unsigned long fin_freq = clk_get_rate(fclk);
> +
> +	if (!fin_freq)
> +		return dev_err_probe(master->dev, -EINVAL,
> +				     "can't get I3C fast clock rate\n");
> +
> +	div_cnt = div64_u64(fin_freq, rate);
> +	if (!div_cnt || div_cnt > I3C_AO_FCLK_DIV_MASK)
> +		return dev_err_probe(master->dev, -EINVAL,
> +				     "requested fast clock frequency too low\n");
> +
> +	reg_val = I3C_AO_FCLK_DIV_EN | I3C_AO_FCLK_EN | (div_cnt - 1);
> +	writel(reg_val, master->regs + I3C_AO_FCLK_DIV_CTRL);
> +
> +	return 0;
> +}

You could also create a clock divider, register it and use a common clk_set_rate()
for both setups.

Neil

> +
> +static int amlogic_i3c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct amlogic_i3c_drvdata *data;
> +	struct svc_i3c_master *master;
> +	struct amlogic_i3c_priv *priv;
> +	struct clk *fclk;
> +	int ret, i;
> +
> +	master = svc_i3c_master_alloc(dev);
> +	if (!master)
> +		return -ENOMEM;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	master->drvdata = of_device_get_match_data(dev);
> +	if (!master->drvdata)
> +		return -EINVAL;
> +
> +	data = master->drvdata->bsp_data;
> +	if (!data)
> +		return -EINVAL;
> +
> +	master->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(master->regs))
> +		return PTR_ERR(master->regs);
> +
> +	master->irq = platform_get_irq(pdev, 0);
> +	if (master->irq < 0)
> +		return master->irq;
> +
> +	priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
> +	if (priv->num_clks < 0)
> +		return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");
> +
> +	for (i = 0; i < priv->num_clks; i++) {
> +		if (!strcmp(priv->clks[i].id, "fast_clk"))
> +			break;
> +	}
> +
> +	if (i == priv->num_clks)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "can't get I3C peripheral clock\n");
> +
> +	if (IS_ERR(priv->clks[i].clk))
> +		return PTR_ERR(priv->clks[i].clk);
> +	fclk = priv->clks[i].clk;
> +
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
> +
> +	master->dev = dev;
> +	master->bsp_priv = priv;
> +	ret = data->fclk_rate_init(master, fclk, I3C_DEFAULT_FCLK_RATE);
> +	if (ret)
> +		goto err_disable_clks;
> +	master->fclk_rate = I3C_DEFAULT_FCLK_RATE;
> +
> +	pm_runtime_set_autosuspend_delay(dev, SVC_I3C_PM_TIMEOUT_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret = svc_i3c_master_probe(pdev, master);
> +	if (ret)
> +		goto rpm_disable;
> +
> +	platform_set_drvdata(pdev, master);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +
> +rpm_disable:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +
> +err_disable_clks:
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +
> +	return ret;
> +}
> +
> +static void amlogic_i3c_remove(struct platform_device *pdev)
> +{
> +	struct svc_i3c_master *master = platform_get_drvdata(pdev);
> +
> +	svc_i3c_master_remove(master);
> +
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int __maybe_unused amlogic_i3c_runtime_suspend(struct device *dev)
> +{
> +	struct svc_i3c_master *master = dev_get_drvdata(dev);
> +	struct amlogic_i3c_priv *priv = master->bsp_priv;
> +
> +	svc_i3c_save_regs(master);
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +	pinctrl_pm_select_sleep_state(dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused amlogic_i3c_runtime_resume(struct device *dev)
> +{
> +	struct svc_i3c_master *master = dev_get_drvdata(dev);
> +	struct amlogic_i3c_priv *priv = master->bsp_priv;
> +	int ret;
> +
> +	pinctrl_pm_select_default_state(dev);
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		return ret;
> +
> +	svc_i3c_restore_regs(master);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops amlogic_i3c_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				      pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(amlogic_i3c_runtime_suspend,
> +			   amlogic_i3c_runtime_resume, NULL)
> +};
> +
> +static const struct amlogic_i3c_drvdata amlogic_i3c_data = {
> +	.fclk_rate_init = default_i3c_fclk_rate_init,
> +};
> +
> +static const struct amlogic_i3c_drvdata amlogic_i3c_ao_data = {
> +	.fclk_rate_init = ao_i3c_fclk_rate_init,
> +};
> +
> +static const struct svc_i3c_drvdata amlogic_a9_drvdata = {
> +	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
> +		SVC_I3C_QUIRK_FALSE_SLVSTART |
> +		SVC_I3C_QUIRK_DAA_CORRUPT,
> +	.bsp_data = &amlogic_i3c_data,
> +};
> +
> +static const struct svc_i3c_drvdata amlogic_a9_ao_drvdata = {
> +	.quirks = SVC_I3C_QUIRK_FIFO_EMPTY |
> +		SVC_I3C_QUIRK_FALSE_SLVSTART |
> +		SVC_I3C_QUIRK_DAA_CORRUPT,
> +	.bsp_data = &amlogic_i3c_ao_data,
> +};
> +
> +static const struct of_device_id amlogic_i3c_of_match_tbl[] = {
> +	{ .compatible = "amlogic,i3c-a9", .data = &amlogic_a9_drvdata },
> +	{ .compatible = "amlogic,i3c-ao-a9", .data = &amlogic_a9_ao_drvdata },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, amlogic_i3c_of_match_tbl);
> +
> +static struct platform_driver amlogic_i3c_master = {
> +	.probe = amlogic_i3c_probe,
> +	.remove = amlogic_i3c_remove,
> +	.driver = {
> +		.name = "amlogic-i3c-master",
> +		.of_match_table = amlogic_i3c_of_match_tbl,
> +		.pm = &amlogic_i3c_pm_ops,
> +	},
> +};
> +module_platform_driver(amlogic_i3c_master);
> +
> +MODULE_AUTHOR("Junyi Zhao <junyi.zhao@amlogic.com>");
> +MODULE_DESCRIPTION("Amlogic I3C master driver");
> +MODULE_LICENSE("GPL");
> 


