Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99DFCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+uPAFUoRnkCQwhRJbg35xw6qqa1PiqgWFEiNSHZCHQ=; b=n41TgFMv/64uul0QRPeygJSpAQ
	Vn+xvdhLBYDlR/Me94q3ep6vidHfAyJPkQLIaHjErXETKC+NF5otYNcLYeeX2UQHnme+se6dvx20b
	ivlEDXTQqx3ejxHy63mVCfVdaEfUIFGW82Ml2utgsfG5vgQrp7HgYJuBiQl/O2zIG65wz9UQQnHH9
	HwsKbX+1dvU2UdC22Erm/fCLH/QwE8syi0L2N/88Wt0gNyI9TZtLCYc18mErZGPGcaYhH7YOEIqH/
	vD1w8YGipFFJsFb+h1MflASQjFUk7QjvkdXdh5YR3VZe2iJo3epQ/apoR0jZuw7GcjJFp/UBrp+mP
	ELKmAmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Bo-00000008JTP-3D4E;
	Fri, 12 Sep 2025 09:35:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Bm-00000008JSK-1cvZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:35:31 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45de185bf68so1410635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669728; x=1758274528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+uPAFUoRnkCQwhRJbg35xw6qqa1PiqgWFEiNSHZCHQ=;
        b=gaBpMnE1cgpoTuDM2rWzEVSrZq4+MxnAti7wswMXHotjWWuEPliAA5E8aN4/CpHZzy
         uE4gfYHMLME+fNHMY9bexNGDcDdvMe1M6KIWnqLtpiJ62ILCLqknK0zyUmJAEdgKm7Gz
         Jj+AEhv0G7EiCAlRwjrDUKyGINZifPWgCAegj+AeqSuwIyAzpPFZXcz3HBwxyhK/g6eO
         tyqafx5lf24AXhiCgp57Jprf8mZB+WPNAuAXEXYvoIdrYWUXqydAYWbSLibIclzldwFr
         h/zN0fk0G0aFngGHJwUUaKk4AzSmXlrjHW1KoSuy2zazmxnqH9V4h9rnsbzajAhz2gno
         ltwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669728; x=1758274528;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+uPAFUoRnkCQwhRJbg35xw6qqa1PiqgWFEiNSHZCHQ=;
        b=B/h5wRc8bfacZ8CdWB2a5oshivnmHcmTklNEo4PLuIXCGT8NgaXRgmRrlcXbnLTbr6
         rhhH7qmcfJ2YP9ooFVQBr2HTIPb8pHq5NwMQA6KUd/iRIZQtQOaAv2fet5lYrwZHFbSV
         t9Rv2D9MvQe7aDiIPepqo5enZKe9YmeeClbvAyRBw8okV053WxwoJXjJRIBECC/u0IPy
         LJ+tKtbN9AMAQKM8qnpmBtd3QrSMmwVyr92OUuCytZlswwJtqBzSpCtlBqCw7gDwJuOA
         IUSyo0FbWd6AufexG87SzMBAYIB59/UDYqhrJinqxejq02eMNgVMElQLZF5ZiC08VBWT
         7JLw==
X-Forwarded-Encrypted: i=1; AJvYcCV8dE4Db/nkGgpEu/7YuzzWzWZEl11TmXqnccNoW9z0rL/DFzoojd9PJmUGWTawtxIFtnvmXxeM8rrWofksfmGf@lists.infradead.org
X-Gm-Message-State: AOJu0YwcA9hSfRSXRX5fsf2d/FjaEAx0iodqKwv+000j3RBveB6ITyfC
	Fk2m60LB8auW9VDuHhILL6vubISVtmdqTC2iSW5NyV42ceFjRYsIBb8ZhouYihPdiB0=
X-Gm-Gg: ASbGnctqacGu+a8wpMYN0JozmnWglznHFnXzo6zK1FMOmfluvIVUcoi3U8sp6GzD05a
	2vkpjFribirsK5gTDXszZa4Y/Idg8yN0MU6P0qhWSKxcvpIKN6wBI/vl2CxR5LyiiFmhqxkpgYR
	jZuxquddkJtxdHvV0aux61h42al/3uwqJFmSLgEAYRvVGASDAu1LWxue31otZuoVJNc8w5CeWUd
	JTmy1DehyWUlAmfiVGjTkBJmzSIXOfJFvSJfuigyMcYP6SD3cOhKb2zVPGDE9k0J1mzLIyEWhWZ
	QATwdYKK33Lm9DYu3D0hZRlvsmrT7wVQFCiwx/upaPP5BsU5/yDc/6m7S2eWTn1ftCyHyQTroat
	IB3BR2t51lGkECVic7DfaQzgJ/IwoN/5yZCWOZViGP3s=
X-Google-Smtp-Source: AGHT+IFtNbd6Dn4WdpmXjcvLYqdhbSTf/jETRe/3ClCTa+iY1WEjN/qZgo/LtPPTOxnrLrm8VWHU6A==
X-Received: by 2002:a05:6000:2503:b0:3d4:c46b:e57e with SMTP id ffacd0b85a97d-3e765536c58mr1055302f8f.0.1757669728478;
        Fri, 12 Sep 2025 02:35:28 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7d9844d24sm187f8f.46.2025.09.12.02.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:35:27 -0700 (PDT)
Message-ID: <795b3754-dbb5-40a6-a333-b333b2e11b86@linaro.org>
Date: Fri, 12 Sep 2025 11:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: Simplify printks with pOF format
To: Linus Walleij <linus.walleij@linaro.org>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_023530_469098_DE12A89F 
X-CRM114-Status: GOOD (  15.98  )
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

On 12/09/2025 11:23, Krzysztof Kozlowski wrote:
> Print full device node name with %pOF format, so the code will be a bit
> simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/sprd/pinctrl-sprd.c      | 9 +++------
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 7 +++----
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
> index c4a1d99dfed0..16cf9d15f247 100644
> --- a/drivers/pinctrl/sprd/pinctrl-sprd.c
> +++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
> @@ -258,8 +258,7 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
>  
>  	grp = sprd_pinctrl_find_group_by_name(pctl, np->name);
>  	if (!grp) {
> -		dev_err(pctl->dev, "unable to find group for node %s\n",
> -			of_node_full_name(np));
> +		dev_err(pctl->dev, "unable to find group for node %pOF\n", np);
>  		return -EINVAL;
>  	}

Heh, I misread the docs and see now in the testing that my patch changes
the behavior. of_node_full_name() is just node name. pOF is full path.

This might be desired (more accurate warning in case many nodes share
similar name) or not...

Best regards,
Krzysztof

