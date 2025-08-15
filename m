Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B74CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/gqheUAiJBZVnBDKCO9AHvkTlNKIjI8xnUPe2UrTYE=; b=xQMxrnQelY1Vci3vaJJCSi6nKH
	NYf39OHNUJwDz6d7zjh1v+95RioBjN1FiywjEOUH/MJ67kUBvYqRIj0r5PIDcxBRDFEIOmhNg02tw
	qdf8P1q+yJ4Iu0Q0Y7BB6YOlXG+dwEnHMNgDdDd9ofcFBAyDricx08oYtOgfUGdQx1gI5WFOL5dN2
	2B4hNA78Jx8g02//qvUUUbYmnaLMD8O1ELrdmDcIgVsOIAsuQQHh4NW+dbIqeEo3e7m4vWsz2Tp4F
	k0Dl4EuPVa5xTatY8oXs85bLFHmWZ6y9zREupkHYnL4q/BEp90ayOc2nLELC6NsbGU/r71OAw14Us
	EctkjcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlEO-00000001J6h-49vL;
	Fri, 15 Aug 2025 03:35:52 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkxX-00000001HRz-0m3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:18:29 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-333f8f02afaso13697481fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 20:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755227905; x=1755832705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/gqheUAiJBZVnBDKCO9AHvkTlNKIjI8xnUPe2UrTYE=;
        b=B1sqJqHKtulF1ax54lJkb44VblCuEfWfhCA5QZky7JJsSqePSabQ5Ov7eVsbp2xC1/
         h1foCedbZp0JO05GWrbfPwwYMiQAIdVKKzrK398PpK0eguZyx7oH9d0O32SEYejoCDz7
         9aex6dgxV7GwjuQDy6LL95P2FB2RYfgOO3UUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755227905; x=1755832705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/gqheUAiJBZVnBDKCO9AHvkTlNKIjI8xnUPe2UrTYE=;
        b=tE1rpKbObSvLTw7d4+v3nCWKkezOmzxmFQfisDjOu7qpGW3cfOW1eqYoFyPyZw6PpG
         giuyjdArQmj1w64Y2eanaqisvJOlGPhe4v73YjJdlllgYHkjPugnUkvGX1odcBi8lcZO
         rOH57pvlHDdQeTtgPLXil/VdFWbtN07Jo16hjcvucznY2xouGJfsnMF6QreQcVm3bikF
         T75GQQPqquM68aNDOOvox9Oe/S/VSxVPHVRoqFymVtxYV9lJPz3c7XJ8dOrJmV8KLHhF
         B/Bki++moEOs4/oGiSvSaovnp53D8JM5qMnHeKWY2jYJRGBauCR8ihLa8ylyOgxnxqGP
         FexQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvL2sRD7Gpur5HmFLiM5bje/WDDtmMA4jZoVYanodLL4/m2wvur3ZijwrG8ilx4g1vAe/S3hVfKaIO4zVbwbG6@lists.infradead.org
X-Gm-Message-State: AOJu0YxqAFaIYxHikHbPFHYqKaN/HbLCo2MYRuIPFXNQsk3ydLlMEjHI
	3I/JHdIqPD7TndFmkrI+JrFHHi3vzDwuJv9zi0690G9LJwWnXYjc/VsizpdHzcit/NbDxoIVCKB
	WY8C+wOV9EFQzk7v96ZZaFXSC+HSJ5g4bnqOXtjfa
X-Gm-Gg: ASbGncuPR+hIuYHBd3ywjPSCb6Mp8X6l+rnQ98sAyYEBN3p72nnyfdumpIjypaDf9Yn
	TAkLuohF4Mx+t/pJUMFlz3acymkpfdr6OeaUDSx17rIkYbrfEa82ecEduE2KgL16V07MTPyTkaa
	n5LcU1ExzYVdy/T8VpwA3JjhxQ5hO+1lFBLFVur7G2i9WeG7k+4pq7HGZClXbINtwBK5v17JGUK
	11y1rzteKko4zEdRbc1eORW5n4ROHnFptVhcQ==
X-Google-Smtp-Source: AGHT+IH45CMxbyHBWhXJ/RabdXbIvSLoKeM5EMqrf7xlLady27fRhPu6U8KzyNXc6RGLGWgakK4Y6MekAcD2c3hLvVo=
X-Received: by 2002:a2e:b8c5:0:b0:332:6304:3076 with SMTP id
 38308e7fff4ca-33409809835mr1950611fa.1.1755227905389; Thu, 14 Aug 2025
 20:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-3-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-3-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:18:14 +0900
