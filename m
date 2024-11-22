Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62CAE69191
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 20:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ckf1sy7y+ERbgNi2FYOx7SEt8Ku/lZuBUmVoETOpyc=; b=aYXkOE5HNwRLjTz7w8LGkJiFXU
	hGsIktwI4T3QrqS3jso64CyY6rgbEmA1pSszFop9/wESS4J9I7i8T6X2kRPecP3ovlzXgNMAAZure
	dLD6QS0Vo4ZxNpfRlBJnYYUFr2b/eCuE3UqbwbyAu9FQq4nxbOepsiyTPfMEb+MuTrk6Luadi40x3
	xnKBLrnMt6Q20KGVJ7N0USLr2s90+VJ29aJ92R2k1Q4BhSDASfXz06PGg2cseosQlzZ4tq+PGdMgI
	VYYbbOmUu7yPvO9dmlTTptj9mnx84SnbC0ZXT6HYrZCeM9z40Yucqc7M9ghMamITmxKJ8QzH2CiKv
	6VAG8Rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEaW8-00000003IWQ-41DG;
	Fri, 22 Nov 2024 20:44:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEaVB-00000003IPh-1vPg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 20:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 015AF5C5B5B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 20:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F38EC4CED6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732308220;
	bh=9ur4fx8g1n2aQGv6Iks60+fVeXS+jljxmXCqMX/FUJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WmJv6KhouoPjpYLnMmpuN8uVIn3pLQ0Vd7k2AQGH9abPMLZZhMmh9G6MWgp1q8m4I
	 Pr/Vc3akz8klX7oxufe/3NkQDg5Xqh7480yRTyKme5dz5LHpLPSreF2O7o0qcfwUdQ
	 pYpCWaGGkzeSZV6r3tdVuAQnq83X5DIBGBUrORRoVb+1zpbjA5SQHi4WbWgZjAuvqE
	 hS+XC/Ouj4fPKANKiMnRvsh942pLYXZ6agsarnLBIMOtl9595DP4WIDVp3LB8yBFRq
	 wlHudLoPFIOdYGvsdqu6nw/2VbtDWeGEJvzoOhab7RmDCoYYFouD97rsHObLFnfNiS
	 ypKOd1a3pR0MA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-294ec8e1d8aso2105377fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 12:43:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXouRnHFvmX6VEvjf6pufdvcKacVCXFdt/JJkiHP9kok5crtRPoUmcxS8LL9HLv8F2Xy2C/nAHGmXFPDv8X5Th+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8AsrgENrIs0aT4RG2wME5gOqg1vJAo0TxUXyET3Fbgv/z0uUm
	a7Y6eMY6elXW4g3Pa5sRHVJnpWZwhi2UVbM55kAFfJ5NnajsVTOJEL5JjX0n1SHPiMwl3fb6ygu
	uXd/Y1YmJkiSn3Nv9JK2L3l1gv+0=
X-Google-Smtp-Source: AGHT+IEutDuraKb6w9V+8CLjNMD2UYE+lNm29XfGmOiaTuVzMfm8AxFlD6kXcNxHi/+pw8cR8P3Zi9iHFF2EXbeKgV0=
X-Received: by 2002:a05:6871:69c1:b0:287:d8df:7c22 with SMTP id
 586e51a60fabf-29720c59d21mr4407291fac.23.1732308219677; Fri, 22 Nov 2024
 12:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 22 Nov 2024 21:43:28 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jjjA6enruipTU9kTnuA6x5p_XUQyXc-4Cr4bo_b4VHtQ@mail.gmail.com>
Message-ID: <CAJZ5v0jjjA6enruipTU9kTnuA6x5p_XUQyXc-4Cr4bo_b4VHtQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] thermal: scope/cleanup.h improvements
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_124341_590187_AA9E2C55 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Daniel,

On Thu, Oct 10, 2024 at 8:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v4:
> - Patch 2: rewrite, significant change: kzalloc() also with
>   scoped-handling so the entire error handling could be removed.
>   Due to above, drop review-tags (Chen-Yu, Jonathan).
> - Add Rb tags for other patches.
> - Link to v3: https://lore.kernel.org/r/20241008-b4-cleanup-h-of-node-put=
-thermal-v3-0-825122398f71@linaro.org
>
> Changes in v3:
> - Rebase, because there was bigger rework in thermal code.
>   This made two patches obsolete, but brought new one:
>   1/6: thermal: of: Simplify thermal_of_should_bind with scoped for each =
OF child
> - Link to v2: https://lore.kernel.org/r/20240816-b4-cleanup-h-of-node-put=
-thermal-v2-0-cee9fc490478@linaro.org
>
> Changes in v2:
> - Drop left-over of_node_put in regular exit path (Chen-Yu)
> - Link to v1: https://lore.kernel.org/r/20240814-b4-cleanup-h-of-node-put=
-thermal-v1-0-7a1381e1627e@linaro.org
>
> Few code simplifications with scope/cleanup.h.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (6):
>       thermal: of: Simplify thermal_of_should_bind with scoped for each O=
F child
>       thermal: of: Use scoped memory and OF handling to simplify thermal_=
of_trips_init()
>       thermal: of: Use scoped device node handling to simplify of_thermal=
_zone_find()
>       thermal: qcom-spmi-adc-tm5: Simplify with scoped for each OF child =
loop
>       thermal: tegra: Simplify with scoped for each OF child loop
>       thermal: sun8i: Use scoped device node handling to simplify error p=
aths
>
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c |  7 ++---
>  drivers/thermal/sun8i_thermal.c          | 11 +++----
>  drivers/thermal/tegra/soctherm.c         |  5 ++-
>  drivers/thermal/thermal_of.c             | 54 ++++++++++----------------=
------
>  4 files changed, 25 insertions(+), 52 deletions(-)
> ---

This seems to have fallen through cracks.

Since all of the other 6.13 thermal changes have been integrated now,
I'm going to apply it and push next week unless you have concerns (in
which case please let me know).

Thanks!

