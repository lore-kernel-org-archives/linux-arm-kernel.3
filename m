Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7925CFCB608
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmZqESOyOnPfJv4IzChP40XeUhrwxP8UgJY0WEl1j3A=; b=HwTJFLh2kJWYzs52xVuQ6REqCN
	v7kICxukdNvMsKZ5sYBmj3zYT6EZ7yoVZmtMhg5/VynmensfpndSUqHH7G2WnBCcl2/gijnbLIvUI
	sO7QTPBt8blx39OwfiJVt2EPw254fj2+5e1wxwmKKazQ5UvDqAijQ/jKbNaX/0xDFMCn86ct79Nut
	eT7Xptg44iNxpE9j7zTHnR5mgiRk/kzolmEzy7QS7h0tV5fqMPiN7aIWxQJNDwZRHYEMFMlnMI2TA
	LtkEcOuCFy647wLwNJ74w6uP1haBdvj+8xHfX8Pa5pT7YVDBC3TsaApraVMXrENhisrTskuwYAzMD
	7JALnJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWe8-00000003yuM-2zdq;
	Fri, 06 Mar 2026 14:59:20 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWe6-00000003ytw-0pQo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:59:19 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so228285137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809157; cv=none;
        d=google.com; s=arc-20240605;
        b=F0ue4C0jU9arpkTyFkRkIohR5HgjoYP4hJRLaWrT6jQSzOjGyOm3hUwRC+rG9mD/6q
         ZiN8gd1iYqC503LuvhNnoajrZX8AwpU81ozYJ1u3Ijhxdl5WQlYNyk7hJm3OdhKahntM
         HqUttOp3hxvTYip3BzQPxAK1vts955Lg0pGVbd6RHHyGTNcSC0NoRRedCfyvkWSrprY0
         T/1WZWVTnU91tx2zvnybX79plb+cTAdYhVK1xOiS/lN/oL/27G6zOShNFwKq9k+u78Ku
         3PpHpeDDizbZN+xVZTOhz4jpZKCL8y/dEKx9syrPwWMRNIGoLSY2O8uHT3f/UYGDh0Cp
         PepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cmZqESOyOnPfJv4IzChP40XeUhrwxP8UgJY0WEl1j3A=;
        fh=zxRnyyDqaTAw1lOJUkCmLr03OuZDSMY6+7nmAAt09KM=;
        b=jiBrov4X+xFTnqc7akUN9toMEkOEDL2lkkUitnXoUSUBz9FOPB85eNbxgD5sbooFV1
         k/muStkYx8Q/4I389QqIj8i8gaqNGdR5uDxTcxxrl30zX/1tBkxPaXcSldNGe9XSHBZg
         MyeOYVaX3RqOLJjMGu7N/S5m6NF3WUSN6NiGFXNYe7RIaMSkDHK9cAtjGb+ec8/fjfz6
         7IxXQEaw+URWBl91l5EChZcvnlOUKToZ+5rs8UQJ9SqOp/fPZ1ilS3nkzFCpz9XKEJK5
         HJN7xnJ7UHTqzi3B2qNCqkzRlYFPepHsJiuLANSeZEHQF7xmJajVD0Pim6S5gPmgEsHq
         MbGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772809157; x=1773413957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmZqESOyOnPfJv4IzChP40XeUhrwxP8UgJY0WEl1j3A=;
        b=HzAo40/wAI9qT8wg7w2T3IQoivWmLBgjEobSlHEOer6aj82TOmmCQb96fOoZfdMerO
         D3EBLoXjSFTPBe47jtbnYGkjj1Z1+M02RuKjmrkjOoqhwXrJcS6sabhT8z0PGTP10sP2
         K+wehQoUT2JBMyVyXrLSLuW8X6YeZ5j2jr4yDN7C7jy1oqVmtZkoPHry+KkS5+Z+oSiC
         0+5jymTlXoia35WbNmzHbZNQEzK5KZEQt+15ok9/y0YBEt4ES7WZSAU3WZTZBRiRpT8b
         zdwWPfsPtgfwOQA2WeWEkdy4uKb32cLQ+fJ+ZDc9IK3f2NCQ2ktXWEVVmuZoOjWOd1Nz
         qkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809157; x=1773413957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmZqESOyOnPfJv4IzChP40XeUhrwxP8UgJY0WEl1j3A=;
        b=MOYvROCk/Khv4Ewa0ySxGuXvfkl7Qe3pSv08giih6hFjgOSoyk2+Xxz+YdKayLuC7h
         xtc2kifcWiv7pak0zk0gbjRULjaI71k5V7JKtQl9UW+fWpKEIpqdH+bVF/4mft2pwJZj
         tC7eXr5DXXGHucEFNNuxleZ0+qhU2E/ZWnrvyobsvAjBUSscjgA48WGqQsq3OZhc5kuh
         d+3pq+m9E8pIdNedsrysGcvKy3+Z0Tg8fFLU5eefIbdn/O0YTC+h7yPP0Sbwla/YDcGF
         vJA/92SUQpo1lvX5IWOmbOblaV++1ZDdfBkApMc02wdLUMHxCsIbGYsenMsZlZWb9Ges
         DXFA==
