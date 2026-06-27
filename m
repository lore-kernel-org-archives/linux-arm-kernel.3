Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622E1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 23:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sc0LVF54eIDE0MT2UAxiqee+b3f/jtlBzR5Bzv0cEZU=; b=bNuNUp+f6GAGS6trg8gDE/zEzu
	5n6httWiNqFhS0HxKJqfzh3bZZ5O66oTjDWxywjycnwTqdUE+AT5KB6Jp0VxyD5R0zxsKeEReg+6n
	fdGSi7zXecYxuF+CVRH9VtlzG2lcD7NvBBYp/QNcwEThLKfOW21KktdnCrbjAbDUswOK+3+Yr0v1l
	/GuFxtpxAOL0TMfjYtgtm87jYgc71YevshLUH8T6JF2EpM0MhgdnjOdCQoXyu44F7tCYOMEXv217x
	U4RyF1dVcRjSgVHdSU21JMujoejNt1kBRRq74f84O8ilp0gewcW8qLYSEbW0ShgTO6CP9OgDn/xYh
	rRvwOcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdc7x-0000000Cp1x-1uOG;
	Sat, 27 Jun 2026 23:07:57 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdc7s-0000000Cp1c-2vLP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 23:07:55 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e9c6ae2a79so334740a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 16:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782601671; x=1783206471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sc0LVF54eIDE0MT2UAxiqee+b3f/jtlBzR5Bzv0cEZU=;
        b=GN7FT7ANsTnFXJ+5rpfpfGyJTtoUWwOdQKM5gAI+ZNjgRcjK66mdEeE8p6lbqHKmam
         m21cKjeidRQnKoZbEvqll0nBGSWKHC/Uwf7iGSQWpgStCDWSzDPfi2cQnMTMcbXVu6PJ
         nbbo6mbbe4cj5TvF4V6GIzR6xY4AzZqjRjjjd8+PgYGr8tYzLanoJftJVpsotAMo4iUP
         /rFFfFYhfeQaBPxqcwVoxpeYfb+UHIJcWdZswREAVUh6rLxCwfFvuEjYWETiGJvcooti
         BX5V33GsPbCgqdtxeTU7uNN+pH1r4akxwz3qlOTeE0zLYljNxO2rrtSWnkFANYfh52/G
         FwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782601671; x=1783206471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sc0LVF54eIDE0MT2UAxiqee+b3f/jtlBzR5Bzv0cEZU=;
        b=iCtg1pmvygGrtotQXP7XCEnNdHBV/toN0YhZBeRZJxaqidQP18Z9vvKDiqb3mTnnBx
         1YjKynTZNzswmOVI0aY+QQjvOOSDP5sq5pRLVeDq46wmMhLI0NoJWAjLgXdHm6U+YlwK
         mMU/yBsnksndk+l3Cg7MBROtI6zePieBIaXxtxsSfT6Y9hjDkOvrjQWiYdtn2SU24I5J
         GFGITtY+BE1Rdjn/n6E0iIAmqq5SBwLGMrbkGXpHFTAafcHA2lJ3wbYbK29Fufvn56Tn
         OvhZx1CPkPhOoiABXN5cw1NTr9S3RgeN96eRNVtOEtBBafOs1FFkvHeCYqApRsX8317G
         C8eA==
X-Forwarded-Encrypted: i=1; AFNElJ9iowMrwEkpY/IDYRrzgxNdhNrEQ07zE3qq+4gBwMang1pS3YPkjcr1jMQQRmaIG5Cr3Xk07HEbf/7G6VKzCELe@lists.infradead.org
X-Gm-Message-State: AOJu0YxAHgXfngviIvpcMOJf5g0oFFK/fJhsbjMFVtfLTGW1lrI17R4e
	xGmGp8K7BI30yt5S1KvMLC5fUq2yJd9ROpjX8eBrZWPyuvtoj4AAS5JpecuAOl/054Q=
