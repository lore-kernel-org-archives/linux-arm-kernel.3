Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D537ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feIeFoFe/NIkaHWsBJ6sykJyPk/bFO1DqGerlF+Pkfg=; b=vaqYK8J/6luuXoYmnZstsezTcG
	R9IcagLl55WJnXI2cCO1BibgVRvNSMv6TBbClMt7Zvvoe8+OSlkT4KeXUnFWVRjbuWRX4z2wK3wgl
	xAfEb14/NalZP1Tt4+2V13slo3jMbdCYRTsDkke+wsWce0wRKmo7f/0slYXnc4HAcKp+QjGsv1vnB
	pBUzGL3tRZHV1P+rdJxblwtsHZfcj7CAsxMaL4u9t0aW2dhWYRbVUSh4MI4tYW5GgkDeqlmHO+fVv
	KcvcDwIYf9PnQfkztJgPWi6I4CfXOVeKalSeIqgo8/kdxl4zGlrDWUxp45AjJ+12LPlQzrC7j0Tna
	pREgMn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1h-0000000FCgs-3jWj;
	Wed, 27 Aug 2025 11:09:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDI4-0000000F2va-2pVn;
	Wed, 27 Aug 2025 10:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E3E344A47;
	Wed, 27 Aug 2025 10:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E6FC4CEEB;
	Wed, 27 Aug 2025 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756290123;
	bh=feIeFoFe/NIkaHWsBJ6sykJyPk/bFO1DqGerlF+Pkfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMY73patfhFBm1cWrO0GjSOUppBTmRm9w9tK3Op5eYvw95EorabzAemE8TKMQjBN0
	 AFJLkvpc/07xvzw49PtfcXgo1jyfgqSIyA3tv8EQho2HxgcPu5RJ7YIj6+5ZO0Jjfj
	 ejeS0GRY1n7Mq9lcoiSrFgud7UC1CHzgBEAzXF9wgw4H35uLjqwGgcAgwRdWTSnps4
	 uVbcQD9zxttmWF0K8GiZTPHDS7eDEZN1k6CLQV5sYnoFYmqneHGPBxowx91U05F03k
	 g5jrxQjovkqZ6CO/JHFUeS2pHASrfBK5fwYnJi/a4eamilP7bDZYeUuhHoJFoX+o0y
	 IaB8i4S88yEdA==
Date: Wed, 27 Aug 2025 11:21:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Message-ID: <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
 <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cfgNcmAX2xoMgwh"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
X-Cookie: Most people prefer certainty to truth.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_032204_750118_3F7AF8DC 
X-CRM114-Status: GOOD (  15.53  )
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


--2cfgNcmAX2xoMgwh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 08:19:37PM +0200, Bartosz Golaszewski wrote:
> On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:

> > > The qualcomm 32bit platforms fail in next anyway so I dropped the pat=
ches
> > > for now.

> > FWIW the i.MX8MP also seems to have been broken by this:

> I can't test it unfortunately - would you mind sharing some info on
> what's failing exactly?

I've just got the log I linked above.

--2cfgNcmAX2xoMgwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiu2/8ACgkQJNaLcl1U
h9AN7gf9EwrkCMDKQJ3+l64opijlSNrt1Fb1YRWh9KvdN/1+7aQ7T/xu5C8tCq/f
8Egc7c8xmS27/9OO0NDM90NRmoDvRBfCYsrX0yqXzJ/SMQ27wrw9H/OnNqrrq9V1
OU0NsJVeKrt5FELD7Zd1UbdrMmQXQlJeWx80plpgQDCxBzBliPEFiSg3OkTc+mqd
Ef9KfjLAlIwsCVBOC1uwPq3Z0vsIDMzbxXq/e9R6nmwhHZMI3puSNp8ZmUBXBSeq
D8k41vgIAo2YLmAdLfeiepGWT3CcfFlmbEHdeRIRVUS4zoUK0u0/OIedQnCwXknI
ucg20UGLpA7K1JhJlA678HGIBlpJcg==
=VNoC
-----END PGP SIGNATURE-----

--2cfgNcmAX2xoMgwh--

