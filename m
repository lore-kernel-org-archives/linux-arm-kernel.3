Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7C6C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYASVlhOcfaq1av7/fl04126jANP6cWR4NufJae7Xbg=; b=yHRizg1urxgaiI+iUJC3fBgTAB
	IvfldGdFckql/3E+o+FWrkKQL1wCGuK51dsVGwZ+QHC3FP6eMQAwx4649dfcsoGLubiDqqaks3vs4
	gh9Wovu/taYqaUpZhijGEQnh7Mcf1WNQieEknDipw42thrOdHGCwHVDIAppORw7Jt1H596Tuucz+R
	d7B0VOrAGivtkYJF6VCCPhnr26KtNadkgnCxOEUaU/tC2Pr6g7TIc8J96PTdSzmac2YmhuI6+av12
	8IFoGGCkQNddVTWxLT8EuqSIBjLBmmfTYXInDV4zj7hjNEUwtbj7T0Anv3uT5+jTQ42ClL8xE4sSC
	zSbhjapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ikq-0000000BuVP-2dB6;
	Thu, 17 Apr 2025 06:29:44 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IiX-0000000Bu8Q-1iId
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:27:23 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4769aef457bso4945371cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744871240; x=1745476040; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYASVlhOcfaq1av7/fl04126jANP6cWR4NufJae7Xbg=;
        b=KtjsEENSUZ1W97/oUVoJ71esLG3OnApcnOQO208nURI0t0/VFOvgy56djVk+CnvZ8N
         iKFQP9lY/8BWYOP5Q5kYgbcPg/nJH7CU5/yMlOQggLUJCskMOUG3dcLimaF5psC8fDGh
         QGmDuy21aMIv+l2vcjJEFv5A3ZE3ka3/09OwGJwrLHn2ul7Jy5fIvu1HUhc/uB1suHJO
         26kM6V907LE2TzkX7OPi2fKaikgvsHoudrU9qSmrQ7ZW1StIUp8NiS9YlMw5CxVRTSTd
         9LNGEYzjKRxh054Pz/X4102NdKji8Oxxm1ymcIdit7leTM7SpfJ3WKPAiZcIpWDiZmvb
         BVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871240; x=1745476040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYASVlhOcfaq1av7/fl04126jANP6cWR4NufJae7Xbg=;
        b=ZhANYl9qKONu4mlP/12tBoX9ESZK5xgR+csWuCzBnMn9TDcBdaMwvV58oVnqzn5ZJN
         1wHeGIlRq2udRjV1dBwoiGvwyjgL6JpznIyF8eOvpBbzd6BxJrMx4wNtVMZKAe5kM2A6
         JBEkbJqO3eIt2tOo99lJViA430s+Arit6X1p1jflcvLRU/xri14OClhWsr3kLO2W38fb
         Bfz7NOorBDx45C7hqqypFrJko98xtBzJJSnzL1qy/LXBQNBg4uTjjQcQuILFXjAARxaq
         YIUXQjTDnV24/B2N4JC0RGKresEWI2pvCqj8kzbg/OTg3U61FZQabozBmI7m+w/c+yvl
         69hA==
X-Forwarded-Encrypted: i=1; AJvYcCWma19jTYoGnVDtxqszWqDvbYDEpZiRNHeyEDiWkjjXXhoAQLCEWi4eKzbJ3ukeTe9SzB+qUEamduh/nJrqX9ZD@lists.infradead.org
X-Gm-Message-State: AOJu0YwR1y8MWg1qMdHtgiwZqfzxQoXwZ2Resks1XyiMCv8hkE1Ia6yL
	klAmjLBDxBFfrugOHmr5ywA24ktt44ybJ1M1yJoB0lUEykXfezoIBFQc3T16YXkro+msqPKPg60
	bhYRvwKNNyuw2/ekPhaTCI9/vIZA=
X-Gm-Gg: ASbGnctlLAV9BcsHAmBun7NRn+mjz+bqcqBSelx2yd6xrAulHCM9fDsbLkNbLuPLxkW
	ZNGGS9Ow7ynoRdEZInP0x8uiSIdy7NBDzH7hFdKxeMsnA5OYQhWbX9N0GrFpE/jAnowa1qmVM0/
	ZLbR25ZeeM8d5VZIdnQ9YbOmuxBX73La2SKkblGDYdLPDsGbNb+idmNwk=
X-Google-Smtp-Source: AGHT+IFtGW1OUCxVsFYK0aS+AATgm+R1KxN8WtGUG42EZWSWUImsJZzN5NBoIDk83tn8feVZCpeI87IWUhbWn44GVCc=
X-Received: by 2002:ac8:7f8c:0:b0:478:dcdd:a257 with SMTP id
 d75a77b69052e-47ad80c2478mr62378561cf.25.1744871240118; Wed, 16 Apr 2025
 23:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com> <20250416201523.GD3811555-robh@kernel.org>
In-Reply-To: <20250416201523.GD3811555-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:27:15 +0400
X-Gm-Features: ATxdqUFawBnxynRxMiSVdRnmhaCCPBo4utOuqT_7dUg0IVBqoTqf8a1fVYs9mBE
Message-ID: <CABjd4Yw5g8oKn=j08a6pr2o=TK7bMPx_NgfEh5cMFX9MVfgP-g@mail.gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: pwm: vt8500-pwm: Convert to YAML
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
X-CRM114-CacheID: sfid-20250416_232721_444953_D8E0EA9C 
X-CRM114-Status: GOOD (  16.83  )
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

On Thu, Apr 17, 2025 at 12:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 16, 2025 at 12:21:30PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the WonderMedia PWM controller
> > as YAML schema, and switch the filename to follow the compatible
> > string.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++=
++++++++
> >  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 ---------
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 44 insertions(+), 18 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml =
b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a5f77fa848e0f604bed63c3=
6b8e0996cf599cec0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/via,vt8500-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +allOf:
> > +  - $ref: pwm.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: via,vt8500-pwm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#pwm-cells':
> > +    const: 3
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pwm1: pwm@d8220000 {
> > +        #pwm-cells =3D <3>;
> > +        compatible =3D "via,vt8500-pwm";
> > +        reg =3D <0xd8220000 0x1000>;
> > +        clocks =3D <&clkpwm>;
>
> Same order as in 'properties'.

Noted, thanks, will adjust.

Best regards,
Alexey

