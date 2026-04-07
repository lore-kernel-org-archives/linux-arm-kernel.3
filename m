Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549AEFEEF29
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81UCFkPSusex4GmC+Y85/hvgzegpWkjrUV5/bZWlTZ4=; b=0SY31m2jveR9n2kOehUYQ4aVi9
	QePaiaGWq1EGB9+nNYP5A47wTxrMSDicQY04iK9AAAHIujRcw8GWcLhFRgKF2bvL4D0IBo+OAcFMV
	IrwdPfy8m/P4znJNsy2p+Rkbt5PkpiLVr+xTtx4pHEnGlUsjXdSYkUbt/1EcmjsTK0HOqGkt1lbRm
	DUuPRuf6bWADLTJyec4WHcWLViN024wI7MbuzBkV6wy9GFtxqX51Bh7Rn/umsDGRLM97meU26c9sm
	45bv+mv0pQJKLLtLiZPBIAtHYw0grR0ersX9UPtcSeDeirmGmKHVJ74/ygwRmtt1wtLjqb0UCIMse
	rh3kaayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4zs-00000006PBk-1i9s;
	Tue, 07 Apr 2026 11:53:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4zr-00000006PBa-2M0B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 11:53:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FA13600AC;
	Tue,  7 Apr 2026 11:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EC2C116C6;
	Tue,  7 Apr 2026 11:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775562810;
	bh=81UCFkPSusex4GmC+Y85/hvgzegpWkjrUV5/bZWlTZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbLU9v4/cc8KfvMORMKJvc7+bLiwyXRd6uznC+lAdS3kbTUKst3sBSyYCGZmzIFw9
	 7wDsmNDskDfqoDlItODwk6V8XJlVdrI5DRG6aRj4E0yk17nygbakM27gkK2E1ZSv4O
	 cg3Oi+v2lNH5RelVAYSwauSPudm6l1/gNcRR5fdYhIZABRHWnlw4o71+zlMjx2s7Rw
	 7CzxDlQGZA8IAF05jiQf0cJNMx2XGD4bN1JgKOj8i4jm+Ujcogsx5bcrGP/1r9Keb2
	 t9wetgw8kk5tcc10SH7h2UVYfmmoAiurw8Tv7nZxRDdFOGNPeJ10rccYdOhNlyY1wq
	 Sc5vn3I3uimGA==
Date: Tue, 7 Apr 2026 12:53:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomasz Merta <Tomasz.Merta@arrow.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for
 DSP_A/B, LEFT_J
Message-ID: <9b0a5620-b075-4808-a033-8e9171341a36@sirena.org.uk>
References: <SA1PR04MB8467F5A56C565316DC5C1EF2935AA@SA1PR04MB8467.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CDtN4iSQoPsycoIG"
Content-Disposition: inline
In-Reply-To: <SA1PR04MB8467F5A56C565316DC5C1EF2935AA@SA1PR04MB8467.namprd04.prod.outlook.com>
X-Cookie: Now, let's SEND OUT for QUICHE!!
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


--CDtN4iSQoPsycoIG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 08:06:01AM +0000, Tomasz Merta wrote:
> From 553c09cfa84fa801fbd8dcd5c9ae96e94a54ee31 Mon Sep 17 00:00:00 2001
>=20
> Tomasz Merta
> Software Engineer
> E: Tomasz.Merta@arrow.com
> Arrow Electronics | arrow.com
> From: Tomasz Merta <tomasz.merta@arrow.com>
> Date: Fri, 3 Apr 2026 10:33:11 +0200
> Subject: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for
> DSP_A/B, LEFT_J

It looks like the tab/space thing might've been fixed but this is still
very mangled...

--CDtN4iSQoPsycoIG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU8DQACgkQJNaLcl1U
h9DyvAf/Rt2CH1P5hJqmRtVbipB1zP7s6plYwyWWK4scyfs22d0+G+bPrVM0h45A
ye3OsFSPEKhSfQLwziSEcPSypARuBZLnrxOaQxuK0NK3GjusOk+AAcHJSggTEUsc
dswtziesZx+XCL5KhNP+SsdazSk/bXityi12kq4bVO2lsH0jTqnmpt2PtFuihrG+
PIOD09BXCI+K8s2rqbNZnDX9OzicNPCmDml/11048YzX8gEN5glo5FiWwKOtR83d
gFnj3G5DqBdBTvZl5qSUXv8QWRk3nSVFsqaYjRa7ek6BCa0nEdK7u2LN2wDrHkx6
n/8mvu5s2y7hBttzz9c2cBCdWcOOdQ==
=m0cC
-----END PGP SIGNATURE-----

--CDtN4iSQoPsycoIG--

