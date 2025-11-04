Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009FFCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xQbltzAdhXfwga5qXiYOqU8nts0UsDRjUvSm120wQY=; b=XG8e8VJRC/rLC52Ph5tB06AmK+
	NTtpuK/UHl7G9xOTiIoe4qLxiecmJZeGe9nDnJF1GxAbP57XEJEj4UfHaSNjF6dbF5JcH/SGcNyzZ
	NCO8rxSzSF3iq4tkv/g95xf7vl8W4Lhggxd+B6SkwGHif/EMLRDHH7K1y95inKz0MiHqrm1BvLmI4
	t3V8vzO4Bs5ZmPfEDcd8sAU/hge9MaeZWsLkFjYTjFD4IH6JNvV43vVdgZ0OtmHGcOtbzUWpZZ6au
	K0ftfIh6ZFMgQdCCyhj+R1DEWKUJLdTjb6i6DBgFf9xzsYH32eEV82bgbgPWoqkbfGe+DLVGDj5DU
	9aH/zJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKvt-0000000CHgK-1QLS;
	Tue, 04 Nov 2025 17:35:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKvs-0000000CHfi-19lA;
	Tue, 04 Nov 2025 17:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63A79601EC;
	Tue,  4 Nov 2025 17:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C9FC4CEF8;
	Tue,  4 Nov 2025 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762277699;
	bh=8xQbltzAdhXfwga5qXiYOqU8nts0UsDRjUvSm120wQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmGaPMF63foSRg8VKHoS5RRVR++RJzTQp2nLIYnhJJNlrz5vKH3z9KgR9LsIA8jZu
	 n7Aqi0/uF9eXo1R4i4oHDTeecz5kkP+GdzMXBfiAles5Yg9R4cLRANGmE6E+NITm69
	 vzk2uqAyQnpn1zYGc4LFeKVoJCGs4qOaVfgNHYY0mClGI0bK0ZuY3buaGARPTIUnhv
	 zt8SVYTRf1eGb8shbXtGJmEH1rog8VChbZRYnGGd5b5e2RYcjFdQmZXfmOaAyg23y5
	 3T2OY9/p33DAWLIMWMJvsG6hXAQKyguEvIXNtMEhifgvIuQYAAfV7mI958V6RSm5+d
	 rmuY+Pgf7uK9A==
Date: Tue, 4 Nov 2025 17:34:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Willow Cunningham <willow.e.cunningham@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: soc: bcm: Add bcm2712 compatible
Message-ID: <20251104-trilogy-unissued-43e96d7fce87@spud>
References: <20251031183309.1163384-1-svarbanov@suse.de>
 <20251031183309.1163384-3-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8mj34RREUM25/Crp"
Content-Disposition: inline
In-Reply-To: <20251031183309.1163384-3-svarbanov@suse.de>
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


--8mj34RREUM25/Crp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 08:33:07PM +0200, Stanimir Varbanov wrote:
> Add bcm2712-pm compatible and update the bindings to satisfy it's
> requirements. The PM hardware block inside bcm2712 lacks the "asb"
> and "rpivid_asb" register ranges and also does not have clocks, update
> the bindings accordingly.
>=20
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8mj34RREUM25/Crp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo5PAAKCRB4tDGHoIJi
0paOAQDOdINvL0/4sTF6BCosi/vP75tcg5G44avu1plor8SBUgD8CObF4BwCPlZ0
thXG5aX2ATjpFnbsPNdIZ1SWKUGVkwE=
=a0/L
-----END PGP SIGNATURE-----

--8mj34RREUM25/Crp--

