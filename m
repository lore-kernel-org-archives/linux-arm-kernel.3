Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FAAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApJyUh3UbJCU7bYezlSCZRoniO4a+n5FZCqwiX7BHiA=; b=rkdMBgPRi9tAUv
	ziswzVjV5nn14ZgKOIrgYrOzBjYJtsb/y0po/SUIW80FBCxvwH5wuu2rt832rMdjH1kmNPI21/gJJ
	AfAyiBM/eHt6aYW+/sKIs41LbwhnGPs0QgDkpezDG2z+IDpKVxWXIszPj8DTdGLMlKaM2ffAPjE0S
	0el0vjIH0plWYso76IYIynQ2++uZMJ88MX6OhTAOMcm+BjaG65ZfQ1Iv4H5zNpca/K5CcU/2smTeQ
	9J7HpoXSAASO6xKsU5ysnrziQU9a/WcEnBfPcxK//WCntEmuAIzz46JdqRkIR0xqcZP5K/zFGz0YO
	V9LDEWvDie/sz3wxZ9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWz0-0000000BuIY-3UqB;
	Wed, 22 Jul 2026 13:27:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWyz-0000000BuIR-3bdB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:27:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3893E600B0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36101F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784726852;
	bh=ApJyUh3UbJCU7bYezlSCZRoniO4a+n5FZCqwiX7BHiA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SR3ASgFWKE/KdgtrekweY39je4RT7GbVcIE/5kF2hpxGoOlzumcpO2ejJqeMtvzuf
	 eJjJmyKd2Poe5IiH1kiz0ZGmBj2H7Iue5v9q+IQLaD5oK+ELDgk3PlZZZHVAIMzTqA
	 mOdR1hTAAykYtm053CdiZDrqikP+IqBQFzEH1uMDAEJzb9kxs/d+PxFy9JkQ/AVaj3
	 jzfuCL/l03nM/ACkdl4cz0k7eZmDUYT2G46iJJzvQVw/yZpEARQhsvpAfFkzb6aw9b
	 r+8sCUt4PUCTnCFn7A2angVujWjmZ3/6cmoVdohyo183qpyXFKWTSo6E9weLJ2emvY
	 oRgmOpijin0Iw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso11133137e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:27:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOk0gpyZKwMd+vwlCNdq2hGQ/a+4SfkTU0M9DskEUj4Qip7C5cGzgOOVrjMOwCzEyT6xSy7eOuE2mLpwIatKD2@lists.infradead.org
X-Gm-Message-State: AOJu0YwagKq25Y01EBF4ppYffxVRkicwBnxcf7TTuNwCagcgYcdsgayF
	+G52AN1s3InK7jdEbpJ+VRbCpqvyyIugbkNEDmkBdfF3K01aPtEpAfe5ursPqn7+sdlJ3uOEOBy
	FhKK+CsiKWr6xLOlyN9KqCNvG9c9qkYY=
X-Received: by 2002:a05:6512:3b8f:b0:5b0:1eed:f700 with SMTP id
 2adb3069b0e04-5b28f84a354mr5404025e87.13.1784726851335; Wed, 22 Jul 2026
 06:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Jul 2026 21:27:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
X-Gm-Features: AUfX_mzpEMNkvXDj_jwLU41n9C8mnaNfF_ommIlmxQC2pGV6dZOxfrP1tBmIfHo
Message-ID: <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
To: Enzo Adriano <enzo.adriano.code@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Wed, Jul 22, 2026 at 8:56=E2=80=AFAM Enzo Adriano
<enzo.adriano.code@gmail.com> wrote:
>
> Some sunxi-ng MP clocks have an M divider but no P divider. The A523
> MBUS, IOMMU and DRAM clocks use this layout and also require the update
> bit when changing their rate.
>
> ccu_mp_set_rate() unconditionally builds and applies a mask for the P
> field. With a zero-width P field this produces an invalid GENMASK()
> range and can clear bits outside a P divider, including the clock gate.
>
> The callback also ignores CCU_FEATURE_UPDATE_BIT, so hardware that
> requires the update bit may not latch the new divider value.
>
> Only update the P field when it exists, and set CCU_SUNXI_UPDATE_BIT for
> MP clocks carrying the feature. This matches the existing sunxi-ng div,
> mux and gate helper behavior.

No. If the clock only has one divider, then it should use the single divide=
r
clk class. That one also supports CCU_FEATURE_UPDATE_BIT.

ChenYu

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel=
.org
> Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> Based on clk-next 8cdeaa50eae8 (Linux 7.2-rc2).
> Tested with strict checkpatch and an arm64 W=3D1 build of ccu_mp.o.
> No hardware runtime claim is made.
>
>  drivers/clk/sunxi-ng/ccu_mp.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
> index 7cdb0eedc69b..aa6cb20447f1 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -237,12 +237,17 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsig=
ned long rate,
>
>         reg =3D readl(cmp->common.base + cmp->common.reg);
>         reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
> -       reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> +       if (cmp->p.width)
> +               reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p=
.shift);
> +       if (cmp->common.features & CCU_FEATURE_UPDATE_BIT)
> +               reg |=3D CCU_SUNXI_UPDATE_BIT;
>         reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> -       if (shift)
> -               reg |=3D ilog2(p) << cmp->p.shift;
> -       else
> -               reg |=3D (p - cmp->p.offset) << cmp->p.shift;
> +       if (cmp->p.width) {
> +               if (shift)
> +                       reg |=3D ilog2(p) << cmp->p.shift;
> +               else
> +                       reg |=3D (p - cmp->p.offset) << cmp->p.shift;
> +       }
>
>         writel(reg, cmp->common.base + cmp->common.reg);
>
> --
> 2.53.0

