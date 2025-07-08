Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4998DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 04:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97PA7tnoUToVlQXPk0nMmVPATh2HU3vK09piMMjV8Cw=; b=45OgpRWiKbAHqSXZwwSwPgCQfO
	MfxFqDbRA9bzOVXgZ1kfCJa3MVJtpEZGZIlBHP4ZX/CWtP6CBlCQLd/r+Cc+bVxmDkEFaW/OjsjBh
	lQP/2bVMMCYF4ojxn5Ad6PhYnE5r5sBFxZFnw+UajP6/kXod0N8tRcKcOcz2zsDPbx5rSPtRRH9G4
	eqOabqpuAbQVmr/PL6L21Nwe+idophvivz7CqmvUttnFLBKgDGGTdJNlreqmL5ry3ZPKiVkJSZk6E
	yWfrKbuiZKZz0f10bPnksgT9sYI0Hzzne8XJWkH4qo3cmYiDEYzL/S76lV6Y8Uyxtg1hE6nzO952p
	Gac7tHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzgp-00000004EBr-1zrH;
	Tue, 08 Jul 2025 04:12:19 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzeT-00000004DxC-2GDC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 04:09:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso4359246e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 21:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751947791; x=1752552591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97PA7tnoUToVlQXPk0nMmVPATh2HU3vK09piMMjV8Cw=;
        b=HcuTcl76XG0G07pNcOgsqQVEVhAr6dtFEEbvR2fYAevPXClx1VvoYne5hQMJX1EqA3
         DFJrEj3GkGR20tykskbJ/gnRX9JJ+Gxiu5mtn34QAsNn7KnyimFCjw8YkfqNQdIY8D/T
         dpNCDhhJYlI419qkQdKfmEZTLjOLAGKs0fnK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751947791; x=1752552591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97PA7tnoUToVlQXPk0nMmVPATh2HU3vK09piMMjV8Cw=;
        b=D9qAZJ50PUj8u5XTbS9QYIvJ5c0pP6fiVRhJKDBggF2I09Ni6oCIjwDg5srlkp3b4j
         IT3liAKLjXQBStQt3WDb+qDcBqjHCYtMVu8WdRcJgGhc1gObOoLC2WL6wP+hkIAWfj4O
         4V93XBmI8AuwRhBlnBUmDzgScSFd4jrlWWuKOHnlZVvCmCYIAjy6omwBmow9W7/sWB0f
         +B6M0k/JphEscQjOs3meTVczPduc3HpQW9VgAuwKXTuVrtNvi6PJm+4/rYKUIYc+gQ4o
         IQrCcrlpBZrv4C2XND4zjR98m3q+ag/PZJpxn+ZzFaXgJhADySXnlydbwvNlGS7/4x5+
         n3GA==
X-Forwarded-Encrypted: i=1; AJvYcCVAT/iJvWl+HC6cIHeiWY38bUovSM81t5wHVEUGgeBrOOQv5TW7Z7THQRb5VIKEMnQb3sfgdNxQSUaqjTYNC0m0@lists.infradead.org
X-Gm-Message-State: AOJu0YxxEn67Na5E4hv89oIiYcQ1gG704hsKYYzvZ1a1hUnNb95YLhrr
	mtLw8/tiCY/ozp3EW5JEiQdQ9lkmM7yyq6QEH0A9hU24K3eP1gA+zcDAD8zH9CWPNM4GY0VnQh+
	YorqaLuKTdg+5GeJ2LldzllCdkN1eVEftDONO8uWU
X-Gm-Gg: ASbGncvKozlhB+kqsvvwR4Uk1wXc5uL/GuHadvB0jwQJVXHqVGcrl81Whi5q34qlgEW
	VqSJgWnI/2yJ+jpAXKVOztj9X/WcsD2i14rZz/16GIcTI8QAdmc+QI4V5ypYFpONR7dLFuRhzO9
	D3SuMiR6wXKcQGBzfBkWHldFvrvfu0vBVZEmPb3OTAtRMqbofihn+IrINdbWTBNBGeIhPX5uU=
X-Google-Smtp-Source: AGHT+IEVujyv6lAcDWE1bZGAyeEobtReCu0A+jIigUo7aBzy2SXT5pvaXtmoXS+q6pOlLoU2IHQ9/lFEOLFDtdD+mLU=
X-Received: by 2002:a05:6512:6c5:b0:553:ae47:6856 with SMTP id
 2adb3069b0e04-557f8310057mr327313e87.10.1751947790882; Mon, 07 Jul 2025
 21:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com> <20250707134451.154346-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250707134451.154346-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Jul 2025 12:09:39 +0800
X-Gm-Features: Ac12FXzG3Dao19qlz-A1KXKkJqrEyMGo4bcZkDP1swxYmwtOwf1D0Gwc3OVNmQY
Message-ID: <CAGXv+5FHA-Y1xyW=_UjGUDsqarXNTciGP7KnzoB2Jyj2Ft5rdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_210953_719875_67EA1098 
X-CRM114-Status: GOOD (  30.59  )
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

Hi,

