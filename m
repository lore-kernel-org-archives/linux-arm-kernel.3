Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEF9CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 04:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B01bmRXAH2QxWeqvPvWQshPIhSklJV5XtS7pyRMi7sU=; b=b++tBtH+c/DFV4QdGo4mvdWKbO
	9tmPqme7N9ofwEEYpD4HR06K4x3uP4VLK4V5IJEcCAs6/fod5NfDWxFwoL+LPeXm8fgcXTxItvSnN
	E+Kgpf0+qoym7oBaABu9phO//IfEd5WacAvKSTt93UrlulRnswlbPpwb4clyh/bEjLbFqOYd0SbSL
	7HpJMQDB2OUkaQrrUiWs4JDTHNHgfqsdvh0JvsvIfQuE0jYfVH/NT7AX4iqLw837abBPZV07JtUGN
	L9lYywfJF5LDfOJRvEhnrttTjo//mGSFX/qWRVDogNNr7Q2lzfvHzm6McWe5Tkeee8cA26sU7vLpF
	6cfRytGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNuC-0000000GgcV-1eUT;
	Fri, 05 Sep 2025 04:18:32 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNnt-0000000Geyr-1YVx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 04:12:03 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-336b908cbaaso14811681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 21:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045519; x=1757650319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B01bmRXAH2QxWeqvPvWQshPIhSklJV5XtS7pyRMi7sU=;
        b=H2zIyIaCSxdWZcvPA7gqBdEpv4EDMNN+LenIL9vimhhuynRcImaChq5uJ7DkXPNDO4
         Q+9TDDhy2wyOV7e5i1FZQLz91c93DDvanapXiIgdEzzHmj0hIu4YJ7Qqq47u8RfD7SXC
         HOFaIQAKegxzwFw7FJdYjfkU7RoEEcdg8kaow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045519; x=1757650319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B01bmRXAH2QxWeqvPvWQshPIhSklJV5XtS7pyRMi7sU=;
        b=NI7h43WlKDEX7a8iK9Dse0o5DfBifZj1LRWzZmyywfEQtrr+R96Z/0cMicS1e3k0Z1
         /RLsZlyVwi2PqKHtRMHOmV9Zp2Y4l9kTgFFVRZjxVQTYtOywTrvBCIwINxhp7s9ZXBrj
         aPoIzGssDzAjTj4ivFjGziIE6+MgyGbe7ycsEjIzqdmHfL0A6wL913QCDg4IBSt/grlk
         udgybj8U+j8SEABREY1AIQGwt4oY8IlYgpcN+/6y+Jufq/7yVadVkmaOD/vgH8AvVnVp
         ofi32QItMwKZfaQZJEuDrwB8CJ7ClinBuu5671iTgnTcv6a+tUZ0Lmp9YJfUyqcR0vDJ
         Hf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg2OxcBJCubzSKYpDnC0haea9ddc6zs+AhCYxJC43s+aZWWfwZ/lCH/mFd3s4R8VDrFvywD13t/ZwrxwGpIx0v@lists.infradead.org
X-Gm-Message-State: AOJu0YwdPvxbU4aykRpg8rS65dgOTN6lVFcRnSm1yksUrvAaUFVpbVbo
	4v3wlj9JhSPOFtp3IGO5oPYylebXAMIXaVBBGbluZqfBxhu7UJwaj4J6UUvaHcgUQ2vZz+UDQtW
	CCd7lVh4CqfQHOSiojwJLun3ODnAmOhR1AiVVZLxZ
X-Gm-Gg: ASbGncu0Qb7OKX1PmvmfF/WbJqesmhQ6Qitooefo5oQQDC2n9Qb5cpE26RXrV1YilUe
	IZCBBAmtztGSKN6iMJ4tNOFXrZivkAGBFtlSFwMMJjyNaK2TqykXGS1z18EnxeEb46z43wEiMTR
	udgE6Co06Juz/ljKZIfTnwa676ytZgagCxwbdegF6eqmZf698VnDEX1LUZOlfQKEnyptaoIa9Q1
	kshF/G4acA9jnth6J9u37CZotbKdHFeLV4bfQ==
X-Google-Smtp-Source: AGHT+IHYbfT4YDZymjaehpt2dXCn45+LCQHpybmvo8P6U3yHsdZLz6BM1N5npkfa7ulF9V213ctJPW+ye/twek7OL9E=
X-Received: by 2002:a2e:b88e:0:b0:336:831d:9e00 with SMTP id
 38308e7fff4ca-336caafcd05mr54910501fa.25.1757045519418; Thu, 04 Sep 2025
 21:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-6-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-6-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:11:48 +0800
X-Gm-Features: Ac12FXxJqW2o_w5uvmk3WVayIoiyKNEplrPyOCeaEvIjyu6tO3A5A0cEjAtjJqA
Message-ID: <CAGXv+5HaKD_2oUnYkRX+AswFre__ZKah27=+c-RH_W_J5Gio3A@mail.gmail.com>
Subject: Re: [PATCH v5 05/27] clk: mediatek: clk-mux: Add ops for mux gates
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
X-CRM114-CacheID: sfid-20250904_211201_412527_F748CF6C 
X-CRM114-Status: GOOD (  22.89  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
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
>  drivers/clk/mediatek/clk-mtk.h |  2 +
>  drivers/clk/mediatek/clk-mux.c | 73 +++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/clk-mux.h | 42 +++++++++++++++++++
>  3 files changed, 116 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index 11962fac43ea..c381d6a6d908 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -20,6 +20,8 @@
>
>  #define MHZ (1000 * 1000)
>
> +#define MTK_WAIT_HWV_DONE_US   30
> +
>  struct platform_device;
>
>  /*
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mu=
x.c
> index 3931d157b262..2c2679e158e7 100644
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
> @@ -15,6 +16,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>
> +#include "clk-mtk.h"
>  #include "clk-mux.h"
>
>  #define MTK_WAIT_FENC_DONE_US  30
> @@ -22,6 +24,7 @@
>  struct mtk_clk_mux {
>         struct clk_hw hw;
>         struct regmap *regmap;
> +       struct regmap *regmap_hwv;
>         const struct mtk_mux *data;
>         spinlock_t *lock;
>         bool reparent;
> @@ -119,6 +122,41 @@ static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
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
> @@ -190,6 +228,14 @@ static int mtk_clk_mux_determine_rate(struct clk_hw =
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
> @@ -217,9 +263,20 @@ const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_o=
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
> @@ -235,8 +292,14 @@ static struct clk_hw *mtk_clk_register_mux(struct de=
vice *dev,
>         init.parent_names =3D mux->parent_names;
>         init.num_parents =3D mux->num_parents;
>         init.ops =3D mux->ops;
> +       if (mtk_clk_mux_uses_hwv(init.ops) && !regmap_hwv) {
> +               return dev_err_ptr_probe(
> +                       dev, -ENXIO,
> +                       "regmap not found for hardware voter clocks\n");
> +       }

Nit: The braces aren't really needed. But no need to respin just for this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

