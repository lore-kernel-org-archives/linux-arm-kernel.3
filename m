Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522B6EF8FE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	References:To:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xKCzFEa575Ece/U0GGFSt+Fu+C5w9MJrHLEfRQR2Cg=; b=Q4gqYA9aWGlh/md9zsCdVFK8WJ
	ABq9bDlDKN/esgiYMYSmWaNMhVINDXijmY3D9G6Ng4GgGsewaTk4a0TpKngoGGlRITKcMnOkFYxkA
	x2tJhTDd6zJixbqma+PY2jLBPDkK5v/enr6zrwY9lsxZJ8z/V7wQyEwNIXs+hF5bI1M0zcvTHxS33
	JbL2aoCvoyf90yF0fKXUrpR9aIIyw3zq6W/DIetoGJ/91SMnihZJYvhnimqrzFs6+rsMwrb4a+o0T
	ECZMB8DvcoDnytkKcEfIC32WWwtcMWX27zlO9jYKI63rvoXPPDVbbFByUzitzIILi2TWgf2ZgkDit
	cCJ79ebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmQj-0000000HGBr-0U54;
	Wed, 04 Mar 2026 13:38:25 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmQf-0000000HGBB-3xxX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 13:38:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439a90f194bso3215748f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 05:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772631500; x=1773236300; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6xKCzFEa575Ece/U0GGFSt+Fu+C5w9MJrHLEfRQR2Cg=;
        b=mwMOx9tRc/cJEtFbs6C7+n3GZ7KzzPhrkFKyaP5C6XVZWZ6yC/8cmgtZKicYfJQkl/
         PmMaqs/N1YIBOW0rUhhESb4+owf++vBRyq4WMWaQD2rspda89kzLklXRDBDxgqnreo4D
         hv8Fpfyv5mdx1sLqadGPsdDfl79BrUHkfGBCKGWtOFX2GBEaDdAYjAGJVT7av+TEdPJ7
         VWIw6SPWKkisTLvOcWkOOYioIvVEzVmMn8vj+nTNzecrR9hTJkxhC8h9gRluUcE3utmz
         qVPg97O1m0pic5ElOpGwbUwRoTqNoCdsUjiM0G7Ltf/84UHpP1g3Xk9LVMXL734JiqBe
         hiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772631500; x=1773236300;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xKCzFEa575Ece/U0GGFSt+Fu+C5w9MJrHLEfRQR2Cg=;
        b=m6TTHzUIntEZSUJXFCYoodAAxmU4IGNi8MJ9qd1IGvh2YDRDEFzAfl3xPOtLsPkjOK
         00dD5OKgfAd9lv1AX5Ps2UojRhB435nJbniVVE/KjUR07UCjt84REYi0gjuyH5sQJYg7
         /sUd7KSvKTS1DNvIFgO7wEJ+f1LvnYbJexGVjFdtphQiRNFGEvHeEtBd7XUv6AYV7B2W
         xFjeqSQ1m+c7hI+ztf62V/yRXXQb4Z/7Yf+e0J7FufXIRdTeuLAtimolBhb5fdIry7ld
         TEnpW8+xW1FewVYaXkxtkoc1u8YvzEyMSQpDTpB8IHAq70lV1MuSEKgKBO2kg863FbZ1
         pxBg==
X-Forwarded-Encrypted: i=1; AJvYcCUAyAN2I8T14+HzSUOpvxyOiGMg2fVnO9wXWcHBAbHdbRAzI2/YLvUsNtgiq1Q+ruk9/lVAsscZiVlNdQXeGS8j@lists.infradead.org
X-Gm-Message-State: AOJu0YyCTexlYFCERlKo5pcpWPeB2Cp7oi//MIwSAjCX6sbjTKqBVq/M
	Lqu4qUlpOeU18B/Zw1trf5j05gHeMypZeb9mVJu/bxlwDWXuRAnkN63b+cu6PCcymdA=
