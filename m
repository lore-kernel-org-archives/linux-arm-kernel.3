Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FA0C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WltsZU0eLt4iYNhR2mtpQpvm/vHmTVrehbziaM2X66o=; b=g+Su0N9Q1OG5OAMogOynjdurDV
	NDyyMmYTBizzctfLugtYFBq7cbe/62KX+jp73YHpMDO2NA5ZRozdJC50AdmZDpFgQQpwB8TRo96vL
	UmF2FRkJhF99L9wndKW73dla3CTnqEl0zEj0BzCtsD3pwGdeerCVk9jIICPNosLNolRmMbfU2wASN
	2POZZBspgv8S8yIr5DMWlAZqpAqI/87vzCRR7Yfr4IXYX+q4QQE9HGceXW6m3HoiPM6R27fFJb8Kx
	XZMYT/K7PbzaP7qzH0rC5H2CDd9hT21ZEc+PxQp+ySGUalJtyEqt7r3NxlipOCQxC5ObO395GukAI
	tvEuo2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqzk-0000000Cfd6-1elH;
	Tue, 13 May 2025 14:52:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqxe-0000000CfNr-2DXs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F094C6112C;
	Tue, 13 May 2025 14:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD58C4CEE4;
	Tue, 13 May 2025 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747147825;
	bh=8nE/mVj/5tKUiVMPvMi5ed3vQ2RYq7H69J2WfDO/NH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIfVpoi9JN7QI4JV7U4pUtfMbHMPXh1b2t4m4qidr/lxq/XZeodRhjeJPGM/bQIYv
	 kb75Dge9taXUs3KGjG58XrPsN+AorUfLlB5AjfvsMNnrvCkWTFzWToWtJIHNZwckpD
	 8vk62piL6MYLZZuTNt0w+ja6W7QxBqLbNTn89gWAjMttnIVi8rAND7H7K6RJRfa6aG
	 4ds0VXhgrm3nof11lnuI4k1fUaAhwta1B6goCvij1M9h30ji+jBc2/piX/Dq+Q/Lbi
	 r8EOl5VtBXn1LG0N5kPUMxJeclhqddxcYGAm4x8nA5Yy7DKIhbBH8vINcPoSHxou27
	 hjsg9UVcnk8OQ==
Date: Tue, 13 May 2025 15:50:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>, Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH 2/5] dt-bindings: Add vendor prefix for allegrodvt
Message-ID: <20250513-varnish-subtitle-0421b30a9626@spud>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
 <20250513083609.328422-3-yassine.ouaissa@allegrodvt.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b0tNX6rinjYvhaZl"
Content-Disposition: inline
In-Reply-To: <20250513083609.328422-3-yassine.ouaissa@allegrodvt.com>
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


--b0tNX6rinjYvhaZl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 10:35:47AM +0200, Yassine Ouaissa wrote:
> Add allegrodvt vendor prefix so it may be used in future device.
> compatibles

Why should this company get two vendor prefixes?
I don't see what is wrong with the existing one, sorry.

>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 86f6a19b28ae..90bc1ec721ed 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -81,7 +81,7 @@ patternProperties:
>      description: Aldec, Inc.
>    "^alfa-network,.*":
>      description: ALFA Network Inc.
> -  "^allegro,.*":
> +  "^(allegro|allegrodvt),.*":
>      description: Allegro DVT
>    "^allegromicro,.*":
>      description: Allegro MicroSystems, Inc.
> --=20
> 2.30.2
>=20

--b0tNX6rinjYvhaZl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCNcKgAKCRB4tDGHoIJi
0iWkAP91CM1tZScImp5J6RFXp4KtN1OSuAzTfgl5VQeyhWZF4AD/Q45N6Gl3PSLD
FzOuC6YGTfwPRbuUyijgHc29uXAKwQk=
=dDyk
-----END PGP SIGNATURE-----

--b0tNX6rinjYvhaZl--