X-Gm-Features: Ac12FXwqbJqR6dXDCHoREy9cuJVuDHi_sxjr2uRku7Hw7ujClZ2WhTJ_l5duokI
Message-ID: <CAGXv+5Fnaict=9Agixn1vCrP3GkugaR3qEKmEYyYiXCGx8ZZ6w@mail.gmail.com>
Subject: Re: [PATCH v4 02/27] clk: mediatek: clk-pll: Add ops for PLLs using
 set/clr regs and FENC
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
X-CRM114-CacheID: sfid-20250814_201827_432162_8E1C6FC1 
X-CRM114-Status: GOOD (  26.20  )
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
> MT8196 uses a combination of set/clr registers to control the PLL
> enable state, along with a FENC bit to check the preparation status.
> Add new set of PLL clock operations with support for set/clr enable and
> FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 42 +++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/clk-pll.h |  5 ++++
>  2 files changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> index 49ca25dd5418..8f46de77f42d 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -37,6 +37,13 @@ int mtk_pll_is_prepared(struct clk_hw *hw)
>         return (readl(pll->en_addr) & BIT(pll->data->pll_en_bit)) !=3D 0;
>  }
>
> +static int mtk_pll_fenc_is_prepared(struct clk_hw *hw)
> +{
> +       struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +
> +       return readl(pll->fenc_addr) & pll->fenc_mask;

Nits:

I'd do a double-negate (!!) just to indicate that we only care about
true or false.

Also, why do we need to store fenc_mask instead of just shifting the bit
here? Same goes for the register address. |pll| has the base address.
Why do we need to pre-calculate it?

The code is OK; it just seems a bit wasteful on memory.

Either way, this is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +}
> +
>  static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 =
fin,
>                 u32 pcw, int postdiv)
>  {
> @@ -274,6 +281,25 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>         writel(r, pll->pwr_addr);
>  }
>
> +static int mtk_pll_prepare_setclr(struct clk_hw *hw)
> +{
> +       struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +
> +       writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
> +
> +       /* Wait 20us after enable for the PLL to stabilize */
> +       udelay(20);
> +
> +       return 0;
> +}
> +
> +static void mtk_pll_unprepare_setclr(struct clk_hw *hw)
> +{
> +       struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +
> +       writel(BIT(pll->data->pll_en_bit), pll->en_clr_addr);
> +}
> +
>  const struct clk_ops mtk_pll_ops =3D {
>         .is_prepared    =3D mtk_pll_is_prepared,
>         .prepare        =3D mtk_pll_prepare,
> @@ -283,6 +309,16 @@ const struct clk_ops mtk_pll_ops =3D {
>         .set_rate       =3D mtk_pll_set_rate,
>  };
>
> +const struct clk_ops mtk_pll_fenc_clr_set_ops =3D {
> +       .is_prepared    =3D mtk_pll_fenc_is_prepared,
> +       .prepare        =3D mtk_pll_prepare_setclr,
> +       .unprepare      =3D mtk_pll_unprepare_setclr,
> +       .recalc_rate    =3D mtk_pll_recalc_rate,
> +       .round_rate     =3D mtk_pll_round_rate,
> +       .set_rate       =3D mtk_pll_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(mtk_pll_fenc_clr_set_ops);
> +
>  struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
>                                         const struct mtk_pll_data *data,
>                                         void __iomem *base,
> @@ -315,6 +351,9 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_cl=
k_pll *pll,
>         pll->hw.init =3D &init;
>         pll->data =3D data;
>
> +       pll->fenc_addr =3D base + data->fenc_sta_ofs;
> +       pll->fenc_mask =3D BIT(data->fenc_sta_bit);
> +
>         init.name =3D data->name;
>         init.flags =3D (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
>         init.ops =3D pll_ops;
> @@ -337,12 +376,13 @@ struct clk_hw *mtk_clk_register_pll(const struct mt=
k_pll_data *data,
>  {
>         struct mtk_clk_pll *pll;
>         struct clk_hw *hw;
> +       const struct clk_ops *pll_ops =3D data->ops ? data->ops : &mtk_pl=
l_ops;
>
>         pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
>         if (!pll)
>                 return ERR_PTR(-ENOMEM);
>
> -       hw =3D mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
> +       hw =3D mtk_clk_register_pll_ops(pll, data, base, pll_ops);
>         if (IS_ERR(hw))
>                 kfree(pll);
>
> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pl=
l.h
> index c4d06bb11516..7fdc5267a2b5 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -29,6 +29,7 @@ struct mtk_pll_data {
>         u32 reg;
>         u32 pwr_reg;
>         u32 en_mask;
> +       u32 fenc_sta_ofs;
>         u32 pd_reg;
>         u32 tuner_reg;
>         u32 tuner_en_reg;
> @@ -51,6 +52,7 @@ struct mtk_pll_data {
>         u32 en_clr_reg;
>         u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
>         u8 pcw_chg_bit;
> +       u8 fenc_sta_bit;
>  };
>
>  /*
> @@ -72,6 +74,8 @@ struct mtk_clk_pll {
>         void __iomem    *en_addr;
>         void __iomem    *en_set_addr;
>         void __iomem    *en_clr_addr;
> +       void __iomem    *fenc_addr;
> +       u32             fenc_mask;
>         const struct mtk_pll_data *data;
>  };
>
> @@ -82,6 +86,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data =
*plls, int num_plls,
>                              struct clk_hw_onecell_data *clk_data);
>
>  extern const struct clk_ops mtk_pll_ops;
> +extern const struct clk_ops mtk_pll_fenc_clr_set_ops;
>
>  static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
>  {
> --
> 2.39.5
>

