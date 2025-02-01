Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE53C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=E8DilspJrPm43rY05xEzunwjtKpS26QPI295ll95QRI=; b=U5HwSmz0RtkkFAdz+GfXjZ1pMg
	kxL754kND214oStm6YUBiT6aHGStabuHz2XOMOGamtw5BS1icUMBkyAyx8X7fq9AIpUp4CF7+MO+6
	2+3TYaUFh7gw7CgZR1LBVbWfuwQBHsoK8pKvPsA2ml7HlObP3/5mwTEEOn5xwSQLglKHnwQX+lxKW
	8BdmAjxA86eWCukYDDf5f+jB/AT57ezoh4GJZ9W7iK292/8u02nN5726iuzZXImcYMJ3/q0HFgWIr
	nFF6CAa1PM+i0F4xb1cQlt2S0IZ3tiTRcv+Fj81VoVXuBp2/47i/TrX4/I0+k3diRtioRmJrIBUTO
	v9Izpoxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teGzS-0000000CvWO-03ee;
	Sat, 01 Feb 2025 17:09:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teGy7-0000000CvRT-3Dbe;
	Sat, 01 Feb 2025 17:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCEAFA4042E;
	Sat,  1 Feb 2025 17:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BD0C4CED3;
	Sat,  1 Feb 2025 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738429662;
	bh=G19+TkOemeOISodRMMtQoREdptCX30LnWf9AyiZ2MyM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SrxNuOWB1mCam1s7TfwBc2fkdrPjxhstbjjHns9dXBBlZZoxLwrsvREmOrRbIv3j9
	 USIdiYH2847uQPA1/xQTV/8cXtOfPi/srMm8PSfMwhAIumQdKBfJP+gTF5xv1mR7G5
	 ym1jkXFjEyUBcnoSEJDzQwSkIV2moDARQiLVUym0OpA+/g/cF8hD9PqJ8DZOiHMZw+
	 /Q1TYXK9JYCqDG9x5T46K8H5dCf8CRqg2quDaN46CwgHKHBNp/+4FmdSRv8Ta0GaRW
	 pMQHo3oW/jE6MlTRJKVRMAKj2nF0YyRIB6Mmfp3oTNPsNKUyaWlH3dKqOCkdki+Bsr
	 R4+Tfh4KII9xA==
Date: Sat, 1 Feb 2025 11:07:40 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <20250201170740.GA731664@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201162416.azp4slqqeabo2xyl@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_090743_943440_A9E5F105 
X-CRM114-Status: GOOD (  25.07  )
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

On Sat, Feb 01, 2025 at 09:54:16PM +0530, manivannan.sadhasivam@linaro.org wrote:
> On Mon, Jan 27, 2025 at 06:41:50PM -0600, Bjorn Helgaas wrote:
> > On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> > > On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > > > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > > > when
> > > > > building on some platforms.

> > > > >       snprintf(name, sizeof(name), "port%d", slot);
> > > > > -     port->base = devm_platform_ioremap_resource_byname(pdev,
> > > > > name);
> > > > > +     regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > > name);
> > > > > +     if (!regs)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     port->base = devm_ioremap_resource(dev, regs);
> > > > >       if (IS_ERR(port->base)) {
> > > > >               dev_err(dev, "failed to map port%d base\n", slot);
> > > > >               return PTR_ERR(port->base);
> > > > >       }
> > > > > 
> > > > > +     port->msg_addr = regs->start + PCIE_MSI_VECTOR;
> > 
> > I think this still assumes that a CPU physical address
> > (regs->start) is the same as the PCI bus address used for MSI, so
> > this doesn't seem like the right solution to me.
> > 
> > Apparently they happen to be the same on this platform because (I
> > assume) MSIs actually do work, but it's not a good pattern for
> > drivers to copy.  I think what we really need is a dma_addr_t, and
> > I think there are one or two PCI controller drivers that do that.
> 
> I don't see why we would need 'dma_addr_t' here. The MSI address is
> a static physical address on this platform and that is not a DMA
> address. Other drivers can *only* copy this pattern if they also
> have the physical address allocated for MSI.

Isn't an MSI on PCI just a DMA write to a certain address?  My
assumption is that if you put an analyzer on that link, an MSI from a
device would be structurally indistinguishable from a DMA write from
the device.  The MSI uses a different address, but doesn't it use the
same size and kind of address, at least from the PCIe protocol
perspective?

Bjorn

