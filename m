Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AEECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xa5OIKUu0Ca3IINo/LGf7w71t2tXTJFyE2lgg6vz7B0=; b=m+fqxONzRo6G7UlCPKkQDydVMC
	xrCYQkpX/Ez7WJbRk/sAivZc/XdAU2ATMHL1kqhka7T0scmFKUuZ4yarlTHd1BcUOv4wVNXyWPPeC
	tYhbfnVrWid80SuSU3L6ktWzbsD8ZECFvUUbDoxWbh5eLJ50C8GPbvKMLHsjeH9BwUxe1oPjRAKW4
	IZ0K4mSW/lYeWEPqg928KjRedDgzLIGBiYhXp9Yl+GSwO0kBYBln3Ew4Dzxgyr86+h7gi2PAOKml8
	ZqiG3vq8pF/MWzOgRnDundq9aeuLnexmcrFHH8rc9eebuAL1J6PT7+O+dacZlwKugnUeQnT6VyFZF
	297xO0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLk7-000000019mz-443c;
	Thu, 18 Sep 2025 21:00:39 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLk5-000000019lP-0hp8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:00:39 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e96c48e7101so1280262276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758229236; x=1758834036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xa5OIKUu0Ca3IINo/LGf7w71t2tXTJFyE2lgg6vz7B0=;
        b=RwRtYGCAgJy7rOPeBvbeqVDpWoIAxJ1NWDc5wkEcIdHSymePiDhxZCz3Sncm1nrIBY
         vjklaUHPkdjnWzBSFDDR3hsA/8mJeDbaMjuEsapyJEWGb8hop3R7nodx0o1qbarHwRdX
         c7XqHDj/6Vrwhkp+gye6lDBWnxMdSLMMlxRG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758229236; x=1758834036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa5OIKUu0Ca3IINo/LGf7w71t2tXTJFyE2lgg6vz7B0=;
        b=eR/FQCdAQqdg/Et0Mlloc67+HsjJqSuKlbuiS2mrnfwiA/h+X9BtOGBK97BSIoYoat
         knCqRWpFYzMNa/sd9RTLzHNOgdu3VwAREUVaVwfOh4Gb0vOqMleu5DHU2rK+mZdaJ9ca
         BEoga0VpncSsFTX6qFfX9JEXMUmKNwX4rL+ObIwM25Mgi7xBTxPdUUl0nLCB5xEofmEO
         +iLwmgDWwBQPsNi6hkgG5Sb9+0C/A5SR+3K/E/ig0KysVjf6mDaolHbLFPeRo2UQWDwR
         b89HKibZxM8X6R37vwsVeAsAhD48TzI69QLeyEk5NBuvxZeG5f0Ya0w51BCl9yEy/Q7+
         79CA==
X-Forwarded-Encrypted: i=1; AJvYcCWfimbSOW6Gd5eEKjopplYWHt8CIglYQtGtdT1UZLIZOI9Z86h2wvUJInnJysnTVJW018cwS50LGRXjsUcZeFod@lists.infradead.org
X-Gm-Message-State: AOJu0YyGC5lWURT+R2pRZ7WGpEh0QzSzMc3/uC6wZSdHU75PUE6U3nmC
	IMhtT4cEFDSKqegwc9L+tr0XVqYeCbSwx3zUm3zZ+ZpuUffYD2QXbVwA5RtqEKMvaC3aHnV+YGP
	nl+SOoUHAMqq9RH/ThUP09+8Abfdq87DPRrpfW5NqtQ==
X-Gm-Gg: ASbGncshfoVxZaK/W9oP55L86tr+SZdgvX+og3YxT4OMLJyulxnT/pt0avkfp3uNI+x
	oVR5N46mwN8zpilQZEYxGScDpv8udFPEzz4bgsrjDKtd4R1EGG58nd2lGYbSlR8hxTKOVs3iuP4
	rl8jdrqesvAVsqttzhXZ9XSHDoFuiMaTx5QADAK2MEX6rmySa0z3TmY6SFsF3qQuyl1896HpGIn
	QB7DSfMYDBXlXRgRqHay0PVlno00o8DmCM=
