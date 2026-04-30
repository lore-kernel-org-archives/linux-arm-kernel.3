Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20FFCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5wYzMN3IpB4/lfMB/BJptgzMEGWqAW7cw6OYZmvGWI=; b=l9bO8nuIDQfgO8EGXjDGj6NmZE
	W5dAxKJtF8XWNyVW4SK1f9aYraL8NTnI58Uq5+Z/+b8mJMeosxOjuJRTZSnbeX8zzVHlaUFVLNcj0
	+3dOmkLgzNbSNgxV2qmQ9YkvSsBxjMz0UVVO9/z5eX6PqLBkh4AHsxpKM8holU+Xh+33XzeIiJ4ia
	/TQnoEZgHU3KE607qRzD15juIO9mO5p7XStwVd9FIiCqkkNOpS8ZVFZOlGF9+TtWD4F/S+J+9EHhV
	fmdgCc420gW1f0ZhxeYWmJpiOMY97dkc+szLfXsn+SDnB+MW2uYYlp7P4swHikqBUXmjJGOdHLkg1
	kwkAw57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIP8y-00000005FPr-19w5;
	Thu, 30 Apr 2026 11:01:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIP8r-00000005FOr-2oSA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:01:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6076975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777546871; x=1778151671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5wYzMN3IpB4/lfMB/BJptgzMEGWqAW7cw6OYZmvGWI=;
        b=sCiqWTI3ZjHdqxuFcCsqvAOTqB7CoLxd3sAgg42u/gzDTaVHu4X65qidLzf+xxgayn
         QTHurF8cEOLyOynVNWs8tgplGrmAjD/r16lKd7WQh9hnvSyrnfwH1XSILpRvRZHxvzRu
         YIuPRBqnMzWfHB+vPUyoVG1n7rHxZ6MfQ4hZDdI94lAbNlp0+nN5YXzTgSV4o2s+ezJH
         TfavhWD5kFcVzCnAKyEYqhhtjPUzBix0283IMI5rcD/t4Vtl/M+mwCc/GJsgZ4Aeq0ft
         obFLH/ARm1iHcwJHBK420lMbo+185E18Xdb4Yzf0pkBJUh+ws1oA89wTpXTjqy9B89s/
         DzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546871; x=1778151671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5wYzMN3IpB4/lfMB/BJptgzMEGWqAW7cw6OYZmvGWI=;
        b=UzUy2bge31AiqBepfm/xQGAYrz5RcCbkwRPKIAtl6YQpFQdlKREPcXwtdE3fa2nEuD
         wxiXSLQ4mzbbu46+vNnm55ieRrCX8W6uD+QqfJs3JSDRfdtQhuqddN/08U6n59THXRMj
         90HyNcDI6szjqtZSw3xm6bPAlTHQ2ftJ341xb9tM5LlrJhbeedKE+N00RuOTWiCXpyVE
         6O3WA36dJWVUywVIAUWlhy49pr9PZ18c0j1iT0oJe72IkWfxwY8ApAENi+3QdFlSRRjV
         CQHNzMegQeHG4i3nIG9yTFdsJkuVyzA2ZxE5GHLdhzG1VFiqhk5jnAHm9y+PMs33vN/z
         iyvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eNevPp+KF0pklCZpsf4ed2D6qSj5yluZQutilWYKGy0sDXg5wksN3CSOHM8HXGltM0EwrMIgHe1WLHqeTGqfI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr+Yzi2mAf6ci3InTGnks4rujNZztvp23N0oHetaRbVjlbOdGf
	fsMceRheRsym7MILiE0J3eG2Q9+8usjjLtqXn9BQxKA8eT/nvn9hseQA7zIBsnKGz+8=
X-Gm-Gg: AeBDiev5orsKEu58H+GBB+eyEnNsCC7176gVdGFgBaGF02/rnYb7oCJx6MMSe3BRyxk
	YeDVinZOcJLMx0GkO5C0IidG/fgefSHx4KBq5e3aYOqhmYjjpu0GmkwsfizK4265/1bmnJ32Iuc
	xljz2vwl6nT+TpFTHFOYhD92/OM/Lut+OhABiZbEth/LKzjJhM75FPhIn6UZgMEX817/uy8Vwdy
	WxC4tmJJ6FfnRZMH0anar1GakOU5tCGtdI6OJypQMRqKrnHt54XfczXIvf/x0nt9jOtNkM1ywCr
	f56rhPNFYguUFrz/0HOXyLroacHlMbZ4mEasnz8fBoEE9hFy+fEimcqutIfGVD+XJJVmAVtJnKj
	vlZNmWUnvfVlOc4Xw7Gcq19sxgDz+IL3BWWTjkajJGQGW1iWM0QgU+dT9RfJqFKw3ZdEwjRGUqF
	DNvYfvwiUeAdYTZI3tBiMdut9KeXr5iNlskaBp/TdB08M=
