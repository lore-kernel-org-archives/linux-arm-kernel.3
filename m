Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF78C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cr7kOpBeEmjU58lN9waN/hhTA9O3udOAM2Wdfip/lS8=; b=TYHW0ckeXRpVV9g0jQ7erMXn4D
	X5GK3Ukl1a49rbE0+7rRJ5jMdNmDlfSOb2wKdkUs408orVG/HQV5xw7Tr0kwRNjpwHnnZrmz0pSlu
	utRgYQNap2wUOZgQu46Jxv/rRjPBaOCYzdb+NOCH8ZCKrRPFRtmSAeAeayILXGsO4AK64X9S92OxZ
	xiRw8OCjAiIebSMyI0WqKsZbo+zaoelkRVj/+RJZla4B0FOB0jn364TF0bFu+FWVaAdv6rqIKW8o1
	Vw/ItRFW29suGmzKdtqB9UsRblPj2RIgA5BT5T35XeldcD/ZzvlBq0b0Sf0c+z2bRs73lICeBxyH0
	fVd95jAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYr8-00000005FBP-0YmS;
	Sat, 10 May 2025 01:18:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYp9-00000005F4q-1Boe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34571A4D68C;
	Sat, 10 May 2025 01:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441B9C4CEE4;
	Sat, 10 May 2025 01:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746839777;
	bh=Cr7kOpBeEmjU58lN9waN/hhTA9O3udOAM2Wdfip/lS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biF76MiKuqAhCnaxuiCHsh4idFRdF83MXH7JHmY0miXb6cTuwcyaXkuIWIbVSXWiz
	 E4Ei0ZXiwVo7DH/NvXmUcNCziKyf9DBeJ1G61gxMY2datbZ8W7qjTcO5ma0Rlx4qB7
	 csLVWI7j/TuRbOGV1Z+sUAqvACQfg9IGr7KOdX8bTFGSOIuRJ++FHj7tMsjB8JV1IM
	 RCwQPTbOHm7UkejiTBp/Awess8EYmcxKou8SfzyHugqLwbivoOAfirgjby5f0iL7p8
	 t257YG9c9nxyF4ChwTnjTycxsBV50W1E4YL08zJ2OXU9oGw0++04h5S3O4sJUvX8qp
	 xLc/8jRr42zXA==
Date: Sat, 10 May 2025 10:16:14 +0900
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com,
	arnd@linaro.org, andrei.stefanescu@nxp.com,
	dan.carpenter@linaro.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xulin Sun <xulin.sun@windriver.com>
Subject: Re: [PATCH 03/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
Message-ID: <aB6o3lKghAMAasMC@finisterre.sirena.org.uk>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ixuD5kGB4Ce7Ycqb"
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_181619_453986_BF5BE1D3 
X-CRM114-Status: GOOD (  12.33  )
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


--ixuD5kGB4Ce7Ycqb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 12:05:50PM +0100, James Clark wrote:
> From: Larisa Grigore <larisa.grigore@nxp.com>
>=20
> DSPI registers are NOT continuous, some registers are reserved and
> accessing them from userspace will trigger external abort, add regmap
> register access table to avoid below abort:

Fixes should go at the start of the series so they can be applied as
such without spurious dependencies on non-fix patches.

> Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
> Modules linked in: fuse dummy tun hse sch_fq_codel openvswitch nsh
> nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> CPU: 2 PID: 18231 Comm: read_all Not tainted 5.2.33-yocto-standard #1
> Hardware name: Freescale S32G275 (DT)
> pstate: 20000085 (nzCv daIf -PAN -UAO)

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--ixuD5kGB4Ce7Ycqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgeqNsACgkQJNaLcl1U
h9ALtAgAhqoLROAk68XqIAIUNwakSx5Hu9BxJ02NLgTZGWVExJnivI8g19E2t1UW
oIwWu+532ZBP+Yoj2J9umF8bs10ztAJk7d3QhQyqZnR1lWYEw8RPesDJBQWz6/iP
sgyr70mJ/x67QTyB1KDd7DYLyJwYvCYhO44uhB44ggCmWZif4Gy/bhseqGTlU6V1
G4gS0LeM5ycTdwnvFa3Otw/I+u9faB/AhgGzgZEQM36lEg5nRy0FFKHIlCEOmelm
Sk5ql08Npgra2J0LmPTf0NSTA4BMj9+D5tIU7wnl95ZugOD1AvJFUKNguNiqpeEV
4Xar4GrEAWnBeiSjtReU+CO52H8c5g==
=47Yh
-----END PGP SIGNATURE-----

--ixuD5kGB4Ce7Ycqb--

