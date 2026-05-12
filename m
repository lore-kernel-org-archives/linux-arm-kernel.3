Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60946CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=; b=Yu2UiqnpLerEZu3bpFi6rxXCFT
	ATsO7jyAwR3Nzkz8qhDIix1UC+AG3BLU7sAoCSqWCzDsj9krs7twFn1f46mhbZC4MC3nF2fVxkBo2
	woB3E8zIFMWB4wh1tpXk6FBrfrKV4i6AbrnmO6kw/QvhJzOdPtiLt4/R/1527npfYNZalqLyr9qVj
	ZpTySugiYW5jxg8iWVkMTWT/XasnyC1qZ6pr/VdA5GNIyUKz4+5XmJDA0KNdS+BVKq4wlRm/TqEJu
	yWVfkLd0lRWJwkpy0cyXegnAwSqa30asMwLhmUCJe+J1fMv0IjQuRp7Bisu6wrYll77M5Vx1ySl1Q
	wBuciM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMguo-0000000Fp9a-3blW;
	Tue, 12 May 2026 06:48:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgul-0000000Fp80-2mvf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:48:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-bd24f466598so109673766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 23:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568502; cv=none;
        d=google.com; s=arc-20240605;
        b=VMJQFr4GptixRlEMEvqCO3GcxfzyIN+f9CT0DIzo3mdH4uHqNfJn6Vd0rYHnb+V57Q
         1sG2XS4WLLTFX5+LbOJgZ837+N8fAGsgIf7rKIzYPIBFdoT6SGD8zc8lPhIV5DamwZk4
         SbBNEK+Fx41OVY2wnlpLXlxCh/8fHx6VUl/FJKW9iq7cmPO5657WTVgMsQwQxGO42JF1
         riYTWsHr9fbvwDrhRQb8VW4GlJhl2ekgJR8ZUvu9RM1+bt+Vw1zd3v+Lngb08WaevIkn
         ypwAkiULqZ8O8FMxuZbrmkHx3yPDzOlEORrJJvsbSIPn0s2dmO8ZuYMHrtm35WQc4yhf
         QRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        fh=vymcWWvPvvDShoQSGqNuZtx+r+hVc1gvajIUJBB8dDg=;
        b=VzgN2S1bhDjMYM9eSk1d1QCmepDkRO9VwDk+U/rcF2DXulvQxQeMPosvIT/8tS2Kyr
         jdudOLsP+icU5HJNW0NKsUni1rYvuz8jr3vLmraXwfxiFdx+zEg2cCRpxt40RbmUjjtE
         MweaYuayotKCtgtNqllThJ60pKZ5Y8DguC8XyXke+7jzwmZsnsZG/qgU5YVt8p55yuEh
         8/hkPuNDvfrI7/iOqhQzsFQgf4tuUjkXUd7BKA4MV8UaLVH5CBH1njch/ZwN20rEovU2
         YOaVHSXJyJXfgPLOEUy7Va93XhDMhQHosLmIAehCZDjbti9+CGFcNL7mEJpnTl0OSsOQ
         I75g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568502; x=1779173302; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        b=n81xxtHAKL1SV6dMz4L6vzRgskHahjmcac/RbyNUaUQb8PUwlYuuLVO9f4LxS5Ia8e
         6kvSWA+A/7hNd3k7PDXuvhfmH1O2qqtkm66/Icx2Xzg4HfFhqa2VPYOWyoMt3qcTXnJc
         kuzwEXpPz8s/vjj53HoL72TmWTpUGfPvySwLk79/o6iqfVgj7mOISDzM5muyirdX6/gp
         rSlx+lXlbhUHVoENWdY6czD3hS4XrXlyKr/GjMOAwo+Er5ThCMXEP2BuB1L1Dmaxbvgv
         ZaUuSpAjUfr0FBhNWctlZiF+ydFXlw1IgP7L2mzHGOUabDfKnEuGG+SGHD9Ot2Q49B3l
         +nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568502; x=1779173302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFTa1Qu4vivHMZ7h/kjmMuCcTIeg1RKlZ789oyl3YpU=;
        b=M4xc22KH+788HqJdeCz2q+PtD4SnR8LKRyFSy1rIvobdpcZAJNCDZK2+GgkN7p+QuN
         pIsB8CmCxK+W11mMN186ztAFMJaULMWvozdc0yRj0eLDvOZgGc4AtyjVC8yyU5StMFF6
         XRLKKwd57BI1JdC9XJAhTqRzERm6NMFLz8cVrGg3RHJ9J3tPL6hBm3Tkpkcy7Qqg392l
         +whpopBxIb981qfCIR/5hw0GLyFADBOcV0awxpQKW7r3Tr8FpejjfR4N1RBMrgRWRQJC
         BJymE/B5MYNg+DyjPJCF9F2xnTwXNwVRLhrhbbfFPwLuG/K5afHhW3AE0uPe3w4NfF9K
         C7uA==
