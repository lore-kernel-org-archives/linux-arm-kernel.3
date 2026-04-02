Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F044BCC6B35
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sa+a3J0QrBn+R1u+tNno8i6NoeHdBvME4wJq3fMgEs=; b=SM1GnpDIjVQ2C7fZjb8LI5LJY9
	1SHv4LL37bh//KaHLLRuW/PnxeOJhVOB6/5UOiRSLeTtR4yhhIO5mv5rnlC9IqpbeJY8lpyQ7592m
	+aWvLHDfQ6n3nnpSAHVmtHstHtiDCl1Cn2hDTImkj5Q0Gj/cR9PPTnn+BzWHeNL4d0WfX5H4W/BPP
	R00nETKa7StP0/KqqzMB9BFon1SRdJ19SPMjlpNt3JuW0HmsdscFfQW+H0c9u/X3sHuP5pVyed+5A
	sVvyyCBeKsgMI6lmbA0k9sqYTFYM/DEVqCo+YKCqgkwjdwPrxftjPwDPLFgh9z7d116REkyxQcej6
	meaHGuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DdF-0000000HCAk-3Gzl;
	Thu, 02 Apr 2026 08:42:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DdC-0000000HC9q-1lZj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:42:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43b983bb07eso347986f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119344; x=1775724144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/sa+a3J0QrBn+R1u+tNno8i6NoeHdBvME4wJq3fMgEs=;
        b=V+wqQmWde4JYBgS/flH5y473YBjEjlASPyztOjFQEgT9Bc5W6E62BjcPN9FAz0N4nz
         x8sFcOYYRoxPp7IUk1rYXN0NwhNxGQN0bhDOWFkZbzDXVo87gaVhAExyDKuyT4eIvTE8
         VghT8BglYEn1kbajKxgi7i3sBTv2PLpzOIpKTWW8qP6faIdpywHPTYI0Yte4/qv8Ng9l
         tSBsgMgKb2vTzFp5SCOSRujjcMd6ABTQRM15luCrs1SeoQuqzgguwKvi8Y0YvQR/SXge
         rw1xOrYinwTLkubZDe25ue6orEr5sD6mB9KK0wycUPAfIANOcGSeIGwLIWpGUbwo/L9U
         V+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119344; x=1775724144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sa+a3J0QrBn+R1u+tNno8i6NoeHdBvME4wJq3fMgEs=;
        b=WM5uB0uUQtdhVlXxC/JSYDJDVApGGH0WNO8pUfnrmxSXW62pBays4VWxRhc5dUgcj1
         N9Que7e2Khzb9i/H/e8uZG8mZuqCtOK5flG6ZIyR61/uwGHih6WY1dyc/PMXgjdPy/Rt
         gdrt2dHwvfWB6Cfv/bDUhdKvHKQoPKZPm6XrOepy8Bcyny5CQkxTjtJMEfwbIr54WO3O
         PJ6SJ2N+++s4AHAZcLi2ZCkZu2HaXdA/d2x/DN6Id96ZuxaKkMaZHqWB5xjRXlwiHEBy
         8yAzUeoR6QBokNkNbAudRgTztd2x/ssWcrv/Uvk7MFl6QPjP4FmJlPpnQiya9l4AZm1c
         YL7w==
X-Forwarded-Encrypted: i=1; AJvYcCUbAaMBjSAf+3SKBsHvu3GhyoOdzW3ajV3mX+4sDtBu4FsvHxiEPgHafGL7WK2oMdYTc+vT6II8sy+yTYSXU0Em@lists.infradead.org
X-Gm-Message-State: AOJu0YzPufbeL/KUKMUK2aHay64QpBn0GQzuce06SRrAMf/x1BvW3Bqm
	6yf3uhTSlxXzE1FolbTErPcC+nFSwTajqcsgrirPLnbFnsBFrfMudT7kkCXNlgiumhQ=
X-Gm-Gg: ATEYQzysddrgDcs/EoK4XOYS++d8N+SH7IIZbxe22Bsiqf2/xK5/SkEGi6a7xw+RdtW
	rH1riY/ix3A4HmbboXN3B3cp7dYysvrCJ+g8mJo7W58mRqY5/CH6P/wIZ0nnh0ATRhjf3l7pf3g
	lCvxlq4mTGlKto5tjs0RIdANu43gpH8oeu+2pWP8Ki4xH3U3TeAAgH+ZFR4oZM1pStSa+D0F207
	fSIvPzPRzT8TFiBrJhq3vS9X8mMU8soe0xNejM/q5oHa2ikAv8L3jC1+dCHXucuHz9MF0Ooy5tt
	4wifvVMwCgMJTZPuzWLcZG1R2tbdZrSbUgsYbj4PCHhSYnnjHnpzLELUjRH/NHM9UpSse2cOMeZ
	EpBTgs58b78SDL7BC6BYGgjWGiVeQ427uG4Top2zNPpB9e7TPwhT/FsQR29YFHZdK1nmwr4igp9
	98isvOcSSBI7czZ7S5uj8wGbsevYCISV0=
X-Received: by 2002:a05:6000:230c:b0:43c:e7a7:9256 with SMTP id ffacd0b85a97d-43d150513d6mr11820588f8f.12.1775119343977;
        Thu, 02 Apr 2026 01:42:23 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e5890sm5989362f8f.31.2026.04.02.01.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:42:23 -0700 (PDT)
Message-ID: <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
Date: Thu, 2 Apr 2026 11:42:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_014226_664311_8528CCF0 
X-CRM114-Status: GOOD (  31.06  )
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

