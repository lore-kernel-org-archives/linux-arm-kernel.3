Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CEECA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAVZJpgvllT4Mhe7ltBfIHVEtwo4VMq7SD8mCyRK+bY=; b=1AW2T45Rsv+BGfXLSab72mLXDZ
	4QXREwxCHDda3Oz8EYUMQ8/0tDaQeO7KP+zGtHrOilGMgGi2yVR1FffVczkP0iKCxBE6sXURxsxJI
	jxgDMMtrt/TK/koQGN4Hbi+hTrgc5H1EJqmggDSdgo3nWmjmJKBLFBNTDV+Wu72DQ8sCCTsEM7sA/
	Bhc26AVklFrGxtkODHia0IujoTw8bnGgqzKDjxW+IeFzrglwj12v4sw0vIwSYrp/9ujvWAqhU72L9
	vy9x1aWCjEigVhDFOIQ/HXDLVt9437Ln9JpJYT8dccpdLP6WGrrY52txaL4DmwdgBimmE0SZ2D2Q2
	USlUjndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYe-00000008kDe-1qt6;
	Mon, 25 Aug 2025 17:00:36 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYXH-00000008JeU-41P9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 14:51:06 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55f48d61ea2so865461e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133461; x=1756738261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAVZJpgvllT4Mhe7ltBfIHVEtwo4VMq7SD8mCyRK+bY=;
        b=eaB8mlJl4YAbBhNf5KksFIjU/NG2bzvu57XJ0D2QHrTI+VLZkEVCFzSyoBPudTw90q
         TPgImQLVzQy3JSGWbsViwjjicmoEvLQi7cFpgkixhgZC1yV2QFYf2VmzTxnyH9Z6RmbC
         59vAL1fcZzaCPb+a2dYcZd5yLrR0f9yr3B55c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133461; x=1756738261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAVZJpgvllT4Mhe7ltBfIHVEtwo4VMq7SD8mCyRK+bY=;
        b=lXkwDkecaE+1ZwcuFqpJSaYEeZ6iuHU6wsrBlREJffhtwafsR/T50aPolqe6X2Rhiq
         tKJ8a5XFPPFHpatH7K1Hdr7xxw/8T9RvcR04ULXeX5DfJlnPDRZgUq/2bLMGhi/6ATrF
         9UmWWe/LIJrCiVpShLZcsgCy6t/beDoiMoue9GZrmdnLj51SUIePdNjWkqS23cqFEm2m
         Uk8R4o4Ua1oVYDfgTrP7gaEAU3CjlYV2kV2fjdC9aRhB/HVrcBQlxhWl3xd9m1/u1prU
         w/LWxjAfvHqEk4vOP8eZMDzT+zyiBXSra6sf+F6qJSgiVFeBLw3hsy9yYXok01XwhqmJ
         nqmw==
X-Forwarded-Encrypted: i=1; AJvYcCUbczkQLgWR04KumxhIfjkeMrHpaqBFi4gl8u1cR/HgU9rmGOPcYcGtvmTmtNLQ+aTNRXq+mKE/fFV7EVjGCNrF@lists.infradead.org
X-Gm-Message-State: AOJu0YzrJqIg5KVvx7t6Wv0adiUjEcscUM67ifKSEn4P180JhVnlqbFG
	LXyRfJ5sJEOb2hXFv0qiBg65wWoTVux98fsNNVNH9gBo8KrW6CSM3mbH71fXbtx8QuqQ51eNBkr
	Xp+i/X91ugM9o1kEmVZbraMUPfUHeH31SiKnRffL3
X-Gm-Gg: ASbGnctMx+YhLmWs/wjRWWGEKUxJF9sFnJC9qXTmCBLCP/NVL8kQ72rKj9rlswb4cmU
	BD85NfhL8tpSwUYEThhMcozXi1sHBpLJuqggTKPSx0aGU7SSsnndP6rzkVfXoAPZ7yK+v+pIY0Z
	PnI2KlP6I9SDT+TgY1aMl2sjVE3e4hXX936zuHSuJLc3BpyO3pVkp9PiFeGc5Hs2HuhRjNpRXxV
	p6X/+4smA==
