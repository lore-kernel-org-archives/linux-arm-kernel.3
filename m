Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DC9D5AE41
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPP688dkTW0pL33s++cls2GPRs92VKLeZx8QSakYhjw=; b=iIBNVbbR/qhMXp4BnQgktnrUIO
	KHm6XeiAM3fR3Wpu8anPq0xOwQqnv8mwY+jlu1p3N4DHL9y5cSUPTnF0U3LKFcpHuvykdbtI7yl9F
	JkE8KPhycWqaodscOu7gnO3+Zh4SppjiS7Xlpmsl0pitfd1WEeRPaWZM7dUFRvcpZDjKFx5HSREAx
	Mt1JQntZAs7W7+tT4bX0/gJjd9QtWnMul0tOiCmJ0F2O+CDn4izg3nveFQLXFC9XCnnnew+rwHMZF
	J8UaSCSv1D/0Df3VaNg6DPt4pJ18aC0RSLYfcYOBEezKC0b1piUUJRKq4fscSqfncFeQ5ADAVp7CC
	2UaevdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUS8N-00000001kOK-0Xy0;
	Sat, 13 Dec 2025 16:06:15 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUS8J-00000001kLs-1lVL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 16:06:13 +0000
Received: by mail-qk1-x741.google.com with SMTP id af79cd13be357-8b2627269d5so220244285a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 08:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765641969; x=1766246769; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VPP688dkTW0pL33s++cls2GPRs92VKLeZx8QSakYhjw=;
        b=n7oTqdbH4R2ezHpnMkvZJ8eiw5z2Ez9IgkLkMX29CraSA5qiFWp6avA+cc0Ie89/yO
         XwkCfhtWbiyBhwxXDCo/metD4ipIwUED8Gr2bbUtDW8QAIc7u0iCkVWKV7rGa6S+kys2
         pq+hmtYPb2hXsgOf+2XLFeyxrT9ivzmDqWUygo0Mj6s4/2fkblJR8PKAALPwWykrIOEu
         +5PJzbQOBzBOxndF6XiDDWSEmMpPEcBYcQuzYx3sAIkmtXTqGu9nKiyyhh0q/n+VC3bZ
         /cTtpog9lDU2gmxSkMOcpPss2LSz6WAgL3+C56zK2JNc7okZMpxwHU89NL2DVZ385Hlp
         0FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765641969; x=1766246769;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VPP688dkTW0pL33s++cls2GPRs92VKLeZx8QSakYhjw=;
        b=lLSJIIJ0h5X9HV9jYtHmUEuKbqMA4mMVU2JsGmxZQnXp8tBw26A08kKFXi5Sj04lZg
         JA0aNxzurptcM/GvUrAUFFk0/Qd6AzEqhxHTMX0f8E46jh/UxDEqpX0es/9B5FlQsVn5
         qyGEcvixaKt4sDnz02pZSrP9npdFbBrbJW+aMFrqGPoNGuUSpDPSPQULcnvBhGMtFR4k
         l8eGiDu/gc+x/UWZVhT61JhJ66k2W5qXytPZYU6mVVlQl9bzl0X63et/o4x5EA7icpEv
         BAL7rQYBTt8+llsjS8WvnlgLj4U9Q2shieywOo5jlVQIYnygYTpdo5QRujtyRd5Stp7m
         nPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIxMyo14B08a58BH4PoUSADRLsJPUf8urAlKSuNxA5CfSUEIt1syLSOy4FDd3/TbV7TwD+Mkc8aubdDyp79sCN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5HruuqMtI6Nn4lrViL0mCuFE3UKov4hjOgMe65mMh228dw4zk
	lm9GPfOr+pl5PzCMLlmgDJYrlMLgWy/1uY/SE4reMYgNxO6sca0yWzNUSbe06Knh2nw=
X-Gm-Gg: AY/fxX5O5NvRlIiIfa2wzXEN9zFLzNpYDQDtbLjJ5Mle+wnmb95SFKdmD3PY8vhc4Qj
	Q4Y19XxD+TYwQXDnezggpHWHAlHHfKniW0D6HW6bnHVvj6ufCLtT16xDvpUAd3sJOOXJ6yI6Utw
	1ZS+jbcoJRllOMsJoSxPl4NlkrwYWyt6FlZ9L7xanspog3zCG5nPhoSn1oKFTv8HXCT08Qzko7S
	yREPT3mJTx1W9dlfoNolGp+M5awR2UKPWBx+f3V3fMNFhxf+OeQvzuJkPCIEiIKvZ2n2WWeNHsS
	ADWuRvqZs+phUgjrpymruGURRFlcKMbdOp6taKpjdfyR0DQXwv9GRzD4wIMun2Cu/Pt5ADm927O
	qHZipjXqYFTXmhRv2Cc5pv6Py6lPO05bF8v0R63WQ7c4LEWwbUEfcnCB/Z2gPrMftln+928D2Tu
	X0hftKlNP8roffJftVSqJI+8lgMjI=
