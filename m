Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E57C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nf4vs6nOKYWis7A8F8h4VTZb3Ww/LSePChVIWjjRS4Q=; b=yL97ZSxTbP/3EX30MudFfyJao0
	y7pClC4G8jCMEABtxERktjMLdLnuji60h5ilsD+CbDjnNhpqoCkyeJ+e2+Va0nkKkvjiY8wBpVmUJ
	TzodJ+pTp6HVs332Ceuhab8j/16Xff2ZbYNg1pgvKjGruvP9tIqMQsXGuzCCeYRTUlFlQIr/Tto+T
	hLWQ3u4aw/xKx6Sy7yA1kUyx3L6EmpzQBX5pTcEITNses4ReE6w61QaO2lzqfret+AXOTWZCiRS7W
	uIRuw92xoHHPJz/jXtxp4b6U9FTcITx4r77cDb4yx3oLpL+VU1mo8lCGI0niHtOn1AY4XBoqlBDB9
	wGUbb2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubNBx-00000002zUr-33MW;
	Mon, 14 Jul 2025 17:42:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLlx-00000002ndN-0Fjd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 16:11:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-455b002833bso9812895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752509479; x=1753114279; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nf4vs6nOKYWis7A8F8h4VTZb3Ww/LSePChVIWjjRS4Q=;
        b=hwrWijL2xClIC5KHj7U4Jg+m2SY5IaIhpotmv3V2GhAINc4SkO4Z/ZPYsYcYLn7p/p
         6noGc3xUF3kb4F4bVvBMz/PM1/WtW8UGu8xQEJwcr6xUFl9EXvEhDN3Q0sgOtxpLzPVh
         IkvSJAi0bhk2zL6ELIzo3NCudrvBnogZQLILtHvRM7h/TM38SHDEMRYxXInMzJVbQKRf
         MPErknAN0V00pKrvIrASXjjvCdYbKUPkjPHODov1z+91XKoiC8PZfvDL3nvuRs900g9R
         u2YxrdToflwQx1er0CZx3JXft2sc5+UmlkK6HPiD0p7Di0lcHmPFAuC220oYk4/xXeSK
         CptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509479; x=1753114279;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nf4vs6nOKYWis7A8F8h4VTZb3Ww/LSePChVIWjjRS4Q=;
        b=tGmS2+O0h3kOourj4+56YT39gT6bKb7dTV6sReiLcSAP9iekV7PmM14frWpNV2OYn2
         lX5Ihk1J5hnnkaKzeuOMTzKhXIViW+WC0yi2P2yJZgezX53/9Ry4FxUdsEY62ZZzZtJ6
         TWrkBhP8gLtT5EsQv3y6yHJjrVTN5H+6yH2G9duMNQLVael2idBdvrPq6GWUIbE1eC8q
         TzheiLSwhDTRHq44WKMxOn2hwhwK6AbayFddN4ctvJG5zctkjgR/vnTZvRSAIGT5aNlA
         gtXO/LutlWHvFeX7fdtzESCpx7uWtPs+yLFYNfSehXYmOf1/oLaDuwVs+O9PgwFWWAe7
         2Z0g==
X-Forwarded-Encrypted: i=1; AJvYcCUcqIPkA6yBPIxp3zq9ivrhSQVn+Tu+2+gvngITjaZuA9S/yOzbpmNjmjJyTLxUCc1puWgb2FtiGIdKonwwd47i@lists.infradead.org
X-Gm-Message-State: AOJu0YyESbLTOaWr9SycA1NetRdddERDD43zONBbwPSINJqdWfTDlBLa
	cjiHvZOg5mD35P8o5ie4tJxU7mHSwkjGZZTvEzSNIos7aiZEIHkbMuqKsAkK10YR
X-Gm-Gg: ASbGncvgiw+OPpPn96SLqzDs+TSJZFjU7Bk6vpTkKeK4iGLfOUdyqIpC9t3jrso2FUE
	3ET3ePsfL8SBFdbM0JQP2RufItdFqB6DS5r6UQdchN4sWMxaxcAIgQyPbxjsECx3yYfuW1cvc9C
	s36dIEewflFgidItHDCoQY0qIYMx8I7qaMgJQHvHnJKjLRetd6dovgpE1DfMH2LOzVZOM5FBwuu
	7DqZdHjvro4AfwbZ+oHch8e1RKS8asXmc8rrRV+sz7DTTLkAi5bp5g5cc5qBYYfl3DHaxaQh3PQ
	LLe8gREhgrIHgnuk8gKkUnAsiA4hYnXaMyaiRPtdnAjmCfOR7AfDvxJXvVcUiNRJcJ3HeNEQO42
	nqW/jtmWQNSQ9iq6MMm7VrSZYaKizCg==
X-Google-Smtp-Source: AGHT+IGUpToWdSctfAs3OEHNJr6LLvNw1cbXYajG3U/nqh4JtR7+4OuHXsfmXW0g3MdCYO1qHiV4iA==
X-Received: by 2002:adf:b643:0:b0:3a5:8cc2:10aa with SMTP id ffacd0b85a97d-3b5f188ea13mr9929289f8f.32.1752509478866;
        Mon, 14 Jul 2025 09:11:18 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd163csm12660465f8f.4.2025.07.14.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:11:18 -0700 (PDT)
Message-ID: <6b32118a13e9e28b7cf12152af33642c76367c34.camel@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: imx93: Add calibration
 properties
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Primoz Fiser <primoz.fiser@norik.com>, Jonathan Cameron
 <jic23@kernel.org>,  David Lechner <dlechner@baylibre.com>, Haibo Chen
 <haibo.chen@nxp.com>