X-Google-Smtp-Source: AGHT+IEe7w9pVPejypkcEJDKdxceIu7p/7dzKMCCMCcrZIlfu17d7XkyMHIibXiLNiCq+NAGnq/H6nnnbCqYo6xbSyU=
X-Received: by 2002:a05:6512:230c:b0:55f:496e:99b1 with SMTP id
 2adb3069b0e04-55f496ea2e6mr746059e87.31.1756133461346; Mon, 25 Aug 2025
 07:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HRKFrdjjXkwN6=OLtk=bK3C3mBnrDtmkEWeuxjz0pFKg@mail.gmail.com>
 <20250825125141.209860-1-laura.nao@collabora.com>
In-Reply-To: <20250825125141.209860-1-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Aug 2025 16:50:50 +0200
X-Gm-Features: Ac12FXymdIbpYgVvUuTRHx1l6uFl8EsOrYD9IbMYYkm6u39sg-0GTOO7AjUR4wY
Message-ID: <CAGXv+5HQrMY+osCZKVOq28fQi-Be-eZ=_-=5HcrkacivHekOTQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/27] clk: mediatek: clk-gate: Add ops for gates with
 HW voter
To: Laura Nao <laura.nao@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, guangjie.song@mediatek.com, kernel@collabora.com, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	mturquette@baylibre.com, netdev@vger.kernel.org, nfraprado@collabora.com, 
	p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org, 
	sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_075103_993203_F975F893 
X-CRM114-Status: GOOD (  23.95  )
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

