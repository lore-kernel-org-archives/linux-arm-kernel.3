Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDF7CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVXzVq32Zt8oCZmWKuHiiNxSxXQc050w2CwYCQkOBhI=; b=4SH3inGu5IBYhW7KaIs4prCX1j
	hhgSp9PQEJd+TxSpToJ7/Gt2Xj/F+zXuoHxQfQpohjC+kWMTMsTc5h1qcj0ftMsP3HlYqnqE142A6
	xr1grwc967xvy/t8lJVaaw8aAXZe+rpU9P7E+PPLX/zePis94sOqL2flvuhMCijGvit3YYLbCOQN5
	kJ/05SeZvRWWokw/EHZJwXRFu32cCSJYGczFkzV+6PUvSz9cV38fQh22FrW//mkgUmXefMtWWpqYu
	m4T5mImGVkX3UzE7q6autejo2eutgLz6B5PRqje9pki0lDVmUNXtJmyaj0UgkjrnsI/ZdcuhFlhVa
	VFCFsZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsD4-00000004r2Y-3q2x;
	Tue, 09 Sep 2025 06:52:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvkAp-00000002gVI-13l3;
	Mon, 08 Sep 2025 22:17:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44127438A6;
	Mon,  8 Sep 2025 22:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FB7C4CEF1;
	Mon,  8 Sep 2025 22:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757369838;
	bh=yH92uhvD40IJiQljLDeAcC7HN4DLj9MU91AIC0wuXmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Avz78ey87oevm4M2gMpO+1tOn0ld7UkfYqxtJy9ed6faDlUdFsykj5Kr9XVw8mVSO
	 syCuPLQJB7N94+2uAKkRuD/y+tYQkaBwQ4hXwNQ9L0JAqvwUWnZAS9oDv79cZ5c/Jv
	 +srzb6S9yBh64stcaGUA+QE3NyBwnl50OQIg0T0KAbgkrUmiG5GBLeogNC7GHLLVRY
	 IhdPh/+lwx7M80rzjGYUQVMR/B7cK/9OHnh82gkYCXDhZcU1OxYSnUV8zSdqlGBLmD
	 Bu70SCcANS8ft+GJHT1IP0u1w0T+6FkmQLZWIg4xlbsXGFKnvXyf3y93xb0UdUP4s2
	 Pbt0/DApi0/hg==
Date: Tue, 9 Sep 2025 00:17:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>, 
	Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Message-ID: <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
References: <20250906082652.16864-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906082652.16864-1-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_151719_310562_3F54AE5F 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Leilk,

> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index ab456c3717db..dee40704825c 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1243,6 +1243,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  {
>  	int ret;
>  	int left_num = num;
> +	bool write_then_read_en = false;
>  	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
>  
>  	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> @@ -1256,6 +1257,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  		if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M_RD) &&
>  		    msgs[0].addr == msgs[1].addr) {
>  			i2c->auto_restart = 0;
> +			write_then_read_en = true;
>  		}
>  	}
>  
> @@ -1280,12 +1282,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  		else
>  			i2c->op = I2C_MASTER_WR;
>  
> -		if (!i2c->auto_restart) {
> -			if (num > 1) {
> -				/* combined two messages into one transaction */
> -				i2c->op = I2C_MASTER_WRRD;
> -				left_num--;
> -			}
> +		if (write_then_read_en) {
> +			/* combined two messages into one transaction */
> +			i2c->op = I2C_MASTER_WRRD;

i2c doesn't change for the whole loop so that it can be set only
once outside the loop instead of setting it everytime.

Something like this:

	if (i2c->op == I2C_MASTER_WRRD)
		left_num--;
	else if (msgs->flags & I2C_M_RD)
		...
	else

looks cleaner to me and we save the extra flag. Am I missing
anything?

Andi

> +			left_num--;
>  		}
>  
>  		/* always use DMA mode. */
> @@ -1293,7 +1293,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  		if (ret < 0)
>  			goto err_exit;
>  
> -		msgs++;
> +		if (i2c->op == I2C_MASTER_WRRD)
> +			msgs += 2;
> +		else
> +			msgs++;
>  	}
>  	/* the return value is number of executed messages */
>  	ret = num;
> -- 
> 2.46.0
> 

