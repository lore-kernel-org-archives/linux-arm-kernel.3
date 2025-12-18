Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECF3D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmqIvCaDEBfkl1zQLnJDo+nqogSVFDTwXWujErxqEy0=; b=tw9Zs5H7xQ8OthGDTID+t4LRof
	oB0mYACWm6nnuuGgjjv70hYfWPogYv/f/BGMds5uGNVEJtcYjiGWCTMZ/+SOAiHDWz8MGfSudLTNy
	7/BhQIQv6HqX6vQ0cWqr5jw7i1xjUm+o2fDBSm3KCR8GM5ldLTXaQfiZUTwG+b1kVh9CkQGnbw/T4
	YkqjaCz06IScv1atbNPOeiQ3vRGJFmkz3CYzf5xGnytR8DWaO44hMHz+eONU1xspfvqUKKRURltcJ
	OZwFM0Qhyq6lkugNOjMkmcXtz8tULaHtWAMXaCF8DdKL4ph/ygge1yaZ7KJ6UEqMpLjvSwZhnDxfl
	Gc/fmPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJdT-000000095Q7-0N6p;
	Thu, 18 Dec 2025 19:26:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJdQ-000000095PD-1uI3;
	Thu, 18 Dec 2025 19:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADC0641E5B;
	Thu, 18 Dec 2025 19:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7647FC4CEFB;
	Thu, 18 Dec 2025 19:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766085959;
	bh=VmqIvCaDEBfkl1zQLnJDo+nqogSVFDTwXWujErxqEy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyHdh7l/mAyTrZcfR6f5ePTnC2/YvWmX0fLaG9QC1apjSTXILEXTadVu5Cull2JKc
	 Bn71LQj6X3St+RrBoU5xVoeSWG9Gn80BZPd+pk23ZRE4xjxNmtB08hjPHTf3/aFojw
	 85HAaptSMNMk8il8yuXg0TQUBUruC+917wy/N8avbmWjb4716gbTN3xA12AYP9DEdo
	 OnKz71JEWAl6M34mgQBFtsjwUJcbDVZr9IUomuMpS5OAKuc9MgaqQbPztY9FK0ugIl
	 4u1sCV5QdDCvNg7q0kmKibaGPtWSb9RFuJFhsbleHuy0bsL7+Q51BNd5n26EoRe94Y
	 23bAJsDBQD3pQ==
Date: Thu, 18 Dec 2025 19:25:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chaotian Jing <Chaotian.Jing@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 01/25] dt-bindings: phy: Add mediatek,mt8196-ufsphy
 variant
Message-ID: <20251218-spur-uncover-04320ae6df16@spud>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-1-ddec7a369dd2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+6lhiMDFrFVfpZtN"
Content-Disposition: inline
In-Reply-To: <20251218-mt8196-ufs-v4-1-ddec7a369dd2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_112600_514476_6B8C9D47 
X-CRM114-Status: UNSURE (   7.26  )
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


--+6lhiMDFrFVfpZtN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+6lhiMDFrFVfpZtN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaURVNwAKCRB4tDGHoIJi
0vlsAQDH8HhrkWqkKxEwnqwdVW1PUodcKR+KR0Tt8dUe0temKQD9HWA715OQFthv
nNC+30DA7E44y9cBr7tuFNHkhhGcvg8=
=Rc5D
-----END PGP SIGNATURE-----

--+6lhiMDFrFVfpZtN--

