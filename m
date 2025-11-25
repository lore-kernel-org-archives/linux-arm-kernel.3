Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F695CFD37F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uRBPHCgSxkmaA78fH0tH+mnux44EIWHYlNpY/Tgdjw=; b=jdMA9tKDfTJdHb/S3laYI/6/J9
	XvQNCx2IJGW7dUt+o/oEcMWQknVDJ9W5Qtr/mOII9sVJ1AcSdeqqkKUEN6OGuQS4jBIvagJquFqTd
	qmY+vD0KZmh/b1Iwt4g75PBnR+IXb4/w9yyB7/6BvLfYE8auvU/njm/an/gAbHVtrOf5Kw571W0CY
	d5Olrr/J9vKYiaKYX7KdYG5BD3eDiJUI2jc3bu9kc/xwkbcHoAjV87ccptYGMOhaWAaiYop5Vgo0x
	/uJt2yvISdHqjPI1KWeVE+xdN4TtyOZq1qp5MoP4+R+GGk9roi4AIK5j9mEZINdkkvPQyHTjAYWiF
	mkFjBDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqU8-0000000D8vd-1fQF;
	Tue, 25 Nov 2025 10:41:24 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqU5-0000000D8v3-2aQy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:41:23 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59428d2d975so5687635e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 02:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764067279; x=1764672079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uRBPHCgSxkmaA78fH0tH+mnux44EIWHYlNpY/Tgdjw=;
        b=e/HtKAy+UudS41cdLYDxmFuctWz1C8mu2YKPVGzYu/MlFpZxou7d7z3JcRjrgG3MXM
         0SEbfG2DjwIIFMvmDbhE7ws1HxRz4qcdrb+bRd3xEKG2CKOfnoGSqGT/rLdasrMwH3ei
         jKIND3ft9FQZerl1DivRPn/fEfxLHkbEtE4t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764067279; x=1764672079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4uRBPHCgSxkmaA78fH0tH+mnux44EIWHYlNpY/Tgdjw=;
        b=mpHWeCuCFGPr4txZ3EJY8rB0dnTPDXi17ggubov8pjrVdZw5I59TOtkQW60axju11A
         Xomzi0dSe12mE2qL3HHpatjfsCc42TobinBSL+UBy8e9/dFBQBum47/2T6nQGat5Yylm
         mjUUfmTy952I45Nsck446y4MQmk5SbQBsX52riiT9ak9NkbpMvr2/pQS81Eo8jOG9LRG
         yOQBc0inp9IPUCn9Eb7mAf5nwkWIPNxUPzlY1pAcN/KbK1z8IxG2X6l41n02kd+crUu3
         o0x+Q9QhmVS3x8jjlhO2FWoSRozB25N0DMeHNroVJ7/UjRnCtXR1psG0qRw7ei9irw7V
         rEwg==
X-Forwarded-Encrypted: i=1; AJvYcCXk3YXsZE8V6HgPvVrdOLusCH8oksOdmZZrra+ckWD5qxwCTZj+sCI6fjC6yA/hViw8oCrdS1BlZtXFhU+7b3GG@lists.infradead.org
X-Gm-Message-State: AOJu0YxWlddBCdiZBg3VN74Nd3ExdiorpsIxR4F30Si53+rVIwolFUwu
	lPeXubnj4oAHevqr2DThz7c1CUPNHd8xAtHnw/wppTHZfLUtg7wYcMBefwvPKwJjmvvfcgTaxHb
	iEGgke5LO0oXQ+ZVJIG5mVsjC6Eu9+xezPKM+rxNO
X-Gm-Gg: ASbGncuOD8MKRVmTRxzPDxjWyc1pW3eb3P7/vSiTwFe7WVA9pfflbAHmozlUEWXhNC7
	RyfITPL+NhaNrj1MEXIWY/IFw47k6qxUc9xd5jZCfEsrFY5vyfx1uieKiFSmnRFfY5HxgRgozQa
	nRcyD57DIgh277I/q6Nx0LFUqiwYvLcdULevVN5iUVXe3YoEgyQ0Hr6ioajaF67bWnqnHgG5xZU
	pdy699O96Hla9qgyDAgatGZXmO6ooHIo1EyKkR/NglYkf16iRBuYLxJf+RfXPk+/g7VxT6BwVpX
	nf7RQrWNkdKVtj0i8xSnlAzIXA==
X-Google-Smtp-Source: AGHT+IEvG4Z5BDTpsXarI8urYSbz0Fl43OcTx4ljWTzmBa3AfdjhQoWcQWwcIqnRa4+KmNQLabuz9wzK0SNkgegXMCw=
X-Received: by 2002:a05:6512:3ba0:b0:595:9152:b921 with SMTP id
 2adb3069b0e04-596b4e5295amr1036056e87.7.1764067279453; Tue, 25 Nov 2025
 02:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20251125064851.3781993-1-wenst@chromium.org> <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
In-Reply-To: <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Nov 2025 18:41:07 +0800
X-Gm-Features: AWmQ_bmfVl5k0ztWOG2j8X7oHX9X2PsUhMj61BqVp-yFp5zCJvMWxcyYcL4rKWg
Message-ID: <CAGXv+5FPaJMuN7wCP7g0Rxa0mXD3Ru0rxka=m8B_rv+XUkJPWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_024121_976947_935C79CA 
X-CRM114-Status: GOOD (  35.54  )
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