On Mon, Aug 25, 2025 at 2:52=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On 8/15/25 05:37, Chen-Yu Tsai wrote:
> > On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.=
com> wrote:
> >>
> >> MT8196 use a HW voter for gate enable/disable control. Voting is
> >> performed using set/clr regs, with a status bit used to verify the vot=
e
> >> state. Add new set of gate clock operations with support for voting vi=
a
> >> set/clr regs.
> >>
> >> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
> >> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> >> ---
> >>  drivers/clk/mediatek/clk-gate.c | 77 +++++++++++++++++++++++++++++++-=
-
> >>  drivers/clk/mediatek/clk-gate.h |  3 ++
> >>  2 files changed, 77 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/cl=
k-gate.c
> >> index 0375ccad4be3..426f3a25763d 100644
> >> --- a/drivers/clk/mediatek/clk-gate.c
> >> +++ b/drivers/clk/mediatek/clk-gate.c
> >> @@ -5,6 +5,7 @@
> >>   */
> >>
> >>  #include <linux/clk-provider.h>
> >> +#include <linux/dev_printk.h>
> >>  #include <linux/mfd/syscon.h>
> >>  #include <linux/module.h>
> >>  #include <linux/printk.h>
> >> @@ -12,14 +13,19 @@
> >>  #include <linux/slab.h>
> >>  #include <linux/types.h>
> >>
> >> +#include "clk-mtk.h"
> >>  #include "clk-gate.h"
> >>
> >>  struct mtk_clk_gate {
> >>         struct clk_hw   hw;
> >>         struct regmap   *regmap;
> >> +       struct regmap   *regmap_hwv;
> >>         int             set_ofs;
> >>         int             clr_ofs;
> >>         int             sta_ofs;
> >> +       unsigned int    hwv_set_ofs;
> >> +       unsigned int    hwv_clr_ofs;
> >> +       unsigned int    hwv_sta_ofs;
> >>         u8              bit;
> >>  };
> >>
> >> @@ -100,6 +106,28 @@ static void mtk_cg_disable_inv(struct clk_hw *hw)
> >>         mtk_cg_clr_bit(hw);
> >>  }
> >>
> >> +static int mtk_cg_hwv_set_en(struct clk_hw *hw, bool enable)
> >> +{
> >> +       struct mtk_clk_gate *cg =3D to_mtk_clk_gate(hw);
> >> +       u32 val;
> >> +
> >> +       regmap_write(cg->regmap_hwv, enable ? cg->hwv_set_ofs : cg->hw=
v_clr_ofs, BIT(cg->bit));
> >> +
> >> +       return regmap_read_poll_timeout_atomic(cg->regmap_hwv, cg->hwv=
_sta_ofs, val,
> >> +                                              val & BIT(cg->bit),
> >> +                                              0, MTK_WAIT_HWV_DONE_US=
);
> >> +}
> >> +
> >> +static int mtk_cg_hwv_enable(struct clk_hw *hw)
> >> +{
> >> +       return mtk_cg_hwv_set_en(hw, true);
> >> +}
> >> +
> >> +static void mtk_cg_hwv_disable(struct clk_hw *hw)
> >> +{
> >> +       mtk_cg_hwv_set_en(hw, false);
> >> +}
> >> +
> >>  static int mtk_cg_enable_no_setclr(struct clk_hw *hw)
> >>  {
> >>         mtk_cg_clr_bit_no_setclr(hw);
> >> @@ -124,6 +152,15 @@ static void mtk_cg_disable_inv_no_setclr(struct c=
lk_hw *hw)
> >>         mtk_cg_clr_bit_no_setclr(hw);
> >>  }
> >>
> >> +static bool mtk_cg_uses_hwv(const struct clk_ops *ops)
> >> +{
> >> +       if (ops =3D=3D &mtk_clk_gate_hwv_ops_setclr ||
> >> +           ops =3D=3D &mtk_clk_gate_hwv_ops_setclr_inv)
> >> +               return true;
> >> +
> >> +       return false;
> >> +}
> >> +
> >>  const struct clk_ops mtk_clk_gate_ops_setclr =3D {
> >>         .is_enabled     =3D mtk_cg_bit_is_cleared,
> >>         .enable         =3D mtk_cg_enable,
> >> @@ -138,6 +175,20 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv =
=3D {
> >>  };
> >>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_inv);
> >>
> >> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr =3D {
> >> +       .is_enabled     =3D mtk_cg_bit_is_cleared,
> >> +       .enable         =3D mtk_cg_hwv_enable,
> >> +       .disable        =3D mtk_cg_hwv_disable,
> >> +};
> >> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr);
> >> +
> >> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv =3D {
> >> +       .is_enabled     =3D mtk_cg_bit_is_set,
> >> +       .enable         =3D mtk_cg_hwv_enable,
> >> +       .disable        =3D mtk_cg_hwv_disable,
> >> +};
> >> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr_inv);
> >> +
> >>  const struct clk_ops mtk_clk_gate_ops_no_setclr =3D {
> >>         .is_enabled     =3D mtk_cg_bit_is_cleared,
> >>         .enable         =3D mtk_cg_enable_no_setclr,
> >> @@ -153,8 +204,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_in=
v =3D {
> >>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
> >>
> >>  static struct clk_hw *mtk_clk_register_gate(struct device *dev,
> >> -                                               const struct mtk_gate =
*gate,
> >> -                                               struct regmap *regmap)
> >> +                                           const struct mtk_gate *gat=
e,
> >> +                                           struct regmap *regmap,
> >> +                                           struct regmap *regmap_hwv)
> >>  {
> >>         struct mtk_clk_gate *cg;
> >>         int ret;
> >> @@ -169,11 +221,22 @@ static struct clk_hw *mtk_clk_register_gate(stru=
ct device *dev,
> >>         init.parent_names =3D gate->parent_name ? &gate->parent_name :=
 NULL;
> >>         init.num_parents =3D gate->parent_name ? 1 : 0;
> >>         init.ops =3D gate->ops;
> >> +       if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
> >> +               dev_err(dev, "regmap not found for hardware voter cloc=
ks\n");
> >> +               return ERR_PTR(-ENXIO);
> >
> > return dev_err_probe()?
> >
> > I believe the same applies to the previous patch.
> >
>
> mtk_clk_register_gate and mtk_clk_register_mux actually both return a
> struct clk_hw *.

Oops, you're right. If that case I believe dev_err_ptr_probe() could be
used?

ChenYu

