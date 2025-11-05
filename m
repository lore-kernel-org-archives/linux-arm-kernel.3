Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 11:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/UpX3avw7uELarfa8lgo/LyYGaNg3TQ/CqTgq0AbwQ=; b=po1PeDjJ07hjeGp5ZrHWXwS6cW
	ZUwEzmv7r37YdTasN61sq3q2wEQzisC02Uy8yEKgxQrH+EG4p5cGZo5XSKJcikxtTE/X+wnlXt4Dc
	FzVoP7La/EnpQo/0Gxo14WVaLYDfrGkVAEnynnySNm7uPcHDw323Kgn1sVcxCEozg7qlGNDJ1imjx
	fgYFoCiWC6HHt6LbRSsXL4Y50QuAWe3B/edGV0MKFEyFq6Dhc/Aya5lORxRCOny1Su852kAn/49SK
	VTGM+5IiPjFpFk9Hv/Xs2Y/uh2Bs5A1M0KE1enVfRVDbGa7UyoVzIYRR065Yg2MaI9oVlk2E8Io7z
	U/qmMoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc5V-0000000DZDM-394c;
	Wed, 05 Nov 2025 11:54:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc5T-0000000DZCf-2YgB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 11:54:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b7200568b13so404156166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 03:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762343642; x=1762948442; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/UpX3avw7uELarfa8lgo/LyYGaNg3TQ/CqTgq0AbwQ=;
        b=MBO9vUf9NT9sX1OkxZeXmS/Pl5QvojeamcC35IU5nYkFkvUJbJzfktnFHA559Kbb+c
         Kc8BlrL9n5Rxn0h6QVj0PdCYvWzfpLyU96Caer3Ih7nmJR3Mf9af8AIt/I03TPh/uyGX
         +e70ZeacyAP/muOQ+zBEgfmMPfL9FkGPoln473faM5DIZ1ge7keqnom/tHNbfLG+pXXn
         tkF4Bywm5Kagalr0MQyl5X4W9fzr/9l6Dj2daPB80WYitgMt1eh3yRxn7zmqNvgBR7bN
         KtDBdxFsZNWtnfPyvhL9hUOS3lJtyTQMJOT1KDMznGKsCvmP9GfBXccFpYg0n4OTpm/Q
         o34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343642; x=1762948442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/UpX3avw7uELarfa8lgo/LyYGaNg3TQ/CqTgq0AbwQ=;
        b=vvnUi99wHCcGgW6iPF4E1nd8NZ/+XmnDXnDyqKF1iFVHFp3+Qj1h5z8wx7I0lKl+OR
         Vjk75UXqcmr/XkkH+lb8GfM5+0BsnfkFV7F0OwLnvDitAYmdBQWKtCB630imXziuS0e7
         7WeWfP3V0c36yFSdtNJp3+gO6nPi1+ICab05wY0BpoxnWQizwUcVBipu+1g8wemoN3Cd
         vDgNDap4vUSzMkuiGMgp8Yf5rk85h09G4z3d8/fDutik1XeCFQ7OiMmRVH/ck1OFfffe
         V0y8epzQbSefkrdSKHp6FbCjyzhmX+tXC4nLRm3/E+JJOzTi2K3L73QERLqk0kvNB6Ng
         k+9w==
X-Forwarded-Encrypted: i=1; AJvYcCWnq62RaCAtK6ya/oCtm57CDeUiA5JINIZc2G9cYKpokPosNnitr7MkqIDsHMcQK+g8poDIIwaPFZZdU0ifTcBj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwnpie86RU1A+6AQ8awzzRkYLzRDaJOGqgvjMzDlq2k0saF+9L
	FXabWK0hIB/Tr98O2tXPrueim/G9jOHCt/R3VN1tE5wH6Ajf2Aa5BVip
X-Gm-Gg: ASbGnctoLfHQBDuSZbC5ADo5vViIy9lInon1yQpO6AgDpzCana5/wHb/l3GMuLi2FCL
	CW168201KMKxWaJUI2yyRXmWyTYEkABRJNSE+J41v4oC5hCgI7CrbvtclbBJ4eWYim8pezmuz0u
	tZcbWqvBk1LPBAjV1ylF36S+u3R0kML/wlKeg4l9alUCImaxu78xczgJQ0KbI+KC5V7IUUNFcar
	Qc3ydx4Xd7uHb9wBD3abd2Ny9rvglikFW4GVxfBP8ssNnDtOg2FE939iwpv5UqcK+L/dMPQbrx/
	QTL5A1X7+WaegTfdLQM4ZS3DHXvkzshqYfHsB87neoBzuNmChGb0PzW9Z8OA/MvU4HSQvCghhjp
	JOpkbPqowGdmEfLuYxq85z5ZCz5gk9Pgr+BFo9HrhqfGs2nNlWUu+4tRhHeN9MHn7tX4HezCqOS
	T67bUZ9R8hQG208Ai9hocz+/YNngkg136sD+DiRm5J