Hi, Alexey,

On 4/2/26 5:20 AM, Alexey Klimov wrote:
> Exynos850-based platforms support ACPM and has similar workflow
> of communicating with ACPM via mailbox, however mailbox controller
> registers are located at different offsets and writes/reads could be
> different. To distinguish between such different behaviours,
> the registers offsets for Exynos850 and the platform-specific data
> structs are introduced and configuration is described in such structs
> for gs101 and exynos850 based SoCs. Probe routine now selects the
> corresponding platform-specific data via device_get_match_data().
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 67 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index d2355b128ba4..f9c59c07558a 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -31,14 +31,61 @@
>  
>  #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>  
> +#define EXYNOS850_MBOX_MCUCTRL		0x0	/* Mailbox Control Register		*/
> +#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
> +#define EXYNOS850_MBOX_INTCR0		0x0C	/* Interrupt Clear Register 0		*/
> +#define EXYNOS850_MBOX_INTMR0		0x10	/* Interrupt Mask Register 0		*/
> +#define EXYNOS850_MBOX_INTSR0		0x14	/* Interrupt Status Register 0		*/
> +#define EXYNOS850_MBOX_INTMSR0		0x18	/* Interrupt Mask Status Register 0	*/
> +#define EXYNOS850_MBOX_INTGR1		0x1C	/* Interrupt Generation Register 1	*/
> +#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
> +#define EXYNOS850_MBOX_INTSR1		0x28	/* Interrupt Status Register 1		*/
> +#define EXYNOS850_MBOX_INTMSR1		0x2C	/* Interrupt Mask Status Register 1	*/
> +#define EXYNOS850_MBOX_VERSION		0x70

Please consider defining just the registers that are used, to not
pollute the driver. You may drop the unused gs101 definitions too. 

> +
> +#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
> +
> +/**
> + * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
> + * @irq_doorbell_offset:	offset to the IRQ generation register, doorbell
> + *				to APM co-processor.
> + * @irq_doorbell_shift:		shift to apply to the value written to IRQ
> + *				generation register.
> + * @irq_mask_offset:		offset to the IRQ mask register.
> + * @irq_mask_value:		value to right to the mask register to mask out
> + *				all interrupts.
> + */
> +struct exynos_mbox_driver_data {
> +	u16 irq_doorbell_offset;
> +	u16 irq_doorbell_shift;
> +	u16 irq_mask_offset;
> +	u16 irq_mask_value;
> +};
> +
>  /**
>   * struct exynos_mbox - driver's private data.
>   * @regs:	mailbox registers base address.
>   * @mbox:	pointer to the mailbox controller.
> + * @data:	pointer to driver platform-specific data.
>   */
>  struct exynos_mbox {
>  	void __iomem *regs;
>  	struct mbox_controller *mbox;
> +	const struct exynos_mbox_driver_data *data;
> +};
> +
> +static const struct exynos_mbox_driver_data exynos850_mbox_data = {
> +	.irq_doorbell_offset = EXYNOS850_MBOX_INTGR0,
> +	.irq_doorbell_shift = 16,
> +	.irq_mask_offset = EXYNOS850_MBOX_INTMR1,
> +	.irq_mask_value = EXYNOS850_MBOX_INTMR1_MASK,
> +};
> +
> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
> +	.irq_doorbell_offset = EXYNOS_MBOX_INTGR1,
> +	.irq_doorbell_shift = 0,
> +	.irq_mask_offset = EXYNOS_MBOX_INTMR0,
> +	.irq_mask_value = EXYNOS_MBOX_INTMR0_MASK,
>  };

I find it strange that the SoCs use different registers. Are you sure you're
using the right direction? i.e. ring the doorbell to APM and not to AP?

>  
>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>  		return -EINVAL;
>  	}
>  
> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);

Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask instead of
a shift.

I would rename irq_doorbell_offset to intgr. It aligns with the register name
from the datasheet. You won't need to prepend _offset to the name, we already
see it's an offset when doing the writel().


>  
>  	return 0;
>  }
> @@ -87,13 +135,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
>  }
>  
>  static const struct of_device_id exynos_mbox_match[] = {
> -	{ .compatible = "google,gs101-mbox" },
> +	{
> +		.compatible = "google,gs101-mbox",
> +		.data = &exynos_gs101_mbox_data
> +	},
> +	{
> +		.compatible = "samsung,exynos850-mbox",
> +		.data = &exynos850_mbox_data
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, exynos_mbox_match);
>  
>  static int exynos_mbox_probe(struct platform_device *pdev)
>  {
> +	const struct exynos_mbox_driver_data *data;
>  	struct device *dev = &pdev->dev;
>  	struct exynos_mbox *exynos_mbox;
>  	struct mbox_controller *mbox;
> @@ -122,6 +178,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pclk),
>  				     "Failed to enable clock.\n");
>  
> +	data = device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	exynos_mbox->data = data;
>  	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
>  	mbox->chans = chans;
>  	mbox->dev = dev;
> @@ -133,7 +194,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, exynos_mbox);
>  
>  	/* Mask out all interrupts. We support just polling channels for now. */
> -	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
> +	writel(data->irq_mask_value, exynos_mbox->regs + data->irq_mask_offset);
>  

and here I would s/irq_mask_value/intmr_mask and irq_mask_offset/intmr.

Cheers,
ta

>  	return devm_mbox_controller_register(dev, mbox);
>  }
> 


