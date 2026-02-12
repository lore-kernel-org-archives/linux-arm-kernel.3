Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F5EEB4911
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPXBLe0yJUYbIoGyT5kMiHrz15M67LzrqjA/DC/nqFM=; b=yCyxoLdCBv3kxE0U96lvsoRM2f
	bhF8offXWGNrQEEvbOHJaH+C/HmzM9XhAj+x7IJtdmdUJ+gnCRP9oGuRkuqHWnwLznOkc0AQiL2Kt
	+QqVfNmDZldaRqyD+wLko498zTZ99GxNPHI9YRk30cEqRtfb/o8UGKxvM1y/l8swkGM/skX4vxNUo
	oEu5ZHw+rt27GNSEedi3Z3O5aRt3c7zxXsdOIDDeASdh9g9uI735aEK0/ZwiE71MO2LWPK/r/fn3I
	VTL7E7o8Vl0nxnEl0RMTrKdDuEQLVfVxzwXM1CKNN75TgNJXDnS8VReV56NsZrDdjThe0blzjDAnZ
	NpQzilcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVQ6-000000022yb-0Qbi;
	Thu, 12 Feb 2026 12:03:42 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVQ3-000000022xI-0XC9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 12:03:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43621bf67ceso4024621f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770897817; x=1771502617; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IPXBLe0yJUYbIoGyT5kMiHrz15M67LzrqjA/DC/nqFM=;
        b=Ne8+jkZYpgT7J/H7KMdNGqIEml+XslkvxTYZpz7/qw3942ep9RIV8GjPm8SYO54Jsh
         B6gVDTl1JNSJhOXCWfkZHc44IHFQpdwIGp/4ShIjqd+4QjKQaO7U1Gf8FmgmHFn4T4PV
         pSt28Qm1OR2ip7U/eS347IUUeWQhoUHUp8cuqHcE9nLY75tvUWfVouSyXNviI+9tqZIB
         pbcL7SkRnc/qhSDb3N3/cPJ5j6Wdo4r4N67E3GxQxW56uGCiyd9g0igtQbNRAYYEyphY
         ndBfj07oeW4iHyjrjAaChVil/JEx1kz3KcmbU5FWrSL1ezmhMryeVc0VqIG3hXiaa5bV
         ZUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770897817; x=1771502617;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPXBLe0yJUYbIoGyT5kMiHrz15M67LzrqjA/DC/nqFM=;
        b=Q3a7tw0VNUFXrNIGmbbzft9mBqE3V+7VqXNF5VunRElwyvLY4xFAhafzZByz/eToRl
         omZc6LMk6x6d3obEraGUTXZuKe1TZEfRUBZgtXRiNhb0HRu8KGVYYGdCekrnqlM4jLrU
         9f9IVQ9Tj4hQ9zvTbPYt53hn2EY6G3KOuQ/KG+TbiHOOUnGohxmjIvZY3kIaVLhZaREC
         05N75MAzj7ke5UhJdiMMZaRYVL0H86c77Lcs3BDMQC170anMi/AoR5SUbG15HZi8ZnRX
         HUDqi8rv/OIijV1b4gErAhvQx2gFKXW4f5EtHwmOHMt+Bxt9Ys3+f19wKyQTVouC1Yk3
         m+mA==
X-Forwarded-Encrypted: i=1; AJvYcCWAD/Q7nwkdCr0rHmtgbuN4Vb/JZRFrDk/x+PJTxKBkpI1/Q+10yU8+7G7f1s8Z9bEHUnoReeWaXFTDfd6/pPPq@lists.infradead.org
X-Gm-Message-State: AOJu0YyveqTFb2oGBFdxs2oq4pTSWj8I8BiQiAO2IfJmfeA63i+qGpQb
	LYM3o7mj1WDPBLmsxHshcpxYWcb0+lL/HNXYgcABV3quJEfKd60SRWipwvE+eghtF6s=
X-Gm-Gg: AZuq6aKgLhtLzndQ61OE/+16F2PskHMKtTEmEX6MdpZ3u7TB/Lm3X7z5DROqmLhkPp5
	ZVgj7zuwD5ulR8Og12yu5WsJaLASg7snJU5OWsF+JUU6M7zM7Aqb9Jhm/cloQMEW6ikSayLZsxl
	IeI3PLg5I9YZFCAKbeoqw9399xdkMu54rCnjnNfFCCwgTjJOFHLx+swmHvBVq5eb4Xj/z9S5Bs0
	l0qMvO8FUmiHwsVwVfLJjCINAAyMD699gWOgGpVYEh3KJFc/PumBWnW2CgOaNTQ35hWViEo0P73
	HNWRJtVZ71r3BsGhuYEMiGgzsCLDAko/sOIWDqwi5ENw53qKKKqZxbbVVsALLT3Oe+Dwuj2u1+q
	4UVBrQVbtHdmcpNlQ3J2CsqGDexo8V/G9exjtzsNuA0DWpYBC/jyhuWJ/5wym1X+uoPNFG5+iK7
	tUheAxDTK0lmQOPeBfIkWCjr941UYIRHlo4fxCAt5N
