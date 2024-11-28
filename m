Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC4AD690E8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ce1Yw0qnP/hYgtuVuhHQzLquqkZiusD0COEs+h5WKU=; b=epSntCwDk/4Udk39XXl/x6B6gM
	tiPSahFYDwFHRx+wTqOCBThSDmQgZDZM1warZQuZKmNWQQpcGVCPaYHH/SoslFGSY2icoeFtL6CoA
	vg/EHsbsSwEY+bqExTkF2jrAL0cGRYLOPM3+8AV6ireX06JXuUUNrRQGRsp2UBMr2mgMLi84AzVNO
	rKH8Xi/mgJaJvUjB16aY72FKquSV2/zRSt5a+WlV19IGxYgH3/C6a+D57U7Wb42YnBhhac8VngvoJ
	QeDEiVn4u93g5b6QyjHIOEDZxDnfuaMFzOVeOL7fWD4jFyBKcT0Y+EXQUGJNVr7W7I3yhMm4Op7Ld
	DIzVF1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZuS-0000000F0WE-3cEY;
	Thu, 28 Nov 2024 08:30:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZt9-0000000F0KG-1aMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:28:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38246333e12so520100f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 00:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732782518; x=1733387318; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ce1Yw0qnP/hYgtuVuhHQzLquqkZiusD0COEs+h5WKU=;
        b=EiS3Kt0luENamY6u1Wn3GtKbD35+fM8GZ62xt295ZTqkRFjpPXrY72LpKq9+2d9/Tk
         G3ffSuWGQHKeOLurWDRX16hIquZYebvtk3nVs65UrjotBLnA0/VYcXiCMXr2VIqRk/8L
         pOT9kofDILZ2rjbQ50rUG89XjxFIgAS9nrOmMc+UK+fBu93FkhuDLBADP8NCvBEh9LEj
         4moXtyl+nf/nhLxzvOQKszRtBDmpIn/EwcLqeENUqNGswyvptyPy+Q3f0RKqOZm2rRnL
         3sZtddUYcgjL4FLUbQGzIDU9MS1/n3P5Viu7edMuBcGQowkxYlmGayR05rZUzQsToYAp
         bfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732782518; x=1733387318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ce1Yw0qnP/hYgtuVuhHQzLquqkZiusD0COEs+h5WKU=;
        b=DUjniY3Qfif9Szou7Zmj+Ux7eQt2C5zWL8Cip/EwChzXuWrEaDOJj7+R4aXqm4PHSh
         xX6qOJeBWh35S4rpRRHNn2qWEto1R/LpqAHQjubvV1lpGGibuTjZPb7J3mRQMbRUUSp3
         dzc0coBhCQlEbPzxPVsMyWZW9kbFdKgdB4dAE5XcU+31BFgE3bLtOSOqvyihz0+0h9wn
         Ht1K63yIr8qXcY/t/hVqqfzqquRcrNbfK0Ibef27XmSiq4Mg44VL2oj6EQ1pukx9SqIj
         Aji6K+UfdUbA/xsAA/p/JlzxGVt+9irHG0h4sb3TeCb5cs2s2Y/sAxYZg1cRTFjZy4ns
         G7vw==
X-Forwarded-Encrypted: i=1; AJvYcCVgGCNlUdmHhBTuzHtshxNKBPInQrAdxyRpDYLEKntOzg8M8A9a4T3t0F3apoxzz+bkbNXKcdUrJUq1YAdECle9@lists.infradead.org
X-Gm-Message-State: AOJu0YzxydtMebbFiosc1H2ab8jEhMdWkdUCKivhemGI4YrmcBaY0ByH
	1qb0V4oOhNv7hgxgibOVaZ8ksqDT/09F7xOkAJDgXTLh8ZRKrdLP3vCoxjlO7OU=
X-Gm-Gg: ASbGnctnuL5RMBMs1i7IEZL3wCXqmh/MWPRnGn8QzPmUHbxFZQAebwIFMLm+fstru9K
	1z5vMxBMAKZxPTHyXutT7kDlslHLQUscAiJtqEBWLOG69AmxkkMQITnunth99bvBkBiEmkTCZ5c
	+IxShFJOACrTzCLI+VrGhilNsy82RqpmkFF/XDUrJl1WYnGm3CR136frCa4urCiIVjTmz4KiUZg
	hQUnqM2dYY/Fq0jPCOnHuFVqHYhdZalUCx05gCUT4kowavu5kdhd+w=
X-Google-Smtp-Source: AGHT+IGTu0qgLLjoHLlWHxSoBIFSoj8XfsMG9AhcjE3+CF/PWBajZkgTxHHhlbUBKXo2AHNhIEwVew==
X-Received: by 2002:a5d:6dad:0:b0:382:3959:f429 with SMTP id ffacd0b85a97d-385c6ccaeafmr6070314f8f.5.1732782517632;
        Thu, 28 Nov 2024 00:28:37 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a54asm996072f8f.50.2024.11.28.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:28:37 -0800 (PST)
Message-ID: <663f534cd88332ecf64e575ea0cfa1f40e303373.camel@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 TCPCi
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-samsung-soc@vger.kernel.org
Date: Thu, 28 Nov 2024 08:28:35 +0000
In-Reply-To: <b0c5e443-79e2-4e53-8813-57044a627dea@kernel.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-dts-v1-5-5222d8508b71@linaro.org>
	 <b0c5e443-79e2-4e53-8813-57044a627dea@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_002839_471322_B442A511 
X-CRM114-Status: GOOD (  12.60  )
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

On Thu, 2024-11-28 at 09:19 +0100, Krzysztof Kozlowski wrote:
> On 27/11/2024 12:01, Andr=C3=A9 Draszik wrote:
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 99
> > ++++++++++++++++++++++
> > =C2=A01 file changed, 99 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > index 387fb779bd29..5f7be0cb7418 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > @@ -10,6 +10,7 @@
> > =C2=A0
> > =C2=A0#include <dt-bindings/gpio/gpio.h>
> > =C2=A0#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/usb/pd.h>
> > =C2=A0#include "gs101-pinctrl.h"
> > =C2=A0#include "gs101.dtsi"
> > =C2=A0
> > @@ -90,6 +91,84 @@ eeprom: eeprom@50 {
> > =C2=A0&hsi2c_12 {
> > =C2=A0	status =3D "okay";
> > =C2=A0	/* TODO: add the devices once drivers exist */
>=20
>=20
> Is the TODO still valid?

Yes, there are more devices on that bus.

Cheers,
Andre'


