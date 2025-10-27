Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9CBCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt0rohkfCTM02pp4Kdp4o2E48gt9AIEFWJolS1UaaMc=; b=tZpuRm8NJtUVA3cX01odm2+FMN
	9YnKm7adh+q/cc2RwMSoBuF/0jdUIN39aPpSkNQQPM1qpXLyI8ABgxVbA7E/csySmNHaERH+iKtNB
	CuqKfmOHvYxj9Rc4ly4xSwH6eSd7PRcTywrPGFtUtXcSp3nbiMZTFPYa61lrrrzwmXmv0MKOTbbyI
	Icy4lrlq5Q++13KC/GCWBpVb8FbfGLg1//n9tzab4OTk6caunCFq9EivSKq23mFDGYQ5S4walxVY1
	YKvj5unoPaq9X02sZa/INuoKU2zzZRR06WnYCiSNHdedNXF2+YLbax4ErU3qbQA7/+PC1rIBx2SKe
	qiU61ktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNtH-0000000E6wZ-3Ffh;
	Mon, 27 Oct 2025 14:08:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNtG-0000000E6wO-1OPP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 14:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80A87601FD;
	Mon, 27 Oct 2025 14:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAB6C4CEF1;
	Mon, 27 Oct 2025 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761574085;
	bh=G5enwOxx/IokudK+Rl23Z3f4vUmuTwxMyx1zaA1SnkM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AmL0bIdqC7DBYq9C/TSivDw3ClX+wqW/taBwy56Vwhx/Ke6hIHkHVN0k80ijlVoFA
	 4GR7721eu8ej9qR6OEOlyvaDkJCjLSsY7NtMtJyqL2TdpIelAKlqN1KMQX8mFVtlxS
	 cWIsVIQtOARzYUrPvA1TT242Fm5pAgXWzNm7o3sK9oBZsr3fWdTVmGtb1zLMOMGlUk
	 8IWNs4TT8vXjfC5AbssU1jv2QQjdhs2kxdnPVbQv9a6q5F44tu3nn9SXvYAaAL1jCy
	 eAFuUZSRcBna9XgYzCXsoSkpAu7zBccivRewC3+73T3daec2Xb1Ij6IkAOBHEsc931
	 E2ZSz/D71CJ+g==
Date: Mon, 27 Oct 2025 14:07:59 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: <dlechner@baylibre.com>, <nuno.sa@analog.com>, <andy@kernel.org>,
 <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] iio: adc: clear reference voltage bits before
 configuring vref
Message-ID: <20251027140759.3d3149bd@jic23-huawei>
In-Reply-To: <20251021053918.3008654-1-billy_tsai@aspeedtech.com>
References: <20251021053918.3008654-1-billy_tsai@aspeedtech.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 21 Oct 2025 13:39:18 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Ensures the reference voltage bits are cleared in the ADC engine
> control register before configuring the voltage reference. This
> avoids potential misconfigurations caused by residual bits.
> 
> Change-Id: I03c036436f376ced8a19fa5d407b7bbb377ae721
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Make sure the patch title includes the part/driver name.

iio: adc: aspeed: ..

+ the stuff Andy raised already.

Actual change looks correct to me.

> ---
>  drivers/iio/adc/aspeed_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 1d5fd5f534b8..8ab29948214a 100644
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@ -415,6 +415,7 @@ static int aspeed_adc_vref_config(struct iio_dev *indio_dev)
>  	}
>  	adc_engine_control_reg_val =
>  		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
> +	adc_engine_control_reg_val &= ~ASPEED_ADC_REF_VOLTAGE;
>  
>  	ret = devm_regulator_get_enable_read_voltage(data->dev, "vref");
>  	if (ret < 0 && ret != -ENODEV)


