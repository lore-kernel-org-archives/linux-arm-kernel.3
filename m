Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F0CCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8F59In/k+8ei2zkGlaL3q/q77vUHa6w27HLET6WaYE0=; b=mNXjCBdeLCeTaenU6QJF2mYp33
	R2eDS3wACbu8eJ7SOLzMLt7e/Swk4gSy0hacEeygl+aBEHfdINjFV21nydShZAw72vhVI71DwnyqG
	9sYnH8meFZ187bEEjDQ41XDmtDmFyyN8ki5E5Vue1YhDuyCFCX/uVqesFuPi7kEOj7RhgzgaWnT3X
	5N17WvOvUsdwDZ82sGZdgO0A6VyeBuxVKv5sUVYufnnch9M5tlcQCo3wiGn5jNJqvQMncAoTr01Ou
	TX92Wd+ejyRtDTZGSDeA2LZOfL0YrNpR57qUypzqrcQY/PFA+VHDSjtGbkRo3xQDFAfJVVYH7NreQ
	LngnYrWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBde-00000008Ny4-3E2v;
	Fri, 24 Oct 2025 06:51:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBdc-00000008Nwl-2HFR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 06:51:01 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so3488938a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 23:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761288658; x=1761893458; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8F59In/k+8ei2zkGlaL3q/q77vUHa6w27HLET6WaYE0=;
        b=R0etMSFR4V3Uyg9UJkufhWEPvpNIeAJF/fUwPBpXVx84Rxs7v2LVba62P0ZI1LOMag
         zZS6Om7PE7GxobJ5eBS/aVk0BVLwCSklNmu+7xDt49cLwSOOAxLPKlaLex3LRZoR7v5/
         FDRiBTOlY7PNUI4NX99EyEyUXQlpWTj1qSQh2annoI2nDTe+jUrFF9YTsSKJ8D9wWE5H
         xzCyqBVJTlkqmoQm+LWmbviEAz8K+I4MNyyZvkvlKLCBtUIwgx4vrVrHc/x1dHaFWK1W
         cP7wJz4T7JWrN+ol6gKGmSylC11Jtci5kSEtRtQG/x+D4Ed01EkMy80r57aPhgQDl2d4
         xXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761288658; x=1761893458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8F59In/k+8ei2zkGlaL3q/q77vUHa6w27HLET6WaYE0=;
        b=f5/nCnVoujUn4nY/7ezaaP1aYG9P1/Wl2dnZjXQMNjqWmGtfFqwZXXr1/Z8h4sE37i
         5wZ6QywBCBx4FzAex1DHPOW9E07EY1tnPrcCJpJrB1jrNeJc35cDbAG4XP7iT/TEUQUT
         p87ErNzeMebpFrJM7Cr1HEtgcJQNo+P3xN8i52Jxe44plOu+RM/VRVYAWWioWlpbdrKH
         z1YjOeAJWyHc62M46IRR/FgTXCVO3U/tkYyikeaeAh4gNN/3SGSjdaYozGnx5lhvKiwh
         0Q3NozjYwLp+zfr3UpW4dlsIINUKv+iELv+1jD7vFenOsNmWUAS/6SFuTPkyVLB0uc5f
         PDBg==
X-Forwarded-Encrypted: i=1; AJvYcCWF3PaTn163BPnuxM+H4PokS1h7cGR0JRwZkECwVfpapa16dkvKVcDWyBNiwVEsjhFNR2E9THnmUi+6EGpELaXu@lists.infradead.org
X-Gm-Message-State: AOJu0YyMt93s/+9LdKPl/Iw4SseGzf5NSAPQd/HVroW2uqeChg5FzkRA
	45/8cK2rkr1nbvk5X8VwiDnln5vuI2xU+/MbaIzg4MF5dwfwIwlBBIS7Um8bwuyrgLXH4tFM80l
	jLG/cUQ2yWMpegMOdTe64fzM8gp1WERbrpPUNDcqlbA==
X-Gm-Gg: ASbGnctRIwBpQQsLYvO1JzyCFhE9+J9a7owpSurglvXtbjdNhjPIbrBwowJlg2K/doW
	XFfXte9Szwi7uYJ1tolwgYNSY2JHvXKie8hBnOLX4XwG3mF3/CML4dIF2BmtvczPZzioXXl3uh2
	HrvlZOUwEM0cxAsFA1mwmMJ1LNbe5tYQmVyJy0PKv1RChSSVnFRemrf3x+AkqBb1lHLsYWEPs5t
	1cL12ykM0XgRwRtQrfpaP4uev1B9iiusAYzLodFw2nkKAJpP8yEtbEbqnYkO7d2w8JBVY3fDvnr
	k99Km+gl1oQNOJj7Zq9rvJql
X-Google-Smtp-Source: AGHT+IFrKI0fnvSTnqzVv2eOZk8CRKDkaNQMq0DdY2GKOZNOyoOZjJbKhzPd1r3nb8BGmGeYwlT0SutndW1RdmNyVBk=
X-Received: by 2002:a05:6402:2707:b0:63c:3c63:75ed with SMTP id
 4fb4d7f45d1cf-63c3c6384d1mr23734442a12.22.1761288658135; Thu, 23 Oct 2025
 23:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251022174309.1180931-4-vincent.guittot@linaro.org> <20251022190402.GA1262472@bhelgaas>
