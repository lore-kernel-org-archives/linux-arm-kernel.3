Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3174E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogDvQuxZCfNt1Ru7I9JPhd99nAVbLXq1Mqqm/59cazg=; b=mWjLF53DG4mI4Nxf1qS/5JM+GR
	fBBI2Bl8Y+sUIxBVpedWCdtqbK4OkoW3arvMVMv+5/mk6kj4QOTwz4HZRQ1vL8a/G8Kug8yOFW4/+
	AldiZUlxtc+ehyiQ0tE76FA/jHsrq93c6MkFoGBvJAGFQ++l8vHXsXUfxJms4a52tFoZwQQXd655N
	r69ZnvXgOL6GbAA9ehaaZ8KRvUPJ2fTH+/gvZ5HrYFDE6BjKf/X2ZuE6pG7ADGNFoscge2hzTghMp
	sdrwGhnLuowBQTZPm7BmS3bIsVCBbtxBuJ1IlwXJGmHwC2dR2gitaEeNDq3Woe4BnS+HNUBx2jLE8
	yb/E3thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAN4-000000059AT-24jA;
	Tue, 07 Jan 2025 14:15:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVADG-000000056ZN-0kbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:05:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso162510365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 06:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736258740; x=1736863540; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogDvQuxZCfNt1Ru7I9JPhd99nAVbLXq1Mqqm/59cazg=;
        b=hEvN488No3z2NL+d8Z1rN0OoYkCk3HDL1ab3cJSrTCX2klp8hcCW3XS/efh7Z6VzVN
         5wAmrKQACXQfz8835s/MawaY+V46bx7XrEqjPZQ97gll3shQtX6MBtJ4Kc0ovFvnS9sf
         Yi74iSWPSYvjza/gMi4NJKLoIWkDls1cU/d7IjCiu+s7sZmqskqtNZbxS1dVbJ1mS3BS
         iOYLMMYeBc73lg/RPbapRojskpw0Ru4bCWHiSAFFLkvzDB5NP7iJI+mSy80toY/lRl/J
         J8VXQivvOvEeRM42SEhiYPWmD1f7UX7s3/KfVhd4jcXbVQZmjgvCqYOyEOGhcktVtiVS
         hMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258740; x=1736863540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ogDvQuxZCfNt1Ru7I9JPhd99nAVbLXq1Mqqm/59cazg=;
        b=unif/vdEsVAQAj+YfK/VWInT17Yjkhdx/vzJU4JzhfTnKlxSfAMq8KFEIukzIP8rlG
         0UhGwkbUVTYR/d6U9Ia7Ld8fNjopuiSL3TYbxLZnjocWfTNPpTzrO83/Z7TrcKR9rlT7
         Hltq+nbrpKF7GeNX2dXc1Sql8t6YG0jtpTRGjQrlY16u3319Js3vAceIr2igX6VB+ooD
         0sXg+7+nkmbC1EuAmCkj2ipli4sNelwHnQ22kZwJjNNWm9Mw98/nYK55zVqhCnJVOmnQ
         wf5DS9tY6X4Idr6OY5o+PzdEZpQd8Vr9hC5tH6oGZhSP+ZCO7Bh620s4aRAnZMhoB/IK
         Hkbw==
X-Forwarded-Encrypted: i=1; AJvYcCW2TOz/68bmB9kFaLqreeo2aW28N+4w9xq++WGkodPY5P+R1k4EZe2/eWTxf9x2vXcmEdMGAwt8Iy4msKCjXIws@lists.infradead.org
X-Gm-Message-State: AOJu0YybyhlpNMTH36Fv2ZvBBedeCOoYLuLHt58OUFz90k9S0YC2GU3l
	Vzpyh5uCWIsWlj2zzekMBCvcS1uOUh+mi/BFmad2Rkd1yNVoA4z9
