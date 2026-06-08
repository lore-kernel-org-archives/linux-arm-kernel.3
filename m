Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E20BCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4Thl8BELdVNhJiRU1vcOCa2kz5Q3sBldxjcDoBGFQA=; b=iZiI0jbEaO2WjE8gIb3xdQpeSA
	Pj9nPnDsi5eTm62ekT2n6/ymJk7MOypU0LsR5kDT2WsTmXLBtuYJVNp5iv6QpaMk0kRbaJzCDwmeY
	W/d3mRwsX++G42mGu795XrtDcLcK6/JtR1oPwxoyHreF/EmrlqRg/mshI3hzE+5a/s8Z1HUHKl4Ve
	seYHy3QirNGn/hHDwHBoXpvyxUZw7SQ5leiHFGHdnvPvYTfky8tFW7+o1emvqG2m9m/+kDrE3uVjU
	JLWNTeg3n+FuAv7/qN7WYQiU61SRIozWdyk8rnuUbaA+SMYAl1wIzEwqup/E5dqHQox8UHKMsC67G
	Uhf5ZjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZRP-00000003XXf-1o9W;
	Mon, 08 Jun 2026 12:50:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZRN-00000003XXM-3q8N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:50:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E355A601E1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 12:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985441F00893
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780923052;
	bh=g4Thl8BELdVNhJiRU1vcOCa2kz5Q3sBldxjcDoBGFQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lshdfBTP1uMAXI1y1cg+Gga4NAIuXg+VDm3PVkcQaozqo9hehWHPRiAOE1xhD+pNM
	 4xXh4VHy7efOlfzfVAXBqWvYWF2CmdM19sKwxWlafoDFL2ftUFxdPJmfL8jgL8kKCe
	 kCafBotIzr9ahms4YJC12insIxYQqrMljG08Qk18ndNCXU425IPx7ncLLKnIXxRMIV
	 a7ztoXmwNFBTULWAij86WNV+K34kmrYARZ0BakntheLFAIO2HEOSLCyXHzZgft9jXn
	 lcWfItZGmZVZst9Xnyu0WEQuavuOnCT+BppwPR3eQQLzYn4vw1B5oqgHMz1gM5xhMD
	 ivTV1dr+orUkw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa7a7ad475so4272326e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 05:50:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Ys+2KTxd/Rk/dB32bQT93GWg1nppW72qd82GAnXLQnLrHwQbtJ36Mz+9jHAOpfloPwvrPJMgTwYnkoPcw2QRK@lists.infradead.org
X-Gm-Message-State: AOJu0YwMkTanoXGoL/vxx6Po0vM4sJ2KKPIj7iC/XuiIMCifpyHeHx1h
	jUlPczdSQvr/v5PcDoCMLdx23iRsJMH6VVuFgF7Xa/vBNH+mdN+UszP2hw2tCyM7F4i1BcM9Ct7
	NcWB01+f9SgbU2CC3veTrYRtNUpOffHo=
X-Received: by 2002:a05:6512:2903:b0:5aa:6938:d873 with SMTP id
 2adb3069b0e04-5aa87bc2343mr2965397e87.26.1780923051088; Mon, 08 Jun 2026
 05:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-5-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-5-23ffa16b6ebb@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Jun 2026 14:50:32 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g86XVdkFE0W9xii1XdUMPX0tOd83_SvYDao+YjvYo4kg@mail.gmail.com>
X-Gm-Features: AVVi8CeypFZ6kot-UUapVy4urjC3Q0NEKKlzcfTvjHLJKqyoe8uhxJKP5O_AM1M
Message-ID: <CAJZ5v0g86XVdkFE0W9xii1XdUMPX0tOd83_SvYDao+YjvYo4kg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ACPI/IORT: Implement ACPI infrastructure to enable
 GICv5 IWB probe deferral
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
> Implement an IORT ACPI hook to retrieve the acpi_handle of the interrupt
> controller handling a specific GSI (if any, on GICv5 systems only the IWB
> is represented in firmware with an ACPI device object) and add the IWB to
> the list of devices whose dependencies can be detected (and cleared) in
> ACPI core to guarantee that probe dependencies for the IWB can be
> satisfied.
>
> Enable autodep detection for arm64 by adding the arch_acpi_add_auto_dep()
> callback in the ACPI IORT driver.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>

