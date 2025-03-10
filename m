Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB56C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvsHojGzktqIc1mRDfrH3Tw28TialK1JD2DdtffnVRo=; b=aL/0TVd+b2o9lGYWcXvU70AGNN
	A8bA2IIegF1mVSNxaipgbNNSgQKQSJuKRvS08dSqcfPrNa64cInDFYidGA3CfFa9jPlLEnR6DDTvW
	JlyXGqbLk1s9Ks7dg7BjKhFIklWA71jNuZExNMZjdL/O/VY0hkJZluSG6AHNyN5RlYu6Sp/yXc28R
	gvwYbH92MBMCWl8uFkbhkf4/aM9JfhHvMrKMONtPCeq1BSQyikAd0e6fktXpjwN+FeSVJAvAo7LiS
	/smxkld9Zx7vfZTtkf90fwXpIOAem6SG/zv5snrqkZboh3DAkUsyzYfT1XiLoGpAG3hpIQm93mW0V
	Qrqi5VVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trei0-000000036GH-0iJX;
	Mon, 10 Mar 2025 15:06:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdOu-00000002pMK-0LfV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:42:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so148721066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741614154; x=1742218954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvsHojGzktqIc1mRDfrH3Tw28TialK1JD2DdtffnVRo=;
        b=g5do28/4CF9gc08vF4WhHxjjibGtjBMDlhW83w4Tbpza5EnTu/Xm7NMUWLkntvLIyo
         5fNBdkkFct4umAKdnht5lYaE0dcd0uuh7rsBcPMlonArmwKf8gs9YaqBc63yB3EFIg5q
         bGF6Nx5+Y4GB+sWZXu6zKImFwVg2tuEsssBBa9O/5rMF1NqSVyFKYsw7BBq4SBsyXBUQ
         V6Bn2cOKFkO4RESeE/aIdazZprsQ2GvDN9hgaWomo+I5CSJm6fYSY4kTJAKIrMHKLH/6
         DDlTcGvzQ2/zaXrNt9waEAiX1GtBLT//quXsBe05d3SlHy7SrGAggT9d4v1Q0aDnGIzi
         cRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741614154; x=1742218954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvsHojGzktqIc1mRDfrH3Tw28TialK1JD2DdtffnVRo=;
        b=EicBx5NHC9sZPBEmQlfoyp5s0B1KbhVhLp7eHYt22OH8ezDMt6TG6M1HDYyQRvY5Xv
         xG1NoFt6QYiUIRRf+EtNd2JQ2NbwulwL1fLRb/uYk7I6kabAcQKOtLsXBZ7K3ong9ILW
         kAnLPyNdrDpo+1yC2rHB78Zy8F9ceCOsR+VZO9uYmcL036Bx49IWzcYfKNKWCeCP0wb4
         ClFagebs2qoK2ewfVRz//SS4GkikUrMCAbU9xdR4AoEJY7Nsaehrms22WZaFzxalnTnt
         loLuc2Dfr6psLCh0wbop75xulDWobv68sNlIOGLf+SO8FMq4b74Gi5fUGPWL7rki/j2K
         qHrg==
X-Forwarded-Encrypted: i=1; AJvYcCXipooD2FOVYf2OJmQvcKkxpsRSAErXw2e/J2KyfKnPm3m/MTU4Fhpp12NEAvv7Ci6RIP9nVrJlpvBSJdPJOEjp@lists.infradead.org
X-Gm-Message-State: AOJu0YyZI8rx1A5D8eltkc9RSWOsBQ9KUqtzVInaCyAtNfJh4WMfdy95
	Z4Ez60kOIo2WBqdP1bPw2Z0lKkt+i8cLonIx4/8DBR4u2vvJWwQAFDYTM86VQMiPT7ir/epKh5L
	fwZtdwkqU+GrAyT2yB2wl0YOL7a8=
X-Gm-Gg: ASbGncuWopIwoO14MEzVFCS1NNYT+FcbB9kGcHrB+p9MAuDCAv1Fh1sseLfryiX7gkt
	40eff+lfulfmSzTRFyzvsWu4Qy/66mV3woBIfv6N12ZnMZCizy1wvUoNcpU1zgDs3z/7aX8Nkyw
	3GT/2xtVkvVRW77yhrelUwIEirYDP/ManggDPFAsUg3XKB
X-Google-Smtp-Source: AGHT+IFUfaQlQuaPqqkcPWFR+Uc30OuqKeGBgv4UhgRVglMXjxzsUDhKEonas+ed+S1TKw+FHpP1oVa0jMVOpi7ix8c=
X-Received: by 2002:a17:907:9691:b0:aa6:b63a:4521 with SMTP id
 a640c23a62f3a-ac252a886dbmr1424178866b.15.1741614154071; Mon, 10 Mar 2025
 06:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250307220304.247725-1-romank@linux.microsoft.com> <20250307220304.247725-10-romank@linux.microsoft.com>
