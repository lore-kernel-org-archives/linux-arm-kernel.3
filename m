Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CF7CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br982OtNpb98PdeBYhrJLVyrR7luvRLBafDbJi6d/xo=; b=OUBWlghmX9EyU0/FNzPwmXUuzc
	W5TR/zubPIB7440/G6A1Thyd82zsi3znpASqZ2wPmTU9ZKdUKOnCUkkoa6f96x2EroPBj/VrXHxYF
	ImcrbYJQ+pvbyYBJCW/BP8FFDaDB8pigJsg2+26+40FVE8gNHEDhmGf8l+EpK41c/1e9PAh1ldY8Q
	dNgUQVN1lbnvnJOYU171/7gk15XYF0ZhOHc1mgqDSTJYhoBUMNv4oGDYie6i/K3JliHvu+ltcgAEV
	HxvnD3vMS6XffnV4dQZNOT1DxuAfZYjhPbuLrjq/VE4FEF2yGQv1g3F25wTRN4dV6l+3je1ppYGsP
	+cIFfDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzbq-0000000HSxM-1KHp;
	Wed, 29 Oct 2025 06:24:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzbm-0000000HSwT-2yMv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 06:24:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b70406feed3so97953366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 23:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761719073; x=1762323873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br982OtNpb98PdeBYhrJLVyrR7luvRLBafDbJi6d/xo=;
        b=OPuPuRyvRRrwaGiSNSwgVSP2e3Lo4Q8X6j6gaNC6Kk4L6ycFmWASBMnuk215H2cSYF
         01FymQUtkMLV1eStLvzsTolf239WUH9MNJfEq8M0gmApe+jtpC6cQgbPFEi4nB1AJafG
         eUeeeXPIZ9Nda1uA0UXa5HZLcW5C6KgF1Hg5kVWXkPgEMmssKQaVE/SOGypr2YyQV7Rv
         b0oHDi3GQ2Y4KjcJoh6g62sKQHTdy0Q3eYFjWEjabRoqVznHUwAzKLmtXE3fMfIgdv6X
         hEUSC6MjnfGi9XQv4kc9gk3tBB8oX3YjUfpA6eF+s5KvHel8D0P3YwyW4duy3PFP4SiZ
         JmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761719073; x=1762323873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=br982OtNpb98PdeBYhrJLVyrR7luvRLBafDbJi6d/xo=;
        b=cNkf2g+7xbuPS4wZ8w0msxPQ31/HXSYwjgCgmtxjJNOyD9crAxQcKR46aSoaHVGQwI
         OjYnPPhkTU3hafsRYnDAxepdcMkL2vt4VDHO2malR49ifvSmVU+3ItxYacBu37+i7+Z7
         FYg9tbWheF1UkaoneoWkvWibH0fQgINvOgCWzPsIp/cTzbnobfTNA6HdamgS6Qw6s+aR
         t6YsAsBKhHdjXE5lb5iHdcxh+0jDK6eRM2IGiHxiM8rwUvIW/HJso1FbKGHIuXdlbrTS
         tq23brdY7JhfbAwoIja480IWSG6/4FkYKxe3UohUhRvYqIzVvQ55jod0twdLj4LAr9vq
         Qx7g==
X-Forwarded-Encrypted: i=1; AJvYcCUq36wnsmv8W+NNHVjZtHN7TUDa9nGnix/GfRSfwFGnT+LdBxglX6flzhyu5xSEGpRsPvixvpJf4u3m9M5VxwG+@lists.infradead.org
X-Gm-Message-State: AOJu0YxAX8FVxL6XGfjvF5cv4mmeZ5LjKQ+jE4v5qzihwLO4hJJVP91u
	JYS4HokSMJc2sgDffPlVgGzgzhFlIWpLGNXujo0GP2C+TEHMqxuJGQL5eo5v/RPntpAtXDHcDBI
	fN3wjQAe0ya43QEIBSjVXJ63ldQuFyCI=
X-Gm-Gg: ASbGncvv8sxXPR3ShWPAMXhpxvARTmc4S5yBqivyTQ+YJKHAuxwez+1GjQHTSi+fsCt
	j21U4dzinqORBw27hnzpNlAQONb9O0w53YtlbPVH4mS4lu1TXym4wYsx+1h8CxcdGgT2iysM1WN
	eTo6GwpmMsHNkQQt/EirWDLvCRIqH3Ch1unO6CfT+fxEqkdd74PwtpV1vbadcQcAkyOc4A6S0SF
	pJcBHcRqsGq2HU+/0paEXXJwEBo5AF3HM7RdYtuKxev/fXc3a6lWcXP08s=
X-Google-Smtp-Source: AGHT+IHyfp+TmtXxz/OYls2Ipv0mWC+Ecb2/8nvbOahETXIdxr4t72mAdvqkoOAyhDhf4ehMvRZYQA65me6ij1Ptm9w=
X-Received: by 2002:a17:907:3c96:b0:b40:8954:a8bf with SMTP id
 a640c23a62f3a-b703d2ccb40mr176983466b.2.1761719072619; Tue, 28 Oct 2025
 23:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com> <4fe0ccf9-8866-443a-8083-4a2af7035ee6@rock-chips.com>
 <CANAwSgRXcg4tO00SNu77EKdp6Ay6X7+_f-ZoHxgkv1himxdi0Q@mail.gmail.com> <3fcd5562-a367-41e9-8bff-51e5990145e2@rock-chips.com>
