Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF86CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 20:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/Ug7VqD/kAYHAJQDi9yvKwq4BwPGbWmkyV5KEW5Z6I=; b=3Vjm1wvdJg7+KrJAv4zYWgIILn
	lAxfnY59qEeSEblcYMzw3Us2+SNz7J5M3K1FFDiy/VctPk+YqqfDBWd24OWJdl99PO4TFV77uMgHd
	PqYVviRMVKM0CUy5nXVl7UsvnzgSfdxGu6lLPTQSOsxg4NI+ti6xiLuoqozWYTiU1NKUoXTmodcVq
	ka0VXvuszDMndoWlXEbvrqxI7wn10hL+RzFZ2MVw68d/9Bkykw/qEtBeCzyCGiz+PPIQhToeojF7/
	R3YrptCj/eQvctdoZBzxYVbqC7Ft01W9KIzNbx9VN9W+hXfNr/om7hdvM3T6ST2zz3ndEsa916oRJ
	Y5xHAWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mgu-0000000D78Y-21I6;
	Fri, 03 Oct 2025 20:47:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mgr-0000000D77Q-3Tbj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 20:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D1CC40522;
	Fri,  3 Oct 2025 20:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7302C4CEF5;
	Fri,  3 Oct 2025 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759524464;
	bh=s9KdYwHxtmjq+rq4sojwwWTmmqYjg09bj3FGC5XSE/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6y11QK15ZptdWlP41qvreKP+B3iFmWUFkf3nCrbM4xwYUYyG9tVcIfnLscTKs9PW
	 RwKJdiQ+tHjDH6b4QYRIPTDqNM1yRC1FmVnI7xpckDbCDby6fRJDNSGLwyLmrCsMuJ
	 +EnsN/amGGUjz9mlYR90GLkIe8Xf6BfRBM29dgfEz7TqOURUVnmmusBn7haFd57Ot2
	 pRVOlOH8XaUsiBM7yX3x0MEUQ2jBX1e1ybH0Ls+ivJbWVIQPu2cA3CTiSCe+rGIG1t
	 6J2cK6X8+UjoK3QC7jNlBcjsU77FGfp8OKFRtwyDzKZpBWDFcBKhusG2TosjL+rhPj
	 A7mRq8QKyoYMw==
Date: Fri, 3 Oct 2025 21:47:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: clock: Add AST2500/AST2600 VIDEO reset
 definition
Message-ID: <20251003-gestate-roast-37ef1b1c2e07@spud>
References: <20251002095651.2211900-1-jammy_huang@aspeedtech.com>
 <20251002-accuracy-gloomily-a3e46d5a3f02@spud>
 <TYZPR06MB65687E6795F9C899B3F067CEF1E4A@TYZPR06MB6568.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1VWs/xU7QyzcZvNl"
Content-Disposition: inline
In-Reply-To: <TYZPR06MB65687E6795F9C899B3F067CEF1E4A@TYZPR06MB6568.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_134745_886990_951CE6DE 
X-CRM114-Status: GOOD (  19.29  )
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


--1VWs/xU7QyzcZvNl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2025 at 01:50:46AM +0000, Jammy Huang wrote:
>=20
> > On Thu, Oct 02, 2025 at 05:56:51PM +0800, Jammy Huang wrote:
> > > Add VIDEO reset bit definition for AST2500/AST2600.
> > >
> > > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > > ---
> > >  include/dt-bindings/clock/aspeed-clock.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/dt-bindings/clock/aspeed-clock.h
> > b/include/dt-bindings/clock/aspeed-clock.h
> > > index 06d568382c77..421ca577c1b2 100644
> > > --- a/include/dt-bindings/clock/aspeed-clock.h
> > > +++ b/include/dt-bindings/clock/aspeed-clock.h
> > > @@ -53,5 +53,6 @@
> > >  #define ASPEED_RESET_AHB		8
> > >  #define ASPEED_RESET_CRT1		9
> > >  #define ASPEED_RESET_HACE		10
> > > +#define ASPEED_RESET_VIDEO		21
> >=20
> > What's up with the gap here? Are there another 10 resets missing?
> Thanks for your review. I find this is just an index of reset map. I will=
 update
> new patch later.

I don't know what this has to do with the question I asked. What's going
to be in the update?


Cheers,
Conor.

--1VWs/xU7QyzcZvNl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOA2awAKCRB4tDGHoIJi
0jDmAQC9H6FC4Z5rZxCYUvmj2W55k+/oKnx/O91NA9fjEXpn4wEA1EUm7O+71S3h
KO0JSohz5byNmEAy5MoQILoMqD6k2Aw=
=MtpR
-----END PGP SIGNATURE-----

--1VWs/xU7QyzcZvNl--

