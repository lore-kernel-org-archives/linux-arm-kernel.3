Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC33ECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6wafg2QwsuXq7WoC2lKdb5ppvY0nwE7Df6gak0UIg0=; b=4n9DsYytxavb4jG1W+pH1LVwi+
	ee1Ei6XaqqOT1Zrq+6YVg7ivWpL7jmcJYorXVSG/PGlpzmj9pjKFc58t3JiFMK68tsA9sywjQYJzT
	UuEbd3OIky+MECSOI0jGTSVmT6L8YkQaKx2oD55pTrxt3NoHMP3UztN05xlcBQLsQ1iOwdgHDI41g
	MxpGxQHNnM0lIiVMEnXQqngwoZ/HWD6vsgD8kCNmayYTcrd7+SkGoP0YSWOY5rETPZvnpzwXm2XKy
	akC67OixQoIsO5qmuQQCwvLfJCwYn7DtMDiGqPGkWxTp5JkGP6WAFSEk5NBJa2iqskJ40fXw7rwcq
	BzVeyKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5kBo-000000000Hz-33Xy;
	Mon, 06 Oct 2025 12:19:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5kBn-000000000Hp-1Mw1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 12:19:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E9F06049B;
	Mon,  6 Oct 2025 12:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1A3C4CEF5;
	Mon,  6 Oct 2025 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759753178;
	bh=Z6wafg2QwsuXq7WoC2lKdb5ppvY0nwE7Df6gak0UIg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngQAkhFmSP7SRB8JHkFxUzhtWlW+1qWIuECHxF3MXxp5gU2xRgmAkpgP3n/108fJe
	 rmql6SeToRQUUT+XF1V4Auu/v6ksjdgv1m+sh3mv2cJtkJjJDkWT9dPqp/6MAj8DK8
	 N7I+7Vdntgdi7bRLJMM9wdJN2b1CK14wO49xipehkGx92x9ZZsnhW8HZyn9rdomtyX
	 d95EiRQI8ql1VheLGGjA8hp6/srzJBNW0egkVx2/QatYxJoUiW4GKZLkiyr5h6ve7H
	 ZmXDsfJj7aUW4V/fitw3HouVkkSzSlCNUVIqn6ElUydSnhB6i8t6psEO7/Y9rC8yFj
	 8Lvv6gnWCgH6g==
Date: Mon, 6 Oct 2025 13:19:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <5550fc25-b571-489c-9855-5a9b08822c0e@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVznfU2XOoE/mFMu"
Content-Disposition: inline
In-Reply-To: <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
X-Cookie: You must be present to win.
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


--TVznfU2XOoE/mFMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 04, 2025 at 02:31:16PM +0100, Srinivas Kandagatla wrote:

> Isn't the main issue here is about not using a correct framework around
> to the gpios that driver uses. ex: the codec usecase that you are
> refering in this is using gpio to reset the line, instead of using a
> proper gpio-reset control. same with some of the gpio-muxes. the problem
> is fixed once such direct users of gpio are move their correct frameworks.

It's common to have GPIO controls for other things, mutes for example.

--TVznfU2XOoE/mFMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjjs9EACgkQJNaLcl1U
h9B7ygf+Nk+FdgamUTpfwmlLaO+GIiuF8L1iwF53ymUmyUQHcvWpf2IMsk5oIfBB
EsMVkL2c77ZuLy5ehS6ywdt8irgeG3DZt4aMI9UqYvHwsoN5IgsIcFKc6DV6wNZN
kYVD53ZLD3hJGlY40sYdcZ/gJPnChAFHPgXCTqXtZPAFauDxrgY6MP6cD5W7sJpI
brFXuZ2OUQr76vPSpOm3cfSbWSIiV1wInqr5yqxcmtBkhFJJ7+3d/veBKClywuvV
hfIGxgwx3mNhUbhJQZcbxecrN3+3gb7UM/lf+eNjNWveK+EfF+EW6fHl8FzL7Gpn
i83NmntXGVFA8LF57NmHwnjt6rJrHA==
=4eQ9
-----END PGP SIGNATURE-----

--TVznfU2XOoE/mFMu--

