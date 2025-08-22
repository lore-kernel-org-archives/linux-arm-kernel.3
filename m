Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034CDCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GPy/kVr5xy7hBpohKijiQplg8+R4/OMAuZ4Oz2BeiQ=; b=o9vpoavWvBV6iuQ1qOZBmd7hVK
	1+8dfsJq98UmqLEhf//iBDiUFb43S1U/I+F6hFvKpJkkjmlcUDdaYvTpiDADezY7Sqj2fqrfFFt5h
	9L2k+W31IDUuZ4VfW4IZ3yGnltp+5gD5eXuD7Xh1XnthvnEcm2oiFWl9uW00jumkWUDhcRNWpgtzP
	sJjxYfrvQ4qYK1toOZj5nXpaTXfV7YmqNX2YzDyq80Ivc1WGUXEddV6vw4io5Y6uOwni3vExAatEL
	G0qUtBBctuAhZKPmvZtJS9sxZX8DZcmbulDkWJNnnLZ3qiCU9MdnsywU3eSyhh28bIvCd7Yoxbb/0
	dciqyx6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSal-00000002kAY-2odp;
	Fri, 22 Aug 2025 14:18:07 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKYm-00000001c6l-24x1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 05:43:33 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55ce528022eso1684583e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 22:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755841410; x=1756446210; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GPy/kVr5xy7hBpohKijiQplg8+R4/OMAuZ4Oz2BeiQ=;
        b=BoGKoTPA6/JVhCJHgSotHeEf5tujl+r2bxEfAQYQVgfGdUXB9QzDz0Wxlqx6khGMkd
         jUk93xwjU2HDp4GEP0C0Q7v+zORIpawuMwt5hmf32ycU7JHHEqF7Aet3zbAVIlQlxueV
         Ev0CGGotjWm0Gl0CSe/0dDq+15ve8YQSTOmak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755841410; x=1756446210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GPy/kVr5xy7hBpohKijiQplg8+R4/OMAuZ4Oz2BeiQ=;
        b=vS0sD3ovyqzlVkEPYswrnm41q9LMf0sU1LoWQMBi+iNIcqEQu1Iczcu+NFSNQdJsFD
         qH+nZhw6bPAFOhdAeyhnxDyNTwcbGPrGPzegdlfxo8zlrmbcnsI8y8KEEAQNiibl71Br
         Br/Hb1GAFxUtBzrW03FPGREZWZlHL3PxbMQM5ubf5YACxMVo5OrjvEadyoChNEzQAimZ
         /RXFeUBrGxRg6cgNZC0sZwffR52uqrKtbkHVh6FknA17Z1NKo7DlGAcSH+NQXLeEIZos
         +6OmnJ/slyZjx/XOF5HZvdlt3+p+lSa8yJhIBMbdnxIKsmWUFovW/VPWka6LMslvbrho
         6syQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQlFXveqOYsqNrzZwGsvNlgoiBX+GGNj2l6aETdRZynheuGVTkd93i3PG2f8pVLUALkSwWHZwuKMlAzWc6qkJ+@lists.infradead.org
X-Gm-Message-State: AOJu0YzXLHNAYJXiULc4JVkN+gAIrC6AsuALgDDDBm7S5XREojWk/AkQ
	8amJ2PQQf4FBnVaelDP19mhU9jsBbo0gfalT0mro//jdRF1x7X/phrZ24u6uq+jODFxqEaCyFA4
	uoWqDJikASfnT/EJ4AArSm85ag+PwKZA+7lFTIGZh
X-Gm-Gg: ASbGncvrFtxbhk3R9B6g4BS4F+8sRE5mFl+mccw+5t0jOAII1y3e9zZS4go8iTeG71C
	T5Lj4AxGvUUKxvPTrQ1WX+8PbMdnSHJVT+DaHoslGO6l8DtI1vanBrOoDUQGQ+NPJWe6+1/ZEKS
	KDOk8y1MaryCMkRkaXct2tYHyJlps++IHGV0kcFEG+elzSYU+BzXKbZXYNfWhhYe+nnJEJt//R4
	9eeJgoL8LOoERcHcc+YFIZ93YIf3JPsDLM6U6jOuCJlBA==
X-Google-Smtp-Source: AGHT+IFh5F3sidBrknoS9iUxLce5fNJWzSFlFRbwYLI9hnCBtdEdWgKvCBxO6tc3R2KJHkeILhOZP6kccNtfJIF4ra4=
X-Received: by 2002:a05:6512:2399:b0:55b:7683:110e with SMTP id
 2adb3069b0e04-55f0d38200cmr562995e87.46.1755841410309; Thu, 21 Aug 2025
 22:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com> <20250822021217.1598-2-jjian.zhou@mediatek.com>
In-Reply-To: <20250822021217.1598-2-jjian.zhou@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 22 Aug 2025 13:43:18 +0800
X-Gm-Features: Ac12FXzfrL5PN_m3940D8QUKJ9xD917EzZ80ftFHhvgwSSGeG17u4a187tR07YY
Message-ID: <CAGXv+5GaJdWPFigVs-XyDZms_0Yvo+58p7N5e+-jwnyAhsO7bQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: mediatek,mt8196-vcp-mbox:
 add mtk vcp-mbox document
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_224332_561509_A5F82615 
X-CRM114-Status: GOOD (  17.09  )
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

On Fri, Aug 22, 2025 at 10:12=E2=80=AFAM Jjian Zhou <jjian.zhou@mediatek.co=
m> wrote:
>
> The MTK VCP mailbox enables the SoC to communicate with the VCP by passin=
g
> messages through 64 32-bit wide registers. It has 32 interrupt vectors in
> either direction for signalling purposes.
>
> This adds a binding for Mediatek VCP mailbox.
>
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../mailbox/mediatek,mt8196-vcp-mbox.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt=
8196-vcp-mbox.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vc=
p-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp=
-mbox.yaml
> new file mode 100644
> index 000000000000..7b1c5165e64e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.=
yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,mt8196-vcp-mbox.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Video Companion Processor (VCP) mailbox
> +
> +maintainers:
> +  - Jjian Zhou <Jjian.Zhou@mediatek.com>
> +
> +description:
> +  The MTK VCP mailbox enables the SoC to communicate with the VCP by pas=
sing
> +  messages through 64 32-bit wide registers. It has 32 interrupt vectors=
 in
> +  either direction for signalling purposes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-vcp-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox@31b80000 {
> +        compatible =3D "mediatek,mt8196-vcp-mbox";
> +        reg =3D <0x31b80000 0x1000>;
> +        interrupts =3D <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #mbox-cells =3D <0>;
> +    };
> --
> 2.46.0
>

