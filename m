Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00F6C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GSnkLBR97oORHoaoqEUxERK+3g4zPwSGibsuCsJhIM=; b=EZjbRANxmdqdBd6W9fUaAthq0d
	O859EeyU+KtGirkbE9QYbgh8XRWAnTqR2/MPyjG/jlMes7NQ2cpckiLrMAcacAlF1nywx16vMG+9h
	wl+wFTLQZ10W0LTKZEACZpxRzTUD6qUIZlvTj2+4XilDjdt4P599ZtfrFSd/206QLUcwRit87+Xcx
	0b9enezCrtDbE+7heCOMQxxwxShHlVfb7HKygL3LKwIc9IMsSzRzNb7BDNEj1PrKJqwjHyzrwi+yf
	gDtPyoktJdukkRO6CW0vpVB/nzkBgj8sqpXTvpm3ErVKXwl8glS1p4ZMv/QqKkVeBEUulwNvVPuKd
	aMr/iE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUM4T-000000084Q5-0BRu;
	Wed, 25 Jun 2025 09:05:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULPJ-00000007wdr-2Wm6;
	Wed, 25 Jun 2025 08:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B153C61126;
	Wed, 25 Jun 2025 08:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CB5C4CEEA;
	Wed, 25 Jun 2025 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750839779;
	bh=VeZL0T5SuaIibrGFk1LXnvbTdunYAmG3W+kPplU0veI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ESRW2xlt9O0+HzOhPdTdieAtEx/EA7iERTdIRSPeiLHQXOmchfHoYmMXhIedTKd3P
	 UtNqMDKH9W9S2a89E1z0zZGT+T4vIEnxF63XXs094R3YMlyAlUMYtNYvm3zmuxRJMS
	 c1aovPMRwogf4KXp7HqSy9xSF+UTBzvE2/azuNR8J50Jp/C4+Vm84eGZ9Dd4TEK1l3
	 33NVZ8vANgqBc0GsxCEXQWYMNwVeYx707m689MAAN/OYsXiSC6A2NdcVd51isPwhVO
	 9H+n0oBhnbNKXuIpBMUEHkRUZr9Gbycvtj5XNS5XiaWg+yYmH5SIMVW6UEWhbuz/mY
	 w3ZGQgaHW1bJA==
Date: Wed, 25 Jun 2025 17:22:56 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: reset host->mrq on prepare_data() error
Message-Id: <20250625172256.d1b4948e018fac55e575a49a@kernel.org>
In-Reply-To: <20250625052106.584905-1-senozhatsky@chromium.org>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
	<20250625052106.584905-1-senozhatsky@chromium.org>
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

On Wed, 25 Jun 2025 14:20:37 +0900
Sergey Senozhatsky <senozhatsky@chromium.org> wrote:

> Do not leave host with dangling ->mrq pointer if we hit
> the msdc_prepare_data() error out path.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks for fixing it.

> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b12cfb9a5e5f..d7020e06dd55 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1492,6 +1492,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  	if (mrq->data) {
>  		msdc_prepare_data(host, mrq->data);
>  		if (!msdc_data_prepared(mrq->data)) {
> +			host->mrq = NULL;
>  			/*
>  			 * Failed to prepare DMA area, fail fast before
>  			 * starting any commands.
> -- 
> 2.50.0.714.g196bf9f422-goog
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

