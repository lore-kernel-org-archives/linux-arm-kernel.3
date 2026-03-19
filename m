Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FE71090254
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmVxPvQlt7qOt5Ex0vIH9Zv1skFnUoNckWStuqtEi2k=; b=YQ9F1l2jOhmrXO
	9j9HpWhjhqqdBkltw60hYhJfyrBszU203fyODIaAmbEqjDFwaWy/P55Tv3gSi11wePwZg02UtPjVc
	iFETSDmWZvQiAdgIpcxqD60KlQezXFe5m6Z2as/HaKVYUQ21aGMQar8sbl0nanOCQXfJpZJLLJ9+9
	bVX3k/PyPOP8q22mHRuZNbG6N77nKSo88vEax1X+jFJ62yxOhhwn9XvxFZWTcOEYY7nBJ1JQNpb6i
	U4cSxf9bQGZWo1GtRo0XzQA+h248bO5YJETQg2A8QIWoRm0aLmR4/lWg73KuRNsvVGkogNDMRj9XU
	NrXyZ2mwQLOZXeyu9LBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GTr-0000000B6bJ-1Q67;
	Thu, 19 Mar 2026 16:44:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GTp-0000000B6at-15LD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85472432F4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 16:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663B5C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938656;
	bh=oEWVx1OpHMMRuk87wznIK8JEX7NBHGl8RmGt9/hk5y8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=piH974Owj0mxvtd/gslxmBrKH74drAYEc3RYL2NYn5OCMcal2aUKbk7XRpEXls6CT
	 ZyelWFoDfsw4ZCzfcFRUJaFj0zjzlijyKOf7wQfsW55dAAiAe3j/9sZlM0brg1/uAW
	 rq2v6A4huul16tc+PeWvsi8oGaR0mYdW5kVs4DgRhFVIW/bAYsIG5cLCHNMoGaYNPo
	 5v6lSGsEogKy7XNz0c9p0vgKORghvChDkuS58fiP5Dy3U+FeTisBynopVnKDPkEnpm
	 0YEPSRz8GmAszz/+2bhD0O6cIzUeyFvGHH28LxV4jK8Wd8pvAJzPJceaMe+9lR3VFH
	 xyDVkJi8eq2eQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38be5d7c27cso9904861fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGBBEvSnDv8TqYebDIS0Sh91Lz02Pbqnxp8IFa7UiOmIbvzQFiai+4VmA+X/v3I79TYrPGBLh0pcR5tFVvjWLd@lists.infradead.org
X-Gm-Message-State: AOJu0YwIEz0enSuE2cAcWTQByvbSB6Xy7UcumOvPlzrTjCFq7+Aubcov
	bTS7rqo7AYT1nDwzpRVecXlrAIrnsKZJrcQ3HuVRLKDuOYQVb3fShwBAKxH9JG/4mAktt1yNMyj
	DyniNy9JuV8Ap91W6xGDEbeUS7bbu6sg=
X-Received: by 2002:a2e:a987:0:b0:386:fa6b:44e0 with SMTP id
 38308e7fff4ca-38bf966a00bmr538601fa.10.1773938654791; Thu, 19 Mar 2026
 09:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl> <20260319-rc2-boot-hang-v4-2-4372f47cb6b8@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v4-2-4372f47cb6b8@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Mar 2026 00:44:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65c7A7V05ih-GkHxs1tik892Fgt8HhT49_2xHeL91Sh_g@mail.gmail.com>
X-Gm-Features: AaiRm50--3c_EFXYH_tPkJpauDkMflt6ULJhXyCWNw5590qsCxieypOfZHxKwAQ
Message-ID: <CAGb2v65c7A7V05ih-GkHxs1tik892Fgt8HhT49_2xHeL91Sh_g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_094417_339448_D690067E 
X-CRM114-Status: GOOD (  22.84  )
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

On Fri, Mar 20, 2026 at 12:10=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in unitialized state.

        ^ uninitialized

>
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
>
> Tested on Orange Pi Zero 3.
>
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()=
")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++++++++++
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 685b79fc0bf8..321ee97f5745 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1092,13 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(st=
ruct irq_data *d)
>  {
>         struct sunxi_pinctrl *pctl =3D irq_data_get_irq_chip_data(d);
>         struct sunxi_desc_function *func;
> +       unsigned int offset;
> +       u32 reg, shift, mask;
> +       u8 muxval;
>         int ret;
> +       bool is_new_layout;
> +       bool is_reset_mux;
>
>         func =3D sunxi_pinctrl_desc_find_function_by_pin(pctl,
>                                         pctl->irq_array[d->hwirq], "irq")=
;
>         if (!func)
>                 return -EINVAL;
>
> +       offset =3D pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +       muxval =3D (readl(pctl->membase + reg) & mask) >> shift;
> +
> +       /* Change muxing to GPIO INPUT mode if at reset value */
> +       is_new_layout =3D pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT;

You would want

    !!(pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)

here to normalize it to a bool value. This is quite common in kernel code.

> +       is_reset_mux =3D (!is_new_layout && muxval =3D=3D SUN4I_FUNC_DISA=
BLED_OLD) ||
> +                      (is_new_layout && muxval =3D=3D SUN4I_FUNC_DISABLE=
D_NEW);
> +
> +       if (is_reset_mux) {
> +               sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
> +                             SUN4I_FUNC_INPUT);
> +       }

Nit: the curly braces aren't needed.

> +
>         ret =3D gpiochip_lock_as_irq(pctl->chip,
>                         pctl->irq_array[d->hwirq] - pctl->desc->pin_base)=
;

Nit: you probably want to replace this with "offset" as well.


Just minor issues, otherwise

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

>         if (ret) {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 22bffac1c3f0..0daf7600e2fb 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -86,6 +86,8 @@
>
>  #define SUN4I_FUNC_INPUT       0
>  #define SUN4I_FUNC_IRQ         6
> +#define SUN4I_FUNC_DISABLED_OLD 7
> +#define SUN4I_FUNC_DISABLED_NEW 15
>
>  #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
>  #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
>
> --
> 2.43.0
>
>

