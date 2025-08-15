Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5B2CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkOnmECKdIXpe7kvGy3HCvL3tY+gG4hSspl5RFat98s=; b=aTyzQmElzpka45ffGgA38pdz7r
	WbLNjdNt7VWmY5Ghy5RgAcBu33fu4BD/cBjbgGw5va241Gf9jJAyDRg1Z7Y4lNhQQOZ9ikigj/GjO
	oAP/TLKsabgocfPwYLh6/jZzwuY/oOzDQ61W6hWGy4U5oex5L2dSA/0z7taOMnCbls5Lrj310v7YR
	34Xv/qZY1GJkoASqHJKKjrvD88c0b9rqR6ynTl7cEvjHBwx7TlTFjiwz/4TOX+NBqChQ6ZnZn8rqu
	fFcjxGNs3s/PTHVtWJ7NDIlq1pvSwvH1+6aXoLSFedskvxeJvB8GVVkLm4RXdpFjc+3DV/4SOxP1a
	D8//ACSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlOq-00000001KSY-3C0R;
	Fri, 15 Aug 2025 03:46:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlAc-00000001IoS-2zDT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:32:00 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55ce528a0f5so1632044e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 20:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755228717; x=1755833517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkOnmECKdIXpe7kvGy3HCvL3tY+gG4hSspl5RFat98s=;
        b=e//3u5AHOsP8PqrAgMzAFqYBADMY0+YPxzsZj8m+ijbUo6ViL5SiAid0WpKo5cYgoI
         z9kImlAxLdtYK02+cnGWBiCKhWFS95QU+EVO+qhBo+69ehRJxCZ4RGUCHs9sCCysLn86
         2J290OI5CZFT7JE1B+vL9BoaT/qbWLEeSmxSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755228717; x=1755833517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkOnmECKdIXpe7kvGy3HCvL3tY+gG4hSspl5RFat98s=;
        b=QWeszkj6Gj6obD6Mp8RTsvS5MJOG0S2BMVpHvTaZWzdIaSrBlVoNgC4YWkmJJfKhj9
         nKzflDa+JYy1hdz0leEqAGLV9QcHyTovFeBzQTZmm30pHaSPAq7lLHuZ7QQUy+vQ+GI8
         EyNN58THqErgRXhqM/ugJqP/lPkgrV5taYk6vT0Z6/qn0D9yJexSAxTXuN9O2HltbWgR
         3tsnI6Prb9mSYqHk+sG2sjXZug97lwFc08GALb4ZJKqEe4QZBZFiNMkghBueO88nGs8O
         3p1GhDl1v53t6U7/8hBa3rTfaqpvyDUpkZu1DosJl5KCArOXHSEjDcsYy/FGl9/0do9x
         1pJA==
X-Forwarded-Encrypted: i=1; AJvYcCUFGzwehAFdApnSAZUtcFevII702E1LfVsgyGbgeFJbpP7zC9sRRMm+rFmqSLyf2NIz1XhpwUzp1OnWckNZMHZY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3CLotQdAFzyQC3dw/AejdP/PsfGYyyPXIQ6YBS2LBaApzBRJo
	OdE5AqHVfX+l6TOnYJa8ZDEsSENfBMcvJ9qJ9ynZKUpScXWnwJeyrORb2jTb7bG/Bk7HdXTmWQQ
	mUzuqcssZ9n2tmhXkbbANqWu+e0HLPwLKtJTbmAMv
X-Gm-Gg: ASbGncvPbv7nZtuO20vEDEv4gfx7PFmwyspViEl6gxD7QC0vbreMJKtWEYwWXvd2mMg
	8TxhtltwH6rClgLCSuBdSqNfcRZd+iAI+BTnjetnZy6r0MJ8jM/ARrjItFrdKpztwStSt+ychis
	ifX92RCHY71PLNtI4LTP2JppuGXyddS5U42n2nBIKOYjg1p0XBzq+FyIASHjhXwAabz0hx8tq9m
	63kljSf8G20VZw7ub5tdSuXmxE4KrLLEV871g==
