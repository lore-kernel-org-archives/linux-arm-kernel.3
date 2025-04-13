Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ADDC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDGkU74MBhCdgJJMoNaDSjeUhoyAzk0gL7nqKzTZvSA=; b=cHzz9EMOGCDww0DI/PjKWwGtPr
	Rd6QnB0Sz9pR/2t5jRQqQzi9Aws6JAGRz9aOCz8Q3leH7ENMGLOT/55hWuLPQsX5w9DFL3bNl+QCQ
	qHqXuqBLmZBSq3d2WsQuEn1W/MIayuEd+9XQngZJUKNUbhh4qwCyDs8aLt4ZtTH8TyUurviuu5mOa
	+mMvoOhk3u8YlB2fSalyPNXvxCoLEvnHqGjUp2SFdqfR2fnHzTT5r6semY86cLcvDLitpC5r6QIWv
	T5EbGSDJhNcVtBdfAnwm7Gi7R1wFWXv+h6NvDJY480/Y6IF29hqCanLBp8Ed2i42NUjzIFFyKZ7hH
	+gCltrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3y74-0000000HFrv-2aWb;
	Sun, 13 Apr 2025 14:15:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3y5D-0000000HFfU-20uX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 14:13:16 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-739525d4e12so3051060b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744553594; x=1745158394; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDGkU74MBhCdgJJMoNaDSjeUhoyAzk0gL7nqKzTZvSA=;
        b=fJo5R6watu44yvOZKSvHRM/XmTuS28rwc+rDd/q8LXe2xBaG9jKlsdpkj61KA+GM1i
         zchClqHQq/LXKxJUazhXdL6Yek+oh3Y8HTxjyfZKhP/rlkBL/upvuz8VLGWpB3vmcuoe
         gq8PL4TnfNjHnHhoNbiTuSrBnl3ZtidSJjoKqkGAcwIae98omLwoHPAWL+7Uqyj8zGLY
         IHISKKzihGXpV2yVizZFQRHFxHE1vKMi/R0YfiLK1mNUOxyMg0Zdb6ZORIpdeDDSZ4lB
         mbi7yZZ+7BpkZTzg1VSG+lx9+XYYvQ+xXiSp097GvlXVApFiHIwp6/2MHig3VBLHLrx1
         nVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744553594; x=1745158394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDGkU74MBhCdgJJMoNaDSjeUhoyAzk0gL7nqKzTZvSA=;
        b=WPUHAOlOhEBUg+o9jpqhjCoVtIYlkPra2zidcr6eiIaWffUj0ZVKhUH3Y9BKqhKHnE
         O6audtRtxrN+308XKFByuYKT7lnsyMIylvQQ0myKnoRDd3Qjds5IauerzCTczkpjfryj
         Gr9ufSiaeBSdkdIbpdp5VQmWnbOhzq3jFejZ4exojogwez4EOv0wB/WgNjXRiEnVnR9h
         xe8Yxm0R19Gf7TnaxxEth7T7nETHXwo7ripP+lKWnfz035NNH5uMd5OFZ1vzcczL1G9H
         UDke65Hm4AgNRQrsoiIENaCLqnQUaNiK5jy1D9k7L2Xp03sFJz1YPV5w0r6y7PQQo/UQ
         y51Q==
X-Forwarded-Encrypted: i=1; AJvYcCXot9hgOdvDdNeaaiR2QCpd2sY+rOkWluFd551eTkVOpXz16bir0YeaPOzmZJmeOmNrxCv612NemNf9tQJtDNH2@lists.infradead.org
X-Gm-Message-State: AOJu0YwBCZxtSdG0kp1El4an4mmP/x5NHhUAi+731FSaszbbXAG3nRDF
	RTRICujEC4WpAgB0QrWPHR0xEuvTu9ATpzZBsaKN9cyml2P1BTQ5EGhCAgaDWg==
X-Gm-Gg: ASbGncu6CbS/1tEnGvmrbEirWM0eiRkYbj478UuFMm3vhZvjgTsaPQmXM0zt6Lul5Zt
	7QewiC1yGjFsKAC2D+PFF61luctouTikTWHN9O3dzRUEBNaEwtNv0XOLWXsvCcIvAQkpiYlysep
	nfk0qjdlmlaMMtfbiYY/UnMXe37NV34tgpRov2Pi6fLYu3Hdr8bVNClb9o8FJB3W+1CmCT95tyl
	Auhdda1UoRj6Gt7cV0NcUTJRN1qlrT7GRghLujmfGB363wSmJ6DWDIwSksMDIowaEwWYFlMIcvj
	5/JzDgmrqLRrelcXrIocWnaRBehhQg34ODuBcb9uCYeDgSpeHib4
X-Google-Smtp-Source: AGHT+IG3KsEC7opdxKauuCqzbkQebp3bxI0hJGkx4B9uTAWlK9jJFs28Sw9U9lh+D1sRPZ4sMA2Hkw==
X-Received: by 2002:a05:6a00:4644:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-73bd12b1315mr12154297b3a.23.1744553593852;
        Sun, 13 Apr 2025 07:13:13 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c33bfsm4979324b3a.42.2025.04.13.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 07:13:12 -0700 (PDT)
Date: Sun, 13 Apr 2025 19:43:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org, 18255117159@163.com, 
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com, 
	thomas.richard@bootlin.com, bwawrzyn@cisco.com, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 4/4] PCI: j721e: Add support to build as a loadable
 module
Message-ID: <6bi5gul3sqvycmkf6cwokkvownjffaf2tkonjlefo2d7cautwx@uhfexzgz3okp>
References: <20250330083914.529222-1-s-vadapalli@ti.com>
 <20250330083914.529222-5-s-vadapalli@ti.com>
 <zsxnx7biwogov5dw5yiafkgk6tsrtspac75bjbrca5uevweaim@ly67hwfyk7qh>
 <20250409064227.ctzznnb2shaygxhm@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409064227.ctzznnb2shaygxhm@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_071315_543912_B9478206 
