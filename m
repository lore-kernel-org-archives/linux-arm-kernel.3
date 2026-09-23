Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA2AC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6j34DEcQ9RvtDEf0GXPWKVEEMdoMM3G+aQ4UmVf7gC8=; b=buiRVXlL/T9z6Qv5e+crbm7EiM
	DFBnhpdcczOxbUSBME119dpIQNCCdizkyCefiDvwqYe8HyzFZzub0Q+/x1HI91D9bIE1vXFH4y+wQ
	D/zaZauFRdUbiBGrmdd8f8KeCS8fTGDHg4kdNNw4DvXPPB8hzZI+erccP6FjfEgltlS1Cp+dWAyb4
	yediMrCcQZ80EvcJsnx/O3oOicaNll9cye4e1xFBqHHH082YSV9l06nUTBF3TwKOsE6f+8LtjZr3V
	nazpMziFQrX4IpRv7Af3Yx8hcMFIS5vy8X+XTWwOCE5LpeFqH5kAZ1ujv2AAKwpHcRLlp5WgTchLd
	op+y07Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ON7-00000008bFj-1Cfe;
	Wed, 23 Sep 2026 14:54:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ON5-00000008bFc-1pbz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:54:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 875A960DDA;
	Wed, 23 Sep 2026 14:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5F01F000FF;
	Wed, 23 Sep 2026 14:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790175294;
	bh=6j34DEcQ9RvtDEf0GXPWKVEEMdoMM3G+aQ4UmVf7gC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mjaAd0iCBu5b/9LAzmQnRVqxTJpoyoRyYeiw3uLdMsDhaKp59fNbVH3H026AkoGj+
	 BK2BTCYI3Tw69sHWuIEvA5UgPXZJtx3vhEQMiZl4LiNSoZ1YZ7GLBcEm6WSX5Fe8v/
	 2OnYOcaU9wtL377DFSjsvNZrhgloKrgSte+hT+51lz8459nWEKW9WKf1kzwVgKHLp8
	 F44kAn+izJ2MkUeboT/qqi2DlTip0aIm2Jo4nvWM5gQ9jKKGU5iG/vc+LwA+nSseuN
	 O48W5QRSVsjAtDsZNSp3VtfmsV9FkFuxOijZBjRAouT6gN+8KRw3CCjz4pq4NU2/6k
	 wkDMkEQxF6eqQ==
Message-ID: <bea461d6-4ae9-451d-b6c7-5ac7bc144651@kernel.org>
Date: Wed, 23 Sep 2026 16:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: stm32_omm: fix child clock leak on set_amcr()
 error path
To: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260917235925.44185-1-diegomancera.dev@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260917235925.44185-1-diegomancera.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 18/09/2026 01:59, Diego Fernando Mancera Gomez wrote:
> When the mux is enabled, stm32_omm_configure() enables the two OSPI
> child clocks via stm32_omm_toggle_child_clock(dev, true); they are meant
> to stay enabled for the device's lifetime and are disabled again in
> stm32_omm_remove() and on the devm_of_platform_populate() error path.
> 
> However, if the subsequent stm32_omm_set_amcr() call fails, the function
> jumps to the "error:" label which only calls pm_runtime_put_sync_suspend()
> before returning, leaving the two child clocks enabled. As this happens
> during probe, the error is propagated and .remove() is never called, so
> the clock enable references are leaked. devm_clk_bulk_get() only releases
> the clock handles on unwind, it does not undo clk_prepare_enable().
> 
> Disable the child clocks on the set_amcr() error path, mirroring the
> cleanup already done on the devm_of_platform_populate() failure path.
> 
> Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
> ---
>  drivers/memory/stm32_omm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> index 84eb23c824f5..3599683ab04a 100644
> --- a/drivers/memory/stm32_omm.c
> +++ b/drivers/memory/stm32_omm.c
> @@ -274,6 +274,8 @@ static int stm32_omm_configure(struct device *dev)
>  	writel_relaxed(omm->cr, omm->io_base + OMM_CR);
>  
>  	ret = stm32_omm_set_amcr(dev, true);
> +	if (ret && (mux & CR_MUXEN))
> +		stm32_omm_toggle_child_clock(dev, false);

How does it work without st,omm-mux?

>  
>  error:
>  	pm_runtime_put_sync_suspend(dev);


Best regards,
Krzysztof

