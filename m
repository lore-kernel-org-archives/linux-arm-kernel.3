Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022C4CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAZGo74S2/BuMJzm9w/GphhXaDBG31Y3GtBvN2ub5vc=; b=iSLZ/zPf9zd4ATwQXHQ3nbEMvu
	wdc2uXgdnx8eW5zI0e8kntV6KxHN1M6uvnx6KGa3g/GUpLupLnUMb8QBYjlaYfXg+LMGQFP/66lyQ
	uzkrb63AhBUuvYXh4nhsCoVtyWpY2ravXetUpB9CaZG31JE52ITidacwpPcbN4frDEAxEoKocz0nA
	12I3B8LtZTE3f+85BkxdEuXpwARLGcDTHANlpdqYkVM/srDWBp2yoBMjUazM3sUxfgJ1kW5M9u23/
	zd3Z0iXGKn9u726lX0ZHDX40Rnroout9cIpganvOslGacSSDsHX/OcHZlyPttW/D4tM9WnU/AKab+
	6qMQ4qSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g9N-0000000AOtj-3aqZ;
	Mon, 22 Sep 2025 13:00:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g9L-0000000AOt7-1B6T;
	Mon, 22 Sep 2025 13:00:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758545993; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KXpsdfL0sLIEN6+ch4OPZF52ykGK/xd00kPCHOkG5Xlu8G1l9PuD8jlo98l/LK6vHA5/wZWezrGDBvHucrgPgoFZYN3uqpFmNUDfVwYPe6HjadufpYsFK6kU1+AYmqBjoGP2B4sSVB4Ccz2x8EPdJYThLbswqjHEWF+DQ9WJeLs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758545993; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wAZGo74S2/BuMJzm9w/GphhXaDBG31Y3GtBvN2ub5vc=; 
	b=Wujcwi5wk5ySWMkqq6JlwPpWHVpABorutQHdIRLY7OlPV9JQUQ5eY/QqFbV9oXyuPu/F5Rsuly/tX3f4FFKiiIhkSYEmERY9+WMw2FUbdSBy7hh3m1lDaZO/0vyS7C4GIjMChXERansH97pbxCQQMlUHP+2re8nbHZKl0ZcezY4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758545993;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wAZGo74S2/BuMJzm9w/GphhXaDBG31Y3GtBvN2ub5vc=;
	b=SNh4iW/HOcYjfz3V8ezrXt3Q2QL/Xw1vXwlLJ2bipi8+wTsUczNONCv/oBROfy1g
	8DlhSadMqjFNmUgrwkUx5CM9AwTAsQjFuqZp8wT5clHOD7A+rAIaEflzgcaYOOA23mf
	Stjg/mYFZWCQy8Z/G4n3Bj+ORsjgdlsKTo/WmY0o=
Received: by mx.zohomail.com with SMTPS id 1758545990297867.0298207925075;
	Mon, 22 Sep 2025 05:59:50 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 05/10] mailbox: add MediaTek GPUEB IPI mailbox
Date: Mon, 22 Sep 2025 14:59:43 +0200
Message-ID: <1933660.tdWV9SEqCh@workhorse>
In-Reply-To: <CABb+yY0_TZC0Dd3Rue=6Am4=Urs8hdkaa6RE=42t58SYUsLV0w@mail.gmail.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-5-c4ede4b4399e@collabora.com>
 <CABb+yY0_TZC0Dd3Rue=6Am4=Urs8hdkaa6RE=42t58SYUsLV0w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_060011_374314_6B0C7AB3 
X-CRM114-Status: GOOD (  33.14  )
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

On Sunday, 21 September 2025 07:00:59 Central European Summer Time Jassi Br=
ar wrote:
> On Wed, Sep 17, 2025 at 7:23=E2=80=AFAM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> ....
>=20
> > +#define MBOX_CTL_TX_STS                0x0000
> > +#define MBOX_CTL_IRQ_SET       0x0004
> > +#define MBOX_CTL_IRQ_CLR       0x0074
> > +#define MBOX_CTL_RX_STS                0x0078
> > +
> 1) Please don't pollute the global namespace. Make these something
> like MBOX_MTK_GPUEB_xxx. Here and elsewhere.

I tend to disagree. These don't pollute the global namespace, they're
defined as part of the file, so only pollute its local scope. I'm not
going to make 25 character long symbols just to work around an issue
that doesn't exist, but may exist in the unlikely future where
mailbox.h gets its own symbol named precisely the same way but
whoever adds it doesn't try to compile test every single mailbox
driver to make sure they didn't break anything.

