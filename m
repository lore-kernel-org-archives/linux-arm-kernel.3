Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474DFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omgMYPG7qPtnWiyO7qj/VLPymUCzNCIZIk42TFnexUc=; b=ZSm4gynYMuuPmkocHv31YylofI
	DFyGTn8bF/lXcM+7yLLHeZEY3neT6aqZDEEUIcq958EQRLNXFAJ4bvT0Qq4fdsdNSbUVlOhyN6Jba
	VB+D9whzmTaWSzzZUSWuCoF3VXfcIRsXfzix23a00QPmVcxHz5venOnEs5jDmCr5EKyCqyxG46v/D
	kGt0gH5nxCb6ZBcFIAtuiuPFhNGWr5UjMOFyXdGz4GJX7NwjNlqJ31kvB5rUt554l5COTLdH4XSVR
	t/FMLnFdHuexBC0RMYn3qPSYkWmNDyXSmYOIsGK+POv23PAtkYyVAvxSRnNRGY1jfmCocp5qaAqmA
	rS1ZAhEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgHy-0000000FdqT-38PE;
	Wed, 06 Aug 2025 15:42:50 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujg2F-0000000FbV7-2wnQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:26:37 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bxvGL02Q1z6L5W7;
	Wed,  6 Aug 2025 23:24:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D388414027A;
	Wed,  6 Aug 2025 23:26:28 +0800 (CST)
Received: from localhost (10.81.207.60) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 6 Aug
 2025 17:26:27 +0200
Date: Wed, 6 Aug 2025 16:26:24 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
CC: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/15] iio: adc: at91-sama5d2_adc: update calibration
 index, validation condition
Message-ID: <20250806162624.000044ce@huawei.com>
In-Reply-To: <20250804100219.63325-5-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
	<20250804100219.63325-5-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.60]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_082636_031600_F47D606A 
X-CRM114-Status: GOOD (  24.87  )
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

On Mon, 4 Aug 2025 15:32:08 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add additional condition for validating the calibration data read from
> the OTP through nvmem device interface. Adjust the calibration indexes
> of sama7g5 according to the buffer received from the OTP memory.
Changing those indexes looks to me like either this was broken previously
or we are supporting something new (possibly at the expense of the older
support)

Or is this 'broken' by patch 2 and you are fixing it up here?
If so we normally try not to do that sort of change in multiple steps
because the patches may go via different trees and potentially only
part of it make it to upstream in a particular cycle.

Messy though it is, if you need to change indexes because something
broke doe it all in one patch.

> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index c3450246730e..d952109a64a9 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -445,6 +445,14 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
>  #define at91_adc_writel(st, reg, val)					\
>  	writel_relaxed(val, (st)->base + (st)->soc_info.platform->layout->reg)
>  
> +/*
> + * The calibration data has a TAG to recognize the packet
> + * The tag has a constant value "ACST" with the ASCII
> + * equivalent 0x41435354. This is used to validate the
> + * calibration data obtained from the OTP.
> + */
> +#define AT91_TEMP_CALIB_TAG	0x41435354

Could we treat it as a string and do a strcmp?  Main advantage
is this comment may become unneeded if the code is clear enough.

> +
>  /**
>   * struct at91_adc_platform - at91-sama5d2 platform information struct
>   * @layout:		pointer to the reg layout struct
> @@ -504,10 +512,10 @@ struct at91_adc_temp_sensor_clb {
>   * @AT91_ADC_TS_CLB_IDX_MAX: max index for temperature calibration packet in OTP
>   */
>  enum at91_adc_ts_clb_idx {
> -	AT91_ADC_TS_CLB_IDX_P1 = 2,
> -	AT91_ADC_TS_CLB_IDX_P4 = 5,
> -	AT91_ADC_TS_CLB_IDX_P6 = 7,
> -	AT91_ADC_TS_CLB_IDX_MAX = 19,
> +	AT91_ADC_TS_CLB_IDX_P1 = 1,
> +	AT91_ADC_TS_CLB_IDX_P4 = 4,
> +	AT91_ADC_TS_CLB_IDX_P6 = 6,
> +	AT91_ADC_TS_CLB_IDX_MAX = 18,
>  };
>  
>  /* Temperature sensor calibration - Vtemp voltage sensitivity to temperature. */
> @@ -2281,7 +2289,7 @@ static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
>  		dev_err(dev, "Failed to read calibration data!\n");
>  		return PTR_ERR(buf);
>  	}
> -	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4) {
> +	if (len < AT91_ADC_TS_CLB_IDX_MAX * 4  || buf[0] != AT91_TEMP_CALIB_TAG) {
>  		dev_err(dev, "Invalid calibration data!\n");
>  		ret = -EINVAL;
>  		goto free_buf;
Not related to this patch, but this would be excellent place to deploy __free
u32 *buf __free(kfree) = nvmem_cell_read(temp_calib, &len);

then can directly return on error here and drop the kfree(buf) below.




