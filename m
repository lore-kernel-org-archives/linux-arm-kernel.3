Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39978CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1Ang/Ev5msbe29qUOK0afUPlJKTCWi4jjZ05SuuqY8=; b=lI/fv/S+6W8p5KoiH8M/pvV55Y
	vW2e/ATDr9/01TSOVqVoR9zJ2A53uIBIYXvnlIIvkdYn5Tw79uCEemKkl0NZEWFGQJDK3LalXlxps
	efWZtB6EhejSWKJpxgfVhkBRBCTEGHP6pIQh6s8tW2UxGiJPNgEEkHTfpT9SYY6TYrmw47UMt0h5W
	9/ZTCvEF9Tm4OJUqh8Gix4pPVmsgun3bncgVdaw5cchNnkLfZGRCObnGy1FMmC++8fBQbgy/Od4B6
	wFQ535IHhSP5YBuMnMSJXHMPEJ0pKQBZDQ11EMFRKcNSE1OTa3V+YQc1an+1Ola8ekefuSZLQe1Gy
	tHfgEuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnA1-00000006Vfk-1AJm;
	Wed, 03 Sep 2025 13:04:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmHB-00000006Kx1-1knX;
	Wed, 03 Sep 2025 12:07:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0CB16025A;
	Wed,  3 Sep 2025 12:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5248CC4CEF0;
	Wed,  3 Sep 2025 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756901264;
	bh=m1Ang/Ev5msbe29qUOK0afUPlJKTCWi4jjZ05SuuqY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixEbLi2A6jjg3LDOMR+jiLI0kr10I8xn9VvAhh0P7/z4DH0i1kyknq5gSkeU0VCh5
	 i7tl5kkxInZ+7hYu+tRelEpYAuP8FN2uFIlm5P42FO3SelGzylxnLKF/pNSR2m1aFw
	 RE/5Os5QrL3UByY4KoMftxBxXI8nABa43VeNvttCKTwJnSRMLLSkAAqu3VLPfLy7vD
	 AeMa8NriBmA/D6erdbbe4fr51rNUQY9oaQtg+HQjcR31u8e8fIRtxBTyJgVpc39MZw
	 KS0+rKXi8YwhnPg5XMTY+J7MPSqIPKFVJNPfLuAXIVPCyL2HDJsMj/a8wFJkAKiMQ+
	 b2BQwIrvDUtwA==
Date: Wed, 3 Sep 2025 13:07:33 +0100
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
Subject: Re: [PATCH v7 07/16] pinctrl: imx: don't access the pin function
 radix tree directly
Message-ID: <bfb9a2f0-92b4-4f68-ba54-2c01e93eee97@sirena.org.uk>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-7-bb091daedc52@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LMkJw+F2UT+cDaFZ"
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-7-bb091daedc52@linaro.org>
X-Cookie: You were s'posed to laugh!
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


--LMkJw+F2UT+cDaFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 01:59:16PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The radix tree containing pin function descriptors should not be
> accessed directly by drivers. There are dedicated functions for it. I
> suppose this driver does it so that the memory containing the function
> description is not duplicated but we're going to address that shortly so
> convert it to using generic pinctrl APIs.

Tested-by: Mark Brown <broonie@kernel.org>

--LMkJw+F2UT+cDaFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi4L4QACgkQJNaLcl1U
h9Cofgf+Nx2+OT+tp4D5FUxhtTOmhW7sSoV0qG4ncMEPM9CqTpXL04wbbzyJxjJi
x44Lzl7dhYejlq1ljZcrLRtyyOEx2GJmVq+XHynLGl0+WRR2yx5BIF/VZUKrpjdp
Rd7Wd/4PDIWu+9AdKJ05UjqdXCojpVhxUDMFoha24910w0dlC3/GOS+5CLd3t5nP
o8DekdJ0fH6kx1PD4bw8qgA54bkwX/A1xWWTNxpAg/4zlmNuqFrT48Nuyz9AxY7W
KRh+JFWffC6f3gBQeYYoJOJsaSojIuYpDVDTTwkkrtr0ZmxbYGan3Gfw+uDC2O8W
SI38WHTPgNA+BpMaBE3K/SB/spudUA==
=Wljw
-----END PGP SIGNATURE-----

--LMkJw+F2UT+cDaFZ--

