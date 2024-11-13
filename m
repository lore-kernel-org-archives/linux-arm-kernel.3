Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A1D41C2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KihtNbifDm6WbD0d3qZBWnRWMaUKN4RzGEp0IW3rza8=; b=N9ZIaljDU29D8UtiowtKGqtGLs
	hs+lM4SBrsrNyodEPfWphmnEqiMXjq/IR+ZPLZVdToluOfdhs+XDmQqGLhch25mahPwURhEPqW4nB
	HfnM0RVEVNG1PpCesbX/RMyBvLk5dnM03psjC4KW4NC4SUQHZb03ag8sseeGv9E243kU4tyBU+3Og
	Z9RFsiVdQkcLoUijBSA2wTyw53GC/liEjoUjgdr26aMiq4GPJDS1fjHfkiGRLh/vRxluSzBjCKXZZ
	fJafUnAeuf8v7xi/boW4DhBnCmiJIyMWlcTSJ2P91X/fcfuTp/VuQaG7i6c/sObFmNbHAeCOROd3z
	WM5cxhpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAGW-00000006N1E-0VAe;
	Wed, 13 Nov 2024 10:06:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAEj-00000006Mrc-49kd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Nov 2024 10:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=KihtNbifDm6WbD0d3qZBWnRWMaUKN4RzGEp0IW3rza8=; b=SC6msB+jbnlojqelRIu+B3gpVg
	ZykAxkd5FkLiWmGoD9mV1LZV2X5zFRG5iwuumYt2bft4WRYULd93+NS1fwUMFJGq0s5RjBdkpViSC
	yycjGKa7nL57MLK6palkxF28XViGzhyeFP12mTyW4bLKLhhiyqs5w8Xao92LRLGWiGOE58QXimXKP
	T9c96BW/gmzhr3Y2Ynxen9l+41UF6dQ8BOofMtIz8zEtbG4yMbNL3ZorFFz59PB4TM8GlGFYPHklM
	4pHBM+ssYGaNgA/XK7Y0oEIeP2puAjhiD5fZOIdriwoG9XYuZ/efl9mUZA7fK4+XWtEAjUm44o8W6
	1sJ1c7DA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAEg-0000000DEoD-13Jw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 10:04:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tBAE9-0007LF-0u; Wed, 13 Nov 2024 11:03:57 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tBAE4-000YV1-2h;
	Wed, 13 Nov 2024 11:03:52 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tBAE4-000387-2O;
	Wed, 13 Nov 2024 11:03:52 +0100
Message-ID: <6d8a0d8916e185090423d42217262450ee948088.camel@pengutronix.de>
Subject: Re: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, "brendan.higgins@linux.dev"
	 <brendan.higgins@linux.dev>, "benh@kernel.crashing.org"
	 <benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andi.shyti@kernel.org"
	 <andi.shyti@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org"
	 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"andrew@codeconstruct.com.au"
	 <andrew@codeconstruct.com.au>, "andriy.shevchenko@linux.intel.com"
	 <andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	 <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 13 Nov 2024 11:03:52 +0100
In-Reply-To: <OS8PR06MB7541739C4D1E69C0981CBCB4F25A2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
	 <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
	 <6aea003a286162c465d0ee7681988b3697feb103.camel@pengutronix.de>
	 <OS8PR06MB7541739C4D1E69C0981CBCB4F25A2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_100430_440382_75BE612F 
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

On Mi, 2024-11-13 at 07:43 +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new
> > register
> > mode driver
> >=20
> > On Mo, 2024-10-07 at 11:52 +0800, Ryan Chen wrote:
> > > Add i2c new register mode driver to support AST2600 i2c new
> > > register
> > > mode. AST2600 i2c controller have legacy and new register mode.
> > > The
> > > new register mode have global register support 4 base clock for
> > > scl
> > > clock selection, and new clock divider mode. The new register
> > > mode
> > > have separate register set to control i2c controller and target.
> > > This
> > > patch is for i2c controller mode driver.
> > >=20
> > > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > > ---
> > > =C2=A0drivers/i2c/busses/Kconfig       |   11 +
> > > =C2=A0drivers/i2c/busses/Makefile      |    1 +
> > > =C2=A0drivers/i2c/busses/i2c-ast2600.c | 1032
> > > ++++++++++++++++++++++++++++++
> > > =C2=A03 files changed, 1044 insertions(+)
> > > =C2=A0create mode 100644 drivers/i2c/busses/i2c-ast2600.c
> > >=20
> > [...]
> > > diff --git a/drivers/i2c/busses/i2c-ast2600.c
> > > b/drivers/i2c/busses/i2c-ast2600.c
> > > new file mode 100644
> > > index 000000000000..17ba0ee77c27
> > > --- /dev/null
> > > +++ b/drivers/i2c/busses/i2c-ast2600.c
> > > @@ -0,0 +1,1032 @@
> > [...]
> > > +static int ast2600_i2c_probe(struct platform_device *pdev) {
> > [...]
> > > +	i2c_bus->rst =3D devm_reset_control_get_shared(dev, NULL);
> > > +	if (IS_ERR(i2c_bus->rst))
> > > +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst),
> > > "Missing reset
> > > +ctrl\n");
> > > +
> > > +	reset_control_deassert(i2c_bus->rst);
> >=20
> > The shared reset should be asserted again in ast2600_i2c_remove().
> >=20
> Hello,
> It is share reset, if unbond driver and asserted the reset, it will
> affect others driver running (which is share with the same reset.)

Shared reset_control_deassert/assert are refcounted, like
clk_enable/disable, see [1]. The reset line will only be asserted when
the last driver calls reset_control_assert.

[1] https://docs.kernel.org/driver-api/reset.html#shared-and-exclusive-rese=
ts

regards
Philipp