X-Forwarded-Encrypted: i=1; AFNElJ+m8EROjLhtTdyRYs1dP59Dbkwn2h1nxqM2QaWGNkgowmJiOq6AGgVUxu8z46rujhb7Eqb8y7LLoY/H7HhbUuzi@lists.infradead.org
X-Gm-Message-State: AOJu0YwJjRtJ6YB0vBUgYyT4OcWU72umkbMqGqh/JLTklaLsZg/qdrrH
	PyKZu421OyYHxc7swwplYG/aBeF+B2Z64rxot1HJ68ns6VZoxqHaibLE/JszLVM32iMgfASNHEx
	xtNethHmGqlqmMQaIkdBXBQhZVHHU/rw=
X-Gm-Gg: Acq92OHNZMyTmVCgeegS87A/CQR3Hq9hEpEnIcf2IP+ksheoNuC64WeeZOF7CmTMndP
	nbys/7LyP+rawR+pB8dhMD6BSZ7LMRb9jttXErxUub3NVRZfENWZSBmjYQDDRofOGgU/yIedg3R
	ihCC7W4pPgWgUs+ZjK8qPiYvYRdWYK3UW6U4YFXSNHg9kHFUCUrMBtea7Eqiny06dNmzrIK2nDU
	bDIqk5tE5VIggXr3nFCA6wU0vBRNtc0K/ZBX1iyws+el1shGqrFnVr2cUi6HYS0SXJLIGfO5ILG
	d29gwluMYuQ5HnZ8jh/5BJtx/bAERFeBAV9EBAonhd+O9q8yGRYH2/oa3nOqj58AkH/Fa15mhQD
	ogi/3Xbc=
X-Received: by 2002:a17:907:809:b0:bca:48de:5cce with SMTP id
 a640c23a62f3a-bcc1499a53cmr609442966b.36.1778568501606; Mon, 11 May 2026
 23:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 09:47:44 +0300
X-Gm-Features: AVHnY4LmZe6op_7Q9Zb_x2R3mJ89A3uDVU-76OXP9otXVwwfDX_cH9Q0T5k4R6I
Message-ID: <CAHp75VcR2pzdT-JbNXE_nOM-XC--4y8D81tk+7rvjA71ugTkzA@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] nvmem: add mt6323 PMIC EFUSE driver
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_234823_721096_97BB1BF0 
X-CRM114-Status: GOOD (  14.76  )
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

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> thermal sensor calibration values.

...

> +#include <linux/err.h>

> +#include <linux/errno.h>

Doesn't seem to be used as err.h implies asm/errno.h that provides
basic error codes.

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>

...

> +static int mt6323_efuse_read(void *context, unsigned int offset, void *v=
al,
> +                            size_t bytes)
> +{
> +       struct regmap *map =3D context;
> +       u32 tmp;
> +       u16 *buf =3D val;
> +       int ret;
> +
> +       /*
> +        * Manual regmap_read with loop is needed, because PWRAP is not
> +        * a continuous MMIO space, but rather FSM which doesn't implemen=
t
> +        * necessary read callback for the regmap_read_raw and regmap_rea=
d_bulk
> +        * functions.
> +        */
> +       for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {
> +               ret =3D regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset =
+ i, &tmp);
> +               if (ret)
> +                       return ret;

> +               *buf++ =3D (u16)tmp;

Why explicit casting?

> +       }
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

