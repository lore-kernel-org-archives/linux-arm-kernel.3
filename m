Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C31DC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDnldeg6W/1rz40qXEdWC7PCXkPqXTii6QHNT2tQjqU=; b=uWxGOiEsqk2nn/GJJgowLaS4OM
	ueo7sTzJ5P7NaD4Tz78w43kIax6ZQpsCeAB+4k44wk/qW5egbQs/LNiErhUc8K6J+2sozVpK5pKMD
	v8jGcUH1gxU2pGwLlQQQfZRr4u33DqMZRCmB+PKTOmcu56ppJCEVU6N2lXajw2OrptIO7MQffd+hD
	ZermGgyWLE+CepmApP6PfO/SRhHkwrATM94Bfy92Jnf8eeZ5+3SH0KpbspCh96z7JHA6SwoCTIPKG
	Of1JGzs3bcOAT0NviVsrWIoX/iEZW8Ar49LSFUzl8K4GkDD2d+ccWHDJTOhDZheaN7ptu/YHoqFv7
	erpmrV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6CI-00000006L42-4148;
	Tue, 25 Mar 2025 15:28:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6AT-00000006Kcg-29jh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:26:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso7545871a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742916377; x=1743521177; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDnldeg6W/1rz40qXEdWC7PCXkPqXTii6QHNT2tQjqU=;
        b=ur8WtGIJ+8xUBxvyoIzUMQU5epOwOXrgpUI4FfrxjwVgrDp5L/ppD+n4r3wHz/r449
         p73BRaXj8gRi377QnKqU3lH1nn15Pd++4F38+oTdc3qsUQArvlz45wYi7U0WO7fvlMuf
         50w0M/oqzzmUxDUKWCEpZ/0Obx73f6f7VkwoQS3lrdDQd2sx1fvkVB4NERz49Xwf05Zf
         LfqyYpZ/86g+r4FKsRCJOQZm97VmpsxWvyref5vFtXsIZoZIwsiQa0EJM70xPmc6tbQp
         o6AcZYixJnreWgJN1szdrAjUSvDWPYJ5mMYHXIEN0pDy5uAz0rTQBTtkSEGpxoN/a+g0
         dakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742916377; x=1743521177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDnldeg6W/1rz40qXEdWC7PCXkPqXTii6QHNT2tQjqU=;
        b=sOzQBWi0ebsom18u6f7e+nHwrYhh7XKKXp2K5LV5zKDjq6GijmvthLcG4+xWWTn4Ke
         +2hkFi/TiIHytwusqZMSf7aD6KsQ+UaLbY3kTPTc1u4jMvOcpkhokDaxgMDvH42IuxbM
         fspkmPKwg0zAYVSvB9/DZaGVn7dK09jkL7d1wo6LxuKYKPJHkKXbdLFH23qj2he+maNO
         fcGF9CJTBi1MwMmjzCZT6WZm+uwC4OlMsI586Z+VrHZX83ZTph+o/oClMQdRHVJ5eR1M
         Diunz81B9znzKsqp6d4EqFN2gJu/Fs/aTQecKkDehhQ9iv+eJw6kYpyNYrjhOENV2hV8
         uXjA==
X-Forwarded-Encrypted: i=1; AJvYcCUBse9lRPkjkorz12tjJ4FpvkOLmZveTihp9hxZNFlOMGiN79Se4VQK8ZPOkIP+UiBaa5qgFdEC6wlphGQp2yWg@lists.infradead.org
X-Gm-Message-State: AOJu0YxlMmG4gM/P3Mn8gIL1VjC2lYwnxuhvTbPMfF54bIasIqDhA8gC
	fspUJ67vHsKz1BFiBLuKnHn6SHBHFZGQR84RrPhe+kHTqYaN1rePCNmGJg2U2Q==
