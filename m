Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78149FC9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BN/XqjULFDgtRiOB3E9MoDZ6824EPp5tEaS/3lX1ByE=; b=zROzaWPpysvGOm1tS/tpNOmfay
	oGQusDta+wu1bc5vYudHuR0ELA+lQlO4962HhkIGWh3ayl74t0ErIsrfsXusTQesd9TzGRiVVSnbc
	67G7On4No2Ryxom5Ttpi1jySBSEgOFlauuK19nmicLBOK2vzNCjKpr87gW/Aue1UfAeNSBl6SID6L
	T+manwMzx9lUoCv4yRSXDUDx4SrOTFhQCecn9zEDy61o7J72HJ7IRzsc+JbNlhcusHQdhvE2HT41p
	z5IWV07albxZvbmeOmCtleQtXX5AK20+D63v9PgNAPDdlvyl9TZf+Fisl67KmoLJUmjes2PBYUbFe
	HUzmJafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyriF-00000005EGb-0gfR;
	Sat, 07 Mar 2026 13:28:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyriC-00000005EGG-1s31
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 13:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38EC74094A;
	Sat,  7 Mar 2026 13:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A82C19422;
	Sat,  7 Mar 2026 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772890129;
	bh=8vMTG5OOmCJMXA2EGTfUTjyjg7fRHm+MjrEBcdyE03o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q9Qh5YAaYT7I9ExOGO9djbucD5YhfFJ13NYE/MJnYSDI6iYvGk17fUPjcn3/NYlcE
	 U9ox2lxlTmx+yauXV4HI+gwBpf1msScL1beSra86vOGpKaAGR+fNwqWgsb+1TW/gAP
	 71NnB0g2jc5/c8ge4bu7Gn+TYbaoPw0kDd/RNBlmN7JcdigFjleGNwr8gg184EIPro
	 P3/WNcIciFPcQSEh/buVQ+FThAav0A8OkV93fEevWJRww5vhbQnU1h2j1RDlimA0/J
	 dsTFsF4FHTv2MGEobdTQoDwafnpufJouz70pHwEqbYIENDEeCrPJpuhiane0EWI1cq
	 adEBitGKknaxQ==
Date: Sat, 7 Mar 2026 13:28:39 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] iio: adc: aspeed: clear reference voltage bits
 before configuring vref
Message-ID: <20260307132839.3126f5bc@jic23-huawei>
In-Reply-To: <20260303-adc-v3-1-10570f23d3ce@aspeedtech.com>
References: <20260303-adc-v3-1-10570f23d3ce@aspeedtech.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_052856_516014_18E395DC 
X-CRM114-Status: GOOD (  15.29  )
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

On Tue, 3 Mar 2026 10:38:26 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Ensures the reference voltage bits are cleared in the ADC engine
> control register before configuring the voltage reference. This
> avoids potential misconfigurations caused by residual bits.
> 
> Fixes: 1b5ceb55fec2 ("iio: adc: aspeed: Support ast2600 adc.")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

> ---
> Changes in v3:
> - Added the missing Fixes: tag
> 
> Changes in v2:
> - Remove Gerrit Change-Id's
> ---
>  drivers/iio/adc/aspeed_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
> index 4be44c524b4d..83a9885b9ae4 100644
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
> 
> ---
> base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
> change-id: 20260303-adc-47e5bfdf89c9
> 
> Best regards,


