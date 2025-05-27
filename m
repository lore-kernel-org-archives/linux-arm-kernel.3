Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03400C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3K86fNEmzLGXmR+LN27EJiuIkSaPt0ARV8IrPHQSGE=; b=dbxd/biDEKOMpxyU47gwpDkK+7
	n1LkTtLbJxPytFeeBmT2avH0ag4/Af43GllTHkcuE+52utAKYArGI/OWdjJ5n05mhLN1nxYNkWvk+
	uJU9mMizqozAXJHYUT3jdtyWN0tt+VGLITtqpLoQ21cpwuzSCPfxy5hXJi8PCg48DxkbLtKHFP73R
	mIVk3bmcModaZJE4zDm1VbtZfDvoiZKcKjY7LeyGGKXF8fiVAjM1VzrhvarBtNbsyqLaI8E2IxNxU
	qPxyG7qMI5IOP+qaebHRfl8VH/HLw2wz9i2/E0FusklfrixkHqFuLutDcf0U339c3fAxYOsqfdd0+
	k4KOYoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJv5c-0000000AuP1-42H4;
	Tue, 27 May 2025 14:15:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJv3T-0000000Au64-3YC4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:13:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7894A49FF4;
	Tue, 27 May 2025 14:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4886C4CEED;
	Tue, 27 May 2025 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748355202;
	bh=s1/Fl3iRmGCQlCudqjCG+PZ70PcwovATM6h2BAyhIz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dkn/sBqocoIftLHlFTZ2LSlb4tK30ZM9SKUm8A/A+h5H7XH2GqTiTqzc/tYvAejl0
	 LwGIrtc//qPJNWvU51AoNto0CnTUxzaHfxd6wY7i/6WskrxAZv9vI5rXySLi47l9ha
	 FTFaDaYQgxEexSY6vd5F1CAiXEuTXtpbisYVWW2EU9ddhinJhoOJCrXYqKL1PS/ETU
	 FdErHUk5oVgvfzMcfbxPOIV0UKzqiEQJk+Of/8t05Fb8LoS5gWg6m9uGNfT6bhnL0I
	 oFYM+7YuUq8g7x7Kbsqc8D0O2fy5PiLCrmYrhVNKMZV/daF9cXkTOZFMpu9/icjRNv
	 UG4yWwL98RTMA==
Date: Tue, 27 May 2025 15:13:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [net 1/4] dt-bindings: net: ftgmac100: Add resets property
Message-ID: <20250527-sandy-uninvited-084d071c4418@spud>
References: <20250520092848.531070-1-jacky_chou@aspeedtech.com>
 <20250520092848.531070-2-jacky_chou@aspeedtech.com>
 <20250520-creature-strenuous-e8b1f36ab82d@spud>
 <SEYPR06MB51346A27CD1C50C2922FE30C9D64A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oF1MzhfhQDns9knz"
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51346A27CD1C50C2922FE30C9D64A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_071323_954816_C72E58ED 
X-CRM114-Status: GOOD (  14.25  )
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


--oF1MzhfhQDns9knz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 02:20:48AM +0000, Jacky Chou wrote:
> Hi Conor Dooley,
>=20
> Thank you for your reply
>=20
> > > +  resets:
> > > +    maxItems: 1
> > > +    description:
> > > +      Optional reset control for the MAC controller (e.g. Aspeed
> > > + SoCs)
> >=20
> > If only aspeed socs support this, then please restrict to just your pro=
ducts.
> >=20
>=20
> The reset function is optional in driver.
> If there is reset function in the other SoC, it can also uses the reset p=
roperty in their SoC.

"if", sure. But you don't know about any other SoCs, so please restrict
it to the systems that you do know have a reset.

--oF1MzhfhQDns9knz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDXIfAAKCRB4tDGHoIJi
0gH9AQCRLkHk3neNHshJkYAPhnXtXcmS1T4OLHZhP/AyJZlligEAroQq3M9Xp8gF
CRE717jgbijLXCXCNR11jW1nOPCN7g4=
=2CfM
-----END PGP SIGNATURE-----

--oF1MzhfhQDns9knz--

