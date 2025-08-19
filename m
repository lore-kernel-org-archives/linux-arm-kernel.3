Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C29CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cj4kI8/yD81x4k/3/fRhFKit8IIVcBticQyInzsa14o=; b=P4gm5CukQ53OwPLXYydQSuTcgk
	55Y9QqiYW9TJ7LXXNvgnGp5HWxX/Sa3drV5jhJBJ25llw7vITpiZVteXG/WP1RHLmnP5ea3WV0vRD
	J8iaSwAStXj96Jm0Hq51tFs/yKqdHCs11t/jhzkjB9qFuDpsDY8F4K2UarnQmaupVAJ02zibmE2hm
	Qf1AZRsMFaSwxbO30VzcvPubE6pQItaaul0dBRs3pfyuCAO3SJnckc0i9MnKnOhaQKSGP4+MbZ80k
	hXNur+p0oSFL6WsulHohZG8xji0ab6LxBF1qkCkE5B+eZ70GS1JEm/2OCWLclPh8/xks9LzzWIdUT
	gP4mn2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVCH-0000000BnGQ-0qcS;
	Tue, 19 Aug 2025 22:52:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTal-0000000BcIh-3j1d;
	Tue, 19 Aug 2025 21:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C696613EF;
	Tue, 19 Aug 2025 21:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D18C4CEF1;
	Tue, 19 Aug 2025 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755637801;
	bh=V4rSZobOG7FpaYQDoGuuNjzv1YSuHyGLCK7LLSVzUOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thCYtja21lUCQto/XtSxT9corknakG5qz6lpKP/K4wUjJs3/kMDqfxL2Tl21gWLKy
	 wtRmbwonV+WsfBYpt1o6aPIkq3OpZqDaqtDL0srux6zKqCGNgMCuY+ULNgE2uUPM/g
	 OJl81QrxCpvL6rbm+VbahV0kte3eP8S/Ir9aUn52s/ERLlJ/vNDewrVvbeshxnxxjm
	 MxeAHfpPkmQtNs2duT2AKbodr6IOX0sV9tynWgmLBr37v0VCb4qZfK874Mj7iHVDKp
	 Q27kYIZ8xQc/fdVpXf/YtDOpu7Qae9xHz1CKBZJfZFH2nreVNcp6HlQHEOfGChL5dZ
	 /LkdzawHJlhbA==
Date: Tue, 19 Aug 2025 20:09:48 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>, 
	Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Message-ID: <cf5wxalhd2536cxnj7zn2jngly5dmvoknjnb2gbq6mzqff4tgp@4syhblgi35yu>
References: <20250816075434.31780-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250816075434.31780-1-leilk.liu@mediatek.com>
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

On Sat, Aug 16, 2025 at 03:53:54PM +0800, Leilk Liu wrote:
> From: "Leilk.Liu" <leilk.liu@mediatek.com>
> 
> The old IC does not support the I2C_MASTER_WRRD (write-then-read)
> function, but the current code’s handling of i2c->auto_restart may
> potentially lead to entering the I2C_MASTER_WRRD software flow,
> resulting in unexpected bugs.

do you mean unexpected behaviour?

> Instead of repurposing the auto_restart flag, add a separate flag
> to signal I2C_MASTER_WRRD operations.
> 
> Also fix handling of msgs. If the operation (i2c->op) is
> I2C_MASTER_WRRD, then the msgs pointer is incremented by 2.
> For all other operations, msgs is simply incremented by 1.
> 
> Fixes: 173b77e8d8fe ("i2c: mediatek: add i2c first write then read optimization")
> 

No need for blank line here. BTW, this doesn't look the commit
that is introducing the issue.

> Signed-off-by: Leilk.Liu <leilk.liu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
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

why don't we set "i2c->op = I2C_MASTER_WRRD" here and avoid an
extra flag?

Thanks,
Andi

>  		}
>  	}
>  