X-CRM114-Status: GOOD (  31.32  )
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

On Wed, Apr 09, 2025 at 12:12:27PM +0530, Siddharth Vadapalli wrote:
> On Wed, Apr 09, 2025 at 12:06:35PM +0530, Manivannan Sadhasivam wrote:
> 
> Hello Mani,
> 
> > On Sun, Mar 30, 2025 at 02:09:14PM +0530, Siddharth Vadapalli wrote:
> > > The 'pci-j721e.c' driver is the application/glue/wrapper driver for the
> > > Cadence PCIe Controllers on TI SoCs. Implement support for building it as a
> > > loadable module.
> > > 
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > ---
> > > 
> > > v1:
> > > https://lore.kernel.org/r/20250307103128.3287497-5-s-vadapalli@ti.com/
> > > Changes since v1:
> > > - Based on feedback from Thomas at:
> > >   https://lore.kernel.org/r/88b3ecbe-32b6-4310-afb9-da19a2d0506a@bootlin.com/
> > >   the "check" for a non-NULL "pcie-refclk" in j721e_pcie_remove() has been
> > >   dropped.
> > > 
> > > Regards,
> > > Siddharth.
> > > 
> > >  drivers/pci/controller/cadence/Kconfig     |  6 ++--
> > >  drivers/pci/controller/cadence/pci-j721e.c | 33 +++++++++++++++++++++-
> > >  2 files changed, 35 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> > > index 82b58096eea0..72d7d264d6c3 100644
> > > --- a/drivers/pci/controller/cadence/Kconfig
> > > +++ b/drivers/pci/controller/cadence/Kconfig
> > > @@ -43,10 +43,10 @@ config PCIE_CADENCE_PLAT_EP
> > >  	  different vendors SoCs.
> > >  
> > >  config PCI_J721E
> > > -	bool
> > > +	tristate
> > >  
> > >  config PCI_J721E_HOST
> > > -	bool "TI J721E PCIe controller (host mode)"
> > > +	tristate "TI J721E PCIe controller (host mode)"
> > >  	depends on ARCH_K3 || COMPILE_TEST
> > >  	depends on OF
> > >  	select PCIE_CADENCE_HOST
> > > @@ -57,7 +57,7 @@ config PCI_J721E_HOST
> > >  	  core.
> > >  
> > >  config PCI_J721E_EP
> > > -	bool "TI J721E PCIe controller (endpoint mode)"
> > > +	tristate "TI J721E PCIe controller (endpoint mode)"
> > >  	depends on ARCH_K3 || COMPILE_TEST
> > >  	depends on OF
> > >  	depends on PCI_ENDPOINT
> > > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > > index ef1cfdae33bb..8bffcd31729c 100644
> > > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/irqchip/chained_irq.h>
> > >  #include <linux/irqdomain.h>
> > >  #include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/pci.h>
> > >  #include <linux/platform_device.h>
> > > @@ -27,6 +28,7 @@
> > >  #define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
> > >  
> > >  #define ENABLE_REG_SYS_2	0x108
> > > +#define ENABLE_CLR_REG_SYS_2	0x308
> > >  #define STATUS_REG_SYS_2	0x508
> > >  #define STATUS_CLR_REG_SYS_2	0x708
> > >  #define LINK_DOWN		BIT(1)
> > > @@ -116,6 +118,15 @@ static irqreturn_t j721e_pcie_link_irq_handler(int irq, void *priv)
> > >  	return IRQ_HANDLED;
> > >  }
> > >  
> > > +static void j721e_pcie_disable_link_irq(struct j721e_pcie *pcie)
> > > +{
> > > +	u32 reg;
> > > +
> > > +	reg = j721e_pcie_intd_readl(pcie, ENABLE_CLR_REG_SYS_2);
> > > +	reg |= pcie->linkdown_irq_regfield;
> > > +	j721e_pcie_intd_writel(pcie, ENABLE_CLR_REG_SYS_2, reg);
> > > +}
> > > +
> > >  static void j721e_pcie_config_link_irq(struct j721e_pcie *pcie)
> > >  {
> > >  	u32 reg;
> > > @@ -633,9 +644,25 @@ static void j721e_pcie_remove(struct platform_device *pdev)
> > >  	struct j721e_pcie *pcie = platform_get_drvdata(pdev);
> > >  	struct cdns_pcie *cdns_pcie = pcie->cdns_pcie;
> > >  	struct device *dev = &pdev->dev;
> > > +	struct cdns_pcie_ep *ep;
> > > +	struct cdns_pcie_rc *rc;
> > > +
> > > +	if (pcie->mode == PCI_MODE_RC) {
> > > +		rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
> > > +		cdns_pcie_host_disable(rc);
> > > +	} else {
> > > +		ep = container_of(cdns_pcie, struct cdns_pcie_ep, pcie);
> > > +		cdns_pcie_ep_disable(ep);
> > > +	}
> > > +
> > > +	if (pcie->reset_gpio) {
> > > +		msleep(PCIE_T_PVPERL_MS);
> > 
> > There is no point in adding a delay before PERST# assertion.
> 
> True :)
> 
> > 
> > > +		gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> > 
> > This is not PERST# assert, isn't it? Typo?
> 
> It is PERST# assert.

Since the reset-gpios polarity is defined as GPIO_ACTIVE_HIGH in DT (which is
wrong unless you have an external component that changes polarity), for PERST#
assert, you need to set 0. If you set 1, then PERST# will be signalled as
deassert.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

