Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340E6C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 01:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hFUsN/K02BBP5aa1d+e+JjhSauhkH1OuFe7JHH5P4E=; b=rEXN6I8pxZ4XKBp7Nb04Ce6Kh9
	s6yzH1kK4E8I3ge52RDh7td4vydRrXw4IDNkyN7hcjO/RYohJxfSKXGN78GKDdOvxXx4OiRoRDcQR
	j90/Kdcvf1D7GbBNxONxAu1u9Lr27B4/5lnP5Dk303Mtui/SS93UEwMKFMKaJNonUSf+owrRNKRf/
	ocphbLbCE163O7R/w+XQJ8lG9fIk2TEF3qvAZmbUOfIDQwoli2zpBeCWivcDI/5A65p/0ikN8Kd8w
	I1G/BSMt1EP4Kl2i2h3Slowlv2xeupPlad/OCcexWH612j4cduCclaqA5rwOv/sf2yt06VhGG0ITd
	SJZSpnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJMpv-00000007ujE-3CrB;
	Mon, 26 May 2025 01:41:07 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJMnn-00000007ucM-1Iry
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 01:38:57 +0000
Message-ID: <7a42e9d1-93ce-4666-b7e7-3c0b4e2c0c99@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748223531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hFUsN/K02BBP5aa1d+e+JjhSauhkH1OuFe7JHH5P4E=;
	b=SRmnfHNINkkKfSn8W6N3pK4Z32Bvd80Uh08Q+VdxonIAirvRyyHDvIwm8ANYNOvux0/JLO
	0U2c1dWTONVN/nJbFvjAgwMBItF9uxzGpG/L5ch0SkuohWyu1lMmpHsVjDjvtxMxO1S6Z2
	TyB5xx15aOYf1UA8YhwNyYLwFBVbGo0=
Date: Mon, 26 May 2025 09:38:41 +0800
MIME-Version: 1.0
Subject: Re: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Feiyang Chen <chenfeiyang@loongson.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250526002924.2567843-2-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_183856_185960_4F1ECF19 
X-CRM114-Status: GOOD (  23.02  )
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


在 5/26/25 8:29 AM, James Hilliard 写道:
> The Allwinner H616 ships with two different on-die phy variants, in
> order to determine the phy being used we need to read an efuse and
> then select the appropriate PHY based on the AC300 bit.
>
> By defining an emac node without a phy-handle we can override the
> default PHY selection logic in stmmac by passing a specific phy_node
> selected based on the ac200 and ac300 names in a phys list.
>
> This allows us to have a device tree that defines both PHY variants
> even though only one will actually end up being used at runtime
> based on the ac300 nvmem efuse bit.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 6c7e8655a7eb..e275f4caa684 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -11,6 +11,7 @@
>   #include <linux/mdio-mux.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
>   #include <linux/of.h>
>   #include <linux/of_mdio.h>
>   #include <linux/of_net.h>
> @@ -280,6 +281,8 @@ static const struct emac_variant emac_variant_h6 = {
>   #define SYSCON_ETCS_EXT_GMII	0x1
>   #define SYSCON_ETCS_INT_GMII	0x2
>   

> +#define AC300_KEY		BIT(8)
> +

I have observed all the BIT macros in this file, and they all

have a line of comments. I think a comment is also needed here.

>   /* sun8i_dwmac_dma_reset() - reset the EMAC
>    * Called from stmmac via stmmac_dma_ops->reset
>    */
> @@ -1159,6 +1162,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>   	struct net_device *ndev;
>   	struct regmap *regmap;
>   	int ret;
> +	u16 val;
>   
>   	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>   	if (ret)
> @@ -1222,6 +1226,21 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>   	if (IS_ERR(plat_dat))
>   		return PTR_ERR(plat_dat);
>   
> +	if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
> +		const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
> +		int index = of_property_match_string(dev->of_node, "phy-names", phy_name);
> +		if (index < 0) {
> +			dev_err(dev, "PHY name not found in device tree\n");
> +			return -EINVAL;
> +		}
> +
> +		plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
> +		if (!plat_dat->phy_node) {
> +			dev_err(dev, "Failed to get PHY node from phys property\n");
> +			return -EINVAL;
> +		}
> +	}
> +
How about preparing a separate function for it?  Then call it in probe().

If you are willing to do so, remember to write a code comment.


Thanks,

Yanteng



