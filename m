Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D5ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+uMFd00/VwF8oeUIUOAUFn81GsHq1DT13skkBivkHM=; b=0MTlL5IDW0PJhKITjOnFn2UC9L
	SeTpbCFXA4B2ouSOPxRJQVcPbr3oH7Q2oEKIRe1dicIBXlXtGObguilcRYcgFxkVgkDxazxTw9M8f
	ru4a3YegTqz9ADIE/13YWSFZt4UTD9nHm7ZqMw5+/fNADSAxL8fmcP4sfN5Ynw7SHgHemqC3AAR/W
	X5RaEdvXG0StjMXM3s5k071plvWJEwKIvUdcJSKA4sj6ATSgT8NQMeMjx2IPM9XXuf7EUciTXKPJX
	8EB+4v541DuYyPcRc+8672HpELbDdUFnWrjG/z18HU7cOdbYLJ0aQWudpn5xWsPaLc4WbZEsGpeME
	FU78P6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JSq-00000009Hzq-2gtD;
	Fri, 10 Oct 2025 20:11:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JSo-00000009HzP-20tK;
	Fri, 10 Oct 2025 20:11:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760127089; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EI2xlznajdS4gA6yfY0iLVHeGnucED1Wgn8TpST2u3yDoShxRMMoH9VJrSrDBe9w5NfMH0oaNi/V83fAP/O8QYOYEaMTMWeEOQeY1GIuZ05CZ4kjbTw8KjArHrccF1ZJiv0gxo6oqoeoIoHGoSRPJ/j+RSpvrWIxxrQoH+dahYw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760127089; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x+uMFd00/VwF8oeUIUOAUFn81GsHq1DT13skkBivkHM=; 
	b=O11ybemPA8l7ORp/8KtHX+NNOtDS5DuujWGHIXNtJceJfWCgvv/KAFBwJXuJGUgWuLJwRKsm+hah6bwntkdSLJmultv2PNAa8pwlll6rPNu8vK2lUHNCjPcBGioYy0TQJTnq9pUIGMr6Dxo6U4Btq6Ze8Jwy34CgOJ/2LCmI7IM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760127089;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=x+uMFd00/VwF8oeUIUOAUFn81GsHq1DT13skkBivkHM=;
	b=H2YgkM+1i+b6xb991wApukruxQ+W9Guu9g3V2wDUCgHg2vZJyIxEIi4nw7y8IqY/
	Q+Y5IzE+dHXMgvpxYooxEHn+Qf39+j0yoi+9/e6gN/C+IY7awMPMWkqn08sdLchNxw6
	sjsrStUMJ9fNJx227Ad3PEIxA5z0V2FXh6hSAXyU=
Received: by mx.zohomail.com with SMTPS id 176012708724740.640376685993374;
	Fri, 10 Oct 2025 13:11:27 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
Date: Fri, 10 Oct 2025 22:11:20 +0200
Message-ID: <6009277.31r3eYUQgx@workhorse>
In-Reply-To: <CAGXv+5FTg3VXpbav5c2Gx2vRgaC=jYURRp0b5tQGw+ScACRSew@mail.gmail.com>
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
 <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
 <CAGXv+5FTg3VXpbav5c2Gx2vRgaC=jYURRp0b5tQGw+ScACRSew@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_131142_580644_C4140CE8 
X-CRM114-Status: GOOD (  26.74  )
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

On Thursday, 9 October 2025 10:18:42 Central European Summer Time Chen-Yu T=
sai wrote:
> On Thu, Oct 9, 2025 at 4:09=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 08/10/25 18:05, Nicolas Frattaroli ha scritto:
> > > As it stands, mtk_clk_register_plls takes a struct device_node pointer
> > > as its first argument. This is a tragic happenstance, as it's trivial=
 to
