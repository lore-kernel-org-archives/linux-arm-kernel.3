Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33791CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kChDTn3kRYGc+IHl+JPYUW6GNro54cJia3usxiJj7kM=; b=UKmAbbL+LYCg4HHxbMYwYUufDl
	IaiDTBVbh94g8wQcX9+O05Hed//h3x9KeWXGRK8RBn+4OVbn//BwEULwsyzD9kEGdJMgkZIv688Qf
	5mr2Z4gCFcO+jUS9swDHQOaG4sEqkUPbQ+HNCRb2tygOUsXk9SQPGiT7pTkJ1G9PCCnVr3yHwly2w
	WcfzulgbgoUb06+Y4dgaXKMEL0aiTlaScA9frpkQ2xDAeVfY+TfMqx9TVYXRzSVM2NgilEP1pQo+s
	42DBfwnDAGR14AzxPj/ywQ0K1/5SpWPiKMywQZ4JuIWEHSIHMVbFnMSMD0r5BIoMIUyRyHa4xcOSS
	ctfEvEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhJ0-0000000EdpF-3JDb;
	Wed, 03 Jun 2026 08:50:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhJ0-0000000Edp7-0gvk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kChDTn3kRYGc+IHl+JPYUW6GNro54cJia3usxiJj7kM=; b=hJL2BiEvoENdnRYR/yyG6IwO0X
	pUDar2xPvHdRaj2LfHb+lZfrDgdCGdBhdJljLWJYVe5fYbDWITQwZxoFicp5WoOGR8cPgc/y7abHI
	nqjQVcQFx+e2EWGZT63FckEVZlqGxWiesSPr4+Qq/WgLugULJTYsz0QCEjF1OJWoIlVLY4f//H3P7
	VF4IzlCZQaEmQW/JDGi6IlDzzK5uYyECfQdgQBEgH3pMrWDak/DmNVuPJl6ePjKd3s2xZMaAZ3sUk
	vkjmXSSoV9kVO+BM9TsyvLpyLoG/5k48WXyaVja7FhG5tDPMHakJi2RaZsJOf8QlWCINBjzu/3J3N
	vJbrfagw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhIx-0000000BdGu-1xgN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:50:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhIk-00064L-Vg; Wed, 03 Jun 2026 10:50:14 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhIk-000swV-2D;
	Wed, 03 Jun 2026 10:50:14 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhIk-000000003f4-2VCO;
	Wed, 03 Jun 2026 10:50:14 +0200
Message-ID: <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 03 Jun 2026 10:50:14 +0200
In-Reply-To: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_095027_578996_CCF29C67 
X-CRM114-Status: GOOD (  14.09  )
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

On Fr, 2026-05-29 at 00:52 +0300, Stefan D=C3=B6singer wrote:
> Hi,
>=20
> I am sending version 3 of my zx297520v3 clock patch. The major change is=
=20
> that I have merged the top and matrix clocks into one device because=20
> the interface between them is unclear in the hardware.
>=20
> There are still a few open questions though:
>=20
> 1) The clk-reset interaction: Both clocks and resets are in the same IO=
=20
> space, sometimes in the same registers. I see a number of clk drivers=20
> that register a reset control. I noticed Yu-Chun Lin's RTD1625 clock=20
> submission added an aux device and placed the reset code in=20
> drivers/reset instead. Is there a preference for either way or any=20
> guideline of which way to use in which circumstances?

When there is no interaction required when operating the clk/reset
bits, I prefer the reset driver sitting in drivers/reset as an aux
device, especially when register access can be abstracted via a shared
regmap. Some of the reset drivers under drivers/clk just predate the
aux bus.


regards
Philipp