X-Gm-Gg: ASbGnctbtLJnKQOE2TDeIacV1cZcGKlceZO+Xd2vIek5kw+bHJWQe+qma+hBtaT/Epr
	bPPc4ZqeJeheqXaVXbQJxUYDbYVhVt/tbvaI53aBxN57YKA21fhdpqA/RbvkP8V/7xmbMQ/Pyat
	+bPt5mDTn/aWpX0+YCi5wkV92gDpUVRcJiqnwkmrDi/H55lkPq8RvgRhfP6peu5hStKKbRJLq0O
	wc1djnDf6qjcSeJw32xt2W429ttMPBqnKzt+EJOMvduNLPBE7fhSpeZI6Uv/m4Hvr85yc/t3Cvd
	CiIconDCWnuzrd0ZJx0LVZYwyfvn+8CqCwt1JRB91/OMk6DHMkrleo8P
X-Google-Smtp-Source: AGHT+IHAz5zKC5LGUzafh40DAQCiyiA7I/xihj4TsaCt+ShCCQfQH6xabJ6+324CVpB/iZmGqJ1C/g==
X-Received: by 2002:a17:90b:134c:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-3030fe96732mr32216302a91.17.1742916376502;
        Tue, 25 Mar 2025 08:26:16 -0700 (PDT)
