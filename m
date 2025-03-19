Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9748C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnVvGzQPAnyj4mnUyy5QvfWa2P714m+BjFv+31OFFM4=; b=zRMh1dGVcPU/oQVhlFE/kcRJNi
	0pu4pElLVJAeV/phnnz/Ex9OiLd0BgYDH2FICD4I5+DJfVusbvJgjrF/a8zMqlHnZxMlPuvLKtrFR
	wJYkEjvWdYVnJzTFTkByP6pHisduEfnN5hM9e9idCNuj2wxPnRDgr9PfxZY1Vc+I/atRG/XAqck5U
	DeUWgAkSlJB6bhxGzIdbNlPmgcy1h5qraQbgDDCKNZTczl6zLqkkIxZuQUp0Wg2WZ9xIorrjGFukp
	n4Hnl0eBC91+/cX3O9s0hVj0vo18ej1lZvg6y+3OLGgbzSfDA1HC+jbhigBo/WPcHEJ7H6hQfqGzL
	/IY6Z02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqG8-00000008bgx-1sJD;
	Wed, 19 Mar 2025 10:02:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq8v-00000008aLe-0620
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:55:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22349bb8605so146881185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742378120; x=1742982920; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WnVvGzQPAnyj4mnUyy5QvfWa2P714m+BjFv+31OFFM4=;
        b=A7MtxpLdV/myBv7s0U0VWi57cIMBt/QYoXVBtL4woFPvUYPqX4yEbpRcaTKePypC07
         3yxLYegzJ9GwCnNozCLxdO96vf1wDecfneTzWLqVY19A7/GuBHH5KTylkG0I/GMXYdIm
         7gTQRRJqViZz/B4aOv/eeK1ptQM/o53IH/A/HN7skAULPVpReWcLufycNwbzIKVa/Tln
         5PLDINiPoLumfH1YpcXSw9DtM/YdK+XfA5Ul0gR5gAn39vQy5Are+EBxN93/r++wKmb6
         khRtI/+c6Hrb43MnP/aQPrtJDgqq0AvCCmziCOLWowGQO01On54ai3PEsXC/vHDK0EVF
         XB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378120; x=1742982920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WnVvGzQPAnyj4mnUyy5QvfWa2P714m+BjFv+31OFFM4=;
        b=U0uXujKIL6P2Lusu+2qpj0yg8BQDkDWU/uPKEmLvqueReDEZTfUtT3ZShVlMLapv4D
         wTHUYX5AsJWKHgVoaGvu7dKb34gEVpE9G32NKinhWK4FMy5Pg+fveuMyAeOLUs0F7Va5
         ci/U7H5MLxpjFLeN5zKnulg3IJQ68fdjZPEKL9rKEnJ0beenTfnI+FbKFA5NAhEZWUFd
         yz2/E/sI/R+axy936MR8QFlCpKA0+kxYkkQgJroV0/b+j+hL3Oou3p7Se1Sb0y9TuCpK
         hGy8PWLFNPwDUsicnnmrtQL6oPeomVSlYaTks/cQd3Pft/RBPeZX3CR+NIXveaB+LxxY
         G8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBylgGJPlgKH0ohbiiw52Kb03OZHAemN5M0kgZz39LKTsPrw1Rxw3p2jTPBpXkXKQ9QMy8OIIlhFWb8SV4kwzw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz12USYE92mk1lgs0pwlenhrIFVaWJDIwJHfLVZU6Z3aWU4TalJ
	xDqUWoeS8wgvS/s2JsaYg574osgFmXfcSDJYoX+V0gEz8tbw/R1cXohZdDYfYA==
X-Gm-Gg: ASbGncuxivr+ZuZPfogSAmtYduz95SB3ilQqU+PlU0TsBuULLwIKOMB1M36pYtLl1Sg
	2j0c6RI7ZxvERfTTwpB9fFqA4mnC0JWjsJbcxL1weo6AlF40mTL+okNFi+nn/0db2TszoFNbFso
	wK0AoEV0f6WzHzwn9K6JnmaOLbnhRLa2/kgZfXXwTOKXr/workOnQ27ED8lW/ggAMv2q6uFyyVj
	ADnhKn82bZ6MdfNCJ5PBDfeegrP3WEebkcN8xFv1rVx0Pl3BJWDpaTRIdEEP4mo3X39CNbj/Pqv
	9b7QVJkEOeyY+xXwroJ1w3zZIPgHTKle2nwayjsKD/Fa5QZYDGHcieg=
