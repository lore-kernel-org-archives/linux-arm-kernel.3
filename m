Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EFCC636B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 00:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=; b=3JDfV/8WsCRgK1hSOz2/QYj5Zx
	VjCy3daYv/4dNB9iOE09L60SmqN9XqBrbRt3IXfb7Q5xPFfN44o1jz9XrxzktoFEfg1Go3hpaeBdJ
	1y4WFJXI/2AXWJBifUN+qEu683731nJDTjksnaeBtrRh4q2N7zaYoMNJnAwAS1WKFIkFerA/rsUis
	7vVt2Di53MldWjwFSa3grMSAapDCRw7eDwbGeP4H7eabOnp8Z5tUWvmm5S2OS7rlgIyve0pcMCLWW
	zDAHp/gZaPFnhAdECgRP0J80HCtPmWQ23uf83kn0JxNupX7b2L5GKX/r7aYaAiprp9VpnqUrOLeok
	eFC+2qEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuJYW-0000000H4VX-2iFo;
	Mon, 23 Feb 2026 00:12:08 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuJYT-0000000H4Uq-45e2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 00:12:07 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-40ee9b945d5so2291229fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 16:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771805524; x=1772410324; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=upCUMd9CmOJwJIkGsEwqQA2upUqFtA7iOAegJL/47M/3ANoKP/TX3unlh/mugdlyTB
         heLnP2wvmppnQVsht8HiV+pRWDsB2tqz983/tL5A5k72KjWenw9q2FhUy+FCsmOK0D9o
         u2SfF9FmQLLRF7ypwtUTMXpOUNkHWliG+te7LFKEAZi/pgGulnTlDlRHUjVaqZetdIcI
         kuPBF+CX/3Qeg09p3DsZNAGH8pHlW7bQL1Ls3j9RNSMEznOoPgUipu4QYs5oN/ar4+z4
         8OwQFNXiq0ocZiqnnFlYjJyz/v+jXnAE989wdyZk67oiUEBByeCz1WJvCkQ4CbFOYjSK
         RDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771805524; x=1772410324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=sWvT+rHEsBGbEuKEchqEOL5G1ZauxSMPULtM4JOQhfhjU+HCvJWWCD6ONZ2wFTd1cK
         s/VMinaT9s80XAYj/BP3xDlVG1nPaFwJ3GpTdWiZaD++1Ru7JhRbDnmxDKZVOqAnSMDR
         c8Yn0I2VNgT/v7K8wEfWQYGWWsyktxDrOyPjYF6uIwxOQ4zy7ohFp00FDZ/J6lEm6zKi
         cevipee5MQDvOTasJiYJD2h85f/WThB9agmffCQBSCc0NP6AAN0W2QHoHMZQPDCpUq7+
         WKgoRZveRyw1ocdFgzrusZAtlI2AG8JQ0A2LCTbM2LfL4sYAmtzFC24XWH2aQQezF0Rl
         PaXw==
X-Forwarded-Encrypted: i=1; AJvYcCVvlvNzsa4mB0KwlDxsc4U0/HGE5HHxAmeHdfwjmmEIrLIkaylMJbClVgZDMLCuJJ7GD69IK/XkG/kzx+ZNznDe@lists.infradead.org
X-Gm-Message-State: AOJu0YyuIo8q01bdOWrYnK+V+JiCyaNJkSkZt5IZ8xC4gVUdzjNYo1c3
	4AW7ZVx/+TSHiYz8Oap8WPEgxzuOoMTMVj6T4MdGi0kw1DXGpWkcSB2QKeU0k2sjU0g=
X-Gm-Gg: AZuq6aImlbMa0ybgVCmdas2bny+NgFhxuzs2VyIh9bp5mhDh30bkADibStTNWbgD5NO
	nznLsLt0jO76nEbQJchvqNJy2JLl8P1pyNOQ9wr8ptoEF9K4bvftmULYZUe9UqgIS1wg63y5vN4
	2k6KQxTZXDGGYoN4YBkmty8wn5rMqvBZe5iG3zO36NQD2TkXkZkMwO5/cQBo8ifrZDX1e8GzYuC
	+RNEr3dJQs3KI5KNEITbJWQAcV0IeT4d85KdBprrBtSkBPGGSsE5Eeute8molKbWtwEB6QgxUch
	TvSc7THVFaB2vfVdxoMi5CMc77D1w85zNdhBPA8wVTtxDULM5/ZI68jGdFmuORfgR7oq4YE+m3K
	7onwASrPEuC3J93q4t7B4apYFAUKjSlh3Zi4u7lDlU7CP4NsV1/lYVITSXRM9nvDZ88L4FScPgX
	GJ52nyrGys77y8y+ft8OlsSK835EXgz5V5JMK0zNeagqxXSKwBy2eTSwMKxavWYiT3BW5UZlo=
X-Received: by 2002:a05:6870:f61b:b0:409:794e:fe9 with SMTP id 586e51a60fabf-4157b1b3fd3mr3557313fac.54.1771805524220;
        Sun, 22 Feb 2026 16:12:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e37:2309:3937:4469? ([2600:8803:e7e4:500:e37:2309:3937:4469])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157ca3df7fsm6409978fac.0.2026.02.22.16.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 16:12:02 -0800 (PST)
Message-ID: <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
Date: Sun, 22 Feb 2026 18:12:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
 <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_161206_025462_721C83B8 
X-CRM114-Status: GOOD (  20.65  )
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

On 1/18/26 12:09 PM, Krzysztof Kozlowski wrote:
> Simplify error handling by removing two mutex_unlock() calls with
> scoped_guard().
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index e44ef262beec..bbe1cf712965 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,

Filling in some context from the existing code...

	for (i = 0; i < num_configs; i++) {
		param = pinconf_to_config_param(configs[i]);
		arg = pinconf_to_config_argument(configs[i]);

		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
			/*
			 * Check for gpio driver not being probed yet.

>  			 * The lock makes sure that either gpio-probe has completed
>  			 * or the gpio driver hasn't probed yet.
>  			 */
> -			mutex_lock(&bank->deferred_lock);
> -			if (!gpio || !gpio->direction_output) {
> -				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
> -								arg);
> -				mutex_unlock(&bank->deferred_lock);
> -				if (rc)
> -					return rc;
> -
> -				break;
> +			scoped_guard(mutex, &bank->deferred_lock) {
> +				if (!gpio || !gpio->direction_output) {
> +					rc = rockchip_pinconf_defer_pin(bank,
> +									pin - bank->pin_base,
> +									param, arg);
> +					if (rc)
> +						return rc;
> +					break;

I think there is an unintentional change here.

scoped_guard() is implemented by a for loop. So the break statement is now
breaking out of the scoped_guard() scope rather than breaking out of the
outer for loop.

> +				}
>  			}
> -			mutex_unlock(&bank->deferred_lock);
>  		}
>  
>  		switch (param) {
> 


