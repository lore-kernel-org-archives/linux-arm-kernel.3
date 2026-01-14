Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49226D29FF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfhgRc6vTwsEnX3dOX00U1qmC/HK8O2dZPFjKNu4aWk=; b=oQL2PmeuDjgsiInHXGpEz+YKIu
	GtTzln74cPENrA6JAE4xzspuicymJ3DBMRkDSGDjy+uHUdpxOphwMuvE1LXoMC1AXwSspzKk7H+Gb
	dUGQwr1IxhTZggpJsTJGhBhWhacNVYliBJU/DSNKZ88fbxBqa/W7CU1+TOk9OM5J/o0h2LwM7dTND
	MelobOy14DS4bJwCTuqXOzUyEyW1QW3eqZdsdwV2dmnKmybg/WwFIXK3knHnASLI0D/qst1DcrHCl
	8aCzfc8QOp2SUuL8RUvub/ilEL8eb5bpO7kD/96+gLg/NG6QTtUvzsTnmRIzeGX2U7gzvgsLlKynY
	v7UsxVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfz0Y-00000008x1X-1MV8;
	Wed, 14 Jan 2026 11:25:50 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfz0V-00000008wzO-1doo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:25:49 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so2091589eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 03:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768389946; x=1768994746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfhgRc6vTwsEnX3dOX00U1qmC/HK8O2dZPFjKNu4aWk=;
        b=IKYeQGRFla2H26mp0wN1RV8IOXLHRnqDmn/hiqiRI+GLAMtyqrPhvXi5q2Tv+2ZErR
         728IE8kFg95fn7B2YqlQH4MkPv6VzovM3an26KbOMPZXiJU7tWH/DguavjkWSN1bQ/oF
         UWZYgISTsDXp6uBdfMV7X2Xxx304g/+LwA1e05hu5IW6RYj+b2CC4f/b1U0LjvE6bGEg
         hEBlAvm08NePSEulgCt+ghcUeYVp6xde+u1hz8U5WaE2pxXiLEVew2FXLn7Oj43oAee/
         VBtRFM3TKVq4vBeS2CL3sP9yao+70W6WpfWSeTQ8FWQpZjRuChXtHT+7gaHrZ9cvZcyN
         dFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768389946; x=1768994746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wfhgRc6vTwsEnX3dOX00U1qmC/HK8O2dZPFjKNu4aWk=;
        b=tghjReczA7qUmiWeo/8l7Xp4iWgU2r8j0te3qK/8SfTi2C8TfN5xqJE8lvLhxpnWAy
         qmh7RB8TbP4wslEiJPXx9ZuYyV4LlZ09XmfzWo23gJ8+kvV0sAkF0PuDxgb9vCIXEDCl
         oHt1qzc3pFt3X4iKDXWI3hITKzlXYOfrQs1a1Yn+DDkeaGOz7p3cUzloeDAeXL//Mnz9
         JtVajO6pNzrwwZbCFYNkbuBcrGBex1tHVPwtQtc6Lhgxuy7Qp1t1TW1x2MlQs0Z59pND
         fj0zInuLmONkh/tpARYbCO6BtzeiIDS30CJ9kVdkfc4Bm17dTLpl+J+FpVjmNQ/B6aqe
         nVMA==
X-Forwarded-Encrypted: i=1; AJvYcCVGQdUkJM1C2RTTqjhJtnXjPSTPvN/BlhG04u13T47AnXwkLT2oY4CdDehsHvh/DxTvp4+Eq0pZIST4KxUAK0FJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyD+fCz0F9CXWvRtMxm+vn6r6LGTVWGlR7RFH4Yoz7xTi3LLE3N
	GLkztYOs8gLxAxtGkLXtf8vNX8Jp385rsK0aCD5uot9rWDW9UDvXuMOvEQ/EYAGWWV24lODpgBm
	8EGJpo0oVH5PYs8ugLjLsurjX4z1YRW0=
