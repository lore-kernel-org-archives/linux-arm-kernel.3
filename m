Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00C8108E1E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y2y/RwBdkzoJubItdybq6OxUp3cxRf7Wsr1KNbZFdw=; b=u0sH0uWCobbMKveLRCUbI5KgD0
	uHRcG7+RYibe8LVIuHSIi8GIqAd7kLhdwhFWTymVN3jZZG4KcKgPUfLMdNw4nWjNJmXv21GtEtK3r
	7M2BaPWgoL3Z2XVKAOQYX+IDqIFZ0OqIYog2If2yq9M5TedP4fgT+ac9kU97EfQ3NHhuxSRfxJzns
	oy9f1KzZ+5Fle9sLkLAKNf5v7iOUel6WQhU4xMGhUpnY3co9H4pS51gI7NL9qVKlhmms/mOkvJ3sQ
	r7X1hGOxs94EgUP4gjPuDqYYsja2ap/1Aq53h/kzcRjeJgGf38oJeehP8CoNfzsYYq6oCC3m+qf5s
	YR2XpMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B44-0000000ASrJ-2GeT;
	Thu, 19 Mar 2026 10:57:20 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B42-0000000ASqy-24oX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:57:19 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-64ad46a44easo464785d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 03:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773917837; cv=none;
        d=google.com; s=arc-20240605;
        b=buOgWwRm43NgYFgA/Q7nl1IfhdjZQCDYdtM50x6helbxmQpVhFBmF+dygn6UIP5pRS
         BARxFq49dbii1cso+HiOcOlgJ3lsj+RSH7+Vb1mB/6jmf9QdBtHpMFJNo0KG6vRtJBjS
         MSPUoynVRLkcwjrvKYY+ozSPpK1t/Ur2ckjNeMbsEfSncRYcyU1IyBxAs2SlogAFW8j3
         P6iF0OFB2YKx1MMAzGLe5zP/Z9wefkmPYoVA4J5oIV13gEW+6ZTGow3cSyRrYh4W0CFG
         cR13ne2Jzx9Z54i8B0Q4LUBP4Ke1UgwUSa3+MLg+50kvtnxChYGpl18QiMxUQLglQFTo
         k3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y2y/RwBdkzoJubItdybq6OxUp3cxRf7Wsr1KNbZFdw=;
        fh=K+BW9cBkfLQnStsz0ChOcRpLO+e6OCb6zmGfoNazomM=;
        b=P1+wapKpOZTFJ4JSKVEJaSueflcJuV3nlukBLD+v/2DXrZumPUcWiURWJ+qnQ/LdMB
         tZGCs7KS3cUN5WJXEtOcSww1ZX2Eq9EbtSIhCUQFIqcERArlZz/LqqVGLFXVyEf/l3Pc
         1dXDOhNjTDSZjQav1+6IdvWBqHZ+FCcQTBA7UaC8KaS4yQGOHq8Rg9Isy6n+PDvBVAQ1
         tJ5rSmZLGoybBV0DyHMcaaZow96Z2ok8l8kzYo5vj9w8an7PONJPltzJVtywCLnECdxy
         8PmOtdfICjFYiQ7DCwZERBnqX78dTczrnOeefIYyLp2oepqAXF86k8WcCWd1ddZrrC/e
         b2Zw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773917837; x=1774522637; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y2y/RwBdkzoJubItdybq6OxUp3cxRf7Wsr1KNbZFdw=;
        b=IDM689qCEjikUbPnQT9nxxYugfbst1qn5T4UuRe05dgWBMhrxwvcEUdJG4Sr5P1Llv
         oCuF/NMd6LpKnF+Foc2kQ1iB1YVL3s8jZslvtazViSREAWUO+BlskJYipoJpciMGQXjm
         0Gj1NV+MaHle09mO3xV4FQ2n/Q6/dsBvwAe+wNuvni4Tvl1Eu1LKFybtnMGQ/cqfXjZN
         c7eV0PLazLkzNRFZQ4L5oTN3wiXhoYFydZGv5CMhbmJJSDbpVeUGM5Hm3OyaxOlmmqUj
         E+pEyhglKAHXipPIIS5ysz2s2oTvweJb2qDYgMQUYBPu6dECU/gSGaAYZw+Cgy3bKIHE
         SldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773917837; x=1774522637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Y2y/RwBdkzoJubItdybq6OxUp3cxRf7Wsr1KNbZFdw=;
        b=Rninv0wG6S9OnPPWAwPlYQgOsQ7MeMLX6w2xOsv0V5lMWGwIw50LAFiEpn1QB+1YTC
         xnW4V5AjTZrOAv1tBRb8ZlN+bw7eu1ZY0KMj6Mb2fd4C/SSmRnZrWQGF36Msi3gbWg9r
         AzsLhkxB+FfOitN9Tr5tq0R3t60zSw1PaTjq4pZay7TpCJOPyJlYsJfsnJ77397c6kPw
         OiFuMqI8ypkHoMvbJAuQdteEalBecU3FyxOco8hQD7SA0PukaLAYzD/JHmKcq2TXs6d3
         4sXbOzlzumj8PqTtbsVGHd1f9Ek5FTmTstmf+OPAukBnbFJ2z7ZFgUPokM1EDDZfwnL0
         G+/w==
