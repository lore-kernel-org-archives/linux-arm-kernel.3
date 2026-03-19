Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F2D1088E76
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 04:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=; b=SbAu+OMDL3IgW6omWMpirCaRs7
	jx3d1YqaUERsJXuGx8/jcedVshjad8ZX4mK+NaCdiy6zSTOQTjzd+9S4lTH6TBCx0eRhjMFSLBzI8
	TRYlNBLk9sbeKwHU3U1NOOVl0IacNEyM9T6Ir8pQ78b7y5CtoaxqhFTb2oIQval/L45ULxpO8XacY
	jzPEDdfIsMbT6/gr57cfFkrv+eLFJwnSQvdeqMr1y+85xZFVXg0NluGpvx5u0Eml3ZQMjtv7DF5Oi
	AjnhCYd7f68TpaSdEVVKDwKo3ypMQCkoDYd9fu1+Q/gZ0Jzr3l1EOtQT1oxsRK36dyXdPrfMW4IsL
	BWhA7BNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35RX-00000009vHU-30bw;
	Thu, 19 Mar 2026 04:57:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35RR-00000009vGS-2cNd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 04:57:09 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a27a2fc113so500734e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 21:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773896223; cv=none;
        d=google.com; s=arc-20240605;
        b=hOs/k9khu8E14xgU+MvUuelHTdM2eV3TZI0higJh9O89Eaht4VapjjGzB5PyzAuRgW
         7J0BmSq6lVjdNycVupYHAHV8oXTskgn5tEC6dTtQpFr8byA75V/8Ku0dkrD6qQ379nl2
         VF1knQh1qUm7tFHwOtR1j6T9r65J26cZXRJ2S1aHLU5c36hfXQ5NoyHcK350lde5UVww
         jXVycQl8nIGJr5Mi4QFI9gbgFrv/7PNxjblSxs2JwFXlVpMbH1KKXEUD8XVhppwpuyGp
         LOEF3bzC/JYPMLxkCI6u9QSl2+nLc5/ACHuPfF4+0Ts/H9kWXeyVkjw++UDLiPVePfRF
         ia2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        fh=g4ftUEvdp2WLKvANv+uHCsUq1nOJ7urMPKrc2D67Gfo=;
        b=F8+j0LlIwvGgbj8pCP1WVfoedoky9himjFQlK4nmNVR82QHOqBKJF6A8IQAsCl4/Be
         qK2p8P06bnEDi0Y1ZsxTjxPHssOn0vRTRYH//oV5E/DQ6TZFufjnuJFhLlh7v4WgNKjZ
         o3KdRO6yeO3yg0AIMSCAvJLxOBNqgRqOuVNB7ObSp5SVtjkjbQ6ezp8ByECu1wlB+ANj
         EApPvc9KngyJ4p8xKvMFeyM7Y0UCG2pK1AW3AVLjtwPT+dTg7KjHS9ZKuSX+X6wRI+OO
         tGdr1WsOgwDr/psF4eXAoVk+PHaFhUEYE4creLIS+AgCB12kzvF0JUm4PdOEuZqNTTxk
         jDKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773896223; x=1774501023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        b=PzGY07zHi+OXU0s9qM4NO/g9DnS8KnwHk3LWWdESAVn7GvajQ6TjP2JJra0o2QkHaB
         Dob3r3flg/0FtABJv4aBvh+HwZyAHaXiDF7ZG7cPj8HVte59Nobgx1bzN6v89Nl00LWL
         a+lqMQD6D8uDh4A5VwJ4Lv8Yg2Jr+2P199lvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896223; x=1774501023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        b=Mm9fzaGatJFbcqK/3oe06vKaV8UNO2yuUxWeX5bh7mZ8V+VtkQOreLOC7TS0Fxtnf7
         d2grsgp5Db+ZmkN1Gy42Ta+2kMV+u33yh4vSBw49sbVEuibh7Jfswy9TJwDugWwl5b6W
         riIeWcz1N1lKBH1HHH2XXcElG9ZXp3qCdnLii4DhtPKsur2eZPrKspos0SPh2m0ELLOK
         ieOmn4ajb+LWoajxlYJlRNu/D/kiYbGpC6+WjzkWpFhc2xBY/8U7oWWJFzxoIlehLfF7
         9xEG+xE3R9h9pAiW5o0aV6jFqQtq8JLrq565JWyA+u85Ps+IhUmNelqQJGAeSbU0feuU
         k3wA==
X-Forwarded-Encrypted: i=1; AJvYcCV4jdqjmgR0szxFY/P+yk2z1VU+/NxTuJjMvrnbQGyfy/fP70FY51JuRAij0gXUQjELcuVG3RBDhh6zBvoBIQga@lists.infradead.org
X-Gm-Message-State: AOJu0YwCRr96P9sBN5QFoqCYyj3WsxwsuI1i9V73yeAU0YcT1PpvUcSU
	hN7rCBv4zwhTnSgclLMxF3aLbKU9wQQSC2QPq7SAMM+l5wwDyTL1iSALNEfyHHWQjknd+5Mv06v
	3IrCiRsfXLsRldGVfv0s1aw+A50w7D2mZmgffZGYi
X-Gm-Gg: ATEYQzzZ/uVJ98Y6UQlP17kMhwvNFGm9aqgnozIDU48WSmz6TM6IRzsgxdlulb9Jn5w
	8GYgXKx9KutLI89ZnyGqr7gT6Cy2LaTdGoYRsOjmrKgGYzPUJ4rWZcuKwaZQPmiN/dOmSgTEIKa
	MW30XQIr34oMKvtWIWkVixgQa75fb6pTBxAjEGXrsWcBfxINxdDmZ8W34YXwE+0AgoqjfLn2VvX
	lbNNH1kR7uTYZfaniHcE17uO/tZPWvhO8D7Oe5KnaRgJMBVJPvE2LLpIH6vkOyB17MRlFGQjD6r
	ow20jIdvp6bJ/+lJsAhaitzvn6BIN7tA04Xx9Q==
X-Received: by 2002:a05:6512:1598:b0:5a1:3561:de7d with SMTP id
 2adb3069b0e04-5a2796bae61mr2319165e87.41.1773896223417; Wed, 18 Mar 2026
 21:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
In-Reply-To: <20260317184507.523060-4-l.scorcia@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Mar 2026 12:56:52 +0800
X-Gm-Features: AaiRm53ZcC1_5GBB68m3xy0r3oGl-8GEHHuCoUTvKM9klv1nQiqkqQTd8EeYleI
Message-ID: <CAGXv+5Hz6JHBTX1ftxRuD0pJuhxGJnAkGUO7=kUh3fErOLtXTg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_215707_520367_3C84F3D5 
X-CRM114-Status: GOOD (  17.29  )
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

On Wed, Mar 18, 2026 at 2:46=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     |  24 ++
>  2 files changed, 342 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,=
mt6392-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulat=
or.h
>
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-=
regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt639=
2-regulator.yaml
> new file mode 100644
> index 000000000000..fa4aad2dcbe8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulat=
or.yaml
> @@ -0,0 +1,318 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6392 Regulator
> +
> +description:
> +  Regulator node of the PMIC. This node should under the PMIC's device n=
ode.
> +  All voltage regulators provided by the PMIC are described as sub-nodes=
 of
> +  this node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt6392-regulator

Please add the various supply rails. This allows you to properly describe
regulator dependencies and have a complete power supply tree.

They can be found in the datasheet.


ChenYu

