Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CB2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTo+P4IDj/egBTC39do6b+maTrxFfajRm+lC64dJAgc=; b=X5MAURxWpL81vGsZfq8B7JmcJp
	wthAd4ru/cNjpN3pkR9MQh7At13BJ+Y3jUfPy7mOZABiB77IiZD3ZX/D37MfgBvrAGUTodIZ6WK7H
	eoz48EsvJ+/7j/A/FxiCpH+0XmLZjnJBmrlIcmeEjtW/MCeWGimNLLiUfy2QcT7ltFZuSRBlNb88y
	rTgGaei+PmGvI/LUX719YZrSEnJTFyZnXgFgYM5iSW7d6TPj+sQfsCmA2jBsf9E4AycL0t1jL9Np7
	n6H0dRGyziCJysC9Dg+0coD5uK3PdxZuilf3c8P2vG4UaOV7V/XREDneAoxdxioNGE7Na2K8mEy6+
	0ik0wG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYxN-00000006N0b-2mFK;
	Tue, 18 Mar 2025 15:34:17 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYur-00000006MMC-0X8S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 15:31:42 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ff80290debso5236328a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311900; x=1742916700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTo+P4IDj/egBTC39do6b+maTrxFfajRm+lC64dJAgc=;
        b=kckY6pSjenCCpVYUV5wbsItIRmnJDu0bsNK9XKqb6WVP3eoktrc6D4i5+gvJCjN8BG
         0K2/JWlVapIw+cio5oZHyGE4YQ9N7kIyKc9SEdjX6gN4Uu5hlmi7p+bsQLNwgDmvy3M3
         cuIZJ0mYDFYwNAxYxWlCyPksqSA0/4em95jlAFrlP4Sjul4Q5kvsAomCKojnwRYtRa5e
         i6E8PWEW06tuo6pqOQu8hTOf6hiDVT9vnIQq1/JaWMl2oRBUireHkvrtPZK1oigyzRPY
         1G0H0yQ/+3aM2/dl8ml3KCwqfNIEMx0JyKS5seP27UGEl5wVIXlLVR3RBzKFt7wfKPWi
         0mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311900; x=1742916700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTo+P4IDj/egBTC39do6b+maTrxFfajRm+lC64dJAgc=;
        b=wwwJumvCw3uS9F4kSrlT6s7Vc5SZX2cKgthnVWKeVPic2O1T3pQhjK7trUCaC2cNpq
         oH39bCTK98OLx5RNKCXVgzFZeiCGUxgFhKC5muvHi1PZrb6xsX9+bgjMotNbSxp+EuMs
         iKo2liHsgsAfT9wMbueW9uUACd2I1bbY21Oh1rhjoBMPA1kkD3LVhoOl7piYHrBWNjMR
         A6huG38sCbPwS3NgvR4VHRGUAIPGgDA5vfbcxyif1JBz0OODTOI8VMux6sxqLQhkUWT6
         EB3zxUmezCripigNgvhmh0QHZqoQ3ZYeZVVgzvZ21t4mg8BBbPfkh25UxFj9W+9uJnyA
         RERA==
X-Forwarded-Encrypted: i=1; AJvYcCVxIZXcPp1i6Z8hxyIXe0SZ0lquDzPFGhS3hZbjpRyrxA1LFR//aIb/HathDg/yVXPJfj+wauUj6STtKMtpArKR@lists.infradead.org
X-Gm-Message-State: AOJu0YyCt6aerxzH4GDn4wcr+GsFaaeoszGvIL9ID5RwsSUiH9zVAt0b
	syGmXg17aVeZfDOKtJXbDhHsgpuJpkZ//gVREeN5Iy2lR1ITI3j6IeML9OD0cVYc8J+0lDjLyxe
	HTYeaNa/4rFWXciWyRLHlNwj0RFE=
X-Gm-Gg: ASbGncsl3AIRPjSREDcCvnNogBdI9xbFY+88cnTwRHz/i0+ipW7j0JHDJE8KLt/4c44
	hyjWDfv7qlMqWnh+m/DS9enIgSckDOhBIgOgrMbZWD3QkhaoDY9UaLhtU1hJ4HYwV43+uNkNWul
	cH9iyU3SyygJfSJ6xLI8GjnVc=
X-Google-Smtp-Source: AGHT+IGev3FhJjE3AIdupTysEnxLQqIhHB0aNv4HFA4FSPqyJjajPwHMn95jdK7N+OLjNP3hIRsGSfPOM63dkEDBTf0=
X-Received: by 2002:a17:90b:3d86:b0:2ff:5ed8:83d1 with SMTP id
 98e67ed59e1d1-301a5b22c44mr3891136a91.19.1742311899758; Tue, 18 Mar 2025
 08:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
 <20250318085444.3459380-2-florin.leotescu@oss.nxp.com> <7afcd224-1154-4e2f-b383-10f6a89fdae0@roeck-us.net>
In-Reply-To: <7afcd224-1154-4e2f-b383-10f6a89fdae0@roeck-us.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 17:33:12 +0200
X-Gm-Features: AQ5f1JrGT6OkXhZLmAGbs6dhzXtsxvJYdhcQucC_VGy8G_11v7e7DfbTPZDv1rM
Message-ID: <CAEnQRZBmYdLh29ha1FKz8=CbxjFBFFTgDkjrEmwTxW2WcxodfA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, festevam@gmail.com, 
	Florin Leotescu <florin.leotescu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_083141_168733_FA5A5871 
X-CRM114-Status: GOOD (  22.36  )
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

On Tue, Mar 18, 2025 at 5:22=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 3/18/25 01:54, florin.leotescu@oss.nxp.com wrote:
> > From: Florin Leotescu <florin.leotescu@nxp.com>
> >
> > Introduce yaml schema for Microchip emc2305 pwm fan controller.
> >
> > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   .../bindings/hwmon/microchip,emc2305.yaml     | 113 +++++++++++++++++=
+
> >   1 file changed, 113 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,=
emc2305.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.=
yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > new file mode 100644
> > index 000000000000..e61ef97e63af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip EMC2305 SMBus compliant PWM fan controller
> > +
> > +maintainers:
> > +  - Michael Shych <michaelsh@nvidia.com>
> > +
> > +description:
> > +  Microchip EMC2301/2/3/5 pwm controller which supports
> > +  up to five programmable fan control circuits.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - microchip,emc2305
> > +      - items:
> > +          - enum:
> > +              - microchip,emc2303
> > +              - microchip,emc2302
> > +              - microchip,emc2301
> > +          - const: microchip,emc2305
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  '#pwm-cells':
> > +    const: 3
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: The PWM frequency
> > +      - cell 1: The PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +      - cell 2: The PWM output config:
> > +           - 0 (Open-Drain)
> > +           - 1 (Push-Pull)
> > +
> > +
> > +patternProperties:
> > +  '^fan@[0-4]$':
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      reg:
> > +        description:
> > +          The fan number used to determine the associated PWM channel.
> > +
> > +    required:
> > +      - reg
> > +      - pwms
>
> Is it necessary to make 'pwms' mandatory ? The current code works
> just fine with defaults.

The code adding OF support is added just in the next patch, so the
current code isn't event
probed when trying to use dts.

Or am I missing something?

+static const struct of_device_id of_emc2305_match_table[] =3D {
+       { .compatible =3D "microchip,emc2305", },
+       {},
+};
+MODULE_DEVICE_TABLE(of, of_emc2305_match_table);

I have no strong opinion on this we could make pwms optional.

