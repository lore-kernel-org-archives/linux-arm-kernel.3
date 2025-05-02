Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EBDC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUHgqJ+LWoH5VY4W/85GH/C6KSeka4dwhIk1e2DuRQc=; b=FhutMAtsgdRB5CXyFM53wq8EOc
	KJSRBXm48c6KnZV/nEqbLOX6WCtZ5d3LBO3jCyKndZTKL3rJlrCUcDI3uO2pxn6Lkwijen9HzfO3N
	BnOFh7AL1ak5XqEEB9BQ8UvDE5dPWSYlf1y6LX7qaGhSlN4Rev6JQZnKZZD9UoHGN8wOnaWAiu8gm
	CvWDQ82yAV+T+3LuSqQtyRfNj+ySx4c4eFLTeHPsfM5gERsKPBzqdIRnPoGfRe8IRYg8c9qUxZo5S
	V+2E+1jeTOmrl9AI+4Jj1aMDDcDK3MNVLdM1zRsvez2yZMIhSmMfZwPMIvUUCOw32H+PVBhdEpgFi
	gWbq4CqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApCM-00000001rFD-11oy;
	Fri, 02 May 2025 12:08:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAp8Y-00000001qd0-0hcP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 12:05:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1211057f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746187500; x=1746792300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUHgqJ+LWoH5VY4W/85GH/C6KSeka4dwhIk1e2DuRQc=;
        b=dV4531oNTrBYmqsL0QQGEUl4Ri9lTzUuexMiL/mp1BSUNxnu7uZV/tOaqMhooPt1+m
         4v4or1EhPVgFn67oxnkdsU7YZ0A4epvVCojls7rzwpk60qVHALDZsz0PLsXBDZ2Ho3hB
         0Iw18JWuiH33YUaVPE2upovzrIXx5wLZBwj0XXklheXRNPq5JL0ZcRppvDa3JI/mPBKI
         M3QgzdQrgJ9QjGWfKQCVOS3mH/fOrEik2Eht0NoADGqAm5qbrV+y6kyQi8dfnZyQ8XQp
         lr87BEmcomJ+kZmLbsbK07tO2as0ZPcZUzlFyf07nJHPYeipJmytBDcKIB5yyi4IBO60
         3oUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187500; x=1746792300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUHgqJ+LWoH5VY4W/85GH/C6KSeka4dwhIk1e2DuRQc=;
        b=KPHYdR5g5Cy4yRCyize0NY2tNj3d61QekPNwEuWg85RXYR/QgtLpqbEgqUdPzHLo+t
         J2yWJRLFDf81TyKN6skd4vug/24O+Eqok7niS8vEf+VFkPB0ILWSzSPktXSLOf4LOXDR
         FKEp88iBCi/5TcKGIChkpxq7f+fA1yjmbV0ixGyKFXPwfZS+ipJk2+CS1L/9lTcseQfw
         I2kGKW6CaXBuKgy4xSl6AK+GlJhTTaXW5Eb7nsS0hu//ySRo7YuxfbA7eNug/6fVEXjL
         o+B9F/CCl2GB+o+Evoy0DorsOYDg4TaEjXzQZVZMKCfOdoWvX0XJVmq9+S9fISwID9xI
         +7PA==
X-Forwarded-Encrypted: i=1; AJvYcCU+rLH5Y8EixHZ1FJvcBCvvm6BK+hGIgnQ9+bvBi0Iit9nD+g3nSuBMa9vzYOp66oQICmEZS5dCLOchmrMj3lK5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/jAFshbClg6X42OAGDD47NY5gA4zNALLKin0nwcgbbwPdd3V1
	VWLWhBz5ZP5mrNyxp1GOoxhaqyahJbadpB8L9fCHl4cyZHZrN87PxDj5o4e04wBFgvzlIL5gLWX
	uWHM9kK2sqADyTsK6Akr2X6T4QaM=
X-Gm-Gg: ASbGncs0Rcy0GG4ocEMi3XLw4l6achY8mWdD0PL9HJxTN9qybwhTqpyuj2IP9L1fzsW
	gJ52ycmEkbX0UeHZd/ahaKzAqUv7YjMZkey+fqD+mYqQ+4NXr/EJZlzeP6Ra1wD6DL+udkUCNZ3
	zQPEJyXit2JUubj6jwgCbgrUg=
X-Google-Smtp-Source: AGHT+IE2auQ0A0KtW0kC0aKhecu39LBRzglwU/tszC76jWTDR1QoRecH0YXD3lt5QVn7PkCmCVH0kYqvGLkyQT+mm2U=
X-Received: by 2002:a05:6000:40db:b0:39f:efb:c2f6 with SMTP id
 ffacd0b85a97d-3a099adcb13mr1822546f8f.33.1746187500433; Fri, 02 May 2025
 05:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 13:04:34 +0100
X-Gm-Features: ATxdqUH_j2VzsE9tT_fM4FFgrG85qJiCrbTtjzlXZqZhUf9hahZQD7LXclNR2aQ
Message-ID: <CA+V-a8s-+x1-OAJCbizOdW1ygtTYON6AybPg=e-x7M-AL+4F0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_050502_211908_3BE4AB9E 
X-CRM114-Status: GOOD (  20.05  )
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

Hi Geert,

Thank you for the review.

On Fri, May 2, 2025 at 12:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the Renesas OS Timer (OSTM) found on the Renesas
> > RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> > other RZ families, so no driver changes are required as `renesas,ostm`
> > will be used as fallback compatible.
> >
> > Also include RZ/V2N in the list of compatibles for which the `resets`
> > property is required.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> > +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> > @@ -26,6 +26,7 @@ properties:
> >            - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
> >            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
> >            - renesas,r9a07g054-ostm # RZ/V2L
> > +          - renesas,r9a09g056-ostm # RZ/V2N
> >            - renesas,r9a09g057-ostm # RZ/V2H(P)
> >        - const: renesas,ostm        # Generic
> >
> > @@ -59,6 +60,7 @@ if:
> >            - renesas,r9a07g043-ostm
> >            - renesas,r9a07g044-ostm
> >            - renesas,r9a07g054-ostm
> > +          - renesas,r9a09g056-ostm
> >            - renesas,r9a09g057-ostm
>
> Looks like we have reached critical mass to invert the logic?
>
Agreed.

>     not:
>       contains:
>         - renesas,r7s72100-ostm
>         - renesas,r7s9210-ostm
>
> ?
>
OK, I will update it as above and send a v2.

Cheers,
Prabhakar

