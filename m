Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C93C35FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIazsbhGjTnWVs4powPGcBo+ahU9A4azfZMflVf9GOM=; b=e7F4E5OEDOOAklT24bNORdjhFN
	GgEFeXbBuBC2MyZxyAf+VOd6UUmAcCOyeR8rfylXG4WVpj3LFug5cv7FOvJ1vhNPRE0nBSZ9c1Djf
	fLvGTgchKsfTZeY91F8tRN2Gozpf6e6JI8/ObYKDpyqwCYdASVGi1gMR1me8JjEmw/2becaIWel07
	v0r7r3THDaOaT3egUT5W9rSBusH6isXYHpRVBXP8nbEIysP61jGWMWp3jMdhORgJa9bG+AKrtcY0I
	8uQvazyEc5ewugnDqq4E958iK5toqMP3jvDvOWxlizr3xCAKwrK05ro3g8Q8VtreEVAzpmKG3eBKN
	vIvoE6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lC-0000000DXDO-0oRq;
	Fri, 14 Mar 2025 08:51:18 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0OP-0000000DSdz-0Vrv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:27:46 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54298ec925bso2925528e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 01:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741940863; x=1742545663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIazsbhGjTnWVs4powPGcBo+ahU9A4azfZMflVf9GOM=;
        b=YiU55JgMtLvgZCPe3231c1tzT2XANIl9pnoA9OC7kWL+Vpg1j++/StvAdIni7/nHl9
         ikNj2XPJe7UZLV5k1CgB4Ak2EcT5LqZ2vIpuOy76h0BxYOoZhl3bFXiVix2ExZ3pQCGo
         z9dJ3gZ6NIdVvofYwOFTaA0u/GMbelCKq/l4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940863; x=1742545663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIazsbhGjTnWVs4powPGcBo+ahU9A4azfZMflVf9GOM=;
        b=QI9oi2UPAd3GPoQmqaD410pBU6chpT671CWTO5xF6+6vNLklplMGUjJRHFNUs5Ys/V
         1rS2TbhfyEZ47jd3cnF0D0i2Cm1y6Ab7g1Q74/R9P6FaDcVqpzbw1tSbfdcIR+olyGWK
         p74HmgUZAA0nxRC2qGsDA2n8fALGRBuYBCMgao496sWD+aqGQ3byHoS31teoFZy97lsw
         m/KD7IUaV/xUH2bAFgE8TFiUDlPx5BXhABN1LY+Mk1F4/5LnbaRXVDP0Hzr1qybmb9dD
         c/vqcZLpkrdEHghetjeRLHfpjrUZHpVaDevl4n+sGPmyNF56twAkpGGxwjLXT7cXdblK
         /Hsw==
X-Forwarded-Encrypted: i=1; AJvYcCVli6uEh1cT602+jpV8cYm5H+2TXp733YSFPvshkBNc/0l08+AKajnSi/dc6yDC+EVxlK/Su6y1g76jNRsFAw1x@lists.infradead.org
X-Gm-Message-State: AOJu0YyoNe7KleHWWk6bJGP2Hf7octa6PQmgdIzQIZPEBwHpmne89Yco
	4n0vyMLdyOEzutO8jHuTMgFkOUkfbNCJDperzPMJZpMkpUMw1lp/dfTfaqo9Lg/ran8tU8hnSSL
	NaX36hzMTSfYc54Zfx7X3uENV38vcoa2hdcKs
X-Gm-Gg: ASbGnctPNYdPnqagl8m0GnUsBjDy0amH29SXtcqu8YzVkMZhRq8nECbnF9SvvC3UP/9
	+1o1zZxnSundhvjwI+iQEPYeAr699DQOO/m2QEaIe82amu3oxVy7QJ997dK4d0FQimCfOcB19QP
	5K9klc2vipBYCpxwKoUgTKad37GUrEf1/B7n+F1tPVqmtRPMcNbiKR
X-Google-Smtp-Source: AGHT+IFNFAiq0DF0mxEisHTLx9G59G5mtBKcvgViPsH0J58VO/6T1UIYLgI9JMkclJbxf4qIJjWLMm8EKW+D8w91aec=
X-Received: by 2002:a05:6512:2245:b0:549:4d73:641b with SMTP id
 2adb3069b0e04-549c398d3bdmr568085e87.52.1741940863125; Fri, 14 Mar 2025
 01:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250314073307.25092-1-Lu.Tang@mediatek.com>
