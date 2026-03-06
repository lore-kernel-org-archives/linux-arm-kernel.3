Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F03FCB607
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeEoT4aQ4mi2vgbSEY9kBw8Y3Q/OpPZnH0cNhdXpb+E=; b=jTbn4ryZlL8Qu8mETfDQOL0clA
	1s6g6F2FnepT8lbI18cMpaxMZuh/bFsAtbTQhpQSkL19eA/vhiNn7U+6H4/2waTm86M28x+gnwwn0
	BxsDClsNbBmJ6yuVF7Tlsw+3R+sXcvnQJPlY5ybrNN4vY6sTuK5OimgCVR+9NQisp9YN+17I418u7
	wwcAfOJhgvd1nJHTXaw+boegr422PgYhSO1dFWf5aThC0memfE2t663H8Sx8dvq/5AOEzETlz3/Sr
	dcuG+gaxZL2Nc3UyEIOM8n8qfRStivk6F7HGEnNhg11CzH/A9FAGvm6mQNPe9aT+TVcZYQSglavno
	JenK1kQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWbo-00000003ylB-2oCe;
	Fri, 06 Mar 2026 14:56:57 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWbm-00000003ykk-0eFD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:56:55 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-94dddb3c3f0so2464271241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809013; cv=none;
        d=google.com; s=arc-20240605;
        b=QL4qv1ZiYBBtyugnzFadqlq3n0wi9WSi5GmG+GOCx85pBRjNf4P2Ow4G8VZ6oOMByw
         //JV5lFtIHJGzGc4L2jmSydyaXTVAI82czDo5dOSnaeS3K2l+SU7U3AftQK83oYnxNkb
         Ng6bqfdj+zX992XL7n/keWELn1Y2ZR5FflzN9E4mw3+ezZU8GX3fwck09MWJBiI+2dQD
         sAYICaVeCypFecbS6aK1l+Q5JrWl2FHiXKhaC4ltdT4cp9O0uuQteAd3Mw1P8qOU2h5B
         ctapXEsAE1dq9To1cI7It0PJrA3rB4sUs7VPjw1UnGocirSIAeeC+9hSCpVaXYUdyIOo
         DeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZeEoT4aQ4mi2vgbSEY9kBw8Y3Q/OpPZnH0cNhdXpb+E=;
        fh=TPlceQp1jqeuhh/FcDAwLjtE1HuenfEzPY2o3wpn4z4=;
        b=JKjQHvJNE/fUtTT9Juhq2FllzZY/S2EFTVA7jKvjOr8ibxo8hXiRefXOdwz0f8cXD4
         SYN0tRv8VSQv/kqmqpSHZ8owPDmCj8jvf9LN9KbnFXLngDUKZoqvT8i4v9BoVnbKVAmz
         MHCvd/lsG4AcqEb8eqox5xIdZ/pSXY+kGZMsI0uFYiCTZbxKo0hutSqZ67/BJVW7VbPK
         T7sdY8GqWRcyBLlRDN8ECojeJ29t0/bvdQjnHG6MLoX7gGHbkxMy081Km8A7P579bOry
         iPKC0MgvD1BaJIR264H2zWAFsHvkTr7mMhMyAKlKHVCtQsnPnImQq0UxzciGt0AyPhOz
         uzTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772809013; x=1773413813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeEoT4aQ4mi2vgbSEY9kBw8Y3Q/OpPZnH0cNhdXpb+E=;
        b=mShVPW44t7gn9ldUHIM8HaNkRQn1wVVaAHBPPvLfrz1QixidlVufSHcAi9q4glMczW
         01A+waAvsflCPhTZNHjAIp9iYUk7XpmxwxChaOwBzhI7lHvLkGH0Y43RDNyTXMsrMT76
         0/kJJ+VmgrcEBwZYtnu+ZOOg1nYlGfNIBLIqi0rHMuCgrtIBEXjGA06p8YyfvmurPbRO
         pm5CpL7ZRqfG5EhVpTXcl8m9SlSABsSOCDVPBrFGORdfHf5mjLuIkLR0R7dcx8EmA8m2
         +l/kZGudh71Vwz0PKW9NULJwmB3YjsnmBpBUx1p8Eec5Ibde7SpuwicKLzJFT/R/po1B
         +OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809013; x=1773413813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZeEoT4aQ4mi2vgbSEY9kBw8Y3Q/OpPZnH0cNhdXpb+E=;
        b=T5Ay4aqQCAvUVIvf6yTHoC2xzbgHEhExdc8AXfuo8T35oy3N6rd9OUzvZKPbzKfxK+
         9ChT8WxiVDT9vuptwg8O7nE9l0b9eVifbAoZjKlVa6o3zT33nI4tQmcAfaj9hKvZdiVH
         JMMBZgzJKT3dKvTq9i9ieUn/6lUCmXVtME6Ry+GVPO6wesre72OVeNtSxuhtrzHpekaa
         mu4t/d4jxO2Y7NZTjbbgQj/+Ypc/4ITDsAf2W7QNrk8AaFQHiuTZc6eQ6SlkWuB0IIAp
         G3EXEg+B8HxQ0HBUN5eqCSE/YzyqBsI3HR42n6g3FH5T3BpFpBLbv5pn6knCDe83c/oF
         jL7w==
