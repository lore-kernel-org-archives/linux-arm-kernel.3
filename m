Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D51E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szSMFpu0X/jKqyAJJIRLoz8ialA5hbvm/LWaFM/VFz4=; b=UN59w22+7V+dA7+IRZOEq0wK1N
	knes3xN29mH/NmCmwi2xBA+BeMLIpxDCyrzjs+mQJzGhOtSRj3SEursmCMKWWl9WvokNtbQWl9SU1
	ovpBKwAx6yFL7yQtkwQQSBZwCkPrsQZkR8LBbRWNQGbJ/qbQDavAy1Ux/FwkBtUPIPrYkRDpzUqVf
	aD0udU1NwTYPNkw2nhnfx77ZbgVwEbdzA0Nsy4uprkABRTzQhhbt8iTEPw6lk/lK4FGw3egwQGLz6
	KHSLNl4vu1YAqtCOCWQWOquOD6w5W1epE3mt0LH1PH2uVD9s6BtMhAM4X1+WuWje7gVvKzZ6zj1it
	PdifaGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPd9M-00000009XsI-3w77;
	Mon, 23 Dec 2024 07:46:48 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPd87-00000009XmE-2xyW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 07:45:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3366220f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 23:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734939929; x=1735544729; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=szSMFpu0X/jKqyAJJIRLoz8ialA5hbvm/LWaFM/VFz4=;
        b=tfdW+UoPIdpYerAfgAb2BNq3YTLUXr2Osebd9KBfdqOP+xxzV/zlUy+e0xz++Eoced
         VPy6bJFWyC0weo/OPjyjBeQoeWuHyT80MZczM2CG3aWU5kO5fkDP/GsS4ELflH+O/ZY4
         gEkPYDZ/ggONq9c1cp6cTF0nXQIA+sOB2kxDnjZncZA0yDRaDmUrfRNoiZPiDR5RrPrE
         Sj8hQdTyksP0n254i3r36FDLrjcVt17bd2pVgMHlzuWis+/mju1YsMbU23iwJ7k2/J7T
         S6lyNm1OdYSWn3bW/EiD0lJgFGfeeYpOlstzmnE7/pTHOzbtb0JB2W/aqmvaLVWvMr9m
         oGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734939929; x=1735544729;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szSMFpu0X/jKqyAJJIRLoz8ialA5hbvm/LWaFM/VFz4=;
        b=YWs2utCYRhgczI8AiRItb4p74GZNU7c50pmmk5y8dLlbjfvqNc/+XCY4OgDekkhG8d
         Zok1i/ZGT0J2wd/KW07jdkGEg8ltWPl6Ayb/rZ+myWlrT2mymqgpR1jcogHPrUkFa1tu
         Ss+o3M+pIt9HjHMh3rLNbuMenBuxPlc7QZ26HonNj4hVBmfKZz7645Oki6flfRp6FFuZ
         +WaIvLHQIBvp+BUf9ldGOpqw9WwS35pqyEFyUmgnJ6DR/y888SGM3Y5RjgUPlkh1tnLe
         7bqAtnBd+KWAzJ6R7vJoeRaXBVyIia37sE6yNEOQ3AVhxLrKHNYO+iU5JDGMtoI48fwz
         e7eA==
X-Forwarded-Encrypted: i=1; AJvYcCXhQ2r3Xp9cVazNoxTzfFL5BBGbfRiZDIKh5w3oSaiLRzyl0ypzDLuk3a3awREe3hJpID5XfbLm7dWacogKgw7n@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9J4wAm8dIZAEYdvcg3vYQNtXPrJcOzRgFPSgP9AVYU8icbF2E
	ORsrQW3l5CmJ2D4/mxh4RN33qFZCrBHK/x4QxSAiHR1aRWJWh6pqByQP/UQ0qqP4Wd36rTHW8BL
	4
