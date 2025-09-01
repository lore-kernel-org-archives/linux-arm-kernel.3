Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6744CCA1006
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaqFO0sDHbyFDKUxJaISMy1ULYDKTNlohIR8NfBhEDE=; b=qDs8FxMstUulG7eAZiP+o7bvxe
	XFz30x1WuEKtlUYHXbWxlGL0Jgv0UYXktqNJTUD8mShvMicIdNdzYkwT3btpQCW0AI/zJ/zkrlvrN
	Aa8chkXN+C3oNpXLkaj3a68ojJ+GyQIaoseD4M7VOa6yaJgZJhOQDSj0ZGId/Ab7Tr2ZURyGyuGR/
	CgrymyDJPbsvL3sZ760iMA0dOP3MZIKIqAPDp5reFsNrxBSDdhLbTyxdC+c5baiOvgEnf972MjtiG
	8T0cNXr5BSE8xeJuU1/PL6eLjZdGTLAAPAZhNx9qqDznl7oNe3kcRVOvfrP0pLi0hXM1uoB8sv8Lt
	itJrJYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5od-0000000CssC-2XRS;
	Mon, 01 Sep 2025 14:47:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3JN-0000000CBwQ-0N5e;
	Mon, 01 Sep 2025 12:07:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F27CC601D6;
	Mon,  1 Sep 2025 12:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750A4C4CEF0;
	Mon,  1 Sep 2025 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756728419;
	bh=KLozvW2/PZEE4MLEPg7Ckr+Jd7gWELOn6bfbOk7IAwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=subnAYt3W6iRYWiLe4R1hyk02hHWugF12CkdwNtfWO6oweESVzkr4HHQSgrGdK/hQ
	 8F1KuLkxbirhX9eTa+UlHzROt6oVHRMDVtFWN5s14w38M5Is6TmFeJ5JJ8je4krspg
	 pBRIf5eDDzE+sPD131SIUvsN9YtFG8xjdavT9OTqqYxDYZRUulC8RH0fZzQh+efv6M
	 zm0xO5wdKFGcsgmWDEVbNVw84C2PinGI3Z8RXMoIob2mUpV8kkm7QMdnJyTfUcaJ1e
	 cCDoP5GnBM8z+lPd7plFSP8PsGAkGVMDl6cqmwfcIkGDifWC/YBbKkp9x6hig/ZOBh
	 elTOdLAEWl7eQ==
Date: Mon, 1 Sep 2025 13:06:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
Message-ID: <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ck2hWlO4+9LtMqEh"
Content-Disposition: inline
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
X-Cookie: Auction:
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


--ck2hWlO4+9LtMqEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 06:00:14PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The radix tree containing pin function descriptors should not be
> accessed directly by drivers. There are dedicated functions for it. I
> suppose this driver does it so that the memory containing the function
> description is not duplicated but we're going to address that shortly so
> convert it to using generic pinctrl APIs.

This is still failing for me:

[    0.628221] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000000
[    0.636506] Mem abort info:

=2E..

[    0.801855]  __pi_strcmp+0x20/0x140 (P)
[    0.805704]  pinmux_generic_add_pinfunction+0x28/0xe0
[    0.810777]  imx_pinctrl_parse_functions.isra.0+0xf8/0x4a0
[    0.816289]  imx_pinctrl_probe+0x404/0x520

Full log:

   https://lava.sirena.org.uk/scheduler/job/1758025#L704

--ck2hWlO4+9LtMqEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi1jFcACgkQJNaLcl1U
h9BGhwf/dS46HMJilXSgdHmEKJbp5ioFAwW8a4pof2TF7vY7Jpo/qiFqnKkvqhYC
tZO4exJFROsDCUKlVPp+Qawyyhy3CCU2p+vHcuz8p07gmzIEOw9QkjMf8IMlPGyA
UKEr+nQae21YF/iNRFDQGH9hqHAT76YwExslci+ilyDzaJeWu6ACPhVMFMNO9a/q
BjCieo2alJTBGdLUFgFDoMmVmqebVqIBYO0m966vo/efy8UG1BTlGE++FYa1OVnt
bVDlzyyNsdl94L6s8pxhABsajGCsOXj0inSK7SXdnJ4XusoEfuSIKKSieCGsjMEG
qkdS6DTMFfXrzPQZI5S3dgsmyVchug==
=JXXf
-----END PGP SIGNATURE-----

--ck2hWlO4+9LtMqEh--