In-Reply-To: <20250314073307.25092-1-Lu.Tang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 14 Mar 2025 16:27:32 +0800
X-Gm-Features: AQ5f1Jpo3FChFigHgYdppgke4q0-o7VP4uIqPhGPsM2p4V783Z7jAOTWY1--PXQ
Message-ID: <CAGXv+5EzdMtOXotGUNdwdP-cKPwMccH6kGDifpg+WgjX_2z2VQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add PMIC and SPMI driver for mt8196
To: "Lu.Tang" <Lu.Tang@mediatek.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Chen Zhong <chen.zhong@mediatek.com>, Sen Chu <shen.chu@mediatek.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_012745_180357_1332EA1D 
X-CRM114-Status: GOOD (  16.22  )
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

On Fri, Mar 14, 2025 at 3:56=E2=80=AFPM Lu.Tang <Lu.Tang@mediatek.com> wrot=
e:
>
> This series is based on linux-next.
>
> Changes in v0:
> - Modify SPMI driver for mt8196
> - Add SPMI PMIC mfd driver
> - Add PMIC regulator driver for mt8196
>
> *** BLURB HERE ***
>
> Lu.Tang (5):
>   pmic: mediatek: Add pmic auxadc driver
>   pmic: mediatek: Add pmic regulator driver
>   pmic: mediatek: Add spmi pmic mfd driver
>   spmi: mediatek: modify spmi dirver for mt8196
>   dt-bindings: pmic: mediatek: Add pmic documents

You are adding three PMICs at the same time. Please separate each
patch in this series so that it is one patch per type per PMIC.

ChenYu


>  .../iio/adc/mediatek,spmi-pmic-auxadc.yaml    |   31 +
>  .../bindings/input/mediatek,pmic-keys.yaml    |    1 +
>  .../bindings/mfd/mediatek,mt6685.yaml         |   50 +
>  .../bindings/mfd/mediatek,spmi-pmic.yaml      |  173 +++
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |    1 +
>  drivers/iio/adc/Kconfig                       |   10 +
>  drivers/iio/adc/Makefile                      |    1 +
>  drivers/iio/adc/mtk-spmi-pmic-adc.c           |  576 +++++++++
>  drivers/mfd/Kconfig                           |   26 +
>  drivers/mfd/Makefile                          |    2 +
>  drivers/mfd/mt6685-core.c                     |   83 ++
>  drivers/mfd/mtk-spmi-pmic.c                   |  518 ++++++++
>  drivers/regulator/Kconfig                     |   34 +
>  drivers/regulator/Makefile                    |    3 +
>  drivers/regulator/mt6316-regulator.c          |  381 ++++++
>  drivers/regulator/mt6363-regulator.c          | 1106 +++++++++++++++++
>  drivers/regulator/mt6373-regulator.c          |  826 ++++++++++++
>  drivers/spmi/spmi-mtk-pmif.c                  | 1040 +++++++++++++++-
>  include/linux/mfd/mt6363/core.h               |  134 ++
>  include/linux/mfd/mt6363/registers.h          |  168 +++
>  include/linux/mfd/mt6373/core.h               |   94 ++
>  include/linux/mfd/mt6373/registers.h          |   53 +
>  include/linux/regulator/mt6316-regulator.h    |   48 +
>  include/linux/regulator/mt6363-regulator.h    |  424 +++++++
>  include/linux/regulator/mt6373-regulator.h    |  318 +++++
>  25 files changed, 6037 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,sp=
mi-pmic-auxadc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6685=
.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,spmi-p=
mic.yaml
>  create mode 100644 drivers/iio/adc/mtk-spmi-pmic-adc.c
>  create mode 100644 drivers/mfd/mt6685-core.c
>  create mode 100644 drivers/mfd/mtk-spmi-pmic.c
>  create mode 100644 drivers/regulator/mt6316-regulator.c
>  create mode 100644 drivers/regulator/mt6363-regulator.c
>  create mode 100644 drivers/regulator/mt6373-regulator.c
>  create mode 100644 include/linux/mfd/mt6363/core.h
>  create mode 100644 include/linux/mfd/mt6363/registers.h
>  create mode 100644 include/linux/mfd/mt6373/core.h
>  create mode 100644 include/linux/mfd/mt6373/registers.h
>  create mode 100644 include/linux/regulator/mt6316-regulator.h
>  create mode 100644 include/linux/regulator/mt6363-regulator.h
>  create mode 100644 include/linux/regulator/mt6373-regulator.h
>
> --
> 2.46.0
>
>