X-Gm-Gg: ASbGnctmrdhP1EzLQJ7zxfC4DHhgUiROub/vURANkdwKJsBHnhFE5t/lWCAqlnRRTDK
	6ImQvd7uwYA0J+hHzYRu0hdn62yixp7Ce1tuPeyVdv3X3zO0Ql8YLIR129YeqEMNi5fo1QOugsr
	Vbs5+QakIDQrL4Fqa77eAcBbQPdf42t4LZJB5IYOqeK8pJun2D7MAm14N3i/1pqc6Qb+bDvVhyv
	WbIurNG4Kj70cjEQjbl1AL9GBzS4r3rLtcLJbSuSkelXxs0RtpRTyyZLxRQrA==
X-Google-Smtp-Source: AGHT+IGDaeMCJrgzifSr2TvDYMPQhcDT2MRZ+98RU5GMa6SGyaKWu+e0yHVKL1/bnGNvSM8bZo3RoA==
X-Received: by 2002:a5d:598f:0:b0:385:ed20:3be6 with SMTP id ffacd0b85a97d-38a221fa7f9mr10193192f8f.22.1734939929304;
        Sun, 22 Dec 2024 23:45:29 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6e19sm10645963f8f.100.2024.12.22.23.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 23:45:28 -0800 (PST)
Message-ID: <cfdc5b1b03140e3d2ce3fb58e8b342dc2ac06d04.camel@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: google: add gs101-raven and
 generic gs101-pixel
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Mon, 23 Dec 2024 07:45:27 +0000
In-Reply-To: <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
	 <20241220-gs101-simplefb-v2-1-c10a8f9e490b@linaro.org>
	 <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_234531_822766_63D20289 
X-CRM114-Status: GOOD (  21.53  )
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

Hi Krzysztof,

On Sun, 2024-12-22 at 12:38 +0100, Krzysztof Kozlowski wrote:
> On 20/12/2024 12:27, Andr=C3=A9 Draszik wrote:
> > Raven is Google's code name for Pixel 6 Pro. Since there are
> > differences compared to Pixel 6 (Oriole), we need to add a separate
> > compatible for it.
> >=20
> > We also want to support a generic DT, which can work on any type of
>=20
> There are no such generic DT devices upstream, so we cannot add bindings
> for them.

Do you have a better suggestion for the wording?
How about 'gs101-based Pixel base board'?

> > gs101-based Pixel device, e.g. Pixel 6, or Pixel 6 Pro, or Pixel 6a (as
> > a future addition). Such a DT will have certain nodes disabled / not
> > added. To facilitate such a generic gs101-based Pixel device, also add
> > a more generic gs101-pixel compatible. We can not just use the existing
> > google,gs101 for that, as it refers to the SoC, not a board.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0Documentation/devicetree/bindings/arm/google.yaml | 18 ++++++++++=
++++----
> > =C2=A01 file changed, 14 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Docume=
ntation/devicetree/bindings/arm/google.yaml
> > index e20b5c9b16bc..a8faf2256242 100644
> > --- a/Documentation/devicetree/bindings/arm/google.yaml
> > +++ b/Documentation/devicetree/bindings/arm/google.yaml
> > @@ -34,11 +34,21 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0 const: '/'
> > =C2=A0=C2=A0 compatible:
> > =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google Pixel 6 / Oriole
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google GS101 Pixel devic=
es, as generic Pixel, or Pixel 6
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Oriole), or 6 =
Pro (Raven)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - google,gs101-oriole
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: google=
,gs101
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - g=
oogle,gs101-oriole
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - g=
oogle,gs101-raven
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - g=
oogle,gs101-pixel
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - g=
oogle,gs101
>=20
> SoC cannot be a board in the same time.

Can you please expand? google,gs101 is the SoC, the other ones are boards.
Is the commit message unclear?

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const: google,gs101-pixel
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const: google,gs101
>=20
> This should be fixed list.

OK. (This was inspired by Documentation/devicetree/bindings/soc/xilinx/xili=
nx.yaml)

Cheers,
Andre'


