Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3117AC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 04:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxhKtwaA63Fos0S2DVop/2E5u/CuV9J2sGATS1cbp6I=; b=MBqRHcHEGr83q+t19IN3igC1gb
	sz25XgAiE0Ou0IRNMfa2nC/0FX2u4hMUc0gI4WInxCBUBJbd1Sp4l/SxLXFdEyIrzGt/gpgAUC2yV
	NnjeVAkmmIYSz5xj2/iPVE+4YWs1cE67iYmWm+6LgAoRZClyS48cVIHr8X+Dtr0PPCndPhRZU1AJF
	r8PJ4VO583cxq0hi+4gkYpUHHNJqVB/pSkZPPXI/PV5TlMGVMSPN18snTH1NgMUCfCQBpvTJ2IoZk
	lfMrB6wfXFIPpvFA49OA4yVJj8ILL5JNDiMlXcuzgk+QgGEPp5RpyIWElxCMeMq/+A5JAkseiM/zj
	C7exLI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUI0f-00000007XUG-3IWs;
	Wed, 25 Jun 2025 04:45:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHyN-00000007X8z-2sTW;
	Wed, 25 Jun 2025 04:42:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0047614C6;
	Wed, 25 Jun 2025 04:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CA3C4CEEA;
	Wed, 25 Jun 2025 04:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750826577;
	bh=s0Uf4rDKwjy1dsp7E1aDOpTFmlXsypuC2uqpLNZ5DKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kpr1HQMca3yxYzZRwgASl7KM9m5QByPLHuYDp8quWxFse6APaNTIh2d/R6GX4wQYF
	 zlMCV4rLSly8vPfih+25aD7oiEhIKwj+FtCtQHmXTIFp/SDYmrq3xdM37PQISvprY4
	 W07TOosv3dtwmSUeVemySj27HYVuIaTmksNRRLbD+Y44sPaK7s+/fycu6HqutouwWu
	 +07mC9cMZ/h8A0LObzrYf4Z4Ajq874qs71LWj6KJVM0EM+aoy95qk7G5Q5tQoUD3We
	 D2uO5L/oFgb6+hQYARDgkC7Xy8ugK+EpTVHaDrCI3hgXWr0GBaCRKCdXShDgD37cWK
	 R32u0jXlYYLNQ==
Date: Wed, 25 Jun 2025 13:42:54 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Message-Id: <20250625134254.7cbd72feb80d8d050f2f005d@kernel.org>
In-Reply-To: <cifhvofebjuanprzcs2duv6r22r5reibzm7nub4xfya3h3rmwe@ujpf5wadwh3c>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
	<kgxqtfdrlc5m5kgprjajt4xtngken2u2locauzhsxm7kcowusa@44ncy4vhy5vx>
	<cifhvofebjuanprzcs2duv6r22r5reibzm7nub4xfya3h3rmwe@ujpf5wadwh3c>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Wed, 25 Jun 2025 13:13:18 +0900
Sergey Senozhatsky <senozhatsky@chromium.org> wrote:

> On (25/06/25 12:56), Sergey Senozhatsky wrote:
> > On (25/06/12 20:26), Masami Hiramatsu (Google) wrote:
> > [..]
> > > @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
> > >  	WARN_ON(!host->hsq_en && host->mrq);
> > >  	host->mrq = mrq;
> > >  
> > > -	if (mrq->data)
> > > +	if (mrq->data) {
> > >  		msdc_prepare_data(host, mrq->data);
> > > +		if (!msdc_data_prepared(mrq->data)) {
> > > +			/*
> > > +			 * Failed to prepare DMA area, fail fast before
> > > +			 * starting any commands.
> > > +			 */
> > > +			mrq->cmd->error = -ENOSPC;
> > > +			mmc_request_done(mmc_from_priv(host), mrq);
> > 
> > Do we end up having a stale/dangling host->mrq pointer here?
> 
> Something like this maybe?

Good catch! I thought it is cleared in mmc_request_done(), but not.
I agree we need to clean it up since it is set in msdc_ops_request().

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> 
> ---
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b12cfb9a5e5f..46bb770ace41 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1498,6 +1498,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  			 */
>  			mrq->cmd->error = -ENOSPC;
>  			mmc_request_done(mmc_from_priv(host), mrq);
> +			host->mrq = NULL;
>  			return;
>  		}
>  	}


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

