Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C7DEE2084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtPVpz8sOb9RUu3RhQTdJmlwmfVdOAUSMmi5lFGls/I=; b=WzFKnVkcpL2OgPXVM/nmN9mEje
	HWFpECNK5JIrxrGNPSKZC6rgP7yG9ktcqj9DQ766pMLL6WxLmzON2ILsnq4UdGRc1qBTWZ7MsCdSD
	s3GoA8priuec+rwPkGMbKbMbCQpnndzvhwmshr46hfL41r4uOipVU2B3a7sUBrkcmfiG9zMagsP6D
	g8ftio9rZYjd38wB4eD8TpR48LvRb7+LGbLH4uvSY47vpkFz1FQr2s1Sjdc4gJaR7X8oz/Ta5/Wrp
	HGhm80yi9iftF7Sfq20XQSXSCHB2C0Inbge1YidGAPWYw4E12QCne6dSACyvy3c//T0ejEkV6HWTJ
	A7N2nz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIkc-0000000B8zx-3Gn4;
	Fri, 06 Feb 2026 10:07:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIka-0000000B8zT-1pYA;
	Fri, 06 Feb 2026 10:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770372461;
	bh=ckwfZZUnF8fL/Azdshxhj9PjExQ0BP9R3wAPGTU38so=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UORMtQGXRTSACpGjusbMGZrsOhPPSf+fHupMXtcLdE9yYoEIPjZJ3kI0B7xGfqg98
	 iiJUxST4VfY77/VV3T3YKC3ZtuEGMCKGkfoboTdQCImVzQRuIQw3ozCAH0/2tfKw+K
	 j7ecRqAVOoQZl1aBE5MgYYdQfEs7ics+yTchfbRC3kEjNnfhy5KETHr+2PjVd7zQoi
	 LiNluujQwnQeNhcz3iGbv/n1mAwv4gEp55MYjcSAwZgSYRcsugztL7lTh4D9CSi7tQ
	 9LujU2rJBe1T0kmmT5G06QcAI8SxsePLoePinMv/Iz76oKL2/tUNaJL+7bXBRXef8S
	 BU3VnlWcdMoIw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E367B17E1428;
	Fri,  6 Feb 2026 11:07:40 +0100 (CET)
Message-ID: <55bcc926-a090-4f4c-9325-6599761d10c6@collabora.com>
Date: Fri, 6 Feb 2026 11:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/mediatek: ovl: Add supports_plane_colorops flag
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
 <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_020744_649786_C9EC450D 
X-CRM114-Status: GOOD (  15.81  )
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
> Add a supports_plane_colorops flag to the driver data to allow SoCs that
> support per-plane color operations to enable support for it in the
> driver.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

You should merge this patch [03/11] with [05/11] - so that you introduce the member
in the same commit where you use it.

This patch is a one-liner and it's not doing anything complicated at all :-)

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 8e20b45411fc..46238c21b0ac 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -150,6 +150,7 @@ struct mtk_disp_ovl_data {
>   	const u32 *formats;
>   	size_t num_formats;
>   	bool supports_clrfmt_ext;
> +	bool supports_plane_colorops;
>   };
>   
>   /*
> 




