Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41794CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2B6yxoun5grNXYDPaHbatpr3XqvAdqs6leClJ2sd5R8=; b=diSWTZRratYRXVQ1n1HbmHoLtr
	rE/Re1zUvHnSdC8dKqUcX5oGoVeoCkU6po2BD9lRqzBzn+GnR26Zr7XT+3Jt4PMLCLbk6dAcEXK4L
	j2ZMrWP1JfTIYofwzYRTwWiWyg3WC+I5SdjcMzU+upDDQX2rU8/3WwZeit3Z07zS3p1MwFEXBua/C
	qRMgOv46p8qX+YTRrCer2o7c3JZCXXHGyjbw8b/jbyxRZClLm5HeVLUx7n0zzXOAA+jWYW0zTrqLF
	JdVN72L8HjTHMzn8pMsNkVx9DUAmYF6oUKENd28Qs0r/gyU7+TRumw2WOJVUEVHPtaUNC8NAO3pG5
	fGy438fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzwE-00000009NnN-3VT4;
	Sun, 11 Oct 2026 20:14:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzwE-00000009NnE-0dz7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 20:14:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 894F543C69
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 20:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1581F0089B
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 20:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791749669;
	bh=2B6yxoun5grNXYDPaHbatpr3XqvAdqs6leClJ2sd5R8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iHptSIYnEoXY75N5KOzg4E/xkRfjBaZIkYloNhEOKhQbrhZTB3u69gX372ImDPVVS
	 Dm+InQ/5B9Nya4ueKj0KzFOwsMZk70RXneY/mpGcJ6AWHhgGx8hnMVli9xwNyQ6g0+
	 0MZIIDTj1E+a8qGy2Suu/StXxvqCy52wB+Fx0r+Zktp3ifU2OAnqX+j9PDLcy+yLZa
	 AbPSNM+89qrc4PwzdJEykbdom9hzduReaWJg5LUrVt8s3ArsQXd0Cl51g4jzMgUavZ
	 a0Qbfiwv9XbC8CSwAa1O/iNpZs2YmWbdnPTTFMx3twMa0bdU8QpUcEw6xN6kdN2CA2
	 6p2m8SXEcdyyQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb3726952so875734e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 13:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByss0aNVf3P2zKXL/zhblvb6BZb+aUuj+vpPul9fT7tbRVWiiEm1wj3GAijBuloZxILSZ+XNpKzgZi1H7HGGVJF@lists.infradead.org
X-Gm-Message-State: AFq9FYIsuBx4kf6l99QlvwLqXZUB2jCkaf8kKpbM58DP50be1hDaJatP
	S+/uzs67HrWwmNYHH9bgKD4oS+h9IpI8OGzR4sGD/LVc0cbR0LkzShRHs5PbUwo3qTYoPQvmDT3
	EbH7qC9TeFtoxo14kGcfeiRwsiaEdY+I=
X-Received: by 2002:a05:6512:1155:b0:5bb:7beb:20c2 with SMTP id
 2adb3069b0e04-5bcde8d90d7mr2470503e87.67.1791749668067; Sun, 11 Oct 2026
 13:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261010175721.76213-1-adilov@disroot.org>
In-Reply-To: <20261010175721.76213-1-adilov@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Oct 2026 22:14:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLnTOc+n2PGpK1NDnNJXwgzTQ8shO_6NqNuADzxY8SyYsA@mail.gmail.com>
X-Gm-Features: AclHuK-Ke9siXQxkd32F58VdGeapNv-uCnv-gmOvNgN2Tl6ULJ5GCCFCFZi_kuk
Message-ID: <CAD++jLnTOc+n2PGpK1NDnNJXwgzTQ8shO_6NqNuADzxY8SyYsA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: single: add big endian support
To: Rustam Adilov <adilov@disroot.org>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Oct 10, 2026 at 7:57=E2=80=AFPM Rustam Adilov <adilov@disroot.org> =
wrote:

> Add support for big endian pin controllers by taking into account
> a big-endian device tree property.
>
> This is needed on big endian MIPS platforms like RTL930X, RTL931X
> and RTL9607C who use pinctrl-single, because when SWAP_IO_SPACE is
> enabled, the mmio accessors in pinctrl-single perform a byte swap.
>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>

I'm not so sure about expanding the usage of pinctrl-single, we have
said that this is used in the cases when you want to stash all the
hardware data into the device tree (such as which groups and functions
that exist) and it seems mostly done to save memory for the kernel
so you don't need to compile in that data for all systems.

The argument that this is "simple" if you just have some hardware
data in a file is moot these days IMO, because you can now just
give that data to an LLM and it will spit out any group and function
definitions you want.

So I'd like to hear some of the reasoning about why you want to
do this thing, we have other drivers doing this but without using
pinctrl-single.

One of the driver maintainers have to ACK it too.

> +static unsigned int pcs_readw_be(void __iomem *reg)
> +{
> +       return ioread16be(reg);
> +}
> +
> +static unsigned int pcs_readl_be(void __iomem *reg)
> +{
> +       return ioread32be(reg);
> +}
> +
> +static void pcs_writew_be(unsigned int val, void __iomem *reg)
> +{
> +       iowrite16be(val, reg);
> +}
> +
> +static void pcs_writel_be(unsigned int val, void __iomem *reg)
> +{
> +       iowrite32be(val, reg);
> +}

Why this indirection? Can't you just assign the standard
accessors directly?

>         case 16:
> -               pcs->read =3D pcs_readw;
> -               pcs->write =3D pcs_writew;
> +               if (byte_be) {
> +                       pcs->read =3D pcs_readw_be;
> +                       pcs->write =3D pcs_writew_be;
> +               } else {
> +                       pcs->read =3D pcs_readw;
> +                       pcs->write =3D pcs_writew;

Maybe they should all do that actually, can't we rewrite
this so we just:

if (byte_be) {
  pcs->read =3D ioread16be;
  pcs->write =3D iowrite16be;
} else {
  pcs->read =3D ioread16;
  pcs->write =3D iowrite16;

I don't see how the wrappers help and I hope the compiler
just optimize them away anyway.

Yours,
Linus Walleij

