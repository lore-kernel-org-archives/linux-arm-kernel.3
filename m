Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D43CCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odW3qtXEWjV0YpOhuEaOM6Q/wDrQniW9fcSMR6G8lw0=; b=AcNro7ZrjwSYRtorIOvRaGMX5S
	Z/GsERLChPmcf2SIjtgAvAQMADqtzFEWzHBxgHnodbBNDPhfIhfgWzhCx+y9A9ZLHM8ly026945zJ
	V+CDexj2UGoktXXqFtVpjAgi80ldSYMJM2jFnn4XiaoZKJoKLPY5HpKuqt6jlDOu0unXulximSNo0
	6Yb9sk0h/WuSZtaA8Pyf81aLjikvAAryFT8uV5KjV6O/JaoPDzV3rRf5qzwKHtbKYmwfamcBTDrS4
	UHggcvwvBhHJNecF07Y+OoJ0p7rvJ7UIxNXoCdIDlyk3BGiybB7SoF2E0Exg5gBljs8Rfdog9pDc/
	XUYZcr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDg6F-0000000FeGQ-4BXe;
	Tue, 28 Oct 2025 09:34:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDg6D-0000000FeF3-40ya
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:34:43 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso9740933a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761644080; x=1762248880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odW3qtXEWjV0YpOhuEaOM6Q/wDrQniW9fcSMR6G8lw0=;
        b=hSz0ZSKPrQ2dFst1GCqwU7fwP9QHlPpXET09AsclPhDFsbygwesJ6bR16YdWPmuBt4
         ML0uQLXNVeK44s53RPuyupavyil5dfqbQypm91ebV59j4Jb7daXqQtUWcCzA2gz6Qf10
         VawVBtgfQvu8Fyf0W8BTwd+JNxWqK/KhBUEq7kgzhtzTMO5SdgRuE+CqVekRS+F4Bi+s
         ODyhOw01KrHnte5HKPO0tNMj3ZKGR45HiD+FSvLraWw5n4uQwRANp0rahA4m+NdoxANv
         me2KWV/cKKB2HGWOq2r/uEV8s46BL+PIsplD4iQmhh/z0OTpUTg4GYKeFBcS2BmzRL4A
         ijNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644080; x=1762248880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odW3qtXEWjV0YpOhuEaOM6Q/wDrQniW9fcSMR6G8lw0=;
        b=oeX1c8/YHA4YhpQ+VLsv9PrVggsJXfAwQY6SEgAxQVeiMIMxLq2tafnlKvNj2rOxpS
         0Qva3tFwbXaN7UoS3rryr8H4Q4neJjX2IU2OIqs7S6Kjy34QlYqSYuKv/YVEjb1r+cMZ
         F03K/veGVwfJk+r/55UHpD0LAAt4OvPFwJ1DljqA3BChxFDQ7f6FSs2WuL+l/Mp4dkDc
         Nmb6EBtIQdM9kGI/Z0yp4/+RZhYlB1QyafS/oW6j2dGyZs/+fZpjSK6Mq7ZeHBr/pG5q
         tF01jnpBM9xYCoxLoYJwvwAH/jR79FuSNCHrTLJFbnP0gAT72w6D19LN5TmZEhfqzG2o
         1j/w==
X-Forwarded-Encrypted: i=1; AJvYcCULH71h2gSeKpVFmnBiCRydjZy9inSTy9hZDbNtbnF8khaHbwdXEc2Nceh/mVougtXoUwKlHw0tTSkhpWc67x99@lists.infradead.org
X-Gm-Message-State: AOJu0YwoGprvVb3+fyyIGNxDFrK++QNyoOCa7zuOnOc/GR+9lA7w/h8i
	JaYCyDrizytWcxXkzA1Va8vvHrCo5oWQxQUk4fSnDe2BnK6Ow609vnfyEgT2oCC2fJAmidxsiJ7
	XG12T1VxVySNlXfJb+nmsZIsmusDtxeQ=
X-Gm-Gg: ASbGnctTUY3UjMxWMGLPgw70FzfC+EHUjOyPenh0xI1GD1MmcjJ1Ks5ke5iG0tpf6FZ
	sza+jIe6JN32klkzG/qPj53k4XjaqE915oRVOmDWrBojyJ8vLxkSXpeGrnNmbfcm+DhJvsQbaNt
	yOsrkFu6mxMvnWjRbjlC+zMfWIcGgO3FBosh7kEis2No5lWhrYy3jGrBHecUjNq+BHb6T71eD/E
	Rlc7/XNS3B/skP8sDXxLqOXeCCtkYZvfoIQZ/DFr4tPb296WTu6XS9WksU=
