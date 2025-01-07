Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5A4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfOXeXixgxr/lDKJT/RAbwwwphKuJpVBpnVCZ3E+HkQ=; b=PgnJzhVASgJqgop9BxmKt1xqn1
	yptbwUEzlYFE9gf/afVMoc/dCwklUxRwrYlTzdcLS9nb9ecDhfJy62LphFi2JuAWHOvI39bROp3HF
	YjzDQhY0r+N6ql6htp1aFS9c3v0zpRghkahMUPistYBxlWSPh2t8iOwIMjpuP6eh4GxxT4clo1A8r
	m69zlnPOW1qIpMQXLh/DLD0Y3RThqeGweeF5WiXyNWF4JsxIMlvtaGgh+mM61OjWU2ot0MOTZYM+b
	r3WMp4wTIF3Ebvk3T7Rv8eQz15d8AKXTc4tGhVyWn9lCs800gWMTHSBucI3Zth6tRI33YKhHWo5TO
	dVYB1svQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6re-00000004M7L-1zcx;
	Tue, 07 Jan 2025 10:31:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6HD-00000004Dpa-0Pii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:53:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436202dd730so109410235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736243609; x=1736848409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfOXeXixgxr/lDKJT/RAbwwwphKuJpVBpnVCZ3E+HkQ=;
        b=vtecTXc0fEE2LjhZItB6X1sweAmteesyuThnx+FoPqPgWt/EXfEw6IwxL8A0JAY9CK
         Ss18mgRQX3u/b01f2tVcrlLLxkHeO4oy966l9qG7k1xO5TjMFBs6hYMkkcybmv1+G9/v
         HRhwxG0t8qHNWX2m1JMBuDCorsMVsgRUv//dWsvDSN/Ih61ADE8U8WlFnW08b3mpYRSO
         Fse9HsrgF0kIbsxZ6zI6BrXirizT+LK3/gV2ejfFuqqgP1rCpgidJ79nf78EngfudpRg
         JvK6l9HJvcKDfpJI6HrhmNutxQpEqMZz3fxpO4BX86+0BBSZqMb6dURmKU+SksHY8fWg
         XjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736243609; x=1736848409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfOXeXixgxr/lDKJT/RAbwwwphKuJpVBpnVCZ3E+HkQ=;
        b=YiWtxZgTC/gJ3SE6gv6pWw4hHgnYRUzwiR72jM1uX+uxqq2eNLKeWVOySzr3nyXdVX
         47bv9XArZfZslbC+RG2aPbj5IjwuRRouuCNxt4vy57acQEvv8bqqD6+zmtA4B0N3z5v1
         NTyC7oahKInSd2nnO5vTB2w1xWug0PuYSlYw+0/cZFBvX2B25gxr9gd5H9t9qHgIR8l1
         qo8EorzfbBXE3F3f2tj2APuA1m0cS57AZiE5vJsyOaMiN+6KBzv3fvdSlzXGY4Yq2qi/
         flVuah+GEL35g0prtXDW7c1xHG9Nl4STGzPPtPVy5gcPLTputz7M80aSqjEJJJOfqrHS
         HdSg==
X-Forwarded-Encrypted: i=1; AJvYcCU2hzJ91+nUvWnc2IG8MrfUMmohe27wMtBC/KLBR8ai1ruPJyrrh8mdY3unWIRMTZIXNcYFXFvRhWpW6vvu3WD6@lists.infradead.org
X-Gm-Message-State: AOJu0YyS+GE7d9SzQ5eUV7JZWVJzF4Jk0g3BOhP/l7BBqBeqVNm+GzH1
	AMIOwVH+cYW4sHSQzooqHeztlbbJpveNGCnLQcUjqqGQhByLQcEIxg8HQ1x+obo=
X-Gm-Gg: ASbGncsCqFa7n6ek0i3hm5XtAOxJ7ZEIvaJskCfG4s7LZ3vFKP/yZ0CI5Xwy35JOrNp
	lz+NnsOPwQ1wloWkSDzr6l66f3qDBdMbGiKR8klxsZHHYmyOF/YqNObdhw3LuS/TM4lNLb78WNH
	tB1O0WoxKkZJ/jMvHrwhRVDqpHRJQcVhUcNjnqLA3r1ZkPnILH35MaGsGk0E45GZE9V5oyehbYH
	ls2nM/J3Rms2p0ntjwUvqIxFDCzswI5eBzAPH1x/S+R2hOoARgR
