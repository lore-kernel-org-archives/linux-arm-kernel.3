Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A1BC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kvqf/7BJ93QXmMN90sGQd5PIinIiiYGhkhMDAFurfpQ=; b=sKR0UtULyWkGhSz6HTwNCnV72Q
	k+xjvwbPIuwh4pyrBuv33sZL+tArIEXbZ7chMhqFBjMDbK1KLl/Inly7A6cimsE0JOK713ObaY9i7
	Kf1xrA6wCqMto65YsId0HAB603vZQN/oh6Z/hNq4EepKgacKIp1TgpSATGFw8pT3611is6pfIjOmB
	ENaFOw9KEg6AjJOND0af/B2OxWpFOskqTjZP29lQ2v9i09VTKzGrMAUUhlKqHrckD+Rie0YSPJ4Jk
	NX8y2h2Zvbwf51S84TQhPvuoEhbK3VsEbW5F6AlAgzjY0hR84YMMSIfrCcF8TbS/YVAZ3iU//8LWE
	Jr6TXDXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiwz-000000027oZ-01CH;
	Mon, 07 Jul 2025 10:19:53 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiLB-0000000214Y-048T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:40:50 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbK3549Hcz6L5L1;
	Mon,  7 Jul 2025 17:40:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D0C31402A5;
	Mon,  7 Jul 2025 17:40:43 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 7 Jul
 2025 11:40:42 +0200
Date: Mon, 7 Jul 2025 10:40:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
CC: Patrice Chotard <patrice.chotard@foss.st.com>, Andi Shyti
	<andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<opensource.kernel@vivo.com>
Subject: Re: [PATCH v2] i2c: busses: Use min() to improve code
Message-ID: <20250707104041.00006171@huawei.com>
In-Reply-To: <20250705114436.579070-1-rongqianfeng@vivo.com>
References: <20250705114436.579070-1-rongqianfeng@vivo.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_024049_199778_CDA2A1D9 
X-CRM114-Status: GOOD (  17.31  )
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

On Sat,  5 Jul 2025 19:44:35 +0800
Qianfeng Rong <rongqianfeng@vivo.com> wrote:

> Use min() to reduce the code and improve its readability.
> 
> The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> was changed from int to u32, because the max parameter passed
> in is always greater than 0.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Drive by review...

I'd add Wolfram as +CC at least.  May well pick it off the list
of course.


> ---
>  drivers/i2c/busses/i2c-st.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 750fff3d2389..285d8a05ab36 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -422,10 +422,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = c->count;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);

Add 
#include <linux/minmax.h>


Given it is now one statement perhaps cleaner toput it
as the loop initializer 

	for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
	     i > 0; i--, c->count--, c->buf++)

>  
>  	for (; i > 0; i--, c->count--, c->buf++)
>  		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
> @@ -439,7 +436,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>   * This functions fills the Tx FIFO with fixed pattern when
>   * in read mode to trigger clock.
>   */
> -static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
> +static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, u32 max)
>  {
>  	struct st_i2c_client *c = &i2c_dev->client;
>  	u32 tx_fstat, sta;
> @@ -452,10 +449,7 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = max;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
>  
>  	for (; i > 0; i--, c->xfered++)
Same here.

>  		st_i2c_write_tx_fifo(i2c_dev, 0xff);