X-Forwarded-Encrypted: i=1; AJvYcCXll2749gqXlVZbe2qbmlWH5yaGNkLoY2ZIDH4aC05+v85jCQHPtD/cokfdHcgnAUllpQhvdhsiURQQW40+28ax@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5VV9uILmGEWl/Rb81QncCpRaornT8l4o6ZGvYJvWukWsuKrJ8
	hiDGA0Bq1aQOq4nXfhJhxipbFo1C67dYXGbjIkiGcQYmL80Ptu2M3DchNFsALQodEwJU41NoVUF
	2a2JyuJfdV91fL1IFb6/FmagIkeRVwySCcSB4aUbkwQ==
X-Gm-Gg: ATEYQzy07BZC2X8ISowjKVAME/7iWsFjS5u+il5/6qEcOswFxQI4X3Hf+k5I+rULH+x
	30CdtHO6lY+cPyKz2GBRdMCWIlbxKMRyuw23n3O5/gv3HnMrsFkIuW9BaY5BSNxfeF0DAEWUfTk
	UInZLrT3E16PTjLToDAHLGyH8djmnCNiLG1j7A/OTPEPfJ/8/X0K3cyz9h6N8BC0UV47nWJxqra
	pi4E7rLeGDv/v9blXsMhEMZQAvRnkqjGBrto5Th/z6k0DCR+4kaiYKOT5DWvAzrUyYQJ1/uf57V
	PISmgMQvQiNHsGn1/2IN/W846u4lEkzojFzviYS/7Zw8NUt0urEm
X-Received: by 2002:a05:6102:c53:b0:5ef:b5fc:dd48 with SMTP id
 ada2fe7eead31-5ffe5f56879mr715168137.9.1772809156599; Fri, 06 Mar 2026
 06:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-1-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-1-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:59:04 +0000
X-Gm-Features: AaiRm52b4ufIqeiRHiDfo_C1HRG2l1W5rj2t_mcLn5mu97dz8SMCboLZ3LDBNm4
Message-ID: <CADrjBPoceGbH7Jf7z=8icaM_6c2pyZBXDf7-uxr2gsuNSowSEw@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
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
X-CRM114-CacheID: sfid-20260306_065918_251688_A06515C9 
X-CRM114-Status: GOOD (  17.88  )
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
> The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
> an interface to the protection bits that are included in the TrustZone
> design in a secure system. It configures each area of the memory as
> secure or non-secure.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 43 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dt=
zpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.=
yaml
> new file mode 100644
> index 000000000000..a8c61ce069d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yam=
l
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Distributed TruztZone Protection Control.
> +
> +description:
> +  Distributed TrustZone Protection Control (D_TZPC) provides an interfac=
e to the
> +  protection bits that are included in the TrustZone design in a secure =
system.
> +  It configures each area of the memory as secure or non-secure.
> +
> +maintainers:
> +  - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: google,gs101-dtzpc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/google,gs101.h>
> +
> +    dtzpc_hsi0: dtzpc@11010000 {
> +      compatible =3D "google,gs101-dtzpc";
> +      reg =3D <0x11010000 0x10000>;
> +      clocks =3D <&cmu_hsi0 CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0b879760b6e..611fa8fb9f8f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10883,6 +10883,7 @@ P:      Documentation/process/maintainer-soc-clea=
n-dts.rst
>  C:     irc://irc.oftc.net/pixel6-kernel-dev
>  F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  F:     Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
> +F:     Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.y=
aml
>  F:     Documentation/devicetree/bindings/soc/google/google,gs101-pmu-int=
r-gen.yaml
>  F:     Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
>  F:     arch/arm64/boot/dts/exynos/google/
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

