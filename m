Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC55CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDSLbWRe3/XSF6EHknU6DwHbBjpQeYWU/BRQOn+S+E0=; b=d72SidLsw8LLD2bwUOhQmZ2wzP
	QhhFewbkIXR3XRHwYMkHqispv6Hh5bR44S/jJulNyAb1nIM0VehS5R0H81QWm+8GU6+mKAZPWNGTR
	ioPJEeTmEdElfrAySGUCAl4PgVaQmkZTggJksFMwyCWQvy+ICc1ibErKBxu7Q68YdY3ch9W8b7hVZ
	FwnjDuvuzSBnJYF43VQeHvUL+B+stA2qrCCwbOI9mrqLIy2Ck7+B6AUg0xrq085e2Uqxn+0GOnep0
	bB1IIfjP5tJVR5ZrkkwwVlm3c5+AoKLMgCvCF5zT3zS3EjWAOfRCCHfgIoeWC9icpmRjuApEinsEk
	ucp9hfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yzJ-0000000CsoS-1Jt1;
	Tue, 23 Sep 2025 09:07:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yzG-0000000Csnw-0gwQ;
	Tue, 23 Sep 2025 09:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758618417; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WUVll49IQ+H3NMXdoaT6K2RFOubCRIh8nTVDC130XCwvQtEqkgW8odYao0QpHWGZA2xf2Jbv8o0qKuvI0tFfylr9/nxi3kCX+idBXWtpHEJcFAlKIaoz0hoVm71HDpVu5PMQLDiz3LNzcUdlHe2qJS4++ljbea0gqmb6pMpDexk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758618417; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lDSLbWRe3/XSF6EHknU6DwHbBjpQeYWU/BRQOn+S+E0=; 
	b=iyt1yQ/3U0uKZsgnULMdD3f/prailyEXuo2yvBU6agBfC9hJYFRVhlb6Br75wjrLOitUQtw/oerKm/d6sCnnBRwp/BkIBbf+1WO7F5bqfOdQ69Ip+9imwWwAsmSJODvnX4LhPC+z5yGpfklXY9EPiS0Ueu0imU4nidq3sY9DKDg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758618417;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=lDSLbWRe3/XSF6EHknU6DwHbBjpQeYWU/BRQOn+S+E0=;
	b=kKRpg/SUMjRrSseNMULThv4AZ7il2w6TbWlp+iHoeVtfTNv9szWRJZDrbtPUkxQY
	3GUrqSzx5yxcXQaVFMbe0AhUSJ4BSHR01kILwd2HHJGoM34dbY2Cc8uozi9d7FxMtwq
	ftuXMxgrlPcDErDdb4GFWLL3L2WgpA9GKLS6HaLw=
Received: by mx.zohomail.com with SMTPS id 1758618414479846.6177567826774;
	Tue, 23 Sep 2025 02:06:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 Jjian Zhou =?UTF-8?B?KOWRqOW7uik=?= <Jjian.Zhou@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
Date: Tue, 23 Sep 2025 11:06:50 +0200
Message-ID: <2382077.ElGaqSPkdT@workhorse>
In-Reply-To: <eb9b0ea70abb09f45c50e88b6221948ae09be6f7.camel@mediatek.com>
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <13850137.uLZWGnKmhe@workhorse>
 <eb9b0ea70abb09f45c50e88b6221948ae09be6f7.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_020702_285471_AFA2F790 
X-CRM114-Status: GOOD (  39.63  )
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

