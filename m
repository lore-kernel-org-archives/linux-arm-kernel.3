Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fs2AiFoC/uXi7Y3GxLDQdbdL/aEwooLIt1/0w5YrmTY=; b=3gRvWQbxU/Qazy
	nP4CmerWKhmQt7Mqt4IKolE57CvZKB0045YjUkKemZ/Jv0t1KCJQZnkjQirojTghKAjRJG/TdejdI
	Y/C5tx5Mf5QWqUg4qZ+4wieSlQflMY7YANqQxpmwsTckAQkMa82O+Bq2xCsl9QM54zWqsChLqt4u/
	GsHPYOkx1jjAbeJ8RA3BCRkaGEj2s99T+nrIBe5EU142o1mk7ggs4wmTzLxhQRoZrZDKuoKoi12pM
	hbKvvsOg+7jfhVemVzwktMKG0syiY9mC7OLI7sR9RH8qC01s9ykMJAvVNinyT/EQ6j+ByR/39cA9o
	WqhhMrp0M5OTZfO0EMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvga-00000008Hsr-1bN5;
	Sat, 04 Jul 2026 08:25:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvgZ-00000008Hsl-3Vlt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 08:25:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32C1E41A3F
	for <linux-arm-kernel@lists.infradead.org>; Sat,  4 Jul 2026 08:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3351F0155A
	for <linux-arm-kernel@lists.infradead.org>; Sat,  4 Jul 2026 08:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783153515;
	bh=Fs2AiFoC/uXi7Y3GxLDQdbdL/aEwooLIt1/0w5YrmTY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=AhmNjmDrvXUIm6qq1QCLqnCOerLJyDhayVscWRp+pfxFlPNRVhDN7FxAEBUNoNMvv
	 fX29jiShaD+xLYEqR7ds9oASvt4gBXubcEqIEeeSZCjmi3wT9+gWWpA4MGRGG+Uvwt
	 mvJWckTAhYPw6RWzQe0tmkPrR3mUDBDsmlKP77VOdcSvJMAX5+xPyr5ol32ly0rNVT
	 LsT22Ht/ajL5O29l+rtTZjt3uzQXj++OBIe01iL26GOWmLzFWxhaPXrvtTvlF5Dlx7
	 6inn3nzqPF18/AmMG8zg21CDbttnRU5OLYRAYvQg7oYedlXUqccE4GDPbIzz1LhTBE
	 r3Ho1aegqR+Sg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b28814916so11925131fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 01:25:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvmF6QR26Lw7SDLsdDXaio2RWaDiMdy6zFmBJP6kbQunU40V0Wj9R0HRi2NYFMIxuuBK5Nr/ZkNbUjAaCdp/q/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ANYPmU8x2AO7RyD0bZoH0KbC6KKTpdivskkul6XcXaMMTlZI
	3C9N/WZGtzcObfK9qF+Hff61njyF7CX20w7QC9ukM5QLmjsGlbtMLs+a4Apyjb4nN83Pmwl938R
	tmOGMMY4OpKVg+oiXogETWsmV2qdpjNo=
X-Received: by 2002:a2e:bcc5:0:b0:39b:35bd:e704 with SMTP id
 38308e7fff4ca-39b53c3ffd6mr4690261fa.7.1783153513431; Sat, 04 Jul 2026
 01:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com> <20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 4 Jul 2026 16:25:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
X-Gm-Features: AVVi8Cco2rDKRY4RtRBz1e78QgPbRDMEhgem8aNt-eUIdWMg4uPicNKKdtWJM8A
Message-ID: <CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 2, 2026 at 4:11=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> Add support for sunxi-ng read-only dividers. This will be
> useful to the a733 oscillator detection logic.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu_div.h |  1 +
>  drivers/clk/sunxi-ng/ccu_mux.c |  3 ++-
>  drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
>  4 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index 62d680ccb524..d1c8c7baa12d 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
>                                              req, ccu_div_determine_rate_=
helper, cd);
>  }
>
> +static int ccu_rodiv_determine_rate(struct clk_hw *hw,
> +                                   struct clk_rate_request *req)
> +{
> +       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +       unsigned long val;
> +       u32 reg;
> +       int ret;
> +
> +       reg =3D readl(cd->common.base + cd->common.reg);
> +       val =3D reg >> cd->div.shift;
> +       val &=3D (1 << cd->div.width) - 1;
> +
> +       req->rate =3D ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux=
, -1,
> +                                                 req->rate);
> +
> +       if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +               req->rate *=3D cd->fixed_post_div;
> +
> +       ret =3D divider_ro_determine_rate(hw, req, cd->div.table,
> +                                       cd->div.width, cd->div.flags, val=
);
> +
> +       if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +               req->rate /=3D cd->fixed_post_div;
> +
> +       req->rate =3D ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, =
-1,
> +                                               req->rate);
> +
> +       return ret;
> +}
> +
>  static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
>                            unsigned long parent_rate)
>  {
> @@ -143,3 +173,15 @@ const struct clk_ops ccu_div_ops =3D {
>         .set_rate       =3D ccu_div_set_rate,
>  };
>  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
> +
> +const struct clk_ops ccu_rodiv_ops =3D {
> +       .disable        =3D ccu_div_disable,
> +       .enable         =3D ccu_div_enable,
> +       .is_enabled     =3D ccu_div_is_enabled,
> +
> +       .get_parent     =3D ccu_div_get_parent,
> +
> +       .determine_rate =3D ccu_rodiv_determine_rate,
> +       .recalc_rate    =3D ccu_div_recalc_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_di=
v.h
> index be00b3277e97..a30a92780a05 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.h
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct cl=
k_hw *hw)
>  }
>
>  extern const struct clk_ops ccu_div_ops;
> +extern const struct clk_ops ccu_rodiv_ops;
>
>  #endif /* _CCU_DIV_H_ */
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index 766f27cff748..e2d6833a6d33 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_=
common *common,
>  }
>  EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
>
> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *co=
mmon,
> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>                                             struct ccu_mux_internal *cm,
>                                             int parent_index,
>                                             unsigned long parent_rate)
>  {
>         return parent_rate * ccu_mux_get_prediv(common, cm, parent_index)=
;
>  }
> +EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");

This does not need to be exported since all the base clocks build into
one module. And maybe it shouldn't as we probably don't want individual
clock drivers implementing ops.


Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

>  int ccu_mux_helper_determine_rate(struct ccu_common *common,
>                                   struct ccu_mux_internal *cm,
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mu=
x.h
> index c94a4bde5d01..272a2c36a8f2 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.h
> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
> @@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu=
_common *common,
>                                           struct ccu_mux_internal *cm,
>                                           int parent_index,
>                                           unsigned long parent_rate);
> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
> +                                           struct ccu_mux_internal *cm,
> +                                           int parent_index,
> +                                           unsigned long parent_rate);
>  int ccu_mux_helper_determine_rate(struct ccu_common *common,
>                                   struct ccu_mux_internal *cm,
>                                   struct clk_rate_request *req,
>
> --
> 2.47.3
>

