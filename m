Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6771ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 05:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZQGF56icH764Mt7J7YN4sDhWdEqrpnUJtm3mz3jgl4=; b=HNBfQyv3ygEJUhHxuqeBsR5lrP
	Ss+QoUNAaM/vmcwyTKMuqU3elEJy7MJ1uY3mYorngRBts9yc502Vpw8h8GfqfUAAntZmT83a4Wmxv
	2lMW5bYeN2NT1wtJgUZbTd+6HVOTOJdT7lbSzflUaFkeO8fbLitJRAcoMruMkKtJNuE96geMeW6+H
	whu8VGl1JXUWupugtBwHV+LFJ8DyJtbU70WTFfsiCzApV8vFcrveqTQ936V/a0P8kr9czVF3Nsnry
	92HV1nFisL3mTx9oCDZf6RFxRyDxFXnu/f+czICqPPRs2xZK3d4GdBhVi+vkazE25nO4NB59l7qEZ
	McRMKzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75eP-00000007hxD-2ub4;
	Fri, 10 Oct 2025 05:26:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75eM-00000007hwj-1cp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 05:26:43 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b4736e043f9so241369066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 22:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760074000; x=1760678800; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ZQGF56icH764Mt7J7YN4sDhWdEqrpnUJtm3mz3jgl4=;
        b=qpUK/QYuHGSYaFg966LicFMqHlezMWFUClrLJdh77SS1UZvjS1bzWL8EL0mUhNGhne
         pqeGGiZzoJAZ03XBkiXaVGKgNfL1jtlvdH3XLgLlBn0sfWyRnv0UmoYpELRxN+/qXcv5
         SNN76uk+31CPgQItpk8EGKGGOCMVWJrWwYG3JTSi+w6mN6/OSlns7PKCmDZt8MMLn9aP
         kfk7FwYLXZtpZTu0CyfMXy6kOO93OksI0o1tj/V4rPavC6TbXzyBtoH0TF3pISak0HHO
         9qbxCElb+UfYVvj3g/Z74bE6en6lvcs6Vl2u32TVNr/ITZ7Zw9TTVC+mfrXnSfKVhq/N
         cUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760074000; x=1760678800;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ZQGF56icH764Mt7J7YN4sDhWdEqrpnUJtm3mz3jgl4=;
        b=WKcyaz1/u+wIkbrr7gSsorE4NKGdbu5S6WnNSq52619VnlAtFX3W7ceiBh+cjDNZJx
         zABa4tXzRMF84CSfZJxsDF5ku5Kh6fjNEwOAWrRtqfFV40WRMkiW3jjj085h+seyOExG
         aseMHCBHnhp2XDNxUzyL7hnx/kp+f40IcyDZHB/fy9GzmYoOx4q1kVJzWVpi2qqu9bCV
         Q3Wwi6yvqDYH1gbID5df5tiBI/4JPa0X6oEOUhi6IpmYickDdyGEubV/Wu4488EbleDh
         gP2T1YU76MPEHIdjcUvfJMHuhx7m0PG2j79spfHV7iNf0S3iYNDySqGcEGhoHpvQeMtH
         A7gw==
X-Forwarded-Encrypted: i=1; AJvYcCUF1+Y4xz3DHW/S6J3l9iFjXD7qq/q+fUvmuVDOks2k6/GgVzpY5AOUS3P8bK5bN0HxRGWFnnA1PRfPbQuePBY3@lists.infradead.org
X-Gm-Message-State: AOJu0YxngELREIIr5LeWozoeb8BK1cS/OOIq4/j8EvN3YZjlZPTN/tvn
	doJyz/hFHdpd4DtAQM/hio0+QC7VsNzekMz1rdkiggYPTYmBi3aPJCk6muR1kKF1h68=
