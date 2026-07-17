Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6329C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGlp8KZfLYz11331+0ua0wVaurpq8y2M0MqWFjk1jXs=; b=BGf3WOMUIlf/THxZIfVZNdvlg7
	TlREyhiWcWkySA6USLggTLFqNf2MSiV6A87MErEV2a1Ikhki1FfHYfrgV2K7f7WWBUSTnpMCTtOJf
	wT+AfN48VDA9gwGxyTxNxe1tHnzzHas49Tj8rs/309AjZQiHLWIfx7Dn1ASQ9e/WFIRvtngLAZ0PM
	Aj236gcBf9ZWotz/8dfiwLD1vs599EuWBKgqdLbkqlguWC4dE6ENMKaofaLGsBdU4FzGxNcwFnoW5
	vHDKl/+ajY4Wv9nVpAJLEUYycvUVW5LTArB31OirXwz+Ia9W5Sa5vRurUWyHsIGXmTIpjsxNt9chW
	ZemU1VyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkidw-00000002PWV-1DOP;
	Fri, 17 Jul 2026 13:30:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkidv-00000002PWO-2Lwk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:30:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B422160A63;
	Fri, 17 Jul 2026 13:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428991F000E9;
	Fri, 17 Jul 2026 13:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784295018;
	bh=xGlp8KZfLYz11331+0ua0wVaurpq8y2M0MqWFjk1jXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bWT+6Yueqif1X8QSrCS/ZX6DeC4Za6wMrL2MP5Ja+A4VPCHjiKwKYQQYS5XVuOdQ7
	 6ArHvy8jgE0hlfaCcffwEa2J064Hcg3ANOX2FC9gc0ZracEmvfLSULIt/hAXN3WiEQ
	 3i0YENaaf8STyLMIU/I2P/h1LN6kSM06ua4xAaZlCYEX6GDopc0jlD1Y+GitZHjFoO
	 MhQdSVkIe2zoaZXL/ZCI0pA3BVr/i4sK8+Gr2aHQ+m5AmNseqwbIs70qAev3ks5trQ
	 gLipilHwmPxInoCejW4/kAW6sHKZbNklHP3N6lflKI8JSNrwbKSExn/l9O7c9pdGMk
	 xq2d6C0cGTMKA==
Date: Fri, 17 Jul 2026 14:30:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] regulator: core: use system_freezable_wq for init
 complete work
Message-ID: <60e9bf03-0ef6-4851-a725-dfa8c4ecbbf9@sirena.org.uk>
References: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
 <20260716-b4-regulator-pf01-v1-1-8c1519d54bd4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P6LhjmYohIZAHzyR"
Content-Disposition: inline
In-Reply-To: <20260716-b4-regulator-pf01-v1-1-8c1519d54bd4@oss.nxp.com>
X-Cookie: Enjoy yourself while you're still old.
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


--P6LhjmYohIZAHzyR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 11:50:53AM +0800, Joy Zou wrote:
> schedule_delayed_work() uses system_wq, which is non-freezable, allowing
> regulator_init_complete_work to run concurrently with system suspend. This
> work fires ~30s after boot to disable unused regulators via I2C. When it
> races with PM suspend, the I2C adapter may already be suspended, triggering
> a -ESHUTDOWN warning dump.

> [   33.707233] pc : __i2c_transfer+0x36c/0x3c8
> [   33.707240] lr : __i2c_transfer+0x36c/0x3c8
> [   33.707246] sp : ffff80008239ba50
> [   33.707249] x29: ffff80008239ba50 x28: 0000000000000001 x27: 0000000000000000

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--P6LhjmYohIZAHzyR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaLmQACgkQJNaLcl1U
h9B6ogf/XG2Pr96VE8Ouwqc4bzyEa7GUAJWD053fEs/8dvoOCZVgSzOpvk7tTgsi
jlK1LKZLFGtzRsGSnIqPxq4Q7o6un1/f5hl9x4u3dMhowtdMCHua8LDA83lMuR+r
CU4xLZx8JiOK8gIpq6RKRKI1c8ZX6GqkIbg+I5rCMBfUobrMAR2zrFoefkyB5n+O
uI9z9wuwOoDRyZJzQge/wni+iqUTpWyQK1pxJPfFWXTWJosxjeUhxQN26DpBQoUn
D3uQFlENsuNvZOeRw+H13aisKiElYscf4HAHf9fGrxkIkktnlY/4hvWLPhvuC+Fw
ozhvW4l8JNLLq7kpeZiwIXxfP2ZUpg==
=y2j4
-----END PGP SIGNATURE-----

--P6LhjmYohIZAHzyR--

