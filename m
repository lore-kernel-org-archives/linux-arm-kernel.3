Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE402E7544D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3W9jCb+QmhgFO07BnEKeRfiQa/LuwbGaIH7AYV4ri+U=; b=0pDNj5XDl7I63YmVvckeo1byHB
	hWxWq5PoBUQbz3OGnqFimNXTnMHYLazyV1BT6ybtJcmGajfRYfKop9T29uOo0iIRXvYbhrlTJyrB9
	zL0L0tIqt/PmrbqRaLjSYQsYjKDQmr7rOBvKLHCllcrdnKuLF1Ruipee7wrcE9FFQUDSVxtLN8OWr
	j3DH8k15HUCBEazhULxaV7wpq9a6WIBuR4HCKg0vR+zUXj8Nwp3kbioQxuCKXD1CJKEvp9iq41PN6
	g2+MxAYyOdZ/ZwMT/2gP4CZDtwmo8++IHyx//it+CDO97yzSLU3v+EOhCwNAlRaWGzJZTtxQaiX+R
	4xJ4f1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLdm-0000000GebB-2yT7;
	Wed, 24 Dec 2025 09:58:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLdk-0000000Geak-1PTq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:58:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so42307535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766570322; x=1767175122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3W9jCb+QmhgFO07BnEKeRfiQa/LuwbGaIH7AYV4ri+U=;
        b=ev811br36uMUJiLO5R25rs7DF2e4uaufow7qdIcUMggW9fW8G0oCQq2l5PjST96C+K
         1xG9gEx6cAlbvj75MtI92yPq9WMwfngcV6JQv5TxbapPCTuWEfAoSBnRtF9QNfiQr9ts
         0memTA3rxNGubRpAofE3P1IHYtjVrUyztV+FQvH7IH6PQBwM54OpgO13pWDUaq5bYpHo
         Ikk48y2iK6wd743GncXfcpRBr77IxfbvNNv/xcfxfr6vvC+bU7BER9uViF5tkSLT4PJd
         ED+93oIr8qBQsT1xIvRkldHeiBBXsBgqqNfyr/dD8g49X1w07rlqi5t0V0HrapGl84kl
         cfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766570322; x=1767175122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W9jCb+QmhgFO07BnEKeRfiQa/LuwbGaIH7AYV4ri+U=;
        b=oFDdbx4PxgBzCNtnL3K1IYPF8vLOnfVdBgkFMZHO9Zuo+n/zMqxEnltKRQvyy9PQ7N
         VChoJOzY7tZ2GQC7QSRVa8pByi2/+U0M/gwdFsltiK/fV6SlSANVkw4Pz4+WhogLSwwp
         epZVU7iNl4PcBFRxUbCcHqPyCwXVgWIEBXAYvbddkViNQUSXdztNaX8kFxjcrpIbpYl1
         zsLPN+uGJa45dKuNNHJWaRE/xqPExTimH94z7iWCTbcMXfsJVtwO14kJZ439h1vQgnEW
         1hKlgiUW5Y3SrwUIhxphtATH4CsBhNCZrhJ8juHoEArqkVrWiMvKR/Z469FbM/UbKtje
         0YRw==
X-Forwarded-Encrypted: i=1; AJvYcCWgqqxmyPWq6V5nYIcgUKiIp/dSTWXmWMVt6+rexTbBb99FEA77cGj0cNQnzD6UyVSBj/Nlr7t3DZidScrsMeeZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxzijtUWwFgdHEy7WFLANliQX8W8FIGIuYglm36KsDeDtrxpcI9
	vGO6xpLvWiE0e6ftFrefAHsMv890vFrd/ArsKHUZJqRN6mH3PBR66UvN3yMJlMK4kdE=
