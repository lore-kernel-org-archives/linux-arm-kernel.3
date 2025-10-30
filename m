Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3593CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lz2wxKaeXnztSBPHZVxZj1ui+100tXbJd+q75YbpezI=; b=sABTUJwrGxaJrO1AtSCESxzM0s
	8aoXz8K2q7QAxlw8HWffz6X49UixRQXxYMsfVTdreGSXA4i8x/2FKXzVeddvdNXuK3S9M2aWS4zxe
	1scma3Fp44Mg5C5XQXxAPONLO3Y33KafFLH8j2BRsv+Xk607R9UspR9j0cpanXC4eURaJqfoGw5xp
	Om4rhtn+Z2kVYrEoRfAKLydMOE9OWgS6aodfjnZ5//sE8nvItvPAZ/ldytcL8IXQPg38RMo6wlonb
	VUoKlfXKqOTUd15E36CnaB8nbAL4mYmcFrgPky1YO3HSYNvH6xyh2EIcL1IepBO2F1U0Fd1FU0fBy
	YVplF/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOR8-00000003o14-2JYq;
	Thu, 30 Oct 2025 08:55:14 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOR5-00000003nzs-2j61
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:55:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-592f29e273bso711570e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761814509; x=1762419309; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lz2wxKaeXnztSBPHZVxZj1ui+100tXbJd+q75YbpezI=;
        b=lOZNNraj0ki7M579b6UtzEry9EK8IB9zWY48WtyJg+KlJ8mKwWBA2Wmh+eJwcTYvWv
         uBH9dAjn/hDkT48jUZox3U2nAksl23SdJvx8BL/pklRZ1A4dyrZyF4xdKYF13AJ7LfKl
         nvy1DjJsMAgM+vHpAXqADH7m+fu0kPrZnFjJM5ZQzCysa4/t6j7h55EsXHFKVXwgMveG
         5/6RS/JInpsAMFIrMK581+5pS7LctkaUkjTHqemWCg82keVLttz1qj5dwxpomkEOCdVI
         VseB11LsfpwPvBdO4HdgZ4duIQfAXH0MdE5XGEJ5bd1l+A159F2G/utCwdPCm9/YvnSn
         uXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761814509; x=1762419309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz2wxKaeXnztSBPHZVxZj1ui+100tXbJd+q75YbpezI=;
        b=LYkx8HSCgR/Twe7lZD7SNXYUc6TGdcDQSnLa39ctqrrrnJzTHpmRS9Orqv73Bdg6UA
         Asyh16LFV0sQXB06ILQmUc9gnssa+mh3i+Zu95guMipjK9PCA1qnMKAi5nK8XstxJPKE
         trNDdzopT+X8hx1Fthiq7guv2rep3bbOZmMqtmXjpnnwO3myHt8XRKMFaH0MY0Ppk5nX
         OR+3wo1vT+qe4pQ7E3zP3ge14Lse+vdGrPdAszpPFi+GUGiQNQGvTWKPJvXTkPZvVbiD
         h84GrAN4tj+rv/Tb8IJv3yvbNmh+MrHXlm8u4N/mk9BrxxrL0LKsWomqFFctZYofNEkF
         AigA==
X-Forwarded-Encrypted: i=1; AJvYcCXWDb5l3neAli6yriJrw45zl0IxwGE1nkA/k//WIECsTYD6xUT78f3ctZb71eCVa+6PK/vct/TrIROwZGxJlFWd@lists.infradead.org
X-Gm-Message-State: AOJu0YyUQZAg1iWXYN2TsVhSQqrWHHqDunecXN44SHWO02lwHLDp/QOi
	6gFJv4vOHx8Gsises7h6Q73F1QmBxKsydDhI4FmitZCM5BfBYUPXrTIy
X-Gm-Gg: ASbGnctPKu7hz3tG9n6D8fMIeNG9Vd872X7OrR/VX9KRadLntY4eX2u0TRYy3mJfnTp
	+WgHN5DRZ5llIiZK2owDRgrLZJsN+dNZLR3FxRnsp/yXEwR9zJDZ3h1QXYKGWPEU6hGQjGFHoIp
	kMYaHbwiFPIN+wewwU5E5w8zlHOOtm3DjcbUB5thr4Cb1sIWkGaQHOA/xKgQkLp+EwXs/XOkwB3
	TIdaK5Y9ZathG+GeoogmmNQOz97ypuRsVq+azlRb/0LHROrRapmClOx6l7p5WAV5aEY5c31Q8EU
	Q4y3e2HuEvj9WFR7JBBX5qkTS4GZIg3kpWajsqYkCi/kaWyRwD1pVAm8JcF/hxn0l+czPZusdb8
	DQz+E/4He75H0WKJYHHUb1KWYQSN98L3eBjV8RQvi+zB/J95Db0WsYZ0SUAge9A+3Kl58I/onlt
	fsfjF0tMW0j80EnMd0QDHLzAA0AUrWiuOU+b6qSKMqfbOn9FG58rOOF3LBvA==
X-Google-Smtp-Source: AGHT+IGxefDaDMkvXf+C6MInrLdPPOS2BAZ41RZb8shvZ6Cg4IwpRXpVQvrD4g2MHSCgteFU4nxUAQ==
X-Received: by 2002:a05:6512:b8c:b0:584:2746:c6d8 with SMTP id 2adb3069b0e04-59412c424b5mr1969364e87.29.1761814509186;
        Thu, 30 Oct 2025 01:55:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941566452esm866246e87.8.2025.10.30.01.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 01:55:08 -0700 (PDT)
Message-ID: <8fb5a1a0-96a5-4830-a9f5-4e624ac806cc@gmail.com>
Date: Thu, 30 Oct 2025 10:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] regulator: bd718x7: Fix voltages scaled by
 resistor divider
To: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
 <20251030-mini_iv-v3-2-ef56c4d9f219@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251030-mini_iv-v3-2-ef56c4d9f219@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_015511_717758_1757E536 
X-CRM114-Status: GOOD (  16.15  )
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

On 30/10/2025 08:35, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The .min_sel and .max_sel fields remained uninitialized in the new
> linear_range, causing an error further down the line. Copy the old
> values of these fields to the new one as they represent the range of
> register values, which does not change.
> 
> Fixes: d2ad981151b3a ("regulator: bd718x7: Support external connection to scale voltages")
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   drivers/regulator/bd718x7-regulator.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
> index 022d98f3c32a2..ea9c4058ee6a5 100644
> --- a/drivers/regulator/bd718x7-regulator.c
> +++ b/drivers/regulator/bd718x7-regulator.c
> @@ -1613,6 +1613,8 @@ static int setup_feedback_loop(struct device *dev, struct device_node *np,
>   				step /= r1;
>   
>   				new[j].min = min;
> +				new[j].min_sel = desc->linear_ranges[j].min_sel;
> +				new[j].max_sel = desc->linear_ranges[j].max_sel;
>   				new[j].step = step;
>   
>   				dev_dbg(dev, "%s: old range min %d, step %d\n",
> 

Thanks a ton for fixing this! Very much appreciated :)

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

