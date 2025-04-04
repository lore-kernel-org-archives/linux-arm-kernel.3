Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C9C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8D9PA/tsQuTqbPFzeqNZ/LhllMMpbyXpEuo+eaekA8=; b=TMV5VkAoa81gAC0a+jc251EK/p
	NGHCfaBLq9W31/zdSY6bz0NsEXfk7UATPho2p2M3lzl17bJPfK18/4I1DcqDp99SYJsPb4iA5gXhG
	p0Xrotzx3JGXggmWtsw/GHkmIx/ZobdUugfk4560G7m//eKvklVdv5YJVuwXKww9DRibz2F+JGOv2
	3kcVa4WSvluLpKZYCEUC5+G3VmMg74912obXWqnxaUSqirH5rSVzT7ZcVrq3K8tsYeomjLEA6SH1w
	mKFD4jxiHn0GGGx8CPzR9YQqDMiL0eren36Gc3WwVkCzycDRdr+8a0gew15AsmkD+PbIZvoPduZYT
	scGDwhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dTW-0000000BILY-1A6r;
	Fri, 04 Apr 2025 09:36:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dRh-0000000BIBx-3Qqt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C795A4715C;
	Fri,  4 Apr 2025 09:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31422C4CEE5;
	Fri,  4 Apr 2025 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743759280;
	bh=n0DVXYKk8hiZe5RfNnARym5BTewBVaBxsH/5mlip/ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9MtoQrIT/Zn9pYbxRaCfVq9RrDir4kWKIFZQM17jaDiUtXizwIwDAb0+SzveV7Oz
	 uypNUT5s6r8mDEUZEu3bb8QHKrHFF3JJFD2fTe1X/Faudp1NqluPMNjwUon/SPc7hz
	 mAp91vJyLx+ZceZCCIzr6ukASR27nslWKnfRXax1NJu5K9k+FkfYOAkoIuGQneKO8Z
	 YmdYgaQBTeqFFiaq0psUl3RF2B02Vnh8ytPVZocWkpckIm2aZ6tYTq5Kar38bnoDmg
	 XL749/d5k9frjLLDWjhCfAOTKFYMEmLkJQBegWm40iGonmHeyVW4hxSJmxF/3kScem
	 s9Wh8W2Tg5vBw==
Date: Fri, 4 Apr 2025 10:34:33 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 15/32] mfd: sec: s2dos05: doesn't support interrupts
 (it seems)
Message-ID: <20250404093433.GE43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-15-b542b3505e68@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-15-b542b3505e68@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_023441_986828_3BA04E55 
X-CRM114-Status: GOOD (  23.49  )
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

Patch is fine, but the subject line should be more assertive.

Also, there is seldom any need for sub-sentences in ()'s in them.

IOW, drop the "(it seems)" part.

> The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
> s2dos05") adding s2dos05 support didn't add anything related to IRQ
> support, so I assume this works without IRQs.
> 
> Rather than printing a warning message in sec_irq_init() due to the
> missing IRQ number, or returning an error due to a missing irq chip
> regmap, just return early explicitly.
> 
> This will become particularly important once errors from sec_irq_init()
> aren't ignored anymore in an upcoming patch and helps the reader of
> this code while reasoning about what the intention might be here.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/sec-irq.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index 9f0173c48b0c8186a2cdc1d2179db081ef2e09c4..79a3b33441fa5ab48b4b233eb8d89b4c20c142ed 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -452,16 +452,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  	int type = sec_pmic->device_type;
>  	const struct regmap_irq_chip *sec_irq_chip;
>  
> -	if (!sec_pmic->irq) {
> -		dev_warn(sec_pmic->dev,
> -			 "No interrupt specified, no interrupts\n");
> -		return 0;
> -	}
> -
>  	switch (type) {
>  	case S5M8767X:
>  		sec_irq_chip = &s5m8767_irq_chip;
>  		break;
> +	case S2DOS05:
> +		return 0;
>  	case S2MPA01:
>  		sec_irq_chip = &s2mps14_irq_chip;
>  		break;
> @@ -492,6 +488,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  				     sec_pmic->device_type);
>  	}
>  
> +	if (!sec_pmic->irq) {
> +		dev_warn(sec_pmic->dev,
> +			 "No interrupt specified, no interrupts\n");
> +		return 0;
> +	}
> +
>  	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
>  				       sec_pmic->irq, IRQF_ONESHOT,
>  				       0, sec_irq_chip, &sec_pmic->irq_data);
> 
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 
Lee Jones [李琼斯]

