Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38DCC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=; b=GOhTzMKoe7uaSSuPkK/cTIQveK
	+lukjjTAboNpXtBru5+X83SitYvu03GZVuo7uXR4sh6nU5pXmilM6a+UIYlCA9coSQ/aNypvi92F7
	73TFJmSVNOJKYrEr8likLRVxYte/Et20vCupsxrLV5fq/JUivKSAp/GwEodGE7ZRAgdewxkwKYsb/
	7L9WvY1qu+wb8KJXNLGdp6wNOCaUQt8eU4hkPjd1GZIvUMXFGFlBNeT5O90vwLr7WqplMDrapbEhm
	pFqcqC+5ABLhMbXtZpV9WQht5i2eYnx6UqKPGkshXZPbWM1A6ZLQhz07ufRCZaAj1iePYOWMukdin
	rytPYGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZKl-00000006vOB-1MTQ;
	Mon, 07 Sep 2026 13:24:27 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZKi-00000006vNU-2tCU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:24:25 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-467f09c00c2so937665fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787463; cv=none;
        d=google.com; s=arc-20260327;
        b=kq60Cx4UaYwLkXUNNrAKwb7o0YBuRjkZ/g1cG618M7EiN055zaJ/3vuUHMw3voj4Ko
         tBUtvUsuWPsiV0allQrNYh+xXGcuANP3QXXAbhaieFiB5NmHv16bvQfajc6tiodHBfji
         HvSqM4giSkklW66p6EqAt6sVVoP2sfaOKLCfypaFGKraFsm2qc8PA5pYq8MrSRA4H/Rw
         jkdhtqxHmeMIOhnKdrjBRtevvpJeqNLZohdre1jqaGJi4JT8FfcKTKlQhqE/Ysq7me8d
         D4X0/TODfmougNR3awyvmYRmJTxtqjppRD/D8mCa5XUc6aQKFIEz0eFQFXHIi8U7QxnY
         Ibxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        fh=z5YzA56z6KYefEnhfmwvOHV5XPVfdSUSg5TUALHMbiQ=;
        b=V7ZsYMI9Vc9bCe/7J4y02l/1da6tUPNsKRjQCKQJeCpzoPcJ+53wK3DJHQIsNK7pZ/
         yYZZOy4WGIVPZt+bU9NC+OOBey0zt5bvwQqb7N1iybVg07ELw8clZ09NQoZ8aK1vcxnR
         5XdyxtBQ1xhQ5j0nTCXvViicAxOVoF4yjcEV95QtGt3O3ocPwFYvGb5yIDfj6SNoojuI
         5T12hCBhWQ1cSygfp2dtxc+GuRaV6QlYCRgMyyIqlvkgEikYg5J8UNQ3txsWYblxi20x
         Dj2KDM3XH0G3GrbnydOlsXgkS3cULXtIt4FelEfyqpPbDMwwp63tiw4+Xyi+UaTmPMwb
         hDmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788787463; x=1789392263; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        b=pGLKROkqt6cazYnkVAbdKTJH0+JWr+au2CqeRzL8sAOEZIwEv7yJryc83E+3VKr/f4
         1zSsw9DsC+s/5ZltI+dVUSzRJ/zXJeybj4IEHa6FQof0h0PGDmXRiZdMgpXrE5qv9S9z
         RWVu9i1TlW3TeL0UI6Ku5W49oZ4E0M0yWj07Evp3v4eLQSMOBrJLt/vUKsg6P0qlN3Yi
         ik125+TUVk+/qiLGs+gEs0vF/Bo5BQNTsmymtW8iOU8bbR509TGuM5elnURUP+LkRIdZ
         0eLuZ++3W/qzunhi5wqJ2rsCxkm+IwWmjSyP+xM2ZT09xyF+pBvF+dZ9H2k3inoHYrOz
         QEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787463; x=1789392263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        b=mGmWL0C8AsAJ/8wZOExmHyf2X0Q9m+1zVSQ0fQVoHOZxMJG6z3Do0FZfauH9PeEmeU
         RQAzH+G4ksMhgpYcfT63JkBGL0VZrKliviKoWYZmkHJP8A2Jq+1cO5ZAth2pMGMRsnMc
         rNwCcLdmGCtIfx5UkhvZjYsTB3puj7Y+2EgA3LcBxujsKb8fbI+r+08Gxi1EJg8SRN8Q
         N36+OKYNnbP33WazvEV12kRhZCR5UcjHl7RUqWOJUVLLdvIHSzX74PTURrEhXjkzepqy
         yjOHtXk8GBOWNFB1Lq2seAGAIB1rOUTURjGHeXdqCBL/gRHJ+fj+aPSrzsJgvs9Txs47
         1X/w==
