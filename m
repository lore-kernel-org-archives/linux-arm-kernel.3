Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B0ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 23:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=; b=TUrLazmygsj8ItuHfJ28QjgkiY
	eMOGpRcPoGztZ2E/JSL42cZ+XrED/lU46xZ6TK4KNQNdh5jrbvFW4gT7w462VwPFmpaotqJFsWW57
	m0C3qfkwbGIHPBVioH19mGT/Qrm4yu80lU1umle/GlnXJAAe18ScF/lU4A5rGm065c0Zk6+tLF1VM
	9uXDj/luFOZ/oliLXfXrko0n1KVAA6rxTQR1pXxh1lfEDx4PAt1536PSzOUPG5GG7ljTE0VLwR505
	NDTGO4lUeu6FzlS2uirNcsw/PFc0UaBhreCUSdxXoGkpfRQYTXKyQeIlQPcfKCYFe5X9ALiTiuYb4
	ppY+wooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbPY-00000006GHz-467R;
	Mon, 10 Nov 2025 23:35:00 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbPV-00000006GGY-3b5R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 23:34:59 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-594476f218fso2612302e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762817696; x=1763422496; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=;
        b=pDlN6NHq7HRBAcB0ndjWg+tLZz3fWzzLnieB6APUNphblt213+EQZJQvpsGkFiU5qm
         MkDti77xRdiJvaL/i9UAQBg6yjvNUf7uw/Hi13rWZRY3nEWgqRzH4UvtUhm1PDcjcDpo
         vXaZaGzaz+S2sJNI37I0CFcBI3WQ713AJmWBuMbKGEROv/hhY2+FvOS1eot6K6sR8xCF
         dKS+cDZsf6vUYOr1sDMYGH3MiGgGPwCVVrKtRPNSn7XS/n8U59kXYnW1oJ4d76Xaea8W
         GsMFn4XutPcSG9oPBW4O4ZxM670ZQqUlEqSA6F2l7LuxLJPb5U5BVG8rnnteu8MD5uiI
         UtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762817696; x=1763422496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yhp78e/c+JzJpivrf0ZSW9REEjpcgf8Be2/rchU61Pc=;
        b=hrN9gDF5cB2RcZZrY7h1jK76F0hUvZue7FwjcpeBgiAFBd6ZVuPyqLTxoxO+6AGIsK
         4GX1JCdSHCTqeKuxa3An/m+ZxXmTb6Yv16St6opDBGQuwXJtPSpTmQAr2o11gNsWkHHi
         wAZa1FfQKaPspKrDn+9vk/jeuDB/2zWDflbM2QizVfzskQu2Xs57W8NMshoIth8XpwKm
         IWMYGDiMK/L+FYkAwwxnNqEee/SqC5c2pnlCIbVM5lFW/tRX44tK7yS/MN+W0q2s+NYK
         PgQ6/Dh8l78mk6Ep+3tdIu2XXFyPmADzjsVEEf9h9i8FO5GyXIUX0tyxnLbtW4uINBQL
         kdvg==
X-Forwarded-Encrypted: i=1; AJvYcCWxBK5WikGSh35Qhp0GKU/BUlwQapkQSE91GCC414EY0vxyZphQtS03+ZDts2z7nStQN0e7K9piYPtHSk91oBiR@lists.infradead.org
X-Gm-Message-State: AOJu0YzU6ECyJ1Zs/IPpTQe+rkOwyWqTik4minDaA8Ni4eq2RD69qz6B
	/3FwAVnYyAydzax/geHPYjM83NLpe4H3UL3xm7rHbQPHQNda+aTSQQ4F1CEzxkLoW6TcET6rbqe
	Fr077VG91tfHQX1YuMQOY3ujnngIqtNf4tJgd2PRzRA==
X-Gm-Gg: ASbGncuK9V6iqNSjA8i43fWxhuZp3MguYZSLPh3JsZCcImTQWPIp6kB2j7gWScFzAQQ
	Bd+l637+wGII8QGNqIoc7LSNa9SM0w4GViWT5edPVyiRoM/p/XZBmtkQMLPMtVUKX9USL8JfRFR
	0wjF8yn4UVOjj6x1FivXlACcvxsYSirhmpjvyv3Zy9xZDChtSIrytbCiWxejroVEreXidXhSajb
	OsJiiNvWXpM3Lt9r4wp/qbRvBWXt8IT8U4dIH1GOZdGHjMZnantuVrvnLKNIcISo3wq34I=
X-Google-Smtp-Source: AGHT+IG82Mi1A98FfG7yJz0vIc3+2ARkilByhg2O+8Fl+qHjePdN/o/dGr8Q9VvGwKtcezeBk+2GUuqJSQeCVKslfy0=
X-Received: by 2002:a05:6512:130b:b0:594:29c8:9ae5 with SMTP id
 2adb3069b0e04-5945f1e54demr2482118e87.53.1762817695621; Mon, 10 Nov 2025
 15:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20251105195007.199229-1-linux@fw-web.de> <20251105195007.199229-2-linux@fw-web.de>
In-Reply-To: <20251105195007.199229-2-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:34:44 +0100
X-Gm-Features: AWmQ_blvjYyNcyzASnRUO_VL5niJ7bbXr0Fy6afKuC--gzCCa6ihk2uw5R5x_5g
Message-ID: <CACRpkdZ6wJGRhobbTxvm2ZstHA=P4gaUsqvdm3_n1tKqWJ=50Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_153457_910531_96C6D880 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 5, 2025 at 8:50=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> w=
rote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabo=
ra.com>

I already applied an earlier version but it seems identical.
Tags were picked up.

Yours,
Linus Walleij

