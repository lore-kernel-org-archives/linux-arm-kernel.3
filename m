Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D2BD0E6C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2R6Q20WwHjpOhjQE5aD4OXU5IVPCnshqCtQRRnZsv9c=; b=sN8I+a3UBKavio2TJ6kikuAd1v
	DqFSTRqCEWjEWc4Mep93QYtnPzXTzl8sXFxjEAx4Q7IyM1Pw7vI8VqZnEAbRvw/2KACMZApJS70N/
	V0ge2mVNB2cl2hsujnME75Zbww0HcGdxMMFL9PzMSo38x51eBBAJO/DfasVkYhnshahqjP9hhSIM1
	mhVBY+V98Uve4INbdp25Bw6vnC/LuBBHpoXW9Ut0mez7OT1eQTRyy88QQHxzUEMMKyUANo/sxz2WH
	mO++i/MSNO6q66ZrfH0g0H874X1hERAdCcOXGLsfr6BaeVeVQissE9l2zPNPfy6ONrP+gI71nF0dw
	5kwOkqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqTW-0000000D8rs-0EgN;
	Tue, 25 Nov 2025 10:40:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqTT-0000000D8rU-1dGS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:40:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqTG-0001bn-DK; Tue, 25 Nov 2025 11:40:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqTF-002NT7-2v;
	Tue, 25 Nov 2025 11:40:29 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vNqTF-000000003g3-3Plg;
	Tue, 25 Nov 2025 11:40:29 +0100
Message-ID: <9f07e541fc000d9065c1ff1716f1edc4c2278c8d.camel@pengutronix.de>
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Frank Li
	 <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, Daniel Baluta	 <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, 	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team	 <kernel@pengutronix.de>
Date: Tue, 25 Nov 2025 11:40:29 +0100
In-Reply-To: <4a022153-009c-44fd-8c4b-39819ae69390@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
	 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
	 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
	 <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
	 <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
	 <4a022153-009c-44fd-8c4b-39819ae69390@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_024043_431346_92C84C2D 
X-CRM114-Status: GOOD (  22.59  )
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

On Di, 2025-11-25 at 01:59 -0800, Laurentiu Mihalcea wrote:
> On 11/24/2025 7:41 AM, Frank Li wrote:
> > On Mon, Nov 24, 2025 at 01:28:32AM -0800, Laurentiu Mihalcea wrote:
> > > On 11/21/2025 7:38 AM, Frank Li wrote:
> > > > On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
> > > > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > > >=20
> > > > > Replace the reset map mask with the bit index to make it clear th=
at all
> > > > > reset lines are managed by exactly 1 bit.
> > > > I don't think there are benefit because I met some periphal need a =
magic
> > > > number to reset.

Toggling multiple bits in unison is different from having to write a
magic number to a register field. The driver currently supports
neither. That is why I suggested to change from mask to bit.

> > > Please provide more information. What SoC? Which peripherals? What bl=
ock control?
> > >=20
> > I can't reminder exact one. I grep some code
> >=20
> > [IMX8MP_MEDIABLK_PD_LCDIF_1] =3D {
> >                 .name =3D "mediablk-lcdif-1",
> >                 .clk_names =3D (const char *[]){ "disp1", "apb", "axi",=
 },
> >                 .num_clks =3D 3,
> >                 .gpc_name =3D "lcdif1",
> >                 .rst_mask =3D BIT(4) | BIT(5) | BIT(23),
> >                 .clk_mask =3D BIT(4) | BIT(5) | BIT(23),

According to the reference manual, these are three separate software
resets for three separate clocks: lcdif_pixel_clk, lcdif_apb_clk, and
lcdif_axi_clk.

> >                 .path_names =3D (const char *[]){"lcdif-rd", "lcdif-wr"=
},
> >                 .num_paths =3D 2,
> >         },
> >=20
> > mask is more extenable and easily support more hardware in future.

If such hardware appears in the future, it will be easy to adapt the
driver. Usually we don't prematurely add complexity for possible future
hardware.

> > Change to bit number have not big benefit.

It improves readability as it makes immediately clear from the code
that all resets correspond to a single bit.

> sure, I'm fine with the mask-based approach. The big idea here is to make=
 this driver
> usable in as many scenarios as possible.
>=20
> Philipp, please let me know if you're okay with the proposal. Will also h=
ave to tweak
> one of the subsequent patches since, so far, we've been operating under t=
he assumption
> that reset lines are 1 bit.

Given that the current code is already using mask, and if you think it
is likely that there will be need for reset controls that require
toggling multiple bits with a single write, I'm fine with keeping the
mask.

regards
Philipp

