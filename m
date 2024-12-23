Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987C5E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqluWNRDE4YKKh+6ZVJkRynFpO3XhtHHTARHI3/wG/M=; b=Zs8cvqJe+F+uwCOvlqgI3S/lwU
	0XsP4OUFrjKZpXb3C125LEDN4zBSnrF93dc7zVTFJKReCOrj6ix50lPU6Mi65zbxIy2+T7Uxz5C0n
	A+jWnV9Pg0vzAE8guoD44Ybk6wn7isRePzgL6tLKtbRsu6n0JG5aBoRY5OQzQdrW7pjfKyEaLSr7t
	il5Fu91FKmv84JP5wt/I1vS5YiT1IW1OQfSdxy9Hitdg6Ud8u4D0+SA4yBFPKvV5BjKx5/AkL5rZx
	lQzXmgYyRVeYsdkb8K+OiQdxSv4Emf9sGwyZ3oiJW+MXYQ2ClTV4l5/0vg/xfzvrElo1tRKOLKMiI
	lGmfbO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkmM-0000000AJxh-3ZT3;
	Mon, 23 Dec 2024 15:55:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPklA-0000000AJtD-3Dmy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 15:54:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43618283d48so32089655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 07:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734969259; x=1735574059; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WqluWNRDE4YKKh+6ZVJkRynFpO3XhtHHTARHI3/wG/M=;
        b=czxJe/9iRt7SNyKaiu5njpoerfkmDEl8Ze/uqGAohd3NxcX2Tu0SFmsNMzP8OXBhkl
         8YmnpEkYo0y21oS70f6BShpy/ReaaYXhTYXPuUbgrtqqemG0tYMUJ4p6VxjIB+JZuFXg
         dHumY+Sj79aMihref7HQbUqNwsvWw9mtubTBpowXxSERLJXvu5upxLHSuAgtGPx4onqg
         jr4sU2d2QPQldpUiztrScFsSTcSJ2TLOIXbRrbEpqW7iPAL45kU1vMlQ+qOt1vbRq5ET
         ofEZV3ZbtoMgd0bQV1o1bBzVO3IFR3iBoUU038ga1CZwZ6SzGGqn9q9q6G274YHletbu
         US1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734969259; x=1735574059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqluWNRDE4YKKh+6ZVJkRynFpO3XhtHHTARHI3/wG/M=;
        b=C/9O3K59zEjD62lYJJFTadXKKZFPf4g1EWBDGMQDV4Yhvd6LFSNFyTLpSSWJaOp+d9
         UFeczc8NS0XJwe2TjI/8oHHR27JJZUrY+EnLI2XMGVsZUWx3xS2HLfgGi0dEkBOr8uqo
         UsCRmXT8AapJIF/PzzSlMWXZda2ilWaLSmfTqWpRMn3hFrFCmkjvmniNpv671unfWM57
         V26W/D3wKkOciV/SZwrvfR+UbCxKc0R5svEfXvhuFA7SR3iMerAOQKNsCqhyW2al6QcP
         P9eoirt0/NCHwDwEjc+vxXFuOgEPOkuq20CvYy3cj7GVVDgqWmsewI+dx3Me8yG/vWvO
         t0yA==
X-Forwarded-Encrypted: i=1; AJvYcCWoPc1Kg6lGIWvctdAqCzAKXFyMq6iFz+x9Jz9RWb6b+6mxLI+uvy7mDZHa4E9j2MAZImcm+ZL3vJlFwB5mgjAa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6H1P7bU/wqfRbGrUAjCc1VaKlXndO2RFzuKXTN4i4eiB3Zn5f
	tggsHB6glNeWZcCjOPcUSdSQjz56/pVIsIQJrD4ryiGjDW8ssyWokh1mdwCdSEI=
X-Gm-Gg: ASbGncs2oyTdBatzh6kJgOchA6MsWLl1yG5Z+193u9UTJiGSofLVLI2TmdD9mVL84Sp
	rJt5mEdQ636+4WKj+Lr6/yzdjgwwGrysT4JqGYaJQ2QhsYQVYplOagQZ0WlAGpm9fS20gjSjO32
	LCmJKmDe+7tRJop2eHvIHs0xUKcJmnbxIQ0lxujO8fXKt4uTHTAnetv6BX1g+37nPOeDRkZs1Ze
	9AkOln5Amlh7YQaueu3r7M7EmCMxfL6unXj5Dc5XGFnEz8fTDubgcILD7D4Jw==
X-Google-Smtp-Source: AGHT+IGXa0TrQOSZFAUYuStWX/JYX94Y0VcFf0tq0paQl66u9Om48mfMnJ2qgjLAvuQBzCBhXSshNg==
X-Received: by 2002:a05:6000:490e:b0:385:fc97:9c63 with SMTP id ffacd0b85a97d-38a221f16d6mr12153008f8f.9.1734969258675;
        Mon, 23 Dec 2024 07:54:18 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b00cf6sm176394475e9.10.2024.12.23.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 07:54:18 -0800 (PST)
Message-ID: <34f62a976e4dd2d56eb34e4efa987ddc3e2f31ca.camel@linaro.org>
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
Date: Mon, 23 Dec 2024 15:54:17 +0000
In-Reply-To: <c2efb6c7-4a0b-4078-b0df-6e646eb88906@kernel.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
	 <20241220-gs101-simplefb-v2-1-c10a8f9e490b@linaro.org>
	 <d0c1511f-b052-4690-aefb-3fb41e1e5875@kernel.org>
	 <cfdc5b1b03140e3d2ce3fb58e8b342dc2ac06d04.camel@linaro.org>
	 <d960e22e-01ad-406d-9616-d45edbef0232@kernel.org>
	 <9507951f9ce4ee9d8c553d8964f00ef217f8ed1d.camel@linaro.org>
	 <c2efb6c7-4a0b-4078-b0df-6e646eb88906@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_075420_886509_73A83FA9 
X-CRM114-Status: GOOD (  15.78  )
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

On Mon, 2024-12-23 at 16:39 +0100, Krzysztof Kozlowski wrote:
> On 23/12/2024 16:31, Andr=C3=A9 Draszik wrote:
> > On Mon, 2024-12-23 at 15:14 +0100, Krzysztof Kozlowski wrote:
> >=20
> > >=20
> > > You now say that these are valid boards:
> > >=20
> > > compatible =3D "google,gs101", "google,gs101";
> >=20
> > Sorry, I don't see how (apart from the fact that dtbs_check flags
> > non-unique elements anyway). The result of the patch is:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 2
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - go=
ogle,gs101-oriole
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - go=
ogle,gs101-raven
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - go=
ogle,gs101-pixel
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - go=
ogle,gs101
>=20
> The problem is this line. Although entire concept of flexible list is
> neither need nor ever recommended.

All of this was inspired by Documentation/devicetree/bindings/soc/xilinx/xi=
linx.yaml
I guess not a good example in this case...

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allOf:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - contains:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const: google,gs101-pixel
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - contains:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const: google,gs101
> >=20
> > So one can not have 'google,gs101' twice. And if I only add
>=20
> Still can be, but indeed not with my example but:
>=20
> "google,gs101", "google,gs101", "google,gs101-pixel";

This example doesn't pass irrespective of binding, because
dtbs_check will complain about non-unique elements.

Anyway, will use separate entries.


Thanks Krzysztof,
Cheers,
Andre'

>=20

