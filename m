Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D64CD11196
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1D+lH0oiKap02xjAxi8/XjC1qBt7ZRayntMhab4p74=; b=DbBEVgC2fMmUNbH9xltSYWBIqr
	Wbun/chDjrNU7tH4H3X1qHbWQc2ZHY6rxG8siqGdXJAmFwo01h0QR29xXOwtYWTfIkNwK5qzXyQka
	fnifQjGz/tBQFP8+BV7VE/fg36P5IYYZr4mM0yp0zrjMok5o8bvmLNgDvryy8t+Eh+MhX6grn0UFz
	M4MZQT1iUoSrLUE7zYHY4BedL95nG+jYfPanO2d5zsv7SqnQC0C83c+wzOpvDVFkCf2JtYQb0w+xp
	TaGV5dDUjTVRx1RCWWZpODPkzOTyBoL3XPJ14LBIudbqG7MEASOUwFgZrdBdta/uRtMyLSxSf904t
	zzU0QoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOM70-0000000FcI7-3fBk;
	Wed, 26 Nov 2025 20:27:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOM6x-0000000FcGY-3dXT;
	Wed, 26 Nov 2025 20:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764188851;
	bh=OpcbLyKYxZlxHhsaZdpZh0uLt6gJOnXWPmZWcJ0p0KY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ok95PXRf1zTCFm0YnE0co+79ZEXCN6iHKtdfeBvVFGEnFfol70oUDdzQnxPoNtNhA
	 4vgiQgF8zBakJ4YELldWOM95ZlndMvGGD6x9j6wPtfZqb0VQM7QS0ZfQYA4Zq2aAZg
	 B9VNerwVPKXD2Isn7jYFoVYmkbVLzAvmDo5AGTYlgMgiqqIi4wWYdJp0nIWMuAundz
	 GBE34vN2Borx3yFEHTqArWTmMki2+u09xe+JI123WkPlp0YFyHt6i6W6PtO1FO48Ci
	 TT/dGWd1oEhVvzp7yJxUPwhCPH5O0eV3b2mb7Gf79I6HsLVJKpvrX7/ENQ1NyaHeU+
	 ehucfjHs5TzgQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E64117E101A;
	Wed, 26 Nov 2025 21:27:30 +0100 (CET)
Message-ID: <f53af05d-ac10-43d5-8563-dadafbeb2379@collabora.com>
Date: Wed, 26 Nov 2025 21:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] media: rockchip: rkcif: fix off by one bugs
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aR17UkYsfAxCZ4fe@stanley.mountain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aR17UkYsfAxCZ4fe@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_122736_061340_B1A6648F 
X-CRM114-Status: GOOD (  15.72  )
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

Hi Dan,

Thanks for the patch, good catch!

On 11/19/25 09:09, Dan Carpenter wrote:
> Change these comparisons from > vs >= to avoid accessing one element
> beyond the end of the arrays.
> 
> Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  .../media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++-----
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