X-Forwarded-Encrypted: i=1; AKwUvBxxmAqcXllkN6rsdzUoIqXUK47gXVx21jo+xSL3/vluKmGibN72ePGlbtdYa2drLfPJ54PUrnP51g6I1DHE5VSI@lists.infradead.org
X-Gm-Message-State: AFuF++kDF7xDHFfe3we3nhXtupwKRsyqUi3yUI7nhsM6XY4tWoPoRtUA
	bpCcpAV7nBEVW0GN05zharTvvIpSo1NY7jH6bh04oele4sdMIJavJIJgyOMUWq6eDxJqCh4KlT6
	AntzU8pJh52VibtbB54IW3HojqoZQNJ50wycgojPQPQ==
X-Gm-Gg: AYBFou2UPKBT/qpcBEvRBAcgOiRDhkamctDMlpi/aI/D0Gef0llMZmxxs07raO2+tHE
	1TwuzECR5Ao6NicyR8aT15g82qsbdVaQHt9uu6k5wi7qaCN85fxcK8V30gvLSxzLOIJC4lg2i84
	sfBZPj8MzcMaO1JT5F1F1HAzpaCATPnT6AyxArTq8RRfKmdfJMtIxvGJj7Ahy+IpFu6R5F4s4Oh
	8OuCtE+kD7cTpxF7igBxORdaoJmWW86c8tjiPLydsM7VRBOh5hduPB98XpfhBWZyD1tlDHzgJNE
	gyBsFVZ81IWByOiuUsYfXgm1/Y5ECojujkhK9LWcxCRihOcRavHCxt+OKGeutQ3fdzDgEK0yyjI
	kGdES2tRyeGngptCMwD3i7eTmqw/2TPUNbfYX0E2VxGQsGSBPqE2xzXxvJkbL
X-Received: by 2002:a05:6870:b01d:b0:46a:deaf:5915 with SMTP id
 586e51a60fabf-47551591688mr14531947fac.9.1788787463608; Mon, 07 Sep 2026
 06:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com> <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Sep 2026 14:24:09 +0100
X-Gm-Features: AcwNN1VtJNaQAhgZmbN25VVX96rEB3Wn69gfnD4KGJJXrfRYQ9eR2sFIrX6o3IU
Message-ID: <CAPY8ntCF6e3FZPx0BwZKJimACwdUKwNSP+SPjNUE+1DgQC1=Qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add required
 vcc-supply property
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_062424_731399_DDAF41A1 
X-CRM114-Status: GOOD (  18.02  )
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

Hi Shashank

(Apologies for the earlier HTML version of this - I thought I had my
mail client under control)

On Mon, 7 Sept 2026 at 06:48, Shashank Maurya
<shashank.maurya@oss.qualcomm.com> wrote:
>
> Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
> regulator binding and mark it as required. The panel controller MCU
> needs an external power rail to be supplied before any I2C communication
> can take place.
>
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> index 37b9ed371b67..a6195e53be16 100644
> --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> @@ -35,6 +35,9 @@ properties:
>      const: 3
>      description: See ../../pwm/pwm.yaml for description of the cell formats.
>
> +  vcc-supply:
> +    description: Regulator supplying power to the panel controller.
> +
>  additionalProperties: false
>
>  required:
> @@ -43,6 +46,7 @@ required:
>    - gpio-controller
>    - "#gpio-cells"
>    - "#pwm-cells"
> +  - vcc-supply

Adding a new property as "required" breaks all existing users. Adding
it as optional would be reasonable.

  Dave

>
>  examples:
>    - |
> @@ -55,6 +59,7 @@ examples:
>          gpio-controller;
>          #gpio-cells = <2>;
>          #pwm-cells = <3>;
> +        vcc-supply = <&vcc_reg>;
>        };
>      };
>
>
> --
> 2.34.1
>
>