X-Google-Smtp-Source: AGHT+IGY1KwFvtNIJJm5MS9eiMIfZ3YUeAX6DKMaBqQ27dy8OhBjwCrp+JyiEaWtexFKt71h73MydQ==
X-Received: by 2002:a05:6a00:9a4:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-7376d645bcemr3514839b3a.14.1742378119616;
        Wed, 19 Mar 2025 02:55:19 -0700 (PDT)
Received: from thinkpad ([120.60.70.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea0511bsm10473365a12.45.2025.03.19.02.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:55:19 -0700 (PDT)
Date: Wed, 19 Mar 2025 15:25:11 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"cassel@kernel.org" <cassel@kernel.org>,
	"wojciech.jasko-EXT@continental-corporation.com" <wojciech.jasko-EXT@continental-corporation.com>,
	"thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
	"bwawrzyn@cisco.com" <bwawrzyn@cisco.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"srk@ti.com" <srk@ti.com>
Subject: Re: [PATCH 0/4] Loadable Module support for PCIe Cadence and J721E
Message-ID: <20250319095511.hf3y2c6vbbnm3ien@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <Z9pffxeXHVOsoi4O@nchen-desktop>
 <20250319062534.ollh3s5t7znf5zqs@uda0492258>
 <Z9qO1f5MgNcwO5A4@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9qO1f5MgNcwO5A4@nchen-desktop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_025521_065410_0414FC43 
X-CRM114-Status: GOOD (  32.93  )
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

On Wed, Mar 19, 2025 at 05:31:01PM +0800, Peter Chen wrote:
> On 25-03-19 14:25:34, Siddharth Vadapalli wrote:
> > > >
> > > > Hello,
> > > >
> > > > This series enables support to build the PCIe Cadence Controller drivers
> > > > and the PCI J721E Application/Wrapper/Glue driver as Loadable Kernel
> > > > Modules. The motivation for this series is that PCIe is not a necessity
> > > > for booting the SoC, due to which it doesn't have to be a built-in
> > > > module. Additionally, the defconfig doesn't enable the PCIe Cadence
> > > > Controller drivers and the PCI J721E driver, due to which PCIe is not
> > > > supported by default. Enabling the configs as of now (i.e. without this
> > > > series) will result in built-in drivers i.e. a bloated Linux Image for
> > > > everyone who doesn't have the PCIe Controller.
> > >
> > > If the user doesn't enable PCIe controller device through DTS/ACPI,
> > > that's doesn't matter.
> > 
> > The Linux Image for arm64 systems built using:
> > arch/arm64/configs/defconfig
> > will not have support for the Cadence PCIe Controller and the PCIe J721e
> > driver, because these configs aren't enabled.
> > 
> > >
> > > > @@ -209,6 +209,12 @@ CONFIG_NFC=m
> > > >  CONFIG_NFC_NCI=m
> > > >  CONFIG_NFC_S3FWRN5_I2C=m
> > > >  CONFIG_PCI=y
> > > > +CONFIG_PCI_J721E=m
> > > > +CONFIG_PCI_J721E_HOST=m
> > > > +CONFIG_PCI_J721E_EP=m
> > > > +CONFIG_PCIE_CADENCE=m
> > > > +CONFIG_PCIE_CADENCE_HOST=m
> > > > +CONFIG_PCIE_CADENCE_EP=m
> > >
> > > The common Cadence configuration will be select if the glue layer's
> > > configuration is select according to Kconfig.
> > >
> > > Please do not set common configuration as module, some user may need
> > > it as build-in like dw's. Considering the situation, the rootfs is at
> > > NVMe.
> > 
> > The common configuration at the moment is "DISABLED" i.e. no support for
> > the Cadence Controller at all. Which "user" are you referring to? This
> > series was introduced since having the drivers built-in was pushed back at:
> 
> We are using Cadence controller, and prepare upstream radxa-o6 board
> whose rootfs is at PCIe NVMe.
> 

It doesn't matter. Only criteria AFAIK to build the driver as built-in in
defconfig is that it should be a depedency for console. For some time, storage
was also a dependency, but for sure PCIe is not.

Moreover, CONFIG_BLK_DEV_NVME is built as a module in ARM64 defconfig. So it
doesn't matter if you build PCIe controller driver as a built-in or not. You
need to load the NVMe driver somehow.

So please use initramfs.

> You could build driver as module for TI glue layer, but don't force
> other vendors using module as well, see dwc as an example please.
> 

DWC is a bad example here. Only reason the DWC drivers are not loadable is due
to the in-built MSI controller implementation as irqchip. People tend to build
the irqchip controllers as always built-in for some known issues. Even then some
driver developers prefer to built them as loadable module but suppress unbind to
avoid rmmoding the module.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

