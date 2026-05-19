Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3600CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=razt78RJ4CTL26eCw5dWKM6IJ/SOe1x3c5Yxz0/SgCQ=; b=rda8PPhQ5D5T1VXiQnac3cNok3
	7DlfKs+ngRYW/tEXxuHMHHigi0nwYIHSpcWnezbq1ym79x15x6Hh9j9ebgcNecWT2EAZFd6w94GG2
	V9W74IzMieQ8hFtD7Vagz5K0mLM23hg4f78r1auAHocPgNtb2bX7jSW8YV5w5n09Idsra8pBPR62W
	rczvx/vWhD0/I9sL1loe6LesMZ5zvV5uzTn8Y1dC5Zg1/QNNZtBm5j5rKe3/RFz7q6dqPCkCVdONV
	fRSNtNDsOih5NSzx6951ZVZaV/nVddxWcW4Y4Yuy0u1NMfI1twyoxSS0ngnelHKTnmeERkd98KPZt
	QzXDMQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKDr-00000001aoN-3TuV;
	Tue, 19 May 2026 13:10:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKDq-00000001ao5-2DrB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 719E96020B;
	Tue, 19 May 2026 13:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CC5C2BCC9;
	Tue, 19 May 2026 13:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779196257;
	bh=razt78RJ4CTL26eCw5dWKM6IJ/SOe1x3c5Yxz0/SgCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOdOU3mF0sL7xT9C/z85WgNKLpQ6jxiWj/zrLPnjXE8vjCaajzt63MSOQk1mpVBIj
	 lJGOiHHut9Oc2tI0SVHGtBN/6dxZIRBkYk8nBZ1WgysCnvjQZPwgYUswJjcY2LM/Xz
	 ciKDoWr6lGGLBJHGUUeqlH7ACcqL5QBWyWsjkvvPbNXkOI/ZFB7Kq8+WnLdsX7Da+0
	 f7kyWjVWcallJ6dmv4bZDU4XIE81J/IB2u+sU/OeMSFtl07xR7De0Ig55m70O/mONu
	 PEwgHDCmFIRAqt5MREHm1y3dvCaal1Tee74/JycPIDCy3NkCD+ytI5ydh4JolP6Uhf
	 +wRBbipOgSAzQ==
Date: Tue, 19 May 2026 14:10:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: "clg@kaod.org" <clg@kaod.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in
 calibration helper
Message-ID: <4efedd52-7b88-4b83-9982-89d921aa9bce@sirena.org.uk>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
 <20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
 <659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
 <TYZPR06MB520319C6F48144C8B8470740B2002@TYZPR06MB5203.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4rKxTD+lxMaCbrE"
Content-Disposition: inline
In-Reply-To: <TYZPR06MB520319C6F48144C8B8470740B2002@TYZPR06MB5203.apcprd06.prod.outlook.com>
X-Cookie: Huh?
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


--p4rKxTD+lxMaCbrE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 12:43:44PM +0000, Chin-Ting Kuo wrote:

> > This really needs () to make it clear what's going on; the precedence is well
> > defined but not everyone is going to know that off the top of their head.

> Okay, below change will be added in the next patch version.
> while (k < cols && buf[(i * cols) + k])

Sure, looks OK.

--p4rKxTD+lxMaCbrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMYVsACgkQJNaLcl1U
h9ABXAf+K7kfpALiXCtanzo+MPWvQBSK1tW5fmc2s/VpszEGZP67VABdJyyHdltK
oChTSEmox6yS8/PEfQxu67hYI7YrJnFiBbenks1PBcT6TlTm1v8g4axGlj0Z5nLk
MQQH3pnX03llGMnO7lqFW1oEM8P9WX5RDby1qc4lC2pPtumnm3dUBieJ3a1nJz6/
4zbxgf4g1wNJfjVJV/AxMYaamH04So7cA+dP8DRo9SigNChP2qsBrZUFwkKoTJxC
xMmfs37og9ilhbtq20PhSZvsNWpw37ZMg/DANqdFShGKkkKlha4QDmuxPP0wKbfI
wozX/aOtz84I5nXvLz5whlwPviaAMQ==
=2idF
-----END PGP SIGNATURE-----

--p4rKxTD+lxMaCbrE--