X-Google-Smtp-Source: AGHT+IHvX1OshrfmD6p1l0+Jh61zeJh68TXBs8zHN9+1raYn02+x8hZ0AZB5VEOINJMVZA2d+QJVZQ==
X-Received: by 2002:a05:6000:188d:b0:385:f7d2:7e9b with SMTP id ffacd0b85a97d-38a221f3785mr48240940f8f.30.1736243608128;
        Tue, 07 Jan 2025 01:53:28 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:3b5a:db2d:b2b7:c8b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6abesm49944076f8f.90.2025.01.07.01.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:53:27 -0800 (PST)
Date: Tue, 7 Jan 2025 10:53:26 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
Message-ID: <d6hukfwjqgtwqjgvo65icmpzbm32ob6n7ehrzlywwomjbdn5lg@2wm53244pszz>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com>
 <20241219-topic-mcan-wakeup-source-v6-12-v6-1-1356c7f7cfda@baylibre.com>
 <20241225-singing-passionate-antelope-88e154-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwtr634u7r3uhzqt"
Content-Disposition: inline
In-Reply-To: <20241225-singing-passionate-antelope-88e154-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_015331_351398_D75A76A6 
X-CRM114-Status: GOOD (  22.12  )
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


--pwtr634u7r3uhzqt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/7] dt-bindings: can: m_can: Add wakeup properties
MIME-Version: 1.0

On Wed, Dec 25, 2024 at 08:50:17PM +0100, Marc Kleine-Budde wrote:
> On 19.12.2024 20:57:52, Markus Schneider-Pargmann wrote:
> > m_can can be a wakeup source on some devices. Especially on some of the
> > am62* SoCs pins, connected to m_can in the mcu, can be used to wakeup
> > the SoC.
> >=20
> > The wakeup-source property defines on which devices m_can can be used
> > for wakeup and in which power states.
> >=20
> > The pins associated with m_can have to have a special configuration to
> > be able to wakeup the SoC. This configuration is described in the wakeup
> > pinctrl state while the default state describes the default
> > configuration.
> >=20
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>=20
> The DTBS check fails:
>=20
> | $ make CHECK_DTBS=3Dy ti/k3-am625-beagleplay.dtb
> |   DTC [C] arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb
> | arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e08000: wakeup-sou=
rce: 'oneOf' conditional failed, one must be fixed:
> |         ['suspend', 'poweroff'] is not of type 'boolean'
> |         ['suspend', 'poweroff'] is too long
> |         from schema $id: http://devicetree.org/schemas/net/can/bosch,m_=
can.yaml#
> | arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e08000: wakeup-sou=
rce: ['suspend', 'poweroff'] is not of type 'boolean'
> |         from schema $id: http://devicetree.org/schemas/wakeup-source.ya=
ml#
> | arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e18000: wakeup-sou=
rce: 'oneOf' conditional failed, one must be fixed:
> |         ['suspend', 'poweroff'] is not of type 'boolean'
> |         ['suspend', 'poweroff'] is too long
> |         from schema $id: http://devicetree.org/schemas/net/can/bosch,m_=
can.yaml#
> | arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: can@4e18000: wakeup-sou=
rce: ['suspend', 'poweroff'] is not of type 'boolean'
> |         from schema $id: http://devicetree.org/schemas/wakeup-source.ya=
ml#

Thanks, the bot also notified me about this issue. I wasn't able to
solve it without updating the dt-schema, so I submitted a pull request
there:

https://github.com/devicetree-org/dt-schema/pull/150

Best
Markus

--pwtr634u7r3uhzqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ3z5kgAKCRAkjLTi1BWu
P1hgAP4voovKy4zR8WCkwL+8S3ZCowjZyknLvSjGcbXBU0z0owD/aFzfe3ymIfCD
zi6dOgCGDyI9zo5QxMWmEvkbRaXn1ww=
=uv0O
-----END PGP SIGNATURE-----

--pwtr634u7r3uhzqt--

