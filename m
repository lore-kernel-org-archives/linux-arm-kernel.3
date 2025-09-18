Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A027CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M93GVlkcKka2LY9OCUJg2tH+tSnNWBwTAftMb+Kx2VQ=; b=Z8DI09RSL+TEKa2N4F/xlE+sUK
	6gF7pzzQwzRl3QdVVolkdQqEpBNQkloUYekPR/R2UsxAscZ5U3AdKIhA8QKP2SJz1TetfN7RInEYl
	WxbENLGhxVSWlBpmRpGqVFuLo3xJKNixFAFW9WPmUhIhLqXUj6iWBZhKzpx2YIH8Tw8I49g8WHpRg
	MogUcAhqZuCSFFQy7y/xqxzA9yeDHT9UOyvNE6UC4TLmkpgVrKPsq/yFvN6I0bTIeIZ9kfbcZ0X7j
	Rzkdut1PNx7q1M/jfOTt0WPXqhqVRAnCTYhG14WvgTCWjgiVCs4zxsqHWlEPuC87cEgQBioX1bBpd
	ObaA7QyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCbC-0000000HBqV-0AQ7;
	Thu, 18 Sep 2025 11:14:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCb9-0000000HBqA-2tjX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18DCE403B9;
	Thu, 18 Sep 2025 11:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226F6C4CEE7;
	Thu, 18 Sep 2025 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758194083;
	bh=uqKLQL0kXPlTW24rRLvkA6f101bLzhi+v2aTGmvoekQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hY2y7E8oPFC4GuWcczzwCap37MRRFfXocXGwF5tfiob6nWiwEGmnk3ou8Ag/L2fOj
	 WNZP/y4IpK8Hr6/BlKZ9obj6KneJTH6b5m2Ms5TdqTMtv6QQt5S8m7tNeIM9FjxH+F
	 +xfQF7JOPk9XX5JZHhd+klKP5TiksKlVnn3bJnbEXMO+f4WZx97XuDpArSLa8tvB1O
	 dXARWNioqFc4PiD54+ZR3jVUYPKlbknmjL4sbyDa7u8PcqA6xUnBpyz5TbBnBjvDeq
	 DzGNAQqOi/yaQe5eobFR50ynsaNQ/Wzt4IWOyXQRcSvGSFkndiCumN2Jfsv7YC9g/z
	 uGkOtT69qz3+w==
Date: Thu, 18 Sep 2025 12:14:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	linux-sound@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of
 interrupts
Message-ID: <85ea3256-dd31-47b1-8e2d-a9d207b28fa0@sirena.org.uk>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
 <3d20d3ec-2f52-4cac-9c5c-fd2141a12a0b@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Rv2MdpZahqmMZwq"
Content-Disposition: inline
In-Reply-To: <3d20d3ec-2f52-4cac-9c5c-fd2141a12a0b@csgroup.eu>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_041447_758519_D75A5BFD 
X-CRM114-Status: GOOD (  16.96  )
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


--1Rv2MdpZahqmMZwq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 08:12:21AM +0200, Christophe Leroy wrote:
> Hi Mark, Liam,
>=20
> Le 18/08/2025 =E0 10:19, Christophe Leroy a =E9crit=A0:
> > This series reduces significantly the amount of interrupts on
> > fsl_qmc_audio device.
>=20
> I can't see this series in linux-next.
>=20
> I see in patchwork [1] that this series still has status 'NEW' but also
> state 'archived'.
>=20
> What is the way forward to get it applied for v6.18 ?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--1Rv2MdpZahqmMZwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjL6ZwACgkQJNaLcl1U
h9D2swgAgTsZe6lJbstmvGT3sE8IM/SR5DbwYbMqquiSJfASLpWn6+IpQ9jey7dC
rBQ/Kac/dqktoRic2n2MNciZbkk1DBkKn7U3giWJn+Lc2TEdF/2k3D8gIb0fTkOv
pFy2ITzlJpnJe41HMTRLT0Y+2MmjTmLBp6H5mbExn9AJ5RtMcXxAMDfCB5pqSWQr
nSzduldkPYgbVRrD+RbcTzbal6R/Rjkatm1QfAt5iy7K4cvZQmNIZEOrePIP/Mzm
nt9+XFbYZHnCTxshgzhYuJBgsik6w211UWlWYuibWrlvWW/323RrN8l46amu67bJ
Zkpxs4GJvx/WIEeyf0hmzc8A7/+Qqw==
=xpzh
-----END PGP SIGNATURE-----

--1Rv2MdpZahqmMZwq--