Cc: Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer	 <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 linux-iio@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de, andrej.picej@norik.com
Date: Mon, 14 Jul 2025 17:11:31 +0100
In-Reply-To: <de2c8e15-14e9-4c61-9a13-97ef1ec567a4@norik.com>
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
	 <20250710073905.1105417-2-primoz.fiser@norik.com>
	 <2bcd758b-c2d0-488a-8ead-ec7fb39f93e2@baylibre.com>
	 <20250713160247.0f22bbfe@jic23-huawei>
	 <de2c8e15-14e9-4c61-9a13-97ef1ec567a4@norik.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_091121_100977_B26F7C7E 
X-CRM114-Status: GOOD (  32.36  )
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

On Mon, 2025-07-14 at 07:56 +0200, Primoz Fiser wrote:
> Hi all,
>=20
> On 13. 07. 25 17:02, Jonathan Cameron wrote:
> > On Thu, 10 Jul 2025 10:46:44 -0500
> > David Lechner <dlechner@baylibre.com> wrote:
> >=20
> > > On 7/10/25 2:39 AM, Primoz Fiser wrote:
> > > > From: Andrej Picej <andrej.picej@norik.com>
> > > >=20
> > > > Document i.MX93 ADC calibration properties and how to set them.
> > > >=20
> > > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > > > ---
> > > > =C2=A0.../bindings/iio/adc/nxp,imx93-adc.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++
> > > > =C2=A01 file changed, 21 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-
> > > > adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.=
yaml
> > > > index c2e5ff418920..d1c04cf85fe6 100644
> > > > --- a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> > > > +++ b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> > > > @@ -52,6 +52,27 @@ properties:
> > > > =C2=A0=C2=A0 "#io-channel-cells":
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 const: 1
> > > > =C2=A0
> > > > +=C2=A0 nxp,calib-avg-en:
> > > > +=C2=A0=C2=A0=C2=A0 default: 1
> > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable or disable calibration avera=
ging function (AVGEN).
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > > > +=C2=A0=C2=A0=C2=A0 enum: [ 0, 1 ]
> > > > +
> > > > +=C2=A0 nxp,calib-nr-samples:
> > > > +=C2=A0=C2=A0=C2=A0 default: 512
> > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Selects number of samples (NRSMPL) =
to be used during calibration.
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > > > +=C2=A0=C2=A0=C2=A0 enum: [ 16, 32, 128, 512 ]
> >=20
> > Allow 1 as a value and drop the enabled above.=C2=A0=C2=A0 Averaging ov=
er 1 sample
> > is same as no averaging and gives simpler binding.
> >=20
> > > > +
> > > > +=C2=A0 nxp,calib-t-sample:
> > > > +=C2=A0=C2=A0=C2=A0 default: 22
> > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Selects sample time (TSAMP) of cali=
bration conversions in ADC
> > > > clock cycles
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > > > +=C2=A0=C2=A0=C2=A0 enum: [ 8, 16, 22, 32 ]
> > > > +
> > > > =C2=A0required:
> > > > =C2=A0=C2=A0 - compatible
> > > > =C2=A0=C2=A0 - reg=C2=A0=20
> > >=20
> > > This seem like things that should be set at runtime rather than
> > > in the devicetree. Unless there is some justification on why
> > > these values depend on how the chip is wired up?
>=20
> It depends how ADC 1.8V Vref is wired up, especially how noisy it is.
>=20
> >=20
> > Further to that, I'd like to see some explanation of why we care
> > to change it at all. Is it ever a bad idea to enable averaging and
> > pick a large number of samples for calibration?
>=20
> This is a snippet from the i.MX93 TRM, chapter Analog-to-Digital
> Converter (SAR_ADC) describing calibration steps:
>=20
> 1. Wait for deassertion of functional reset.
> 2. Configure SAR controller operating clock (MCR[ADCLKSE] =3D 0).
> 3. Bring ADC out of Power-down state (MCR[PWDN] =3D 0).
> 4. Configure desired calibration settings (default values kept for
> highest accuracy maximum time).
> =E2=80=A2 MCR[TSAMP]: Sample time for calibration conversion
> =E2=80=A2 MCR[NRSMPL]: Number of samples in averaging
> =E2=80=A2 MCR[AVGEN]: Averaging function enable in calibration
> 5. Run calibration by writing a one to MCR[CALSTART].
> 6. Check calibration run status in MSR[CALBUSY]=E2=80=94wait until MSR[CA=
LBUSY]
> =3D 0; alternatively, MSR[ADCSTAT] can be
> used to check status.
> 7. Check calibration pass/fail status in MSR[CALFAIL] field. If
> MSR[CALFAIL] =3D 1 then calibration failed. Detailed status
> can be checked in CALSTAT.
>=20
>=20
> See point 4).
>=20
> Not sure why would there be an option to configure i.MX93 ADC
> calibration parameters if one use-case (max accuracy max time) to rule
> them all?
>=20

Sometimes HW guys just want to give you some options. Does not mean we have=
 to
use them all :).

I guess what Jonathan is interested in, is to understand in what conditions=
 the
defaults are no good for the calibration? If we can have a set of values th=
at
should pretty much always work, no need to further complicate the bindings =
or
the driver.

- Nuno S=C3=A1=20
> On the other hand, public TRM doesn't give much more information and
> >=20

