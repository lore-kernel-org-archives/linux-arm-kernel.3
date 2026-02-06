Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBFCEE2085
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQhNP7pzh7Iu1qtYh+y3N+t7db8vbqWW4gNxQcWhzOw=; b=bXvPAaDy6mxpoUU5UAMpF7ocFk
	q8uN15HzNwDNoUv9A8eib+yTMhX3CvX/RFXf956uN4fWD/4qT34uIs9LWoc3L4SV2mgpaseyB0rxW
	Rlf76kkphBId2kHHcCWisRVY/TvxlDG+HGlmXKbwN+BgqFLBwzCWi5Ituq6olG0YoG3QlFciJou6/
	4uoCloMmScgDwhkozrn9SVJFwherdtOk/Mj2AfshN5g3lLdox/4nms1XTeHq4SQnIgVYRtVO3DKv6
	XZ524MORcd7ycz/awMykKOEs6CSjBndoDj2veKt/fmuMOTugf6+EtE/9RknTARZPDwWDVhOKGUPTw
	4gO8M4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIkg-0000000B939-41MD;
	Fri, 06 Feb 2026 10:07:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIkd-0000000B8zv-34fn;
	Fri, 06 Feb 2026 10:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770372465;
	bh=jEvq53oMrqYEeQzv/eC2eWqajMXwQAx8xtAP8owsnCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NX96ooypTynCmlKwtCAw/NkQRt9pF6gUhxECWCD71nzy+bBzRlYeKqKdsx5MSgYmx
	 x/qTUhqfx1HhbZr9tcunJ0eP2c9zkunmy4pLmvnd00t3u620LR83QE4ldcaiZbIJWE
	 5YeHqNczrsaIaDRf29ywn7Vas3BS9BNp5xVpZu8YbX2Qb58X0XyYptfdPtnblhRylJ
	 zla2Pd0kJBJzwtJT0UqfCckpFIoZSb41OLuiggBkSrhs/VuuZdvqydAPIvI63avUO+
	 /2wQqoEdyVfpw3RsP3mMY5lJDGjABXlBu3twmLwAwM5D35lMc/AcIDVUGbJ4W6HfAj
	 tV3H/1AqP4Nbw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CFC517E14F5;
	Fri,  6 Feb 2026 11:07:44 +0100 (CET)
Message-ID: <e92ca2a7-7a7a-4a00-9fd8-ecacc588ffa9@collabora.com>
Date: Fri, 6 Feb 2026 11:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] drm/mediatek: ovl: Enable per-plane color
 operations on MT8195
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 daniels@collabora.com, ariel.dalessandro@collabora.com, kernel@collabora.com
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-4-0cb99bd0ab33@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-4-0cb99bd0ab33@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_020747_952468_02904375 
X-CRM114-Status: GOOD (  13.30  )
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

Il 23/12/25 20:44, Nícolas F. R. A. Prado ha scritto:
> MT8195's OVL hardware supports per-plane color operations. Enable
> support for it in the driver.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Agreed, but you're enabling something that doesn't exist.
Please move this commit at the end, so that you enable it after it's all
implemented.

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 46238c21b0ac..cfc6a3154f73 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -738,6 +738,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>   	.fmt_rgb565_is_0 = true,
>   	.smi_id_en = true,
>   	.supports_afbc = true,
> +	.supports_plane_colorops = true,
>   	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
>   		       BIT(DRM_MODE_BLEND_COVERAGE) |
>   		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
> 