X-Forwarded-Encrypted: i=1; AJvYcCV6dgkuXU3J6jv8Ga7jPbVqTOiod2DZTM2ZvHS2o9OkmTcTIWScS5u6erco4yesYmtUzvAUH5SZDfomMCmGJRLA@lists.infradead.org
X-Gm-Message-State: AOJu0YxUHKzpcW77Gr/YizE5Fb9x+/938HzlZ8/qtEAt3Ku7OVl+mLkl
	HJHL1f/Kfn0pOaGoOMYR7H4UBySgOoUM9R0aMlBOgHLG/AsvHUoVJaPCQvUwF+KcsrSnLR+7V9P
	vwWIE3Ig+/25wygZIH7szeDIhfQbvat4=
X-Gm-Gg: ATEYQzwY/rAWmbrD7EbMMpW82GHliO/uBW4rK2VPcXm41vdBvbRbgWHNAMBP/BXWMus
	MXCRvgr3PUQZP7A+rWXwbBnc0vCYPPiGYIwZOHaUE668hfVZ0JatfwIOOJanb6lO2huMRs2aZyi
	i2xICnkPRqvUjgo+StQS7fgCVIF2uktV+ydzWV6iKUAX5gr6CpORgUuSCPzllczmtAktx8YtYiW
	SCJ3O/ISaHZSfboROIZ14MO0t5paNqoHEB+qfsoZfPe1CRdbaH1sJtPNPW+grnlj+wUBBg+dgCA
	pPhTfCls
X-Received: by 2002:a53:acd3:0:10b0:64c:b7c9:dffd with SMTP id
 956f58d0204a3-64e915e8daamr5846442d50.58.1773917836798; Thu, 19 Mar 2026
 03:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260318193538.246853-1-visitorckw@gmail.com> <20260318193538.246853-3-visitorckw@gmail.com>
In-Reply-To: <20260318193538.246853-3-visitorckw@gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 19 Mar 2026 12:57:04 +0200
X-Gm-Features: AaiRm53rvDmQUT5KJXSzT_dt1jC1YV7jFfq4QfNKoPbw45Vjy844uk6y9AHfZJg
Message-ID: <CAP6Zq1gJOrEii97X2XjXexZeEQ5SN4F-wW334BN7SOrGbiVQxg@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: npcm-otp: Add Nuvoton NPCM OTP driver
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, tali.perry1@gmail.com, 
	srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_035718_655793_4FBEECFA 
X-CRM114-Status: GOOD (  39.87  )
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

Hi Kuan-Wei,

Thanks for the upstream Nuvoton OTP driver.

On Wed, 18 Mar 2026 at 21:36, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> Add a new NVMEM driver for the OTP memory controllers found on Nuvoton
> NPCM SoCs.
>
> This OTP is read-only and manages two independent arrays: Key Storage
> and Fuse Array, which contain cryptographic keys, hardware strapping,
> and calibration data.
>
> Each array provides 1024 bytes of storage.
>
> It can be accessed by writing the target address and a read command
> to the control registers, and then polling a status register until
> the data is ready. Concurrent accesses are protected by a mutex.
>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  MAINTAINERS              |   7 +++
>  drivers/nvmem/Kconfig    |  10 +++
>  drivers/nvmem/Makefile   |   2 +
>  drivers/nvmem/npcm-otp.c | 129 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 148 insertions(+)
>  create mode 100644 drivers/nvmem/npcm-otp.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61bf550fd37c..e391e2bcb5f6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18894,6 +18894,13 @@ F:     drivers/nubus/
>  F:     include/linux/nubus.h
>  F:     include/uapi/linux/nubus.h
>
> +NUVOTON NPCM OTP NVMEM DRIVER
> +M:     Kuan-Wei Chiu <visitorckw@gmail.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
> +F:     drivers/nvmem/npcm-otp.c
> +
>  NUVOTON NCT6694 MFD DRIVER
>  M:     Ming Yu <tmyu0@nuvoton.com>
>  S:     Supported
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 74ddbd0f79b0..5d065b7448ff 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -483,4 +483,14 @@ config NVMEM_QORIQ_EFUSE
>           This driver can also be built as a module. If so, the module
>           will be called nvmem_qoriq_efuse.
>
> +config NVMEM_NPCM_OTP
> +       tristate "Nuvoton NPCM7xx OTP Controller"
> +       depends on ARCH_NPCM || COMPILE_TEST
> +       help
> +         This option enables support for the OTP (One-Time Programmable)
> +         controller found on Nuvoton NPCM7xx BMCs.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called npcm-otp.
> +
>  endif
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 7252b8ec88d4..63c23b304d64 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -95,3 +95,5 @@ obj-$(CONFIG_NVMEM_ZYNQMP)            +=3D nvmem_zynqmp=
_nvmem.o
>  nvmem_zynqmp_nvmem-y                   :=3D zynqmp_nvmem.o
>  obj-$(CONFIG_NVMEM_QORIQ_EFUSE)                +=3D nvmem-qoriq-efuse.o
>  nvmem-qoriq-efuse-y                    :=3D qoriq-efuse.o
> +obj-$(CONFIG_NVMEM_NPCM_OTP)           +=3D nvmem-npcm-otp.o
> +nvmem-npcm-otp-y                       :=3D npcm-otp.o
> diff --git a/drivers/nvmem/npcm-otp.c b/drivers/nvmem/npcm-otp.c
> new file mode 100644
> index 000000000000..abe4bab66c06
> --- /dev/null
> +++ b/drivers/nvmem/npcm-otp.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Nuvoton NPCM7xx OTP (One-Time Programmable) NVMEM driver
> + *
> + * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +/* Register offsets and bitmasks */
> +#define NPCM_OTP_FST           0x00
> +#define NPCM_OTP_FADDR         0x04
> +#define NPCM_OTP_FDATA         0x08
> +#define NPCM_OTP_FCTL          0x14
> +
> +#define FST_RDY                        BIT(0)
> +#define FST_RDST               BIT(1)
> +#define FCTL_READ_CMD          0x02
> +
> +/* OTP total capacity is 8192 bits (1024 Bytes) */
> +#define NPCM_OTP_SIZE          1024
> +
> +struct npcm_otp {
> +       void __iomem *base;
> +       struct mutex lock; /* protects concurrent OTP accesses */
> +};
> +
> +static int npcm_otp_read_byte(struct npcm_otp *otp, unsigned int offset,=
 u8 *val)
