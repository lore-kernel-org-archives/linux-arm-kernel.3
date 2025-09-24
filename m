Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDD9CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLgOCUDCg3e15Xq9G1KQ1McYlea09igd4ZKI0Cxr/n0=; b=nnD+n+qIdKyFwPT8Gstc2SbGBA
	DcgS/3RdfNwYKkQFGMqvf1qBV+5b7r57D/nexZD/6MCWTbSGO4J0o3NgriMgWtLm7qD6rrSGKqxYs
	YcJmZlcjxHoKdOeIyMwn7cJsrNanaueSyC/4x7xWsUaaZ0B/otcM2TRzLDKgc0F/eLKenE+fr7Hsv
	hYtXgFj3NvxalF7qax6XJ0ZYSu4OUYtXV0CGd5YhE1Ee6yrwXCoBRmZzMbUQGBq6zbCke9Qz2mJ7+
	pNW1b4is8gCIHlnUckvAOdHX1zUsRitBD79kGIz5ZGGRvVnChsreW3tR2qTCnKlIkRpL3ZpvAV1Qv
	NBc0MgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ebi-0000000FJa4-0zCn;
	Wed, 24 Sep 2025 01:47:46 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ebf-0000000FJZA-14lj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 01:47:44 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4b7d5978dd1so45313111cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 18:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758678462; x=1759283262; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLgOCUDCg3e15Xq9G1KQ1McYlea09igd4ZKI0Cxr/n0=;
        b=GhYzPmwp2WjfKuR0rhiH+ikQoOYJrdCzsXaXh4BZJv7ZC+BrQgDD6cbtmHfjxPLSAj
         1o5jGS2nxQGkDo+UHygG4amFWqEekk2Uri1LncGH6M9gPeO9s0e5mxKWXQutEX3dos8b
         V66euuwQKMTqUWsUT6RjOupEyWPQYQ/1Gi6XpBAXWVP16ldmjZPWNPdDsWq2jOQ2ZNdi
         oeUxS2l8Acs3yUAeeorTPGpm9g+u61l34EfwqGGcz3MZvtjysUPTiIhsVJQdhUJT8w5w
         KLFbvL1OWX9EgGiIpHQt2WWSMonkh6pxj91RWl0OC7r9AnDhJN4GOesGX2rv23BBnR0u
         Hpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758678462; x=1759283262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLgOCUDCg3e15Xq9G1KQ1McYlea09igd4ZKI0Cxr/n0=;
        b=Y9nrz628Akg3Ekb7zRu1pBWusz19LKtiN82eOGVxILVP2QDvEfnnqeBWtqp747mlgG
         YzJxHDEK4UOH++Gb+kMrRz0spjqnWem6drn1UMSAoB9dKyekHbbgcyK4kEvAGZqZFk27
         uidoPAF8WDglBn5oUTyU81x3iH9OCJPOZxAMLUgur3owwLUec2dNy48saDIvy/9IlI4+
         IEQSSNgwrzU24GuA5ryzpCKVc359LgLvOiw1PXtp9ouEIPBK95tRt3MgQDqRa/VBNl3y
         cbxADKI/1B/107s5aF822WplSXQZSz6F9TwwCPKaf/lEwPRkzhCbgPZDq7H+mMvxwydo
         pPoA==
X-Forwarded-Encrypted: i=1; AJvYcCX3ZKUjH2Yepe4jP+Pog0o9/Cj1tjXmZMIOEmVu/URAvwsMNHdWJu5kdi0R/4ZyWiocCSRaROEUB87Rvgr0YZBc@lists.infradead.org
X-Gm-Message-State: AOJu0YwKq3H7oHk7sN9WW4LPN6tBiiwWbl4BZMOyh60rBJrZVETGp/nk
	+zekAo8TmAs7RrCR16+9Lp42qwvPagESIsbHW+Zfa9MIBmFZ2t9FdWjXl8VfWE/a1e9HP547Oj0
	iY/WWpZLdJYGuvmApuxeEiMXGzWliuXc=
