Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA99E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJFc6aCEYuELsqOgEP3eTfZoZbcGrNAKeEe94fE4tQQ=; b=MDHbl+U2B2On/i8a/F8wGcmyxp
	4lG96ZRvm2WDJBgikoKN2DXDsjn92wfHPwS9ribBlzZbtcBZ3Xz7lXjn6/h0+51yZt3cNWDrJBueY
	jrOpHhCOJfOsDA5RRR/R4E0q7zAcRZmMvvRYaZvq9L12Qx7QS+/AOpSnZdLIT16i/1LBoRugKcvgX
	My3LHWo1/WrMsRjNBz6h92256R2o9c1jngLYKYDWiJLgDwKZXYvBug5yvaCWcn7wZTNYd/5c6RaUV
	619OBRoB5rnpHBphBCWaEhNqpjneEBtZrRty/mjITmd+MCe/LEmiZSHb1QY2zfNJ7fIBM6ePDXKhc
	xxf6pnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSp4-00000007tFi-2tsy;
	Wed, 08 Jan 2025 09:57:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSch-00000007qoR-3E9C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:45:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436a03197b2so65390845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736329510; x=1736934310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJFc6aCEYuELsqOgEP3eTfZoZbcGrNAKeEe94fE4tQQ=;
        b=mB2nRhdPe0/8MyMcTeucHwjQr2Va8C8waT+2ILzqBuA3rg9BlcVE4bE7lk4+SQ6exD
         Enstjn+f96J0fRgJ1GQULce5yo7hnLddixDfnOhJ38bxCHEBkV3aWjDavigZKSKbDI4x
         1edXZCrm40q+Mzw5Ub6WpoPzbM1SR2zMVYYRwrpgvnrxbmjpMqhm/+F71H3DWxV3ne5i
         I8YNN6dt9ndOz4BIEarfHvP8WdzaWxX3W+GQhgrs4Lz9XQ+AGG7HqPd4EwOWw7GqiJMF
         xPbuEJ+i//ANxwPRAE+aLgVUgNCsAkKwmKgK4t4LhTnZDS9NNHcZyUyLTkW+V4ge7Y30
         XO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329510; x=1736934310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJFc6aCEYuELsqOgEP3eTfZoZbcGrNAKeEe94fE4tQQ=;
        b=BvmIKXc/KsQxViPZFXsi9iYzOKrgOInegHmdOLdqGRY97WIeF3QvYVNOK5v9epmcyz
         utxMUFBeBLQXq7EUjBtMy5dvQcU9PXNyGPAhCOCH8ab/avJIvybFG7C9EMj6Sae2Av2f
         vvpXw8rn65ErnRU3lfE4JTRE/VQPl2/Wlz6bpYUKuM1Q1SAY7X8/PJCt4kKFETZTEUl+
         gIA9mW9UYFKCc8RTaQN8KtNTtSnxUxbkQsZEDpAJmrhBCrbB48YqCiGPaz4TU6xWE41H
         Lvu5SUQmsxBpkXxi9+79ptqPIkw78P0CgAdrX8vvzk71tG9CBIDtOlVsNWEK1wTu8/ay
         b3dA==
X-Forwarded-Encrypted: i=1; AJvYcCVsIw906Gcw2nQJt7bjCAaE3O7IlOwaEw7ab5KhXkzAmZku4izBMwb1m8OTGm5IPJ53mVtPeHRy/i47xnLRcgm+@lists.infradead.org
X-Gm-Message-State: AOJu0YzuqlhzRlLv2ppwPNkuOtnetsJHB+MCxicJSLoSwkynqIPr9pal
	4Kz7T6nIRjFnfJBHwbQdnzjcAa612NudqTrsa4l0qIzEDyt1Yi7P
X-Gm-Gg: ASbGncur7E5fXQ4hTmQ0ylP3HbFLDfGV3wB7QoC8ULVkNGLoDpIj5pXHNjH+pVuCNSr
	H6LegIR6eBlIitNK0FhdL/rIw2N0OakUbAlz0IFqha5CeZi54PkM9GwLmcekrfJVj6nEABCayc5
	uVWoqlLBCBSHFUKcjWbo1lEd0liH1CoHPFvNkQ2vp2upe7hdQlPok9FCkFB/gc6zkzGx4EtF7Va
	IluhiSe13q3v9bm0nquRbR0fH9vHkB08VxrulLtkmG/Sflzj7tbr9Qp7vTKAgBaRmOBWMgJ0Hmp
	6ltJ5WP4vIg+Z4tdIAX+fQ==
X-Google-Smtp-Source: AGHT+IGBYhtKcH+43aBsDTk5Gv4pcjmdDTwgBqDi6cgn0y4vI6q88YFJFw98p8iVkmiXs+yHyqRHrg==
X-Received: by 2002:a05:600c:3c9e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-436e26a6727mr16110965e9.8.1736329509711;
        Wed, 08 Jan 2025 01:45:09 -0800 (PST)
