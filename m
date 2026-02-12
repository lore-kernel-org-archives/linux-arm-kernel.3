Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876D3EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEZEYfQ5IqjMYzUTZcNQQmkihMOlKDImNppM9Hi9DKM=; b=rU3hl9GP66gG5goItLx2QAwo4u
	4VwudSnGaMTRdk9/51q1IeodhYDmdRziV2L4+Ke4/lcLOcAb063+JWvWd+k08tYMngzXTIhQYa1g5
	SBAKFpckGfrGNXJ3jf+uQFRTsXWVl5X76L6Gd61yGoFm2pY/RgE9cHMe/Tgotz6BR6kmDkIKEVtO8
	JyouXTFsZrQAaMDSYJ7vJUyzBsatgRZJ17t0ccK/n5zTuy2qj3l+gvoX7+QZjXX5PH72voFv8ukWx
	/PcFuXF60EdijiLdAKWSHo25CUlDmHoa6a+yqvqlyePyZlZGPDrJiXWcEPHB6T4lLFtTujvhGRyK2
	BJlvrDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZsP-00000002OZk-1WHX;
	Thu, 12 Feb 2026 16:49:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZsN-00000002OYF-0fU9;
	Thu, 12 Feb 2026 16:49:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770914947; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GntedfQoFf7F2/e7NlXFTKi/Mb6mAyCH8ddYWYop+R/QZD0smFta0zBLwMwf3Mfqook9LiYeWb3KwNolAOE3cdByvuvnsA6XCmFA4sIOcxyWNxkKGTtiNLTPwIAq3K/HreJIDq6WgqLKPZi6BVAcfz7dFrKeC1GMoQOVNtlTwog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770914947; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YEZEYfQ5IqjMYzUTZcNQQmkihMOlKDImNppM9Hi9DKM=; 
	b=W7D+cKfhamN+7nN7V3gq1t11y/IjVF4qXDwOoSdSH1kJCbD6I7hUG8PvU+/G914vuV71Q0pUhYBKXU5EMPSOLqHiIqgRVLnN7rslbi24v8llgJNNDhv74gVffsTkbEffYXbtG3P57n/fYf6xE8wV791DbrUNZXN0VB8wHg35EBw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770914947;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=YEZEYfQ5IqjMYzUTZcNQQmkihMOlKDImNppM9Hi9DKM=;
	b=kEacJbLO7qxakyNVUa231nnK8vGEosGfou35o9KAELftxBbq+CAoAxasUAftKfaz
	s3qgiTn9xa+PwwkWqaWQjbEiwcubWqcQTJHWWXTaJbqUBVBH5ZAb4Ab5+wpJcMzFh5b
	1myRX8/trow/D11TP0CfElQT0LGCdeXdM6xrJZMQ=
Received: by mx.zohomail.com with SMTPS id 1770914944758152.7910589638292;
	Thu, 12 Feb 2026 08:49:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v3 02/14] media: mediatek: vcodec: add decoder compatible to
 support mt8196
Date: Thu, 12 Feb 2026 17:48:58 +0100
Message-ID: <6176231.DvuYhMxLoT@workhorse>
In-Reply-To: <20260211054149.27249-3-yunfei.dong@mediatek.com>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
 <20260211054149.27249-3-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_084911_270591_CFA198A7 
X-CRM114-Status: GOOD (  17.81  )
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

On Wednesday, 11 February 2026 06:41:29 Central European Standard Time Yunfei Dong wrote:
> MT8196 is lat single core architecture. Support its compatible and
> use `mtk_lat_sig_core_pdata` to initialize platform data.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 6 ++++++
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index 3b81fae9f913..d9f722698198 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -347,6 +347,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
>  		vdec_dev->chip_name = MTK_VDEC_MT8186;
>  	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
>  		vdec_dev->chip_name = MTK_VDEC_MT8188;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
> +		vdec_dev->chip_name = MTK_VDEC_MT8196;

Why is this entire function written like this, and why does it exist
at all? You can store the chip name in the platform data for a compatible,
thereby avoiding a massive of_device_is_compatible if block because that's
what platform data is for.

The only place where this function is even used is in probe.

Just store it in your mtk_vcodec_match's .data struct and pull it from
dev->vdec_pdata. No need for the function.

>  	else
>  		vdec_dev->chip_name = MTK_VDEC_INVAL;
>  }
> @@ -560,6 +562,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
>  		.compatible = "mediatek,mt8188-vcodec-dec",
>  		.data = &mtk_lat_sig_core_pdata,
>  	},
> +	{
> +		.compatible = "mediatek,mt8196-vcodec-dec",
> +		.data = &mtk_lat_sig_core_pdata,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index c9d27534c63e..f06dfc1a3455 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
>  	MTK_VDEC_MT8188 = 8188,
>  	MTK_VDEC_MT8192 = 8192,
>  	MTK_VDEC_MT8195 = 8195,
> +	MTK_VDEC_MT8196 = 8196,
>  };
>  
>  /*
> 





