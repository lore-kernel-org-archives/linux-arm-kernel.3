Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2B1C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZST5O+ENabbKZFG4u9ZlHE3mu44ycA1WpCteAX/mCTI=; b=yxd7VUp77BQhwlO0m3URiNk6Pg
	YsSqdy0R4RV+H1HTgJDKjBax30J9X8jXKZsdV+ZQmtI2a2DREib+G5VMRFN78BL0XARGmgyWaaTmG
	9mXjMV4I+zPSWeU5ZMCubScgYj+lMu9SIEazjp4j1e7o1Au90LPBz7ULZ6wGSgyT03y2pyC/DfSrS
	KR9FxX7YnW1KMs5urrYbVjLjhtrqco/C18Ck/XVD5DOS6wH++yUvZVFLyF0TeqBoN+QsxtRRz8Dww
	6/Rez0UazcDkVrA+EPYTFKbrkAavp5IiuX1nceSORwcpwL4ncd0Bcf4Nbak5j5+82MzxhGY188JFZ
	3yGogAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ij2-0000000BuFF-3gRk;
	Thu, 17 Apr 2025 06:27:52 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IhC-0000000Btyp-1twH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:26:00 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c592764e24so50262785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744871157; x=1745475957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZST5O+ENabbKZFG4u9ZlHE3mu44ycA1WpCteAX/mCTI=;
        b=GNrO7rCjUKML+iv/ssXAuWFhMHWuZ5Wwrspy9yhf0D5KQewjgkhNsNS0l1ZvkdFIvC
         n+qFiQvnKRC7hhG2OLR1bgSheBAhIBiiyF/hR5brthVKOrRGpfW5NHX17aNbM6fsJWcV
         Bi07YJPECW/Izy+sRywHyeTOVJRrct0Wow8oazzeBy7/rhSVyAW4h7CjXlpusmsZWBYt
         skWR2XA9zO8UhVsLwF8Twb1ibNEWOYYDSKW2MQL8Rh/TPu+FcEvIhcsJQE5huUuJx6an
         HIPOsFNUyYyDNpHKI2KZ24HgETJXUmpSjZss8ZCVugYYgVRiW4Nzta879WR/C/iuVZtl
         NhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871157; x=1745475957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZST5O+ENabbKZFG4u9ZlHE3mu44ycA1WpCteAX/mCTI=;
        b=dubsoY6yCffpPFf17oxGePi3Ed+CviuRTU3H3MMdKOQhcZ4/m3kQ+od9DHwiVf7/Fi
         GzjrOdX0k4ho4PotUnYLiUMJiw4E4D5pZAdqjCPFQ5T5E2r5C8XOYzFAhqG0LSNennOo
         qCVMvoummOgzqB3fONs6Qgsddi9Ni5jc0dg3vv2HtER0hqUds5A3YgBqIp0dLaE6rc4y
         6m5D+cb/QROI15HIzF9ibIffhI4EkZHyKQSQFkuLFptmt/Yvmz7Jj7NXnWVnp6o7LIty
         HG5gaIX2xyztv0e5LkO48Uih1Y3Dt/9j74SvkXF4Alp3nK0koaSUS9kUfXHJnlEdZwR1
         V07g==
X-Forwarded-Encrypted: i=1; AJvYcCVo8pUyJFrYRd470UzLohf1F0EuSHGkFWL8NK5XmidWg0Pu+VSCxIsrtxij1frWaOLvCINSF/Lqhz46IS5Fhoeb@lists.infradead.org
X-Gm-Message-State: AOJu0YygUFhiauDe36lC6GA4V6Xhy2GY98xrnwbzPYlBFETsXyX3SQgi
	/Gd+PdOVE8nL0lH5ZpOtrXo7Xf+d8ET+NTqF9sMQ8npQ0Xyl8kdCzKEVC4/FJmbxBZXTGzh+j/W
	0Es1aYiFsXLy7+Pps+dS0JeygTOg=
