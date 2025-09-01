Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57062CA1000
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDBs7h7WrM7l69Eva8SJd0Cr/dn27ADGm+SkuMR5gmc=; b=phO2bpEzcscMXhLgSrPALepu8Z
	CTV0tQBByf+yoeZyzQqsLub/0AGYManSs2Zx8xklDrMvxm2Ty0nXb9QQYyUzbmQT1uUqQWD5lAeoE
	zzl4X5GjhqkPXeW1BVGmINTIxK//jFWuDlMAaGZOI+ENldNA+dn3WTyxNi7FhnsjZ1IAG061XzoEU
	nrwuufzP/YV9n2RRq2OrX7Llot5Yf8bqXp1BSCKSjMt/IjvLJND06KH+tJVylzSTvxB2apKaFGevD
	y+XN2EJ4jbW5FGs7C5zkYpyL07ZJBI2L3IXHr55hvoy1K5AO+WpVIoPACsaUCy2d1401RglITV4R8
	zPKvQCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8io-0000000DVOd-1uSU;
	Mon, 01 Sep 2025 17:53:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5fF-0000000CrBt-1lKD;
	Mon, 01 Sep 2025 14:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 939CA60010;
	Mon,  1 Sep 2025 14:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91158C4CEF0;
	Mon,  1 Sep 2025 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756737464;
	bh=gIvp8Vp/E1swy4wyBXx3jb2SoCxt+LuCiS4lw6AuyVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJgb866OavVlQXKjEcSDRgX01RL+TgYXMilYRhox1DG2A4pbmL/EMuUOSPQkhKm9y
	 ZvbgzuWzlkHcKChIVmdcfSamTbXnIcObi8vEvl5/9muDCgJpxid02CByyOsACIh1yU
	 OKX98+D8HARzpuduhCAuxsNQWh5qbLNOOQS83t6frONv3iLVNfsFrehXLjwvOHBqVS
	 gJYuwaea4P7AtESKCzphgnRjeu3/3j4HbVoPTYqH34hpPGEiqkEowrs9BdVtPLHybV
	 TE95H7tVbki8s9jUEg4vMUHVN4eZ+ZaHfW6KZvrIPhItfOg2iPgxsvk5RylWjzgxwD
	 tuJt2jvYGPKOQ==
Date: Mon, 1 Sep 2025 15:37:33 +0100
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
Message-ID: <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
 <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j8LdXSlZH7SdW4XI"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
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


--j8LdXSlZH7SdW4XI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:

> That's not a lot of info but it fails in strcmp() which - I suppose -
> is the one in pinmux_func_name_to_selector(). Any chance you could
> check what the value of np->name is in imx_pinctrl_parse_functions()?
> Is it NULL for some reason?

[    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl

https://lava.sirena.org.uk/scheduler/job/1758947#L705

--j8LdXSlZH7SdW4XI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi1r60ACgkQJNaLcl1U
h9BW/wf/VkjCjvE+ktBljc+ZJ9dT0UQZrXYUDHUyuCETxomTnFA+SILt5aJ5bGe/
iD8AWBpbbDsJH4vnF0ozS/kwuILQKFDettcRtaH7dIBsn/izkOQipQk8GdpbQ8WM
hWYcC4httv6HQ2rMJMgKMjRxy7L5L6xf+VRzgPc8X+0GfzYeCig6jLv6tX80PLkO
kOxJn1iP3VVHkXsDCw2fENaiXRuUOaSlrbwkkvBihKNbrM0499j/uQ4hwqAT8bTa
9ubBJhS8X9FGO12dl2qkEJPtjal2M0Vf4H4PoJilobNInq/WByIDsQANxJC8XDhG
4/h5vZiPNAzd8Qj8VQAkfeNquySq2Q==
=Lt5F
-----END PGP SIGNATURE-----

--j8LdXSlZH7SdW4XI--

