Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92DCCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLQZABaYA8pg/cADCwDp5SbB64VuELFdtUTBcIs/Qzo=; b=0YezuMxYe3nXyagBUWiSLWbVoG
	+eDSPuDd0MTr3BqGAItK3DsQbewwUcWEYyUohF4+w5070gKlPEcNeOimnKsSSQbKyPAso/x8Rkda6
	S9/RBvocrRuyw1sc6Xj6blyo+Of6nSE68PWywgzF3P2Nqr7ozoPmPQ+B/PO42CQJtZpriQY1Mda62
	ug3fML0FMksOI6VFqaYctWBpr5xZbIhg+OIrRayIlai+Q/iJUkr6sci4iCikc2K/DqP7d/qPRZ6KE
	CVvdCXEq1zh0l8mzgd3c99tdfTUSJ+w+AwvDk+i6xibjBec7xQLjeXGXXdqtdnTuWEc8mdOaBltVU
	EQ4PORLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfG-00000008Le0-1373;
	Mon, 25 Aug 2025 14:59:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWgo-00000007yVd-1IEW;
	Mon, 25 Aug 2025 12:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756126364;
	bh=5XWcstv/n0jB+QypykxUok+dX73nLTfw2ADRcqaWENA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YtWd7wd/Do6104b1d43xPf32kEqsxn0ax0rbs1jHoUeav7dcdgR3puSSqsBE4hdyc
	 bstHtSbFFuFMEBNTddQR9weAQHwYXS98MrEUIO24lf0yXeHBHkSs1zBaC+XYdCPosq
	 Ka2NZ6ZKHSOSVQH1CDxlxUcEhNl3jTsTlX4ZXH8BVkmH62Huu487ybcpQdrNEOMeaB
	 UCU1JVJ1WPuQGcIcY3xcSlc2rYY90dKKzokp9FjcpD9zl10b5yYgPXGUWr0gYcl/Xa
	 0SOrXk0Z//US+n1EGoVE2trHxcjWYlH8YBTC8aFFkTd5SMCQ01h2xLjeuuTFndql2w
	 ASPxPnnV5QXfg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:b1df:895a:e67b:5cd4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A46D17E0478;
	Mon, 25 Aug 2025 14:52:43 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: wenst@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	guangjie.song@mediatek.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	laura.nao@collabora.com,
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
Subject: Re: [PATCH v4 07/27] clk: mediatek: clk-gate: Add ops for gates with HW voter
Date: Mon, 25 Aug 2025 14:51:41 +0200
Message-Id: <20250825125141.209860-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAGXv+5HRKFrdjjXkwN6=OLtk=bK3C3mBnrDtmkEWeuxjz0pFKg@mail.gmail.com>
References: <CAGXv+5HRKFrdjjXkwN6=OLtk=bK3C3mBnrDtmkEWeuxjz0pFKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_055246_514282_E395D63F 
X-CRM114-Status: GOOD (  21.46  )
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

