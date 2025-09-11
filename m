Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED4ACAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSlk+fROaTKkWUJzIAo9K1awGf90OVjnNrt1yoqzdVE=; b=K0XuqM8Cb9gmVZs8CqBeMaHDfk
	ipgEsm1Gkts8xmlQZqT/Gn2zQP1hf1yCGGrQ8tI5jLRe5KDhGZDSr27OU5Fl3z2oeYNoWd/8BzQXT
	NtD8h+bSqXQQ86JucmsJYPyo3a6Z+OF8E8P9S1rV/BbS/H78H/i/Lltg6rakP87ANFngN7tAeHBNT
	RHlxNdcjUuFxuAFF9J6b5V9tVjxE82eYWrNjlamteSfYHFcsX6sp6fVK5V8P23n/MPRbtSRG9lSKS
	s5j7OmHbOk+SL+OXGslu8bvJU/PurPw4pOdu239MuyhnALoXUED89kBHAqJ/QQs3hyRuw6+lijwil
	f2+Ol99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiOu-00000003b2K-00rI;
	Thu, 11 Sep 2025 14:35:52 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiOs-00000003azw-1xjl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:35:51 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e96f401c478so492625276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 07:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757601349; x=1758206149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSlk+fROaTKkWUJzIAo9K1awGf90OVjnNrt1yoqzdVE=;
        b=vIl8I2YygITtKI36ULpqjr1vXsQBs2sSOej8wadxCpX/w3qLTXy7y3ACXwjxCX3+wd
         RUzCgOjqsmabOTunxHzWSv5lYot8RH6e4iTHghOm5QnYwAwtUHrktSkuDTp5xBlEOrVM
         D4GW4XWxKZeC+DVQHcgQ2neeWH6sTywrUa2Cy9wb2SAsqlC5So6uhOM8Wx897xq/HfZP
         6LhTb4yuYMZJznA8GzPWgdByli++FBGZ1Er6AbQJtCaY/RKMKlAHXmxYJeorskcMYLGz
         90S5FwjJ5FlJzgxUvqViM9qEJHbGmR7DVgGE93C5yeq6MosonfALd15h/oo0wFCZgrdM
         nG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601349; x=1758206149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSlk+fROaTKkWUJzIAo9K1awGf90OVjnNrt1yoqzdVE=;
        b=f3QIrbVtJhfmejhWe+5bGdIS/HShucSzbRV+6YgAsNX1VblXZY7v+KGwi4f5Fobf8p
         a4uaUSr7ySYiF1pP2vAzGMepcR9TWO/VobfGM53XQNj5IgSXkp96o5MTAXUJlhvCzo+7
         Y8FcIhDfszNGigUTeHvO/VbnGUMBS8WG3w6Xp/F/7LGLHwGspmMEm+bI3AB5uVmjUXVy
         paWDA7QIWqBfvmInyeIGhDULTnIedveSxKe0tZksuRu9sPSjPAko0FHyMjebgHrxszkg
         AmzS+12x0Aes7QXI6b32tjsxXmicTqDelAY20vpDi/5S03MwXq0ukDISuPdBkCDGk/Nm
         RrOw==
X-Forwarded-Encrypted: i=1; AJvYcCX4sn5RCpnS/1m1UfiyML2TOYuKNsTKla2GpwlXoU+qoEGBrTkrzLtPc55G2/JMWP3ALhuwMg97oxzwbIWy3za7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9UEaYkVWrrvYdM5PwQOKxj6UFVHNuqaLXafc6ZXU2v1/apWXI
	5FeqPPAX9ltXL+Y/zscXRocjzlv24xgqDLssZ2rSAns/8eRu5vGRzIEG/RMua/WVwcVLUSJW81n
	cS7yZ9SVqhB5uUFJX8rqhfD0gjJRsj6u57gCTrNEmdA==
X-Gm-Gg: ASbGnct/VnsyJ+cyuNQN/yVueGq0agZrAO/Yi2SsbKOrHptRoxs/Il/UsMT+OWEvg4C
	emkxKKJRucG8X8wTibBrzKew3Hu70jZUYpn6YKHG+GXQ60dR+i5i5cSduwk9B2aMwbYlIePghK6
	iiC/ws0ehwHZf8RXeKArw1qSWdpZZUj2bnmSqHeqxpHVnb3ssMLITv/0itb8r4xv07UfswQ6xXF
	fSOYiKW
X-Google-Smtp-Source: AGHT+IGfSKuM4c5fjR8Nmf/V6K6MW1d3ILicNhe4YrtpVSYxylfgXPVxzTMrmlTzxu1IKCMOAlIVCi0BHvOdfqFeTg8=
X-Received: by 2002:a05:6902:400e:b0:e9d:6e8b:da82 with SMTP id
 3f1490d57ef6-e9f67f9d18dmr12808394276.40.1757601349146; Thu, 11 Sep 2025
 07:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250829-pxa1908-genpd-v3-0-2aacaaaca271@dujemihanovic.xyz> <20250829-pxa1908-genpd-v3-3-2aacaaaca271@dujemihanovic.xyz>
In-Reply-To: <20250829-pxa1908-genpd-v3-3-2aacaaaca271@dujemihanovic.xyz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Sep 2025 16:35:13 +0200
X-Gm-Features: Ac12FXyuZ1jlXdj7-cEMF06sp4rqvDpYW1ns4WDjO-d3d9EX_Txs7Y_tLPOHUVM
Message-ID: <CAPDyKFpcCCUi4nKNmvvtnXs1OdUz3aHK7G+Jbi9LzLt=o=+QTQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clk: mmp: pxa1908: Instantiate power driver
 through auxiliary bus
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_073550_537443_D8D7082D 
X-CRM114-Status: GOOD (  28.90  )
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