On Mon, Jul 7, 2025 at 10:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6373 PMICs.
>
> Link: https://lore.kernel.org/r/20250624073548.29732-4-angelogioacchino.d=
elregno@collabora.com
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../regulator/mediatek,mt6363-regulator.yaml  | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,=
mt6363-regulator.yaml
>
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6363-=
regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt636=
3-regulator.yaml
> new file mode 100644
> index 000000000000..9df57b803edb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulat=
or.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6363 PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MT6363 SPMI PMIC provides 13 BUCK and 25 LDO (Low Dropout) regulat=
ors
> +  and can optionally provide overcurrent warnings with one ocp interrupt
> +  for each voltage regulator.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6363-regulator
> +
> +  interrupts:
> +    description: Overcurrent warning interrupts
> +    minItems: 1
> +    maxItems: 38
> +
> +  interrupt-names:
> +    description:
> +      Names for the overcurrent interrupts are the same as the name
> +      of a regulator (hence the same as each regulator's node name).
> +      For example, the interrupt name for regulator ldo-vemc will
> +      be "ldo-vemc".
> +    minItems: 1
> +    maxItems: 38
> +    contains:
> +      enum:
> +        - buck-sshub1
> +        - buck-sshub2
> +        - buck-sshub4
> +        - buck-vb1
> +        - buck-vb2
> +        - buck-vb3
> +        - buck-vb4
> +        - buck-vb5
> +        - buck-vb6
> +        - buck-vb7
> +        - buck-vs1
> +        - buck-vs2
> +        - buck-vs3
> +        - ldo-va12-1
> +        - ldo-va12-2
> +        - ldo-va15
> +        - ldo-vaux18
> +        - ldo-vcn13
> +        - ldo-vcn15
> +        - ldo-vemc
> +        - ldo-vio0p75
> +        - ldo-vio18
> +        - ldo-vm18
> +        - ldo-vrf0p9
> +        - ldo-vrf12
> +        - ldo-vrf13
> +        - ldo-vrf18
> +        - ldo-vrf-io18
> +        - ldo-vsram-apu
> +        - ldo-vsram-cpub
> +        - ldo-vsram-cpum
> +        - ldo-vsram-cpul
> +        - ldo-vsram-digrf
> +        - ldo-vsram-mdfe
> +        - ldo-vsram-modem
> +        - ldo-vtref18
> +        - ldo-vufs12
> +        - ldo-vufs18

To summarize my replies to the previous iteration, I think this is
not a good representation, since a) the interrupts are internal
to the PMIC, and it does not need to be spelled out in the DT, and
b) this gives another meaning to the representation, it being to
enable overcurrent protection on the given regulators. Instead
the common regulator binding has the "regulator-over-current-protection"
property that can be set in each regulator. IMO this is much more
explicit.


> +  isink-load:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false

Do we know what this is for? There's no actual output with this name.

> +  ldo-vemc:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +patternProperties:
> +  "^buck-(sshub[124]|vb[1-7]|vs[1-3])$":

According to the datasheets, vb[1-7] should be vbuck[1-7].

There are no real outputs with the name sshub*. These seem to be some
alternate setting / mode. I don't think they should be modeled as
separate regulators.

Also, could we drop the type from the names? There's no real need for them.
I managed to get them removed in the MT6366 binding, and I hope we can
continue that scheme.

> +    description: Buck regulators
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          Allowed Buck regulator operating modes allowed. Valid values b=
elow.
> +            0 - Normal mode with automatic power saving, reducing the sw=
itching
> +                frequency when light load conditions are detected
> +            1 - Forced Continuous Conduction mode (FCCM) for improved vo=
ltage
> +                regulation accuracy with constant switching frequency bu=
t lower
> +                regulator efficiency
> +            2 - Forced Low Power mode for improved regulator efficiency,=
 used
> +                when no heavy load is expected, does not limit the maxim=
um out
> +                current but unless only a light load is applied, there w=
ill be
> +                regulation accuracy and efficiency losses.
> +            3 - Forced Ultra Low Power mode for ultra low load, this gre=
atly
> +                reduces the maximum output power, makes the regulator to=
 be
> +                efficient only for ultra light load, and greatly reduces=
 the
> +                quiescent current (Iq) of the buck.
> +        maxItems: 3
> +        items:
> +          enum: [ 0, 1, 2, 3 ]
> +    unevaluatedProperties: false
> +
> +  "^ldo-va(12-1|12-2|15)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^ldo-v(aux|m|rf-io|tref)18$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^ldo-vcn(13|15)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^ldo-vio(0p75|18)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^ldo-vrf(0p9|12|13|18)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^ldo-vsram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^ldo-vufs(12|18)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false

Could we also describe supplies? There should be:

vsys-(buck[1-7]|vs[1-3]|ldo1)-supply


ChenYu

> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pmic {
> +      interrupt-controller;
> +      #interrupt-cells =3D <3>;
> +
> +      regulators {
> +        compatible =3D "mediatek,mt6363-regulator";
> +        interrupts =3D <4 16 IRQ_TYPE_LEVEL_HIGH>, <4 17 IRQ_TYPE_LEVEL_=
HIGH>,
> +                     <4 18 IRQ_TYPE_LEVEL_HIGH>, <4 19 IRQ_TYPE_LEVEL_HI=
GH>;
> +        interrupt-names =3D "ldo-vcn15", "ldo-vcn13", "ldo-vrf0p9", "ldo=
-vrf12";
> +
> +        ldo-vio18 {
> +          regulator-name =3D "pp1800-vio18-s3";
> +          regulator-min-microvolt =3D <1800000>;
> +          regulator-max-microvolt =3D <1800000>;
> +          regulator-allowed-modes =3D <0 2>;
> +          regulator-allow-set-load;
> +        };
> +      };
> +    };
> +...
> --
> 2.49.0
>
>