On 8/15/25 05:37, Chen-Yu Tsai wrote:
> On Tue, Aug 5, 2025 at 10:55 PM Laura Nao <laura.nao@collabora.com> wrote:
>>
>> MT8196 use a HW voter for gate enable/disable control. Voting is
>> performed using set/clr regs, with a status bit used to verify the vote
>> state. Add new set of gate clock operations with support for voting via
>> set/clr regs.
>>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>  drivers/clk/mediatek/clk-gate.c | 77 +++++++++++++++++++++++++++++++--
>>  drivers/clk/mediatek/clk-gate.h |  3 ++
>>  2 files changed, 77 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
>> index 0375ccad4be3..426f3a25763d 100644
>> --- a/drivers/clk/mediatek/clk-gate.c
>> +++ b/drivers/clk/mediatek/clk-gate.c
>> @@ -5,6 +5,7 @@
>>   */
>>
>>  #include <linux/clk-provider.h>
>> +#include <linux/dev_printk.h>
>>  #include <linux/mfd/syscon.h>
>>  #include <linux/module.h>
>>  #include <linux/printk.h>
>> @@ -12,14 +13,19 @@
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>>
>> +#include "clk-mtk.h"
>>  #include "clk-gate.h"
>>
>>  struct mtk_clk_gate {
>>         struct clk_hw   hw;
>>         struct regmap   *regmap;
>> +       struct regmap   *regmap_hwv;
>>         int             set_ofs;
>>         int             clr_ofs;
>>         int             sta_ofs;
>> +       unsigned int    hwv_set_ofs;
>> +       unsigned int    hwv_clr_ofs;
>> +       unsigned int    hwv_sta_ofs;
>>         u8              bit;
>>  };
>>
>> @@ -100,6 +106,28 @@ static void mtk_cg_disable_inv(struct clk_hw *hw)
>>         mtk_cg_clr_bit(hw);
>>  }
>>
>> +static int mtk_cg_hwv_set_en(struct clk_hw *hw, bool enable)
>> +{
>> +       struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
>> +       u32 val;
>> +
>> +       regmap_write(cg->regmap_hwv, enable ? cg->hwv_set_ofs : cg->hwv_clr_ofs, BIT(cg->bit));
>> +
>> +       return regmap_read_poll_timeout_atomic(cg->regmap_hwv, cg->hwv_sta_ofs, val,
>> +                                              val & BIT(cg->bit),
>> +                                              0, MTK_WAIT_HWV_DONE_US);
>> +}
>> +
>> +static int mtk_cg_hwv_enable(struct clk_hw *hw)
>> +{
>> +       return mtk_cg_hwv_set_en(hw, true);
>> +}
>> +
>> +static void mtk_cg_hwv_disable(struct clk_hw *hw)
>> +{
>> +       mtk_cg_hwv_set_en(hw, false);
>> +}
>> +
>>  static int mtk_cg_enable_no_setclr(struct clk_hw *hw)
>>  {
>>         mtk_cg_clr_bit_no_setclr(hw);
>> @@ -124,6 +152,15 @@ static void mtk_cg_disable_inv_no_setclr(struct clk_hw *hw)
>>         mtk_cg_clr_bit_no_setclr(hw);
>>  }
>>
>> +static bool mtk_cg_uses_hwv(const struct clk_ops *ops)
>> +{
>> +       if (ops == &mtk_clk_gate_hwv_ops_setclr ||
>> +           ops == &mtk_clk_gate_hwv_ops_setclr_inv)
>> +               return true;
>> +
>> +       return false;
>> +}
>> +
>>  const struct clk_ops mtk_clk_gate_ops_setclr = {
>>         .is_enabled     = mtk_cg_bit_is_cleared,
>>         .enable         = mtk_cg_enable,
>> @@ -138,6 +175,20 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv = {
>>  };
>>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_inv);
>>
>> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr = {
>> +       .is_enabled     = mtk_cg_bit_is_cleared,
>> +       .enable         = mtk_cg_hwv_enable,
>> +       .disable        = mtk_cg_hwv_disable,
>> +};
>> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr);
>> +
>> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv = {
>> +       .is_enabled     = mtk_cg_bit_is_set,
>> +       .enable         = mtk_cg_hwv_enable,
>> +       .disable        = mtk_cg_hwv_disable,
>> +};
>> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr_inv);
>> +
>>  const struct clk_ops mtk_clk_gate_ops_no_setclr = {
>>         .is_enabled     = mtk_cg_bit_is_cleared,
>>         .enable         = mtk_cg_enable_no_setclr,
>> @@ -153,8 +204,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
>>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
>>
>>  static struct clk_hw *mtk_clk_register_gate(struct device *dev,
>> -                                               const struct mtk_gate *gate,
>> -                                               struct regmap *regmap)
>> +                                           const struct mtk_gate *gate,
>> +                                           struct regmap *regmap,
>> +                                           struct regmap *regmap_hwv)
>>  {
>>         struct mtk_clk_gate *cg;
>>         int ret;
>> @@ -169,11 +221,22 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev,
>>         init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
>>         init.num_parents = gate->parent_name ? 1 : 0;
>>         init.ops = gate->ops;
>> +       if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
>> +               dev_err(dev, "regmap not found for hardware voter clocks\n");
>> +               return ERR_PTR(-ENXIO);
>
> return dev_err_probe()?
>
> I believe the same applies to the previous patch.
>

mtk_clk_register_gate and mtk_clk_register_mux actually both return a
struct clk_hw *.

>> +       }
>>
>>         cg->regmap = regmap;
>> +       cg->regmap_hwv = regmap_hwv;
>>         cg->set_ofs = gate->regs->set_ofs;
>>         cg->clr_ofs = gate->regs->clr_ofs;
>>         cg->sta_ofs = gate->regs->sta_ofs;
>> +       if (gate->hwv_regs) {
>> +               cg->hwv_set_ofs = gate->hwv_regs->set_ofs;
>> +               cg->hwv_clr_ofs = gate->hwv_regs->clr_ofs;
>> +               cg->hwv_sta_ofs = gate->hwv_regs->sta_ofs;
>> +       }
>> +
>>         cg->bit = gate->shift;
>>
>>         cg->hw.init = &init;
>> @@ -206,6 +269,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
>>         int i;
>>         struct clk_hw *hw;
>>         struct regmap *regmap;
>> +       struct regmap *regmap_hwv;
>>
>>         if (!clk_data)
>>                 return -ENOMEM;
>> @@ -216,6 +280,13 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
>>                 return PTR_ERR(regmap);
>>         }
>>
>> +       regmap_hwv = mtk_clk_get_hwv_regmap(node);
>> +       if (IS_ERR(regmap_hwv)) {
>> +               pr_err("Cannot find hardware voter regmap for %pOF: %pe\n",
>> +                      node, regmap_hwv);
>> +               return PTR_ERR(regmap_hwv);
>
> return dev_err_probe();
>

Will do.

Thanks,

Laura

> ChenYu
>
>> +       }
>> +
>>         for (i = 0; i < num; i++) {
>>                 const struct mtk_gate *gate = &clks[i];
>>
>> @@ -225,7 +296,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
>>                         continue;
>>                 }
>>
>> -               hw = mtk_clk_register_gate(dev, gate, regmap);
>> +               hw = mtk_clk_register_gate(dev, gate, regmap, regmap_hwv);
>>
>>                 if (IS_ERR(hw)) {
>>                         pr_err("Failed to register clk %s: %pe\n", gate->name,
>> diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
>> index 1a46b4c56fc5..4f05b9855dae 100644
>> --- a/drivers/clk/mediatek/clk-gate.h
>> +++ b/drivers/clk/mediatek/clk-gate.h
>> @@ -19,6 +19,8 @@ extern const struct clk_ops mtk_clk_gate_ops_setclr;
>>  extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
>>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
>>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
>> +extern const struct clk_ops mtk_clk_gate_hwv_ops_setclr;
>> +extern const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv;
>>
>>  struct mtk_gate_regs {
>>         u32 sta_ofs;
>> @@ -31,6 +33,7 @@ struct mtk_gate {
>>         const char *name;
>>         const char *parent_name;
>>         const struct mtk_gate_regs *regs;
>> +       const struct mtk_gate_regs *hwv_regs;
>>         int shift;
>>         const struct clk_ops *ops;
>>         unsigned long flags;
>> --
>> 2.39.5
>>

