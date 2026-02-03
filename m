Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FABE7C712
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVuF09R28yBAKOCRs8ZYR/cKir4XvbtgENm3sNbzXZo=; b=PYZJ04QORdNXU7NQLFTr02YNlg
	HgNcE1TVNkGhsaarPriltFkFQOKUSRmY055sKMrlMNdjlbFjDEaMQTes2FdyPtjMru3rP+DpnvOLl
	W9G35EokVaIvMFj033bSnz47kPiQoVuYVijXQIhLNZ9AxWL256lNuE1d9KWoTH/6c8t0mCeyLQ9l/
	GctprdEgha7ijptrrODAI6dP5aMGCBs3gT9ukI/zUsDKRfcTvFn8c6mG+/usix5Qq1LZJ/gwFZRr2
	GT6XRI/6gVXXNFHc5tvdR/vz5Ltc1XJQaSt2QZTtHndL835uZpZf0Hh91j2C4mcPp8u4WWzJb18jA
	stpUC5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEpb-00000006Ylw-3tVx;
	Tue, 03 Feb 2026 11:44:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEpZ-00000006YlA-20so
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB5B243BD6;
	Tue,  3 Feb 2026 11:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3997DC19421;
	Tue,  3 Feb 2026 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770119068;
	bh=ti6GPfXzNrGebiZu8scvVNHPqQoAoCsZtWggvYnGPHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFhuPE9HDwbP/PkMm1QWhsjsU7JLn5zWS/AJ4F23F5pHWZf8gC2UR+aKK26fXoy61
	 BLF40m1IMUuQ+F1UpKqxE2JkfDBIiNe/2WnZDJJ5/cxs5JHgQuWZUbQ5GFLcgXLE39
	 eevqhb5BM2X8TxSDhvxfIUrQND9I/h8NDWOdjh/aQsMWgQRslbKH/45m6atMIGbE/M
	 EKOU35iN5hUif/Ews03PVJJcJ2+UZFlOlE4rWXk19TEYauOxkHD9o/i2PzHPSHxvaT
	 X3SQZdn2fi3K66EzloiTBgQHt9Fbr9WBdxfKTOFUVYqQZgDpy/wscSrZfcb+JpJZ/T
	 HjU8d86BUu6Pg==
Date: Tue, 3 Feb 2026 11:44:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: Disable CLK_OPS_PARENT_ENABLED parent only
 after CRITICAL check
Message-ID: <0cc467a6-2121-4a79-9143-71cce088bcc7@sirena.org.uk>
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
 <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
 <CAEnQRZABuXQsJ4-5u9uP8VM63of8EpiV1LcUxv_vSBuGT1uEBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0shkWHVSS9MR5KUA"
Content-Disposition: inline
In-Reply-To: <CAEnQRZABuXQsJ4-5u9uP8VM63of8EpiV1LcUxv_vSBuGT1uEBA@mail.gmail.com>
X-Cookie: Do you know Montana?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_034429_607345_A215198D 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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


--0shkWHVSS9MR5KUA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 12:13:22PM +0200, Daniel Baluta wrote:

> Would you consider please reverting faulty patch above as i.MX8mp is
> still broken?

Stephen posted a revert yesterday:

   https://lore.kernel.org/r/20260203002439.1223213-1-sboyd@kernel.org

--0shkWHVSS9MR5KUA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmB35UACgkQJNaLcl1U
h9A4Vgf/Uvyj2AFwDKOzAlFFnP32o0XeoeZeQhAYu73zomn39yZ5TAhVi2zdEG+k
+jbtloMu8oyjExk7NhheXUVhNgO1CGBDCtNp+JpCSw0kryE+HTXQnCgVS6cbQvar
A3uLI1QEvKw7m+QXLuHu05MQb8Kzzogo8BuY3l5pOTJXWt7pUKitzxIImoIdibjI
kDw77odABT2YgZhcVgLsWbiQhwcViOBdkIHNOIRFUhMG5RHHNWyCdy+OASgcVPmn
ifVPRUNXJ46vrhNnUYwEu+ziRTg0IrLbAq4ddsUMgb7CW08QIJYaRfInOPr9znkJ
izQGTgOS+AsikNGt+yoQiclJSnf17A==
=H2I7
-----END PGP SIGNATURE-----

--0shkWHVSS9MR5KUA--