X-Gm-Gg: AY/fxX6oFk6rOHum4ZD5fwxZ2nQDK3zEI74fpUkxp+33+g1owPI3XzpNhPEfRgxXtH/
	KxVPSNmm/CnkfeZ2Fz3iyQO20PYkxEvnnw+YiAlraBWOGKPFjZfg/hrFKSa6oIfH12TW19+YjZb
	5Gsn1rgWIRlmCecFRRyzp1YF5hE9JuvM4WwWeZzK6pKUP5IaO+EC8ahCOQl4sG7YXo82hZCA0ad
	ia6niV0FYH+OvoJpC+fKO2YGY8mKsCOs6af9moIh+cBFI6DC68ZCd9c/49TVn3p6/M3N/mgK/Cr
	3LajbRQJTWZGbjiqr8qTxGobLZnqTYLJLOAJtb3B8GsV8letFsgsMUfguDtOpnR/i0mA1GR2Auy
	IQ5HZ8bwsQAEtzshDK9vJmSIdg8hM8WJfTvCHAg5GAEQvasBswVW0mC2lTV+SOWUkNZ+ttoIxhQ
	hszlItM0g5iKYdsdsFU92K6DC/hoNuJ5a9iPtU7EEiq4zXO9Db
X-Google-Smtp-Source: AGHT+IFfcuTV7Ug+hHX5tZTCG4tq3O4PaTRJvfFv6G9+yLiBklGAMOZE/zio57FP/aM+ckx9YK7JaQ==
X-Received: by 2002:a05:600c:1988:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-47d216f9b5cmr104213055e9.2.1766570322064;
        Wed, 24 Dec 2025 01:58:42 -0800 (PST)
Received: from localhost (ip-185-104-138-126.ptr.icomera.net. [185.104.138.126])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47be395d9cfsm138801615e9.0.2025.12.24.01.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:58:41 -0800 (PST)
Date: Wed, 24 Dec 2025 10:58:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Introduce Allwinner H616 PWM controller
Message-ID: <5ih4qxr7572x6fakxjsx2vrxnt3yey2dtvdyaiwyuvulivh3ef@hebpjfdginev>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
 <6113404.MhkbZ0Pkbq@jernej-laptop>
 <160e221e-98a8-4097-8340-94ac7d208136@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isiyzcztmhye4ftq"
Content-Disposition: inline
In-Reply-To: <160e221e-98a8-4097-8340-94ac7d208136@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_015844_412056_667768C1 
X-CRM114-Status: GOOD (  12.73  )
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


--isiyzcztmhye4ftq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/4] Introduce Allwinner H616 PWM controller
MIME-Version: 1.0

Hello Richard,

On Mon, Dec 22, 2025 at 10:17:07AM +0100, Richard GENOUD wrote:
> Le 21/12/2025 =C3=A0 20:12, Jernej =C5=A0krabec a =C3=A9crit=C2=A0:
> [...]
>=20
> That's why I put aside the pwm-clock and I went for this instead.

I havn't tried to understand the issue in detail, but would it help to
use assigned-clocks to make pwm-clk suitable? Assuming this allows to
drop all the clk stuff from the driver that would we very appreciated.

Best regards
Uwe

--isiyzcztmhye4ftq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlLuU0ACgkQj4D7WH0S
/k5ZeggAmSXzq+7SM5fhXqm2YGPnsK8wxgPcAF1ZdU4MGph24TU4R91q/56X2Ayd
OUxDHsO4bEZXGwd0taoVdkCJf3WcDipjGJ+lfKgRCT5569BE5seDZDASgIlnPu6O
ZRog3BGrI85GM5Gq/sG8zpiqdbeK2/49huTSo2VRN28+elurTzP7MXMEVdJ4ZLPR
fmvo/ERCkz4giB8YgjM75WsImYiEehzraLTJ1EXhBq5WxbqMMwEKy6s7NT6t5H1+
U+/8buxQllY52OKOyqLBBWbQpaAqSc28evvjUOikxuLAMk/I2FbPHnDoJRUz7GRO
Ufu2ihMbS+cRebq2spwZSq1RoiCx/g==
=uvSc
-----END PGP SIGNATURE-----

--isiyzcztmhye4ftq--