On Tuesday, 23 September 2025 04:35:59 Central European Summer Time Jjian Z=
hou (=E5=91=A8=E5=BB=BA) wrote:
> On Mon, 2025-09-22 at 15:10 +0200, Nicolas Frattaroli wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > On Monday, 22 September 2025 09:17:27 Central European Summer Time
> > Jjian Zhou (=E5=91=A8=E5=BB=BA) wrote:
> > > On Sat, 2025-09-20 at 23:02 -0500, Jassi Brar wrote:
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >=20
> > > >=20
> > > > On Fri, Sep 19, 2025 at 2:02=E2=80=AFPM Nicolas Frattaroli
> > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > >=20
> > > > > On Friday, 19 September 2025 18:32:12 Central European Summer
> > > > > Time
> > > > > Jassi Brar wrote:
> > > > > > On Fri, Sep 19, 2025 at 3:31=E2=80=AFAM Chen-Yu Tsai <
> > > > > > wenst@chromium.org>
> > > > > > wrote:
> > > > > > >=20
> > > > > > > On Fri, Sep 19, 2025 at 7:50=E2=80=AFAM Jassi Brar <
> > > > > > > jassisinghbrar@gmail.com> wrote:
> > > > > > > >=20
> > > > > > > > On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <
> > > > > > > > jjian.zhou@mediatek.com> wrote:
> > > > > > > >=20
> > > > > > > > .....
> > > > > > > >=20
> > > > > > > > > +#include <linux/module.h>
> > > > > > > > > +#include <linux/of.h>
> > > > > > > > > +#include <linux/platform_device.h>
> > > > > > > > > +#include <linux/slab.h>
> > > > > > > > > +
> > > > > > > > > +struct mtk_vcp_mbox_priv {
> > > > > > > >=20
> > > > > > > > Maybe 'mtk_vcp_mbox' is a more appropriate name ?
> > > > > > > >=20
> > > > > > > > > +       void __iomem *base;
> > > > > > > > > +       struct device *dev;
> > > > > > > > > +       struct mbox_controller mbox;
> > > > > > > > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > > > > > > > +       struct mtk_ipi_info ipi_recv;
> > > > > > > >=20
> > > > > > > > Maybe also have "struct mbox_chan chan[1]; " so that you
> > > > > > > > don't have to
> > > > > > > > allocate one during the probe.
> > > > > > > > Also if you have  "struct mbox_controller mbox;" as the
> > > > > > > > first
> > > > > > > > member,
> > > > > > > > you could simply typecast that to get this structure.
> > > > > > > > Something like "struct mpfs_mbox" in mailbox-mpfs.c
> > > > > > >=20
> > > > > > > I read somewhere that this way of subclassing is not
> > > > > > > recommended.
> > > > > > > Instead the base class should explicitly not be the first
> > > > > > > member.
> > > > > > > And then container_of() should be used.
> > > > > > >=20
> > > > > > > I don't remember where I read this though. But I think the
> > > > > > > explicit
> > > > > > > container_of() is easier for understanding the intent.
> > > > > > >=20
> > > > > >=20
> > > > > > And how does container_of() work ? :)
> > > > > > typcasting the first member to its parent is the simplest
> > > > > > form of
> > > > > > container_of.
> > > > > >=20
> > > > > > -j
> > > > > >=20
> > > > > >=20
> > > > >=20
> > > > > Which is why it's completely equivalent and since code is
> > > > > supposed
> > > > > to communicate meaning to humans, container_of should be used.
> > > > >=20
> > > >=20
> > > > Nobody is suggesting typecasting cfg, dev or anything else.
> > > > Typecasting between mailbox controllers is fine and arguably
> > > > easier
> > > > on
> > > > the eyes than using a container_of.
> > > >=20
> > > > -j
> > >=20
> > > OK. How about:
> > > struct mtk_vcp_mbox *priv =3D (struct mtk_vcp_mbox *)chan-
> > > > con_priv;
> > >=20
> > > Thanks.
> > >=20
> >=20
> > An explicit cast would be worse, as at that point you're telling
> > C to completely ignore any semblance of a type system it has.
> >=20
> >=20
> >=20
>      struct mtk_vcp_mbox *priv;=20
>      priv->dev =3D dev;
>      priv->chans[0].con_priv =3D priv;
> The type of con_priv is "void *".=20
> Would the conversion mentioned above also have the issue you mentioned?
>=20
> Thanks.
>=20

No, in that case the cast is implicit. While void pointers do
subvert the type system, they are needed in this case because
the con_priv member needs to point at structs of any type.

The problem is that when you do something like

  struct apple *a =3D something;
  struct orange *o =3D (struct orange *)a;

then if the two structs (apple and orange) are incompatible,
the compiler won't even yell at you, because you're explicitly
casting.

With an implicit cast:

  struct apple *a =3D something;
  struct orange *o =3D a;

the compiler will tell you if you're doing something wrong.
Here's a userspace code example to illustrate the point:

    #include <stdio.h>

    struct apple {
            const char *name;
            unsigned int weight;
    };

    struct orange {
            int x;
            int y;
            int z;
    };

    int main(int argc, char** argv)
    {
            struct apple a =3D {"Granny Smith", 200};
            // won't compile, good!
            /* struct orange *o =3D &a; */
            // will compile, bad!
            struct orange *o =3D (struct orange *)&a;

            printf("%d\n", o->x);

            return 0;
    }

If you comment out the second struct orange line and uncomment the
first, then you'll get a compilation error, which is what we want
because the two structs are incompatible and we don't want the
assignment to work in this case, as that would be a bug.

The second struct orange line always compiles, even though the two
structs are incompatible, and will cause nonsense to be printed.

I hope this illustrates the point I was trying to make, which is
that explicit casts make it harder to find issues because they
force the language to simply accept the cast rather than give us
a compilation error when something nonsensical is being done.

Kind regards,
Nicolas Frattaroli



