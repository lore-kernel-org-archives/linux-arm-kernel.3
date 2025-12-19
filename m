Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADD2D74965
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lj43oXTOV6UJEnGkyony8860gGIeke9NpD8hIRJrkD4=; b=fE2X2VezjF4jt/JsIfg+2ZBr1L
	pxdppSt2YTKJWW1mjB10/ybZKrCdEh3Jg4eO41beJ5QHZoZRy6lIU4Rk9iFIsPdqyfOWYKJ/Xa1vt
	+9gCaUhnqyMNi/Th8UM8sGwLZQok1Fx4rKi6FECz2+vxIdPphPeFJsPbU9DPdlZplajoc0gAkNYLj
	+iyIWjiVuxU3KPNX49b5Ot2FP+a9TCZdfSyQADTvt6q8oNDv+S/lmc4Q0Pp72YleRAyAka3szOVHp
	YiFKM99Ho71d7ckHgbmk111uWElUVCGPDKP3+pdXgk0LTrvB/x9Y66SFmwb0gtx7f81keN1qR0gSv
	NFrib9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWHd-00000009thL-1vRy;
	Fri, 19 Dec 2025 08:56:21 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWHb-00000009tgw-0ZRS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:56:20 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Lj43oXTOV6UJEnGkyony8860gGIeke9NpD8hIRJrkD4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134551;
 b=PuzitRBmFPOobZ0+TrvnUzDVkMFrK13gH5WMAS6skRifVud3oRC77ratoe+Mto+nwE6m5XeK
 J9xcAsCPDbRh7rgyDmaqfQAKsU5EjOXSTAttiVL+hLJqCRphmOsiw+QusubMokDzeWhPlXjtvpn
 f6q437yB6+XR8MODRyoWF6TGZvXCrNTCSeAD8+4dmsGdOoW4Qn7PPehCVMXg8PHbGDxQsMIOPOy
 wkxzb/YrqfxD3E6zItZvwDkGCwAE5cBTLJXTLa+vTkN2Y12cvFWpS2+X+xjFnlAR4MfpgmKhc9n
 MxFBUy4t4aOBr4hywrcGoqpGZCkSVAVz6LPnpqBSeEKtQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134551;
 b=lf+FWFey6D8rsMbjAEKFfm/FYM5tMQV9kQZRAwCLy2q3tZAi0VCMLBZzG0AvxhzoP/0NcD/C
 tqyI+9Mj7bM/Z2W/dhp6S+YUJrhdQALCy1zxpLmsB2a5jfug2gj0vQ/a7r2b12Z7BpHItG+aK5K
 kTnvMkAaHbUP/q6i9GKB1ADZRb5Mfzyg+4qYSiZuhoVqZLxMuUg//nx2O+K/AUjIBAqB69lu8zo
 cHvMSqd5HfEBwiJ5hBQARfkAInQW4jGiWrlxy392Y4JrrC7kpWc+HN1YM3fhCro1De+9Dqyq2mQ
 iBX/DZsmpWxiJTryxdxWdI994rsmRfTdbFDafsMr9IPsg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Fri, 19 Dec 2025 09:55:51 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D2D14A4134F;
	Fri, 19 Dec 2025 09:55:32 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Fri, 19 Dec 2025 09:55:31 +0100
Message-ID: <4732491.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7530110.MhkbZ0Pkbq";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dXhFf09TXz4MPFj
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fc1b38920f4cdcdd93076212dbcb4bf0
X-cloud-security: scantime:2.397
DKIM-Signature: a=rsa-sha256;
 bh=Lj43oXTOV6UJEnGkyony8860gGIeke9NpD8hIRJrkD4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134551; v=1;
 b=BAq+w1Tb0W/6rs9NDC5+gYSz4TWUrQfgO6oF0uBe0G3vpTig7v37kBh5VjFuGQ/d7QA18Vhq
 oPTPZYcszFB3+fiM5XuCxC8FtoQtVQ5yGXC4YmE+9heMiBVdvPynIl8eOBUv5HYsGhfpQHb3iBC
 KFldRGAaIHWiZZlNy9OxOaLL+By3jGJj+3QLXc2xeVlXL0wQyXmavmvWhpHgz2LgD/oje67YvoO
 6BW6umYJI4jNyloQIY+XtDbnHC04PL7b7rtWlj4mEdOPz/BXPaBOCYtrUywNvqcCUXfatm0UmqJ
 Dp4pbpCUh2RKbhcX5BCCG5M6WZ3hbdVRgBbeYMoKlfhug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_005619_336115_906F9099 
X-CRM114-Status: GOOD (  19.68  )
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

--nextPart7530110.MhkbZ0Pkbq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Fri, 19 Dec 2025 09:55:31 +0100
Message-ID: <4732491.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Am Donnerstag, 18. Dezember 2025, 16:20:49 CET schrieb Alexander Stein:
> Reference usb-hxci.yaml in host mode in order to support on-board USB
> hubs.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index f454ddd9bbaa6..1f7f0adc3b1ed 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -85,6 +85,17 @@ required:
> =20
>  allOf:
>    - $ref: usb-drd.yaml#
> +  - if:
> +      properties:
> +        dr_mode:
> +          const: peripheral
> +
> +      required:
> +        - dr_mode
> +    then:
> +      $ref: usb.yaml#
> +    else:
> +      $ref: usb-xhci.yaml#
> =20
>  unevaluatedProperties: false
> =20
>=20

This one is actually independent of the rest in this series and can be
picked on it's own, especially as I won't be able to work on the board
support until February. I just wanted to give some context / usage.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart7530110.MhkbZ0Pkbq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlFEwMACgkQaS+g2M0Z
/iUbXAgAhl79VULQpYWRy4jkIxMY+8oVkk+teNBcCC5xgQy+udpq222+0AUAuHMt
bTeVvx5CZg4BTRrKkhWp+8uESiqCMmddsGZU/5VYApPaiymyWDQGJqx2JbmpJbWU
2bYnSnvzY5pT3ETFlIpmxDchfAqhj/m961P82Tz+fqPDd/PQQvYdrntnp45JUwyo
2JisUxSCi/K+hBveATGMjO2hB5rQGhSccTOiE5VBa7PuEo7Jh8nHl0HRtEabNAUK
QdC+6TE2aj7V4Xq+sCzGNDgMkFPRV2W9gndo6NslrDR9o7QJOzNuk+pMCtVpeAMv
yBGSEMscs3ucjqkcdiJF97ui1BcEHw==
=tHiP
-----END PGP SIGNATURE-----

--nextPart7530110.MhkbZ0Pkbq--