X-Received: by 2002:a05:6000:2901:b0:436:233c:c7c2 with SMTP id ffacd0b85a97d-4378aa0c732mr4446267f8f.16.1770897816772;
        Thu, 12 Feb 2026 04:03:36 -0800 (PST)
Received: from draszik.lan ([212.129.82.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783dfc8b9sm11365172f8f.24.2026.02.12.04.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:03:36 -0800 (PST)
Message-ID: <b5078af810a681333043f64d71b7d6ea55ff44bb.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 12 Feb 2026 12:03:38 +0000
In-Reply-To: <20260211211229.GA3882182-robh@kernel.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
	 <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org>
	 <20260211211229.GA3882182-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_040339_197655_86908E30 
X-CRM114-Status: GOOD (  30.54  )
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

Hi Rob,

On Wed, 2026-02-11 at 15:12 -0600, Rob Herring wrote:
> On Thu, Feb 05, 2026 at 09:42:32PM +0000, Andr=C3=A9 Draszik wrote:
> > The power domains are a property of / implemented in the PMU. As such,
> > they should be modelled as child nodes of the PMU.
> >=20
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > v4:
> > - consistent quoting using " (Krzysztof)
> > - add samsung,dtzpc to example
> >=20
> > Note: Ideally, the newly added properties (ranges, etc.) should only be
> > 'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
> > as they're needed only in that case. As-is, this patch now causes
> > warnings for existing DTs as they don't specify the new properties (and
> > they shouldn't need to).=20
>=20
> We can't have warnings added if they aren't valid.
>=20
> > Only if DTs are updated to include
> > power-domains, such an update should also add the new properties.
> >=20
> > I've not been able to come up with the correct schema syntax to achieve
> > that. dependencies, dependentRequired, and dependentSchemas don't seem
> > to support patterns. Similarly,
> > =C2=A0 - if:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ...
> > =C2=A0=C2=A0=C2=A0 then:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ...
> >=20
> > doesn't allow patterns in the 'if' block (or I didn't get the syntax
> > right).
> >=20
> > Rob said in
> > https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
> > that this is a known limitation in json-schema.
>=20
> For a given compatible, you should either have child nodes or you don't.=
=20
> The h/w is not variable. So something like this should work:
>=20
> if:
> =C2=A0 properties:
> =C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: foo,bar
>=20
> then:
> =C2=A0 required:
> =C2=A0=C2=A0=C2=A0 - ranges
> =C2=A0=C2=A0=C2=A0 - '#address-cells'
> =C2=A0=C2=A0=C2=A0 - '#size-cells'
>=20

Thanks Rob, yes, that works in general, but unfortunately in this case exis=
ting
DTs don't specify ranges etc for the google,gs101-pmu compatible. (This bin=
ding
is specifically for google,gs101-pmu only anyway).

The above suggestion will cause the same validation warnings for existing D=
Ts
which is no different to just adding those properties to the top-level requ=
ired:
as my patch is doing. Unless I misunderstood your suggestion.

The compatible doesn't change with these patches. So I'm not sure how to ma=
ke
your suggestion work without causing warnings for existing DTs. We can eith=
er
have an old incomplete DT+binding:

	pmu_system_controller: system-controller@17460000 {
		compatible =3D "google,gs101-pmu";
		reg =3D <0x17460000 0x10000>;
	};

or the new one:

	pmu_system_controller: system-controller@17460000 {
		compatible =3D "google,gs101-pmu";
		reg =3D <0x17460000 0x10000>;
		ranges;
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		power-domain@1c00 {
			compatible =3D "google,gs101-pd";
			reg =3D <0x1c00 0x80>;
			#power-domain-cells =3D <0>;
			label =3D "eh";
			samsung,dtzpc =3D <&dtzpc_eh>;
		};
	};

I.e. in the old case (when binding + DT were incomplete) ranges etc. are
not 'required' (and shouldn't be), while with the power-domain@[0-9a-f]+
child node(s) added, ranges etc must be specified.=20

If power-domain@[0-9a-f]+ wasn't a pattern, it'd be easy, but I really want
it to be a pattern, not least because there are so many instances.

What works (at the top level) is:

    dependentRequired:
      power-domain@1e00: [ranges]

but it would require spelling out all the instances instead of a pattern. T=
he
following (or various variations I've tried) doesn't:

    dependentRequired:
      power-domain@.*: [ranges]

I've also tried to come up with something involving dependentSchemas:, but =
to no
avail.

Similarly,

    allOf:
      - if:
          anyOf:
            - required: [power-domain@1e00]
            - required: [power-domain@2000]
        then:
          required:
            - ranges

works, but when using a regex, it doesn't:

    allOf:
      - if:
          anyOf:
            - required: [power-domain@.*]
        then:
          required:
            - ranges

I've also tried:

    allOf:
      - if:
          required:
            - "^power-domain@[0-9a-f]+$"
        then:
          required:
            - ranges

and

    anyOf:
      - required:
          - power-domain@1e00
          - ranges
          - reg
      - required:
          - reg

and

    anyOf:
      - required:
          - "^power-domain@[0-9a-f]+$"
          - ranges
          - reg
      - required:
          - reg

None of these seem to do what I would like (even the non-regex one).


Cheers,
Andre'

