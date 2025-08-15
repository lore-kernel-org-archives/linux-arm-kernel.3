Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7C4CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXv9G7c+svq4lqcz4OBGpCl+m14S/SAGU1DXHucm83E=; b=Ij4pJwoAG989XtA90rSnGBeefX
	h1ubmicCKM9aYnE6vu464jIHjnQyYvDTpZ4TtCQrdQ1TGqSwiUXrI0DNXuGjex3LE29c9nYDVFEhE
	dQOABryTbdGr1ZFe/3wbwC2uoSpRwuyiImtz6VNe7o+FrHakF2HbkCBBAUd+kq23JldIgONbb376Q
	8S8PEa5l8NPp8AQBzhgDE+a+WnO1YWoLj+4P3CNkUtFUPbjn7ujJ7bT3z19vhIOfXQa6ouOyj4F5S
	pts1zlSsrprvgzFu4ZzLD33E89F9kZrUHTXiMlwQ6E+qcydwQaT2b4acoZD9NWWTQ4MIWeFckz5we
	3Ngl4iEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlRT-00000001Ksa-0Ynf;
	Fri, 15 Aug 2025 03:49:23 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlFq-00000001JEN-3hKx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:37:24 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-333e7517adcso23623001fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 20:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229041; x=1755833841; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXv9G7c+svq4lqcz4OBGpCl+m14S/SAGU1DXHucm83E=;
        b=Ei3EfwaOWxW7NSlsW2xXnhgiD6NVZ0wK3MRwxurLAPuFbc9DGeXnR6ciTSFSnPnYv4
         TwL56qaKMkjPtM2C1Hc2z08W61ermf2LFX25qPSMjIlETMJ0TNUj7K1wTmNni/kpjrLs
         GUGYPbAIbanKmpBJMdrSztiFYPOU8ebNAXrvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229041; x=1755833841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXv9G7c+svq4lqcz4OBGpCl+m14S/SAGU1DXHucm83E=;
        b=DlbJ3H5qxaHa+M7Zn01epAKHNmmKtxuuczIHj9zI6QzE0lWBj14RNfGvIJOEh6cQqs
         8kAPQyUjlRvPZ/fE24yusetm3V/HdONFcNS2CyhswXq3+swLh1xFoBNGLny87udkt2TH
         9l46dAuokqFU9Mf25nxNJEnrK/qN+BTXGcXrSnzEmx/eFh3XUq3jhHuhmm9H4bFf/DGn
         AiXMYWJf2h0KrnMOHRUHF29EbGi1S/10TeUPQ0vG8DNzUST+8r1E9JN27wurG41qBEog
         OsFCfy0xBSlFIkJ7yzxWTp06DRNN5bmCSeZKVWCOGXZPWDYZeCrYlPyoD864cVKZzUXv
         W9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXryF0mOG3lEXIUK2mZrMq04A/iBnuuTnSBN7sAhIiyKQxJpBGVJVNaCHBXPRaxW5ngYS0vtuR4RBaHrQUPOREm@lists.infradead.org
X-Gm-Message-State: AOJu0YwPMk1e+v8ApNEy32b2EkS7eFHXZlO3Ob4Eq05eFegIrHnwGF/S
	ny9ubOtg6OcdSa9e7PT75tMqXyItUC9xk9eth/Zc3PK7/GKcQVrc2meW78+SdfGsK3a4N/lr2DP
	Mggm0H37P1qeeDMhm5skG8PlqhtDCzaTd0DuzdMEE
X-Gm-Gg: ASbGncsz4q27+Ebj7MZmMS2a7zMDLJp6wTTO4IdrrRLaGXXqKJeE3J7jvfFZbLwzJiN
	wRUR/lJ0KjAZu4Qk9xxBN3+y+QCG0PVTBWb7EjsiT6j2kEPUVdkDtQ6F8AYw2mQsxcnWrczRynq
	lBmPXimD678ErwMx5aWIZQ7YbMp16LCsGx5QvL9FWIUMNWzt/fD/kHBwTBZLzVFeYKKZa0HRZDu
	MVqpjua6Ukyb6b0AuEp1GsBmA/rvtKOoYNOFCXOchsjcT9E
