Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017D6F0181F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEDlrhwnbLHEqntSSkEsQEo7gWXaJKYcg2RkMc37BfE=; b=4TiTld/EuZE3gWezVux0Y9kjX0
	BQqcy57okJAsz5k4MyArGHshILK8JLnDSPufZj5aHDU+Vfm3R9FG8vv8uBZoPXOHbV0riRof+pyMG
	apIxwO4mG3GBT4LT6G70ig6804O6b9GtVJEvernOVdPxig2uB5IEc86OkVbe2PtsRO10FGzV8HkoJ
	iWjNFXRxlkqTevfsbnN+OjK1KIPTlIdWe9cjaTUJOp+iLxMmshAGBLZNBP3497X10HejUDGGR+jc6
	L/Vm2HHsB3OqftKlQSGqBDvWxstpuZxLkpqI+p2oJrGkbNHw5EBMFM5kgECdKVGF0pyl8sv9FZKJM
	6IVcLJ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS5F-00000003PW9-3qML;
	Fri, 06 Mar 2026 10:07:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS5D-00000003PVS-146S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:07:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-483bd7354efso118492435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772791617; x=1773396417; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gEDlrhwnbLHEqntSSkEsQEo7gWXaJKYcg2RkMc37BfE=;
        b=gdx8i3cx4N+CUw+j7lEPTznaexIBfKTRj4an5Bijc4iwJapr6X73/njF9N+83uSlcb
         nPyQprgxHpjaOOlELl4mIWxu6ioBNP/WYWeVX0mO2WI2OKMAvqUodMW5aAlS+QM3vhUU
         H1Oa96H8mZ0wdtVKqhx6Rix7bqsV9WLVfwi2gzISTKb/z2ikv8ySAOFlFtYH25NxYRY3
         IIPNoxJiD8gV8NG308H5Cp4a6bC2xV3rYthyBY0PjD+8p4dSDXfT9lUN07UyKB5m24sQ
         +6MiKMe6eCrdIiWczuGFbHy+bpY36pGY8OdxwuMSagtwdQ9KgZxGnHba0F1a8bErYO9n
         uMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791617; x=1773396417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEDlrhwnbLHEqntSSkEsQEo7gWXaJKYcg2RkMc37BfE=;
        b=mAHwg/Ba9oCUDdCeQFRu78Chn7VKwaKuRIkfUkd2wNoIbBlhn/GQ+uEZkdoVGNZE6U
         61Lu18oNUrKV2Rea9X5YkTDDZlzj3tM2hK8yl0SP4RBrJrNG65QC3CI8JaaCaM43UFc0
         6Mun9ApD/FgvbIMS51p4NCa3cC30HEpP71N1ilnd4JLDo1swiOsn/hw5/gwQCYGdStq1
         kC5dplZnUkhRXKmrIx1PT2QR2WdE34Xu9wBzY9JJl6fBTJnozM6e5a12cMUZ/lRU6D3r
         NQgfli66LAjY0C6JgaeRlZ0Z1WWMJ6Kh11NVPL4nv8e8G3calKb+6ErFQM72ybHtWsZL
         nDXg==
X-Forwarded-Encrypted: i=1; AJvYcCXAsCom5qXKPAl9Whp7dKB2yLdSDP6JDLZLR3p44L0Z1z60i8V7qbd9PCM7zqf62Oaf+htwiapJOBGckXIG7gbn@lists.infradead.org
X-Gm-Message-State: AOJu0YzonDPRMnKHfMgz1mwkSpXA7MFDtIrUw55VGY06fVBE5JWun2Zx
	R6NH2BoN012ps+UO4VIHNooDmKPJR+eBkE9ry1ldCGvct/oZ+g7kT4I2gAMdOUlAr34=
X-Gm-Gg: ATEYQzxLtjc3E3j76XJgnckeUcc2B2g6tI1LWmcfMqh2m8yrVhDVbniKBDszyedSTiz
	V2/cgTEGIatljl5dQYOudOIYWNfLnYVdLPsQxHPnnUX4B7yZ4+H7AnTrdwt5Pj73ab46T+1kQVn
	By8oDep6E4wOvqAPaxKyVb7BDLEvG1KWW8+7rhgk+bNRbaPIMKIzktex1Bx8prbYUIByIokA9Ky
	bZeUKM6qFVHP/chpNz1ze+pka0Hpc/BI9zseDtY7PYM7yPIlZqfkazFi3b+nSMIDpu17HmFvKZd
	QKpdcFx5cju5x2kwlhpkQFlrDpCMYItHXIuJEyZ+B9qgJAVNP/NrdP1njWsC0WYvevkuiGrNliK
	Q7fTj/Pk81ojajCYYssEpmUcuN5B8KUnzRV4o6DhlzBEvWTu3B37fEajaml+eWttAvxVpnT4/WO
	6mKGEG3j8kSrCTkeVyMN7LVlOr4n1F
X-Received: by 2002:a05:600c:1986:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-4852695b649mr24350965e9.17.1772791617341;
        Fri, 06 Mar 2026 02:06:57 -0800 (PST)
Received: from draszik.lan ([212.129.78.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852378ea07sm15919135e9.0.2026.03.06.02.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:06:56 -0800 (PST)
Message-ID: <a03bd4a3c457cd3ade735b087fadedd1920c842b.camel@linaro.org>
Subject: Re: [PATCH v6 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org, Marek Szyprowski
 <m.szyprowski@samsung.com>
Date: Fri, 06 Mar 2026 10:08:18 +0000
In-Reply-To: <20260306-hopeful-amusing-sawfly-e60c6d@quoll>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
	 <20260305-gs101-pd-v6-4-8cb953c1a723@linaro.org>
	 <20260306-hopeful-amusing-sawfly-e60c6d@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_020659_316519_16D5B070 
X-CRM114-Status: GOOD (  13.40  )
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

On Fri, 2026-03-06 at 08:36 +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 05, 2026 at 06:11:53AM +0000, Andr=C3=A9 Draszik wrote:
> > The power domains are a property of / implemented in the PMU. As such,
> > they should be modelled as child nodes of the PMU.
> >=20
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>=20
> It is impossible to test a binding in a meaning of "tests", thus you
> should not add Marek's tags to bindings patches.

Apologies, I think it was due to b4 applying to the series and this one
slipped by me. Will remove.

>=20
> > +patternProperties:
> > +=C2=A0 "^power-domain@[0-9a-f]+$":
> > +=C2=A0=C2=A0=C2=A0 type: object
> > +=C2=A0=C2=A0=C2=A0 description: Child node describing one power domain=
 within the PMU
> > +
> > +=C2=A0=C2=A0=C2=A0 additionalProperties: true
> > +
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: google,gs101-pd
> > +
> > =C2=A0required:
> > =C2=A0=C2=A0 - compatible
> > =C2=A0=C2=A0 - reg
> > +=C2=A0 - '#address-cells'
> > +=C2=A0 - '#size-cells'
>=20
> I don't see improvements about quotes.

Odd, I'm sure I fixed them at some point. Let me respin this.

Thanks,
Andre'

