Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255FECC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=; b=2Sn1JXLj5LVu/HZk6fLvEMITbc
	tO1TLVihjlwBvDO9fkgSUlIuouHJc/pVnRerqXUgDM1pLkj08Xts4Fu5sV7Or6rZtHVgFkAd+LIs7
	zrVs9NVIUWCuCBHQk06o0SKbbSbQiqHoCawJv4wKqWhqdwdEFxci7hAWULENBD+0xQQ3y2Mcxd0sx
	ULUIwQFfqRJiTWsW8eL+7uSGUfnbwmw31JfdpVxVa27uORwbc1jd714nqOnU0lDqkpbHcPQNQd7ez
	394lVALK54yKS0DMhcAPT71NhYesVAJqS/5KCUR1w7c53AVa6RNlOzxLLyvgBmyl0jiCSGZEMnLLi
	TQLpdlfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfzc-0000000DdMj-3KBn;
	Tue, 13 Oct 2026 17:08:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfza-0000000DdKw-2rjN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:08:48 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1965613a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791911326; cv=none;
        d=google.com; s=arc-20260327;
        b=VeFT9S0mTy1jeMSlkt1oh8tej6Hn7GB7119n6Oz1dNW1zwcRpRNVG1kuCSn3XVN8x8
         AqC3yM7CK4L4Oovxx6hcEym8jmYaMpbFErHwO/qCUJYUTSkfomlIw2c2WjMkcRJA2AZD
         G0rIrqXYE6GyVG7EbpT1VExk5N40FLHYl87plG1ez2oSdLcGaO3AaeSRY8MiV6YLq7l9
         R7ry/B8oV0nwqvw4Wykr79YxEem4uw3giH8R7Ci7Pb5I+qJwvE1tCOkeyI8Mlh7OB4UR
         okSZVPnqjROBl+ZXgUBFdqN6p397xhfRYQchCwGfKHzeQs7kvciiwXEOx+WzcaKGEovl
         cFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        fh=EAaymGm4zGcXsqgiHUtU4umknlA98HE1feJB/h0ZAc0=;
        b=aB9MACQRKFd5aSuQeNPYcx8VPIOqQp7iLWu/Dub1rEl6a7LgFHNv81+dUmWLmdQI6O
         F7jTyuPUVG6OCv85mNte9Qy4S9gvkSfthMwhBCDlFRADauWXOTC3U74QVAI013gJ+XH+
         VsvP0fZH98nvsm/GgLcbzE/ovkpDg9G8Q7hanS58ZtXzQhBUcwzLBsuFQHNvPpbKbAe/
         QAR7MZRno4UXYn3m9+oBOowQm/7ZLg/uQJpYz+tVJ0C6darENam8cnBUltgUXZE2036D
         P3MDYf+Kl5wDxliw707jgfqy2RCoplupDYDVHEqG+6joSGvZLXS+RoPr7OuVOgJeTnRf
         qzZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791911326; x=1792516126; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        b=Edy9fUB5c5DbA+GHVYVsIwTlhsPq6wNnM0/UQkIAwUpdy1wekPN85TTzeXTCUTW56F
         MmJum9jmciqlV1Xq0yTrOkuMOvuVrASklWJb/7odKrkP7cpQ/OLnOWwDF61HOi7xdSUn
         rnggHpz9spsn+TivXsImD0QYpGW112cPAYB0WFw/AKunBaxVjHXpNRexD+1kXk6PxoU6
         meyKIgvs0y4PiZyz/z2OZkXek8UeXr2Sd5MmgxbVu9HxXXyFLvdMY9xxqDnN7sFFWxQz
         HHp0Ts9uJEJuuojVb5aBPrFUmGBy50uY7DM9ZbRVH5AeL8ce2uekyhjmwQEFKCJNTWB1
         VuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911326; x=1792516126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        b=PXetRA6P0+utLCN8oj5BRtFHHEQTKAeyRqpIXWeEIidx1+2XG7ixaepmKXpu9qqXXx
         BBY4iyg99Ysxvj0AUS987/ebtNiuAqEXHvMQYWjgBFf9HWZyZweiF59wBaZKOg07Ubwr
         e279NwWk8fOSqtoBG/qvog2Azu8ZSG628eRLOTK2rEge9N6HvMYWvC6EWQP/XHnwFDrE
         92I1GjA1J7SKc5+SGWE7YwSVzI7uCEFuaAZQsR/ufNFmQwh89hLVDYiPklCc5074KfiF
         qxxmknD2K4srTAk4hPDg+6NqkZYpJhM2P93eEsctGTxLs++eM7akBn9M9WDtefwMvl/6
         OSdA==
X-Forwarded-Encrypted: i=1; AKwUvBwifAmXXZdsfSllso7GN71Zk7rniweQ8Gh3spniKlR0y+iYgtDE9V9hAUHgb1W/RjZ8xhpY80kLT2tpGhfxD6a/@lists.infradead.org
X-Gm-Message-State: AFq9FYK9nLOzy4Dr0hiCUWJ5LDGb4c/jHZAc4e+wRrqzs9ce+CaXQ/Yh
	9wIdFaaK6FQn79AvJqmXOJqrTFF8ms8xgUTSe/AWiTQ4Ji11Lr4tlKGuzy7bcZkOu0A4AA20gpT
	rPog6r8qNalYmtpfvEMplb6qoPFsRokID6J8yL1ITzw==