X-Google-Smtp-Source: AGHT+IGsPCbe8r5dH8aant/YcEWw31jcAKY6dud6j8gJef9y0b9mBgF4kNxJ/GBJ3EJ/6/I5pBM64WHstQkAUKfPv+w=
X-Received: by 2002:a05:6402:84a:b0:63c:533f:4b18 with SMTP id
 4fb4d7f45d1cf-63ed8279e25mr2443085a12.36.1761644079781; Tue, 28 Oct 2025
 02:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com> <4fe0ccf9-8866-443a-8083-4a2af7035ee6@rock-chips.com>
In-Reply-To: <4fe0ccf9-8866-443a-8083-4a2af7035ee6@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 28 Oct 2025 15:04:22 +0530
X-Gm-Features: AWmQ_bmPsHqocSX1aRGHrBmzWUPGfL89N89yzNkDBUrKAG5QnhtWURPNx9mXmf8
Message-ID: <CANAwSgRXcg4tO00SNu77EKdp6Ay6X7+_f-ZoHxgkv1himxdi0Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251028_023442_028188_63B8E941 
X-CRM114-Status: GOOD (  29.59  )
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

Thanks for your review comments.

On Tue, 28 Oct 2025 at 05:56, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> =E5=9C=A8 2025/10/27 =E6=98=9F=E6=9C=9F=E4=B8=80 22:55, Anand Moon =E5=86=
=99=E9=81=93:
> > Introduce a .remove() callback to the Rockchip DesignWare PCIe
> > controller driver to ensure proper resource deinitialization during
> > device removal. This includes disabling clocks and deinitializing the
> > PCIe PHY.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pc=
i/controller/dwc/pcie-dw-rockchip.c
> > index 87dd2dd188b4..b878ae8e2b3e 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_dev=
ice *pdev)
> >       return ret;
> >   }
> >
> > +static void rockchip_pcie_remove(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct rockchip_pcie *rockchip =3D dev_get_drvdata(dev);
> > +
> > +     /* Perform other cleanups as necessary */
> > +     clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> > +     rockchip_pcie_phy_deinit(rockchip);
> > +}
>
> Thanks for the patch.
>
> Dou you need to call dw_pcie_host_deinit()?
I feel the rockchip_pcie_phy_deinit will power off the phy
> And I think you should also try to mask PCIE_CLIENT_INTR_MASK_MISC and
> remove the irq domain as well.
>
> if (rockchip->irq_domain) {
>         int virq, j;
>         for (j =3D 0; j < PCI_NUM_INTX; j++) {
>                 virq =3D irq_find_mapping(rockchip->irq_domain, j);
>                 if (virq > 0)
>                         irq_dispose_mapping(virq);
>          }
>         irq_set_chained_handler_and_data(rockchip->irq, NULL, NULL);
>         irq_domain_remove(rockchip->irq_domain);
> }
>
I have implemented resource cleanup in rockchip_pcie_remove,
which is invoked when the system is shutting down.
Your feedback on the updated code is welcome.

static void rockchip_pcie_remove(struct platform_device *pdev)
{
        struct device *dev =3D &pdev->dev;
        struct rockchip_pcie *rockchip =3D dev_get_drvdata(dev);
        int irq;

        irq =3D of_irq_get_byname(dev->of_node, "legacy");
        if (irq < 0)
                return;

        /* Perform other cleanups as necessary */
        /* clear up INTR staatus register */
        rockchip_pcie_writel_apb(rockchip, 0xffffffff,
                                 PCIE_CLIENT_INTR_STATUS_MISC);
        if (rockchip->irq_domain) {
                int virq, j;
                for (j =3D 0; j < PCI_NUM_INTX; j++) {
                        virq =3D irq_find_mapping(rockchip->irq_domain, j);
                        if (virq > 0)
                                irq_dispose_mapping(virq);
                }
                irq_set_chained_handler_and_data(irq, NULL, NULL);
                irq_domain_remove(rockchip->irq_domain);
        }

        clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
        /* poweroff the phy */
        rockchip_pcie_phy_deinit(rockchip);
        /* release the reset */
        reset_control_assert(rockchip->rst);
        pm_runtime_put_sync(dev);
        pm_runtime_disable(dev);
        pm_runtime_no_callbacks(dev);
}

> Another thin I noticed is should we call pm_runtime_* here for hope that
> genpd could be powered donw once removed?
>
I could not find 'genpd' (power domain) used in the PCIe driver
If we have an example to use genpd I will update this.

I am also looking into adding NOIRQ_SYSTEM_SLEEP_PM_OPS

Thanks
-Anand

