Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2A7C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLavl1OFNqOjRx3CGhPlhwLyCUU3nUM8v4tmbP82xPE=; b=xr3f24m08Mtf191UA29iF6qlpj
	eoMy0ERCQVbxsIQfE+rOSaO+O4oeKzvAuKmqxQYDemNiQJNh11thhZyYYhlafUML9oQ/BTSavdPw3
	wwio9EZXh/m+M1VnGxicZuyKJECBcZ0MUbsyQgit54Ih87gb7jYua2bdV4K6nO3XnR59HDGWWGEYm
	ruIC8KbHttjXWgRZAx00mzR8mArs+rXKjmSbbGWDpW9ZyjSAgM573X4Fw4Bw4Kwe9n66xyZjbIt6X
	0Gj8ChVTlj09PcQ6h+l0r+wIa9LczctXPYEsG9nDJjIchAlj324n2AEPoBCtkf4axHP9sv8FACZAs
	o67Pkfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOi78-000000050xi-1iUA;
	Mon, 09 Jun 2025 19:24:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgh7-00000004quH-3r7A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:54:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so4866978b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 10:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749491641; x=1750096441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLavl1OFNqOjRx3CGhPlhwLyCUU3nUM8v4tmbP82xPE=;
        b=jDp6dZJKlkyiuiY3mv+ceyUOFx7lF2VLUMF4J79eYI9H2aSdBarCaSQ0/BVaVtjDVq
         gvcsmPa4maEg+kGCnl1VII3WZ1ziyQtESrJiFdIKDybiIU0KXDTU+yHc1JMKfLLpnjn7
         x9MHbwRXyJyDd6bHU5Kfcyy3CA3+mwUC4mr5QZHSPbXi4G7UFeqRxD+BbBylmI6cU+9f
         iCLeA9V5Fbq6zvKIJXc6QJ64x5HzzR8/3Taa3whc8RZvhJHHs5wo91f1/LQCOkRl1rVy
         kmv/u/D1s0y0iKigvse3TNOusVjpU8BcjgIdiVSPccMHlybapoVx/GMt5gzn3O3i0x6k
         YwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749491641; x=1750096441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLavl1OFNqOjRx3CGhPlhwLyCUU3nUM8v4tmbP82xPE=;
        b=lP8GhqrvR66Dc/46QYfFzxZHsokPr6kV4Ks8Gagbik/tWADc5zf8+HhEJq6XsoxoeU
         TMa7jtMhwR9vIi3CBGnT4Ou0W8JPDHCNyIlSkuyJURLFI7gmZSgF7uQ4kL7XBS3WR1aI
         yifCOEwhAUoQwNYY09KWkjogtTQPpTRr1LFy+aAs+jwsjItNwpyFa5W0BjK6jo3rXxuJ
         hq7DI0/Kh1AFtucb9VEXwlhyU5e61XwPcn8MrB6Zy8ecQ+Kb81/dlPAOajGnHk96BSlI
         cECz+PmLfHPXgSvPSCvcp4l/DkEfR6UIvi8v/04dqo9LTQFyYgjRDQe2LQB1Zv/N0R4S
         FEEA==
X-Forwarded-Encrypted: i=1; AJvYcCUUikIis263tcgKEotTqydINIHv6HU+Mybur4viCXevO9N6LtAFljhPs4UN2KW7RB8wHzm7e6kIf/ehWIqCxxlH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3aKCyDsGFY691piCD6fHM09WpISOd/vMRwNZf4emvohfIjeZs
	Cfs6p3KXgpTT8lIKDp3H6jQ+ZEO4/weFPJu2TjpRbjtkKSSsYH7dB4FFXWImDSGf3M7jCzB7qym
	aqwpxTHJq5PO3qpNMsSnHfAoK2uDYXKI=
X-Gm-Gg: ASbGncvOCrPXfAzbTvk84HZgml6PtHZz1RK1pMUkkqkrk0Bfk6NvRVlWfnCU5urQo2a
	vdzFv/XbRbhinOBGGOat3DexEc+H3j+jchzHFZqJNR6SUws2nh7y4eVSkeYq7PbyezKeqdo/7cy
	K54u2SUqEu5LoubtQzf00dY2lmkHMyfohm
X-Google-Smtp-Source: AGHT+IEg36qltC0WMS5rKcmC0QOu1qYNMycbO+ypdNoe6gLAt9s6BqjElaf2ITKT7TIBRdwePFzwfXD7EdQ4aFq7nQQ=
X-Received: by 2002:a05:6a00:c88:b0:73d:fdd9:a55 with SMTP id
 d2e1a72fcca58-7485ea7097emr499919b3a.8.1749491640678; Mon, 09 Jun 2025
 10:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com> <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
In-Reply-To: <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 9 Jun 2025 12:53:48 -0500
X-Gm-Features: AX0GCFvBSlGjJP6_gYPY5G8LHDwywJVn2yc0aoIQdRQOd7fdU_ZaLDtXpMwt8Ck
Message-ID: <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
To: Frank Li <Frank.li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_105401_955373_24562EA9 
X-CRM114-Status: GOOD (  24.47  )
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

On Mon, Jun 9, 2025 at 10:32=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > The CSI-2 receiver can be instantiated with up to four output channels.
> > This is an integration-specific property, specify the number of
> > instantiated channels through a new fsl,num-channels property. The
> > property is optional, and defaults to 1 as only one channel is currentl=
y
> > supported by drivers.
> >
> > The only known SoC to have more than one channel is the i.MX8MP. As the
> > binding examples do not cover that SoC, don't update them.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.=
yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > index db4889bf881e..41ad5b84eaeb 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > @@ -68,6 +68,13 @@ properties:
> >      default: 166000000
> >      deprecated: true
> >
> > +  fsl,num-channels:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Number of output channels
> > +    minimum: 1
> > +    maximum: 4
> > +    default: 1
> > +
>
> Look like it is fixed value for each compabiable string, So it is not
> suitable for adding new property. It should be in driver data of each
> compatible strings.
>
> I met similar case before. DT team generally don't agree on add such
> property, unless there are two instances in the same chip, which have
> difference channel number.

If the DT changes are rejected, can the number of channels be added to
the data structure inside mipi_csis_of_match?  We have compatibles for
8mm and imx7.  If we add an imx8mp compatible we could add a reference
to the number of channels.

adam
>
> Frank
>
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
>

