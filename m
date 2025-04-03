Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B510C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9v0eNF5JOJ854McAOkqtCfn63FCnLwK9j6z///x1SU=; b=10t+JAflzrjWsfLbypCxgEMGMM
	HAmiPKpVV/BaFXObCV8LVYtdwjt7Tmban/3pw0d80nA7RL1bbF6h7yxxPDGKMqKrHMt6FY1AIMeDj
	c6WmqD0yhKiuSKye8Em2qUWmnuWeQNccGGWZSdwTOvcDmoT/4P1OLvQWSNvsIbVlK4cnLBn0C9UlV
	bIFV3ZWKdb98UfVbiXyOb8GkhClngSkMHW0QbF9WH+p9Nz8t00l+XW6URBLqMAf7Yk8VDShAI6G13
	Lv6EnZTkL0os3A281pbn5e+MtL6njdtAxa1RuD5YN2AynItRMa5JXkYTVmuqPd0yS0ZmdypbhVy+L
	L5ZhAYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hzf-00000008b0m-1eLT;
	Thu, 03 Apr 2025 10:40:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HhM-00000008YYX-0lfa;
	Thu, 03 Apr 2025 10:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743675682;
	bh=0oE4lMdKbjGPtKZ/zki1hCNZrfNg91tWfdphSD8J1Nw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YOMpwmEH6WLl5/kP+yXKdKE0c29/hieX44XzQ4RsIYxxu3SwsDQ17jv6szsAdzoyE
	 oABAy3C2DKTNPlg6FuaPa8CUQS7tcRNpzBN5byRJGF2KC9Mi+IQ+grVNxdoYfqm/HR
	 dUhT/adw6a5M3thbMccMxadccDn/EdlBz5hVJsx63TexyCB8X0y1m3ruccKaKcutg5
	 qxFBTlQlL7AihMPBkxV59weTtantbf6BM5CtJY4kwnZBfg6RvDt27QLJXuib/SqaC5
	 CUjCJ1IlnaRwnIthCpnLv+6+2JFEyXplP1Al2+CT0Pah8v1LP8qVUiY1p8kM6S/aY/
	 Pl6DhKuIpPfQw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C28C817E0F47;
	Thu,  3 Apr 2025 12:21:21 +0200 (CEST)
Message-ID: <568517cc-7108-4e38-b208-43d4e305f663@collabora.com>
Date: Thu, 3 Apr 2025 12:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Replace custom compare_dev with
 component_compare_of
To: shao.mingyin@zte.com.cn, chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, tang.dongxing@zte.com.cn
References: <20250403155419406T5YhIJKId1FWor70EWWHG@zte.com.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403155419406T5YhIJKId1FWor70EWWHG@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_032124_375418_DCDA313A 
X-CRM114-Status: GOOD (  13.63  )
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

Il 03/04/25 09:54, shao.mingyin@zte.com.cn ha scritto:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index fa0e95dd29a0..fe97bb97e004 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -492,11 +492,6 @@ static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
>   	{ /* sentinel */ }
>   };
> 
> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>   static int ovl_adaptor_of_get_ddp_comp_type(struct device_node *node,
>   					    enum mtk_ovl_adaptor_comp_type *ctype)
>   {
> @@ -567,7 +562,7 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
> 
>   		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
> 
> -		drm_of_component_match_add(dev, match, compare_of, node);
> +		drm_of_component_match_add(dev, match, component_compare_of, node);
>   		dev_dbg(dev, "Adding component match for %pOF\n", node);
>   	}
> 



