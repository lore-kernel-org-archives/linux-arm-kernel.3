Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6616D29DFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhbnhDNALcR78uDRf6sBCK/dgtValZQ5tQnOJGX+vEE=; b=rX76q1SqkexNbQP8gACxWAP69/
	mdzKUGiYDVgDh+9Dxgcsr7EBE0wMhs0fDxjRBy4F/IwqGKIQD3ChZKvKJJ2YbuLyzs5jFXB2rlF57
	U692gOkv/pN7DopAyXnb/wz0MmKSBGwgxoLUBzBXhNFoJ6/1Zx7yhQwidJ9b9bVt8RLd2zOwO8yRe
	H0YEs81PRQKOkiseRARDgScaU8cqbnOPSumelGLBwBpso5QWyyFODFAhbZV9Eavfr0K99nBVjkOz4
	V6s7hNgPaHPu4l1Guge0ngdjgaYm7thm9XUvGwhXla9V2vzGm4d5zlaTZvqhFXxIzoOpoUfe/5Eb+
	TSM2INFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbAH-00000006rkS-3FXT;
	Tue, 13 Jan 2026 09:58:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbAG-00000006rk9-0cpP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Jan 2026 09:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dhbnhDNALcR78uDRf6sBCK/dgtValZQ5tQnOJGX+vEE=; b=dp+sVq7ke3OE8k3iHT4dsyK6uO
	g60AEPVn/CyBsQStb8tXIlULx4WEnTkYiE2MnItNE0Te8p2UoCH+M47eH8ystIFnFrMlP0XNE6zaw
	j2+pxmXJ4GdS6i2KKCsZaZNpnvj8VJ5TkB3LF+r5gJLZa8ZtiXLej2j7xXjmK2TgmE76o6JpF4KBV
	iq/dtRyj9J079/9mEVErlTLEPaRXeQeiPTb1lJ1fdag2FJhZ1LGthmYEp8XtZ/s6yJL7Mr/BDrifH
	vCiJJxfq/A9PvUVB0Ypjmu0sY32ubP3xCizpKZnyGRrcre2ZBQq47gMcdlhT4gGocy34E5UnTFZjv
	3bCwR1ag==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbAC-00000002Vpz-32qI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:58:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a07fac8aa1so55394315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768298290; x=1768903090; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dhbnhDNALcR78uDRf6sBCK/dgtValZQ5tQnOJGX+vEE=;
        b=Zuw7M3lnZa+Ej324ASHFondYxchZHclY+M1tAFwcA5q7Tuqsl8/GRN0jLKLaH0cH11
         a6aFF0GgQsCwnzX6eftyWy6tUOjSE5dPutwU6nFnFdpYQ+h7CJgMntAmTGDofpKMIxGW
         npLieKIGTSI9TYdaf186BJ1T0aYvfqHiF2607SaFKOqZMB1eFclFm75vmo2F1fyo9wov
         SfdwjHkajZhjXS+lZqiHN/0gGHE4Y5mciMMB5vLeZ/62bDnedxdZmqYzFjhWmZYs0YQg
         F/zCDEKpR4ieE8xIVXfSyTwdXx913CwmKhyrviyDMZrjF4TeQSNAda8EGMd6ZYLHUBJb
         vCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298290; x=1768903090;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhbnhDNALcR78uDRf6sBCK/dgtValZQ5tQnOJGX+vEE=;
        b=R7tgqrKiusda0CMc5Bc5LzboToKO8yf0xGs+AQW4MbI4f3Y0r9QBpTlini+N37ilVl
         hjcPyWwKf11W8dnunv1Zsh6wheppqvGHHq3tfzRLMP0R5Tu8EnjV24mkDrx1gqVx6Qnw
         0fCzsioG8aTpr828PdNwBja4HkJTmE9Ta2lIsuMkJoS4W/5M0PWZV5jf2x2kWYM0O3wk
         jKDQVv0VvA9kvr95myVoOtNkFY8JK719pDnbZoTwvlMdsIz3tek9e6uutZvmO2T3/90H
         dd5NYxiHfmV95ex2t3qv63OgqjiCsav3deH5Y1zZqrr2ZWD0IZ9aubBqaNkLpzKJSH3i
         JzSA==
