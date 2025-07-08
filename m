Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7C1C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KM2fwC6QNeoILgFG4CCT92DWhdLWWLqZtXJGFH4SBU=; b=wT2dg24XX4dCaL1f71thFNQbvM
	7ygZZhr5fKGtYuAzlv0RFrkqHrMTdPrmBTChBu3Uohc7Z5zzIf29To58abvHuGQm30ewgqOb4OcKM
	Sq2BBo+enpNBvJ0Y4Twis5JsOiL5JfPX6bsgxqVeA7uqH6DCU42XDuyXBzD/NhAiICyF7de+uI1Rw
	v3sYZ3CdL787W/zul0hkU7dPgn6g2ADW7t4VG6/ngaW5YLc1BuMjvziSFF5RbJsXfjDhFOBqObpcA
	HcZgyiGu0O2wgS8g42vpZ2p9lOVsmMIH/IqHaR+Hlvy8/gjgzv1gXSxyqHyHJkpbIQXWJWKK+3PQ/
	fErBW+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6Qz-00000005BaZ-1t6i;
	Tue, 08 Jul 2025 11:24:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6AH-000000059Im-0qZW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 11:07:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbyw66s5Fz6GCR5;
	Tue,  8 Jul 2025 19:06:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 19A2614025A;
	Tue,  8 Jul 2025 19:07:00 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Jul
 2025 13:06:59 +0200
Date: Tue, 8 Jul 2025 12:06:58 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
CC: <wsa+renesas@sang-engineering.com>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <opensource.kernel@vivo.com>
Subject: Re: [PATCH v3] i2c: busses: Use min() to improve code
Message-ID: <20250708120658.0000668a@huawei.com>
In-Reply-To: <20250708031520.365110-1-rongqianfeng@vivo.com>
References: <20250708031520.365110-1-rongqianfeng@vivo.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_040709_527839_9637FA81 
X-CRM114-Status: GOOD (  18.95  )
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

On Tue,  8 Jul 2025 11:15:20 +0800
Qianfeng Rong <rongqianfeng@vivo.com> wrote:

> Use min() to reduce the code and improve its readability.
> 
> The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> was changed from int to u32, because the max parameter passed
> in is always greater than 0.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> v2-> v3:
> - added the <linux/minmax.h> as suggested by Jonathan.
> - used i = min(...) as the loop initializer according
>   to Jonathan.
> 
> v1-> v2:
> - Change the max parameter type in st_i2c_rd_fill_tx_fifo()
>   from int to u32
> ---
>  drivers/i2c/busses/i2c-st.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 750fff3d2389..e4b2ed8a9264 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/minmax.h>
>  
>  /* SSC registers */
>  #define SSC_BRG				0x000
> @@ -422,12 +423,8 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = c->count;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> -
> -	for (; i > 0; i--, c->count--, c->buf++)
> +	for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
> +		i > 0; i--, c->count--, c->buf++)
	for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
	     i > 0; i--, c->count--, c->buf++)
  		st_i2c_write_tx_fifo(i2c_dev, *c->buf);

So different alignment form what you have.


>  		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
>  }
>  
> @@ -439,7 +436,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>   * This functions fills the Tx FIFO with fixed pattern when
>   * in read mode to trigger clock.
>   */
> -static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
> +static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, u32 max)
>  {
>  	struct st_i2c_client *c = &i2c_dev->client;
>  	u32 tx_fstat, sta;
> @@ -452,12 +449,8 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = max;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> -
> -	for (; i > 0; i--, c->xfered++)
> +	for (i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
> +		i > 0; i--, c->xfered++)
>  		st_i2c_write_tx_fifo(i2c_dev, 0xff);
>  }
>  


