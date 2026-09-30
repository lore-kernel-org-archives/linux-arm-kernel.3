Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE473CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Asdm0TpB8u5zy0lzy5pt0MvWertRtCXOd6lENqyikxs=; b=BCxGbMVonc+IvpBvwMSKW0MfmO
	VKA+hiZuRJHmhXUqeGkR9Ts3FNqc7sOSC50PagVca3SAK7vUU9KGx8RbWi4jP8WKO1yzjnwxEDqgA
	Txv4u8erFR8E/VlYIA7tmFtlQIfNF1pxu3OXsWMWtG+3OaNzOl/2NRHeDBmw/ghSasmk2NMe7I+a3
	4CIu/Bz0Dk1praF89b3+NzwLjfg3DtFX57FbXGi1/DtKrsUgbFnm6f4f0KqaagBhSmkd6rlRBjUVj
	LGRjMmNvliNBu2WmZQvn11QLF0TQIDIJdZ5YjqqLsQ0p8seNTSvKOjARxTZxEcx5HqBEZTcoyDVHX
	LVTogdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1gu-00000007EkV-20tW;
	Wed, 30 Sep 2026 21:18:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1gt-00000007EkE-0uZj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:18:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EBCF6021C;
	Wed, 30 Sep 2026 21:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D531F000FF;
	Wed, 30 Sep 2026 21:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790803094;
	bh=Asdm0TpB8u5zy0lzy5pt0MvWertRtCXOd6lENqyikxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l15rZbWiW/tSQiObx6mwp+9gGKh9XCppH7zEZjV4/ws0N0fhhL935fgxY8T/b9ryq
	 scgrbCydtbaS9kU0dxFiENiEic8kWwHrDvgrlsQlvuMOK5MtRkasgICmtoCwsDFpec
	 g1JnkEsBFNCOisjA7nDuJPTofbwDarZmGApQoWfT3O7J1v/UYjpJ5z8s0ZTURjkSkq
	 Ywil6TqsOkRzj2rX+mR0kGfZEycli/3RPDCiIhczFzNmkk5OD7Hlk+6smZD2mdqbn5
	 6NMqF51tZttN2pdFPcSNA4UlpmDwNKAqPY4Kyzdb95j7m4x0cGaXJkPbpYvMy6F+jF
	 U0wyl9hTDnUqA==
Date: Wed, 30 Sep 2026 22:18:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marek Vasut <marex@nabladev.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Cheick Traore <cheick.traore-ext@st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: iio: adc: stm32-adc: add support
 for stm32mp23 and stm32mp25
Message-ID: <20260930-blip-hacker-c0eb3c978fb8@spud>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
 <20260930-adc-stm32mp25-v1-v3-1-406834430d72@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H5isfrlAMKPo+WOT"
Content-Disposition: inline
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-1-406834430d72@foss.st.com>
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

--H5isfrlAMKPo+WOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--H5isfrlAMKPo+WOT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar18kAAKCRB4tDGHoIJi
0pgAAQCk8EVeiVU7bhrDnX9SGs0jNb+botmOIZKyWqLMT6HyVQD8CSU3PsZX2Dlz
pRsbaiCvl7wPH8G7uJ99rxHJL+MOcQI=
=tsxz
-----END PGP SIGNATURE-----

--H5isfrlAMKPo+WOT--