X-Google-Smtp-Source: AGHT+IFEkG7F2FPmykcTuHH9WIPtHmDR2L1zneT15//w/ex0g7ZbcY2+Wlc/9dIFVrAYjTi990SfzORTybrEMHJhZPA=
X-Received: by 2002:a05:6512:23a7:b0:55b:8328:d2b6 with SMTP id
 2adb3069b0e04-55ceeb7ba6amr145952e87.37.1755228717004; Thu, 14 Aug 2025
 20:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-6-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-6-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:31:46 +0900
X-Gm-Features: Ac12FXxT1q0ZEW1iDMIpjFwzWEmvHvJf-jGJRFBsvaXUJtX0wZXUQd-7lspgBCI
Message-ID: <CAGXv+5GyKoTb3iQTuQPWEc5Ewa+kr4dJUET8sAFRZ7T5RyNzLQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/27] clk: mediatek: clk-mux: Add ops for mux gates
 with HW voter and FENC
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
X-CRM114-CacheID: sfid-20250814_203158_813851_BE785A14 
X-CRM114-Status: GOOD (  26.84  )
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
> MT8196 use a HW voter for mux gate enable/disable control, along with a
> FENC status bit to check the status. Voting is performed using
> set/clr/upd registers, with a status bit used to verify the vote state.
> Add new set of mux gate clock operations with support for voting via
> set/clr/upd regs and FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mtk.h |  1 +
>  drivers/clk/mediatek/clk-mux.c | 71 +++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/clk-mux.h | 42 ++++++++++++++++++++
>  3 files changed, 113 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index 8ed2c9208b1f..e2cefd9bc5b8 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -20,6 +20,7 @@
>
>  #define MHZ (1000 * 1000)
>
> +#define MTK_WAIT_HWV_DONE_US   30
>  #define MTK_WAIT_FENC_DONE_US  30
>
>  struct platform_device;
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mu=
x.c
> index b1b8eeb0b501..65889fc6a3e5 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/compiler_types.h>
>  #include <linux/container_of.h>
> +#include <linux/dev_printk.h>
>  #include <linux/err.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> @@ -21,6 +22,7 @@
>  struct mtk_clk_mux {
>         struct clk_hw hw;
>         struct regmap *regmap;
> +       struct regmap *regmap_hwv;
>         const struct mtk_mux *data;
>         spinlock_t *lock;
>         bool reparent;
> @@ -118,6 +120,41 @@ static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
>         return (val & BIT(mux->data->gate_shift)) =3D=3D 0;
>  }
>
> +static int mtk_clk_mux_hwv_fenc_enable(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       u32 val;
> +       int ret;
> +
> +       regmap_write(mux->regmap_hwv, mux->data->hwv_set_ofs,
> +                    BIT(mux->data->gate_shift));
> +
> +       ret =3D regmap_read_poll_timeout_atomic(mux->regmap_hwv, mux->dat=
a->hwv_sta_ofs,
> +                                             val, val & BIT(mux->data->g=
ate_shift), 0,
> +                                             MTK_WAIT_HWV_DONE_US);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_read_poll_timeout_atomic(mux->regmap, mux->data->f=
enc_sta_mon_ofs,
> +                                             val, val & BIT(mux->data->f=
enc_shift), 1,
> +                                             MTK_WAIT_FENC_DONE_US);
> +
> +       return ret;
> +}
> +
> +static void mtk_clk_mux_hwv_disable(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       u32 val;
> +
> +       regmap_write(mux->regmap_hwv, mux->data->hwv_clr_ofs,
> +                    BIT(mux->data->gate_shift));
> +
> +       regmap_read_poll_timeout_atomic(mux->regmap_hwv, mux->data->hwv_s=
ta_ofs,
> +                                       val, (val & BIT(mux->data->gate_s=
hift)),
> +                                       0, MTK_WAIT_HWV_DONE_US);
> +}
> +
>  static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
>  {
>         struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> @@ -189,6 +226,14 @@ static int mtk_clk_mux_determine_rate(struct clk_hw =
*hw,
>         return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
>  }
>
> +static bool mtk_clk_mux_uses_hwv(const struct clk_ops *ops)
> +{
> +       if (ops =3D=3D &mtk_mux_gate_hwv_fenc_clr_set_upd_ops)
> +               return true;
> +
> +       return false;
> +}
> +
>  const struct clk_ops mtk_mux_clr_set_upd_ops =3D {
>         .get_parent =3D mtk_clk_mux_get_parent,
>         .set_parent =3D mtk_clk_mux_set_parent_setclr_lock,
> @@ -216,9 +261,20 @@ const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_o=
ps =3D {
>  };
>  EXPORT_SYMBOL_GPL(mtk_mux_gate_fenc_clr_set_upd_ops);
>
> +const struct clk_ops mtk_mux_gate_hwv_fenc_clr_set_upd_ops =3D {
> +       .enable =3D mtk_clk_mux_hwv_fenc_enable,
> +       .disable =3D mtk_clk_mux_hwv_disable,
> +       .is_enabled =3D mtk_clk_mux_fenc_is_enabled,
> +       .get_parent =3D mtk_clk_mux_get_parent,
> +       .set_parent =3D mtk_clk_mux_set_parent_setclr_lock,
> +       .determine_rate =3D mtk_clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_GPL(mtk_mux_gate_hwv_fenc_clr_set_upd_ops);
> +
>  static struct clk_hw *mtk_clk_register_mux(struct device *dev,
>                                            const struct mtk_mux *mux,
>                                            struct regmap *regmap,
> +                                          struct regmap *regmap_hwv,
>                                            spinlock_t *lock)
>  {
>         struct mtk_clk_mux *clk_mux;
> @@ -234,8 +290,13 @@ static struct clk_hw *mtk_clk_register_mux(struct de=
vice *dev,
>         init.parent_names =3D mux->parent_names;
>         init.num_parents =3D mux->num_parents;
>         init.ops =3D mux->ops;
> +       if (mtk_clk_mux_uses_hwv(init.ops) && !regmap_hwv) {
> +               dev_err(dev, "regmap not found for hardware voter clocks\=
n");
> +               return ERR_PTR(-ENXIO);
> +       }
>
>         clk_mux->regmap =3D regmap;
> +       clk_mux->regmap_hwv =3D regmap_hwv;
>         clk_mux->data =3D mux;
>         clk_mux->lock =3D lock;
>         clk_mux->hw.init =3D &init;
> @@ -268,6 +329,7 @@ int mtk_clk_register_muxes(struct device *dev,
>                            struct clk_hw_onecell_data *clk_data)
>  {
>         struct regmap *regmap;
> +       struct regmap *regmap_hwv;
>         struct clk_hw *hw;
>         int i;
>
> @@ -277,6 +339,13 @@ int mtk_clk_register_muxes(struct device *dev,
>                 return PTR_ERR(regmap);
>         }
>
> +       regmap_hwv =3D mtk_clk_get_hwv_regmap(node);
> +       if (IS_ERR(regmap_hwv)) {
> +               pr_err("Cannot find hardware voter regmap for %pOF: %pe\n=
",
> +                      node, regmap_hwv);
> +               return PTR_ERR(regmap_hwv);

Is there a reason why we aren't using dev_err() or even dev_err_probe()
here?

The rest looks OK.

ChenYu

> +       }
> +
>         for (i =3D 0; i < num; i++) {
>                 const struct mtk_mux *mux =3D &muxes[i];
>
> @@ -286,7 +355,7 @@ int mtk_clk_register_muxes(struct device *dev,
>                         continue;
>                 }
>
> -               hw =3D mtk_clk_register_mux(dev, mux, regmap, lock);
> +               hw =3D mtk_clk_register_mux(dev, mux, regmap, regmap_hwv,=
 lock);
>
>                 if (IS_ERR(hw)) {
>                         pr_err("Failed to register clk %s: %pe\n", mux->n=
ame,
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mu=
x.h
> index c65cfb7f8fc3..fb6f7951379c 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -28,6 +28,10 @@ struct mtk_mux {
>         u32 set_ofs;
>         u32 clr_ofs;
>         u32 upd_ofs;
> +
> +       u32 hwv_set_ofs;
> +       u32 hwv_clr_ofs;
> +       u32 hwv_sta_ofs;
>         u32 fenc_sta_mon_ofs;
>
>         u8 mux_shift;
> @@ -80,6 +84,7 @@ struct mtk_mux {
>  extern const struct clk_ops mtk_mux_clr_set_upd_ops;
>  extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
>  extern const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_ops;
> +extern const struct clk_ops mtk_mux_gate_hwv_fenc_clr_set_upd_ops;
>
>  #define MUX_GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,     \
>                         _mux_set_ofs, _mux_clr_ofs, _shift, _width,     \
> @@ -121,6 +126,43 @@ extern const struct clk_ops mtk_mux_gate_fenc_clr_se=
t_upd_ops;
>                         0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,         \
>                         mtk_mux_clr_set_upd_ops)
>
> +#define MUX_GATE_HWV_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,       =
               \
> +                               _mux_ofs, _mux_set_ofs, _mux_clr_ofs,    =
               \
> +                               _hwv_sta_ofs, _hwv_set_ofs, _hwv_clr_ofs,=
               \
> +                               _shift, _width, _gate, _upd_ofs, _upd,   =
               \
> +                               _fenc_sta_mon_ofs, _fenc, _flags) {      =
               \
> +                       .id =3D _id,                                     =
                 \
> +                       .name =3D _name,                                 =
                 \
> +                       .mux_ofs =3D _mux_ofs,                           =
                 \
> +                       .set_ofs =3D _mux_set_ofs,                       =
                 \
> +                       .clr_ofs =3D _mux_clr_ofs,                       =
                 \
> +                       .hwv_sta_ofs =3D _hwv_sta_ofs,                   =
                 \
> +                       .hwv_set_ofs =3D _hwv_set_ofs,                   =
                 \
> +                       .hwv_clr_ofs =3D _hwv_clr_ofs,                   =
                 \
> +                       .upd_ofs =3D _upd_ofs,                           =
                 \
> +                       .fenc_sta_mon_ofs =3D _fenc_sta_mon_ofs,         =
                 \
> +                       .mux_shift =3D _shift,                           =
                 \
> +                       .mux_width =3D _width,                           =
                 \
> +                       .gate_shift =3D _gate,                           =
                 \
> +                       .upd_shift =3D _upd,                             =
                 \
> +                       .fenc_shift =3D _fenc,                           =
                 \
> +                       .parent_names =3D _parents,                      =
                 \
> +                       .num_parents =3D ARRAY_SIZE(_parents),           =
                 \
> +                       .flags =3D  _flags,                              =
                 \
> +                       .ops =3D &mtk_mux_gate_hwv_fenc_clr_set_upd_ops, =
                 \
> +               }
> +
> +#define MUX_GATE_HWV_FENC_CLR_SET_UPD(_id, _name, _parents,             =
               \
> +                               _mux_ofs, _mux_set_ofs, _mux_clr_ofs,    =
               \
> +                               _hwv_sta_ofs, _hwv_set_ofs, _hwv_clr_ofs,=
               \
> +                               _shift, _width, _gate, _upd_ofs, _upd,   =
               \
> +                               _fenc_sta_mon_ofs, _fenc)                =
               \
> +                       MUX_GATE_HWV_FENC_CLR_SET_UPD_FLAGS(_id, _name, _=
parents,       \
> +                               _mux_ofs, _mux_set_ofs, _mux_clr_ofs,    =
               \
> +                               _hwv_sta_ofs, _hwv_set_ofs, _hwv_clr_ofs,=
               \
> +                               _shift, _width, _gate, _upd_ofs, _upd,   =
               \
> +                               _fenc_sta_mon_ofs, _fenc, 0)
> +
>  #define MUX_GATE_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,  =
       \
>                         _num_parents, _mux_ofs, _mux_set_ofs, _mux_clr_of=
s,     \
>                         _shift, _width, _gate, _upd_ofs, _upd,           =
       \
> --
> 2.39.5
>

