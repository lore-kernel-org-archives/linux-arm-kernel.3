Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B96ACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P90M5iyMqtxDQhn/5vp/vzPXbnlNqqevxAJO0gzXFQk=; b=t//ICUm4mgjoVn+2puQJcRmHTR
	wOpMXtWRD/xfo8Z1zlbvghyFTJ0VglbWCpfkmUqTaa4o7WwX7cNS1ipqXRY2UZfTQTfPwet1gZl6P
	5LgB2d3NLILAg9/VDGZUl0fNJ5N2PHsKE9RUxD2MKmEu1TPjjA1IKz+2CG992V5QLSvdb9FMey+IL
	xZrOqQ/0H9htca1juwnQL6Itj8AfLEElR7DD9e8+8PhQ8vR7L6JZhV2EP1GpAWpkCdWInpnbeEWgy
	dDaPsdhdnvXt1uDrk4G283ZP3ZgeQAZY7kkxE5bGJWq2Y19S6BI3WKdCCRhPNlloSyMgAiYQdvCuW
	Rxx2fUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6liX-00000005SaQ-2UGM;
	Thu, 09 Oct 2025 08:09:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6liU-00000005SZi-3s5r;
	Thu, 09 Oct 2025 08:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759997376;
	bh=KyklGAMNtWChaurBpHK/F2+DI+34oXWWStcbMlx5O1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LRD+5gZ34GwE1TSoRgv6iHn3KzXA7akJeAMubD6bh35xsyTqRczdE/Pp2ZX8AIGc/
	 kkgExMbedADvQpbyt1HZ3tFIr24wVHWL0tpq6zx1WoryuydCi1Tabn7a6fF8anTL62
	 Q/fs4RLUsgjFP5fkbOnkzHn9sx86LqUYnPfDVQhzRuu/dh8H2aEvFH55HIGv4tb51l
	 0RkT7dPm9F2upYo1nPxrX7gnCxdeaZv7UvPRnuWIMVXA+2eB6WW56uSU5+TIFmTemx
	 8Uk0KeQnXK8FS/6aUWzAingmikgnOp+XBVP55SxRNxi7bfhBEdrjNnv+ibm12vcmug
	 HFmpw8vgavdTA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D69D717E04DA;
	Thu,  9 Oct 2025 10:09:35 +0200 (CEST)
Message-ID: <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
Date: Thu, 9 Oct 2025 10:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass
 device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
 <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_010939_142558_C17150E0 
X-CRM114-Status: GOOD (  17.77  )
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

Il 08/10/25 18:05, Nicolas Frattaroli ha scritto:
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
> 
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/clk/mediatek/clk-mt2701.c            | 2 +-
>   drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 +-
>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 4 ++--
>   drivers/clk/mediatek/clk-mt6765.c            | 2 +-
>   drivers/clk/mediatek/clk-mt6779.c            | 2 +-
>   drivers/clk/mediatek/clk-mt6797.c            | 2 +-
>   drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 +-
>   drivers/clk/mediatek/clk-mt7629.c            | 2 +-
>   drivers/clk/mediatek/clk-mt7981-apmixed.c    | 2 +-
>   drivers/clk/mediatek/clk-mt7986-apmixed.c    | 2 +-
>   drivers/clk/mediatek/clk-mt7988-apmixed.c    | 2 +-
>   drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 3 ++-
>   drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
>   drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 2 +-
>   drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 2 +-
>   drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 3 ++-
>   drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 3 ++-
>   drivers/clk/mediatek/clk-mt8196-mcu.c        | 2 +-
>   drivers/clk/mediatek/clk-mt8196-mfg.c        | 2 +-
>   drivers/clk/mediatek/clk-mt8196-vlpckgen.c   | 2 +-
>   drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 2 +-
>   drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 2 +-
>   drivers/clk/mediatek/clk-pll.c               | 7 ++++---
>   drivers/clk/mediatek/clk-pll.h               | 6 +++---
>   24 files changed, 33 insertions(+), 29 deletions(-)
> 

..snip..

> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
> index d71c150ce83e4bb2fe78290c2d5570a90084246d..0e2b94b9cd4b56adceee3b04e9ab24c2526471da 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -78,9 +78,9 @@ struct mtk_clk_pll {
>   	const struct mtk_pll_data *data;
>   };
>   

There's a forward declaration of struct device_node in this header: with this
change, that becomes unused.

Please change that to a forward declaration of struct device instead.

While at it, I'd appreciate if you could either:
  A. Remove the forward declaration for `struct clk_hw_onecell_data` and for
     `struct clk_ops` (as both come from clk-provider.h - which this already
      includes);
    ...or...
  B. Remove the inclusion of clk-provider.h and keep the forward declarations.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> -int mtk_clk_register_plls(struct device_node *node,
> -			  const struct mtk_pll_data *plls, int num_plls,
> -			  struct clk_hw_onecell_data *clk_data);
> +int mtk_clk_register_plls(struct device *dev, const struct mtk_pll_data *plls,
> +			  int num_plls, struct clk_hw_onecell_data *clk_data);
> +
>   void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
>   			     struct clk_hw_onecell_data *clk_data);
>   
> 