Received: from [172.16.20.210] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc207csm14729785e9.15.2025.01.08.01.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:45:09 -0800 (PST)
Message-ID: <c30a6f1b-b1a9-40db-b673-e6fc47bdb224@gmail.com>
Date: Wed, 8 Jan 2025 11:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: samsung: usi: implement support for USIv1 and
 exynos8895
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
 <20250107113512.525001-3-ivo.ivanov.ivanov1@gmail.com>
 <6y4mg6atqi6idyoppesg5owrnfrjhkzqh4im4po7urfry2qctb@yimp5y6sm7h6>
 <907e1169-ceea-4d41-93bb-925041de005e@gmail.com>
 <e28abf31-3d91-4d1b-97e6-202df5ebb3f5@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <e28abf31-3d91-4d1b-97e6-202df5ebb3f5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_014511_819062_147B92C8 
X-CRM114-Status: GOOD (  21.15  )
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

On 1/8/25 11:26, Krzysztof Kozlowski wrote:
> On 08/01/2025 10:17, Ivaylo Ivanov wrote:
>> On 1/8/25 10:30, Krzysztof Kozlowski wrote:
>>> On Tue, Jan 07, 2025 at 01:35:11PM +0200, Ivaylo Ivanov wrote:
>>>> USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
>>>> provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
>>>> SPI, UART, UART_HSI2C1).
>>>>
>>>> USIv1, unlike USIv2, doesn't have any known register map. Underlying
>>>> protocols that it implements have no offset, like with Exynos850.
>>>> Desired protocol can be chosen via SW_CONF register from System
>>>> Register block of the same domain as USI.
>>>>
>>>> In order to select a particular protocol, the protocol has to be
>>>> selected via the System Register. Unlike USIv2, there's no need for
>>>> any setup before the given protocol becomes accessible apart from
>>>> enabling the APB clock and the protocol operating clock.
>>>>
>>>> Modify the existing driver in order to allow USIv1 instances in
>>>> Exynos8895 to probe and set their protocol. While we're at it,
>>>> make use of the new mode constants in place of the old ones
>>>> and add a removal routine.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  drivers/soc/samsung/exynos-usi.c | 108 +++++++++++++++++++++++++++----
>>>>  1 file changed, 95 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
>>>> index 114352695..43c17b100 100644
>>>> --- a/drivers/soc/samsung/exynos-usi.c
>>>> +++ b/drivers/soc/samsung/exynos-usi.c
>>>> @@ -16,6 +16,18 @@
>>>>  
>>>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>>>  
>>>> +/* USIv1: System Register: SW_CONF register bits */
>>>> +#define USI_V1_SW_CONF_NONE		0x0
>>>> +#define USI_V1_SW_CONF_I2C0		0x1
>>>> +#define USI_V1_SW_CONF_I2C1		0x2
>>>> +#define USI_V1_SW_CONF_I2C0_1		0x3
>>>> +#define USI_V1_SW_CONF_SPI		0x4
>>>> +#define USI_V1_SW_CONF_UART		0x8
>>>> +#define USI_V1_SW_CONF_UART_I2C1	0xa
>>>> +#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
>>>> +					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
>>>> +					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
>>>> +
>>>>  /* USIv2: System Register: SW_CONF register bits */
>>>>  #define USI_V2_SW_CONF_NONE	0x0
>>>>  #define USI_V2_SW_CONF_UART	BIT(0)
>>>> @@ -34,7 +46,8 @@
>>>>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>>>>  
>>>>  enum exynos_usi_ver {
>>>> -	USI_VER2 = 2,
>>>> +	USI_VER1 = 1,
>>> Is this assignment=1 actually now helping? Isn't it creating empty item
>>> in exynos_usi_modes array? Basically it wastes space in the array for
>>> no benefits.
>> I wanted to keep the USIv2 enum the same.
> Is there any need for keeping it the same?

No, not really.

>
>>>> +	USI_VER2,
>>>>  };
>
> ...
>
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void exynos_usi_remove(struct platform_device *pdev)
>>>> +{
>>>> +	struct exynos_usi *usi = platform_get_drvdata(pdev);
>>>> +
>>>> +	if (usi->data->ver == USI_VER2)
>>>> +		exynos_usi_disable(usi);
>>> This is not related to the patch and should be separate patch, if at
>>> all.
>> Well I though that since didn't have any removal routine before it'd be good
>> to introduce that and not leave USIv2 with hwacg set.
> Sure, but separate commit, please. Can be preceeding the USIv1 support.

What about right after the USIv1 support? It would be less messy in my
opinion.

>
> Best regards,
> Krzysztof


