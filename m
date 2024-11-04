Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEEED1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6enrP37S1Lalzqg/vwJusOD1jfo+xSMpEE/34E4UvY=; b=b4m9b9AOPtUr6+g+0B571co68X
	z/esopRotj6fHarwBmefzCAE11h4NpOgcTi2uljyeL1wSfA0E+n0l2BxJwk9L1cpZ4+5oEtB0CWhH
	ZGgPpCzw+LXICdmucnMDyoBAwuDSkEnmafd4BNiEo8uj3GiUbUk9ZR/F7TOBm5MuaN8GM4FAc9Y40
	mmXgkEVT5aNOvqXdECXvnyZ3oIwTl/UyV7bli01D+ClN69fPhXUs74utbBmjvC05w5lQhT6X7Dziu
	iZZc24boJi2icgHX2SqqsZcWxi294AyM1XA9rvjqO2zZn6Od/eHfN8uwjRPvuAmB90A5Lta6YQ1T2
	y2J9LvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82B5-0000000EpEI-3wxp;
	Mon, 04 Nov 2024 18:51:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t827P-0000000EohT-2Hhn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D396E5C5036;
	Mon,  4 Nov 2024 18:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C1CC4CECE;
	Mon,  4 Nov 2024 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730746082;
	bh=R6enrP37S1Lalzqg/vwJusOD1jfo+xSMpEE/34E4UvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gsd4f5TjAfpKOeeA9jmcZKkCiTU/v4Si8fT8Xi8MCST4MLqB/1rWyte0a4Yn7SLYv
	 n/J/EGbobg4mTbJ41BvPj2oXrsX0Cdglbb/aJTTZzG4FAAs/jynSw7buGoTXNi7sHz
	 bEYqD6KbkbZzdUvacl5kliiRXIxdIljQ7GDHspXQOdAizWoNDptwBU02kDAdQIn4TN
	 23ZaCGII+Cvgth04+5Er1rzCQL0sG2fFMMYf9WlcCE2JiYGLlKlf3uQePJrB40PSfU
	 2mliFvqYVC77hbbTj3IH08iyf01NDrq7fUbUr7w2sVW8Jv1Lcn58CgiB9cZAV5lTtC
	 7gPK855LhHaPA==
Date: Mon, 4 Nov 2024 18:47:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH 1/5] dt-bindings: usb: dwc3: Allow connector in USB
 controller node
Message-ID: <20241104-elevate-margarita-6d28317061d3@spud>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <c8c9f19c300378916e920f5d3c26c67bac95d143.1730299760.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z6TAEo5WjG+TxVyM"
Content-Disposition: inline
In-Reply-To: <c8c9f19c300378916e920f5d3c26c67bac95d143.1730299760.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_104803_651987_1B4F5119 
X-CRM114-Status: UNSURE (   9.50  )
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


--Z6TAEo5WjG+TxVyM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 10:47:24AM +0100, Matthias Schiffer wrote:
> Allow specifying the connector directly in the USB controller node, as
> supported by other USB controller bindings.
>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Z6TAEo5WjG+TxVyM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZykW3AAKCRB4tDGHoIJi
0t5fAQCmiNYR6DPPTIjBTLUm3zGkagYYxIwcEcQPBoO9ZQ2u9AD/dLu9HA+JtHYH
mgxreyJp3BHPFh+92r0t0rrQOhAfiwY=
=Quc0
-----END PGP SIGNATURE-----

--Z6TAEo5WjG+TxVyM--

