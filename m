Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99795C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 21:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bzdLOutw45NuzUy8PqWXaJAtp7VYXU2KwETf6FwUq4=; b=2sP//WjT3zSP85yoSt3btlkQ1c
	hyzZR7FsSuCgCuAgzxe7rZLkiTz/vZM2gJtNlGdRSyZ4FSJhCCuMsvFH5bGlwQx4fG5rMG/nUp2QW
	UDKH5ZKYOYn9Rxm9UY0tc4974vixcAoJIeq/amnCtRCAK2SldLURoueW+GARfuRJOx3qdR+37J+W5
	/AXpApdZWMHj+US/Dz7Iz0R04HOerqJ8W231nWNyDq3BfQXcQJ/El0yx/tfUZ1abF9ZAlZRB1p4eO
	+9gGUlXAMC8adseml5d0Hvl5Y2VjlZ7EmQo863s4xthdTvSmmUsxFvx3+eOiKp/a9Ww0RoXCSVtWv
	KClz/aQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyUZ-0000000D1rU-3QbB;
	Thu, 10 Jul 2025 21:07:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwyZ-0000000CoqY-3XRv;
	Thu, 10 Jul 2025 19:30:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752175820; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I/ka+SLGhV+QGCE7fhGV9qYnglLgy9/7ibP/VHkpOEkzzlN+hYr3n1hU+m0Czd3JuzQEcq3dJutzOQDlLs4uuTOHYI/Lj8p3iXdTFweEpCXHRjKKkqLQ24u3kz7ogTT6ITQRIH8buzu3rmYlidtSoboB93yZBpHRO+aGTxnuDY4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752175820; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2bzdLOutw45NuzUy8PqWXaJAtp7VYXU2KwETf6FwUq4=; 
	b=KGNFyCXuU/Eu7gI53XiCbXZ+2vpS1Ajv5tsP6P5DkQZQ7IogkRrzv2E2nSQ6QPoYGfJZFxB9rHfMFncR5gkPpshEpNmhmshWWYu93Hkr46rex2NKwDW57U5JARz8hTeTCfu6ErwawJQdGWt5x+2Gy63PfS87RHWiQxSiNu09gwk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752175820;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=2bzdLOutw45NuzUy8PqWXaJAtp7VYXU2KwETf6FwUq4=;
	b=kw7up1/5sk7CS9DwqFvhC738rMQmLkDy+YBescJyPukKyMiQXceMUwSSbDObh1iU
	ZFgMXP3VSkSTnRsOVkc3kmN5JNUm1ed5mQHxwFolk5+x8M8+Yi9IJdDT66VzpDBwZwD
	9Sono6bXrQ7cofGqQpGwIZMHjH9DgKP4GZKvxFWQ=
Received: by mx.zohomail.com with SMTPS id 1752175818697100.88359010230067;
	Thu, 10 Jul 2025 12:30:18 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alexey Charkov <alchark@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/7] dt-bindings: thermal: rockchip: document otp thermal trim
Date: Thu, 10 Jul 2025 21:30:12 +0200
Message-ID: <6505070.lOV4Wx5bFT@workhorse>
In-Reply-To: <3592348.tdWV9SEqCh@phil>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <20250610-rk3576-tsadc-upstream-v6-4-b6e9efbf1015@collabora.com>
 <3592348.tdWV9SEqCh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_123035_944630_C70F4C74 
X-CRM114-Status: GOOD (  19.42  )
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

On Thursday, 10 July 2025 13:21:19 Central European Summer Time Heiko Stueb=
ner wrote:
> Am Dienstag, 10. Juni 2025, 14:32:40 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Nicolas Frattaroli:
> > Several Rockchip SoCs, such as the RK3576, can store calibration trim
> > data for thermal sensors in OTP cells. This capability should be
> > documented.
> >=20
> > Such a rockchip thermal sensor may reference cell handles that store
> > both a chip-wide trim for all the sensors, as well as cell handles
> > for each individual sensor channel pointing to that specific sensor's
> > trim value.
> >=20
> > Additionally, the thermal sensor may optionally reference cells which
> > store the base in terms of degrees celsius and decicelsius that the trim
> > is relative to.
> >=20
> > Each SoC that implements this appears to have a slightly different
> > combination of chip-wide trim, base, base fractional part and
> > per-channel trim, so which ones do which is documented in the bindings.
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>=20
> Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20
> with one question below
>=20
> > ---
> >  .../bindings/thermal/rockchip-thermal.yaml         | 61 ++++++++++++++=
++++++++
> >  1 file changed, 61 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal=
=2Eyaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> > index 49ceed68c92ce5a32ed8d4f39bd88fd052de0e80..573f447cc26ed7100638277=
598b0e745d436fd01 100644
> > --- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> > @@ -40,6 +40,17 @@ properties:
> >        - const: tsadc
> >        - const: apb_pclk
> > =20
> > +  nvmem-cells:
> > +    items:
> > +      - description: cell handle to where the trim's base temperature =
is stored
> > +      - description:
> > +          cell handle to where the trim's tenths of Celsius base value=
 is stored
> > +
> > +  nvmem-cell-names:
> > +    items:
> > +      - const: trim_base
> > +      - const: trim_base_frac
> > +
>=20
> are we sure, we want underscores here?
> trim-base, trim-base-frac looks somewhat nicer.

a quick grep of all the bindings shows me that _ vs. - is about even.
I'm not sure deviating from what downstream calls it, what I already
sent, and what the already sent driver expects is really worth anyone's
time and mailbox space for what boils down to a matter of personal
preference.

>=20
> Heiko
>=20

Kind regards,
Nicolas Frattaroli





