Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3F9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfKQEI3/w/jPPIgwJ2M+qaN1oQ83UFtd+Kj8kr4X1wc=; b=KJ73mPw3aZwLOWVZBECmSaBff1
	1NM9BwkqXDeAvXqlj/L2EHNg+UjlojPckKmMydu8UsFWzv85vgAfD38Exlpdx+7JyqIc8WC2R5oql
	qXzSg1qMF+kWb7xYTM/SAIKCQFULa3VKKO7KCpHNYnmoLu73Y6nfard5Kg6YUYdkhCVDKhdz10sO+
	D0zJTVZMeld+pYPiuz+9t/bHbAPmuYeV/lVr0B4F//+bfoEtFwn20wVAgXy0shSlm8U82TZ+UbzIf
	gxXmjfH7OldxfY38imOB1YLq1EZbV4euoESRM4VEInJxtwi0lxK//eLWAOHsAzgJ3DNaQH2vP8aXV
	IA1FUeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhGz-00000003X44-2tpp;
	Mon, 10 Mar 2025 17:50:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfmd-00000003KPC-1wCp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GfKQEI3/w/jPPIgwJ2M+qaN1oQ83UFtd+Kj8kr4X1wc=; b=OKBOljV077TerBwPI43xa0idtf
	3enNeUZmLTDtI318LiN0N0RAn4iU1uEULM6RpCHiprLETIi1Ad6eCyUHXhgF0VztJeQUNhu4VFfah
	X6bts43V+iGCVvkgo+FEoCJzHQrChS86ZeMKyddLft0KhhIUp2uxK7c6N8zAYxof/6O9o7XtK4LfX
	XdBa+vTZhkfpybD6/orcCOYvLUbKAYF8xt9mBd+/9THQE93qdV/LgdZE65VtvIDqxuVm5SJkr5Dam
	xtyKHIEpG0yoDdlEMLwfL0l8k7qB8zfbJIdDEo35cfgrADYZ77dEPVdVsRilPl3F6F9lTuEpDxtRy
	Xdgoud8w==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfma-00000001umU-1JE4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA948A45A2E;
	Mon, 10 Mar 2025 16:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AADC4CEE5;
	Mon, 10 Mar 2025 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741623308;
	bh=GfKQEI3/w/jPPIgwJ2M+qaN1oQ83UFtd+Kj8kr4X1wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZtVwSzTRBzyJCQJsgC/9YF3adZtv1HOhVsNHISyy+2qM3dqTvytdY5OEnYOnf5jN
	 jhBVs1x1D5sdE1QGLM2BCl3h8wYf8az/tSrUdM9MNja+1tICm4lhwXVIMo9mhOon6o
	 Vc7D4JvNnc3Zh3+Yi70hmimYOw4wXfHoPWWpaNeXaAbpB/8tHCuc+sUa3tYelrvH82
	 ieA1G7LtJkk/MjAvBmb0BjWHuG0bvMYofLWBqk/z0Erp/ALAJRIo+hf9TSmoXlIw+R
	 OmvUeMdCo918OHYOIEdpdODmHvwzK44oUR+pT0rYfoE4bbDi4IIpUC6X+l0NTAHvSY
	 cLDTmSgqbpRoQ==
Date: Mon, 10 Mar 2025 17:15:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: pwm: imx: Add i.MX93, i.MX94 and i.MX95
 support
Message-ID: <jwge3lqlx7t6j4gmag4ghu6vtzatg54i3x3tl75k5upvedakdy@entc6jjcqh47>
References: <20250306170845.240555-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lm2fsqm2yujhiixb"
Content-Disposition: inline
In-Reply-To: <20250306170845.240555-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_161512_535450_4B2B3A7B 
X-CRM114-Status: UNSURE (   9.22  )
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


--lm2fsqm2yujhiixb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: pwm: imx: Add i.MX93, i.MX94 and i.MX95
 support
MIME-Version: 1.0

Hello Frank,

On Thu, Mar 06, 2025 at 12:08:45PM -0500, Frank Li wrote:
> Add compatible string "fsl,imx93-pwm", "fsl,imx94-pwm" and "fsl,imx95-pwm=
",
> which is backward compatible with i.MX7ULP. Set it to fall back to
> "fsl,imx7ulp-pwm".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
with Conor's ack.

Thanks
Uwe

--lm2fsqm2yujhiixb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfPEAEACgkQj4D7WH0S
/k5/Qgf9EmSnszwO5HAMyp/zt++qVoJo500Z8MtKSb4CtHeppS12p6xcfklZDMBN
+mgSdfHdaV6D0CvILircndu4GLxRLWuEk08FgqYoSsqeUoNLoIDaWtDFakdWPTX6
thzWQhg4TSGbDVXDzuHSMw4Eg8SeXmIm8ffQ46mfcuGtSUpB2P30WKq9WwOg1Wa7
VO4BLXv0JvpPFSBH2TBt12qmedffPELK7Hd11LPmbsHSARUGmYsemF2ejtWrG05O
hWs5WsPq08UmeKb/LDyDagFpFo+a41Ih62G4PRn3Vooqx+zEGSKo7/YcNCOhmqSp
vEGzTENSpDyBnW1egQuY7k7GIPsdTA==
=xC4L
-----END PGP SIGNATURE-----

--lm2fsqm2yujhiixb--