X-Gm-Gg: ASbGncuV9PzVnZFr/Z3/oAsg6Es1QyAFGTvGj4oDuI0AiABdhjMvYXykTO5lVTHXO8k
	e3KuTQhWTNDocC9YI3iEVx+I2p9Uehnph5oYWFBcjzj0P8++T6Jo47oUH4Xc7dKZjQij7FYMQ4d
	lxAmO/ayA33GNm1YZC7Hk6DNxSlyuAPExGL0lhtba7DPLDFFUY/adbRKLLKNsmSgYqLVqPW9Zoy
	hKbVQg7UOzm9PrzqKKRTCq18gn2UXIilOVsDJviZQ==
X-Google-Smtp-Source: AGHT+IGIdRfHkiKs+mEVrqwOIqebc0C5zEl3UZbwuHFpU0JBMj41WZopp8n9Y9s727VjtGPa/Ul2Bjj4jr777iaGRvg=
X-Received: by 2002:ac8:5ccc:0:b0:4b6:299d:dfe4 with SMTP id
 d75a77b69052e-4d36b0ee114mr51190071cf.32.1758678461949; Tue, 23 Sep 2025
 18:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
 <20250917101828.2589069-4-peteryin.openbmc@gmail.com> <f76e867ca4dff82744958a8b555cf226139bcd78.camel@codeconstruct.com.au>
In-Reply-To: <f76e867ca4dff82744958a8b555cf226139bcd78.camel@codeconstruct.com.au>
From: Peter Yin <peteryin.openbmc@gmail.com>
Date: Wed, 24 Sep 2025 09:47:31 +0800
X-Gm-Features: AS18NWC-njmIqq9F1PhVUvHcod54siZvcbKXObiObG8-iSHcZRG1G-1XqSgV-2s
Message-ID: <CAPSyxFSOBRT8muKmFbqc+_OkKZvO9YR9_bGvHVGaC2XP4yi=cg@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] ARM: dts: aspeed: harma: add sq52206 power monitor device
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_184743_300781_11E6AC8F 
X-CRM114-Status: GOOD (  21.69  )
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

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2025=E5=B9=B49=E6=9C=
=8822=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:36=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Wed, 2025-09-17 at 18:18 +0800, Peter Yin wrote:
> > Add the SQ52206 power monitor device and reorder the sequence.
> >
> > Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> > ---
> >  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 28 +++++++++++------
> > --
> >  1 file changed, 17 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> > b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> > index bcef91e6eb54..fe72d47a7632 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> > @@ -353,14 +353,15 @@ eeprom@52 {
> >               reg =3D <0x52>;
> >       };
> >
> > -     power-monitor@69 {
> > -             compatible =3D "pmbus";
> > -             reg =3D <0x69>;
> > +     power-monitor@40 {
> > +             compatible =3D "infineon,xdp710";
> > +             reg =3D <0x40>;
> >       };
> >
> > -     temperature-sensor@49 {
> > -             compatible =3D "ti,tmp75";
> > -             reg =3D <0x49>;
> > +     power-monitor@41 {
> > +             compatible =3D "silergy,sq52206";
> > +             reg =3D <0x41>;
> > +             shunt-resistor =3D <500>;
> >       };
> >
> >       power-monitor@44 {
> > @@ -369,16 +370,21 @@ power-monitor@44 {
> >               shunt-resistor-micro-ohms =3D <250>;
> >       };
> >
> > -     power-monitor@40 {
> > -             compatible =3D "infineon,xdp710";
> > -             reg =3D <0x40>;
> > -     };
> > -
> >       power-monitor@45 {
> >               compatible =3D "ti,ina238";
> >               reg =3D <0x45>;
> >               shunt-resistor =3D <500>;
> >       };
> > +
> > +     power-monitor@69 {
> > +             compatible =3D "pmbus";
>
> I realise you're just moving this node, but I'm surprised it hasn't
> caused trouble otherwise. This happens to work due to a quirk of I2C
> device IDs in the kernel but it's not a documented compatible.
>
> Compatible strings need to represent the physical device. Can you
> please split out a patch either dropping this node, or replacing the
> compatible string with something appropriate?
>
> Andrew

Ok, but this device BMR350 is not in the pmbus_id[] list.
I will add BMR350 to the pmbus_id[] list, and then fix the DTS
compatible string.