On Tue, Nov 25, 2025 at 6:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 25, 2025 at 02:48:49PM +0800, Chen-Yu Tsai wrote:
> > Convert the existing text binding to YAML.
> >
> > The description has been change to reflect the possibility of coreboot
> > inserting the node itself.
> >
> > The example has been modified to compile and pass validation without
> > any errors. A comment was added to note what the firmware actually
> > emits.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../devicetree/bindings/firmware/coreboot.txt | 33 ----------
> >  .../bindings/firmware/coreboot.yaml           | 60 +++++++++++++++++++
> >  2 files changed, 60 insertions(+), 33 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/firmware/coreboot=
.txt
> >  create mode 100644 Documentation/devicetree/bindings/firmware/coreboot=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/=
Documentation/devicetree/bindings/firmware/coreboot.txt
> > deleted file mode 100644
> > index 4c955703cea8..000000000000
> > --- a/Documentation/devicetree/bindings/firmware/coreboot.txt
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -COREBOOT firmware information
> > -
> > -The device tree node to communicate the location of coreboot's memory-=
resident
> > -bookkeeping structures to the kernel. Since coreboot itself cannot boo=
t a
> > -device-tree-based kernel (yet), this node needs to be inserted by a
> > -second-stage bootloader (a coreboot "payload").
> > -
> > -Required properties:
> > - - compatible: Should be "coreboot"
> > - - reg: Address and length of the following two memory regions, in ord=
er:
> > -     1.) The coreboot table. This is a list of variable-sized descript=
ors
> > -     that contain various compile- and run-time generated firmware
> > -     parameters. It is identified by the magic string "LBIO" in its fi=
rst
> > -     four bytes.
> > -     See coreboot's src/commonlib/include/commonlib/coreboot_tables.h =
for
> > -     details.
> > -     2.) The CBMEM area. This is a downward-growing memory region used=
 by
> > -     coreboot to dynamically allocate data structures that remain resi=
dent.
> > -     It may or may not include the coreboot table as one of its member=
s. It
> > -     is identified by a root node descriptor with the magic number
> > -     0xc0389481 that resides in the topmost 8 bytes of the area.
> > -     See coreboot's src/include/imd.h for details.
> > -
> > -Example:
> > -     firmware {
> > -             ranges;
> > -
> > -             coreboot {
> > -                     compatible =3D "coreboot";
> > -                     reg =3D <0xfdfea000 0x264>,
> > -                           <0xfdfea000 0x16000>;
> > -             }
> > -     };
> > diff --git a/Documentation/devicetree/bindings/firmware/coreboot.yaml b=
/Documentation/devicetree/bindings/firmware/coreboot.yaml
> > new file mode 100644
> > index 000000000000..568afd1abb92
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/coreboot.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/firmware/coreboot.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: COREBOOT firmware information
>
> Coreboot

OK. Side note, coreboot is stylized in all lowercase letters.
Should I follow that or just use standard English rules?

> > +
> > +maintainers:
> > +  - Julius Werner <jwerner@chromium.org>
> > +
> > +description:
> > +  The device tree node to communicate the location of coreboot's
> > +  memory-resident bookkeeping structures to the kernel. Coreboot's
> > +  FIT image payload can insert the node into the device tree. If a
> > +  second-stage bootloader (a coreboot "payload") is used, then it
> > +  is responsible for inserting the node.
> > +
> > +properties:
> > +  compatible:
> > +    const: coreboot
>
> Blank line (it is always here, there is no example without, which makes
> me wonder which file you took as starting point)

I actually converted the existing text file directly, copying
boilerplate, i.e. the top few lines, from another file.

> > +  reg:
> > +    description: Address and length of the following two memory region=
s
>
> Drop description, redundant.

Ack.

> > +    items:
> > +      - description:
> > +          The coreboot table. This is a list of variable-sized descrip=
tors
> > +          that contain various compile- and run-time generated firmwar=
e
> > +          parameters. It is identified by the magic string "LBIO" in i=
ts first
> > +          four bytes.
> > +
> > +          See coreboot's src/commonlib/include/commonlib/coreboot_tabl=
es.h for
> > +          details.
> > +      - description:
> > +          The CBMEM area. This is a downward-growing memory region use=
d by
> > +          coreboot to dynamically allocate data structures that remain=
 resident.
> > +          It may or may not include the coreboot table as one of its m=
embers. It
> > +          is identified by a root node descriptor with the magic numbe=
r
> > +          0xc0389481 that resides in the topmost 8 bytes of the area.
> > +
> > +          See coreboot's src/include/imd.h for details.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    firmware {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +        ranges;
> > +
> > +        /* Firmware actually emits "coreboot" node without unit name *=
/
> > +        coreboot@fdfea000 {
> > +            compatible =3D "coreboot";
> > +            reg =3D <0xfdfea000 0x264>, <0xfdfea000 0x16000>;
>
> That's the same address in both places, so the same one entry. You need
> two distinctive addresses or binding needs changes to have only one item
> as well.

The description does mention that the latter block can include the
former. It's really up to the firmware. If you like I can include
two examples to cover both cases.


ChenYu