X-Gm-Gg: AYBFou0H9NTuqG1pa0h5YULYjsy9sGJ9Eh8npw71Hdac8RXp+rgYHt+WL0SOgg4n5ET
	5743CYf7TohBOJZi0KIOu0L+Dr6LIWfAdz4sDBDV7IRaB0y7+EFlq4CPXyIWkd9H6e/j3569/Zx
	8cMBrEivuFNAthYFGwgbFYTlM8HX7kBo03SedmTlxbBCTmSXa6VXaJkOHF9mOYKLhJFGwM/K/MT
	1K58ZPeTYs/i5A26ZPD1JbjFQSvcW7vIxtSRNGj3ybjEUYx6WSCbyq8aJwct5O0lJopVHsIK+f2
	s/FCM22t3iUgJulS5xL9Ik7FpBBCOMaIWvoQKKxOvpdFmQc/sLqiukelDvUGoJ0ej1h5qShmf8S
	Z9pcwW794lf+lSPfx+hk+2LzmnoL6QU6xTpc=
X-Received: by 2002:a17:90b:2ccb:b0:3ab:17b6:9a93 with SMTP id
 98e67ed59e1d1-3ab3afcdc6emr11412675a91.52.1791911325665; Tue, 13 Oct 2026
 10:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20261013125735.1542349-1-robert.marko@sartura.hr> <20261013-stylized-plethora-2a9e27545adb@spud>
In-Reply-To: <20261013-stylized-plethora-2a9e27545adb@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 13 Oct 2026 19:08:34 +0200
X-Gm-Features: AclHuK9pPURsd7YCVT-est8rnkCB1X5dbN9hPBM8kNfyB8V38NvJe0-SENxgn8E
Message-ID: <CA+HBbNHZZePJh6s2xujmjA57GYZTgwhMqBnf0atM9aPQJP77Rw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan controller
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	lars.povlsen@microchip.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_100846_739698_616CD904 
X-CRM114-Status: GOOD (  22.28  )
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

On Tue, Oct 13, 2026 at 6:30=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 13, 2026 at 02:56:25PM +0200, Robert Marko wrote:
> > LAN969x integrates a PWM fan controller with a tachometer input in
> > addition to the Sparx5-compatible temperature sensor. Add a LAN969x
> > hardware-monitor compatible and describe the second register region.
> >
> > Describe the fan as a child node using a two-cell PWM specifier for the
> > period and standard polarity flags. The child also carries the optional
> > tachometer pulses-per-revolution and thermal cooling properties.
> >
> > Keep the existing microchip,lan9691-temp compatible for device tree ABI
> > compatibility.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-t=
emp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.ya=
ml
> > index 611fcadb1e771..e91c2a3ccd3c9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yam=
l
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yam=
l
> > @@ -4,13 +4,15 @@
> >  $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Microchip Sparx5 Temperature Monitor
> > +title: Microchip Sparx5 Hardware Monitor
> >
> >  maintainers:
> >    - Lars Povlsen <lars.povlsen@microchip.com>
> >
> >  description: |
> > -  Microchip Sparx5 embedded temperature monitor
> > +  Microchip Sparx5 temperature monitor with a fan controller on LAN969=
x.
> > +  The fan child's pwms property references this node to specify the
> > +  PWM period and polarity.
> >
> >  properties:
> >    compatible:
> > @@ -18,11 +20,19 @@ properties:
> >        - const: microchip,sparx5-temp
> >        - items:
> >            - enum:
> > +              - microchip,lan9691-hwmon
> >                - microchip,lan9691-temp
> >            - const: microchip,sparx5-temp
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: temp
> > +      - const: fan
> >
> >    clocks:
> >      items:
> > @@ -31,11 +41,67 @@ properties:
> >    '#thermal-sensor-cells':
> >      const: 0
> >
> > +  '#pwm-cells':
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: PWM period in nanoseconds
> > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      cooling-levels:
> > +        description:
> > +          PWM duty-cycle values corresponding to thermal cooling state=
s.
> > +        items:
> > +          maximum: 255
> > +
> > +      pulses-per-revolution:
> > +        minimum: 1
> > +        maximum: 4
> > +        default: 2
> > +
> > +    required:
> > +      - pwms
> > +
> > +    dependencies:
> > +      '#cooling-cells':
> > +        - cooling-levels
> > +      cooling-levels:
> > +        - '#cooling-cells'
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: microchip,lan9691-hwmon
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +        reg-names:
> > +          minItems: 2
> > +      required:
> > +        - '#pwm-cells'
> > +        - reg-names
> > +    else:
> > +      properties:
> > +        '#pwm-cells': false
> > +        fan: false
> > +        reg:
> > +          maxItems: 1
> > +        reg-names:
> > +          maxItems: 1
> > +
> >  additionalProperties: false
> >
> >  examples:
> > @@ -46,3 +112,21 @@ examples:
> >          #thermal-sensor-cells =3D <0>;
> >          clocks =3D <&sys_clk>;
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    hwmon: hwmon@e2020100 {
> > +        compatible =3D "microchip,lan9691-hwmon", "microchip,sparx5-te=
mp";
> > +        reg =3D <0xe2020100 0xc>, <0xe2010348 0xc>;
>
> Are these actually the same device? These are somewhat disparate
> register regions - and the second is at a very odd offset.

Not really, they can be separately configured and have their own register s=
pace.

I did not see a point in separate drivers, but we could model these as
separate DT
nodes with their individual bindings if that is more appropriate.

Regards,
Robert

>
> Thanks,
> Conor.
>
> > +        reg-names =3D "temp", "fan";
> > +        #pwm-cells =3D <2>;
> > +        #thermal-sensor-cells =3D <0>;
> > +        clocks =3D <&sys_clk>;
> > +
> > +        fan {
> > +            pwms =3D <&hwmon 40000 PWM_POLARITY_INVERTED>;
> > +            cooling-levels =3D <0 128 192 255>;
> > +            #cooling-cells =3D <2>;
> > +        };
> > +    };
> > --
> > 2.56.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