Received: from thinkpad ([120.60.136.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf636122sm14517600a91.45.2025.03.25.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 08:26:15 -0700 (PDT)
Date: Tue, 25 Mar 2025 20:56:09 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: "hans.zhang" <hans.zhang@cixtech.com>
Cc: Peter Chen <peter.chen@cixtech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "vigneshr@ti.com" <vigneshr@ti.com>, 
	"kishon@kernel.org" <kishon@kernel.org>, "cassel@kernel.org" <cassel@kernel.org>, 
	"wojciech.jasko-EXT@continental-corporation.com" <wojciech.jasko-EXT@continental-corporation.com>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>, 
	"bwawrzyn@cisco.com" <bwawrzyn@cisco.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "srk@ti.com" <srk@ti.com>
Subject: Re: [PATCH 0/4] Loadable Module support for PCIe Cadence and J721E
Message-ID: <bkw4xm4jwe3iuf6sixxl4udosea3bhlwogfua66naf5echbyzv@dlwcbscedh6w>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <Z9pffxeXHVOsoi4O@nchen-desktop>
 <20250319062534.ollh3s5t7znf5zqs@uda0492258>
 <Z9qO1f5MgNcwO5A4@nchen-desktop>
 <20250319095511.hf3y2c6vbbnm3ien@thinkpad>
 <a8966792-fa0e-4e8e-aceb-427819ae4ef5@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8966792-fa0e-4e8e-aceb-427819ae4ef5@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_082617_568769_1E70CB23 
X-CRM114-Status: GOOD (  47.55  )
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

On Thu, Mar 20, 2025 at 10:14:02AM +0800, hans.zhang wrote:
> 
> 
> On 2025/3/19 17:55, manivannan.sadhasivam@linaro.org wrote:
> > EXTERNAL EMAIL
> > 
> > On Wed, Mar 19, 2025 at 05:31:01PM +0800, Peter Chen wrote:
> > > On 25-03-19 14:25:34, Siddharth Vadapalli wrote:
> > > > > > 
> > > > > > Hello,
> > > > > > 
> > > > > > This series enables support to build the PCIe Cadence Controller drivers
> > > > > > and the PCI J721E Application/Wrapper/Glue driver as Loadable Kernel
> > > > > > Modules. The motivation for this series is that PCIe is not a necessity
> > > > > > for booting the SoC, due to which it doesn't have to be a built-in
> > > > > > module. Additionally, the defconfig doesn't enable the PCIe Cadence
> > > > > > Controller drivers and the PCI J721E driver, due to which PCIe is not
> > > > > > supported by default. Enabling the configs as of now (i.e. without this
> > > > > > series) will result in built-in drivers i.e. a bloated Linux Image for
> > > > > > everyone who doesn't have the PCIe Controller.
> > > > > 
> > > > > If the user doesn't enable PCIe controller device through DTS/ACPI,
> > > > > that's doesn't matter.
> > > > 
> > > > The Linux Image for arm64 systems built using:
> > > > arch/arm64/configs/defconfig
> > > > will not have support for the Cadence PCIe Controller and the PCIe J721e
> > > > driver, because these configs aren't enabled.
> > > > 
> > > > > 
> > > > > > @@ -209,6 +209,12 @@ CONFIG_NFC=m
> > > > > >   CONFIG_NFC_NCI=m
> > > > > >   CONFIG_NFC_S3FWRN5_I2C=m
> > > > > >   CONFIG_PCI=y
> > > > > > +CONFIG_PCI_J721E=m
> > > > > > +CONFIG_PCI_J721E_HOST=m
> > > > > > +CONFIG_PCI_J721E_EP=m
> > > > > > +CONFIG_PCIE_CADENCE=m
> > > > > > +CONFIG_PCIE_CADENCE_HOST=m
> > > > > > +CONFIG_PCIE_CADENCE_EP=m
> > > > > 
> > > > > The common Cadence configuration will be select if the glue layer's
> > > > > configuration is select according to Kconfig.
> > > > > 
> > > > > Please do not set common configuration as module, some user may need
> > > > > it as build-in like dw's. Considering the situation, the rootfs is at
> > > > > NVMe.
> > > > 
> > > > The common configuration at the moment is "DISABLED" i.e. no support for
> > > > the Cadence Controller at all. Which "user" are you referring to? This
> > > > series was introduced since having the drivers built-in was pushed back at:
> > > 
> > > We are using Cadence controller, and prepare upstream radxa-o6 board
> > > whose rootfs is at PCIe NVMe.
> > > 
> > 
> > It doesn't matter. Only criteria AFAIK to build the driver as built-in in
> > defconfig is that it should be a depedency for console. For some time, storage
> > was also a dependency, but for sure PCIe is not.
> > 
> > Moreover, CONFIG_BLK_DEV_NVME is built as a module in ARM64 defconfig. So it
> > doesn't matter if you build PCIe controller driver as a built-in or not. You
> > need to load the NVMe driver somehow.
> > 
> > So please use initramfs.
> > 
> > > You could build driver as module for TI glue layer, but don't force
> > > other vendors using module as well, see dwc as an example please.
> > > 
> > 
> > DWC is a bad example here. Only reason the DWC drivers are not loadable is due
> > to the in-built MSI controller implementation as irqchip. People tend to build
> > the irqchip controllers as always built-in for some known issues. Even then some
> > driver developers prefer to built them as loadable module but suppress unbind to
> > avoid rmmoding the module.
> Hi Mani,
> 
> I think the MSI RTL module provided by Synopsys PCIe controller IP is not a
> standard operation. The reason for this MSI module is probably to be used by
> some cpus that do not have ITS(LPI interrupt) designed. Or RISC-V SOC, etc.
> MSI is defined as an MSI/MSIX interrupt that starts with a direct write
> memory access.
> 

Yeah, DWC MSI controller is not a great design. The older ones are even more
horrible (using SPI interrupts for reporting AERs etc...).

> There are also SOC vendors that do not use the built-in MSI RTL module.
> Instead, MSI/MSIX interrupts are transmitted directly to the GIC's ITS
> module via the GIC V3/V4 interface. For example, RK3588, they do not use the
> PCIe controller built-in MSI module. Some Qualcomm platforms also modify the
> PCIe controller's built-in MSI modules to connect each of them to 32 SPI
> interrupts to the GIC. I was under the impression that the SDM845 was
> designed that way. The only explanation is that SPI interrupts are faster
> than LPI interrupts without having to look up some tables.
> 

If ITS is available, platforms should make use of that. There is no way DWC MSI
is superior than ITS. We are slowly migrating the Qcom platforms to use ITS.

And btw, Qcom DWC MSI controller raise interrupts for AER/PME sent by the
downstream components. So enabling ITS is uncovering AER errors which were
already present :)

> So the dwc driver can also compile to ko?
> 

Only if the MSI support is made as a build time option and there is a guarantee
that the platform will never use it (which is difficult to do as the driver can
only detect it during the runtime based on devicetree).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