X-Gm-Gg: ASbGncsTdOY5yF5RZfllT/KqOQg/DVzYDiBzpMK5uzcO96EHPS0iYGckJy1SgRbzl+2
	WwJSMbEKX7b7tePBwKqOrPO4fpMrauGWgBRwmVcgf5LNY9TJBp440aMLvkTc4Yn/kLLXPnmuloV
	PqcuLPW8va/KkhjIb7l+cqH0m8OOy8ti3lNt4JurtwpmS6HrliP9rSKOM=
X-Google-Smtp-Source: AGHT+IEUG2qKwwAEec639Bxod8wzMz7dx75qAc7U0rBWKEyq4yVPfHNSFLQqm7Sf3Cgg0Jwvm52KKhOAOvEG7cdfGyE=
X-Received: by 2002:a05:620a:172b:b0:7c5:3b8d:9f2f with SMTP id
 af79cd13be357-7c91e2440bbmr275101085a.17.1744871157183; Wed, 16 Apr 2025
 23:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com> <20250416201407.GC3811555-robh@kernel.org>
In-Reply-To: <20250416201407.GC3811555-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:25:51 +0400
X-Gm-Features: ATxdqUFKu43OJ9xK0QSQwijmtHN6PzWQ7tNDf-5s79MH0fFlMz0UJN-MS1W5jhg
Message-ID: <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_232558_492164_7D1CB1B4 
X-CRM114-Status: GOOD (  23.24  )
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

On Thu, Apr 17, 2025 at 12:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 16, 2025 at 12:21:28PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the WonderMedia SDMMC controller
> > as YAML schema, and switch the filename to follow the compatible
> > string.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
> >  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 62 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt b/D=
ocumentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> > deleted file mode 100644
> > index d7fb6abb3eb8c87e698ca4f30270c949878f3cbf..00000000000000000000000=
00000000000000000
> > --- a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -* Wondermedia WM8505/WM8650 SD/MMC Host Controller
> > -
> > -This file documents differences between the core properties described
> > -by mmc.txt and the properties used by the wmt-sdmmc driver.
> > -
> > -Required properties:
> > -- compatible: Should be "wm,wm8505-sdhc".
> > -- interrupts: Two interrupts are required - regular irq and dma irq.
> > -
> > -Optional properties:
> > -- sdon-inverted: SD_ON bit is inverted on the controller
> > -
> > -Examples:
> > -
> > -sdhc@d800a000 {
> > -     compatible =3D "wm,wm8505-sdhc";
> > -     reg =3D <0xd800a000 0x1000>;
> > -     interrupts =3D <20 21>;
> > -     clocks =3D <&sdhc>;
> > -     bus-width =3D <4>;
> > -     sdon-inverted;
> > -};
> > -
> > diff --git a/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml =
b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a7d962bc13c7ff70b504482=
01b0416efc7f787af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mmc/wm,wm8505-sdhc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: WonderMedia SOC SoC SDHCI Controller
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +allOf:
> > +  - $ref: mmc-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: wm,wm8505-sdhc
> > +      - items:
> > +          - const: wm,wm8650-sdhc
> > +          - const: wm,wm8505-sdhc
> > +      - items:
> > +          - const: wm,wm8750-sdhc
> > +          - const: wm,wm8505-sdhc
> > +      - items:
> > +          - const: wm,wm8850-sdhc
> > +          - const: wm,wm8505-sdhc
>
> Combine the last 3 entries into 1 using 'enum' for the 1st compatible.

Fair enough, will do.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: SDMMC controller interrupt
> > +      - description: SDMMC controller DMA interrupt
> > +
> > +  sdon-inverted:
> > +    type: boolean
> > +    description: SD_ON bit is inverted on the controller
>
> This implies I know what the non-inverted state is. If you know, please
> state that here.

This is a tricky one. The only answer I have is "it's inverted in
later versions vs. the first version I saw in the wild, and I'm not
sure if it's board related or IP version related - nor if the original
was active low or high". No docs, no schematics, no vendor left around
to chase for answers.

Will dig around some more and update the description if I succeed in
uncovering any further clues :)

Best regards,
Alexey

