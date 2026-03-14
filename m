Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509D4107BCF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 01:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWYs9DvU+mZ9LOVAyOnflvF29x67OnKqYeQPgwvkhk0=; b=L4ZJBz2rrOBs8/0Bnq8NcurLE+
	xnBn2ObDFIDn5vZNuRXiBKG2Y218wNwgXz5oqgZRKDkPXE9jV60s1mgIqmpV3uCGVGeQo0v9CpcEC
	W8VWO1OrbUA9SXqKJdN4guWampYP8HelgQbInLE4aIf/YF8IoIZXH0/GPP7lShJX2xEdDfceyW3ji
	q68B1F6ZwWnBetaKwgEMRTQjx4GvYWbs4mglaHO0Uq6ZKZjLgGP6COkl6QDX+0Qu4y4I42WMcWjwB
	OTz37p3NZhz//uVBGiGynB8VYzIaIudpcOPiYnEnKLbzaLjWeo/VOcwiBtLDuIE0GiNREEeLzvY+/
	ILMvRDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1DOz-00000001NIk-0Ja8;
	Sat, 14 Mar 2026 01:02:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1DOw-00000001NI0-1zZr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 01:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0C7540377;
	Sat, 14 Mar 2026 01:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73374C19421;
	Sat, 14 Mar 2026 01:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773450164;
	bh=tWYs9DvU+mZ9LOVAyOnflvF29x67OnKqYeQPgwvkhk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HW3CN3RDbWA+xtGV5+q0X5flLSMIlP4UDcr0sHpw58UExgbzgaLZffft5PqZxZjoz
	 fdXAuS0ACArf5KBcnPgQrH27JvSnuro2JwKApqnp+R4PG3AkXpKt7K/cH+vY7Jp7Ee
	 B2t4WJUr6v5cML8RtKPTRw5pdElvD2OLBUE6VXNNoxtFNd49pL7qkvqNADoa3REIEA
	 9zyI2Gke6d/8TioKlqGFQoAf0J0eRXOBJ4nX/H1wYPHePY6n7l+h6I9lNIV5GuElMr
	 fGBXbj9BG5G0r8uIWbalHPkkBgKhuKBumA0WwgcPPRyRYFg2NrEXZv4p3VgQpISJMs
	 dPvzjrR6hPRpg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E13621AC52DC; Sat, 14 Mar 2026 01:02:39 +0000 (GMT)
Date: Sat, 14 Mar 2026 01:02:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>, aspeedyh <yh_chung@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	maciej.lawniczak@intel.com
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
Message-ID: <abSzrxJVcWi6VNTJ@sirena.co.uk>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="As7T8iPELD/sjSqV"
Content-Disposition: inline
In-Reply-To: <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
X-Cookie: Identify your visitor.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_180246_549711_0FFFE132 
X-CRM114-Status: GOOD (  13.35  )
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


--As7T8iPELD/sjSqV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 10:36:02PM +0100, Arnd Bergmann wrote:
> On Fri, Mar 13, 2026, at 17:24, Conor Dooley wrote:

> > FSL's appears to be there.

> I think this is just a similarly named device: Freescale/NXP's eSPI
> device driver is unrelated to the Intel eSPI spec but rather implements
> a normal SPI driver the same way that eDMA and eSDHC are Freescale's
> implementation of dmaengine and SDHCI drivers.

Yeah, SPI with a random letter or string in front of it is usually just
someone made a new controller for some reason (often a new feature, like
all the QuadSPI devices) and wants to differentiate it from their old
ones or connect it to other branding.

--As7T8iPELD/sjSqV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0s6sACgkQJNaLcl1U
h9CIOAf/Rrg0d27a/vhMLtPcEjSZQoXrrlz9ZUG/qs9V8Fvp+um7hK8PgZScqRn0
zbQKVJrMc2M25hSr6WGx7z3DNp40n5vwepJLhtVA8IGa+3IPMQJ0LchIGlrTVl/X
cgpRptD7myafQdktC0w1Lz2OafkIWFKxCcVj5jj8TCsjzlfwmIFrrCH8NbPGklhH
o309ZPAzFdOJNxV+h19WsfgXgIawJyZ8Qer7m3Ub4xSL6QvOk05G1nEqFDW6o2RF
uybGs9uOe2wUH7yBDIVoVhE7nPsr4npiTNG7zkvZRc4jtvb+i4mAgUbNtvuTzpJk
wCsgdWoq1QUE3wwIDdZFol24nhVa5A==
=FOG0
-----END PGP SIGNATURE-----

--As7T8iPELD/sjSqV--

