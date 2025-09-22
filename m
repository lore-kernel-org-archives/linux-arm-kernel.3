Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A7ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kn150si6R35actdtONn846LazO4pqKgYJ4TtgIXnRzo=; b=GxypObOXyJtfGEYvX8T6OL+2gm
	MbuOcRA/1AcVTyYDVGac7vRJ2S/WtZhPQ1exRoVUykcDFdnRDoSs0MbZV9zFjPckyp5dx+MkXBQKV
	MCAIn8bVfJaE+xFKpHVdNCRENBTb54j8pTNU9Ofe66dAAUpz9dZnGBsOkiAngiGoelORNRo7hotnQ
	EGgZVSz8C/wErgodswuwbo/98MHorrjMJBfHfGFrJ5AcjxpPgdymeiDIOpdQZRpZFKhiAbcOPKTDS
	NCiU6kLfuLTFiFSEHWIBuJht/MEEbxl0Ox3Gd/0TRfHDn+4jM2AA3cVidTldGwPwC4vTTGcvDShro
	0Sn++nxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gJK-0000000AQJf-2ITl;
	Mon, 22 Sep 2025 13:10:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gJI-0000000AQIw-1qfW;
	Mon, 22 Sep 2025 13:10:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758546626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LvrqHWBhrF/YJolT/DD+kCk+6/r3fLveOufwCo5/PU0J1Kp9OzWNO8UqzMId+yXKP8/q+M0a6yPFXkkRqFAUmbTFgp+OX+ZMs2AXTKuebWEwoOmpKHOXI6AT1DiBZTr1t4i5h/AC54pQBVN07KuVAbftvZcBEA4siuuGhq08RzQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758546626; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kn150si6R35actdtONn846LazO4pqKgYJ4TtgIXnRzo=; 
	b=kkGKSrMvIhdjki/asDlA1izrtZPael5VZlCYxS3jLtS84N9ub6r4qIqRHoeAUg1sE/orVmw+vldZYWQFnambdPMlJSPpxmqsLfHh+ZvjPIu78scfrx5NMaamv4DRf/GPzPwK7eylolelYH2Hi5OXRFgMiG4Y8uLy8jEqROMaLXY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758546626;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Kn150si6R35actdtONn846LazO4pqKgYJ4TtgIXnRzo=;
	b=PyjI5q/MF4VrsT7U6GDclIWy2TAyGGYq67BUikk1yt0Hr8M3jKj2CpKcsNJ8esO4
	r5LfN3WrvnJ92NrJiHst2FVeRa+StG8hD7IGlHSQwmGSAphEW+Z5fKOelFVH0HbwDZz
	G684j1eh8KRJJlfr1cp96CVZRnT/C6bPBQkWVg5E=
Received: by mx.zohomail.com with SMTPS id 1758546623493843.2136614730568;
	Mon, 22 Sep 2025 06:10:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 Jjian Zhou =?UTF-8?B?KOWRqOW7uik=?= <Jjian.Zhou@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
Date: Mon, 22 Sep 2025 15:10:18 +0200
Message-ID: <13850137.uLZWGnKmhe@workhorse>
In-Reply-To: <a9dd348fd7df95ebd5ad9cc58d57b588a18ccc9d.camel@mediatek.com>
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <CABb+yY2Ay+KqviJvOQC8X8kfzJN6-fQT04A+TCJAkLnWx+XwZg@mail.gmail.com>
 <a9dd348fd7df95ebd5ad9cc58d57b588a18ccc9d.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_061028_540419_618AC0A9 
X-CRM114-Status: GOOD (  26.75  )
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

On Monday, 22 September 2025 09:17:27 Central European Summer Time Jjian Zh=
ou (=E5=91=A8=E5=BB=BA) wrote:
> On Sat, 2025-09-20 at 23:02 -0500, Jassi Brar wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > On Fri, Sep 19, 2025 at 2:02=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >=20
> > > On Friday, 19 September 2025 18:32:12 Central European Summer Time
> > > Jassi Brar wrote:
> > > > On Fri, Sep 19, 2025 at 3:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromiu=
m.org>
> > > > wrote:
> > > > >=20
> > > > > On Fri, Sep 19, 2025 at 7:50=E2=80=AFAM Jassi Brar <
> > > > > jassisinghbrar@gmail.com> wrote:
> > > > > >=20
> > > > > > On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <
> > > > > > jjian.zhou@mediatek.com> wrote:
> > > > > >=20
> > > > > > .....
> > > > > >=20
> > > > > > > +#include <linux/module.h>
> > > > > > > +#include <linux/of.h>
> > > > > > > +#include <linux/platform_device.h>
> > > > > > > +#include <linux/slab.h>
> > > > > > > +
> > > > > > > +struct mtk_vcp_mbox_priv {
> > > > > >=20
> > > > > > Maybe 'mtk_vcp_mbox' is a more appropriate name ?
> > > > > >=20
> > > > > > > +       void __iomem *base;
> > > > > > > +       struct device *dev;
> > > > > > > +       struct mbox_controller mbox;
> > > > > > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > > > > > +       struct mtk_ipi_info ipi_recv;
> > > > > >=20
> > > > > > Maybe also have "struct mbox_chan chan[1]; " so that you
> > > > > > don't have to
> > > > > > allocate one during the probe.
> > > > > > Also if you have  "struct mbox_controller mbox;" as the first
> > > > > > member,
> > > > > > you could simply typecast that to get this structure.
> > > > > > Something like "struct mpfs_mbox" in mailbox-mpfs.c
> > > > >=20
> > > > > I read somewhere that this way of subclassing is not
> > > > > recommended.
> > > > > Instead the base class should explicitly not be the first
> > > > > member.
> > > > > And then container_of() should be used.
> > > > >=20
> > > > > I don't remember where I read this though. But I think the
> > > > > explicit
> > > > > container_of() is easier for understanding the intent.
> > > > >=20
> > > >=20
> > > > And how does container_of() work ? :)
> > > > typcasting the first member to its parent is the simplest form of
> > > > container_of.
> > > >=20
> > > > -j
> > > >=20
> > > >=20
> > >=20
> > > Which is why it's completely equivalent and since code is supposed
> > > to communicate meaning to humans, container_of should be used.
> > >=20
> >=20
> > Nobody is suggesting typecasting cfg, dev or anything else.
> > Typecasting between mailbox controllers is fine and arguably easier
> > on
> > the eyes than using a container_of.
> >=20
> > -j
>=20
> OK. How about:
> struct mtk_vcp_mbox *priv =3D (struct mtk_vcp_mbox *)chan-
> >con_priv;
>=20
> Thanks.
>=20

An explicit cast would be worse, as at that point you're telling
C to completely ignore any semblance of a type system it has.




