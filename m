Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4027C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIx/s1fLM7oASpmGNlYR11nYoIb2Cm/n5JB6pYZptGc=; b=o+bhkOXke0W8X/KxF3dwv6T2AV
	uj5T4ZD8qs8o9tZw1QqcqiN71qOu+VCFea8ZkXMZQn/asLX5WzXHiOBzsf4H5f0AXHOBaddaIXMaP
	y2Rp8PpDHfGeDK7VCN4SMOcCfaiyQYtTezvApzl/hyGZgjAUaXi+ZZkGx3matsGWjAEsr7N52t7qo
	c2vWMz59qCG2yHQksIHgzVi14Dt39goXMkW0WWUqtdPlIsQa4pmfxqKSjWoWM0Sz6TQgMUL/dWIVA
	4TjcGho3EJiVxgUuEFe8HfwlwjHkmeslCHcrRQgoFhpA+FWCQE8HL0rY73EyrByHXsxiuA0WwY0gg
	dFrS+vpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8y1-0000000HH2Z-0UPQ;
	Fri, 13 Jun 2025 18:17:29 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6sv-0000000Gzsl-1QHD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 16:04:06 +0000
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso1917216a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830644; x=1750435444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIx/s1fLM7oASpmGNlYR11nYoIb2Cm/n5JB6pYZptGc=;
        b=YGBwyKhdenQ10dOLbaX3pJc5qRa2qCjBN/wDTiIhj7y9CPMRcWC4jBs+HMj13BxtsP
         Ocqooe2tyYSjYOPrLuKUp3UgrXvYdF/9j52kJhde5HqzqKSvjb21Y0M01/0pBkXqFvIm
         YRMlAEIBEdQDpPh73O4/xOG3blKXBuxr2aLLZAnOEK5RbqQm4GVf6bxLhZGZrhSbPyyv
         +xrU3qMrJi/roFtwoHDx9mtqO8dphL81a/brNVcQRqOj8Mq9sq8IA22BjE7QR6vsgMY+
         +icVA8Lto7iWN+dbRJ5cWuGPZpPuCmyiVSqVVin/Ij6tUWj1OPnoMvdK/MTZ5eEM+2En
         xQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830644; x=1750435444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIx/s1fLM7oASpmGNlYR11nYoIb2Cm/n5JB6pYZptGc=;
        b=NBl+ENFO7drOzdii0wZMvDk6v/2hfDktEBD99MwObupC2woNFwn5W7BKMq+f6hhqoM
         gvb5vgQtZbljskyyueY2G2HwIozbgVTBF531OLbSTD4X47UtAFSiGtWoWr0R+GuM6PFQ
         Xu/nyv+106nZ0xyl6yf7xR5iRVZqW2+46lc9EV7IL/osVzwJzDTPXBYIkqvLKb9fv+so
         Zacc2xvEdD8CF/KFr+U7vUDR07hT1Mme3h2iIMxAmJ6lfwApcYSABgUhFA0vcbN6jKhX
         nVHVF0/LLE9a+odtQDAHlbmv7HazuTxsd6XMryPg+R98d9e9Jloj068N4fIYNHa9XUiI
         2odA==
X-Forwarded-Encrypted: i=1; AJvYcCWy/3ZoEIVL0kcwWCsEmWqyyj01ShIxcl0PJYzO2Qpo3/6LxXIVquzyRNgBdBo23XlaOYUdwTsPq+FqJIHZOOdM@lists.infradead.org
X-Gm-Message-State: AOJu0YzhQpQx3yqRZVdo1ljje5Xa4qjMrv3h1CYjEdF080y0nj9cNbQV
	z1mF/bhLeeRANlvDvArHXY/XVqvT69pZlkOkhU6iM9HTwDKiMyYXc6RXBXmBs7wmw4rToLOQ+Vc
	U6OWOCmI1uBdjmEWWL6LDR8LGOehVg/U=
X-Gm-Gg: ASbGncsooRss6PcfLLgfMbfqGCOGGflHKF/tSvO0fEF18L1a86L8fD2WuJycHjVtHW6
	vVFU0i5hB7sjMdAPEv1ZtsLnqawrmIFkWSryVEAkF62GiQpgeptWlXtijrZAoMdsfiJ4z6aCpWb
	AMvVMZEba8/SWrVOTzFqmf3e+Pc6zsgLya2+jYgkRe91JP
X-Google-Smtp-Source: AGHT+IHFgiH5HjETXUszXCCwzEfhtW8cTqAP7ltCqcNEVDNkL6tPknfSKyxzH3jtTc/k4SqGh4wjfftSKNIbMh9mxWM=
X-Received: by 2002:a17:90b:5150:b0:312:1143:cf8c with SMTP id
 98e67ed59e1d1-313f1cafae6mr392935a91.16.1749830643828; Fri, 13 Jun 2025
 09:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com> <20250613-bbg-v3-5-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-5-514cdc768448@bootlin.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 13 Jun 2025 11:03:34 -0500
X-Gm-Features: AX0GCFurF1g54l3WTWzQbUwvJlyASryoeejULyaNk0cqsLvcLVcw9tytAa-3sIo
Message-ID: <CAOCHtYj8QsnzEKV8qG2_8CDuYzN-fUCdoN=YEE_EZ37yvEQ0yw@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm: dts: omap: Add support for BeagleBone Green
 Eco board
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_090405_376711_4D1FD386 
X-CRM114-Status: GOOD (  19.69  )
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

On Fri, Jun 13, 2025 at 10:50=E2=80=AFAM Kory Maincent
<kory.maincent@bootlin.com> wrote:
>
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Gree=
n
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>
> Changes in v3:
> - Move the omap.yaml binding change in another patch.
>
> Changes in v2:
> - Used generic pmic node name.
> - Add regulator prefix to fixed regulator node name.
> - Add the compatible to omap.yaml binding
> ---
>  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++=
++++++
>  2 files changed, 170 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/om=
ap/Makefile
> index 95c68135dd0c..1aef60eef671 100644
> --- a/arch/arm/boot/dts/ti/omap/Makefile
> +++ b/arch/arm/boot/dts/ti/omap/Makefile
> @@ -93,6 +93,7 @@ dtb-$(CONFIG_SOC_AM33XX) +=3D \
>         am335x-boneblue.dtb \
>         am335x-bonegreen.dtb \
>         am335x-bonegreen-wireless.dtb \
> +       am335x-bonegreen-eco.dtb \
>         am335x-chiliboard.dtb \
>         am335x-cm-t335.dtb \
>         am335x-evm.dtb \
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/ar=
m/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> new file mode 100644
> index 000000000000..2e6050bd2da1
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Bootlin
> + */
> +/dts-v1/;
> +
> +#include "am33xx.dtsi"
> +#include "am335x-bone-common.dtsi"
> +#include "am335x-bonegreen-common.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +       model =3D "TI AM335x BeagleBone Green Eco";
> +       compatible =3D "seeed,am335x-bone-green-eco", "ti,am33xx";

Based on [2/7] ARM: dts: omap: Remove incorrect compatible strings
from device trees  this should be???

> +       model =3D "Seeed AM335x BeagleBone Green Eco";
> +       compatible =3D "seeed,am335x-bone-green-eco", "ti,am33xx";

I feel bad as I'm the one who wrote most of these wrong in the first
place that you are claning up for me!

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