X-Forwarded-Encrypted: i=1; AJvYcCU7ahse3P5+yGeXpBWoRGeYgTa9OM0EvC+UR9MbJ05Nl/eF/GxKs9TynBjJHwulw7/QuABisaQXd6ujQUG+q8kF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcmk5NuIWfvHnwazvfcsDG0D5VudNUxDzbAe22WTM6GwSTkzDe
	IssRRoTeY4VIf/o+eJpxpDB/OZrvmnwzkjP9cRnH7Fpwn90CBXOEAkIQfc3h2MyNOPPgbHZDrHf
	G8SoUCpUIa00bwy8wOruzBmVF1I8rXB9lOHkhfTWEtg==
X-Gm-Gg: ATEYQzwUCAIF4BBFLPEgD9ubrnSGijm6b5TRwgidfNDjEwtwAYPTqpHZlS9W/UceqwW
	ixMXmmMRBxe/3dLooPI07usLGmiLFJpfpysPlsJQoYe+6Wmw5QYTtQ51wJvgxOb1wJcQU4g9rJA
	aEtUl8Ii05XuWoNK7o8SIpTZSzY2R8WwOWwBk15d6bmdEq8T5Md/y1po35MU4tqyee4Y07ciyQU
	y162wSHdcSPSO6sd/ihNpCETnLrxVyzq9qn44fwBYFKshoyOU0T4Z6GMKjlLLLL+ZXX57JVgPjq
	OlWta9Dfhcu1NDyXqkAHQyK/7wJ2JFIqKM9/eTOGHg==
X-Received: by 2002:a05:6102:2908:b0:5f5:459f:9860 with SMTP id
 ada2fe7eead31-5ffe61b0681mr982266137.28.1772809012534; Fri, 06 Mar 2026
 06:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-2-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-2-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:56:38 +0000
X-Gm-Features: AaiRm53uvHQccafGc4pUCi7QdXkQtBc4s9nxRYsP2kqD6MjlxpYsHiREsE46KEE
Message-ID: <CADrjBPqsQhmL+7tFQQdFDq=xbWKMUcADXiGoWehKXgWe1FVhnQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: power: samsung: add google,gs101-pd
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_065654_210872_24582709 
X-CRM114-Status: GOOD (  20.28  )
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

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Add support for the Google gs101 version of the Exynos power domains. A
> new compatible is needed because register fields have changed and
> because power domain operations involve interfacing with the TrustZone
> protection control on newer Exynos SoCs.
>
> Power domains can also have a power supply linked to them, so add
> optional support for that, too. It is believed that all (existing)
> platforms could benefit from this, hence it's not being limited to
> gs101-pd.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> v5:
> - add domain-supply and update commit message
>
> v4:
> - add new vendor property samsung,dtzpc
> - drop previous tags due to that
> ---
>  .../devicetree/bindings/power/pd-samsung.yaml      | 33 ++++++++++++++++=
++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Do=
cumentation/devicetree/bindings/power/pd-samsung.yaml
> index 9c2c51133457..3f1a2dc17862 100644
> --- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
> +++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> @@ -13,12 +13,10 @@ description: |+
>    Exynos processors include support for multiple power domains which are=
 used
>    to gate power to one or more peripherals on the processor.
>
> -allOf:
> -  - $ref: power-domain.yaml#
> -
>  properties:
>    compatible:
>      enum:
> +      - google,gs101-pd
>        - samsung,exynos4210-pd
>        - samsung,exynos5433-pd
>
> @@ -33,6 +31,9 @@ properties:
>      deprecated: true
>      maxItems: 1
>
> +  domain-supply:
> +    description: domain regulator supply.
> +
>    label:
>      description:
>        Human readable string with domain name. Will be visible in userspa=
ce
> @@ -44,11 +45,28 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +  samsung,dtzpc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Distributed TrustZone Protection Control (DTZPC) node.
> +
>  required:
>    - compatible
>    - "#power-domain-cells"
>    - reg
>
> +allOf:
> +  - $ref: power-domain.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: google,gs101-pd
> +    then:
> +      properties:
> +        samsung,dtzpc: false
> +
>  unevaluatedProperties: false
>
>  examples:
> @@ -66,3 +84,12 @@ examples:
>          #power-domain-cells =3D <0>;
>          label =3D "MFC";
>      };
> +
> +    power-domain@2080 {
> +        compatible =3D "google,gs101-pd";
> +        reg =3D <0x2080 0x80>;
> +        #power-domain-cells =3D <0>;
> +        label =3D "hsi0";
> +        domain-supply =3D <&ldo7m>;
> +        samsung,dtzpc =3D <&dtzpc_hsi0>;
> +    };
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