X-Received: by 2002:a05:600c:1e0f:b0:48a:5333:811e with SMTP id 5b1f17b1804b1-48a84451f8emr40243205e9.15.1777546871390;
        Thu, 30 Apr 2026 04:01:11 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8c2dd7sm84687495e9.0.2026.04.30.04.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 04:01:10 -0700 (PDT)
Message-ID: <9b6fce56-6a94-44fe-ab55-5394ec6065e4@linaro.org>
Date: Thu, 30 Apr 2026 14:01:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Juan Yescas <jyescas@google.com>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
 <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_040113_778415_F24452AC 
X-CRM114-Status: GOOD (  26.73  )
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

The abstraction is clean. Few comments below.

On 4/29/26 10:00 PM, Alexey Klimov wrote:
> Exynos850-based platforms support ACPM and has similar workflow
> of communicating with ACPM via mailbox, however mailbox controller
> registers are located at different offsets and writes/reads could be
> different. To distinguish between such different behaviours,
> the registers offsets for Exynos850 and the platform-specific data
> structs are introduced and configuration is described in such structs
> for gs101 and exynos850 based SoCs. Probe routine now selects the
> corresponding platform-specific data via device_get_match_data().
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 59 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index d2355b128ba4..11657dd475c0 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -31,14 +31,52 @@
>  
>  #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>  
> +#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
> +#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
> +
> +#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
> +
> +/**
> + * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
> + * @intgr:		offset to the IRQ generation register, doorbell
> + *			to APM co-processor.
> + * @intgr_shift:	shift to apply to the value written to IRQ generation
> + *			register.
> + * @intmr:		offset to the IRQ mask register.
> + * @intmr_mask:		value to write to the mask register to mask out all
> + *			interrupts.
> + */
> +struct exynos_mbox_driver_data {
> +	u16 intgr;
> +	u16 intgr_shift;
> +	u16 intmr;
> +	u16 intmr_mask;
> +};

using u16 for intmr_mask is slightly problematic. Down in the probe
function, you pass it to writel():
	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);

writel() explicitly expects a 32-bit (u32) value. While the compiler will
implicitly promote the u16 to a 32-bit integer, memory-mapped I/O masks
should generally match the width of the register being written to. If a
future SoC requires a 32-bit mask (e.g., GENMASK(31, 0)), the u16 will
silently truncate it.

u32 for all fields is generally preferred in kernel platform data structs
for padding/alignment reasons.

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
> +	.intgr = EXYNOS850_MBOX_INTGR0,
> +	.intgr_shift = 16,
> +	.intmr = EXYNOS850_MBOX_INTMR1,
> +	.intmr_mask = EXYNOS850_MBOX_INTMR1_MASK,
> +};
> +
> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
> +	.intgr = EXYNOS_MBOX_INTGR1,
> +	.intgr_shift = 0,
> +	.intmr = EXYNOS_MBOX_INTMR0,
> +	.intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
>  };
>  
>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -57,7 +95,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>  		return -EINVAL;
>  	}
>  
> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
> +	/* Ring the doorbell */
> +	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
> +	       exynos_mbox->regs + exynos_mbox->data->intgr);
>  
>  	return 0;
>  }
> @@ -87,13 +127,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
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
> @@ -122,6 +170,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pclk),
>  				     "Failed to enable clock.\n");
>  
> +	data = device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;

you shall move this first thing in probe() to avoid doing allocations
gratuitously on null match data.

> +
> +	exynos_mbox->data = data;
>  	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;

EXYNOS_MBOX_CHAN_COUNT is globally defined as:
#define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)

Does the Exynos850 have the exact same number of channels as the GS101?

You may move num_chans into struct exynos_mbox_driver_data alongside the
register offsets so each SoC explicitly declares its channel capacity.

Cheers,
ta