X-Gm-Gg: AY/fxX6yqef7wZq5m1ZrYk1gAXjZdO3VUO4GyU3UMycQEt/8ITqsoiMRdsc1sqC47jx
	zql8B2J+Dk8NB1FO+kjWvXrHWVS4Udr5/BM7MKAMwVDAFadQ11XoALyaFDDQ8n9Wu3SV2D0jI6E
	HMRf30kH/aLb7r4IecmJ2hVgvAjZUTVOZ8z/uFVhfLOOgFOvzJ/rjSfEBlX1v11tj0rUTmis+aP
	hSh8Wu0u1CenT2IKbJfVvJ+s+0IRulNVRelaUDhGSLR/eqxy6H9z8ZE0sSE1mtPfrMl
X-Received: by 2002:a05:7301:10cb:b0:2af:fbb:97cf with SMTP id
 5a478bee46e88-2b4873448e8mr3277294eec.43.1768389946359; Wed, 14 Jan 2026
 03:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20260114062549.68954-1-nick@khadas.com> <20260114062549.68954-2-nick@khadas.com>
 <20260114-slick-passionate-mink-216a3a@quoll> <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
 <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
In-Reply-To: <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
From: Nick Xie <xieqinick@gmail.com>
Date: Wed, 14 Jan 2026 19:25:34 +0800
X-Gm-Features: AZwV_Qg70Hy7I-zqtjJH4CnT0wrSCnqXmLnlIp4duk0mQjb7lfd2ZqN3oox8UgU
Message-ID: <CAP4nuTX556F6a+aMndYayu-29u-SsYi0g0ie8ONz8b5GStgv-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, xianwei.zhao@amlogic.com, 
	christianshewitt@gmail.com, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, nick@khadas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_032547_476565_B82A8050 
X-CRM114-Status: GOOD (  20.91  )
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

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=B8=89 18:33=E5=86=99=E9=81=93=EF=BC=9A
>
> On 14/01/2026 11:07, Nick Xie wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B41=E6=9C=881=
4=E6=97=A5=E5=91=A8=E4=B8=89 16:51=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On Wed, Jan 14, 2026 at 02:25:48PM +0800, Nick Xie wrote:
> >>> Add devicetree binding for Khadas VIM1S board based on
> >>> Amlogic S4 S905Y4 SoC.
> >>>
> >>> Signed-off-by: Nick Xie <nick@khadas.com>
> >>
> >> You still have the same From/SoB mismatch.
> >
> > OK,  I will fix it in next version.
> >
> >>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Doc=
umentation/devicetree/bindings/arm/amlogic.yaml
> >>> index 08d9963fe9259..55663e0f7f915 100644
> >>> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> >>> @@ -247,6 +247,12 @@ properties:
> >>>                - amlogic,aq222
> >>>            - const: amlogic,s4
>
> Look here
>
> >>>
> >>> +      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
> >>> +        items:
> >>> +          - enum:
> >>
> >> Yopu already have exactly such enum with such description, so your
> >> compatible goes there. Look - it is called "Boards" - plural.
> >
> > The exist board aq222 is based on SoC S905X2, but the new board vim1s
> > is baed on S905Y4,
> > they are different SoC, so we need to put S905Y4 under S805X2 ?
>
> What is the point of having two separate lists with enums ending the
> same SoC compatible?

Actually S805X2 and S905Y4 are different SoC. So maybe like this ?

S805X2:
- description: Boards with the Amlogic Meson S4 S805X2 SoC
  items:
    - enum:
        - amlogic,aq222
    - const: amlogic,s805x2
    - const: amlogic,s4

S905Y4:
- description: Boards with the Amlogic Meson S4 S905Y4 SoC
  items:
    - enum:
        - khadas,vim1s
    - const: amlogic,s905y4
    - const: amlogic,s4

Same as Amlogic A311D & S922X

S922X:
- const: amlogic,s922x
- const: amlogic,g12b

A311D:
- const: amlogic,a311d
- const: amlogic,g12b

>
> >
> >>
> >>> +              - khadas,vim1s
> >>> +          - const: amlogic,s4
>
> And here.
>
> >>
> >> Best regards,
> >> Krzysztof
> >>
>
>
> Best regards,
> Krzysztof