X-Gm-Gg: ATEYQzxXfBY6/Q7Mg6E3MLuHBjW0nVwQfQn4sVqlhUcq8qKkupR4vQ/G5/bgFcHePbn
	+EYsWMIwWtFtvUlV+ZuynOrRetHY1px9OrInHNVlXZ38kLJxLR8g0FfCPveR0wPbjEQUvnLKXxS
	hoHmB+OoyagbhPILWAHbfGr1FihVFXOvwwECcRIwGx17fcwv7JGf63MkDGUC9EF3eUk6+ghr1oP
	Lytm4we6oRLKXSnqZzGozLhpRmh/GpCEc8RKRBuUs5nEjnV4kS28MIyFCRhbQRU96CRMcVpmybH
	Z1/BDlpgxNu+1aUsVzhQCksBDam9ibTceAUJUOcXNosUJrQoiGi8bT6hpdzTIhTc419msIh2NbH
	9DUQXrFxr5Ikkw2y/dN1CnReUyi0g9dOl+k1eW9nkfXuCn9yXw2wXa3x9Y17VyGkqoSzBjTu1Rd
	9+nrh+vH5/RHWvw9E=
X-Received: by 2002:a05:6000:2302:b0:435:9d70:f299 with SMTP id ffacd0b85a97d-439c7f79f5fmr3963520f8f.22.1772631499943;
        Wed, 04 Mar 2026 05:38:19 -0800 (PST)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503425asm25373373f8f.25.2026.03.04.05.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:38:19 -0800 (PST)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9f27ca151f75da4521dca0ec3d004e6ed38b66748edd73afbb0ffdc24d2c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Mar 2026 14:38:10 +0100
Message-Id: <DGU1F4OMYXZY.3S9ZX8TB5S3IP@baylibre.com>
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Conor Dooley" <conor@kernel.org>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com> <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com> <20260303-hesitate-preoccupy-5e311cbd3e58@spud> <20260303-payphone-pancake-b6068c545bc3@spud>
In-Reply-To: <20260303-payphone-pancake-b6068c545bc3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_053822_105675_EEB10231 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva
 Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall
 Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal
 Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--9f27ca151f75da4521dca0ec3d004e6ed38b66748edd73afbb0ffdc24d2c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Conor,

On Tue Mar 3, 2026 at 7:33 PM CET, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 06:31:56PM +0000, Conor Dooley wrote:
>> On Tue, Mar 03, 2026 at 04:13:00PM +0100, Markus Schneider-Pargmann (TI)=
 wrote:
>> > Add names to the memory-region-names for easier idenfitication of memo=
ry
>> > regions.
>> >=20
>> > Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> > ---
>> >  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 ++++++++++=
+++++++++
>> >  1 file changed, 19 insertions(+)
>> >=20
>> > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rp=
roc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yam=
l
>> > index 6aadc61e20f9f4c27f5b9c87ab2025a02776c5de..76ef23afe8c9f7f155dfec=
7fcabc7c60b8b286c6 100644
>> > --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yam=
l
>> > +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yam=
l
>> > @@ -182,6 +182,25 @@ patternProperties:
>> >            - description: DM RM/PM trace and firmware code/data
>> >          additionalItems: true
>> > =20
>> > +      memory-region-names:
>> > +        description: |
>> > +          Optional names for the memory regions specified in the memo=
ry-region
>>=20
>> Is this really optional? Shouldn't it be made mandatory so that it is
>> easy to tell the difference between the two configurations?
>
> Actually, so that you can tell at all, since it looks like anything from
> 2 to 8 regions is permitted (which this prop doesn't account for I guess,
> only allowing 2 or 6 regions).

Thanks for your feedback. I will fix both, make memory-region-names
required and fix the inconsistency between both properties regarding
what is allowed.

Best
Markus

--9f27ca151f75da4521dca0ec3d004e6ed38b66748edd73afbb0ffdc24d2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaag1whsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMO
BwEAlzDsVfiuqPCx/XTZv4wEd09mmQ8/q1n6TFL57MQ0VPsA/10oQtozFUWjofc9
KhaPSSQMHdxnVfQ4MrQdxnV+d+EP
=C3Zm
-----END PGP SIGNATURE-----

--9f27ca151f75da4521dca0ec3d004e6ed38b66748edd73afbb0ffdc24d2c--

