Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDDAC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RQDv2y1pr7v6juUFkjBraKRqQCEJnN8BOgGEQr97Tw=; b=xnA9i1RXtZBjdpiWcp+0QSruP5
	4/A4SJS6jCN5gZITeM+QEmMf8bT7JllOzij/64heMcnI2jeE7DP2cMrYb60qXidAEtQ7M/9NAnBzz
	D9aYnhBqgRpHpdVygaQT/h9Im/RhvCqEy9koM/2oIYlzWBs9xgEoy2FQcpQ2q3d3HSZaVDxRzxvCk
	X3Q2ycqWY0A28lZgHOLYBXcRFju/J/Aa9ol/or56Ta2WCHOFvmsOjzh9hIGDEogG9Ac0tEN5ukdFA
	E69SdVdVEMYKScyT8VfygM7cRAuJhjuhQJovrQrQKfrS5iCR3qUxO/hjUAnTiqXYLGkqSnszOyDzd
	Ha2T6hDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSaL-00000008q33-2p75;
	Wed, 26 Mar 2025 15:22:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSBg-00000008lgd-44KN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35F08A412E4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 14:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5617C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743001019;
	bh=nF2RjFGpG3A65aMAwOnP1USwdp3nJlYReQNJqbqS1So=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W5KqyxWyV6D7BCas9c8VPG1hN7HmSOTQfBRbRXVsVEBm5HT53vkmKAP1CvRTW6sqL
	 pVIYm5KeEEokTuu8GA29JsHlH92jRoDqOmwitRTT9SKuaKrWPSj0IEeompTB/dk9nF
	 TNU5YENudHlTQDkVolrYMoGz8+8CAG2gy8Nx9KW0t/Bmp3v3CLCvkn8jg/ClpXVE7A
	 ZBjm2x3s9bWc2Jw3+GBwm0r/aALVe2355o7rSzYzXzDithOy4Jj+bQSU0kLdSrsg5B
	 qLjp4vvgkxFTl7+Yr6JXu20YI+8SQCYvG3jXPsnTdYpTm8zHz/ts8OH+AVAOG8kFTj
	 O1GoLbqTQOeiw==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3fbc00143d6so4402149b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:56:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXw6wRSjFJQaH/qN4Kb+UwgRHP51EelnlO9EOw8Y3ovcm8JbRfxFxMp3RrI2GbK9AK8sfAEvys7Wlm/yqfEQVf2@lists.infradead.org
X-Gm-Message-State: AOJu0YwXow9xyNhj1vanGzC2pBIMxt84y6am142Mmwr7xANlZu7FpwQE
	3kO9NTYwIJx9C396av8WensDJKbk8sDjvIXOMTK00oGu7sVRzv6Ttvui85SFJ3S5yabsPhX9OCl
	TGnitq0muKRX+hisd2SM+HlDIino=
X-Google-Smtp-Source: AGHT+IGmSAoh/NM65izkDPKUI1Bx1s1CpYOoqqHj8rwk1HayiQb7/ZTrzCWxEZIlAbPgY/gZ5IPT5mW0vY7TUSaamgg=
X-Received: by 2002:a05:6808:2116:b0:3f9:a187:1f5d with SMTP id
 5614622812f47-3febf79cf75mr13184095b6e.35.1743001019176; Wed, 26 Mar 2025
 07:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250315001931.631210-1-romank@linux.microsoft.com> <20250315001931.631210-12-romank@linux.microsoft.com>
In-Reply-To: <20250315001931.631210-12-romank@linux.microsoft.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 26 Mar 2025 15:56:48 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jNEO2VcwmMXLZaS+Kqg3iBgHcWb65f90HKUADtPuvgqA@mail.gmail.com>
X-Gm-Features: AQ5f1JraBPSxwGSJAA4KKJZ156j5w2j0joAJRL4jrFqS_Vv7qLwxEV_YVE1Rcsc
Message-ID: <CAJZ5v0jNEO2VcwmMXLZaS+Kqg3iBgHcWb65f90HKUADtPuvgqA@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v6 11/11] PCI: hv: Get vPCI MSI IRQ domain
 from DeviceTree
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com, 
	conor+dt@kernel.org, dan.carpenter@linaro.org, dave.hansen@linux.intel.com, 
	decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com, 
	joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com, 
	lenb@kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, 
	mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com, 
	oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org, 
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
X-CRM114-CacheID: sfid-20250326_075701_133737_8060FE05 
X-CRM114-Status: GOOD (  24.48  )
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

