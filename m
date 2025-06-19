Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E70C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 02:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZ9qB8YM06QciFmsf/ziooM1lQz+F4n9Qr+gXYxKf9M=; b=WXzoiR6UJFfYKHl0shcvEFWeuY
	6XG7YxAzr9876xN3N5O3BTiAwfiWQsBJz2paAlPW//jkZMRdfOdifakMW0pxQyBHBFBmafR/QpE79
	I3sW7StfeAfQjQ5S1Hnz2CeMqlVYAEMSGgApFUin/phLt9y1ZEQaLSdv+c0ljmzVgWp/G4c8lLQtb
	ES52rit+KCU8k12Sh6Qvs0gS8UYwKtqKGY3nIGXEmf3srfP4sxJzk1UCAO19yc762iwado4zlHUE2
	Ibml0bx1xqNLyfqTmMmiAbYIQqgu8ORHJ8jcE/KUHRttqWtoj+TaqDKbiTD6QfNlGC3EO15Q1E+ww
	g2pz0/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4gV-0000000BnHM-1MXj;
	Thu, 19 Jun 2025 02:07:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4eI-0000000BnCh-2v42;
	Thu, 19 Jun 2025 02:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C129B6116E;
	Thu, 19 Jun 2025 02:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60D3C4CEE7;
	Thu, 19 Jun 2025 02:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750298705;
	bh=IaaiI3fACwLbpIQhogak7uQ2F0Ezj93eSfpcTZk4TrI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Grog+5XEBJHGCI51zuStDEkFp8RM1HCmINdY01219b1EEKBT2nw5uj+0FmSeCETc8
	 KzGh/RsgHSPtkplC8O67EOFTyF3E00D/bUCdMnh6+teLnh173B9aqWELetBmzx7kPD
	 5cPMrZyBjngoXOF2wjZsD2r7wyMTn4CsXIlhOyjV8JXqNBR68Z4oTqjk7Zaig3hpB3
	 QJvKbfpXbTJH2jMVXO/YGHjnj+MfNzOfEd4OEhrJBPe/alfAunJXMctrid3sz5zlWD
	 We1rAxhU6ecokfmAdeQZjYhdTmaq2GDQFa4FyevqnhytrGbT7aLC/ea74ettl9pHq9
	 BPb/ZEfBMwI8A==
Date: Thu, 19 Jun 2025 11:05:02 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Message-Id: <20250619110502.be536151c664cd4ada7d1ca7@kernel.org>
In-Reply-To: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
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

Ping?

I think there will be another bug which leaks the resources
to cause this failure case. But anyway, without this fix,
if DMA preparation fails but runs a DMA, it will overwrite
the previous read buffer memory.

Thank you,

On Thu, 12 Jun 2025 20:26:10 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> If msdc_prepare_data() fails to map the DMA region, the request is
> not prepared for data receiving, but msdc_start_data() proceeds
> the DMA with previous setting.
> Since this will lead a memory corruption, we have to stop the
> request operation soon after the msdc_prepare_data() fails to
> prepare it.
> 
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  drivers/mmc/host/mtk-sd.c |   17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 3594010bc229..56b4999fe58f 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -834,6 +834,11 @@ static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
>  	}
>  }
>  
> +static bool msdc_data_prepared(struct mmc_data *data)
> +{
> +	return data->host_cookie & MSDC_PREPARE_FLAG;
> +}
> +
>  static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
>  	if (data->host_cookie & MSDC_ASYNC_FLAG)
> @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  	WARN_ON(!host->hsq_en && host->mrq);
>  	host->mrq = mrq;
>  
> -	if (mrq->data)
> +	if (mrq->data) {
>  		msdc_prepare_data(host, mrq->data);
> +		if (!msdc_data_prepared(mrq->data)) {
> +			/*
> +			 * Failed to prepare DMA area, fail fast before
> +			 * starting any commands.
> +			 */
> +			mrq->cmd->error = -ENOSPC;
> +			mmc_request_done(mmc_from_priv(host), mrq);
> +			return;
> +		}
> +	}
>  
>  	/* if SBC is required, we have HW option and SW option.
>  	 * if HW option is enabled, and SBC does not have "special" flags,
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

