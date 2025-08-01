Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E30C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htF75GZq0w8gN2mFjIxAXyCVQ/hkCUtjFwdvPNYh4nE=; b=KUVP+z2juOvI/SnIJaLSInZkrJ
	UYbalcnaQh670xOVMNAgFxBBBZmeRnwFsPUL09gfsj86oCNRlROnq8TXkFFC9fYUrCuylD1l9HuuZ
	fam/0OCuMhXSGJQ6S8MY8fwfOZ7An2kixgP2rnRlZiTe+AXv4nI9yhYWuyMB2hhnYVBABfHmA+9xV
	IbDty/yWYpnqwa3kV21yaePPWD9NwZ5WyEbQBgYUPSJbvInHAta/kVRmOJ9GWwu9yAEwyyM2Pav/P
	9FdGm69HHvpiBQV9QT0hyf5XFjVe8fwG7Kj8yCMlRBQpjJ5oMRyo/OWnKrptytn22nnrLTLaOmQFJ
	Ja6ebScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkWQ-00000005Alu-1mkW;
	Fri, 01 Aug 2025 07:49:46 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkEN-000000058kc-0QpH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 07:31:08 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55b797ad392so734169e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754033465; x=1754638265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htF75GZq0w8gN2mFjIxAXyCVQ/hkCUtjFwdvPNYh4nE=;
        b=ap+b6TN8P2aszs0IsqwHzVKXoWTYa9hIaukaJSaQoCftt1bIKJ9VSigXtjbyFgGe/Q
         BKnUFZmf3mTLRV+KCimNY2u1DuFOVcY6TOPlPvLBtvfazDrwC39qgG+7F5XtnJOgAU2w
         15I4rHSoaiD0u7/6My/IdbRFhYmfmhM1uWrZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033465; x=1754638265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htF75GZq0w8gN2mFjIxAXyCVQ/hkCUtjFwdvPNYh4nE=;
        b=hsqygeNtnmzrP8syMolxbURXH9b+BdGDAr5261ANpe+KLHJWlKOHj3iPOsIXK+o1Lj
         K/eY9VomYMLuG6DRpTX0hU7KwHFU16s0GSF4HGc85zmBNZdG71Uko7jNNfTZdQQiljyE
         /S/Z7LSdrg4UH6TI4AQraWMsKLkDNWdjecEX3tR3pVXkIgGt0PHde03UaRw6k1wtb+tj
         swPgGkFgcoZ9vlNQD+jFBsosIta73AP2FgNHMNaJGcooS5IpuSLHmQpduE5PJAmJi17x
         u34CIm0B21MrtMvltGCdT1TrtWzgHm3Jc70RI3aSfIasl1w+dXdDgbKBfwck6Uo2aySy
         21RA==
X-Forwarded-Encrypted: i=1; AJvYcCUScy5nXShg99CIa3BhLzDO2iebtesGGyQV8iRaZMF+pU+vR12SHcByAFP65M5NCrMKyfyRnrqnX4TJlhLEbxB6@lists.infradead.org
X-Gm-Message-State: AOJu0YwaRM0Ch9DNmbohCF7hAIsrFNf/0iGdh5Za9uhkRm6Qhn1o2VZK
	SZJw6/gYv8C7WUI/pF1m0A33olExoSRbXIqNBMwXxOzrhmh/sfgWNp+OKrn4wQJixOnjCbjgyg0
	JJStlInuHCWlArbxy+YUwjVIsg6wWv7roJ7N6l9HE
X-Gm-Gg: ASbGncunT0Xu7p8gryPokSqGt1z+eoOc6o3uJJ4Z7Zs/1Gbl56C6WGcbTKsAoPF7oNT
	+dwtdDRKWFwFWs3FTnFYISm+fzcoNJKEjVHtsqHaIhEP4U8dPG/OLeaEBbeUj5moxOmW/mNDcXw
	tgaxnb8cVPF5yZbW4KBrAy8bx/3bFMhqCjIGWI77SkEgFFppytwMVk2C/y/FfObC2ywV3v6o1Ql
	7MWv5m8chnn4usm76gpO5Mqao2ilwkytrI=
