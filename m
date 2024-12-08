Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FA2E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVkFTMeEWzKzl3eTyT6uuEMADLGUM2vIlykoDjxe32M=; b=3tYTx2tCFxF8nU2zpDs6d7SYZa
	z+Bkc7k3aGfO7AlZRBm4hpYE5hYwfmS9Hd+K9wnzkTWpyA74X1cqT9Kv0Q6wsK8D1b87Fg8AJ+iYN
	S7mVHBKm84GTAqHmcb5aHseLLtMbKJPmgZJcvytmBPpeJ9M3ZHGY69lsjLL0M1WCl8nFoj/Or7WIw
	mv55OV5iWl7iNWFxjGQKjc2OzjZ3rsOAch09lk+hjJTjcBNZkXwMGqFoYdAx367I+f/kb59V5fZdT
	t6hx7H4fBrHStmG+JGZRzt6S4SADVDdQERCtSho7qV4/Z5dFHSJGKs+keHehOEGDldy257TUWJj04
	2UT6GuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKSY-00000005aOk-10cI;
	Sun, 08 Dec 2024 16:48:42 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKRX-00000005aKF-0H6q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:47:40 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e3a26de697fso731798276.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733676457; x=1734281257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVkFTMeEWzKzl3eTyT6uuEMADLGUM2vIlykoDjxe32M=;
        b=DabLGFg3Ih6NfuID9zG+1C9i3iQGEFHR1Aa07OIzBilhJNneiyle5D/uDG6MXQBsw5
         aihgP6VBPfG19V5nOctkv8QSjL12/w5UOa/ucjY9PBokDhRBSjABDnhxZ80BNJPLTTHM
         7haQi6yaxWl7tcpO4ymsR5OEBIYJ+3D0MQVzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733676457; x=1734281257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVkFTMeEWzKzl3eTyT6uuEMADLGUM2vIlykoDjxe32M=;
        b=r2uavpCi0av+YEPz7/SConaUo7asdMdKJg225aP4764+l8QOy5zPeMClP1PIM9ch+l
         zioDRS1ctrT1NHTCRbdSbYyfSlqISphrGZc2CWCXsbRrRm+89NRpifd03/EoSWjEqAy8
         CnVzokQqalPzN5KjTYc9j02cPbnNdZL86yjGz9Q3zc1XE0h1c2I8GqnIM5t5zEvh1qaf
         UY7axPUWA1hYFJnUfhnSafE8Uc6Q247qSL0HnpQ8PFFRgfQrK2naMiC/Ydj2OYyV4yTQ
         8b498zOh94Uw8Y9B40a7PbbLCcVpAwgvfV9RcJCMNK0K8V1LDndlpzGrpgdmz6sGHkwC
         DKNA==
X-Forwarded-Encrypted: i=1; AJvYcCX0VzCZ7Go1f76NjY72Z6uYUARnHrEL+CAg2eNTf4UG8hDZfqZuQqUxh/YtaNwL5FO7hoJusBi9avfZtiUWPNxI@lists.infradead.org
X-Gm-Message-State: AOJu0YxueBtwMbf1hx//0SXt4wrlbXqQq74S48qSCGpgcDf+WbbEUO7p
	d5FkLyPZIU2ZBnAj8iyNNFxhGHlFoIh6uWUMa0lhMgyVbkpS6v7ZuuFDw2oBIY5poLompl9LvwT
	nUlri157/Zn2Y3EquOSmGG+MDpSAOa+bDUbGt5g==
X-Gm-Gg: ASbGncuQWsbwVgngmE2Nf2rwrosp4ezEZinbRkWFfBH1L7PWKTvkU7EPf30H5vu38xk
	I2lJ2g9csoRMza1kXrB4vEy4vwOBW
X-Google-Smtp-Source: AGHT+IHKC4Dc3IJ0AlV+3nSKSyKc3lmzh1gUjiXPcN3vPccSLKXkcjoWpKPkQOx2bu7H1wu2vu7YerTOebNWs3uV2XQ=
X-Received: by 2002:a05:6902:218b:b0:e38:9b5f:58a6 with SMTP id
 3f1490d57ef6-e3a0b4c89b2mr7285740276.46.1733676457470; Sun, 08 Dec 2024
 08:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
 <20241205111939.1796244-16-dario.binacchi@amarulasolutions.com> <gbymcmoya7dfmedq4nkopqpswh63d2ujxl2elc2x7x325b75bu@anp36sdya43v>
In-Reply-To: <gbymcmoya7dfmedq4nkopqpswh63d2ujxl2elc2x7x325b75bu@anp36sdya43v>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 8 Dec 2024 17:47:26 +0100
Message-ID: <CABGWkvoQzAhpVJ+QRfVZeps-Jn8REGF+21SPN=f24Tdf1d5DDQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/20] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_084739_189268_BD09C769 
X-CRM114-Status: GOOD (  31.47  )
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