X-Google-Smtp-Source: AGHT+IE49Nkw8AqkoPWjH8rrU5caEV+oXUcux5DcWnc9n4SFkD9kc07Lncn2SXp+60xyQBp5APfIrw8/0vNtRBrb6YM=
X-Received: by 2002:a05:6512:2249:b0:55c:d730:c86f with SMTP id
 2adb3069b0e04-55cee824254mr223207e87.21.1755229041062; Thu, 14 Aug 2025
 20:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-8-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-8-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:37:10 +0900
X-Gm-Features: Ac12FXy4p8YRr4aG5a7_JIWdQm-9n2bHamyXaYwe_ClxduFqvhUqhAoMHloBxT8
Message-ID: <CAGXv+5HRKFrdjjXkwN6=OLtk=bK3C3mBnrDtmkEWeuxjz0pFKg@mail.gmail.com>
Subject: Re: [PATCH v4 07/27] clk: mediatek: clk-gate: Add ops for gates with
 HW voter
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_203722_949852_6FEBBD1C 
X-CRM114-Status: GOOD (  25.79  )
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 use a HW voter for gate enable/disable control. Voting is
> performed using set/clr regs, with a status bit used to verify the vote
> state. Add new set of gate clock operations with support for voting via
> set/clr regs.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-gate.c | 77 +++++++++++++++++++++++++++++++--
>  drivers/clk/mediatek/clk-gate.h |  3 ++
>  2 files changed, 77 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-g=
ate.c
> index 0375ccad4be3..426f3a25763d 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <linux/clk-provider.h>
> +#include <linux/dev_printk.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/printk.h>
> @@ -12,14 +13,19 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>
> +#include "clk-mtk.h"
>  #include "clk-gate.h"
>
>  struct mtk_clk_gate {
>         struct clk_hw   hw;
>         struct regmap   *regmap;
> +       struct regmap   *regmap_hwv;
>         int             set_ofs;
>         int             clr_ofs;
>         int             sta_ofs;
> +       unsigned int    hwv_set_ofs;
> +       unsigned int    hwv_clr_ofs;
> +       unsigned int    hwv_sta_ofs;
>         u8              bit;
>  };
>
> @@ -100,6 +106,28 @@ static void mtk_cg_disable_inv(struct clk_hw *hw)
>         mtk_cg_clr_bit(hw);
>  }
>
> +static int mtk_cg_hwv_set_en(struct clk_hw *hw, bool enable)
> +{
> +       struct mtk_clk_gate *cg =3D to_mtk_clk_gate(hw);
> +       u32 val;
> +
> +       regmap_write(cg->regmap_hwv, enable ? cg->hwv_set_ofs : cg->hwv_c=
lr_ofs, BIT(cg->bit));
> +
> +       return regmap_read_poll_timeout_atomic(cg->regmap_hwv, cg->hwv_st=
a_ofs, val,
> +                                              val & BIT(cg->bit),
> +                                              0, MTK_WAIT_HWV_DONE_US);
> +}
> +
> +static int mtk_cg_hwv_enable(struct clk_hw *hw)
> +{
> +       return mtk_cg_hwv_set_en(hw, true);
> +}
> +
> +static void mtk_cg_hwv_disable(struct clk_hw *hw)
> +{
> +       mtk_cg_hwv_set_en(hw, false);
> +}
> +
>  static int mtk_cg_enable_no_setclr(struct clk_hw *hw)
>  {
>         mtk_cg_clr_bit_no_setclr(hw);
> @@ -124,6 +152,15 @@ static void mtk_cg_disable_inv_no_setclr(struct clk_=
hw *hw)
>         mtk_cg_clr_bit_no_setclr(hw);
>  }
>
> +static bool mtk_cg_uses_hwv(const struct clk_ops *ops)
> +{
> +       if (ops =3D=3D &mtk_clk_gate_hwv_ops_setclr ||
> +           ops =3D=3D &mtk_clk_gate_hwv_ops_setclr_inv)
> +               return true;
> +
> +       return false;
> +}
> +
>  const struct clk_ops mtk_clk_gate_ops_setclr =3D {
>         .is_enabled     =3D mtk_cg_bit_is_cleared,
>         .enable         =3D mtk_cg_enable,
> @@ -138,6 +175,20 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv =3D=
 {
>  };
>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_inv);
>
> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr =3D {
> +       .is_enabled     =3D mtk_cg_bit_is_cleared,
> +       .enable         =3D mtk_cg_hwv_enable,
> +       .disable        =3D mtk_cg_hwv_disable,
> +};
> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr);
> +
> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv =3D {
> +       .is_enabled     =3D mtk_cg_bit_is_set,
> +       .enable         =3D mtk_cg_hwv_enable,
> +       .disable        =3D mtk_cg_hwv_disable,
> +};
> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr_inv);
> +
>  const struct clk_ops mtk_clk_gate_ops_no_setclr =3D {
>         .is_enabled     =3D mtk_cg_bit_is_cleared,
>         .enable         =3D mtk_cg_enable_no_setclr,
> @@ -153,8 +204,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv =
=3D {
>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
>
>  static struct clk_hw *mtk_clk_register_gate(struct device *dev,
> -                                               const struct mtk_gate *ga=
te,
> -                                               struct regmap *regmap)
> +                                           const struct mtk_gate *gate,
> +                                           struct regmap *regmap,
> +                                           struct regmap *regmap_hwv)
>  {
>         struct mtk_clk_gate *cg;
>         int ret;
> @@ -169,11 +221,22 @@ static struct clk_hw *mtk_clk_register_gate(struct =
device *dev,
>         init.parent_names =3D gate->parent_name ? &gate->parent_name : NU=
LL;
>         init.num_parents =3D gate->parent_name ? 1 : 0;
>         init.ops =3D gate->ops;
> +       if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
> +               dev_err(dev, "regmap not found for hardware voter clocks\=
n");
> +               return ERR_PTR(-ENXIO);

return dev_err_probe()?

I believe the same applies to the previous patch.

> +       }
>
>         cg->regmap =3D regmap;
> +       cg->regmap_hwv =3D regmap_hwv;
>         cg->set_ofs =3D gate->regs->set_ofs;
>         cg->clr_ofs =3D gate->regs->clr_ofs;
>         cg->sta_ofs =3D gate->regs->sta_ofs;
> +       if (gate->hwv_regs) {
> +               cg->hwv_set_ofs =3D gate->hwv_regs->set_ofs;
> +               cg->hwv_clr_ofs =3D gate->hwv_regs->clr_ofs;
> +               cg->hwv_sta_ofs =3D gate->hwv_regs->sta_ofs;
> +       }
> +
>         cg->bit =3D gate->shift;
>
>         cg->hw.init =3D &init;
> @@ -206,6 +269,7 @@ int mtk_clk_register_gates(struct device *dev, struct=
 device_node *node,
>         int i;
>         struct clk_hw *hw;
>         struct regmap *regmap;
> +       struct regmap *regmap_hwv;
>
>         if (!clk_data)
>                 return -ENOMEM;
> @@ -216,6 +280,13 @@ int mtk_clk_register_gates(struct device *dev, struc=
t device_node *node,
>                 return PTR_ERR(regmap);
>         }
>
> +       regmap_hwv =3D mtk_clk_get_hwv_regmap(node);
> +       if (IS_ERR(regmap_hwv)) {
> +               pr_err("Cannot find hardware voter regmap for %pOF: %pe\n=
",
> +                      node, regmap_hwv);
> +               return PTR_ERR(regmap_hwv);

return dev_err_probe();

ChenYu

> +       }
> +
>         for (i =3D 0; i < num; i++) {
>                 const struct mtk_gate *gate =3D &clks[i];
>
> @@ -225,7 +296,7 @@ int mtk_clk_register_gates(struct device *dev, struct=
 device_node *node,
>                         continue;
>                 }
>
> -               hw =3D mtk_clk_register_gate(dev, gate, regmap);
> +               hw =3D mtk_clk_register_gate(dev, gate, regmap, regmap_hw=
v);
>
>                 if (IS_ERR(hw)) {
>                         pr_err("Failed to register clk %s: %pe\n", gate->=
name,
> diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-g=
ate.h
> index 1a46b4c56fc5..4f05b9855dae 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -19,6 +19,8 @@ extern const struct clk_ops mtk_clk_gate_ops_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
> +extern const struct clk_ops mtk_clk_gate_hwv_ops_setclr;
> +extern const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv;
>
>  struct mtk_gate_regs {
>         u32 sta_ofs;
> @@ -31,6 +33,7 @@ struct mtk_gate {
>         const char *name;
>         const char *parent_name;
>         const struct mtk_gate_regs *regs;
> +       const struct mtk_gate_regs *hwv_regs;
>         int shift;
>         const struct clk_ops *ops;
>         unsigned long flags;
> --
> 2.39.5
>

