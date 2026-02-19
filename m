Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A769FE9A04F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrde5IE3Uh8ihf730Nhqn8ch16EXDvbE+hfI4wVnyRk=; b=YJ1C+mlyfF3M8z4jt8IYcpMD43
	v7gj/1CqZU7JUtKbSoUwyNoKNOGNDTVJQCn5M7Kmc/2V/TVwNxvgoNytzPYXpEXGGpYqQc8NYQkAp
	4uAA1B8Vx1pb9iVQuxKL5mfWic9xFg6NOoAfSrC89TE0g8ud4/hNL6lGHCwHmULLpseEzNHYHC8v4
	P768xzI13mK3TwBbxnmmofFXH7fa7VAFfYGVCYGII6nULr1HtBZrDuvNHRWDEtUoj8NaizbQpDI+L
	iIO7QJHH0x0orD0Am6Wr6Lg6PnKZT29vJuk1wiY4zomnZITWhcoqQukSCDsfZjVMOq3HAmp0livJ+
	wTMGwTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszss-0000000B985-0Y2s;
	Thu, 19 Feb 2026 08:59:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszsq-0000000B974-0hL6;
	Thu, 19 Feb 2026 08:59:41 +0000
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 652264D3;
	Thu, 19 Feb 2026 09:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771491521;
	bh=b5K/gbcGtyvJQgG3vG1TMw0SZscoHgIelRRIjJgYPdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qC3UO7c6qI6lGhJYv8D/YkWIHBgKGFjqSixPo0iZ5OvRUUZnfSM9ZUPAOEqhaDFc0
	 QMRt03olBaEvs4qdct9aUNPcFxiEzQ5yeinCkvMMw6Rew8O+xgHRmZJspqDMvClXcj
	 ebIA7DMilYPiu099RFPt5ZaROeF0h4C8K/mldxpI=
Date: Thu, 19 Feb 2026 09:59:31 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: michael.riesch@collabora.com
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: fix off by one bugs
Message-ID: <20260219085931.GE520738@killaraus.ideasonboard.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
 <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_005940_347184_C569B5B5 
X-CRM114-Status: GOOD (  16.35  )
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

On Mon, Feb 16, 2026 at 02:49:56PM +0100, Michael Riesch via B4 Relay wrote:
> From: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Change these comparisons from > vs >= to avoid accessing one element
> beyond the end of the arrays.
> 
> Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
> Cc: stable@kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 1b81bcc067ef..a933df682acc 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
>  
>  	block = interface->index - RKCIF_MIPI_BASE;
>  
> -	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> -	    WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
> +	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +	    WARN_ON_ONCE(index >= RKCIF_MIPI_REGISTER_MAX))

While at it, I'd write

	if (WARN_ON_ONCE(block >= ARRAY_SIZE(rkcif->match_data->mipi->blocks)) ||
	    WARN_ON_ONCE(index >= ARRAY_SIZE(rkcif->match_data->mipi->regs)))

Same below.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		return RKCIF_REGISTER_NOTSUPPORTED;
>  
>  	offset = rkcif->match_data->mipi->blocks[block].offset;
> @@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
>  	block = stream->interface->index - RKCIF_MIPI_BASE;
>  	id = stream->id;
>  
> -	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> -	    WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
> -	    WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
> +	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +	    WARN_ON_ONCE(id >= RKCIF_ID_MAX) ||
> +	    WARN_ON_ONCE(index >= RKCIF_MIPI_ID_REGISTER_MAX))
>  		return RKCIF_REGISTER_NOTSUPPORTED;
>  
>  	offset = rkcif->match_data->mipi->blocks[block].offset;

-- 
Regards,

Laurent Pinchart

