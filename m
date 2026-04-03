Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FECBE7E365
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=; b=bG3JSG2bvIFmNe/Cp64eQ3jw0B
	GB1tCB3Y9s9XPhwI4NBD2T38S5OXaYP4pJb2sk4gZkoq8DvNc//exnseFQP9NUQ9JWoFZ/+hWk5Hj
	N49+itS0Atw6rnAJnDLuvv3wQwPikKvNCw7QM9tBtcQ+M3tkJ5fxHPf6hQd2d4vIn7YgoC8C5ADID
	RLHyrWjtpP0pBHBDHscGg4++Eeh0++uyjz1qI7Gqt3YuQ0xHI3vG/cMyYy4LRcuP/nh7PdrwxwqmY
	HT96+iBsPjmEeOGCpCSPCosqHSurrFHFwMjKAQ1on45KzbE1FhTEyMf4U+JJYTcOZ3d/juLorz363
	WpdyYyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8baz-00000001sJw-0gR6;
	Fri, 03 Apr 2026 10:17:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bax-00000001sJU-0HIX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 10:17:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so1470557f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 03:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775211461; x=1775816261; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=;
        b=nm1NYEatRFSNIaOfEGJu4rqgu9f99VwkyE1ZdbGjoqUAAlkC36+9LPQa/5K1j1zv7p
         mTpex/ALJocUwkgLKm9dIUzHB6XQLhADtPhoWulA8sFT7L+HidjTJgAIynDcAyLUPYB6
         GPtbQbURpX6RGHHj+rZUyA8FsTtJIvVg9u5O5xSMgNtXULKB2Ewl5nqLmc1wgwlBYu1e
         +A4/q7BP5yqz/bwgZWJsqKMyZPmd2dinYjgqIVVzJwBlrqGRfNot0r6ZOChV+Q7zLCGE
         3yDeedMhioXSj9G7dHpPkmEpG8ez8AaWOHQ4kXaSQp+1YsoMxZmPOCYLhN+p3idE7mBa
         Z64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211461; x=1775816261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=;
        b=La8PRVmqVSGWmgHfMwz0SdxTvWqpropW/T6NPh6uhDdlfP88yLGkQT62gHDISIFEwd
         9tn7m85iIYopRM92wqDV4c3Xj7b06MakVL989v86A4aR+0qUJXSlkF/485L5nJXZz8ic
         tZ/sbbtbgoSjdB7ehjSU9fGydPg8KyfQB75TM+o4xouI+I0+WTDjLhTD5Cndp3xZH5j1
         LTK4HvZWgRA5foGnnOI837OITumRQeyIwHXKHFtg1ON6H6jcf+NhMubc01Is+pabS/3I
         1XLFx0UHQMRw6J6PLsyhjxRqrxyPKioeb+RXmzB593VFt2PFqbWOneMqJhanBWYnAyHo
         i9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWwwjSPaFCHF/Z0KxJHySvpumMTLbhsODIoHPErQmuR0CP9MWlpSnlUHF+Q5oAW5CKANq6i+qSI+hoOLfhsbS9K@lists.infradead.org
X-Gm-Message-State: AOJu0YzFfCJLxOA6GzyTe6roxGhmRBuMJvAbOVqSdTxvqqnq4yleCmVS
	R5L3dvnHUSuFIbfQgtqZoteGckU8066VzhOG3mZiZuYO4JYARlfaqxSeojcriCGJdKU=
X-Gm-Gg: AeBDieu+aMfXCsrcDYp76eJ50q/LLK4y/ddU5KvRljDKJZC+pQxkl7mMPCcCSACI2u3
	5QHAYjiGEwNAm1dBYcxD48b7fk4VALdjXZd3vCgWS2plH5SuMxgycHaH3+4xXll1Zd75kycrA7R
	aBlWDJkiPiVe/6/fOhEWVMqjmNLwkYXBKj1CDKl7/5CeYNO8yhR/jQnH6D7V2CwMRwM6uA0sE3Z
	0FtrPyzbRO9cl2xSCB4kWRPfVPRR8RzHLHTe5htzbAYpa5TlaojvX5MJJueLWW6Vc6y0AZv9U7f
	u97+5Lh/5Ri1qX8YfGQcqI/eOxFxgW/PqgJYuIffDeWn88FCqCBbzwNHThd5SYlD3+96XBFzEeT
	GCai7cxPozjt4JIs3yrkpgfnr/wOoXWjg3IBrOPKup4ey2SFUP4GHuW5zwFkasbf1rboWHR2TmM
	Vgy/WscwyX5l3PqyxEnZiC4zuBjg/E
X-Received: by 2002:a05:6000:4201:b0:43c:f976:b8ee with SMTP id ffacd0b85a97d-43d292dab19mr3932897f8f.26.1775211460610;
        Fri, 03 Apr 2026 03:17:40 -0700 (PDT)
Received: from draszik.lan ([212.129.76.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm16791493f8f.1.2026.04.03.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:17:40 -0700 (PDT)
Message-ID: <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 03 Apr 2026 11:17:47 +0100
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
	 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_031743_126931_0D7F1FFF 
X-CRM114-Status: GOOD (  13.83  )
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

Hi Alexey,

On Wed, 2026-04-01 at 05:51 +0100, Alexey Klimov wrote:
> Some Exynos-based SoCs, for instance Exynos850, require access
> to the pmu interrupt generation register region which is exposed
> as a syscon. Update the exynos-pmu bindings documentation to
> reflect this.

You could mention that this is similar to the existing google,...
one due to same requirement, hence a new and more general property.

>=20
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/exynos-pmu.yaml=C2=A0=C2=A0=C2=
=A0 | 18 ++++++++++++++++++
> =C2=A01 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-
> pmu.yaml
> index 76ce7e98c10f..92acdfd5d44e 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -110,6 +110,11 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Node for reboot method
> =C2=A0
> +=C2=A0 samsung,pmu-intr-gen-syscon:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to PMU interrupt generation inter=
face.
> +
> =C2=A0=C2=A0 google,pmu-intr-gen-syscon:

Please keep alphabetical order of vendors.

Cheers,
Andre'

