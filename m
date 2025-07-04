Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25F7C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9shy4WABjMXApP03CgNPKXgv/nf2wQ3YGULRdAM/EE=; b=jNuyt06o01QDFPOlVFIWTuvwmS
	n3lKg1aUC18gxa7vjqx3f2rng9leUdcCaNT9lIcMjGOtct8b0ofsRD5x4m4cFD55iTCG6YuQveDTh
	ZW3QAHpI6+kXcnZy+slRYLeGbcas523E0iMf+21vU3heY+0AEjfTHkRdoNyGYbW8HBVXwUHqP6c7o
	8YV7xRdHoeh5a2bFwiK+HFc2cbJEut08BWWD3958iEX8+JrTOo1iaVKeyUwVMgNaK7EH5khtGsilp
	q84AnEJYwz8cZPAtvLCKdQVZ5GOnhDCP03leCsV8ulHRWda/k8m37nweGdv4crAAJ8mNOZxL1iZyh
	iozPNDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiuQ-0000000EuEF-0HMq;
	Fri, 04 Jul 2025 16:05:06 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiki-0000000Et3V-2z5g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751644499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cdeygm4lRsrhT0J7mAzrQZsYAWPAovjxuALljDuK/7lWBABchyzXX/2qx+MkA8iPWWxRbq3TjLKiKCZQGGAVN4iwOgtjtYDF++UbporfluQbBytBqFp1L3L2QazuqoxB8LoPZsADrtynUIsyqaCsSaoRctloMrJiPptzlRLOLWY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751644499; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y9shy4WABjMXApP03CgNPKXgv/nf2wQ3YGULRdAM/EE=; 
	b=F3i2rZPeDCiu+XbCS6U9D16xSAA/y4R8tEzJESWRI5+htDWmZJWjEpbGcjHuvA+ZlBCiJVuldRJ0gcnXCHN2oe28eibZcwGqOBm9rlgWQe9d4z9dERKa96p30+yQJkzUwTq6oiKgvta6mXd3vbWBiR/4SQZOetCdyl6aRkOXrGE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751644499;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=y9shy4WABjMXApP03CgNPKXgv/nf2wQ3YGULRdAM/EE=;
	b=Zt5tu1Djn9hVKTEtlodlT6YUFACQSNWam8KJRf2/fWGO/g5Rvzy0w6pRSuML46No
	PNiGQatgAoLulpnxC96K4qPQm0aKgCFKbBWyUZMdXl+nz/rmGY0UDqMePXl24IDUtn+
	mBXNIB2FcAVPzgmjXUjz0XbZUTPjutwvaD9Kk73l77P6iseCbEpS85/Uvp7qhWq8+Sq
	x31HsLmnZ6Muj6VGiX1NkOivfAYEiEOE2cx27Gyg64MocBs7o9R00zjnIy7Mf0+y3/t
	OwaFzGKk++T9s/rszaoaRfJ3LddGQZE9dZw8e1mNBE3aNdolCFLf+z/gDe/WYSYcmmT
	sfkIZu4ATg==
Received: by mx.zohomail.com with SMTPS id 1751644497723754.7368487298465;
	Fri, 4 Jul 2025 08:54:57 -0700 (PDT)
Message-ID: <4cd84b9e2227c9225d977107eb05b9c3813b8846.camel@icenowy.me>
Subject: Re: [PATCH 1/2] clk: sunxi-ng: v3s: Fix de clock definition
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Icenowy
 Zheng <icenowy@aosc.xyz>, Maxime Ripard <mripard@kernel.org>
Date: Fri, 04 Jul 2025 23:54:50 +0800
In-Reply-To: <20250704154008.3463257-1-paulk@sys-base.io>
References: <20250704154008.3463257-1-paulk@sys-base.io>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085504_819236_CCCD54D8 
X-CRM114-Status: GOOD (  13.85  )
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

=E5=9C=A8 2025-07-04=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 17:40 +0200=EF=BC=
=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> The de clock is marked with CLK_SET_RATE_PARENT, which is really not
> necessary (as confirmed from experimentation) and significantly
> restricts flexibility for other clocks using the same parent.

With it not setting parent, is arbitary pixel clocks still possible?

>=20
> In addition the source selection (parent) field is marked as using
> 2 bits, when it the documentation reports that it uses 3.
>=20
> Fix both issues in the de clock definition.
>=20
> Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> index 52e4369664c5..df345a620d8d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> @@ -347,8 +347,7 @@ static
> SUNXI_CCU_GATE(dram_ohci_clk,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0"dram-ohci",=C2=A0=C2=A0=C2=A0=C2=A0"dram",
> =C2=A0
> =C2=A0static const char * const de_parents[] =3D { "pll-video", "pll-
> periph0" };
> =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 2, BIT(31),
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 3, BIT(31), 0);
> =C2=A0
> =C2=A0static const char * const tcon_parents[] =3D { "pll-video", "pll-
> periph0" };
> =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,


