Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C68CF65E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMW3xln2MzGP70duAqnJmh3ux9jiSOnAfn5MysH+Zf8=; b=iYXebMM3pew/O0hsOvph/DfAU2
	p2PmRDyxsy9wvAwZ7A/i5d+TuJUflT1QQNJbKWKBWLbGNMwpmeZ3o1oFBmvP40+ib2j9TOesSuaJL
	hiJx+7oNlmk1HwVoQmeATP+VOJFRedAXwCjNYGz64DJo9flZGpk48M9fPZVMzxDD5wGr4EhXH0G3O
	UYaMao19Pwo7Cm9og6Jp8ABslIGO4revx1GIHRM9dZhjDBMORF7E8/pEFp1V4j6u3CfRHteyVZTFV
	IIz72dGk5yLK3F/yMm/7yFeOnWNFdgO5ebvjpgZ5CzE/rgiqeKFR6SMbovHcqNlfHtFyDYGWnfhjG
	sFBfmzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKto-0000000CQ55-41Cy;
	Mon, 26 Jan 2026 11:36:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKtm-0000000CQ4j-0wam
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 11:36:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C169443F79;
	Mon, 26 Jan 2026 11:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8ADC116C6;
	Mon, 26 Jan 2026 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769427408;
	bh=fMW3xln2MzGP70duAqnJmh3ux9jiSOnAfn5MysH+Zf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWCONtom9UR35t4Jjg3grUOMwMwuvzMOJI1zIHbZ2/aygSZ4SaN2wxDn2cy5JPlRo
	 o0KIKUo529wIjKbFgV5xJIQiSrBq1719FvNQ9QMesPN/ke/CKDMjXRefGv49uttz7M
	 qr1JIeKqOxvVZSfmwqKVLFgZ2nZLxnBxOzqN5dhDnbuq18EevZMcWnyr+SVYSk8L+m
	 vjUvTuHAuuXzTVD7HUmEh5+e4opKlnWszVGJ4qpGcDhLGNpbKnWfF03Qm2auoUr1z6
	 Ykf0IpTSNI5i2zBrDg5w24yv8iTnY0lNdGpG1ocBCiWNbIIG/DWtuX2ZLLk5uqxfv0
	 FQADRLXGkHWHA==
Date: Mon, 26 Jan 2026 11:36:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] treewide: convert hwspinlock users to the new
 consumer header file
Message-ID: <c869a528-8f94-43e5-9f39-e0a6aa412291@sirena.org.uk>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U27r7qI+dLbbzJvx"
Content-Disposition: inline
In-Reply-To: <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
X-Cookie: Haste makes waste.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_033650_349877_2AB03958 
X-CRM114-Status: GOOD (  10.31  )
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


--U27r7qI+dLbbzJvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 25, 2026 at 07:46:54PM +0100, Wolfram Sang wrote:
> Point the drivers to the new header file. No functional changes.

Acked-by: Mark Brown <broonie@kernel.org>

--U27r7qI+dLbbzJvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3UccACgkQJNaLcl1U
h9DfNQf8DbjFMTf4Rb2LTOoQjS2RvGlVbcaxAJBcyUFBL5+qR9H5s02vvhD/lqtb
vkxgPBX9XjhK6W/x2BjZOowhS74+Vsi8IVWF0P+rskimDpri9uWVA+19UQ3bKhqD
NCAJa3MPHQcjewDiwKtqNrgRTcnkwFcbCM7uufWpy7JHraLQMxbysBrYyqR9hsOK
De3xCE3fZX7Xu282B7P7dUEzKFhCPUl6uXytbN0GA+NXrF5TAU7BIOVFkDghgyko
Rd6g/XwputLTKOCDYKXgtjCrpKbARTfrQFvJGRbYaKIlnIkXYiCDqNMhvOsDAaVT
1S9DAngxqouYY85AHzBVffc18Fusnw==
=JxoC
-----END PGP SIGNATURE-----

--U27r7qI+dLbbzJvx--