In-Reply-To: <3fcd5562-a367-41e9-8bff-51e5990145e2@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 29 Oct 2025 11:54:16 +0530
X-Gm-Features: AWmQ_bkHYm5QH-5Y_pmEaKy-mXRgDSlraZJjP-ybL_6P_hostigu_T7ZdM_pHso
Message-ID: <CANAwSgQ4HH=16Gn45XP3+jr+V+PrDhh8fC1Ek0jzrbMnhXo9fw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for resource cleanup
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_232434_778781_287D1B72 
X-CRM114-Status: GOOD (  36.33  )
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

Hi Shawn,

On Wed, 29 Oct 2025 at 05:58, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
>
> =E5=9C=A8 2025/10/28 =E6=98=9F=E6=9C=9F=E4=BA=8C 17:34, Anand Moon =E5=86=
=99=E9=81=93:
> > Hi Shawn,
> >
> > Thanks for your review comments.
> >
> > On Tue, 28 Oct 2025 at 05:56, Shawn Lin <shawn.lin@rock-chips.com> wrot=
e:
> >>
> >> =E5=9C=A8 2025/10/27 =E6=98=9F=E6=9C=9F=E4=B8=80 22:55, Anand Moon =E5=
=86=99=E9=81=93:
> >>> Introduce a .remove() callback to the Rockchip DesignWare PCIe
> >>> controller driver to ensure proper resource deinitialization during
> >>> device removal. This includes disabling clocks and deinitializing the
> >>> PCIe PHY.
> >>>
> >>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>> ---
> >>>    drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
> >>>    1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/=
pci/controller/dwc/pcie-dw-rockchip.c
> >>> index 87dd2dd188b4..b878ae8e2b3e 100644
> >>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> >>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> >>> @@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_d=
evice *pdev)
> >>>        return ret;
> >>>    }
> >>>
> >>> +static void rockchip_pcie_remove(struct platform_device *pdev)
> >>> +{
> >>> +     struct device *dev =3D &pdev->dev;
> >>> +     struct rockchip_pcie *rockchip =3D dev_get_drvdata(dev);
> >>> +
> >>> +     /* Perform other cleanups as necessary */
> >>> +     clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> >>> +     rockchip_pcie_phy_deinit(rockchip);
> >>> +}
> >>
> >> Thanks for the patch.
> >>
> >> Dou you need to call dw_pcie_host_deinit()?
> > I feel the rockchip_pcie_phy_deinit will power off the phy
> >> And I think you should also try to mask PCIE_CLIENT_INTR_MASK_MISC and
> >> remove the irq domain as well.
> >>
> >> if (rockchip->irq_domain) {
> >>          int virq, j;
> >>          for (j =3D 0; j < PCI_NUM_INTX; j++) {
> >>                  virq =3D irq_find_mapping(rockchip->irq_domain, j);
> >>                  if (virq > 0)
> >>                          irq_dispose_mapping(virq);
> >>           }
> >>          irq_set_chained_handler_and_data(rockchip->irq, NULL, NULL);
> >>          irq_domain_remove(rockchip->irq_domain);
> >> }
> >>
> > I have implemented resource cleanup in rockchip_pcie_remove,
> > which is invoked when the system is shutting down.
> > Your feedback on the updated code is welcome.
> >
> > static void rockchip_pcie_remove(struct platform_device *pdev)
> > {
> >          struct device *dev =3D &pdev->dev;
> >          struct rockchip_pcie *rockchip =3D dev_get_drvdata(dev);
> >          int irq;
> >
> >          irq =3D of_irq_get_byname(dev->of_node, "legacy");
> >          if (irq < 0)
> >                  return;
> >
> >          /* Perform other cleanups as necessary */
> >          /* clear up INTR staatus register */
> >          rockchip_pcie_writel_apb(rockchip, 0xffffffff,
> >                                   PCIE_CLIENT_INTR_STATUS_MISC);
> >          if (rockchip->irq_domain) {
> >                  int virq, j;
> >                  for (j =3D 0; j < PCI_NUM_INTX; j++) {
> >                          virq =3D irq_find_mapping(rockchip->irq_domain=
, j);
> >                          if (virq > 0)
> >                                  irq_dispose_mapping(virq);
> >                  }
> >                  irq_set_chained_handler_and_data(irq, NULL, NULL);
> >                  irq_domain_remove(rockchip->irq_domain);
> >          }
> >
> >          clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> >          /* poweroff the phy */
> >          rockchip_pcie_phy_deinit(rockchip);
> >          /* release the reset */
>
> release? Or "reset the controller"?
>
Ok, I will fix this.
> >          reset_control_assert(rockchip->rst);
> >          pm_runtime_put_sync(dev);
> >          pm_runtime_disable(dev);
> >          pm_runtime_no_callbacks(dev);
> > }
> >
> >> Another thin I noticed is should we call pm_runtime_* here for hope th=
at
> >> genpd could be powered donw once removed?
> >>
> > I could not find 'genpd' (power domain) used in the PCIe driver
> > If we have an example to use genpd I will update this.
>  > > I am also looking into adding NOIRQ_SYSTEM_SLEEP_PM_OPS
>
> That sounds good, you can pick up my patch[1] if you'd like to continue
> addressing the comments that I haven't had time to think more.
>
> [1] https://www.spinics.net/lists/linux-pci/msg171846.html
>
Ok, thanks. I will carefully study and address the comments.

Thanks
-Anand

