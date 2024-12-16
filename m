Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4167E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVYVf9T0JG6bchMCPfRX3r5WmjaLxUaQC48hkI7msks=; b=Va5OWiJ48KktRZ4MBN2DqgJbPO
	6Vd5nmVJtdFs3XAea8fXYCOXVnMZc0/gMXmg5CiUuHNpCEN7/9hQ+HbBUT7nhzph3glCxKSmMa+T3
	6NKkSaJK48beMNxFhnsf64IQEquAKIh0EGgFIr2o69KAm8OkeTeEn8G3uesCU+xnno9HSrCun3Ff5
	zwuaVPjTw+fP5fnDKNhuq9HLuDjeWzOPLzTz5O6ixAclivcA1S+580WWZOHcZv/pxE7Q719EzE2tX
	zTz8ovr94w2F/DLxFxw8bXee9Hgluq/jUaroomy+NXawhBHL0Nd/1/fwMDGO20xyO/1RiQ9y4XUe6
	q672mKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN92z-00000009nNy-2VeR;
	Mon, 16 Dec 2024 11:13:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN90f-00000009n21-0OSQ;
	Mon, 16 Dec 2024 11:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734347490;
	bh=9FtWM9F33hvv9T4AE+nNxA94QLDsh/3495wx1tvpwyI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Z9xq+i5xhImHLW55YgRgyEM7IxDe+HmaSOrf0Zsc0OGHHFQUa0zpFwMALNHsBpZvx
	 fW3WVEjFFWkfTxL4yAF0SBxbn+Bv9U6GjmnTtRACleNMQFr+7yrKBZI1M2uvfvroap
	 KlhtHqNj4Mjar6nNVz2TGvz/MT7HEuqOiHXj/3Zqg9ho4Pqwr3/G3C2CyyNJle4Hgn
	 YhpxTsAddiSSs3Zc5WklrygwBJUEf2i4dAIlfWbGcXOnAMqIJhdNZ4hXh10YKH96PD
	 QovxEt34OTdZqKkMRsrM/xtqCC97tt4FMHjsHRvi8BunwIbL/HjFN/rEDWQ+KA+aQy
	 C/Ao+3IuatAzQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3BF817E3634;
	Mon, 16 Dec 2024 12:11:29 +0100 (CET)
Message-ID: <adb6356b-19ea-4350-a691-3487d42c9fe2@collabora.com>
Date: Mon, 16 Dec 2024 12:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: only touch DISP_REG_OVL_PITCH_MSB if AFBC
 is supported
To: Daniel Golle <daniel@makrotopia.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Justin Green <greenjustin@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>, John Crispin <john@phrozen.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <8c001c8e70d93d64d3ee6bf7dc5078d2783d4e32.1734300345.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8c001c8e70d93d64d3ee6bf7dc5078d2783d4e32.1734300345.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_031133_288450_2EDDECD4 
X-CRM114-Status: GOOD (  16.03  )
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

Il 15/12/24 23:09, Daniel Golle ha scritto:
> Touching DISP_REG_OVL_PITCH_MSB leads to video overlay on MT2701, MT7623N
> and probably other older SoCs being broken.
> 
> Only touching it on hardware which actually supports AFBC like it was
> before commit c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek
> DRM driver") fixes it.
> 
> Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index f731d4fbe8b6..321b40a387cd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -545,7 +545,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
>   		mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg, ovl->regs,
>   				      DISP_REG_OVL_HDR_PITCH(ovl, idx));
> -	} else {
> +	} else if (ovl->data->supports_afbc) {
>   		mtk_ddp_write_relaxed(cmdq_pkt,
>   				      overlay_pitch.split_pitch.msb,
>   				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));

At this point you should just move the block over a new function....

if (ovl->data->supports_afbc)
	mtk_ovl_afbc_layer_config(ovl, cmdq_pkt, idx, is_afbc);

static void mtk_ovl_afbc_layer_config( .... )
{
	if (is_afbc) {
		.....
	} else {
		.....
	}
}

Cheers,
Angelo