X-Google-Smtp-Source: AGHT+IGp28b3RtzB09/vCQSod/GaXBm+1LaU+/ZwEenKAZ82Ogxy8gcysNIceSHCo4CO5jfnfEMY8Yfg89rinFTkagQ=
X-Received: by 2002:a05:6902:610f:b0:e98:517a:d058 with SMTP id
 3f1490d57ef6-ea89d1e9730mr930412276.19.1758229234832; Thu, 18 Sep 2025
 14:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
 <20250918153630.2535208-3-dario.binacchi@amarulasolutions.com> <20250918201027.GA2547040-robh@kernel.org>
In-Reply-To: <20250918201027.GA2547040-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 18 Sep 2025 23:00:24 +0200
X-Gm-Features: AS18NWBVm6SiQea3xV3X5Izj9IWvwA2EVM6sgJdzxnP17KY04QnqWViQQGH1JFU
Message-ID: <CABGWkvoxALJgbmaiBe7+1EidtnX2aVE9M9S=QS_Z=hOTh03dRA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: touchscreen: convert
 raspberrypi,firmware-ts bindings to json schema
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_140037_211431_26F6D626 
X-CRM114-Status: GOOD (  22.96  )
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

On Thu, Sep 18, 2025 at 10:10=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Sep 18, 2025 at 05:36:08PM +0200, Dario Binacchi wrote:
> > Convert Raspberry Pi firmware 7" touchscreen controller device tree
> > binding to json-schema.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > (no changes since v3)
> >
> > Changes in v3:
> > - Drop firmware-rpi node and use only touchscreen node to fix warnings
> >   you can see in
> >   https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202509=
13092707.1005616-3-dario.binacchi@amarulasolutions.com/
> >
> > Changes in v2:
> > - Added in v2
> >
> >  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------
> >  .../touchscreen/raspberrypi,firmware-ts.yaml  | 40 +++++++++++++++++++
> >  2 files changed, 40 insertions(+), 26 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen=
/raspberrypi,firmware-ts.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen=
/raspberrypi,firmware-ts.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspbe=
rrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen=
/raspberrypi,firmware-ts.txt
> > deleted file mode 100644
> > index 2a1af240ccc3..000000000000
> > --- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,f=
irmware-ts.txt
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -Raspberry Pi firmware based 7" touchscreen
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -Required properties:
> > - - compatible: "raspberrypi,firmware-ts"
> > -
> > -Optional properties:
> > - - firmware: Reference to RPi's firmware device node
> > - - touchscreen-size-x: See touchscreen.txt
> > - - touchscreen-size-y: See touchscreen.txt
> > - - touchscreen-inverted-x: See touchscreen.txt
> > - - touchscreen-inverted-y: See touchscreen.txt
> > - - touchscreen-swapped-x-y: See touchscreen.txt
> > -
> > -Example:
> > -
> > -firmware: firmware-rpi {
> > -     compatible =3D "raspberrypi,bcm2835-firmware";
> > -     mboxes =3D <&mailbox>;
> > -
> > -     ts: touchscreen {
> > -             compatible =3D "raspberrypi,firmware-ts";
> > -             touchscreen-size-x =3D <800>;
> > -             touchscreen-size-y =3D <480>;
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspbe=
rrypi,firmware-ts.yaml b/Documentation/devicetree/bindings/input/touchscree=
n/raspberrypi,firmware-ts.yaml
> > new file mode 100644
> > index 000000000000..697c508326b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,f=
irmware-ts.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/touchscreen/raspberrypi,firmw=
are-ts.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Raspberry Pi firmware based 7" touchscreen
> > +
> > +maintainers:
> > +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > +
> > +allOf:
> > +  - $ref: touchscreen.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - raspberrypi,firmware-ts
> > +
> > +  firmware:
> > +    description: Phandle to RPi's firmware device node.
>
>        deprecated: true
>
> It should be a child node.

Should I add the touchscreen node to
Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
and remove Documentation/devicetree/bindings/input/touchscreen/raspberrypi,=
firmware-ts.yaml
from this patch?

Thanks and regards,
Dario
>
> > +
> > +  touchscreen-size-x: true
> > +  touchscreen-size-y: true
> > +  touchscreen-inverted-x: true
> > +  touchscreen-inverted-y: true
> > +  touchscreen-swapped-x-y: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +
> > +examples:
> > +  - |
> > +    touchscreen {
> > +        compatible =3D "raspberrypi,firmware-ts";
> > +        touchscreen-size-x =3D <800>;
> > +        touchscreen-size-y =3D <480>;
> > +    };
> > --
> > 2.43.0
> >
> > base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
> > branch: drop-touchscreen.txt



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

