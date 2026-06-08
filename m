Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094D5CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrNOOi+PlaQWmV4dMJih5PA704/YUREYdhWD77leDwk=; b=E5NESBXRLm6tQeGv3eY5eS5FPS
	/3RoSSUXTASif8k97TrRmcD3SRhu+WV/VbagFF9dPlu1sai6M58QumnCIhWwNrDlqrEoSQmw+cIny
	/xHZ54PD6s4J8QtXygZiQcwGVqRZ0nAWt9nX6K6+6cEm7NVpN02NbqkSPLdhRYD7bdXGCe9CdsxG1
	rMG/Wpo4IMy8gUlHXETC2TfnxWQfNJV2Nv98ndudEs9uTIvOtMkk8EccOufA+XZp/GYGYTxeK+MuK
	660AKoN+Jujzu346AexNaz+9j+wtOl1YqbFgE7aIPGMLdhLsvv52nzsxqlMl3E2iGD0ZYCNdl4Kn7
	RDr/k6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdcN-00000004B5x-2qnA;
	Mon, 08 Jun 2026 17:18:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdcN-00000004B5l-0dIB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 17:18:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11580444A1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 17:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CB51F008A2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780939108;
	bh=XrNOOi+PlaQWmV4dMJih5PA704/YUREYdhWD77leDwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BzfrUniBTTjg++qitRjPXuRramYkh7ZimNV4b2g34/a/ZCPO2+uFnRv0+ZOCh2gCn
	 ZMm9/hj3Rub1G07qfn9V5+cpbWaiqsW/6pIZC8F76HDQoVMkxxs4jpuYpgmilLij2A
	 Rvr6X6iAeU7p9rHmsWdeMxG+FWfz/AaQv+giGNWKiENiiLrUFHyMjywPWoSIyY+a40
	 xAWJXK3gCe6IppxQ7ghkpj7sDqDVIipFgwiZ9FUMyjq1vIbcdFl76oT54AVlTx3Gvq
	 dr6j9GWXpQA2GeByYuQidFcTYIEpH1YBC8NmKFQ2g0TpGZfHjPZrzW3zxcwqZlA9DW
	 lXqTUK/acxm4g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so4766604e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 10:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/LyNuaitA55csvs6p3K1OqXBub7Lq0ZuqAdAqJRO2mNnkD1IIoHaGpYcoP18mwBjIGCIdAtJNH6UOrDUoyKOYl@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt1JVIieQjF5rxx67zH9lG9byE3gkLGq4LE2yDeShbyqt7NBjV
	jnF5zdna/DXuMn4tvPYf0IDscneQY2vqCdFUVIrPgKuuGEFTjoNgTjjlZgrr2+4zBZG+FTsIUic
	GOwFtgb/DmFFrBHR7qy7c27MUsQIIQDQ=
X-Received: by 2002:a05:6512:33c3:b0:5aa:6e5d:adf5 with SMTP id
 2adb3069b0e04-5aa87beb34fmr4601211e87.19.1780939107273; Mon, 08 Jun 2026
 10:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Jun 2026 19:18:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
X-Gm-Features: AVVi8CcTa11c5Xl8V7_VF2hxe7iSgWJNbGaXh3nHX-6VT5F-TvPgOxONicEOC_k
Message-ID: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jun 3, 2026 at 10:21=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> Register an ACPI hook in the ACPI interrupt management code for GICv5 to
> retrieve the ACPI interrupt controller handle (if any) of the controller
> handling a specific GSI, by updating the acpi_set_irq_model() call with
> the gic_v5_get_gsi_handle() function pointer parameter.
>
> gicv5_get_gsi_handle() allows ACPI core to detect the ACPI handle
> of the controller that manages a specific GSI interrupt.
>
> Update the IWB driver to clear device dependencies in ACPI core once the
> IWB driver has probed.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-gic-v5-iwb.c |  5 +++++
>  drivers/irqchip/irq-gic-v5.c     | 13 +++++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v=
5-iwb.c
> index 9103feb70ce8..a02cb9537b15 100644
> --- a/drivers/irqchip/irq-gic-v5-iwb.c
> +++ b/drivers/irqchip/irq-gic-v5-iwb.c
> @@ -269,6 +269,11 @@ static int gicv5_iwb_device_probe(struct platform_de=
vice *pdev)
>         if (IS_ERR(iwb_node))
>                 return PTR_ERR(iwb_node);
>
> +#ifdef CONFIG_ACPI
> +       if (has_acpi_companion(&pdev->dev))
> +               acpi_dev_clear_dependencies(ACPI_COMPANION(&pdev->dev));
> +#endif

I would rather add a wrapper for this, along with an empty stub for
the !CONFIG_ACPI case.

> +
>         return 0;
>  }
>
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 03cc2830b260..26cfaea1af41 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -1217,11 +1217,19 @@ static struct fwnode_handle *gsi_domain_handle;
>  static struct fwnode_handle *gic_v5_get_gsi_domain_id(u32 gsi)
>  {
>         if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) =3D=3D GICV5_GSI_IWB_TYPE)
> -               return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, =
gsi));
> +               return iort_iwb_handle_fwnode(FIELD_GET(GICV5_GSI_IWB_FRA=
ME_ID, gsi));

Why is this change needed?

>
>         return gsi_domain_handle;
>  }
>
> +static acpi_handle gic_v5_get_gsi_handle(u32 gsi)
> +{
> +       if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) =3D=3D GICV5_GSI_IWB_TYPE)
> +               return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, =
gsi));
> +
> +       return NULL;
> +}
> +
>  static int __init gic_acpi_init(union acpi_subtable_headers *header, con=
st unsigned long end)
>  {
>         struct acpi_madt_gicv5_irs *irs =3D (struct acpi_madt_gicv5_irs *=
)header;
> @@ -1242,7 +1250,8 @@ static int __init gic_acpi_init(union acpi_subtable=
_headers *header, const unsig
>         if (ret)
>                 goto out_irs;
>
> -       acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_i=
d, NULL);
> +       acpi_set_irq_model(ACPI_IRQ_MODEL_GIC_V5, gic_v5_get_gsi_domain_i=
d,
> +                          gic_v5_get_gsi_handle);
>
>         return 0;
>
>
> --

