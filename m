Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E2DC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llye9i9aXgouGRcz8NFjZ/wbpgSywkSkAscOcHmbV4s=; b=3FLOHr3OyVMEeb
	LGho6ummlD+QtPzyurA1lC86d5LJgESN2+6i0KWMWsYleKYz6Ch2GSahjNq1yf0V1ePSZipgVMEdR
	mfadxd2oao74H2gCE7nCaTvMqvFgq10d0xnUV8uXw9+OanvLqQ2dhMlb3Xhm+wmjxkAXZHTrM4Iqh
	PycfszamKx29xoJP50aGMcSUWAYhsLh64KIK0XumLT0JJmxjdlveMID/gJtKz+rYXCnSz8cseYU1i
	YueWjRkd1NjXLrbvCsoJV+HMDDJKVLV7OYUAkUgfIkSm3ecgAPS+SeD977h65/B8jD0dYnSPAwA4z
	i8zMjD4axVMxjFhwCFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7PdQ-0000000DPta-13hD;
	Fri, 18 Sep 2026 03:51:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7PdO-0000000DPtU-45Dd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6743B403CA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384AF1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789703494;
	bh=llye9i9aXgouGRcz8NFjZ/wbpgSywkSkAscOcHmbV4s=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=E6oHwiAavZrq0lVaYiw+R7Om1iuRyBJXr60WqVvKcwLqyXQB59AGjyh7SPrh6tefJ
	 lsSJS7dOT3mOaDd5l4XDlKar5Uv7Z71gasebq36ZHOzMDXja2Ww7UkZeovk3O1yUpT
	 ppsR34/DYE/TLCIKCi1eHcQje7rOVCtf2xmUIRBS+IGkLa9baLKLHGMDGdqaNphGgx
	 m7ZfpOjlDkCe8wA1wxZ3JHnG+ZC1Ek+FexhD8jKFz2fAqlpRKilEA0kNqOngdTmTAZ
	 N2bl9980dwEx1KKtMDhXy16IbKooPv5RcKptngoMVDmV64Li6NPaAWOloALjdToDci
	 xUkbj5BxDBuVA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a36de66c0dso3132381fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxg8FCULAoynJs7mfzSPJ/9FMsPoM0frWGzts+VYQYHFkRi1Ix1+VPb3XUWI0bJjrKJOk98TcsadJ5+Ll1SKuul@lists.infradead.org
X-Gm-Message-State: AFuF++nlW2b0j7aHe2R68/yhx30MJvFGw8OZ6r2CUZff2bCKuB+YcFOk
	53cIi7hhqmBOV72UOVi7ttWJ/l7nc/Cboq7ZI0S8VQ8OsmOUrJnG1lQri5XOe349qYL2pDd6Bmo
	hnJi13jsQX9kvCDfIlBSfn0uA5pxHfac=
X-Received: by 2002:a2e:a99d:0:b0:3a3:7682:499e with SMTP id
 38308e7fff4ca-3a5fc0a7d91mr1738471fa.19.1789703492590; Thu, 17 Sep 2026
 20:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260917223913.1855301-1-andre.przywara@arm.com> <20260917223913.1855301-3-andre.przywara@arm.com>
In-Reply-To: <20260917223913.1855301-3-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 18 Sep 2026 11:51:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v67XsgfoYrJ6gJ_kshjnbSOOrJt9fK6RE1ErsTuHuVji5w@mail.gmail.com>
X-Gm-Features: AcwNN1V8Mf2lfwWc7xgI8OxjluEZlzfKO7oVmRLjPeBHxGQzIMFTeAetat816ec
Message-ID: <CAGb2v67XsgfoYrJ6gJ_kshjnbSOOrJt9fK6RE1ErsTuHuVji5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: sunxi-ng: mp: support clocks with just a
 shift register
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On Fri, Sep 18, 2026 at 6:39=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The "mp" clock models a mod clock with divider and a shift field. At
> least one clock in the Allwinner A523 features just a power-of-2 divider
> field, so support an initialisation of the clock without providing an
> actual divider field.

Please just use the single divider clock type instead. It properly supports
power-of-2 dividers.

ChenYu

> Add a check whether the "width" field is 0, and skip the divider
> handling in this case, as the GENMASK macro will not work with a zero
> length.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
> index 7cdb0eedc69b5..3896cb94bf733 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsign=
ed long rate,
>         spin_lock_irqsave(cmp->common.lock, flags);
>
>         reg =3D readl(cmp->common.base + cmp->common.reg);
> -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
> +       if (cmp->m.width)
> +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m=
.shift);
>         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> +       if (cmp->m.width)
> +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
>         if (shift)
>                 reg |=3D ilog2(p) << cmp->p.shift;
>         else
> --
> 2.43.0
>

