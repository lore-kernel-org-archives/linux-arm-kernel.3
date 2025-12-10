Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955AFD3C92F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAVkpptHG6oJO9hSoLDzB0Os+BfA+qYSejoiWrxKU4Q=; b=BkK4msnAqkrw+jCeVMWUnK8pjY
	CVdLMeC3a7m+VMaHVhsxnlP05zsbDxSLm0BZyM9So5Daj6tshxpHtoCC4OVywwOjBrbn7eB37RkzB
	V5PINtK6FEWgzd2YnBlVUN/tYncSMYoqxK6MLmN2eig1OaWLU4vQrXHNzcVPwkgUC8IUv7YI4wDeq
	ioYKqRzCn/ttuvtG3YC4OvF1FBBuMzKM+y2zRrdTLyXGR6pE8ToVKZS35+WlFEcm6JcFbIe/xnoH4
	6zxXRkSl247ywKiyYbfvmXKWv+YTKOpSxw29r+MvCF4ghVzDZKghxBAhXLWnEUB68+KvjpCjsZStU
	z31YaMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTN8T-0000000FeOw-19Zn;
	Wed, 10 Dec 2025 16:33:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTN8R-0000000FeOn-2fnk;
	Wed, 10 Dec 2025 16:33:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 720BD6016B;
	Wed, 10 Dec 2025 16:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3253CC4CEF1;
	Wed, 10 Dec 2025 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765384430;
	bh=RAVkpptHG6oJO9hSoLDzB0Os+BfA+qYSejoiWrxKU4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZC5I9VHWyMXJ19/yNiYo6ezpCM8sOhmTUF41m72Jtm2iABVgaS/27p0ZTqrKHh9Z
	 bG0D7vM+v6w9EOFpDUmmi2mR2Ji9klQGmuoEEXdKT5sH0LKV1NfwG5SyCqR+rwBf22
	 3f+xgcZscWmZnVWb0mlWjJ+ro/SQtsRiA3jQjRDuC/qc2XyaggmxLmTS0DwfMaRSmE
	 C5m96GavAQ+CxKaR2ahdr0K0iov94ANatToT9spS59SQ6+q9r08QSUAbHCFTuPXNdh
	 aJhFk/5B0+DjpskV68Wmb2QqHCarNXOW4Z8+UUSbyglElBaHthmaEo+PNHTbBeOO8u
	 U6553F6TADWJA==
Date: Wed, 10 Dec 2025 16:33:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Irving-CH Lin =?utf-8?B?KOael+W7uuW8mCk=?= <Irving-CH.Lin@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	Sirius Wang =?utf-8?B?KOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Vince-WL Liu =?utf-8?B?KOWKieaWh+m+jSk=?= <Vince-WL.Liu@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Jh Hsu =?utf-8?B?KOioseW4jOWtnCk=?= <Jh.Hsu@mediatek.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	Qiqi Wang =?utf-8?B?KOeOi+eQpueQpik=?= <Qiqi.Wang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH v3 01/21] dt-bindings: clock: mediatek: Add MT8189 clock
 definitions
Message-ID: <20251210-progress-overdue-bded69c47048@spud>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
 <20251106124330.1145600-2-irving-ch.lin@mediatek.com>
 <20251106-hug-stingray-2d3ff42fd365@spud>
 <626b5c4b810678a7f0de1f109371a6d6694bd2a8.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6/aPeWQhkTkgoOqT"
Content-Disposition: inline
In-Reply-To: <626b5c4b810678a7f0de1f109371a6d6694bd2a8.camel@mediatek.com>
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


--6/aPeWQhkTkgoOqT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 10:01:24AM +0000, Irving-CH Lin (=E6=9E=97=E5=BB=BA=
=E5=BC=98) wrote:
> Hi Conor,
>=20
> On Thu, 2025-11-06 at 17:19 +0000, Conor Dooley wrote:
> > On Thu, Nov 06, 2025 at 08:41:46PM +0800, irving.ch.lin wrote:
> > > From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > >=20
> > > Add device tree bindings for the clock of MediaTek MT8189 SoC.
> > >=20
> > > Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> >=20
> > Before I approve this, can you share the dts that actually uses it?
> > This many different syscons really does look suspect, and that not
> > all
> > of these should be nodes of their own. They may very well be, I would
> > just like to see what the dts looks like. Doesn't need to be a patch,
> > a
> > link to your tree will suffice.
> >=20
> > Cheers,
> > Conor.
> >=20
> https://patchwork.kernel.org/project/linux-mediatek/patch/20251111070031.=
305281-10-jh.hsu@mediatek.com/
> Please refer to link for mt8189 dts.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6/aPeWQhkTkgoOqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTmg5wAKCRB4tDGHoIJi
0gQLAQDlf0YH1hYoXc9Bdh1D48xuvf9j1Xm/38X050i72dQjuAEA3Ycuor/nuZxO
KtGQq2Rg+DlffLIgFceLi1KapRxZVQo=
=RQBU
-----END PGP SIGNATURE-----

--6/aPeWQhkTkgoOqT--