In-Reply-To: <20251022190402.GA1262472@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 24 Oct 2025 08:50:46 +0200
X-Gm-Features: AS18NWAfJSavi43CTc998m6tiNTP5liY3Ukqcpz07ZOop2D3_BEhXOC5ja0TdFY
Message-ID: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_235100_644956_998F9682 
X-CRM114-Status: GOOD (  52.78  )
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

On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > Add initial support of the PCIe controller for S32G Soc family. Only
> > host mode is supported.
>
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -406,6 +406,16 @@ config PCIE_UNIPHIER_EP
> >         Say Y here if you want PCIe endpoint controller support on
> >         UniPhier SoCs. This driver supports Pro5 SoC.
> >
> > +config PCIE_NXP_S32G
> > +     tristate "NXP S32G PCIe controller (host mode)"
> > +     depends on ARCH_S32 || COMPILE_TEST
> > +     select PCIE_DW_HOST
> > +     help
> > +       Enable support for the PCIe controller in NXP S32G based boards to
> > +       work in Host mode. The controller is based on DesignWare IP and
> > +       can work either as RC or EP. In order to enable host-specific
> > +       features PCIE_S32G must be selected.
>
> Reorder this so the menu item is sorted by vendor name.

Okay

>
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
>
> > +/* Link Interrupt Control And Status */
> > +#define PCIE_S32G_LINK_INT_CTRL_STS          0x40
> > +#define LINK_REQ_RST_NOT_INT_EN                      BIT(1)
> > +#define LINK_REQ_RST_NOT_CLR                 BIT(2)
>
> None of these are used; remove until you need them.

That's a mistake and should not be in there.

>
> > +/* PCIe controller 0 General Control 1 */
> > +#define PCIE_S32G_PE0_GEN_CTRL_1             0x50
> > +#define DEVICE_TYPE_MASK                     GENMASK(3, 0)
> > +#define DEVICE_TYPE(x)                               FIELD_PREP(DEVICE_TYPE_MASK, x)
>
> Not sure this adds much over just doing this:
>
>   #define DEVICE_TYPE   GENMASK(3, 0)
>
>   val |= FIELD_PREP(DEVICE_TYPE, PCI_EXP_TYPE_ROOT_PORT);

fair enough

>
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
>
> > +static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci, u64 ddr_base_addr)
> > +{
> > +     u32 ddr_base_low = lower_32_bits(ddr_base_addr);
> > +     u32 ddr_base_high = upper_32_bits(ddr_base_addr);
> > +
> > +     dw_pcie_dbi_ro_wr_en(pci);
> > +     dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, 0x0);
> > +
> > +     /*
> > +      * Ncore is a cache-coherent interconnect module that enables the
> > +      * integration of heterogeneous coherent and non-coherent agents in
> > +      * the chip. Ncore Transactions to peripheral should be non-coherent
> > +      * or it might drop them.
> > +      * One example where this is needed are PCIe MSIs, which use NoSnoop=0
> > +      * and might end up routed to Ncore.
> > +      * Define the start of DDR as seen by Linux as the boundary between
> > +      * "memory" and "peripherals", with peripherals being below.
>
> Add blank lines between paragraphs.

okay

>
> > +      */
> > +     dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_1_OFF,
> > +                        (ddr_base_low & CFG_MEMTYPE_BOUNDARY_LOW_ADDR_MASK));
> > +     dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_2_OFF, ddr_base_high);
> > +     dw_pcie_dbi_ro_wr_dis(pci);
> > +}
> > +
> > +static void s32g_init_pcie_controller(struct s32g_pcie *s32g_pp)
> > +{
> > +     struct dw_pcie *pci = &s32g_pp->pci;
> > +     u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > +     u32 val;
> > +
> > +     /* Set RP mode */
> > +     val = s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_1);
> > +     val &= ~DEVICE_TYPE_MASK;
> > +     val |= DEVICE_TYPE(PCI_EXP_TYPE_ROOT_PORT);
> > +
> > +     /* Use default CRNS */
> > +     val &= ~SRIS_MODE;
> > +
> > +     s32g_pcie_writel_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_1, val);
> > +
> > +     /* Disable phase 2,3 equalization */
> > +     s32g_pcie_disable_equalization(pci);
> > +
> > +     /*
> > +      * Make sure we use the coherency defaults (just in case the settings
> > +      * have been changed from their reset values)
> > +      */
> > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
>
> This seems sketchy and no other driver uses memblock_start_of_DRAM().
> Shouldn't a physical memory address like this come from devicetree
> somehow?

I was using DT but has been asked to not use it and was proposed to
use memblock_start_of_DRAM() instead

