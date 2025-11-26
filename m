Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4457ED11183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=; b=wOs9U6jLmnYE/GzuQtrgFyCbPe
	HLrzSyWUy15OThzPQYQMfYzvWHjuFm4oXQtmL+fxf96akIQcFm2gbpxWpfZwyzbAvjaObJxHnY5DK
	rvwyXbfe9GPbbPXpYk3wkhnPbdU7rnC5c20gYScbPU5ZIqZc7rOdv3SsqvWuwSd1/YEAKbQdmoico
	TEEcQwIGENE8/r/Rh+O9pH0+rCeOaXkbXhLDvePEitgLlm3DWXXZJCWYVoDpqnrMj8EkyL7RSozXF
	HLdIZMThbQReCsxpSUaOOKp8hYe4QksAIu+ag553I1Jk6FM8pbsWfRic+EhpHYtqa2YgOsBos5JJ8
	BOOyc3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIEC-0000000FHrc-3oNn;
	Wed, 26 Nov 2025 16:18:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIEA-0000000FHr4-2I9i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:18:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso73857755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764173924; x=1764778724; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=;
        b=hzuLg7mfcvEAM7ggPR5Q7JCUFL6qZCUlBM1AzbDm+EAOWMf9wIANVZvRoJRMgcfKoN
         ERtOZ5gG8PxY9/gNNNS9+YSeq64oeXd2Gv4qZKVPFe0mevCYnoVtIKVBpfFYJ2lYmbRu
         OgU4uURsy2i6z07ZrTz9So4pnmHi5yMgk4XseswapWaI6FA/fOTpVK3SAtGO/viJ7ml5
         JDUIRuZCm/02T8IvTpRt6j+YSAkRlSBK2LzKgLKP5tdsrT1K/nUbpl2sq4htiiyTo+CR
         BCegxTAN4G0RoFvYinpFY0PewJdZC/xucPxnNfPpH9cDvClTxZ9elsTzyhzhwaVhvXAY
         j++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764173924; x=1764778724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8a/vfmrnuuCKlhPtRmNUE7pjBPlzlE2qXTzeU2dArw=;
        b=FaxCC4XULZfaR1Q52JmFnL+7mkkPMRiOcsZnKRHrYbaF5dMRdcjAZYgRxUojt19w6C
         wTpuP8smc/X1Agmv7+Fr4cn6XvayVWkVVpkJrl0doW0R067LvmePCXNWayo8JlFqwDj/
         M139lEBHr5KOqW5XaGUz/tQvAER0/4u/XtmfvPqCuaD/NBs5Rdyxd/dCV/xvILYrYGin
         a1EEUITKZ4ZIasOg42rvK90q8oF1rprzMrclOuq1bt4Ql+JUr17JKak9l2ciDf9uDPCE
         nbhtyVYYWPF+36VExcg0hnqbO1HQvI5rTVT1Fy1dUlAMpdwoTiu6Qu8zO5QbD5GGpgQq
         jlrA==
X-Forwarded-Encrypted: i=1; AJvYcCVlAoM/a3diNxZnnlCh3rFRObVSrhqJMV+qFKYcQ8iO2Ei4zJAMTveiufW+00fVvjdmGzbX9XFs7HK1HRwMd/5c@lists.infradead.org
X-Gm-Message-State: AOJu0YyggJsS+TcqBKVzyBklOsthK2MM0CtNoD6W2KEdoBBasFRkjUN3
	GxnGYAA0vWa43RfWM6mI6Rz0bGf/eerBfrNNqDiSe/ov6YTCbZcY9BJjQvwYbpTVp18=
X-Gm-Gg: ASbGncstE69wqYCmliTxU6IzVm4uigjs2nw9wzesaXJTj56xX3gNTf5KPLzLgOq8suG
	FYmdkZp8zfu0gMhj2QTN8GXL39pNpgP3FE/rRIqO10ua0L8KaRnbguH4YB/FCu9zeMJYCDUGvQp
	xyyjuQL2ZLcij15Fy3RQlgn9VTKlvj3t2IZKbBG3OIoFH6ynfJCiS3Dbw5DhqeyWY8a0xu4wtkn
	jBUnF4Z7aIenENXQC3TpIt0tvplSmIbiQ3EZYBRkTYgzF3BT/1Qr86pFWxPvVRRMdt34BNDEXxX
	C+MrB+piTks4PtsR1OJ+iESGrJE+t+n22mE+o+feO5/aFowvU77atq9mWYEe3AjRWJeLD8IXYZW
	1TqoMFKIP90IosmC5kQ6CrP6zkU/Tz/ZDgknOCL7szwD7g0Po5uMG5DlsPIh1yNMg0sQYwWmqLz
	G9+uIGc24iL4WNg2da
X-Google-Smtp-Source: AGHT+IHPbIx23EDNZaUTAJ6Psvz/ev1Z/O51tl6vv+BcSPNYJjiwrPTdLBSRYd1ljvmAqn0aCxUGmw==
X-Received: by 2002:a05:600c:4f89:b0:477:9bfc:dcb6 with SMTP id 5b1f17b1804b1-477c10e2bb4mr209401045e9.14.1764173924510;
        Wed, 26 Nov 2025 08:18:44 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2c98sm49691755e9.5.2025.11.26.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:18:44 -0800 (PST)
Message-ID: <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply
 property for VBUS in OTG mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones	 <lee@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>, Kyle
 Tso <kyletso@google.com>
Date: Wed, 26 Nov 2025 16:18:59 +0000
In-Reply-To: <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
	 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
	 <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
	 <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_081846_606630_42621E43 
X-CRM114-Status: GOOD (  17.01  )
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

On Tue, 2025-11-25 at 12:13 -0800, Amit Sunil Dhamne wrote:
> Hi Krzysztof,
>=20
> On 11/23/25 11:53 PM, Krzysztof Kozlowski wrote:
> > On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
> > > Add a regulator supply property for VBUS when usb is in OTG mode.
> > >=20
> > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> > > ---
> > > =C2=A0 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 =
++++
> > > =C2=A0 1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yam=
l
> > > b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > index 3de4dc40b791..a529f18c4918 100644
> > > --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> > > @@ -32,6 +32,9 @@ properties:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Properties for usb c conne=
ctor.
> > > =C2=A0=20
> > > +=C2=A0 otg-vbus-supply:
> > How is the pin or supply called in the datasheet?
>=20
> The pin that supplies the VBUS power in OTG is referred to as Vchgin in=
=20

I think that should be chgin (without V prefix)

> the datasheet.

Cheers,
Andre'