X-Google-Smtp-Source: AGHT+IGf+XWnJSS1ofdtRG4xXIiHJgHkwfLVUEtsoVjwZ6AcLoQT6SI+5n+wdM88xlKeQgIZ3eNKpD6h6k9lnfP4oTc=
X-Received: by 2002:a05:6512:3e17:b0:55a:32b7:6273 with SMTP id
 2adb3069b0e04-55b7c08a13amr3066799e87.39.1754033465235; Fri, 01 Aug 2025
 00:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250801070913.3109-1-niklaus.liu@mediatek.com> <20250801070913.3109-4-niklaus.liu@mediatek.com>
In-Reply-To: <20250801070913.3109-4-niklaus.liu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Aug 2025 15:30:53 +0800
X-Gm-Features: Ac12FXywJYCGCnChotG_esGvBZERmatIw20FKLlBH7Yl4ATPob-8dBgyN2iGj1M
Message-ID: <CAGXv+5ELHjc_egKVyNn4kqGfoj0jRxcmzP7H5VnE3dSv-YcERw@mail.gmail.com>
Subject: Re: [PATCH 3/3] regulator: Modify mt6315 regulator mode mask
To: "niklaus.liu" <niklaus.liu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_003107_240430_BC92CB3B 
X-CRM114-Status: GOOD (  19.70  )
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

On Fri, Aug 1, 2025 at 3:20=E2=80=AFPM niklaus.liu <niklaus.liu@mediatek.co=
m> wrote:
>
> Modify mt6315 regulator mode mask, compatible with all 6315 models
>
> Signed-off-by: niklaus.liu <niklaus.liu@mediatek.com>
> ---
>  drivers/regulator/mt6315-regulator.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6=
315-regulator.c
> index 2608a6652d77..092ff748fe21 100644
> --- a/drivers/regulator/mt6315-regulator.c
> +++ b/drivers/regulator/mt6315-regulator.c
> @@ -218,8 +218,10 @@ static int mt6315_regulator_probe(struct spmi_device=
 *pdev)
>         struct regmap *regmap;
>         struct mt6315_chip *chip;
>         struct mt_regulator_init_data *init_data;
> +       struct device_node *node =3D pdev->dev.of_node;
>         struct regulator_config config =3D {};
>         struct regulator_dev *rdev;
> +       unsigned int val =3D 0;
>         int i;
>
>         regmap =3D devm_regmap_init_spmi_ext(pdev, &mt6315_regmap_config)=
;
> @@ -247,6 +249,10 @@ static int mt6315_regulator_probe(struct spmi_device=
 *pdev)
>                 init_data->modeset_mask[MT6315_VBUCK1] =3D BIT(MT6315_VBU=
CK1);
>                 break;
>         }
> +
> +       if (!of_property_read_u32(node, "buck1-modeset-mask", &val))
> +               init_data->modeset_mask[MT6315_VBUCK1] =3D val;
> +

This needs a matching change to the DT bindings.

However, please take a look at Angelo's recent series [1] for MT8196
PMICs that also adds variants of the MT6316 series regulators and how
it adds compatible strings for various parts to cover 2-phase, 3-phase,
and 4-phase settings.

Now personally I think a better way would be if we could somehow read back
a) the part number, or b) the multi-phase settings from the chip itself,
and derive `modeset_mask` automatically. Is that possible? Can MediaTek
share this information?


ChenYu

[1] https://lore.kernel.org/all/20250715140224.206329-1-angelogioacchino.de=
lregno@collabora.com/


>         for (i =3D MT6315_VBUCK2; i < MT6315_VBUCK_MAX; i++)
>                 init_data->modeset_mask[i] =3D BIT(i);
>
> --
> 2.46.0
>
>

