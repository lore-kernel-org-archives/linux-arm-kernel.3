Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C6CC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBD8pjkl49jXk6ajkWsBSrezfGMEnjWuGImmb1IVsS0=; b=exKQ4gHmvXbfXm6S5eyQpaMjK6
	hn7E0bIBNh4ZNGXEIR2U6rLvTQg5DZ78HHVUw5qW0CCPQqqwXzvJzydSBgNClNqDmI/rIWeyhpEfE
	9pD9shWJeib99jnCLUvg/eMbo5b8ZhJrqLVyxvVTkUa8Jr5sdOMJOeAlXV9QmmBoHIVmmSzQE/Ju5
	PUtWK+EionRLP932PnK/PSoxUi5gZ2dzgotcJgkTkL4/zMPh+gfdRM4gmQ3DCkbi9/zmre6t1FLKU
	6bmzr6FzQbfmj5jV23LcMumAH5M0YhygQlVnAslQIfRV3ejS+eZp9E1tbBUBe82xyXOS8GzfUmU2f
	xLciVNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cr7-00000007RTY-1CQn;
	Mon, 07 Sep 2026 17:10:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cr6-00000007RTH-0VUd;
	Mon, 07 Sep 2026 17:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFA5942A28;
	Mon,  7 Sep 2026 17:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2291F00A3A;
	Mon,  7 Sep 2026 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801003;
	bh=XBD8pjkl49jXk6ajkWsBSrezfGMEnjWuGImmb1IVsS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=owj98OfPzHpf7poumZtjkOmlT4VMIBx+NqoC4mrrBTFwypnF6Xne+OwdM8BYfg5C5
	 //Yhj5AMTa4PmENVlWFNitqn080py7h/LhDXG9Ix5sC4lm4q6wbpu6FX3wfQeKv9EP
	 bZnFpvaTadNy2Erh0ykHYcNvD//gRyrVTRJ4NcOOzt3kV3mtMG3Lo/QOWnSjmFx5OO
	 knuUzNO/BAkr/5fSIJA37+bf0TXI2nevsEqHUONhF9iaLL6lAcvJfztsbz8BgGSYpr
	 cWGHZVRbl2JIcDoYx/2DkW04tZJBtjwl+aSt132tA1TN/jJfK2cv4L5yPX6qxoDay5
	 59Av3EQvk3IEw==
Date: Mon, 7 Sep 2026 18:09:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Message-ID: <27fb1c11-c1eb-4494-ac38-d794baf80814@sirena.org.uk>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
 <20260907-ensnare-wanted-e86eeaf770b0@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BHQstFVZMG9uADix"
Content-Disposition: inline
In-Reply-To: <20260907-ensnare-wanted-e86eeaf770b0@spud>
X-Cookie: Who's on first?
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


--BHQstFVZMG9uADix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 06:06:24PM +0100, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 11:16:08AM +0530, Shashank Maurya wrote:

> > +	vcc = devm_regulator_get(&i2c->dev, "vcc");
> > +	if (IS_ERR(vcc))
> > +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> > +				     "Failed to get vcc supply\n");

> This needs to be optional, because without it you'll break existing
> devicetrees. Unless you can explain how all existing users are
> nonfunctional (e.g. nothing ever enabled the supply, which seems
> doubtful given this surely worked when it was added) this must remain
> optional.

The core will stub in a dummy regulator for mandatory supplies that
don't have anything mapped by firmware, otherwise essentially all
regualtors would be optional and our error handling would be a disaster
zone.

--BHQstFVZMG9uADix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqe7+UACgkQJNaLcl1U
h9C9ZAf/f9QhYY7ZUT17BbKqAxAxlo1ULd1F9rHjyXoc7HkBdFzsnvVOtI+9RPlw
KIkpIqJG2M/d30SnvXknr6HRcsg//ZdCcQddsJU6P92L+meFoLXELI0u/eepBDfM
pGzm6sTtle3Cs5Zv0azKtUny0jDw5GFVehvW4V11+Orwmz5dkVma4VyLfycICYOE
l/Fv38h86NoBBQnjErrgj7936F0uoyHelys4eaRadRqIAtcUTe5wRQxmKr4tSYn/
6tR3fr5DKHM5vx6+chL2WTPWw6eUWcp3ZzOiSimKamoUIU9HYiaNsyOXQEgi/Lfj
qeSGacc3WgWD0ZXr0oi2TsiujZaVTw==
=P4QE
-----END PGP SIGNATURE-----

--BHQstFVZMG9uADix--