On Fri, 29 Aug 2025 at 18:22, Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz> =
wrote:
>
> The power domain driver shares the APMU clock controller's registers.
> Instantiate the power domain driver through the APMU clock driver using
> the auxiliary bus.
>
> Also create a separate Kconfig entry for the PXA1908 clock driver to
> allow (de)selecting the driver at will and selecting
> CONFIG_AUXILIARY_BUS.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
> v3:
> - Move driver back to pmdomain subsystem, use auxiliary bus to
>   instantiate the driver
>
> v2:
> - Move to clk subsystem, instantiate the driver from the APMU clock
>   driver
> - Drop clock handling
> - Squash MAINTAINERS patch
> ---
>  MAINTAINERS                        |  2 ++
>  drivers/clk/Kconfig                |  1 +
>  drivers/clk/mmp/Kconfig            | 10 ++++++++++
>  drivers/clk/mmp/Makefile           |  5 ++++-
>  drivers/clk/mmp/clk-pxa1908-apmu.c | 20 ++++++++++++++++++++
>  5 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34e5e218e83e0ed9882b111f5251601dd6549d4e..88c0df09d7b354f95864f5a48=
daea3be14a90dc4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2869,7 +2869,9 @@ ARM/Marvell PXA1908 SOC support
>  M:     Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
>  F:     arch/arm64/boot/dts/marvell/mmp/
> +F:     drivers/clk/mmp/Kconfig
>  F:     drivers/clk/mmp/clk-pxa1908*.c
>  F:     drivers/pmdomain/marvell/
>  F:     include/dt-bindings/clock/marvell,pxa1908.h
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 4d56475f94fc1e28823fe6aee626a96847d4e6d5..68a9641fc649a23013b2d8a9e=
9f5ecb31d623abb 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -511,6 +511,7 @@ source "drivers/clk/imx/Kconfig"
>  source "drivers/clk/ingenic/Kconfig"
>  source "drivers/clk/keystone/Kconfig"
>  source "drivers/clk/mediatek/Kconfig"
> +source "drivers/clk/mmp/Kconfig"
>  source "drivers/clk/meson/Kconfig"
>  source "drivers/clk/mstar/Kconfig"
>  source "drivers/clk/microchip/Kconfig"
> diff --git a/drivers/clk/mmp/Kconfig b/drivers/clk/mmp/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..b0d2fea3cda5de1284916ab75=
d3af0412edcf57f
> --- /dev/null
> +++ b/drivers/clk/mmp/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config COMMON_CLK_PXA1908
> +       bool "Clock driver for Marvell PXA1908"
> +       depends on ARCH_MMP || COMPILE_TEST
> +       depends on OF
> +       default y if ARCH_MMP && ARM64
> +       select AUXILIARY_BUS
> +       help
> +         This driver supports the Marvell PXA1908 SoC clocks.
> diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
> index 062cd87fa8ddcc6808b6236f8c4dd524aaf02030..0a94f2f0856389c8e959981cc=
afbb02140a7733d 100644
> --- a/drivers/clk/mmp/Makefile
> +++ b/drivers/clk/mmp/Makefile
> @@ -11,4 +11,7 @@ obj-$(CONFIG_MACH_MMP_DT) +=3D clk-of-pxa168.o clk-of-p=
xa910.o
>  obj-$(CONFIG_COMMON_CLK_MMP2) +=3D clk-of-mmp2.o clk-pll.o pwr-island.o
>  obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) +=3D clk-audio.o
>
> -obj-$(CONFIG_ARCH_MMP) +=3D clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1=
908-apbcp.o clk-pxa1908-apmu.o clk-pxa1908-mpmu.o
> +obj-$(CONFIG_COMMON_CLK_PXA1908) +=3D clk-pxa1908-apbc.o clk-pxa1908-apb=
cp.o \
> +       clk-pxa1908-mpmu.o clk-pxa1908-apmu.o
> +
> +obj-$(CONFIG_ARCH_MMP) +=3D clk-of-pxa1928.o
> diff --git a/drivers/clk/mmp/clk-pxa1908-apmu.c b/drivers/clk/mmp/clk-pxa=
1908-apmu.c
> index d3a070687fc5b9fb5338f377f82e7664ca0aac29..eab02c89c9153619ac53f7486=
ed811f2cae12a43 100644
> --- a/drivers/clk/mmp/clk-pxa1908-apmu.c
> +++ b/drivers/clk/mmp/clk-pxa1908-apmu.c
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/auxiliary_bus.h>
>  #include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -85,6 +86,8 @@ static void pxa1908_axi_periph_clk_init(struct pxa1908_=
clk_unit *pxa_unit)
>  static int pxa1908_apmu_probe(struct platform_device *pdev)
>  {
>         struct pxa1908_clk_unit *pxa_unit;
> +       struct auxiliary_device *adev;
> +       int ret;
>
>         pxa_unit =3D devm_kzalloc(&pdev->dev, sizeof(*pxa_unit), GFP_KERN=
EL);
>         if (!pxa_unit)
> @@ -94,6 +97,23 @@ static int pxa1908_apmu_probe(struct platform_device *=
pdev)
>         if (IS_ERR(pxa_unit->base))
>                 return PTR_ERR(pxa_unit->base);
>
> +       adev =3D devm_kzalloc(&pdev->dev, sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       adev->name =3D "power";
> +       adev->dev.parent =3D &pdev->dev;
> +
> +       ret =3D auxiliary_device_init(adev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +

I think the above can be simplified with devm_auxiliary_device_create().

>         mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APMU_NR_CLKS);
>
>         pxa1908_axi_periph_clk_init(pxa_unit);
>
> --
> 2.51.0
>

Kind regards
Uffe