X-Forwarded-Encrypted: i=1; AJvYcCX8f6SOHhIq9Cb2gpXJWET5C7fXYtktc0bYJ1Bubg+LVkNr2C5C8EelbtUJi8YMGhwNOubS2ue5t59K/GaMXm/2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw92c4ughYsa42JSEuH7DwNH/9S5wtmOIRGLA4H/rLhcS/cPpuW
	jL2yu2dS+EdoRFMLPk5p0imdLEyTxIMlG8hnXqkXMz4mA92fqQQRo2XheUt0j7qmlVo=
X-Gm-Gg: AY/fxX52wQrT4sktrPweTgZo14m2qvztSnMuq9bhDg2oP7FHGA4gEUDefMfa9xr0VIw
	j1Mi4Ai+8t9F4ugAOALkz6gPGMKzKxDgllGbvPYLZQtW/+Ixt8dWXUFLOFSB8kgkxFDSTWMY5Tk
	QSGWZYNzUWrWuC18pMYIrWB4NXS8LLaWqGBfdKSuzjR2t8hr2O+b7rznYIC2YV7uLZ8/mkT6RlB
	FPIMV5D+zOejiWpAQ3ifsVbjNS5fm8h+b0s87bL727NDdSdjzijkVTt2J+zs5r/nePFFECZUZOA
	PoEDDS37Qnzc/kZB0aFTbAKnYVSUaIPYDcpDwVdSdH9irHW5LS9i0VpUjqt/dKUBJms985yyi2P
	6krlohKqxSIVPclR7GP0/CSD6Zuz5+Ct2p1eFFFLp+Q4Y7RzZJ++nRfiFYrhSTCEzqU71plIkno
	2lJMMerW1edR6dyy3e
X-Google-Smtp-Source: AGHT+IGd8O7bXon4aWxByHwIR+r6yYy/wzypobdk+VV4f1Z0lhI6RmpCFqfxtS7zisBuvgEEiCwJmA==
X-Received: by 2002:a17:902:e807:b0:2a1:e19:ff0 with SMTP id d9443c01a7336-2a3ee4b3165mr186626875ad.39.1768298290235;
        Tue, 13 Jan 2026 01:58:10 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c5ceeasm195176785ad.45.2026.01.13.01.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:58:09 -0800 (PST)
Message-ID: <c1045dd2f33ed3a618381448717b0b5d5b28dcb5.camel@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette	
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Tue, 13 Jan 2026 09:58:38 +0000
In-Reply-To: <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org>
	 <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
	 <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_095812_837820_936593FE 
X-CRM114-Status: GOOD (  20.21  )
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

Hi Peter,

On Tue, 2026-01-13 at 09:13 +0000, Peter Griffin wrote:
> Hi Andr=C3=A9,
>=20
> On Mon, 12 Jan 2026 at 14:26, Andr=C3=A9 Draszik <andre.draszik@linaro.or=
g> wrote:
> >=20
> > On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > > Fix the places that don't have correct alphanumeric ordering. This wi=
ll
> > > make reasoning about where to add future entries more straightforward=
.
> > >=20
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > > =C2=A0Documentation/devicetree/bindings/clock/google,gs101-clock.yaml=
 | 6 +++---
> > > =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clo=
ck.yaml
> > > b/Documentation/devicetree/bindings/clock/google,gs101-
> > > clock.yaml
> > > index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae90800b=
9c256bcccebfdef2e49 100644
> > > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > > @@ -27,13 +27,13 @@ description: |
> > > =C2=A0properties:
> > > =C2=A0=C2=A0 compatible:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-apm
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-hsi0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-hsi2
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-peric0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-peric1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top
> >=20
> > If we keep 'top' at the top as one outlier, it'd reflect that it is the
> > top unit and all other CMUs are children of it.
>=20
> Thanks for the review. I opted to just keep it alphanumeric so it's
> (hopefully) obvious what all future ordering should be.

One last comment: except that all other source files in the tree place
cmu_top at the top. It'd be more consistent with those files if done
similarly here.

Cheers,
Andre

