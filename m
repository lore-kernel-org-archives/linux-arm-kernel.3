Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3543D172CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 05:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/OodEpFjOF1QKMpfh/He7lSljXTwFAUK5yvvx1mDI8=; b=HmnRwg4XrG1xw8kBTZgsPUKdxY
	mpBy8AG2+ZughkGsKCzUTBQc5cfh51t4fmbHQCRUzl1Xeh0G44UBHDI997l27QSdbO+5+dX5UsZdo
	yzKqFC2BUW7cMrVSlLmlvG4i0DbPdtnGQEclfrgy++2f+6niJM4F+pv/0wlhDvCkVPStrVKOmlOqO
	bKIlbKorbEqBNpTkBoFB7NklFHhcKW/CGbtCY47HGtX6xuRxHq4/7i01tp7y3l2kBu8lXU1Juek+N
	NX6f4PpYUtUAXa+p2CIhOuTdxko9+Pi+wnM2cqLLiiqgnOuxnK3OeoS3FaG+6rk7p9vWrkf2F+jlB
	Wle2beUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmmgf-00000004T7D-2mRs;
	Mon, 02 Feb 2026 05:41:25 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmmgb-00000004T6o-3Noy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 05:41:23 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c636487ccaeso1655331a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 21:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770010880; x=1770615680; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/OodEpFjOF1QKMpfh/He7lSljXTwFAUK5yvvx1mDI8=;
        b=ETygvPqow5+CiejtPDprDJ0l+AVaUm5hiQgkaBAsyyFETaHN+Vo7rCnIzwibb7C5T5
         j50EjqJ9fkJDSrMV1tgrZJJtqEf/jcHmfT7g3Ft5PVOiE/HsjljDivRMzPCoteze1j3c
         aZj3/AOaW8DKxZPruT/2PdkozuuogzeFGgFQ2uvRfxMFgJ7o0WdYiXFerPgj976IP4Zk
         +UKoFYNPNWjOuEPUvzrU2wNgWowjQq07AYI/svQUTnYFbyCSQZlWntxwDQUmooiZ+SVI
         rnz+tsotPq99nJET9g4qYPi/JqfWrqijdKD8lWIWUmZnetjOwdNhC7p8Ehcf688T9FoF
         ojxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770010880; x=1770615680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/OodEpFjOF1QKMpfh/He7lSljXTwFAUK5yvvx1mDI8=;
        b=AzPzgIUvJZ8dkuj1z/iSTubrFsoktGuMnS1okCrZ5CRzcuqTUm5itYshnkBG2G6ypo
         GDbLN5KHlgIBp0vw+eC6SvY+IOS9dsiKttIACNvq8IgASs7RbKIiKv44cLJBlE5E7fwy
         eLtiFInwo9ZXHEQfpoo3amS6Lw32EeUkVxwsIFYXNmZm2chJs0++buGFmAeoeeSMfqSH
         cOHAZEz7nb2u2v75qTc3vg7DOcMGCbN7MQm9/2awwbWtO8bBXjeEUobnUY2J/lstua/s
         0CFM+crA6rKxmDuYmKGgt+zUQJAcywKmz2rLbIbK/6pHM++vsvy94p7W0ds8UyE6CB5z
         pGUA==
X-Forwarded-Encrypted: i=1; AJvYcCVnifHz6t44TdVcstVzeOhBJ4w7YVyX5udMqwOs131PjiUSidGcVcTLvfGYgq3c7v344hnGGl0dFpEUcj7wqUqU@lists.infradead.org
X-Gm-Message-State: AOJu0YxD2ByGVV/EyX3q/YCpPuEYA2Bh6eS/PgZoUwzDz0ToqeLw5eSz
	t8S5lmQVmAApUhzK+wj3WKn/04mZss8emXWNhSdY7aLtFiiefESQTgOYUyG6AtYF
X-Gm-Gg: AZuq6aJd8ZsampXzmrvX3IFWJ2I094RGMLrVxqLX5Z4PfoDBOznvapiKQCkia1cxUVe
	i9vrqw+OO1lTCC70q0b5db1B/R+QjOy9TXzxu+6oTQQEiqSMMh8w07/QmqklMc0nEU2jXtN8ida
	soQ+iiK/gugdSxIYluqw8eGWjbXmEci2ObdovI5RNkqPWWGbFFSGACeP9e5vauDTcu/x4hp/xLf
	zl4q7Hwwo7C8Qv4+5MSHPyw5XrFOFh0YvJdK99QxGv3i658WtU7yiOvOUdqdIWjP+ySVOQ5zpLR
	gcD2feBo5Y8PrDzEGlssMnGA9dcUCBU4uB1eEcsnqblEgCYeGBGEZQIkmBZaVzwzxWQJOUyzcbA
	+4KBQ2T4UOeAxcMTZAZ7vXoNpHIDEyqUQ0HoHLJp4FCLVzbqLTFeta7sBpuGnR47EphtiyKbJpR
	47msZgY05bAK4v1XITfkEzSCWD3c6QQ7M6XOrEbJuCz0WIESWxZcdTnF3KVTjzPGus33C/dR4s4
	VQ=
X-Received: by 2002:a05:6a20:12d6:b0:351:2c6e:6246 with SMTP id adf61e73a8af0-392e0148042mr8658013637.56.1770010879891;
        Sun, 01 Feb 2026 21:41:19 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c64276efb16sm13296475a12.4.2026.02.01.21.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 21:41:19 -0800 (PST)
Message-ID: <217f7407-ede2-4be8-bbd8-f2e499170e24@gmail.com>
Date: Mon, 2 Feb 2026 13:41:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v10,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Jakub Kicinski <kuba@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, ychuang3@nuvoton.com, andrew+netdev@lunn.ch,
 linux-stm32@st-md-mailman.stormreply.com, yclu4@nuvoton.com,
 pabeni@redhat.com, davem@davemloft.net, andrew@lunn.ch,
 peppe.cavallaro@st.com, joabreu@synopsys.com, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, krzk+dt@kernel.org,
 edumazet@google.com, robh@kernel.org, schung@nuvoton.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
References: <20260129054445.416242-4-a0987203069@gmail.com>
 <20260131015008.970729-1-kuba@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260131015008.970729-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_214121_859835_439BA911 
X-CRM114-Status: GOOD (  16.79  )
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


On 1/31/2026 9:50 AM, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
>
> Adds Gigabit Ethernet support for Nuvoton MA35 series SoCs using
> the stmmac driver framework.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> [ ... ]
>
>> +static struct nvt_priv_data *
>> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *bsp_priv;
> [ ... ]
>
>> +	bsp_priv->regmap =
>> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(bsp_priv->regmap)) {
>> +		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
>> +		return ERR_PTR(-ENODEV);
>                             ^^^^^^
>
> Should this propagate the actual error code from
> syscon_regmap_lookup_by_phandle_args() instead of always returning
> -ENODEV? If the syscon lookup returns -EPROBE_DEFER, this will lose
> that error code and prevent the driver from properly deferring its
> probe when dependencies aren't ready yet.
>
> Other dwmac drivers (dwmac-loongson1, dwmac-starfive, dwmac-sun8i) use
> something like:
>
>      return dev_err_probe(dev, PTR_ERR(regmap), "...\n");
>
> or
>
>      return PTR_ERR(regmap);
>
> to propagate the error.

Thanks for pointing this out. I'll fix it in the next revision.

Joey

>
>> +	}
> [ ... ]

