Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DFDF506E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1AAGUAmYjD7Si85D96o1y9oVgwEOEjsWS+VLMRr0aQ=; b=uaGVL8CUatekmX7tKs0FrnhR5E
	BOEJiO7idmH6tswPze8AmvaIqtRfvSK4nj/YXeTCq06ikL/eMwRhjG8NJo42pkba6Oh/Z7jq/t98v
	dp8JtIbQhfwFfgkJ3ylWfntqcEKpmBacdLGdClE1ijY1upBHeTKb78rywXPGjp0DzIDL603hSm4IH
	guSilevNU3a3KeecvnTfVGZGhuUCkhhc+xFaht718j+ZGZKYYdpEpV9AwaAZHODjBIJ/LYNdpKXIL
	MFMh2u9duApcU24+sgjVfAlGJwy5INK2pH1N3b31z4m1+tyziMMCxeuuDOP1EIVET0RmoPcbe+GhP
	QGc7fygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Ly-00000004GAQ-1i5A;
	Mon, 16 Mar 2026 14:55:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Lw-00000004G9U-1CBD;
	Mon, 16 Mar 2026 14:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B72760123;
	Mon, 16 Mar 2026 14:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AFCC19421;
	Mon, 16 Mar 2026 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672931;
	bh=DXurX+rXkNtKMNetYL42Wscz0IskX62tenc5ozVeitA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJh/lLK9mQ4+tJsi/be7GN9483oLhqrwmr5gGA9yIxTr0zTqxRzRW53VKiDpS+znu
	 al1TPbiDEz7JLE3AqeSgHGq+ej/dN8cj1DdY/c7ah90EdaS1H6plBc+IN475XdaAdc
	 FfhBGf86zLMwlyannK/mE47+UFYTRd3UoHk/blPQ3d9PQct/l4lX12amujsz3xjfHG
	 6iqb4GGddwKFjL8zG/CdLEYRoTS8ftWzk6C82uxjtslnVFRGMoPijQQ3UenQwxxqg+
	 Fk4g+LelXVOHJGKC4jq20cV9YoUQOjywQrRyBudWaukf1rZdBBhlbNiCf1V0+qCDcd
	 ypRksCHLMX91A==
Date: Mon, 16 Mar 2026 14:55:21 +0000
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Lubomir Rintel <lkundrak@v3.sk>, Julien Panis <jpanis@baylibre.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Kurz <akurz@blala.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 00/15] Convert power-controller to dt-schema and update
 various yaml file to referencing it
Message-ID: <f329f1b4-787e-4c8c-ba26-e419a047023b@sirena.org.uk>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q5D3dN9fM9+vUHgs"
Content-Disposition: inline
In-Reply-To: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
X-Cookie: Not a flying toy.
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


--q5D3dN9fM9+vUHgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2026 at 10:47:35PM +0800, Peng Fan (OSS) wrote:
> Convert power-controller.txt to dt-schema
> Update various dt-bindings to use generic power-controller.yaml without
> defining local property.

Are there any dependencies here?  It doesn't look like it.  In general
please don't send a single series covering multiple subsystems unless
there are actual dependencies, it just makes it harder to figure out how
to handle things.  Send a separate series to each subsystem instead.

--q5D3dN9fM9+vUHgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4GdgACgkQJNaLcl1U
h9CnKwf/Y45O1xRPr9mTmI28M1CvW30zJp5xoDJXzVFZW6jtEjIuA8mFy+dOgIj+
PkIOw9oNhVPJcUpY4vl8XJBEZDdEDPMwSOdMexgMsCCCeJBF1/2fEHkxI1xyTRlP
19Nh8e23AD9Qpm+0/Hjn/iDwpuYXhqRLxqw17yeReb8HyXAvnVcoLQAsonOHewce
imvplZGb9vkqG8UivYBCq/7Ar+eVs6vZGg2IEm5kn4EkVWj9xZDFMeP8G8RhbqnM
oNHrFPTft2T52cuebigvOum9pbm4WmO5U8BqTDHLldZRD0qfvdKSn1hGumXDnVfh
2O2qPvCp7KP1+oQbqttXJjEuIyoNLg==
=wZgr
-----END PGP SIGNATURE-----

--q5D3dN9fM9+vUHgs--