In-Reply-To: <20250307220304.247725-10-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Mon, 10 Mar 2025 21:41:57 +0800
X-Gm-Features: AQ5f1JrFNYOkTeGrjIoQMzNLPYhLnbwrDYGfCpL3y-Ny919xFrzmZmgmS7VWREs
Message-ID: <CAMvTesCFZ6sxQp7qqSDjD9idRjVHxh96Sp4betomgFH-OFLZ3Q@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v5 09/11] Drivers: hv: vmbus: Introduce hv_get_vmbus_root_device()
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com, 
	conor+dt@kernel.org, dave.hansen@linux.intel.com, decui@microsoft.com, 
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, 
	kw@linux.com, kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org, 
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com, maz@kernel.org, 
	mingo@redhat.com, oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org, 
	ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com, 
	tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com, 
	devicetree@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org, 
	apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com, 
	sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_064236_123567_883086B3 
X-CRM114-Status: GOOD (  24.64  )
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

On Sat, Mar 8, 2025 at 6:05=E2=80=AFAM Roman Kisel <romank@linux.microsoft.=
com> wrote:
>
> The ARM64 PCI code for hyperv needs to know the VMBus root
> device, and it is private.
>
> Provide a function that returns it. Rename it from "hv_dev"
> as "hv_dev" as a symbol is very overloaded. No functional
> changes.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>

Why change all device's parent to vmbus_root_device?

The ARM64 platform uses the device tree to enumerate vmbus
devices..  Can we find the root device via device tree? vmbus
code on the x86 use ACPI and it seems to work via ACPI.


> ---
>  drivers/hv/vmbus_drv.c | 23 +++++++++++++++--------
>  include/linux/hyperv.h |  2 ++
>  2 files changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index c8474b48dcd2..7bfafe702963 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -45,7 +45,8 @@ struct vmbus_dynid {
>         struct hv_vmbus_device_id id;
>  };
>
> -static struct device  *hv_dev;
> +/* VMBus Root Device */
> +static struct device  *vmbus_root_device;
>
>  static int hyperv_cpuhp_online;
>
> @@ -80,9 +81,15 @@ static struct resource *fb_mmio;
>  static struct resource *hyperv_mmio;
>  static DEFINE_MUTEX(hyperv_mmio_lock);
>
> +struct device *hv_get_vmbus_root_device(void)
> +{
> +       return vmbus_root_device;
> +}
> +EXPORT_SYMBOL_GPL(hv_get_vmbus_root_device);
> +
>  static int vmbus_exists(void)
>  {
> -       if (hv_dev =3D=3D NULL)
> +       if (vmbus_root_device =3D=3D NULL)
>                 return -ENODEV;
>
>         return 0;
> @@ -861,7 +868,7 @@ static int vmbus_dma_configure(struct device *child_d=
evice)
>          * On x86/x64 coherence is assumed and these calls have no effect=
.
>          */
>         hv_setup_dma_ops(child_device,
> -               device_get_dma_attr(hv_dev) =3D=3D DEV_DMA_COHERENT);
> +               device_get_dma_attr(vmbus_root_device) =3D=3D DEV_DMA_COH=
ERENT);
>         return 0;
>  }
>
> @@ -1930,7 +1937,7 @@ int vmbus_device_register(struct hv_device *child_d=
evice_obj)
>                      &child_device_obj->channel->offermsg.offer.if_instan=
ce);
>
>         child_device_obj->device.bus =3D &hv_bus;
> -       child_device_obj->device.parent =3D hv_dev;
> +       child_device_obj->device.parent =3D vmbus_root_device;
>         child_device_obj->device.release =3D vmbus_device_release;
>
>         child_device_obj->device.dma_parms =3D &child_device_obj->dma_par=
ms;
> @@ -2292,7 +2299,7 @@ static int vmbus_acpi_add(struct platform_device *p=
dev)
>         struct acpi_device *ancestor;
>         struct acpi_device *device =3D ACPI_COMPANION(&pdev->dev);
>
> -       hv_dev =3D &device->dev;
> +       vmbus_root_device =3D &device->dev;
>
>         /*
>          * Older versions of Hyper-V for ARM64 fail to include the _CCA
> @@ -2383,7 +2390,7 @@ static int vmbus_device_add(struct platform_device =
*pdev)
>         struct device_node *np =3D pdev->dev.of_node;
>         int ret;
>
> -       hv_dev =3D &pdev->dev;
> +       vmbus_root_device =3D &pdev->dev;
>
>         ret =3D of_range_parser_init(&parser, np);
>         if (ret)
> @@ -2702,7 +2709,7 @@ static int __init hv_acpi_init(void)
>         if (ret)
>                 return ret;
>
> -       if (!hv_dev) {
> +       if (!vmbus_root_device) {
>                 ret =3D -ENODEV;
>                 goto cleanup;
>         }
> @@ -2733,7 +2740,7 @@ static int __init hv_acpi_init(void)
>
>  cleanup:
>         platform_driver_unregister(&vmbus_platform_driver);
> -       hv_dev =3D NULL;
> +       vmbus_root_device =3D NULL;
>         return ret;
>  }
>
> diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
> index 7f4f8d8bdf43..1f0851fde041 100644
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@ -1333,6 +1333,8 @@ static inline void *hv_get_drvdata(struct hv_device=
 *dev)
>         return dev_get_drvdata(&dev->device);
>  }
>
> +struct device *hv_get_vmbus_root_device(void);
> +
>  struct hv_ring_buffer_debug_info {
>         u32 current_interrupt_mask;
>         u32 current_read_index;
> --
> 2.43.0
>
>


--=20
Thanks
Tianyu Lan