> +{
> +       u32 fst;
> +       int ret;
> +
> +       writel(offset, otp->base + NPCM_OTP_FADDR);
> +       writel(FCTL_READ_CMD, otp->base + NPCM_OTP_FCTL);
> +
> +       ret =3D readl_poll_timeout(otp->base + NPCM_OTP_FST, fst,
> +                                (fst & FST_RDY), 10, 10000);
> +       if (ret)
> +               return ret;
> +
> +       *val =3D (u8)(readl(otp->base + NPCM_OTP_FDATA) & 0xFF);
> +
> +       /* Clear the status bit to prepare for the next read */
> +       writel(FST_RDST, otp->base + NPCM_OTP_FST);
> +
> +       return 0;
> +}
> +
> +static int npcm_otp_read(void *context, unsigned int offset,
> +                        void *val, size_t bytes)
> +{
> +       struct npcm_otp *otp =3D context;
> +       u8 *buf =3D val;
> +       int ret =3D 0;
> +       size_t i;
> +
> +       mutex_lock(&otp->lock);
> +
> +       for (i =3D 0; i < bytes; i++) {
> +               ret =3D npcm_otp_read_byte(otp, offset + i, &buf[i]);
> +               if (ret)
> +                       break;
> +       }
> +
> +       mutex_unlock(&otp->lock);
> +
> +       return ret;
> +}
> +
> +static int npcm_otp_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct npcm_otp *otp;
> +       struct nvmem_config config =3D { 0 };
> +       struct nvmem_device *nvmem;
> +
> +       otp =3D devm_kzalloc(dev, sizeof(*otp), GFP_KERNEL);
> +       if (!otp)
> +               return -ENOMEM;
> +
> +       otp->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(otp->base))
> +               return PTR_ERR(otp->base);
Since the driver already opens and manages the OTP registers, it
should also be responsible for handling the OTP index.
The NPCM AES driver can make use of keys stored in OTP.
We would be happy to help add support for OTP=E2=80=91stored keys to the
upstream driver.
If you=E2=80=99d like, we can set up a meeting to discuss how this can be i=
mplemented.
> +
> +       mutex_init(&otp->lock);
> +
> +       config.dev =3D dev;
> +       config.name =3D dev_name(dev);
> +       config.read_only =3D true;
> +       config.word_size =3D 1;
> +       config.stride =3D 1;
> +       config.reg_read =3D npcm_otp_read;
> +       config.priv =3D otp;
> +       config.size =3D NPCM_OTP_SIZE;
Suggest setting the size according to the BMC SoC,
The NPCM7xx has 2 8Kbyte OTP, and the NPCM8xx 64KB size.OPT
> +
> +       nvmem =3D devm_nvmem_register(dev, &config);
> +       if (IS_ERR(nvmem))
> +               return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to regi=
ster nvmem\n");
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id npcm_otp_dt_ids[] =3D {
> +       { .compatible =3D "nuvoton,npcm750-key-storage" },
> +       { .compatible =3D "nuvoton,npcm750-fuse-array" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, npcm_otp_dt_ids);
> +
> +static struct platform_driver npcm_otp_driver =3D {
> +       .probe          =3D npcm_otp_probe,
> +       .driver         =3D {
> +               .name   =3D "npcm-otp",
> +               .of_match_table =3D npcm_otp_dt_ids,
> +       },
> +};
> +module_platform_driver(npcm_otp_driver);
> +
> +MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");
> +MODULE_DESCRIPTION("Nuvoton NPCM7xx OTP NVMEM driver");
> +MODULE_LICENSE("GPL");
> --
> 2.53.0.851.ga537e3e6e9-goog
>

Thanks,

Tomer

