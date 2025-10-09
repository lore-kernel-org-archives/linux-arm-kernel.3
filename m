Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB00FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrEMSIgPZk1KeuuGhcj52P085Zkq+6alNWoGna9Zc/w=; b=W2K1zaFIjAbmFAphZm4XjvBN2u
	fPAvLCBcinKVOK31PzUk4ycaq8bR9DlRYvtlwhNjgDJq1waPJSc0S/9JmiWolQb0XzregyGt/k+8y
	ol8YAVlPHK4+wryI1oWsutdVMwHvKpX3gCaO5vrftYUaZkKqZMRTE083+x0nwsSgxrl3mSA/bkSVT
	sOw6p5oQqJIX/Sp2qCfuEi2sFCAprYDuZyukYLGUXIwWYhYNpFZzbFKVTn6ni7KQJB6rM3k6Ce85J
	XhXucBrYaf2mIBuyiqBhnl7hbepxYuUYl/SPJSmSv0bhb+hgiSBOr6ZJ7TUGWtY2RdyyvcNVhpMWg
	bzNxK6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kl2-00000005K6z-49Tb;
	Thu, 09 Oct 2025 07:08:12 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kky-00000005K4e-44Xk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 07:08:11 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-373a1ab2081so4869361fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759993687; x=1760598487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrEMSIgPZk1KeuuGhcj52P085Zkq+6alNWoGna9Zc/w=;
        b=U70uHxyG1UUN7UQV4JYgm7dTbCC7xi2GH42zIghgQAfS/7YY0qPBg9JWD9MRrwF2Nv
         SWu+xHPA0ktqMIvukjSg8T7JJ4OO3bzWwaKYxq+0TpmvbPH3kXMK+9r4L0wEThHDYPf1
         EE2URCNONzcRq3EUnGMWxvwLHU6zyjTdZzrfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759993687; x=1760598487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrEMSIgPZk1KeuuGhcj52P085Zkq+6alNWoGna9Zc/w=;
        b=S4upJPTHoUMsvWeSN9L5xabXCc9tYIkWrjx67xrz2BAtpadYU4gMNgwZuxiSVjV9Rt
         I0/SS/uzGJ/3H/9J0pRXixVbW7GIUH6woMjipcmJ1EqaymJTs804NSYTSASIviJPg40r
         7vURGUIipmS5ID15O6R+NEWg5S60FDsmeiurTYMwy3mRbIQyymykGtRT8+YK499LmEoe
         rmXC1eyrztA9YJXA6QsYJ1QXmtTQiae0ARfryjKk09UjUDNvKrjYtJF3DXTI90Y12Pmo
         8oqgjnhoDNLdca+uPIJ5cUAodwRRi8sRlX6gt1YGEVilGVz3V8DKeR2aJ97ZIv2tJnOJ
         tQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMWBBCOJoZ/iu+jlQZZKrkZo+JzWqNsyLsyXEcHmp3okaotqN9xbZTEJq4lgyD/fjTmk+Bbbbv98M/XSOLSj4U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3x0BgJIYCEhqg9GiPFpFDqiqPSfdKKz6hQ//JvP6uWbrqribY
	tCRFeqLspY9py2aHrWKt8Xhr0ytvZfdFlLiu1gqpa63soGDeOrOntxLbkYV+UIcvI3LfS74YYy7
	aXUB2oTfCW5AHe+AFkUJUEmWE+12b9BzhfrdyB6W4
X-Gm-Gg: ASbGnctxg0ESe7Wtb2iMQCdFjgzxeteRYVT1mMnWl0c5jrcHXLNhx1uWeOP4M+a0whO
	Uk0Hc1yMQWfB1cfG2aEazdnwhwpazcYYspCl66r0iagu5biUp9Vx/o40ghZoUJllke8a4Z1Iwnt
	GDfvmZLwZq0nHzwkwVuMg4kv3n7YwW1bxlSK27g/WJcmyvcp2xQCsZhv1pSZH09EVGBZbA2hXxV
	9APGzHyzlD7xjiF4F5IfiBBHfGwNhnx4TtmowxSz7OcUwwQOMGgr0E+PhXNeQ==
X-Google-Smtp-Source: AGHT+IHRoD8fUFYarUIhK/FMKZGr2CwU3Gj3Lvi6h5d/Em4hrbue6QlrL7H+4NXmnHM+zo7hkW3w3oPsj8Dawmy7Yjk=
X-Received: by 2002:a2e:be26:0:b0:365:6b40:8687 with SMTP id
 38308e7fff4ca-37609e0ea58mr13923031fa.22.1759993686781; Thu, 09 Oct 2025
 00:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:07:55 +0800
X-Gm-Features: AS18NWBxQ-yW1drBobxZE5-xVOr4CwQCIc293oxeKqSrQOU5dPVPYMgKJ9ACvWg
Message-ID: <CAGXv+5F_xeC_sGNB9Aev4CQbC_8Vo4YA1u7K60oKu8PseL=Qhw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_000809_070065_906304EB 
X-CRM114-Status: GOOD (  20.04  )
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

On Thu, Oct 9, 2025 at 12:07=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
>
> Add parent enables/disables where the recalc_rate op is called directly.
>
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents en=
able (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents en=
able (part 1)")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98d=
f0c0d2ad244eb90 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *c=
ore,
>         unsigned long rate =3D parent_rate;
>
>         if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> +               if (core->flags & CLK_OPS_PARENT_ENABLE)
> +                       clk_core_prepare_enable(core->parent);
> +
>                 rate =3D core->ops->recalc_rate(core->hw, parent_rate);
> +
> +               if (core->flags & CLK_OPS_PARENT_ENABLE)
> +                       clk_core_disable_unprepare(core->parent);
> +
>                 clk_pm_runtime_put(core);
>         }
>         return rate;
> @@ -4031,6 +4038,9 @@ static int __clk_core_init(struct clk_core *core)
>          */
>         clk_core_update_duty_cycle_nolock(core);
>
> +       if (core->flags & CLK_OPS_PARENT_ENABLE)
> +               clk_core_prepare_enable(core->parent);
> +
>         /*
>          * Set clk's rate.  The preferred method is to use .recalc_rate. =
 For
>          * simple clocks and lazy developers the default fallback is to u=
se the
> @@ -4046,6 +4056,9 @@ static int __clk_core_init(struct clk_core *core)
>                 rate =3D 0;
>         core->rate =3D core->req_rate =3D rate;
>
> +       if (core->flags & CLK_OPS_PARENT_ENABLE)
> +               clk_core_disable_unprepare(core->parent);
> +
>         /*
>          * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
>          * don't get accidentally disabled when walking the orphan tree a=
nd
>
> --
> 2.51.0
>
>