X-Google-Smtp-Source: AGHT+IFX0cCXQ5IRNzHT17H3NzX8e6Y84Qxyxfw84gjFiOrjw0D+kziSjLK1yzotuVdbuj1rszNj0Q==
X-Received: by 2002:a05:620a:7113:b0:8b2:ef70:64e9 with SMTP id af79cd13be357-8bb3a277a37mr787319785a.51.1765641969456;
        Sat, 13 Dec 2025 08:06:09 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab544b5d3sm711674185a.4.2025.12.13.08.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 08:06:08 -0800 (PST)
Message-ID: <99ff7a97287988b8e74f84e1fa55cd6e1524323b.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND v6 2/4] dt-bindings: media: allegro: Add al300
 decoder IPs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: yassine.ouaissa@allegrodvt.com, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek	
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor
 Dooley	 <conor.dooley@microchip.com>
Date: Sat, 13 Dec 2025 11:06:06 -0500
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-2-128956555677@allegrodvt.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-0-128956555677@allegrodvt.com>
	 <20251208-allegro_dvt_al300_dec_driver-v6-2-128956555677@allegrodvt.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9PpgWgu1SmrVxZIESce8"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_080611_731322_52C1161F 
X-CRM114-Status: GOOD (  18.07  )
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


--=-9PpgWgu1SmrVxZIESce8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 08 d=C3=A9cembre 2025 =C3=A0 16:49 +0100, Yassine Ouaissa via B4 R=
elay a =C3=A9crit=C2=A0:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>=20
> Add a schema for the allegro gen3 video decoder.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

You didn't apply any changes following Micheal review in this oen either. C=
ouple
of reminder below.

> ---
> =C2=A0.../bindings/media/allegro,al300-vdec.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 76 ++++++++++++++++++++++
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A02 files changed, 78 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.y=
aml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> new file mode 100644
> index 000000000000..12e86c306d55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allegro DVT Video IP Decoder Gen 3
> +
> +maintainers:
> +=C2=A0 - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
> +
> +description:
> +=C2=A0 The al300-vdec represents the gen 3 of Allegro DVT IP video
> +=C2=A0 decoding technology, offering significant advancements over its
> +=C2=A0 predecessors. This new decoder features enhanced processing capab=
ilities
> +=C2=A0 with improved throughput and reduced latency.
> +
> +=C2=A0 Communication between the host driver software and the MCU is imp=
lemented
> +=C2=A0 through a specialized mailbox interface mechanism. This mailbox s=
ystem
> +=C2=A0 provides a structured channel for exchanging commands, parameters=
, and
> +=C2=A0 status information between the host CPU and the MCU controlling t=
he codec
> +=C2=A0 engines.

Need to drop the marketing. In 10y from now, this won't be new anymore.

> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 const: allegro,al300-vdec
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 2
> +
> +=C2=A0 reg-names:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: top
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: apb
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 description: MCU core clock
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 memory-region:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 firmware-name:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - reg
> +=C2=A0 - reg-names
> +=C2=A0 - interrupts
> +=C2=A0 - clocks
> +
> +additionalProperties: False
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +=C2=A0=C2=A0=C2=A0 axi {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video-decoder@a0120000 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compa=
tible =3D "allegro,al300-vdec";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0x00 0xa0120000 0x00 0x10000>, /*VDEC_TOP*/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x01 0x80000000 0x00 0x8000>;=C2=A0 /*MCU_A=
PB*/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg-n=
ames =3D "top", "apb";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inter=
rupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock=
s =3D <&mcu_core_clk>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memor=
y-region =3D <&vdec_mem>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 firmw=
are-name =3D "al300_vdec.fw";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0 };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc56841fa5e5..67dfc2ee1725 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -837,7 +837,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
> =C2=A0R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained
> +F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> =C2=A0F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> +F:	drivers/media/platform/allegro-dvt/al300
> =C2=A0F:	drivers/media/platform/allegro-dvt/zynqmp

As I said earlier, I'd like to see Micheal/PTX as maintainer for
drivers/media/platform/allegro-dvt for now, and you with only the AL300. Th=
ey
have a lot more experience.

Nicolas

> =C2=A0
> =C2=A0ALLIED VISION ALVIUM CAMERA DRIVER

--=-9PpgWgu1SmrVxZIESce8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaT2O7gAKCRDZQZRRKWBy
9IEmAQDV/IIbEHPFgtPkIUcAdJW738DFPdZq0iZ+IicsY+Bk8wD/QlFzZSlnpyKS
xnn+pqyzWfvBl9CISKfBn+ebKaWQnw0=
=XdBA
-----END PGP SIGNATURE-----

--=-9PpgWgu1SmrVxZIESce8--

