Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100D1CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IkHJKP4OIdKivWki/xBNUzKYRP0S4pB3wjtF0ZdwS8=; b=C2DA4PWmaU2xY2by1Bqa5N48mI
	HtmhgDjWsPatM9p9z8dq5HWyB8dpwUuI6nL+wd+7do5SxX5wss4hi7AO0YqPDrc189YQPCnFXMjuT
	BEA3rW+yjpLAOQRaKGPTXXfxF99KoffnYyL0sFtPbP7eAEHSf72u6CAd0OpABwou091qhCvoIkrbl
	kUtkoEsw7YWRMTjHDE72hhvz8i+VF+lmoA9EmRHOETLvnxkYVHIHfX5G/3yY1mUYi8jP8yni9hBXr
	BngyEr41SOz6lnM5Zw71SwMJlAmPLa2yKbAXASGXmTISCzY/molhdMri+JqNAWV/EH6UxZQHpTzKY
	EXhmjE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZcR-000000016PR-3TmG;
	Thu, 28 Aug 2025 10:12:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYet-00000000vBz-2X9X;
	Thu, 28 Aug 2025 09:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756372260;
	bh=dPrYDz7aaaDOtcDn6hEy0IZTYQxNLmnaAHVIwg68uwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IQanoKyBfluSNfPHhrJk4NcYs2n2pY0lMdsRz2vZFccbWWWbT0KcJ2X0ZPgl2rSVb
	 pxrsVZYwaKQCZx1ff/sr26IFkyxLYYIZ04RK8G3ee/TDyzNf9EWVGbt5BrHcaKvZDC
	 UmLr4eiyu2qf4tpNE2qW9pehksF9b1E6jJnBSB9rU52quiJ1eRDF9dSl0TRjCbigNV
	 brGWl8inplnwXB3eXhJ+0w34IWwS9L+mZblulAN7R8RC2YVA1Q4HhfoaPA6v/PVSQ6
	 MV0TkDsVTcfYjP/OheSWQGV2v2TSIO/KWi9FsZBtuwU3zs+WceVlZj3IDfJkSbT5ll
	 CfZ4a+tEzOBFQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:55b9:ed88:bb41:e59d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8FA4317E0985;
	Thu, 28 Aug 2025 11:10:59 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: laura.nao@collabora.com,
	wenst@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	guangjie.song@mediatek.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	netdev@vger.kernel.org,
	nfraprado@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	robh@kernel.org,
	sboyd@kernel.org
Subject: Re: [PATCH v4 02/27] clk: mediatek: clk-pll: Add ops for PLLs using set/clr regs and FENC
Date: Thu, 28 Aug 2025 11:09:58 +0200
Message-Id: <20250828090958.29653-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250825123952.208448-1-laura.nao@collabora.com>
References: <20250825123952.208448-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_021103_795494_E76C2D52 
X-CRM114-Status: GOOD (  24.04  )
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