X-Google-Smtp-Source: AGHT+IHIMY6tKFfsb10DyUHdbGrdEQEYV+h8wx9kNX+qCiwx0rtZJ0aA3dtts39G0Zb3h4jYk8948Q==
X-Received: by 2002:a17:907:3da1:b0:b6d:6b56:bd7d with SMTP id a640c23a62f3a-b72652af2a0mr243413866b.16.1762343641492;
        Wed, 05 Nov 2025 03:54:01 -0800 (PST)
Received: from [10.25.216.1] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d916e26sm481199066b.26.2025.11.05.03.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:54:01 -0800 (PST)
Message-ID: <e7481838-af1a-46ad-9f94-8de4e20a9611@gmail.com>
Date: Wed, 5 Nov 2025 03:53:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] reset: imx8mp-audiomix: Switch to using regmap API
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
 <20251104120301.913-6-laurentiumihalcea111@gmail.com>
 <aQothuvsclJoP74u@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aQothuvsclJoP74u@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_035403_686365_7C600CBD 
X-CRM114-Status: GOOD (  21.93  )
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


On 11/4/2025 8:44 AM, Frank Li wrote:
> On Tue, Nov 04, 2025 at 04:02:58AM -0800, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Switch to using the regmap API to allow performing register operations
>> under the same lock. This is needed for cases such as i.MX8ULP's SIM LPAV
>> where clock gating, reset control and MUX-ing is performed via the same
>> register (i.e. SYSCTRL0) and different subsystem APIs.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 93 +++++++++++++++++----------
>>  1 file changed, 58 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index e9643365a62c..18a7f68aa59f 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/of_address.h>
>> +#include <linux/regmap.h>
>>  #include <linux/reset-controller.h>
>>
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>> @@ -42,8 +43,7 @@ static const struct imx8mp_reset_map reset_map[] = {
>>
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>> -	spinlock_t lock; /* protect register read-modify-write cycle */
>> -	void __iomem *base;
>> +	struct regmap *regmap;
>>  };
>>
>>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
>> @@ -55,26 +55,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>> -	void __iomem *reg_addr = priv->base;
>> -	unsigned int mask, offset, active_low;
>> -	unsigned long reg, flags;
>> +	unsigned int mask, offset, active_low, shift, val;
>>
>>  	mask = reset_map[id].mask;
>>  	offset = reset_map[id].offset;
>>  	active_low = reset_map[id].active_low;
>> +	shift = ffs(mask) - 1;
>> +	val = (active_low ^ assert) << shift;
>>
>> -	spin_lock_irqsave(&priv->lock, flags);
>> -
>> -	reg = readl(reg_addr + offset);
>> -	if (active_low ^ assert)
>> -		reg |= mask;
>> -	else
>> -		reg &= ~mask;
>> -	writel(reg, reg_addr + offset);
>> -
>> -	spin_unlock_irqrestore(&priv->lock, flags);
>> -
>> -	return 0;
>> +	return regmap_update_bits(priv->regmap, offset, mask, val);
>>  }
>>
>>  static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
>> @@ -94,6 +83,52 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
>>  	.deassert = imx8mp_audiomix_reset_deassert,
>>  };
>>
>> +static const struct regmap_config regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +};
>> +
>> +/* assumption: registered only if not using parent regmap */
>> +static void imx8mp_audiomix_reset_iounmap(void *data)
>> +{
>> +	void __iomem *base = (void __iomem *)data;
>> +
>> +	iounmap(base);
>> +}
>> +
>> +static int imx8mp_audiomix_reset_get_regmap(struct imx8mp_audiomix_reset *priv)
>> +{
>> +	void __iomem *base;
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev = priv->rcdev.dev;
>> +
>> +	/* try to use the parent's regmap */
>> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (priv->regmap)
>> +		return 0;
>> +
>> +	/* ... if that's not possible then initialize the regmap right now */
>> +	base = of_iomap(dev->parent->of_node, 0);
>> +	if (!base)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
>> +
>> +	ret = devm_add_action_or_reset(dev,
>> +				       imx8mp_audiomix_reset_iounmap,
>> +				       (void __force *)base);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to register action\n");
>> +
>> +	priv->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
>> +	if (IS_ERR(priv->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
>> +				     "failed to initialize regmap\n");
> Does anyone still base?  Supposed aux device probed by parent devices,
> if all parent already switch to regmap, you can remove this part.
>
> Frank


both clk-imx8ulp-sim-lpav and clk-imx8mp-audiomix don't handle the clock gate

functionality by themselves. Instead, they use the generic clock gate driver, which

doesn't use regmap. ATM, I don't plan on extending that to use regmap (how would

that work? would we want that? would it be useful for other people as well?)