X-Gm-Gg: ASbGncumwi3/xk2Zu+JSFXuM9j2yEYcAPlcEBB2sqLqLog31IrZvO74EwftKPRfPrnZ
	/sEyAbQIJE/RzFudp3USINJjfYWktMRirsvvi/VpWqcd+McjCS69u3aYSKCCjES3hsGGWdIXWux
	Xa4Q21J0+LNl55rY3d5E4Lncu2LRHYewkf6Hp0NtZicbdpvP3QhyimBphntkPussV876QxldqSe
	Q1g6OnqflyfTI182vUMLpu7qTIEv8aWPIrgxOooHxzWBlWJ9X+4YvyteeppCR/p6YizvNtiWNvh
	0I7PfoRADA+Ow1mueeqnH1sV4jfo
X-Google-Smtp-Source: AGHT+IFfnR028agDjwlWikAvh1/VvkkB81kquDbtSxlA/ds53ntX4cuO1Pb8zCXNAsdBuSSK5XCcsA==
X-Received: by 2002:a05:6000:4612:b0:385:df5d:622c with SMTP id ffacd0b85a97d-38a221f36e3mr46390632f8f.30.1736258739438;
        Tue, 07 Jan 2025 06:05:39 -0800 (PST)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ace0esm49742230f8f.106.2025.01.07.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:05:39 -0800 (PST)
Message-ID: <bc6a76d6e59c0271bf907cd2cf6dd3c03cc59c2e.camel@gmail.com>
Subject: Re: [PATCH] dt-bindings: pwm: Correct indentation and style in DTS
 example
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Hennerich	
 <michael.hennerich@analog.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Trevor Gamblin <tgamblin@baylibre.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 07 Jan 2025 14:05:37 +0000
In-Reply-To: <20250107125831.225068-1-krzysztof.kozlowski@linaro.org>
References: <20250107125831.225068-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060542_225061_03BFB664 
X-CRM114-Status: GOOD (  14.04  )
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

On Tue, 2025-01-07 at 13:58 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Nuno Sa <nuno.sa@analog.com>

> =C2=A0Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml | 8 ++++-=
---
> =C2=A0.../devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++----
> =C2=A0Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml=C2=A0 | 8 =
++++----
> =C2=A03 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
> b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
> index aa35209f74cf..45e112d0efb4 100644
> --- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
> +++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
> @@ -41,8 +41,8 @@ unevaluatedProperties: false
> =C2=A0examples:
> =C2=A0=C2=A0 - |
> =C2=A0=C2=A0=C2=A0=C2=A0 pwm@44b00000 {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "adi,axi-pwmgen-2.00=
.a";
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x44b00000 0x1000>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&spi_clk>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #pwm-cells =3D <3>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "adi,axi-pwmge=
n-2.00.a";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x44b00000 0x1000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&spi_clk>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #pwm-cells =3D <3>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> diff --git a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
> b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
> index 119de3d7f9dd..44548a9da158 100644
> --- a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
> @@ -35,8 +35,8 @@ additionalProperties: false
> =C2=A0examples:
> =C2=A0=C2=A0 - |
> =C2=A0=C2=A0=C2=A0=C2=A0 pwm: pwm@f0408000 {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "brcm,bcm7038-pwm";
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0xf0408000 0x28>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #pwm-cells =3D <2>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&upg_fixed>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "brcm,bcm7038-=
pwm";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0xf0408000 0x28>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #pwm-cells =3D <2>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&upg_fixed>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> diff --git a/Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml
> b/Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml
> index e86c8053b366..fd785da5d3d7 100644
> --- a/Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/brcm,kona-pwm.yaml
> @@ -43,9 +43,9 @@ examples:
> =C2=A0=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/bcm281xx.h>
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 pwm@3e01a000 {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "brcm,bcm11351-pwm",=
 "brcm,kona-pwm";
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x3e01a000 0xcc>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&slave_ccu BCM281XX_SLA=
VE_CCU_PWM>;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #pwm-cells =3D <3>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "brcm,bcm11351=
-pwm", "brcm,kona-pwm";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x3e01a000 0xcc>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&slave_ccu BCM281=
XX_SLAVE_CCU_PWM>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #pwm-cells =3D <3>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0...