> > > get the device_node from a struct device, but the opposite not so muc=
h.
> > > The struct device is a much more useful thing to have passed down.
> > >
> > > Refactor mtk_clk_register_plls to take a struct device pointer instead
> > > of a struct device_node pointer, and fix up all users of this functio=
n.
> > >
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >   drivers/clk/mediatek/clk-mt2701.c            | 2 +-
> > >   drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 +-
> > >   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 4 ++--
> > >   drivers/clk/mediatek/clk-mt6765.c            | 2 +-
> > >   drivers/clk/mediatek/clk-mt6779.c            | 2 +-
> > >   drivers/clk/mediatek/clk-mt6797.c            | 2 +-
> > >   drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 +-
> > >   drivers/clk/mediatek/clk-mt7629.c            | 2 +-
> > >   drivers/clk/mediatek/clk-mt7981-apmixed.c    | 2 +-
> > >   drivers/clk/mediatek/clk-mt7986-apmixed.c    | 2 +-
> > >   drivers/clk/mediatek/clk-mt7988-apmixed.c    | 2 +-
> > >   drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 3 ++-
> > >   drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
> > >   drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 2 +-
> > >   drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 2 +-
> > >   drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 3 ++-
> > >   drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 3 ++-
> > >   drivers/clk/mediatek/clk-mt8196-mcu.c        | 2 +-
> > >   drivers/clk/mediatek/clk-mt8196-mfg.c        | 2 +-
> > >   drivers/clk/mediatek/clk-mt8196-vlpckgen.c   | 2 +-
> > >   drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 2 +-
> > >   drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 2 +-
> > >   drivers/clk/mediatek/clk-pll.c               | 7 ++++---
> > >   drivers/clk/mediatek/clk-pll.h               | 6 +++---
> > >   24 files changed, 33 insertions(+), 29 deletions(-)
> > >
> >
> > ..snip..
> >
> > > diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/cl=
k-pll.h
> > > index d71c150ce83e4bb2fe78290c2d5570a90084246d..0e2b94b9cd4b56adceee3=
b04e9ab24c2526471da 100644
> > > --- a/drivers/clk/mediatek/clk-pll.h
> > > +++ b/drivers/clk/mediatek/clk-pll.h
> > > @@ -78,9 +78,9 @@ struct mtk_clk_pll {
> > >       const struct mtk_pll_data *data;
> > >   };
> > >
> >
> > There's a forward declaration of struct device_node in this header: wit=
h this
> > change, that becomes unused.
> >
> > Please change that to a forward declaration of struct device instead.
> >
> > While at it, I'd appreciate if you could either:
> >   A. Remove the forward declaration for `struct clk_hw_onecell_data` an=
d for
> >      `struct clk_ops` (as both come from clk-provider.h - which this al=
ready
> >       includes);
> >     ...or...
> >   B. Remove the inclusion of clk-provider.h and keep the forward declar=
ations.
>=20
> Prefer (B) since no APIs from clk-provider.h are referenced in the header.
> It is up to the implementation to directly include any and all headers it
> needs.

  drivers/clk/mediatek/clk-pll.h:67:16: error: field has incomplete type 's=
truct clk_hw'
     67 |         struct clk_hw   hw;
        |                         ^
  drivers/clk/mediatek/clk-pll.h:67:9: note: forward declaration of 'struct=
 clk_hw'
     67 |         struct clk_hw   hw;
        |                ^

The compiler needs to know the complete type here, as it's not a
pointer but a member proper, which is needed for the container_of
macro to work.

In other words, clk-provider.h is needed.

Kind regards,
Nicolas Frattaroli

>=20
> ChenYu
>=20
> > After which:
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> >
> > > -int mtk_clk_register_plls(struct device_node *node,
> > > -                       const struct mtk_pll_data *plls, int num_plls,
> > > -                       struct clk_hw_onecell_data *clk_data);
> > > +int mtk_clk_register_plls(struct device *dev, const struct mtk_pll_d=
ata *plls,
> > > +                       int num_plls, struct clk_hw_onecell_data *clk=
_data);
> > > +
> > >   void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int n=
um_plls,
> > >                            struct clk_hw_onecell_data *clk_data);
> > >
> > >
> >
> >
>=20





