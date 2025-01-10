Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86135E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSAq9ftH8WS0Cu3Bt+E6Xa84rtG0m/mz4MYDXGMgD4o=; b=wBBfFKkByUvKfs/9dtwBU8lHdg
	07WV9PkNxZr4Hboi+NNtxm914vblAfhFefMKCFfOG23e8jXhUoOtkCSEefbJ+mb9GvLkNKhGFZg8K
	EeSNFzKSMhCo6QOLS0jfib1ed9u8lT5rwj1NYDkPEEwNMNWIqPv2jKj3FDPIyEdi2/FH74WaI/rsj
	xNW+a9loCVfVh2HSInNm+a0c0F+jG0aYs2AI8YcwpIEjOPtRAJLOU7fY8NPCmzBDniibwl5hylLqT
	mf3BHqzPSfnVUGoPvnu6u7qUZrYzzj17yEfyRJNk6n25BLVRH+RwqsdLYQjZowwp1BzlB9Vae8bOO
	9F6WmpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGqY-0000000FtOU-2A20;
	Fri, 10 Jan 2025 15:22:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGNO-0000000Fj9m-06XZ;
	Fri, 10 Jan 2025 14:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 521DAA4214C;
	Fri, 10 Jan 2025 14:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C0AC4CED6;
	Fri, 10 Jan 2025 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736520760;
	bh=aNCFEV4RXYP85CjPd7vNqTGzYYPEBIBQoTBIen40yHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLi8UcH9DGe79azEcqPclXToIx5qw10enSJS5mjJaQRBBZ+5CLBrfh7Mpi7iMW0TO
	 A/rbMrNTS+PA9NpBPcVMM2z4ku1oxppk3W6llOIBhZvOuDHhGVRljWiAOR1U+h7yFg
	 tOqGBw0ZgHBSqZRgs8RWqGihl1fJ89d10Xtujow1iFSpmcSQgrYpctK/HiN6tIbDI+
	 n5yG5j4ZixygYt6rjBddVkMwyc9Hf5TbHnNKtMpk9hIBLXmn5EBUF3ghvXFuOE1FRu
	 mrmh66XV3EANLgY1TKzwxSp7POGpX7PmaPlVbxRNm2IDDx7avzqsmJ+qIFj+4ZvpJn
	 l1C5E9zSehWHg==
Date: Fri, 10 Jan 2025 14:52:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 20/27] spi: spi-mem: Estimate the time taken by
 operations
Message-ID: <c9043531-c733-4153-a814-79aab387883e@sirena.org.uk>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
 <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
 <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
 <87tta6ag5b.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D5dtr3CwiZ2FNoyO"
Content-Disposition: inline
In-Reply-To: <87tta6ag5b.fsf@bootlin.com>
X-Cookie: RELATIVES!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_065242_196200_6BDFBFB8 
X-CRM114-Status: GOOD (  10.01  )
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


--D5dtr3CwiZ2FNoyO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 03:37:52PM +0100, Miquel Raynal wrote:
> On 10/01/2025 at 12:42:47 GMT, Mark Brown <broonie@kernel.org> wrote:

> > This breaks the build:

> > /build/stage/linux/drivers/spi/spi-mem.c:580:5: error: conflicting type=
s for =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct =
spi_mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem_=
op *)=E2=80=99}
> >   580 | u64 spi_mem_calc_op_duration(struct spi_mem_op *op)

> Crap, that's a fixup that landed in the wrong commit (mtd: spinand:
> Enhance the logic when picking a variant). I'll fix it.

Please only resend that patch - the rest builds and tests fine in my CI,
I'm just checking a merge fixup.

--D5dtr3CwiZ2FNoyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeBNC0ACgkQJNaLcl1U
h9DAqAf/Qrz25ymjeY3vF9YJzCAUUyBS18sTyjX0LHFtT3TgKFe5BYRlKvM8thbH
laiQ60LjJlTDfHpTNzluTCzAgMXm72nOcj/jI4aNjM++Vr/I/xwvVZWbnIH6eZXN
/6oik+AWx+8+dkg/KM9xeJmz1c7efDMcu1KPjM4jv1cuGHe/SMAy0HroYpo6o1+d
WMMbRDqbjT+aZF/9ZnqhOxl1+UaPqyhWYWMlmrT0HbsD+DGGfSXjiPKYVe3+gv7s
n3Oxrkni3O74YgOIN1Tg924Beg9+V7xFVjC+xdzZ0l/uY22fPkMHM+lVFwz9Qy0r
ZmvCpIfRn+q++xWYtiLBpITHKteMvw==
=Dk/0
-----END PGP SIGNATURE-----

--D5dtr3CwiZ2FNoyO--

