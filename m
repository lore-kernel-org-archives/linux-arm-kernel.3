Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CBECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iInILfH7V04K30zEHVH5G8Ap5mTUQ6lOQmpWHwQZVc=; b=BcjAdfgMHyRrV1n9C5k9nWvbvF
	SoiuTFC97Z9SFx4umXMF5R5Xzep/xt0K0E2/+3GZet2aOOOnqmBJ34sRRuL0VW+r7yR2yfgQgXHrj
	klqF9kCdkcjH5gBeEtXLUkWUzyRnXjDzkUozIp1t0G7RPWnkwX4eP8NuVYD/r0mRNkay4FH4F6zR4
	+VSM+2V2sRF1qz7EuOdxgn3v44v0KkHLzmc70b2JpmnXLWigRlWq9cg18HqmGsWLDV9jJ1ODMZCSH
	gm7xw+TI/g3sFscZ57VMHgobzHCK90WSpfx75ccTFiFeAmTnNwJAEuL/em3ng06zyeDqN0JvOyPqp
	7iPAt/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pEC-000000062Eg-3CA7;
	Thu, 09 Oct 2025 11:54:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pEA-000000062Ds-0BwL;
	Thu, 09 Oct 2025 11:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760010871;
	bh=B/o080jiuYuwYnKuOkoaAn5+mc0G3zApBcZNRGwdUfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q2uXQM5Qory6uBVrxpZujNoEUOWY144usrDsAU5OLYJ8WE5QiljfYsbogXwMoaY5Z
	 h2gFjgKTvmh7J0bIdg74aGnY1eayEdn2YhkF2PAzgz7LQCGosYlr2ItiWVepLh5WCO
	 BW9JaJCvMlChK38CmZQnQdqfaQA7KxDKwfPgal8NfmsqDzrDDrkT6rvbCL/v4L/dc9
	 3zzSsU3Eysjp81192joNSfLy57T6fgV6ibYrloPoV8lgOJSqPkNT6B8+R9ISIjUTWi
	 t3nhTX1cJprc7RwTRPforX5FHWQtLDDfNdUJ6t4N5sxzsPxxLXKJUggadtwC0ylVJ3
	 4T88QYdNXST8g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A649817E1060;
	Thu,  9 Oct 2025 13:54:30 +0200 (CEST)
Message-ID: <6690e20f-f88e-4c5a-8188-4d2a941fc6b1@collabora.com>
Date: Thu, 9 Oct 2025 13:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/20] drm/mediatek: Add programming flow for
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
 <20250827114006.3310175-14-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-14-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_045434_255651_9A35FA33 
X-CRM114-Status: GOOD (  25.53  )
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
> instead of the original cmdq_pkt_write().
> 
> If the subsys ID is invalid, the flow will call cmdq_pkt_write_mask_pa()
> to achieve the same functionality.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

In mediatek-drm and in mtk-mdp3 the performance of mtk_ddp_write is important: in
both, there are ways to know whether a platform is expected to always use the
cmdq_pkt_write_mask_pa() or the subsys() one.

Please check what platform is this driver running on - based on the platform, you
can assign a function pointer, so that you always call it like

priv->write_cmdq_pkt(cmdq_pkt, cmdq_reg, ofst, val, mask);

write_cmdq_pkt() could point to, either:
1. A function that checks if subsys != CMDQ_SUBSYS_INVALID, for platforms that
    are expected to have mixed PA *and* SUBSYS (hopefully none!!!); or
2. The cmdq_pkt_write_mask_subsys() function; or
3. The cmdq_pkt_write_mask_pa() function.

This removes lots and lots of branches at every call.

I want to remind you that CMDQ packets are being generated in many cases in the
mediatek-drm driver, one of which is upon VBLANK; Think of the case in which we
are driving a high refresh rate display (>=120Hz): not just in DSI Video mode
for which we manage just only vblanks and data pumping (which still needs quite
a bit of GCE writes).. but something like DSI CMD mode would probably generate
*a myriad* of GCE calls.... and that is only one of the cases, there are more
that don't involve specifically DSI.

Of course, for mtk-mdp3 there's a different story - but I guess it's useless to
add a specific example for that, I'm sure you got the point here.

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> index ac6620e10262..d902a65e1232 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> @@ -66,14 +66,28 @@ struct mtk_ddp_comp_dev {
>   	struct cmdq_client_reg cmdq_reg;
>   };
>   
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +static int mtk_ddp_write_cmdq_pkt(struct cmdq_pkt *cmdq_pkt, struct cmdq_client_reg *cmdq_reg,
> +				  unsigned int offset, unsigned int value, unsigned int mask)
> +{
> +	offset += cmdq_reg->offset;
> +
> +	if (cmdq_reg->subsys != CMDQ_SUBSYS_INVALID)
> +		return cmdq_pkt_write_mask_subsys(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
> +						  offset, value, mask);
> +	else /* only MMIO access, no need to check mminfro_offset */
> +		return cmdq_pkt_write_mask_pa(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
> +					      offset, value, mask);
> +}
> +#endif
> +
>   void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
>   		   unsigned int offset)
>   {
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (cmdq_pkt)
> -		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
> -			       cmdq_reg->offset + offset, value);
> +		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
>   	else
>   #endif
>   		writel(value, regs + offset);
> @@ -85,8 +99,7 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   {
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (cmdq_pkt)
> -		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
> -			       cmdq_reg->offset + offset, value);
> +		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
>   	else
>   #endif
>   		writel_relaxed(value, regs + offset);
> @@ -98,8 +111,7 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   {
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (cmdq_pkt) {
> -		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
> -				    cmdq_reg->offset + offset, value, mask);
> +		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, mask);
>   	} else {
>   #endif
>   		u32 tmp = readl(regs + offset);



