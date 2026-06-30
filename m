Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 18:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCVJ3/YfnMGwAtAU15rL0FQBriNX8zfFDwNu+BCGAtk=; b=EBrRtOiPGnKIgSUuzZ/2/qrf4V
	JSkrGEQusSanruywq2H3b7eroybhI3Ib3wqYVNsVIWQuILXVI6H6NtOVkuJbxCAyWPciPkpdXcRuF
	zEDPl9qN7OLoPQp14afx6Shn+cmHFtrguISBE0kO9r6OW3lhA87V031OKdWNreqa+It+73LGqFjFn
	6u4Ga0rF+4LdMnBnMfcLawjIjUZAu4s3fHLNqYQoj+Obhv0ACzUhcmTmQDL3Dz6qbeYjdi+u669Z/
	ufPvsjKbLYA+TZKA/E7TXd+FjGACgbZmdhxiVUT/ByYCY3JX/wCp0mLS3fdAwNPtkLTSLZ3mNNWpV
	Yq7stSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecpS-000000001FR-2ChJ;
	Tue, 30 Jun 2026 18:05:02 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecpP-000000001EP-4AjW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 18:05:01 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59ebb89109aso3799270e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782842698; x=1783447498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCVJ3/YfnMGwAtAU15rL0FQBriNX8zfFDwNu+BCGAtk=;
        b=KhBES/CzQJH0oCT3EYx1cSsY4TO9vqUr+S0SMY3SRg0887DPpZUEWwkpcHuegGosEo
         H8BEzjticYv9rq7O8WxdcJEbAOkkskpHjeNFDyCRjpVz7cfqHpH6Qrj//bXedfyDUi5o
         D2GNcVVFNaU/btC8zKpV8EY5lR097SkXsq6ynVI6XEAt231kSnCWpFZl9uRolHgHHWb/
         GVBNRGTJyEuClI6s5I/Yn2i3zriUzA1DDJJLeaL4LEreIPjrXmclbetUY9o71et+LLZo
         Cfw2Q7FWT1SiDxuT7yxquEYbTg5zCBOvSr+Veb676sBFbbcRiE4aq5rOhuCeVEGkOTWA
         H06w==
X-Forwarded-Encrypted: i=1; AHgh+RqARMYM72tQnVToukyOTJImmhel46wWlpQ44QWJzkSA5ga0OmeKF9Y5trPfNAHQyr/bjy0m0YgIv3oradyUQaLw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8isoDFJUKSqPMImP2Bhww40piavv28z1Eeu/KWy4UylwHiKGn
	rLjFK0/YO54isACoaFoI9C8FidL6YB+c/2jntxXfcztdkuNql8HRblVEEh135W8hTN4=
X-Gm-Gg: AfdE7cnqcRm6dHBUQou0J+E1g+1rKQL6GmRYtV+PfQKQjADHcV4FTr3akqdcyha6AJP
	AHUHPHQiFQzRQNMcb3vflkeCetQr3Gl56kXRNOc+TnVbgDDzlEyas32Lq+apZYXs6E8hIkolleZ
	5At6DPLfsLlPagqeLFAsawGhTn89xuxwrtXTrISBr1nLw2uCHmTbjVJNRm4ZX3yBjlqfc+M6stT
	tmsuFLG3pbaSsNMtJjgW0z3TZ7teTKFhLPLxwwyw6epEP0EqoYnkA37KkWVd6f+fqUB1QMPVlgL
	hwK/Ca5tbqdU/1uer9xNUhUu9fwFWAT2JmkXsppQ43O7K23V+XkObBIrNLDHAOu8icK5c6HJheJ
	LzZEGWRqDx6Jb/H5ZW9/9VygYxABr+PgmHLFfz5o6o/Q9Ji+NqlpmXF1v8K4qX3eI9U1gMrWADM
	JlYRB4b4v6pggOv288DPHVCJePbnPhXeVUV35PcwbJBTdALnFg1g==
X-Received: by 2002:a05:6123:145:b0:5bc:2b4f:3fc4 with SMTP id 71dfb90a1353d-5bdbec33d06mr2384876e0c.6.1782842698275;
        Tue, 30 Jun 2026 11:04:58 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1b602c2sm1919645e0c.18.2026.06.30.11.04.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 11:04:56 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-73a442f7cd3so865490137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrfkCanPGRVZStQTK53FasN+KdOawNSBBKxbJNzz1XaLUgKpGWiNEsf+VSUxo1siXrW72PiM4CzKFeEct3CSsIN@lists.infradead.org
X-Received: by 2002:a05:6102:5805:b0:738:472f:2ca9 with SMTP id
 ada2fe7eead31-73a369ec1bcmr2473065137.7.1782842696311; Tue, 30 Jun 2026
 11:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org> <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 20:04:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
X-Gm-Features: AVVi8CcCGeVbbcW5z0757KT0rVC9sZPZEWMHF1Z1kDBEh7vVAiL0IbidDTttqgc
Message-ID: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_110500_041478_966B39A8 
X-CRM114-Status: GOOD (  30.83  )
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

Hi Marek, Shimoda-san,

On Fri, 19 Jun 2026 at 00:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
> MSI are handled via GIC ITS. Configure all controller MSI registers
> fully.
>
> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
> if MSI are enabled, clear both bits if MSI are disabled.
>
> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
> pass through of MSI TLPs onto the AXI bus and then further into
> GIC ITS translation registers.
>
> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
> with target address of GIC ITS translation registers, and configure
> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
> GIC ITS. This specific configuration allows handling of MSI via the
> GIC ITS instead of integrated iMSI-RX.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c

> @@ -305,13 +320,103 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>         return rcar;
>  }
>
> +static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
> +{
> +       struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +       struct device_node *msi_node = NULL;
> +       struct device *dev = dw->dev;
> +       struct resource res;
> +       u64 addr;
> +       int ret;
> +
> +       /*
> +        * Either the "msi-parent" or the "msi-map" phandle needs to exist
> +        * to obtain the MSI node.
> +        */
> +       of_msi_xlate(dev, &msi_node, 0);
> +       if (!msi_node)
> +               return -ENODEV;

This is not backwards-compatible with existing DTBs.
I noticed because PCIe is broken on Gray Hawk Single with R-Car V4M
after this series.  Indeed, "[PATCH v2 4/4] arm64: dts: renesas:
r8a779g0: Add GICv3 ITS and update PCIe nodes" only covers R-Car V4H,
but not R-Car S4-8 and R-Car V4M.

> +
> +       /* Check if "msi-parent" or the "msi-map" points to ARM GICv3 ITS. */
> +       if (!of_device_is_compatible(msi_node, "arm,gic-v3-its"))
> +               return dev_err_probe(dev, -ENODEV, "Compatible MSI controller not found\n");
> +
> +       /* Derive GITS_TRANSLATER address from GICv3 */
> +       ret = of_address_to_resource(msi_node, 0, &res);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "MSI controller resources not obtained\n");
> +
> +       addr = res.start + GITS_TRANSLATER;
> +       if (addr >= SZ_4G)
> +               return dev_err_probe(dev, -EINVAL, "MSI controller address above 32bit range\n");
> +
> +       *msi_addr = addr;
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