X-Gm-Gg: ASbGncv973EB9vusIdikNERG2ryV6M8wLTA1XWjXHJb/lFLGVF704+vyJGC6J2DKsRB
	/EbjxvJsFFkYy2I4YnuILNIF7lJEMdZh+UGJln90D3TW+UGJEkLvEdIxZrmpjYyuxK0QdZffj5+
	xS4A2u5NUSi6OHUQn+PjXY7EnhfqwpaDpOb52la0W0Ry6ZmDKPcqy7+RZIP+F01W8AKz7M9uYyC
	KWYPu05/kmUFaJI/DYky5dNIdUJgNU2VD9VfGE0f16AY1nuMxJwMMebgVTg3jJREmJJpyUHE4kw
	4OylZpNhynzJKg7tilfK2O+ka9NPY/rndFQo6oQpxkvv3TdlpBEhHqU5bDHm8LC6PMmSpP48An6
	TB8kSF9kkGaVUOJUtWB3+hKy9SQYnrSP5cAgQDpmacoRWUn/h
X-Google-Smtp-Source: AGHT+IEF98Rap0U5ucjnQVUtn0KSvNbP6eAmxW5/uObKfUgC9D3KfjVTiQLvrdfy3ldcft7mxBgDmQ==
X-Received: by 2002:a17:907:fd89:b0:b40:cfe9:ed41 with SMTP id a640c23a62f3a-b50ac0cb1cemr924261166b.34.1760074000382;
        Thu, 09 Oct 2025 22:26:40 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900cc52sm140260566b.60.2025.10.09.22.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 22:26:39 -0700 (PDT)
Message-ID: <4ab0d483175c17b476d2d51923b38b272802f60e.camel@linaro.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: soc: samsung: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Date: Fri, 10 Oct 2025 06:26:38 +0100
In-Reply-To: <20251009-gs101-pd-v2-3-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
	 <20251009-gs101-pd-v2-3-3f4a6db2af39@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_222642_445907_F8A40946 
X-CRM114-Status: GOOD (  20.89  )
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

On Thu, 2025-10-09 at 16:25 +0100, Andr=C3=A9 Draszik wrote:
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> Note: Ideally, the newly added properties (ranges, etc.) should only be
> 'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
> as they're needed only in that case. As-is, this patch now causes
> warnings for existing DTs as they don't specify the new properties (and
> they shouldn't need to). Only if DTs are updated to include
> power-domains, such an update should also add the new properties.
>=20
> I've not been able to come up with the correct schema syntax to achieve
> that. dependencies, dependentRequired, and dependentSchemas don't seem
> to support patterns. Similarly,
> =C2=A0 - if:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ...
> =C2=A0=C2=A0=C2=A0 then:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ...
>=20
> doesn't allow patterns in the 'if' block (or I didn't get the syntax
> right).
> ---
> =C2=A0.../bindings/soc/google/google,gs101-pmu.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 42 +++++++++++++++++++++-
> =C2=A01 file changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u.yaml
> b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> index 209ee2f80d449c3eec568188898b3c6f7ae0ddd4..d18a351b649c0736662e67bb6=
4de46afa01e399a 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -27,6 +27,14 @@ properties:
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> =C2=A0
> +=C2=A0 '#address-cells':
> +=C2=A0=C2=A0=C2=A0 const: 1
> +
> +=C2=A0 '#size-cells':
> +=C2=A0=C2=A0=C2=A0 const: 1
> +
> +=C2=A0 ranges: true
> +
> =C2=A0=C2=A0 reboot-mode:
> =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/power/reset/syscon-reboot-mode.ya=
ml
> =C2=A0=C2=A0=C2=A0=C2=A0 type: object
> @@ -50,18 +58,50 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to PMU interrupt generation =
interface.
> =C2=A0
> +patternProperties:
> +=C2=A0 "^power-domain@[0-9a-f]+$":
> +=C2=A0=C2=A0=C2=A0 type: object
> +=C2=A0=C2=A0=C2=A0 description: Child node describing one power domain w=
ithin the PMU
> +
> +=C2=A0=C2=A0=C2=A0 additionalProperties: true
> +
> +=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: google,gs101-pd
> +
> =C2=A0required:
> =C2=A0=C2=A0 - compatible
> =C2=A0=C2=A0 - reg
> +=C2=A0 - '#address-cells'
> +=C2=A0 - '#size-cells'
> +=C2=A0 - ranges
> =C2=A0=C2=A0 - google,pmu-intr-gen-syscon
> =C2=A0
> -unevaluatedProperties: false
> +additionalProperties: false

Ooops, this line should have been part of patch 02 in the first place. Will
fix in next version.

Cheers,
Andre'


