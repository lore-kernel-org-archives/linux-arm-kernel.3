Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A8EC5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 06:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:Reply-To:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnyXDq2a+hbN/ck+YKdBwei9akMwdSuQVH9bnBes5gA=; b=aGJHesgDKztvGh
	7F1eUM43V360bkupooNZ/BmxQxgg4PegIXbD2Zn5+fJ+UzFL6LLS0MDWs6rBBMOXH0Rh2GAN3xgEf
	YuUMPEIBvMV+eshtZQ3ZADxSNcyjak9PlkKvA4qzMdaXr/glGUEJw6NUmisenN1WcPwkTJrT6igS0
	Q1AkkFnNMa0C2FyqJKEt+K6XHH2RhDup12lx/P13G/6Xv1FeAYj/d+et61UmynLbg1GGSQbhLFQGv
	x0u648xGSBQMPZmAZnq5vU0VNZ5lTLWkjC82jGqBHQ1tgUcX1o+6ucR4La9Qq7NEOgWPSjN86LZ4a
	42yojjRgjg3E8SzwqREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIk1-0000000CcD9-1UDa;
	Fri, 21 Aug 2026 06:28:37 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIjx-0000000CcCU-2hY1;
	Fri, 21 Aug 2026 06:28:36 +0000
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BFA3B2018C1;
	Fri, 21 Aug 2026 08:28:30 +0200 (CEST)
Message-ID: <6947a89b-8fa0-499a-9be8-c48d9bb5e7a7@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG
 decoder
To: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Benjamin Gaignard" <benjamin.gaignard@collabora.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Andrzej
 Pietrasiewicz" <andrzej.p@collabora.com>, "Hans Verkuil" <hverkuil@kernel.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Lucas
 Sinn" <lucas.sinn@wolfvision.net>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <61537689daa428a577e6bdab794d044f5405128e.camel@collabora.com>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
 <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
 <5436875c-9724-41f3-aaf9-76d43e05f0a8@pengutronix.de>
 <61537689daa428a577e6bdab794d044f5405128e.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 06:28:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_232833_839146_E2506413 
X-CRM114-Status: GOOD (  23.47  )
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

On 2026-08-20 12:02, Nicolas Dufresne wrote:
> Hi Sascha,
>=20
> Le jeudi 20 ao=C3=BBt 2026 =C3=A0 10:03 +0000, Sascha Hauer a =C3=A9crit=
=C2=A0:
> > On 2026-08-19 11:48, Nicolas Dufresne wrote:
> > > Hi Sascha,
> > >=20
> > > Le mercredi 19 ao=C3=BBt 2026 =C3=A0 12:37 +0200, Sascha Hauer a =C3=
=A9crit=C2=A0:
> > > > +/* ---------------------------------------------------------------=
--- */
> > > > +/* Register byte offsets from dec_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
> > > > +/* ---------------------------------------------------------------=
--- */
> > > > +
> > > > +/* REG0: IP version / product ID */
> > > > +#define VDPU720_REG_VERSION		0x000
> > > > +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> > > > +#define VDPU720_BIT_DEPTH		BIT(8)
> > >=20
> > > Can you share a dump and share these register reset values. Looking a=
t the
> > > layout, clearly its highly modified, but probably derived from VSI mu=
lti-codec,
> > > but I'm thinking perhaps we'll learn more from that. Its always nice =
to justify
> > > when adding more chips that are not strictly VSI designs (or maybe it=
 is) to the
> > > hantro dirver.
> >=20
> > Here's a full register dump right after reset:
> >=20
> > 00000000: db1f0005 00000004 00120000 00000000
>=20
> I've look around as much as I could, and could not find any indication th=
at this
> is an IP from VSI or derived from a VSI core. It is entirely different fr=
om
> vdpu1 in mpp (proper G1, rk3288 and similar) and vdpu2 (modified G1 / VDP=
U121).
> In short, this is not a multi-codec core.
>=20
> So that ball is on your end to show that this driver belongs to hantro ra=
ther
> then its own driver. In absence of evidence, this driver should be part of
> rockchip vendor folder, not vsi. Don't read me wrong, I trust that you ha=
ve
> tested what the LLM have chosen, but anything can be implement in Hantro =
really,
> it does not mean it should be there.

I won't argue that the driver belongs to hantro because apparently it doesn=
't.
I don't know where the decision to integrate it into hantro is coming
from, maybe just because the Rockchip JPEG encoder is also there.
Anyway, I'll start with a fresh series with a standalone driver.

Patches 1-3 could be useful on their own though, so you might want to
take them. They are untested on real Hantro hardware, but I could give
them a go on the JPEG encoder.

Sascha


--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


