Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C01DC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GL5QMlueg+RBLunCViI0gP82K0VD9Crkblqj+RkN+xc=; b=AiXfw9zHJY5RF7
	+L47mxq5/KEl2ILV4NeTgxS2mE3QUR7xAocFuUQz1toi5ANKJxEPs1dsdUYfoplcfqMIFqqj5kx6i
	9CKd1HjjzITFXG3OuDDczZPSBKf0ao50Lnqny90d/Uxl+M7JFAenxQm+fhExPeX5E7AoM2FAC6L9U
	l7rMI/49zqJft+SZGYKRx7CLx793U+3MkuDauir5xVVio9t11KzF+4IvKTg46AqTVcgjcEcM2cyB2
	7w2eQCjSAdthvXBYIboskcwww/d0oF6mhWP/KLN77GzaulI0neyp3ZWZwECcJrGolqsNXc3iM1ucU
	J8CEk3pmnNhzQCpaf2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ3Y-0000000CD6x-0g3h;
	Wed, 22 Jul 2026 15:40:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ3W-0000000CD6T-2ytc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:40:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14400600E1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 15:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0EE1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734821;
	bh=GL5QMlueg+RBLunCViI0gP82K0VD9Crkblqj+RkN+xc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=fhosqB+KhhiTdsQfGQkeDjyUtd5YE3/L+IrGPc0MkVZDYXMgo09Gkkm9p7JjHNVHe
	 lbsJKvxh3kr4qpZxNmBcH3EorfMJ2SWOf+pDJth6e/ZVfCpQVjuH5ZNbIlNB8LolX+
	 9zA9yG2WBC/JEaPr1kjKbV6WkCo9bEOQB1QBttkr+43Ljavy4PD70JV+Gu7N55fk5y
	 61fqos+KW0D8uCmDPzmTRxnl+zKtT6wbeHKXsQz7LJD7JJ9MZ9WppXtA/qYx8hLmQy
	 qoqbi9DoiSgAGezwy27LAcRTjDQfx69W0BVTwbqfgMSkVDkrjy6WSxzw9mdA1a3HAb
	 xY5PGis/7yc3w==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so9755168e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:40:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqmBodtQp3EsMHfP4z4EOur6bdNr68xVUCQXhpfNYfhwthdfSW9VubrKssm04pTzG17UTC5It1JEaC2S1QNWTMH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ORlH8yw2aNClc3BWQGQ71JsVY9cTsR2c4E4dEkL2jZNTFwVj
	YVVFCPfmW6Mv7Hi/7URxzs/RMHXuSYQtdJq7eAb4+UlvT5c4LtSV3gqx5wVvIXs+So/5jcl5EkY
	DM64AFY4IjOsCWqPRz8g5lbZEXH/zWQA=
X-Received: by 2002:a05:6512:2212:b0:5ae:b6b6:c86c with SMTP id
 2adb3069b0e04-5b28fad669dmr5721907e87.63.1784734820147; Wed, 22 Jul 2026
 08:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com> <20260722-a733-rtc-v6-2-631cca28cc9a@baylibre.com>
In-Reply-To: <20260722-a733-rtc-v6-2-631cca28cc9a@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Jul 2026 23:40:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64HjXygw76zaNi9KaG-zfc+hZoeyp4EHyz68fcdK-AXNw@mail.gmail.com>
X-Gm-Features: AUfX_mzq6njx4TtR0siTbEAlTZtN0hsrmD9OVcdXfDqLxwDI3Q-I_SIq3FthBu8
Message-ID: <CAGb2v64HjXygw76zaNi9KaG-zfc+hZoeyp4EHyz68fcdK-AXNw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] clk: sunxi-ng: div: add read-only operation support
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

On Wed, Jul 22, 2026 at 10:48=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> Add support for sunxi-ng read-only dividers. This will be
> useful to the a733 oscillator detection logic.
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
>  drivers/clk/sunxi-ng/ccu_div.h |  1 +

>  drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
>  drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++

Left over stuff?


>  4 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index 62d680ccb524..c385e0160f13 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_mu=
x_internal *mux,
>         if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>                 req->rate *=3D cd->fixed_post_div;
>
> -       ret =3D divider_determine_rate(&cd->common.hw, req, cd->div.table=
,
> -                                    cd->div.width, cd->div.flags);
> +       if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
> +               unsigned long val;
> +               u32 reg;
> +
> +               reg =3D readl(cd->common.base + cd->common.reg);
> +               val =3D reg >> cd->div.shift;
> +               val &=3D (1 << cd->div.width) - 1;
> +
> +               ret =3D divider_ro_determine_rate(&cd->common.hw, req, cd=
->div.table,
> +                                               cd->div.width, cd->div.fl=
ags, val);
> +
> +       } else {
> +               ret =3D divider_determine_rate(&cd->common.hw, req, cd->d=
iv.table,
> +                                            cd->div.width, cd->div.flags=
);
> +       }
> +
>         if (ret)
>                 return ret;
>
> @@ -143,3 +157,16 @@ const struct clk_ops ccu_div_ops =3D {
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
> +       .set_parent     =3D ccu_div_set_parent,
> +
> +       .determine_rate =3D ccu_div_determine_rate,
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
> index 4503c9780c39..12bfc99c9172 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -67,7 +67,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_co=
mmon *common,
>         return parent_rate / ccu_mux_get_prediv(common, cm, parent_index)=
;
>  }
>
> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *co=
mmon,
> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>                                             struct ccu_mux_internal *cm,
>                                             int parent_index,
>                                             unsigned long parent_rate)
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