>
> > +     dw_pcie_dbi_ro_wr_en(pci);
> > +
> > +     val = dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> > +     val |= PORT_FORCE_DO_DESKEW_FOR_SRIS;
> > +     dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> > +
> > +     /*
> > +      * Set max payload supported, 256 bytes and
> > +      * relaxed ordering.
> > +      */
> > +     val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> > +     val &= ~(PCI_EXP_DEVCTL_RELAX_EN |
> > +              PCI_EXP_DEVCTL_PAYLOAD |
> > +              PCI_EXP_DEVCTL_READRQ);
> > +     val |= PCI_EXP_DEVCTL_RELAX_EN |
> > +            PCI_EXP_DEVCTL_PAYLOAD_256B |
> > +            PCI_EXP_DEVCTL_READRQ_256B;
> > +     dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
>
> MPS and relaxed ordering should be configured by the PCI core.  Is
> there some s32g-specific restriction about these?

I will check with the team why they did that

>
> > +     /* Enable errors */
> > +     val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> > +     val |= PCI_EXP_DEVCTL_CERE |
> > +            PCI_EXP_DEVCTL_NFERE |
> > +            PCI_EXP_DEVCTL_FERE |
> > +            PCI_EXP_DEVCTL_URRE;
> > +     dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
>
> Enabling these errors doesn't really seem device-specific, and
> pci_enable_pcie_error_reporting() would enable all these.
>
> But that only happens with CONFIG_PCIEAER=y, and since this is
> DWC-based, you probably don't have standard interrupts for AER and
> CONFIG_PCIEAER isn't useful.  Someday we might have support for
> non-standard AER interrupts, but we don't have it yet.
>
> I guess you get platform-specific System Errors when any of these
> errors are detected (see PCIe r7.0, sec 6.2.6)?  What is the handler
> for these?

Same has above but I suspect we can remove it

>
> > +static int s32g_pcie_host_init(struct s32g_pcie *s32g_pp)
> > +{
> > +     struct dw_pcie *pci = &s32g_pp->pci;
> > +     struct dw_pcie_rp *pp = &pci->pp;
> > +     int ret;
> > +
> > +     pp->ops = &s32g_pcie_host_ops;
> > +
> > +     ret = dw_pcie_host_init(pp);
> > +
> > +     return ret;
>
>   return dw_pcie_host_init(pp);

fair enough

>
> Not sure this is really worth a wrapper.

More feature will come but with init ops, i will put everything in probe for now

>
> > +static int s32g_pcie_get_resources(struct platform_device *pdev,
> > +                                struct s32g_pcie *s32g_pp)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct dw_pcie *pci = &s32g_pp->pci;
> > +
> > +     s32g_pp->phy = devm_phy_get(dev, NULL);
> > +     if (IS_ERR(s32g_pp->phy))
> > +             return dev_err_probe(dev, PTR_ERR(s32g_pp->phy),
> > +                             "Failed to get serdes PHY\n");
>
> Add blank line here.

yes

>
> > +     s32g_pp->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> > +     if (IS_ERR(s32g_pp->ctrl_base))
> > +             return PTR_ERR(s32g_pp->ctrl_base);
>
> This looks like the first DWC driver that uses a "ctrl" resource.  Is
> this something unique to s32g, or do other drivers have something
> similar but use a different name?

AFAICT this seems to be s32g specific in the RM

>
> > +     pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "dbi");
> > +     if (IS_ERR(pci->dbi_base))
> > +             return PTR_ERR(pci->dbi_base);
>
> Isn't this already done by dw_pcie_get_resources()?

We needed dbi to be mapped before dw host init but this will not be
the case anymore with ops->init()

>
> > +static int s32g_pcie_suspend_noirq(struct device *dev)
> > +{
> > +     struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> > +     struct dw_pcie *pci = &s32g_pp->pci;
> > +
> > +     if (!dw_pcie_link_up(pci))
> > +             return 0;
>
> Does something bad happen if you omit the link up check and the link
> is not up when we get here?  The check is racy (the link could go down
> between dw_pcie_link_up() and dw_pcie_suspend_noirq()), so it's not
> completely reliable.
>
> If you have to check, please add a comment about why this driver needs
> it when no other driver does.

dw_pcie_suspend_noirq returns an error and the suspend fails

I will add a comment
/*
 * If the link is not up, there is nothing to suspend and resume
 */

>
> > +     return dw_pcie_suspend_noirq(pci);
> > +}
> > +
> > +static int s32g_pcie_resume_noirq(struct device *dev)
> > +{
> > +     struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> > +     struct dw_pcie *pci = &s32g_pp->pci;
> > +
> > +     s32g_init_pcie_controller(s32g_pp);
>
> Odd that you need this.  Other drivers really don't do anything
> similar, probably because this could be done by the
> pci->pp.ops->init() call in dw_pcie_resume_noirq().

no reason, i misread the impact of init in dw_pcie_host_init()



>
> > +     return dw_pcie_resume_noirq(pci);
> > +}
>
> > +static const struct of_device_id s32g_pcie_of_match[] = {
> > +     { .compatible = "nxp,s32g2-pcie"},
>
> Add space before "}"
>
> > +     { /* sentinel */ },
> > +};