On 8/25/25 14:39, Laura Nao wrote:
> Hi Chen-Yu,
>
> On 8/15/25 05:18, Chen-Yu Tsai wrote:
>> On Tue, Aug 5, 2025 at 10:55 PM Laura Nao <laura.nao@collabora.com> wrote:
>>>
>>> MT8196 uses a combination of set/clr registers to control the PLL
>>> enable state, along with a FENC bit to check the preparation status.
>>> Add new set of PLL clock operations with support for set/clr enable and
>>> FENC status logic.
>>>
>>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>>> ---
>>>  drivers/clk/mediatek/clk-pll.c | 42 +++++++++++++++++++++++++++++++++-
>>>  drivers/clk/mediatek/clk-pll.h |  5 ++++
>>>  2 files changed, 46 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
>>> index 49ca25dd5418..8f46de77f42d 100644
>>> --- a/drivers/clk/mediatek/clk-pll.c
>>> +++ b/drivers/clk/mediatek/clk-pll.c
>>> @@ -37,6 +37,13 @@ int mtk_pll_is_prepared(struct clk_hw *hw)
>>>         return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) != 0;
>>>  }
>>>
>>> +static int mtk_pll_fenc_is_prepared(struct clk_hw *hw)
>>> +{
>>> +       struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>>> +
>>> +       return readl(pll->fenc_addr) & pll->fenc_mask;
>>
>> Nits:
>>
>> I'd do a double-negate (!!) just to indicate that we only care about
>> true or false.
>>
>> Also, why do we need to store fenc_mask instead of just shifting the bit
>> here? Same goes for the register address. |pll| has the base address.
>> Why do we need to pre-calculate it?
>>
>> The code is OK; it just seems a bit wasteful on memory.
>>
>
> Thanks for the heads up - since these are only used here for now, I
> agree they’re not really adding value. I’ll drop fenc_mask and fenc_addr
> in the next revision.
>

On second thought, since pll->base_addr is initialized as base +
data->reg (i.e. at CON0 offset), and the FENC status register sits
before that in the register map, it can’t be derived directly from
pll->base_addr.

So we need to keep fenc_addr, but I’ll drop fenc_mask and shift the bit
inline instead.

Laura

> Best,
>
> Laura
>
>> Either way, this is
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>>> +}
>>> +
>>>  static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
>>>                 u32 pcw, int postdiv)
>>>  {
>>> @@ -274,6 +281,25 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>>>         writel(r, pll->pwr_addr);
>>>  }
>>>
>>> +static int mtk_pll_prepare_setclr(struct clk_hw *hw)
>>> +{
>>> +       struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>>> +
>>> +       writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
>>> +
>>> +       /* Wait 20us after enable for the PLL to stabilize */
>>> +       udelay(20);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void mtk_pll_unprepare_setclr(struct clk_hw *hw)
>>> +{
>>> +       struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>>> +
>>> +       writel(BIT(pll->data->pll_en_bit), pll->en_clr_addr);
>>> +}
>>> +
>>>  const struct clk_ops mtk_pll_ops = {
>>>         .is_prepared    = mtk_pll_is_prepared,
>>>         .prepare        = mtk_pll_prepare,
>>> @@ -283,6 +309,16 @@ const struct clk_ops mtk_pll_ops = {
>>>         .set_rate       = mtk_pll_set_rate,
>>>  };
>>>
>>> +const struct clk_ops mtk_pll_fenc_clr_set_ops = {
>>> +       .is_prepared    = mtk_pll_fenc_is_prepared,
>>> +       .prepare        = mtk_pll_prepare_setclr,
>>> +       .unprepare      = mtk_pll_unprepare_setclr,
>>> +       .recalc_rate    = mtk_pll_recalc_rate,
>>> +       .round_rate     = mtk_pll_round_rate,
>>> +       .set_rate       = mtk_pll_set_rate,
>>> +};
>>> +EXPORT_SYMBOL_GPL(mtk_pll_fenc_clr_set_ops);
>>> +
>>>  struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
>>>                                         const struct mtk_pll_data *data,
>>>                                         void __iomem *base,
>>> @@ -315,6 +351,9 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
>>>         pll->hw.init = &init;
>>>         pll->data = data;
>>>
>>> +       pll->fenc_addr = base + data->fenc_sta_ofs;
>>> +       pll->fenc_mask = BIT(data->fenc_sta_bit);
>>> +
>>>         init.name = data->name;
>>>         init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
>>>         init.ops = pll_ops;
>>> @@ -337,12 +376,13 @@ struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
>>>  {
>>>         struct mtk_clk_pll *pll;
>>>         struct clk_hw *hw;
>>> +       const struct clk_ops *pll_ops = data->ops ? data->ops : &mtk_pll_ops;
>>>
>>>         pll = kzalloc(sizeof(*pll), GFP_KERNEL);
>>>         if (!pll)
>>>                 return ERR_PTR(-ENOMEM);
>>>
>>> -       hw = mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
>>> +       hw = mtk_clk_register_pll_ops(pll, data, base, pll_ops);
>>>         if (IS_ERR(hw))
>>>                 kfree(pll);
>>>
>>> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
>>> index c4d06bb11516..7fdc5267a2b5 100644
>>> --- a/drivers/clk/mediatek/clk-pll.h
>>> +++ b/drivers/clk/mediatek/clk-pll.h
>>> @@ -29,6 +29,7 @@ struct mtk_pll_data {
>>>         u32 reg;
>>>         u32 pwr_reg;
>>>         u32 en_mask;
>>> +       u32 fenc_sta_ofs;
>>>         u32 pd_reg;
>>>         u32 tuner_reg;
>>>         u32 tuner_en_reg;
>>> @@ -51,6 +52,7 @@ struct mtk_pll_data {
>>>         u32 en_clr_reg;
>>>         u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
>>>         u8 pcw_chg_bit;
>>> +       u8 fenc_sta_bit;
>>>  };
>>>
>>>  /*
>>> @@ -72,6 +74,8 @@ struct mtk_clk_pll {
>>>         void __iomem    *en_addr;
>>>         void __iomem    *en_set_addr;
>>>         void __iomem    *en_clr_addr;
>>> +       void __iomem    *fenc_addr;
>>> +       u32             fenc_mask;
>>>         const struct mtk_pll_data *data;
>>>  };
>>>
>>> @@ -82,6 +86,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
>>>                              struct clk_hw_onecell_data *clk_data);
>>>
>>>  extern const struct clk_ops mtk_pll_ops;
>>> +extern const struct clk_ops mtk_pll_fenc_clr_set_ops;
>>>
>>>  static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
>>>  {
>>> --
>>> 2.39.5
>>>
>