> 2) You don't write short values, so maybe just 0x04, 0x04 0x74 and 0x78.
>=20
>=20
> > +#define MBOX_FULL              BIT(0) /* i.e. we've received data */
> > +#define MBOX_CLOGGED           BIT(1) /* i.e. the channel is shutdown =
*/
> > +
> This is confusing. CLOGGED usually means malfunction, but it seems you
> want to call it STOPPED or UNINIT?

I don't agree that "CLOGGED usually means malfunction". To clog something
is to impede its flow, which in this case is the correct terminology to
refer to what's happened to the channel. "UNINIT" is wrong, it's initialised
properly. "STOPPED" is also wrong, it's not stopped, it still sends, it just
won't pass it on through.

>=20
>=20
> > +#define MBOX_MAX_RX_SIZE       32 /* in bytes */
> > +
> > +struct mtk_gpueb_mbox {
> > +       struct device *dev;
> > +       struct clk *clk;
> > +       void __iomem *mbox_mmio;
> > +       void __iomem *mbox_ctl;
> > +       struct mbox_controller mbox;
> > +       struct mtk_gpueb_mbox_chan *ch;
> > +       int irq;
> > +       const struct mtk_gpueb_mbox_variant *v;
> > +};
> Other structures have kernel-doc, so why not here too?
> ...
>

Because fully documenting all internal structures is not required
for acceptance and writing redundant explanations for members that
can be understood from name and context is redundant.

> > +
> > +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > +       int i;
> > +       u32 *values =3D data;
> > +
> maybe order in decreasing lengths ?
>=20
>=20
> > +
> > +       /*
> > +        * We don't want any fancy nonsense, just write the 32-bit valu=
es in
> > +        * order. memcpy_toio/__iowrite32_copy don't work here, because=
 fancy.
> > +        */
> >
> Please make the comment technical. Currently it just expresses your
> distaste for fancy :)
>=20

Then I will have to make an assertive statement about memory semantics
of those two calls and how they differ from writel, which I don't want
to do, because it would likely be inaccurate or not the full picture
as those two calls can do a variety of things depending on the platform.

Saying that I want 32-bit writes in order is much simpler than explaining
how the two mentioned calls some well-meaning future developer may wish
to replace this with don't do that.

> > +       for (i =3D 0; i < ch->c->tx_len; i +=3D 4)
> > +               writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->tx_of=
fset + i);
> > +
>=20
> ...
> > +
> > +static struct mbox_chan *
> > +mtk_gpueb_mbox_of_xlate(struct mbox_controller *mbox,
> > +                       const struct of_phandle_args *sp)
> > +{
> > +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(mbox->dev);
> > +
> > +       if (!sp->args_count)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       if (sp->args[0] >=3D ebm->v->num_channels)
> > +               return ERR_PTR(-ECHRNG);
> > +
> > +       return &mbox->chans[sp->args[0]];
> > +}
> >
> Just use the default of_mbox_index_xlate()
>=20
> ....
> > +
> > +       for (i =3D 0; i < ebm->v->num_channels; i++) {
>=20
> You make this block a bit cleaner by using a temporary variable
>         echan =3D &ebm->ch[i];
> and using echan instead of ebm->ch[i] a dozen times below.
>=20
> > +               ebm->ch[i].c =3D &ebm->v->channels[i];
> > +               if (ebm->ch[i].c->rx_len > MBOX_MAX_RX_SIZE) {
> > +                       dev_err(ebm->dev, "Channel %s RX size (%d) too =
large\n",
> > +                               ebm->ch[i].c->name, ebm->ch[i].c->rx_le=
n);
> > +                       return -EINVAL;
> > +               }
> > +               ebm->ch[i].full_name =3D devm_kasprintf(ebm->dev, GFP_K=
ERNEL, "%s:%s",
> > +                                                     dev_name(ebm->dev=
), ebm->ch[i].c->name);
> > +               if (!ebm->ch[i].full_name)
> > +                       return -ENOMEM;
> > +
> > +               ebm->ch[i].ebm =3D ebm;
> > +               ebm->ch[i].num =3D i;
> > +               spin_lock_init(&ebm->mbox.chans[i].lock);
> > +               ebm->mbox.chans[i].con_priv =3D &ebm->ch[i];
> > +               atomic_set(&ebm->ch[i].rx_status, MBOX_CLOGGED);
> > +       }
> > +
>=20
>=20
> -j
>=20