Acked-by: "Rafael J. Wysocki" (Intel) <rafael@kernel.org> # ACPI: scan.c

The rest of the series is kind of outside my scope and all of the
previous patches would at least require an ACK from the RISC-V people.

> ---
>  drivers/acpi/arm64/iort.c | 22 +++++++++++++++++++---
>  drivers/acpi/scan.c       |  1 +
>  include/linux/acpi_iort.h |  3 ++-
>  3 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index af7a9b2fd5bc..34412cd697d8 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -789,11 +789,9 @@ struct irq_domain *iort_get_device_domain(struct dev=
ice *dev, u32 id,
>         return irq_find_matching_fwnode(handle, bus_token);
>  }
>
> -struct fwnode_handle *iort_iwb_handle(u32 iwb_id)
> +acpi_handle iort_iwb_handle(u32 iwb_id)
>  {
> -       struct fwnode_handle *fwnode;
>         struct acpi_iort_node *node;
> -       struct acpi_device *device;
>         struct acpi_iort_iwb *iwb;
>         acpi_status status;
>         acpi_handle handle;
> @@ -808,6 +806,19 @@ struct fwnode_handle *iort_iwb_handle(u32 iwb_id)
>         if (ACPI_FAILURE(status))
>                 return NULL;
>
> +       return handle;
> +}
> +
> +struct fwnode_handle *iort_iwb_handle_fwnode(u32 iwb_id)
> +{
> +       struct fwnode_handle *fwnode;
> +       struct acpi_device *device;
> +       acpi_handle handle;
> +
> +       handle =3D iort_iwb_handle(iwb_id);
> +       if (!handle)
> +               return NULL;
> +
>         device =3D acpi_get_acpi_dev(handle);
>         if (!device)
>                 return NULL;
> @@ -2090,6 +2101,11 @@ static void __init iort_init_platform_devices(void=
)
>         }
>  }
>
> +u32 arch_acpi_add_auto_dep(acpi_handle handle)
> +{
> +       return acpi_irq_add_auto_dep(handle);
> +}
> +
>  void __init acpi_iort_init(void)
>  {
>         acpi_status status;
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 530547cda8b2..ba15da9058dc 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -856,6 +856,7 @@ static const char * const acpi_ignore_dep_ids[] =3D {
>
>  /* List of HIDs for which we honor deps of matching ACPI devs, when chec=
king _DEP lists. */
>  static const char * const acpi_honor_dep_ids[] =3D {
> +       "ARMH0003", /* ARM GICv5 IWB */
>         "INT3472", /* Camera sensor PMIC / clk and regulator info */
>         "INTC1059", /* IVSC (TGL) driver must be loaded to allow i2c acce=
ss to camera sensors */
>         "INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c acce=
ss to camera sensors */
> diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
> index 17bb3374f4ca..931eaa7bbf6a 100644
> --- a/include/linux/acpi_iort.h
> +++ b/include/linux/acpi_iort.h
> @@ -27,7 +27,8 @@ int iort_register_domain_token(int trans_id, phys_addr_=
t base,
>                                struct fwnode_handle *fw_node);
>  void iort_deregister_domain_token(int trans_id);
>  struct fwnode_handle *iort_find_domain_token(int trans_id);
> -struct fwnode_handle *iort_iwb_handle(u32 iwb_id);
> +acpi_handle iort_iwb_handle(u32 iwb_id);
> +struct fwnode_handle *iort_iwb_handle_fwnode(u32 iwb_id);
>
>  #ifdef CONFIG_ACPI_IORT
>  u32 iort_msi_map_id(struct device *dev, u32 id);
>
> --
> 2.54.0
>

