Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE131CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srXz9Z4cJj2t72vaKDBPc8Jra6K2uLJkmaxWaZoZKCo=; b=fg9Ew278tdT8IItG9ds3h4LZrS
	VonVAdKEbb/2+l17qWYhqE7v065fOE03+sM8MAZNm8+SX6Kqyg2UzFSpesRcQ3h76l2Zntb7oOPmN
	VY07X7GV04Epi4z9j6XmJdYySNpxbo4RjKxLU1WQgITjYRxRjzVHFkvy8IzjgRLb8r6RrCAdd28yJ
	V38urqszg3gRX6K5QV9amwvi4RE1W7TBwJNcGcMBOIqkHr4BO9k4Puj/6Yj+eNPdd0P4Lf1+HEhRq
	1K++LdS0tPG3IyWfspCHrdaX0vGBn6VmDB+Ia+wSVR7+lqwxeupnDr4YSB1FEfUEtJu0RBHu/Epmr
	6ALaMELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgNC-00000003qnC-0B5Z;
	Fri, 19 Sep 2025 19:02:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgN9-00000003qmT-1U5e;
	Fri, 19 Sep 2025 19:02:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758308534; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cH26IUmfARHZ5DlOjLqJkt4BcKgTyMaw8aBcfi+wYGKunFM3yTMF4ZoSXy4tXORYws2aFWrJGTas51jLJrcEW7UX4gP1WKTynnTpUFJMopcqdrxcVQ4yoXgP2HFLxCqFoSRUDjQq/lrG3mq+z3jJIdMedjpjuip/G/IxYJz3WGU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758308534; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=srXz9Z4cJj2t72vaKDBPc8Jra6K2uLJkmaxWaZoZKCo=; 
	b=AlIectYeirCZSjvdAEuhH9MPsbcqsC0iGW32eA2BlNvcVVw553j/0pEA8bHrHSoPF7qw21EIHz4v3ixnI+5xW/aUll4zUh5AZ9t3l+S4Ckc9DHw1UdaszLpjmPz6JW85UpFC9m6CQiz1iZi/r5as8s9457bf4ZI6bcvo/TjFuhs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758308534;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=srXz9Z4cJj2t72vaKDBPc8Jra6K2uLJkmaxWaZoZKCo=;
	b=M8o8jMjCP5E/dushTSx4+AKMYmJ9cIaieQrGOZL/HiRUDSaIaoNwj98LIaaIcJ9G
	9tO5HU9FOEaB/8MdbnOVcW0ZjVmB1gb++8Np/meByyS/gKct1DBVmHx6GRU+qldJluV
	KPTOLE57YGY9C4/DN2g+DC4kn5ADWroyQgbEL91E=
Received: by mx.zohomail.com with SMTPS id 1758308533233746.4562667171067;
	Fri, 19 Sep 2025 12:02:13 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jjian Zhou <jjian.zhou@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
Date: Fri, 19 Sep 2025 21:02:08 +0200
Message-ID: <5789241.GXAFRqVoOG@workhorse>
In-Reply-To: <CABb+yY3N2=01yKJon25_6_vmihj09H=T9pLwzdGPrqY5h=hRFQ@mail.gmail.com>
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <CAGXv+5F-L2+4PGixx7OG2+vp2yXc_2885yMzqWtkQDwhxVAPxw@mail.gmail.com>
 <CABb+yY3N2=01yKJon25_6_vmihj09H=T9pLwzdGPrqY5h=hRFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_120219_460218_A0271A9F 
X-CRM114-Status: GOOD (  22.80  )
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

On Friday, 19 September 2025 18:32:12 Central European Summer Time Jassi Br=
ar wrote:
> On Fri, Sep 19, 2025 at 3:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Fri, Sep 19, 2025 at 7:50=E2=80=AFAM Jassi Brar <jassisinghbrar@gmai=
l.com> wrote:
> > >
> > > On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@mediat=
ek.com> wrote:
> > >
> > > .....
> > >
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +struct mtk_vcp_mbox_priv {
> > > Maybe 'mtk_vcp_mbox' is a more appropriate name ?
> > >
> > > > +       void __iomem *base;
> > > > +       struct device *dev;
> > > > +       struct mbox_controller mbox;
> > > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > > +       struct mtk_ipi_info ipi_recv;
> > >
> > > Maybe also have "struct mbox_chan chan[1]; " so that you don't have to
> > > allocate one during the probe.
> >
> > > Also if you have  "struct mbox_controller mbox;" as the first member,
> > > you could simply typecast that to get this structure.
> > > Something like "struct mpfs_mbox" in mailbox-mpfs.c
> >
> > I read somewhere that this way of subclassing is not recommended.
> > Instead the base class should explicitly not be the first member.
> > And then container_of() should be used.
> >
> > I don't remember where I read this though. But I think the explicit
> > container_of() is easier for understanding the intent.
> >
> And how does container_of() work ? :)
> typcasting the first member to its parent is the simplest form of contain=
er_of.
>=20
> -j
>=20
>=20

Which is why it's completely equivalent and since code is supposed
to communicate meaning to humans, container_of should be used.

"In this case if nobody ever reorders members you can avoid a
preprocessor macro that will get optimised away" is pointless
nitpicking. It's a strictly worse way to do the same thing.

Why bikeshed the use of container_of of all things?