On Fri, Dec 6, 2024 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Dec 05, 2024 at 12:17:50PM +0100, Dario Binacchi wrote:
> > The patch adds the DT bindings for enabling and tuning spread spectrum
> > clocking generation.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > (no changes since v4)
> >
> > Changes in v4:
> > - Drop "fsl,ssc-clocks" property. The other added properties now refer
> >   to the clock list.
> > - Updated minItems and maxItems of
> >   - clocks
> >   - clock-names
> >   - fsl,ssc-modfreq-hz
> >   - fsl,ssc-modrate-percent
> >   - fsl,ssc-modmethod
> > - Updated the dts examples
> >
> > Changes in v3:
> > - Added in v3
> > - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
> >   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
> >   indeed more or less a syscon, so it represents a memory area
> >   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.
> >
> > Changes in v2:
> > - Add "allOf:" and place it after "required:" block, like in the
> >   example schema.
> > - Move the properties definition to the top-level.
> > - Drop unit types as requested by the "make dt_binding_check" command.
> >
> >  .../bindings/clock/imx8m-clock.yaml           | 77 +++++++++++++++++--
> >  1 file changed, 71 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b=
/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > index c643d4a81478..83036f6d2274 100644
> > --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > @@ -29,12 +29,12 @@ properties:
> >      maxItems: 2
> >
> >    clocks:
> > -    minItems: 6
> > -    maxItems: 7
> > +    minItems: 7
> > +    maxItems: 10
>
> ABI break without mentioning, without any explanation in the commit msg.
>
> >
> >    clock-names:
> > -    minItems: 6
> > -    maxItems: 7
> > +    minItems: 7
> > +    maxItems: 10
> >
> >    '#clock-cells':
> >      const: 1
> > @@ -43,6 +43,34 @@ properties:
> >        ID in its "clocks" phandle cell. See include/dt-bindings/clock/i=
mx8m-clock.h
> >        for the full list of i.MX8M clock IDs.
> >
> > +  fsl,ssc-modfreq-hz:
> > +    description:
> > +      The values of modulation frequency (Hz unit) for each clock
> > +      supporting spread spectrum.
> > +    minItems: 7
> > +    maxItems: 10
>
> Why all cloks receive now spread spectrum? I had impression - and all
> your previous versions were doing this - that you have only three or
> four clocks with SSC.

Exactly. Indeed, the first six values are not valid as SSC properties but a=
re
only used to reach the point where the first PLL with SSC (i.e., audio_pll1=
)
can be indexed, which is in position 7 in the clocks list.
This was the rationale I followed.
And it is explicitly outlined in the example section.
The "" for the fsl,ssc-method property is precisely aimed at specifying a
"no SSC" method, which also fixes the warning:

fsl,ssc-method:0: '' is not one of ['down-spread', 'up-spread', 'center-spr=
ead']

raised by
make dt_binding_check DT_SCHEMA_FILES=3Dimx8m-clock.yaml

Or would it be acceptable to specify a list of SSC values that applies only=
 to
the last 4 PLLs in the clocks list?

I feel like I might be missing something.

Could you kindly suggest what to do or provide a DTS example to show me
what you expect?

Thanks and regards,
Dario

>
> Do existing clocks 1-6 support SSC?
>
> > +
> > +  fsl,ssc-modrate-percent:
> > +    description:
> > +      The percentage values of modulation rate for each clock
> > +      supporting spread spectrum.
> > +    minItems: 7
> > +    maxItems: 10
> > +
> > +  fsl,ssc-modmethod:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description:
> > +      The modulation techniques for each clock supporting spread
> > +      spectrum.
> > +    minItems: 7
> > +    maxItems: 10
> > +    items:
> > +      enum:
> > +        - ""
>
> Drop "", not sure why do you need it.
>
> > +        - down-spread
> > +        - up-spread
> > +        - center-spread
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -76,6 +104,10 @@ allOf:
> >              - const: clk_ext2
> >              - const: clk_ext3
> >              - const: clk_ext4
> > +        fsl,ssc-modfreq-hz: false
> > +        fsl,ssc-modrate-percent: false
> > +        fsl,ssc-modmethod: false
> > +
> >      else:
> >        properties:
> >          clocks:
> > @@ -86,6 +118,10 @@ allOf:
> >              - description: ext2 clock input
> >              - description: ext3 clock input
> >              - description: ext4 clock input
> > +            - description: audio1 PLL input
> > +            - description: audio2 PLL input
> > +            - description: dram PLL input
> > +            - description: video PLL input
>
> Also ABI break....
>
> Best regards,
> Krzysztof
>


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

