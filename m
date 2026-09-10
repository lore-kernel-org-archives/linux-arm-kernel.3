Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A993DC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQGnh1v+xWgpqyvd+v1a8KFIwYoiDSLdjcPF+i7yTr8=; b=Pxm+zPaxty8QVs
	hgXSlOb6St/yWOTwSJ9pE9WxYkzyPXSJl2Rv5UmpzuT2veP7qFY1rGan0bWg35Leupe3cCqu4MD4U
	HSMrmhaHUzvqAE/nq3Rf7yF1jQO/00/jY/EGhT/HpDtIMn2FwBRWnRlkIIgiQG1EOhOOT/vc9Rt83
	FwnAKeIhkOf5AQMUCfx1wQ3fyar4nJkZx3Zys6oJKUGs9UOCADBo9QfyLpaM13WW8uYdkuP5JRzVo
	THXBfxeaxR46s3pvvWc/rkiQLCxWZR4GfJTub3ZxzOar0xZm6louXxrXxyRIsZUQn/R0aahOXxgyY
	3PyVYoUcyske2RD2veyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gCc-0000000EhNF-34WL;
	Thu, 10 Sep 2026 14:56:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gCc-0000000EhN7-0FJX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:56:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBC6243DC2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 14:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B7E1F0089B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789052197;
	bh=VQGnh1v+xWgpqyvd+v1a8KFIwYoiDSLdjcPF+i7yTr8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=gud4YOhfwHB7qVYJ7wi7xRKAlCKWfl2s7BPemRw4LjXuk9medos1rib5UhBnJUaj9
	 349/l3qbUpl2QGdAzLQnXdJwhTUCrmEiXWRM2Jy3386dP+eeZxw1Zhr4WidR3Wmdrt
	 kMDoCNv7fw99UgB6ShRxJ06ORGDw+nshRCnHRm4Ham4hxyHcQBHA/65Z8vOGQxb/Dc
	 ASud4JoQxLAb6cs/ahPZUoH7G06KlwruWFskHDZoVmiG+DlLAlKEBQ2Q9B/FNkI+C1
	 DzA3zS0rj8UziRUmRefzoyEbQ+VpcLoUlQ2MMiwOMLDCdt6y3gEGBXXzkYmoAnvAWp
	 KWBGjTeAQhmGQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a2015bbfceso6196171fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 07:56:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzo5cEm/JxqTdJ4Xaq8mvRCNQmJUIlOkxzfWnr5MlCgef+QoZAwuitVVjaePoZE18nKWvwCP0MMK6FOTxktqQ1z@lists.infradead.org
X-Gm-Message-State: AFuF++kEJhcI9kSNXTbiesvu8s/K/Bs40cHjvlI6TYVBsz0ycojt1gGd
	6P98z290w65b6aFGbNyCSi/0eEoeMuej+I7x3rAGIc9LZyaTkSw6ke2wd6MvgM4mHpJ7wJhqmsg
	jeXfTpOv+zUqZ80Z4MO2TbNVUKDK9A5c=
X-Received: by 2002:a05:651c:a181:b0:3a3:61ec:43c8 with SMTP id
 38308e7fff4ca-3a5913b346emr6027311fa.25.1789052195781; Thu, 10 Sep 2026
 07:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260910133519.459011-1-andre.przywara@arm.com> <20260910133519.459011-3-andre.przywara@arm.com>
In-Reply-To: <20260910133519.459011-3-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 10 Sep 2026 22:56:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v64K0+Yo2spDgSLexeeq--kLRvt-94f+WSU05xWTCPCrWw@mail.gmail.com>
X-Gm-Features: AcwNN1VUd6sDMk9t5-6JvMgkw7l_YsvlayUQ2EjayllqYZtgNrEVzXFuv7UPwfE
Message-ID: <CAGb2v64K0+Yo2spDgSLexeeq--kLRvt-94f+WSU05xWTCPCrWw@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: sunxi: only use PortK special handling on A523
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Yixun Lan <dlan@gentoo.org>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
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

On Thu, Sep 10, 2026 at 9:35=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 pinctrl IP requires an exception for addressing PortK,
> since the registers for this GPIO bank did not fit anymore in the
> existing MMIO frame. Since the A523 was also the first SoC to actually
> implement PortK, we just enabled this quirk unconditionally.
> Now the new Allwinner A733 changed the MMIO frame layout, so PortK can
> and must be handled without any special code.
>
> Mark the special casing for PortK with the ELEVEN_BANKS quirk flag we
> introduced, so that it will only be used on SoCs using the A523 pinctrl
> IP.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index bc6948e3fb495..2524e0b3a2a5a 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -67,7 +67,7 @@ static u32 sunxi_bank_offset(const struct sunxi_pinctrl=
 *pctl, u32 pin)
>  {
>         u32 offset =3D 0;
>
> -       if (pin >=3D PK_BASE) {
> +       if (pin >=3D PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS=
)) {
>                 pin -=3D PK_BASE;
>                 offset =3D PIO_BANK_K_OFFSET;
>         }
> --
> 2.47.3
>