X-Gm-Gg: AfdE7cnClBeO+Er6sQ3Ihw/KH5l9dejEiNYRErwZRIfHlY6m562Pm1k2fz7EEx/E8lX
	K8kL2pSfdEUSiM+uA5OvI1iaHt9QPUv7ZEIz7jjYeFww7NUsP+BYVe/eVRref1lf2Yq7l8J7ZZo
	YOnQSbhJQMMX3S2nsm06bkefUjDMkGKgR8ZkEJbq8os1k+XmhBpe/RZX/8Oam+RWzm7KnuyeeY6
	CZTpmIq2g71WQVXW2iGvku1iWKKisgBTRIj/pbUms6f6ePIEV+vCJs8I26ilVALfAXXN3borRNh
	FuY2TJ4HcjdwCKyO1Xa7uy2p9de2iIuxb7CVPNvJvDsVE4+WIdurTeN942UX0iU2RaLSswCDbjt
	Dq4fHBxaFTlmF2vcrn4K8loPsk9+pf3ylOSTua73T6RRfyM5mvR0kKOY/djjZPO+FOBDpOJcNT8
	TLL+hS9P+zq66krEFawI5ZcyjKTyQfJmgRSJKGDdaz015jb3R6MYrb/2wDsZRzSkI=
X-Received: by 2002:a05:6830:349f:b0:7e5:f957:a61f with SMTP id 46e09a7af769-7e99c268898mr11379368a34.18.1782601671671;
        Sat, 27 Jun 2026 16:07:51 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f242:ecd6:f61e:d764? ([2600:8803:e7e4:500:f242:ecd6:f61e:d764])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9b292029dsm3861948a34.22.2026.06.27.16.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 16:07:50 -0700 (PDT)
Message-ID: <6770a7af-06cc-4240-9b20-c299e7080ab1@baylibre.com>
Date: Sat, 27 Jun 2026 18:07:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] iio: adc: add Axiado SARADC driver
To: Petar Stepanovic <pstepanovic@axiado.com>, Akhila Kavi
 <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
 <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_160752_768731_62E43018 
X-CRM114-Status: GOOD (  12.22  )
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

On 6/22/26 2:47 AM, Petar Stepanovic wrote:
> Add support for the SARADC controller found on Axiado AX3000 and
> AX3005 SoCs.
> 

...

> +#define AX_SARADC_CH(_index, _id)                                       \
> +	{                                                               \
> +		.type = IIO_VOLTAGE,                                    \
> +		.indexed = 1,                                           \
> +		.channel = (_index),                                    \
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),           \
> +		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),   \
> +		.datasheet_name = (_id),                                \

This could probably be:

		.datasheet_name = "adc" #_index,

and avoid the need for _id.

> +	}
> +
> +static const struct iio_chan_spec axiado_saradc_iio_channels[] = {
> +	AX_SARADC_CH(0, "adc0"),   AX_SARADC_CH(1, "adc1"),
> +	AX_SARADC_CH(2, "adc2"),   AX_SARADC_CH(3, "adc3"),
> +	AX_SARADC_CH(4, "adc4"),   AX_SARADC_CH(5, "adc5"),
> +	AX_SARADC_CH(6, "adc6"),   AX_SARADC_CH(7, "adc7"),
> +	AX_SARADC_CH(8, "adc8"),   AX_SARADC_CH(9, "adc9"),
> +	AX_SARADC_CH(10, "adc10"), AX_SARADC_CH(11, "adc11"),
> +	AX_SARADC_CH(12, "adc12"), AX_SARADC_CH(13, "adc13"),
> +	AX_SARADC_CH(14, "adc14"), AX_SARADC_CH(15, "adc15"),

Two columns looks a bit odd.

> +};
> +
> +static void axiado_saradc_disable(void *data)
> +{
> +	struct axiado_saradc *info = data;
> +
> +	writel(AX_SARADC_GLOBAL_CTRL_PD, info->regs + AX_SARADC_GLOBAL_CTRL_REG);

People usual make read and write wrappers or use regmap to avoid having
to write `info->regs + AX_SARADC_GLOBAL_CTRL_REG` so many times.

> +}