On Sat, Mar 15, 2025 at 1:19=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> The hyperv-pci driver uses ACPI for MSI IRQ domain configuration on
> arm64. It won't be able to do that in the VTL mode where only DeviceTree
> can be used.
>
> Update the hyperv-pci driver to get vPCI MSI IRQ domain in the DeviceTree
> case, too.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  drivers/pci/controller/pci-hyperv.c | 73 ++++++++++++++++++++++++++---
>  1 file changed, 67 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller=
/pci-hyperv.c
> index 6084b38bdda1..cbff19e8a07c 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -50,6 +50,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/acpi.h>
>  #include <linux/sizes.h>
> +#include <linux/of_irq.h>
>  #include <asm/mshyperv.h>
>
>  /*
> @@ -817,9 +818,17 @@ static int hv_pci_vec_irq_gic_domain_alloc(struct ir=
q_domain *domain,
>         int ret;
>
>         fwspec.fwnode =3D domain->parent->fwnode;
> -       fwspec.param_count =3D 2;
> -       fwspec.param[0] =3D hwirq;
> -       fwspec.param[1] =3D IRQ_TYPE_EDGE_RISING;
> +       if (is_of_node(fwspec.fwnode)) {
> +               /* SPI lines for OF translations start at offset 32 */
> +               fwspec.param_count =3D 3;
> +               fwspec.param[0] =3D 0;
> +               fwspec.param[1] =3D hwirq - 32;
> +               fwspec.param[2] =3D IRQ_TYPE_EDGE_RISING;
> +       } else {
> +               fwspec.param_count =3D 2;
> +               fwspec.param[0] =3D hwirq;
> +               fwspec.param[1] =3D IRQ_TYPE_EDGE_RISING;
> +       }
>
>         ret =3D irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
>         if (ret)
> @@ -887,10 +896,47 @@ static const struct irq_domain_ops hv_pci_domain_op=
s =3D {
>         .activate =3D hv_pci_vec_irq_domain_activate,
>  };
>
> +#ifdef CONFIG_OF
> +
> +static struct irq_domain *hv_pci_of_irq_domain_parent(void)
> +{
> +       struct device_node *parent;
> +       struct irq_domain *domain;
> +
> +       parent =3D of_irq_find_parent(hv_get_vmbus_root_device()->of_node=
);
> +       if (!parent)
> +               return NULL;
> +       domain =3D irq_find_host(parent);
> +       of_node_put(parent);
> +
> +       return domain;
> +}
> +
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +
> +static struct irq_domain *hv_pci_acpi_irq_domain_parent(void)
> +{
> +       struct irq_domain *domain;
> +       acpi_gsi_domain_disp_fn gsi_domain_disp_fn;
> +
> +       if (acpi_irq_model !=3D ACPI_IRQ_MODEL_GIC)
> +               return NULL;
> +       gsi_domain_disp_fn =3D acpi_get_gsi_dispatcher();
> +       if (!gsi_domain_disp_fn)
> +               return NULL;
> +       return irq_find_matching_fwnode(gsi_domain_disp_fn(0),
> +                                    DOMAIN_BUS_ANY);
> +}
> +
> +#endif
> +
>  static int hv_pci_irqchip_init(void)
>  {
>         static struct hv_pci_chip_data *chip_data;
>         struct fwnode_handle *fn =3D NULL;
> +       struct irq_domain *irq_domain_parent =3D NULL;
>         int ret =3D -ENOMEM;
>
>         chip_data =3D kzalloc(sizeof(*chip_data), GFP_KERNEL);
> @@ -907,9 +953,24 @@ static int hv_pci_irqchip_init(void)
>          * way to ensure that all the corresponding devices are also gone=
 and
>          * no interrupts will be generated.
>          */
> -       hv_msi_gic_irq_domain =3D acpi_irq_create_hierarchy(0, HV_PCI_MSI=
_SPI_NR,
> -                                                         fn, &hv_pci_dom=
ain_ops,
> -                                                         chip_data);
> +#ifdef CONFIG_ACPI
> +       if (!acpi_disabled)
> +               irq_domain_parent =3D hv_pci_acpi_irq_domain_parent();
> +#endif
> +#if defined(CONFIG_OF)

Why don't you do

#ifdef CONFIG_OF

here for consistency?

> +       if (!irq_domain_parent)
> +               irq_domain_parent =3D hv_pci_of_irq_domain_parent();
> +#endif
> +       if (!irq_domain_parent) {
> +               WARN_ONCE(1, "Invalid firmware configuration for VMBus in=
terrupts\n");
> +               ret =3D -EINVAL;
> +               goto free_chip;
> +       }
> +
> +       hv_msi_gic_irq_domain =3D irq_domain_create_hierarchy(
> +               irq_domain_parent, 0, HV_PCI_MSI_SPI_NR,
> +               fn, &hv_pci_domain_ops,
> +               chip_data);
>
>         if (!hv_msi_gic_irq_domain) {
>                 pr_err("Failed to create Hyper-V arm64 vPCI MSI IRQ domai=
n\n");
> --

