Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E74EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuMt9Jlo+We0iIUGUpW2DJAHOJ3J0QF1gSn1HoWko8s=; b=sWyz9kkGNmIURzuV47I4uTvsjE
	hGM7J4Uf13TX1U96ZkEZVZkGqO7zl9nwi1mFkW4o6XrsQal5oD2XZzGcNru/dsZ+LRzUstALgVtA6
	+U3mlV5SDLyofm3et6wMhThsj3bhh0A3jIdgWzYLk+aguihv+D0M5UjrJrwDTfJns4ST+Y+3AsPyc
	5nY3AK1jO1GKwENKEmnDZmQ8XQdziPQIWfiZ1EcWqIAlvwM4kIvSWL/HISyGBvBow5/dt4GOsxQ+8
	aJCcht/OLlxABJ30u1ZWtfA5XIeG38cKrbfMfSpnD3NuH+OeLAIS7GK87BOQknSo9UMzagj+J9Ygh
	CsiNGQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cxk-00000008aLq-1llB;
	Wed, 09 Apr 2025 21:28:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2bw7-00000008QN4-2b48
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744230134;
	bh=+yKQ8UlWyCG9yhdOevh4lapX94fj1l+SYopE3UtUQ8s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ga74MhCaIE6ib2x9g1zR5Fl0gLsaifzlTXgru3XbGtrVQFaXa5sRMCdYul2QQP5UL
	 1XLuRJhg4r3Mha3/KJclqmR4FHABbed0jX0AU/ttyi3qDI5nhtlfoKbK0UhAPkq80+
	 O7MZrDgysaDeaFpAxYA51sBy+TJnl1pa+KncOMbsqlglzYM/JBnNtgbOH3ALUGZTun
	 /wFWYkLiwG/EPKXzXnt3/cHCKLjd0/XxZotla2/qWlcEXX20O++ZwqczscJYEuk9S8
	 jrnFrZrK/e6BlqHPYQHUGtiuqBrhXXxzEJimmK7gSTtPRt83n5f6d6jlfuFA4LcgC/
	 1i4WLzF3rwA0w==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38EB017E00FC;
	Wed,  9 Apr 2025 22:22:12 +0200 (CEST)
Message-ID: <f6e16d37ba85d6d99c250163a80db9b5591d8c81.camel@collabora.com>
Subject: Re: [PATCH v3 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Apr 2025 16:22:10 -0400
In-Reply-To: <20250408025725.1244-2-ming.qian@oss.nxp.com>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
	 <20250408025725.1244-2-ming.qian@oss.nxp.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_132215_807883_411F3EDF 
X-CRM114-Status: GOOD (  17.57  )
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

Hi,

Le mardi 08 avril 2025 à 10:57 +0800, ming.qian@oss.nxp.com a écrit :
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> Move function mxc_jpeg_free_slot_data() ahead of
> mxc_jpeg_alloc_slot_data(). Then when allocation fails,
> can call it to clean up erros accordingly.

Its nice to be explicit when there is no functional changes. Perhaps
this rephrase could work for you ?


   Move function mxc_jpeg_free_slot_data() above
   mxc_jpeg_alloc_slot_data() allowing to call that function during
   allocation failures. No functional changes are made.

> 
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> v3
> - Split the moving of code into a separate patch
> 
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 46 +++++++++++------
> --
>  1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..b2f7e9ad1885 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct
> mxc_jpeg_slot_data *slot_data)
>  	return -1;
>  }
>  
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.desc,
> +			  jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc = NULL;
> +	jpeg->slot_data.desc_handle = 0;
> +
> +	/* free descriptor for encoder configuration phase / decoder
> DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			  jpeg->slot_data.cfg_desc,
> +			  jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle = 0;
> +	jpeg->slot_data.cfg_desc = NULL;
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			  jpeg->slot_data.cfg_stream_vaddr,
> +			  jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
> +	jpeg->slot_data.cfg_stream_handle = 0;
> +
> +	jpeg->slot_data.used = false;
> +}
> +
>  static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>  {
>  	struct mxc_jpeg_desc *desc;
> @@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct
> mxc_jpeg_dev *jpeg)
>  	return false;
>  }
>  
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.desc,
> -			  jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder
> DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			  jpeg->slot_data.cfg_desc,
> -			  jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			  jpeg->slot_data.cfg_stream_vaddr,
> -			  jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used = false;
> -}
> -
>  static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx
> *ctx,
>  					       struct
> vb2_v4l2_buffer *src_buf,
>  					       struct
> vb2_v4l2_buffer *dst_buf)

