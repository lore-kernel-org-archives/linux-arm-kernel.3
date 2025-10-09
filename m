Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A00CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAvKbkD/SVmCg3W0qls8xZdyspkVNIgNQEMq0eojYIU=; b=A0rU8vy3gZeWnzBIygj6c4MS1x
	OBnER985bg6i8sFXWnpE9WP1BCoCCazB5/YU7T3wObsQYh4G3x8ZB/XsBbvynvw/IzFfpVY03sPSd
	nd1t494oLPhZMufiXG+YmngwfXeZ/d9UWWR3kEYp4oM8YcJtkRhu79Gw7crJ31JsKAqc57vKTFQYD
	fjRy7ECAGuDAROH65p0ybJNqJw44pWT64lv4HltFxJQol/Y/pgH8Mx0pfrAdqEp7nq3zeIp6c0Tj/
	ok9vWtPSjMxiQGV6gpBvy6TSkC9D7dGQh4L1y5f3nipUvUSGG4kWduXLQkloATB6j4731McgJ9gcH
	jPGEBTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6p1a-000000060lO-2pg4;
	Thu, 09 Oct 2025 11:41:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6p1X-000000060jF-2aRb;
	Thu, 09 Oct 2025 11:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760010089;
	bh=J6gOtlXNGiadx1WV9Jrsfa9A9Mo7GEanyAvz8BWuZfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UhcDCo/VFw8EUeX1askLaZJwGhGmzayOECoCTQAA+mbSvRoMXXroPrLvNH5qJpgwP
	 kLbBG5Az1XLGWkRh7gGcB/KsOgRB03/Yd70YwobnJPGeqXyifcNWQYfsswsyqjIkg5
	 92e95GjlMMqLWysVaZEsYYKeaoZjw6CH9mmcwAnlpdQ34+i8e+6fl2AgAa5agnNO4M
	 k7PbDB5JqdcRyNjr9HzCvLLahDKAQoz6ryFPZvjGy4+IVhmmIakoRrPY0xR887d07v
	 Xv3DSx/v+FyQdOolGjE4C+ItL6S6GZx44Q6+/EsZeNRynx9hp8cF8+u+5qsGwzn4CR
	 YCth/5VZ/s6Iw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94FBB17E0A30;
	Thu,  9 Oct 2025 13:41:28 +0200 (CEST)
Message-ID: <6f1f74b3-ac2e-4ea6-abce-14ef12ea10dd@collabora.com>
Date: Thu, 9 Oct 2025 13:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/20] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-13-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-13-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_044131_837834_267BBF69 
X-CRM114-Status: GOOD (  20.97  )
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> To support hardware without subsys IDs on new SoCs, add a programming
> flow that checks whether the subsys ID is valid.
> 
> If the subsys ID is valid, the flow will call cmdq_pkt_write_subsys()
> and cmdq_pkt_write_mask_subsys() instead of the original
> cmdq_pkt_write() and cmdq_pkt_write_mask().
> 
> If the subsys ID is invalid, the flow will call cmdq_pkt_write_pa() and
> cmdq_pkt_write_mask_pa() to achieve the same functionality.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 12 +++++++++---
>   drivers/soc/mediatek/mtk-mutex.c |  8 ++++++--
>   2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index bb4639ca0b8c..0c324846e334 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -167,9 +167,15 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
>   	u32 tmp;
>   
>   	if (mmsys->cmdq_base.size && cmdq_pkt) {
> -		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> -					  mmsys->cmdq_base.offset + offset, val,
> -					  mask);
> +		offset += mmsys->cmdq_base.offset;
> +		if (mmsys->cmdq_base.subsys != CMDQ_SUBSYS_INVALID)
> +			ret = cmdq_pkt_write_mask_subsys(cmdq_pkt, mmsys->cmdq_base.subsys,
> +							 mmsys->cmdq_base.pa_base, offset,
> +							 val, mask);
> +		else /* only MMIO access, no need to check mminfro_offset */

nit: fix typo -> mminfra_offset

and also it would be nice if you could also say in a comment that all GCEs support
write_mask_pa() without subsys, but it is less performant - so for the platforms
that do support it, we prefer using it.

Of course that has to be properly reworded, but that's the idea anyway :-)

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +			ret = cmdq_pkt_write_mask_pa(cmdq_pkt, mmsys->cmdq_base.subsys,
> +						     mmsys->cmdq_base.pa_base, offset, val, mask);
> +
>   		if (ret)
>   			pr_debug("CMDQ unavailable: using CPU write\n");
>   		else
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 38179e8cd98f..9b22d7e09d99 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -990,6 +990,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
>   						 mutex[mutex->id]);
>   	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
> +	dma_addr_t en_addr = mtx->addr + DISP_REG_MUTEX_EN(mutex->id);
>   
>   	WARN_ON(&mtx->mutex[mutex->id] != mutex);
>   
> @@ -998,8 +999,11 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
>   		return -ENODEV;
>   	}
>   
> -	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
> -		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
> +	if (mtx->cmdq_reg.subsys != CMDQ_SUBSYS_INVALID)
> +		cmdq_pkt_write_subsys(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
> +	else /* only MMIO access, no need to check mminfro_offset */
> +		cmdq_pkt_write_pa(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);



