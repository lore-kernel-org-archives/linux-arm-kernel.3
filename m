Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEDA1061B0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMKWVcjf7DPRIhb4QuK3bKUPyuc60L/E8BOU/g6IMVg=; b=OeZErVUvc3cU6L5VHB57T53RrB
	HCvP78urIdfOYyLwwXK/xz4J0e9mG8rlU37LZAxjB3xvaX6pKyECcTZWrhs7rctz6DPEQckJvP+E+
	f/w/izbsD7W27P80DkYKU5HzE2LxGpyJ4/IE1xj/QLyHbK0sCI6BfgfV8PKkiW7BM8dZkfREBC2vl
	u4QSbz0qovv43W4Dvg7rg8/g8kHJVX8e/woc9NkFaHfKY7Dez/4ZbZjHb/k76KbgZldx6v0lKihGO
	GbA1g9gKEGuDFFu/quXDvxj1It8mFGvl7wKhztoKNfOvCVqNuWwvuanbHM1SEYatvHLvCG9jHgmQC
	Hw+XJrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ecv-0000000Ba69-0wRC;
	Mon, 30 Mar 2026 15:34:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ect-0000000Ba5m-1u4L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF13A42DD4;
	Mon, 30 Mar 2026 15:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEDEC4CEF7;
	Mon, 30 Mar 2026 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884842;
	bh=fMKWVcjf7DPRIhb4QuK3bKUPyuc60L/E8BOU/g6IMVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhCkjfAq5yXthqKi9kX7nLJvODO5tt+7KLocrI0ReXpdAiGkYYo0/wRR0dFDgxdEu
	 YAWhjSar4kqDcgvlMPURtC3H3CBO0kZr2zRx+33FFmGAISW8JHX+PcdfAuO8R0KNjf
	 M6C4oefDCTf4PZFSs7kC53gJdcYLGuS+kUkJWRt2F5FQcPfsrZVxtLG3U2MKtH3/WL
	 SBdxXKo2pf5SsOm/pJD+/leo7Jq+y6H8ECs+kGV8GAClITL/S6buUShkxW+X4b29bU
	 ay/5yFyF3PLI48ChYS4lRYsrfGCPGUK8u5PcM5jFyN7p+XekcuDvfh7iQgjD8vh7V2
	 WQwK9+bzBF0tQ==
Date: Mon, 30 Mar 2026 16:33:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <20260330-manger-coming-943dc94f382b@spud>
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
 <20260327-pinctrl-mux-v5-3-d4aec9d62c62@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffZCCc6Cf9/3pOLx"
Content-Disposition: inline
In-Reply-To: <20260327-pinctrl-mux-v5-3-d4aec9d62c62@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_083403_514529_FF50D0B2 
X-CRM114-Status: GOOD (  11.15  )
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


--ffZCCc6Cf9/3pOLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 05:34:00PM -0400, Frank Li wrote:
> Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separating =
DT
> parsing logic from map creation. Introduce a new helper
> pinctrl_generic_to_map() to handle mapping to kernel data structures, whi=
le
> keeping DT property parsing in the subnode function.
>=20
> Improve code structure and enables easier reuse for platforms using
> different DT properties (e.g. pinmux) without modifying the
> dt_node_to_map-style callback API. Avoid unnecessary coupling to
> pinctrl_generic_pins_function_dt_node_to_map(), which provides
> functionality not needed when the phandle target is unambiguous.
>=20
> Maximize code reuse and provide a cleaner extension point for future
> pinctrl drivers.
>=20
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ffZCCc6Cf9/3pOLx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqX5QAKCRB4tDGHoIJi
0lKoAP9WusXVu3aAXNexzW+SejVhFKuHFElS/N0lptk8Ssyk2QD+JBxJ7gC7ZE1E
N/YaqZWz4FQ1xMrmZzhshVGfOWDHqgg=
=uzyT
-----END PGP SIGNATURE-----

--ffZCCc6Cf9/3pOLx--

