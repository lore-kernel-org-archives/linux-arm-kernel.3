Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596AFCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qI73iBWdz1yG8sK+Mp5xzDq+xEkKCF/JG17lsOVTyA4=; b=OEgn+aCl3ZqM89y62Y2LivpPR6
	I8VItwlEyTAIUiiVeS7NR/vcMHBJludT1qV3tlEwMcI50vwTQJOpNv7uQ571LT2WXFX/uES9kIGht
	cUKolb6Hv6ryQ3j/9O9Y5r2uNfLhnv5ChR/b2Y3uwmsLPtIaLsYk+yKBJm9iioAdXsO7XstIXbZa+
	t9jVfBxW0gufmmN2woa9RFlFvrws+FHvyU3lFHaRfF+UaX8rPldms5mZmxWY7qXmQUt216vmNVbe4
	bo//V4N4uhkuZMfnXi874unGSUD7Z2Lu0c8nprIzTmniBdtfCx1JsUOCwc395LYjGzBdoILrP9O3R
	Ame+aFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ow8-00000005ziL-1C9g;
	Thu, 09 Oct 2025 11:35:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ow5-00000005zhw-34wk;
	Thu, 09 Oct 2025 11:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009751;
	bh=Z0E5Ui2XxRD/RtSI3wRkIkjJDJlHxUBHJsvJwXR2IHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FqNEEpMAGBk0Mc1/tb6CS85/YBxMY+XW72k7bSSh7lUpqvu2Fh3zIkzgg9LKe7Unj
	 BXPXZAX6Kv8WfI5J6Qn7hw0pQHwHiGZHVODQxK2jmqh2vNoj2nY9HyhBMQNk54wsgL
	 sRVV7EzEFq47OSde/2j/vhSyWyv8OJaFm6Sah9DzpXb2CPlA+JzES4SaXK1sXWU+Nq
	 X2Qp+VnafoXkIRT/ZEYsZvGGASt0kljvMsgWjAKfTgAvyfi/JrFHOFJBaLTGX/Uee9
	 88mwX+isXesAIfHJjalyi+7jsBW7zVgmTKJhh4snxm0TnkoPMLZZzQj4UR1PY1w/uZ
	 IY0y0TMYh05iA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C891117E0125;
	Thu,  9 Oct 2025 13:35:50 +0200 (CEST)
Message-ID: <e18a0772-3031-4fff-a625-b1d4e1aab605@collabora.com>
Date: Thu, 9 Oct 2025 13:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/20] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 hardware without subsys ID support
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
 <20250827114006.3310175-10-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-10-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_043554_121971_68EC8831 
X-CRM114-Status: GOOD (  24.10  )
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
> When GCE executes instructions, it typically locates the corresponding
> hardware register using the subsys ID. For hardware that does not
> support subsys ID, the subsys ID is set to an invalid value, and the
> physical address must be used to generate GCE instructions.
> 
> The main advantage of using subsys ID is to reduce the number of
> instructions. Without subsys ID, an additional `ASSIGN` instruction
> is needed to assign the high bytes of the physical address, which can
> impact performance if too many instructions are required. However, if
> the hardware does not support subsys ID, using the physical address
> is the only option to achieve the same functionality.
> 
> This commit adds a pa_base parsing flow to the cmdq_client_reg structure
> to handle hardware without subsys ID support.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 15 +++++++++++++--
>   include/linux/soc/mediatek/mtk-cmdq.h  |  3 +++
>   2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 4b1591e5b1ae..41e1997cdd53 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -8,6 +8,7 @@
>   #include <linux/module.h>
>   #include <linux/mailbox_controller.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
> @@ -60,20 +61,30 @@ int cmdq_dev_get_client_reg(struct device *dev,
>   			    struct cmdq_client_reg *client_reg, int idx)
>   {
>   	struct of_phandle_args spec;
> +	struct resource res;
>   	int err;
>   
>   	if (!client_reg)
>   		return -ENOENT;
>   

	err = of_address_to_resource( ... )
	if (err) {
		dev_err(....)
		return;
	}

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	if (of_address_to_resource(dev->of_node, 0, &res) != 0) {
> +		dev_err(dev, "Missing reg in %s node\n", dev->of_node->full_name);
> +		return -EINVAL;
> +	}
> +	client_reg->pa_base = res.start;
> +
>   	err = of_parse_phandle_with_fixed_args(dev->of_node,
>   					       "mediatek,gce-client-reg",
>   					       3, idx, &spec);
>   	if (err < 0) {
> -		dev_warn(dev,
> +		dev_dbg(dev,
>   			"error %d can't parse gce-client-reg property (%d)",
>   			err, idx);
>   
> -		return err;
> +		/* make subsys invalid */
> +		client_reg->subsys = CMDQ_SUBSYS_INVALID;
> +
> +		return 0;
>   	}
>   
>   	client_reg->subsys = (u8)spec.args[0];
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 5e3a0e807980..3699229a7375 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -23,6 +23,8 @@
>   #define CMDQ_THR_SPR_IDX2	(2)
>   #define CMDQ_THR_SPR_IDX3	(3)
>   
> +#define CMDQ_SUBSYS_INVALID	(U8_MAX)
> +
>   struct cmdq_pkt;
>   
>   enum cmdq_logic_op {
> @@ -52,6 +54,7 @@ struct cmdq_operand {
>   
>   struct cmdq_client_reg {
>   	u8 subsys;
> +	phys_addr_t pa_base;
>   	u16 offset;
>   	u16 size;
>   };


