Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DE4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sa+YtCD3kLuoHOYbn1YCfWKsVdW9XBp8FtQkfySgPZQ=; b=hP3eXZHCr0dLe5SEEHyYusGV6+
	DvmFMCQ3NxWeKD2ByVcbVV6DGejJWQHs6q1IVx+BdUF9DNaZZKcxnCOo/q75vqfh78wubWmu7zteH
	KoWd1EQtvMC3nHcmHMGy4BK4rIe88ookCSJ7nD2/a1OFZ0IzC3QVUNXETvYe0ALIips5mHxsN+WY3
	Tw4DS1QKveePlX3HJU7weJV8X09uhV6ZXIL+jX6zKRTDc6tgbW2B/IvhTSoDVHuU5HGc9nuHormKJ
	PBFDnvb8sIWRxBuguq2/iqolL27vZa/9UepJQtvcvNTSxhzlExM7kuKvDEzwHHiEDj0rFdnJ3maxV
	zc3eHaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26i-000000095J9-3br8;
	Tue, 09 Sep 2025 17:26:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1N7-00000008ZSO-0CCz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:39:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC05515A1;
	Tue,  9 Sep 2025 09:38:59 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C6853F66E;
	Tue,  9 Sep 2025 09:39:05 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:39:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: generalise update bit
Message-ID: <20250909173903.6b78cd9c@donnerap>
In-Reply-To: <CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
References: <20250903000910.4860-1-andre.przywara@arm.com>
	<20250903000910.4860-3-andre.przywara@arm.com>
	<CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
	<CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_093909_124137_2DD6B974 
X-CRM114-Status: GOOD (  23.41  )
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

On Wed, 10 Sep 2025 00:06:07 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Sat, Sep 6, 2025 at 12:15=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrot=
e:
> >
> > On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote: =20
> > >
> > > A few of the Allwinner A523 CCU clock registers introduced an "update=
" bit,
> > > which must be set for changes to the other bits to take effect.
> > > Of the three clocks where this was used, it was always bit 27, so we =
just
> > > encoded this as a single bit feature flag.
> > >
> > > Now the CPU PLL also features the update bit, but puts it at bit 26, =
so
> > > this flag trick won't work anymore.
> > >
> > > Add an "update_bit" field to the common sunxi clock struct, which tak=
es a
> > > bitmask, so we can encode any bit to use, even potentially multiple of
> > > them. As uninitialised fields are set to 0, we can use this as a defa=
ult
> > > bitmask to set, so can OR this in unconditionally.
> > >
> > > Change the existing update bit users to use this new encoding, and add
> > > support for the ccu_nm clock on the way, since we will need it there
> > > shortly.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org> =20
>=20
> Hmm, actually, we also have the "key field" feature. Maybe we should
> generalize that one and merge the two?

Ah, that's a good idea! Somewhat obvious now when looking at the code in
ccu_mux.c, where there are two "reg |=3D MAGIC_VALUE;" lines next to each o=
ther.
Will hack something up for this.

Thanks,
Andre

