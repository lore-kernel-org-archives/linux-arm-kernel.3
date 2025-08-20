Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948C2CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqeFO6HvfjccxgbJRn37HsDogI883Z0ye1Ok5+j3EBg=; b=dHjIC6eHXM0li/8N7CnIVpgGv4
	KJI/9UM2ndhSxZO78A9Xew1h5l8RLvdwaOiYNdmMnkN+k5NHmev0xaRtKxdnic+1UD6XsslBAInX2
	4yIG6XRcdRkQuxUzMqAzzG+TE2f13VfqxuiuKNAioZ2ZC8gEmaJfGdysAsWMoEgbfGjvn0nUM1zFe
	Aa9IdQBSKDHEZO9N/vllaSVdOx7wdcqLnFAAZjGCnqKJrOrwGxBospOXL1YiLspaBF/3Bn4tqI7XN
	G7Llb6auklmT0WqdoC/3H2M1ZBeHQAnHjoUbOI6VRFQKVq6EUf6OCROWQKh4gHHLFG7DxUn70fy6L
	tw9KUlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqkP-0000000F2LT-2kOG;
	Wed, 20 Aug 2025 21:53:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomTA-0000000EWAa-1idk;
	Wed, 20 Aug 2025 17:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C31985C6555;
	Wed, 20 Aug 2025 17:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A08C113CF;
	Wed, 20 Aug 2025 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755710367;
	bh=ZqeFO6HvfjccxgbJRn37HsDogI883Z0ye1Ok5+j3EBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnXxuBq9DaMzoURintPzzDLWm6OGJtRPK5y6jTbj4z7Fe4QFIOGeMAm6xTyXlFlwz
	 I1zl0A27O5+l30TpOLpjgTLLT3IBhtn/oy3JXr6IOY17PGFSGAekC+hsYinNTrGBFk
	 iyi5XmYQfJfrXsrIMIx9mSXEVhtw5EJDcwvNR9/iaD0lQqiT+VhTajCOQjYaWm06jB
	 stPgfsAYA4tGBt+YkC71Gl8cggC5pcFKWJugxR6MwEfnWn+gBwjqX7RUh22ZwkEEu2
	 EFSJB4JzO4GLVaUVXC0doDoVm3oCa3OAU1BRy4BTWD+deENzt+8LIf/iP/tmJ3OedF
	 fG0lE3alkNn6Q==
Date: Wed, 20 Aug 2025 18:19:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org,
	ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net,
	dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
	jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
	sean.wang@kernel.org, simona@ffwll.ch,
	support.opensource@diasemi.com, tiffany.lin@mediatek.com,
	tzimmermann@suse.de, yunfei.dong@mediatek.com,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 00/14] MediaTek dt-bindings sanitization (MT8173)
Message-ID: <9401aab0-1168-4570-a0a1-1310f37142eb@sirena.org.uk>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/IS/CsiIsaaXgGuH"
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
X-Cookie: Semper Fi, dude.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101928_532013_EB038F31 
X-CRM114-Status: GOOD (  12.48  )
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


--/IS/CsiIsaaXgGuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 02:12:48PM -0300, Ariel D'Alessandro wrote:
> This patch series continues the effort to address Device Tree validation
> warnings for MediaTek platforms, with a focus on MT8173. It follows the i=
nitial
> cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177=
=2Ehtml)
>=20
> Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
> eliminates several of the remaining warnings by improving or converting DT
> bindings to YAML, adding missing properties, and updating device tree fil=
es
> accordingly.

Same question as for that series, what's the story with
interdependencies between the patches?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--/IS/CsiIsaaXgGuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmimA5MACgkQJNaLcl1U
h9CEfgf+Pr+Af7Z3trY1Qt1ap+qEJ57HkG6lF3iW60MvmprIVByI7krLMLxXZ09K
ggagUaBYGNe98N0oE1w0BjSlrjQxJkAkDTBS7pWP1kc001DinfldPd7bCVwY+3i/
59SETB3Wqun/8fKWU717tHGGGXQ0ruQ7y7dJbZNRCNIo8od7RIBHM2ev88Q8q6H9
wqdaDwKYMej3vW+Icx/xuH+VELI62AlrJ6W6XGDofU3hpvWHCvMN8GPcJnieHnZi
2iOYaasf79REJsNyLC6UqGXE1LBDcN3GkZDxou/yZ2kzh5h7obsGMg11oQS3/iI6
kvVcUoGo80bkRQrHEqntaPQqVwSecQ==
=rN98
-----END PGP SIGNATURE-----

--/IS/CsiIsaaXgGuH--

