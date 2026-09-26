Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3EAC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYYaiwkOPUjr+j4UaQRgxxzscg0L0EnuNJCXdqEfXQA=; b=KOswLaegjAteso9R8xLsPsGF/S
	xA6wIBXGaIHzDuHZGE31H1LKGajz7bHIZlzmQ+IgcpXoeD7/zuAe/LrF3aju2+26MWsVkpZdMsnUU
	MFtNUWVeediV5S3KjtdMrhXBuXSboS4CHi2/vUourE3ZEN0Ebt459TJrR1+Iqb4Hr6fp8g9e8+1+y
	sQSwdH6clcqM895+BxigH5L30ZrXsa2DdlZ+oJUHJXIgbzcjmVed/Jkc4/AAPt+B1c9abaKbTmw7a
	iCCZ7YLgZXkX5NPSl/d+SNWjqKIRCjEPEELtVtDM+tEbPDeWF7XYWI7iQXxeATI8ekNw5Bl27qZ6H
	e4/e8nBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAWmt-0000000FhM9-1v4r;
	Sat, 26 Sep 2026 18:06:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAWmr-0000000FhLu-23S2;
	Sat, 26 Sep 2026 18:06:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A31C9415AB;
	Sat, 26 Sep 2026 18:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD071F000FF;
	Sat, 26 Sep 2026 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790445972;
	bh=wYYaiwkOPUjr+j4UaQRgxxzscg0L0EnuNJCXdqEfXQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C3PKcs1G4z0FBX4/p60m8PgMsiYXohlNrKywBMGRldUPqllqJx0F14cckjHQvfkG8
	 QCW+MZ5gc3DA1+BJteWB9rZx/KBR1o/BTKZkhAbaJwZ5LAf6aHKvt/XCSEF3WtqQQ6
	 on5j+9CYViLcFfz0F+OTSvy8Lc1eXPnmkQyP64+tpawKHo0+KdG6dntzT8pU/XWgcp
	 Fy25Fuz46gPGN+/NavM4wGEmi3M3Cqzf9AEEqk/S/1xp2OS5aW1m2YqZnyTUdYJshq
	 xipS//mCqGJk+0DVEmnG/7MK9EqtWjtMf4rAZEJn8GVQX4R7xb6amKddJagXh/ISBY
	 F7si8ncPH5aHQ==
Date: Sat, 26 Sep 2026 19:06:07 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: amlogic: Add core clock for T7
Message-ID: <20260926-landless-prowess-df404db4d910@spud>
References: <20260925-add-t7-sys-pwm-clk-v2-0-f23a22b71a5c@aliel.fr>
 <20260925-add-t7-sys-pwm-clk-v2-1-f23a22b71a5c@aliel.fr>
 <20260925-facial-follow-032de22361c1@spud>
 <8e23838a-da5e-499c-a8be-3e2a7a0939e7@aliel.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LVLyBwFl5JS2r2Gm"
Content-Disposition: inline
In-Reply-To: <8e23838a-da5e-499c-a8be-3e2a7a0939e7@aliel.fr>
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

--LVLyBwFl5JS2r2Gm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 11:43:20AM +0200, linux-kernel-dev@aliel.fr wrote:
> On 9/25/26 6:41 PM, Conor Dooley wrote:
> > On Fri, Sep 25, 2026 at 05:13:28PM +0200, Ronald Claveau via B4 Relay w=
rote:
> >> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> >>
> >> The T7, A1, C3, and S4 PWM controllers have a system clock in
> >> addition to the two input clocks of channels A and B.
> >>
> >> The channel clocks are acquired by index in the pwm driver,
> >> where the core clock is fetched by name, with optional get
> >> which is silent when not provided.
> >>
> >> Require clock-names and minimum 3 items for T7, where the
> >> PWM devices do not work without all 3 clocks.
> >>
> >> Add an example showing T7 usage with its fallback to
> >> amlogic,meson-s4-pwm.
> >>
> >> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> >> ---
> >>  .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 33 +++++++++++++=
+++++++--
> >>  1 file changed, 31 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/=
Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> index c337d85da40f1..59320f288552b 100644
> >> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> @@ -62,7 +62,7 @@ properties:
> >> =20
> >>    clock-names:
> >>      minItems: 1
> >> -    maxItems: 2
> >> +    maxItems: 3
> >> =20
> >>    power-domains:
> >>      maxItems: 1
> >> @@ -140,13 +140,34 @@ allOf:
> >>      then:
> >>        properties:
> >>          clocks:
> >> +          minItems: 2
> >>            items:
> >>              - description: input clock of PWM channel A
> >>              - description: input clock of PWM channel B
> >> -        clock-names: false
> >> +            - description: gate clock for the PWM controller
> >> +        clock-names:
> >> +          minItems: 2
> >> +          items:
> >> +            - const: channel-a
> >> +            - const: channel-b
> >> +            - const: core
> >>        required:
> >>          - clocks
> >> =20
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: amlogic,t7-pwm
> >=20
> > Shouldn't this (based on your reply on the previous version) be s4?
> >=20
>=20
> The change above is for S4 and SOCs which fallback to S4. It allows the
> third clock but let the schema validation compatible with two clocks
> existing DTS. Here for the T7, I add requirement for the exact 3 clocks.
>=20
> Do you recommend to require the 3 clocks for all S4 and S4 fallback, and
> update the associated dtsi files ?

Yes, I think so. Sounds to me like they only work because of the
CLK_IGNORE_UNUSED set in their clock controller drivers, so the correct
thing to do is make them all require the third clock.

Chers,
Conor.
>=20
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 3
> >> +        clock-names:
> >> +          minItems: 3
> >> +      required:
> >> +        - clock-names
> >> +
> >>    - if:
> >>        properties:
> >>          compatible:
> >> @@ -182,3 +203,11 @@ examples:
> >>        clocks =3D <&pwm_src_a>, <&pwm_src_b>;
> >>        #pwm-cells =3D <3>;
> >>      };
> >> +  - |
> >> +    pwm@60000 {
> >> +      compatible =3D "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> >> +      reg =3D <0x60000 0x24>;
> >> +      clocks =3D <&channel_a>, <&channel_b>, <&core>;
> >> +      clock-names =3D "channel-a", "channel-b", "core";
> >> +      #pwm-cells =3D <3>;
> >> +    };
> >>
> >> --=20
> >> 2.49.0
> >>
> >>
>=20
>=20
> --=20
> Best regards,
> Ronald

--LVLyBwFl5JS2r2Gm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCargJjwAKCRB4tDGHoIJi
0hGlAPwPcQT485NFPVpsmaLttMgeXLihgXcxvovjhjL6RFevHAEAhbpFtA4RAfsa
N/8aLtpv423553Psdr1Wrc70RFZcTwA=
=Qo82
-----END PGP SIGNATURE-----

--LVLyBwFl5JS2r2Gm--

