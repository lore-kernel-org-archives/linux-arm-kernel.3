Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B71F8FA9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DpCwv4bQ34CzEvMEIPOxMEDG8nKZt4dIwwtd1eT0TA=; b=twfctOvDBdkTvFNWDDw7LO223J
	6PH1eQ12867loP6wo+V704uOSqjFUcLDUIibXnQraAKUQAQRtvtTiyXKJNRN3sTU9GEnDJaMsabv2
	kWzLwRCRjryFjfftiHNLNQaxWTZ4wTdQsgp7l5q9IRa5YAhu3O9ngEB/96V9xw0kAuSJjx5NXW5yM
	5aZBY+amNUUdQVB+32AvNAMMC9JrgV8sCok65P+RkEV10yCWc59l0OCr7ZkP77sFyadnoGItitOL+
	+6zM2PXElIU0SELSonz0HsPtRWrH/KGu8pL7qZlX9lMTa2dp0VHRFqUbk9Qo8aE6sN6iGnOsu0m9P
	RR2ilPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEC7-00000008vcZ-3F9Q;
	Tue, 21 Apr 2026 16:43:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEC6-00000008vc4-0IMF;
	Tue, 21 Apr 2026 16:43:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C1174457B;
	Tue, 21 Apr 2026 16:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCE3C2BCB0;
	Tue, 21 Apr 2026 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776789805;
	bh=4DpCwv4bQ34CzEvMEIPOxMEDG8nKZt4dIwwtd1eT0TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYcmQyTctxxAQnBqas4fS5OXWdt3+cIYFVzOS6LqRhwJchFIcfOqEevthO/u/zoP5
	 J58Yip/BuYyrclfkwD/xsE5GgnlnZoJRP/IdqmkjtAqHOon27ksyVBXIN63HeyPcXg
	 oRTw/9oYL3Rkjzv2qkECkyVkFVo7eea32DbeoZwEvoL5Z2nI7TLp88P0JO6l4kq9On
	 Sth+bFQ49EAdchOLov4D12SS8iMuHZKmjpV9I6F8h7lLwnJ7g7h/MmyqOBP/yeHuSC
	 aqHaeMuCpmGPnzOMDrGd5TlLnCB5ixbStsg5iBYxUo/vKmuDB/KAdWFHyjWZkX9ZKo
	 1EA12sjsPDBTQ==
Date: Tue, 21 Apr 2026 17:43:18 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
Message-ID: <20260421-mayflower-scratch-c861c20ecc11@spud>
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-1-447114a28f2d@aliel.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vF6WveZDFwhhwK8a"
Content-Disposition: inline
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-1-447114a28f2d@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_094326_130402_C5F63AB5 
X-CRM114-Status: GOOD (  10.23  )
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


--vF6WveZDFwhhwK8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 01:49:18PM +0200, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> The Khadas VIM4 MCU register is slightly different
> from previous boards' MCU.
> This board also features a switchable power source for its fan.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--vF6WveZDFwhhwK8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeepIwAKCRB4tDGHoIJi
0m+GAQDP6Yhk+Ye2KmmQ30PRruDFLVUcEar4ReZCG96CAq3ZqgD/UXwYeykc1wq3
5TfXvdpglW+/eDOGF8e5A5zNvpB7JgM=
=SG9m
-----END PGP SIGNATURE-----

--vF6WveZDFwhhwK8a--

