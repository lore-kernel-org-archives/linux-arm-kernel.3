Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8A3C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++On7KDtroDf34oNj2vJEgLtoair4LXrAFytlgiGD50=; b=aIgx5MkfTtAm9u9hBuUsKwOh8b
	DdpAOlT1uQo47i5ct1d2+NNH/r+FpnKhALPm6cvoCH/kJG55Qx4CPDeQoAhn5rEK3OpdWKJXL/+N1
	9Lkg6vg0ZBtphDRsUJhR2QGZulHexc6tMopJhi8dcaMnVrWdEF6YcWlxWX/U4jmxfM/aJEDcNlBHP
	mtGZVryUBEcESuJIz1O1aBx9o+e4Aw2BpTjIFf6/JF+jd6+2af+q4FesTZPfnE6hrLTJOBdGCn+sA
	eUJEb9bBI7AwqR5Lvog++01mW4IVwvgu6T4CONwgDYhJUVGTGWLZy5qqhcdLL6A5z6k1LIZe8sOlR
	ehpBjPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5TB-00000006xvN-0Gkw;
	Thu, 06 Feb 2025 17:15:17 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Rm-00000006xey-3f3E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 17:13:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f48ab13d5so10360935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738862029; x=1739466829; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=++On7KDtroDf34oNj2vJEgLtoair4LXrAFytlgiGD50=;
        b=fpfAHKb7pDYNc64cADbo6j8EGZlKU22YG9c3pZ3EZTP84RNJ7nVmoKEN/mGcmzYxRf
         KYfxBQdXE+IMfMFBeVbbtEGQC4WQtjGfBhynzsWLhVbV4djfnIwXs3eTNe08OtkeKfCj
         cjnohZ0T6O6J0OYiXUoUR6Jaz5Sbjo8Zw5fudBLrE+qPK5MXjCKXMSW66oAFuDsbcUd2
         H1s7Th9coj6AwMV+ZLhhZ3+NlKMUU7BtTtojvhElBMoZEK6RtzpUnuo4Uuw6VvEPF+Oz
         n9Zg38WT1rMBcU2Uw9b2g/GpatU0xsz3p3bkKXv9/bTggY1tdBtjTd+Vy8sG6DfA+aaO
         D1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738862029; x=1739466829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++On7KDtroDf34oNj2vJEgLtoair4LXrAFytlgiGD50=;
        b=a4uETTHhn7H2yETYdH89vgwCGU9QVHd0CX9pG2ihuFDRUQEpEudIJNuPOIuHfZzk80
         OBv0v4j36w8Gbs1hPKp3HV3WJmD57Msa9l8oLQSObA5qrAEYtbLF4yMAmw3Z21dM80D3
         KdfIvsDQgeypTsGrUFbcLekhrs773WxMvD19nzVJ+z17Mw5qt9FYDOkdcD9MBpsGv24P
         QxDsR4y71/njX66j/vwsA9JsnFYUk4EXy83pL/I4C/ANo1irLmA6meSUYif1O/eMNJK4
         JfgTo4Hxv14TQr4ngHSrIvn/xVvGiCrGQFC6h2XlICdu21AMU0g9SzFabD3MfRoiKzqj
         WUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu03CVpucDHrHsfVuoTLxesRmwQlffPCcdV7iJc10HxWfy/T0Gz1b1/PxPJwpsxD3C9aIcurkgt7JFlIXDpM+5@lists.infradead.org
X-Gm-Message-State: AOJu0YywU0OVeWarzIqst4VO90v2p/gMiVe1r4LVWC2eACNOX40dpfHx
	3CSC2nFHB59nfIDj7FCtAjkKC9MgIAhP2pzQSGGYwvL4YobYLMqK0K/q6WY05g==
X-Gm-Gg: ASbGnct4C+85FZ0vK21W7DOf4aP1Cmd9axAGeLWQi10A86j+3qpPkhgjoYu6YVV58Km
	e/WzIBHNKa/MFRNjL9uzry3rLz9FoySFxY+PltxslaHttWE4NdWn9p4UtMIqiWJuwwpAXxKYY7L
	Agr2hRxmjNbKkJL+1DSXQ9BtdCkaF+Vo0bULXb70V9iVeJj649wFVhFQ46TzQV30uhH0HQep9Gv
	+t9CDc/njf6d6lEHGstRGLkwsvgTItdCOPd0/NwdUtEqIUYjp+HeAY8N232hjLjJD7sqAxTjuFA
	e2SWj8KBf6x74LtR3NZ33B4ML5g=
X-Google-Smtp-Source: AGHT+IEi7kDHTM5kqvCT3m8M3uGH2PtQ237ql11AqlpeMMU7B/j29LzSOZBi2OJPv95Pp6eAwXZ+0A==
X-Received: by 2002:a17:902:f686:b0:216:2426:7666 with SMTP id d9443c01a7336-21f17df5651mr126780975ad.12.1738862029434;
        Thu, 06 Feb 2025 09:13:49 -0800 (PST)
Received: from thinkpad ([120.60.140.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a4f875sm1794525a91.24.2025.02.06.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:13:48 -0800 (PST)
Date: Thu, 6 Feb 2025 22:43:41 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <20250206171341.ms357hjxvegyspi6@thinkpad>
References: <20250203175049.idxegqqsfwf4dmvq@thinkpad>
 <20250203185246.GA794570@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203185246.GA794570@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_091350_918001_39D7C70B 
X-CRM114-Status: GOOD (  43.58  )
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

On Mon, Feb 03, 2025 at 12:52:46PM -0600, Bjorn Helgaas wrote:
> On Mon, Feb 03, 2025 at 11:20:49PM +0530, manivannan.sadhasivam@linaro.org wrote:
> > On Sat, Feb 01, 2025 at 11:07:40AM -0600, Bjorn Helgaas wrote:
> > > On Sat, Feb 01, 2025 at 09:54:16PM +0530, manivannan.sadhasivam@linaro.org wrote:
> > > > On Mon, Jan 27, 2025 at 06:41:50PM -0600, Bjorn Helgaas wrote:
> > > > > On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> > > > > > On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > > > > > > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > > > > > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > > > > > > when
> > > > > > > > building on some platforms.
> > > 
> > > > > > > >       snprintf(name, sizeof(name), "port%d", slot);
> > > > > > > > -     port->base = devm_platform_ioremap_resource_byname(pdev,
> > > > > > > > name);
> > > > > > > > +     regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > > > > > name);
> > > > > > > > +     if (!regs)
> > > > > > > > +             return -EINVAL;
> > > > > > > > +
> > > > > > > > +     port->base = devm_ioremap_resource(dev, regs);
> > > > > > > >       if (IS_ERR(port->base)) {
> > > > > > > >               dev_err(dev, "failed to map port%d base\n", slot);
> > > > > > > >               return PTR_ERR(port->base);
> > > > > > > >       }
> > > > > > > > 
> > > > > > > > +     port->msg_addr = regs->start + PCIE_MSI_VECTOR;
> > > > > 
> > > > > I think this still assumes that a CPU physical address
> > > > > (regs->start) is the same as the PCI bus address used for MSI, so
> > > > > this doesn't seem like the right solution to me.
> 
> Apart from the question of what type should be used, what do you think
> about this part?  I don't think we should assume that the address on
> PCI is identical to the CPU physical address.  IOMMUs and (I assume)
> iATUs can make them different, can't they?

IOMMU/iATU only gets into play if the address gets mapped and translated. If you
look at the patch, even though it maps the physical address to 'port->base', the
MSI address 'port->msg_addr' is actually populated with 'regs->start +
PCIE_MSI_VECTOR' which corresponds to the physical address without any
translation or mapping.

>  If so, this looks like an
> implicit assumption that PCI bus==CPU physical, and I think we should
> make that a little more explicit somehow.
> 

In this specific case, MSI address == Physical address.

> > > > > Apparently they happen to be the same on this platform because (I
> > > > > assume) MSIs actually do work, but it's not a good pattern for
> > > > > drivers to copy.  I think what we really need is a dma_addr_t, and
> > > > > I think there are one or two PCI controller drivers that do that.
> > > > 
> > > > I don't see why we would need 'dma_addr_t' here. The MSI address is
> > > > a static physical address on this platform and that is not a DMA
> > > > address. Other drivers can *only* copy this pattern if they also
> > > > have the physical address allocated for MSI.
> > > 
> > > Isn't an MSI on PCI just a DMA write to a certain address?
> > 
> > That's from the endpoint prespective when it triggers MSI.
> > 
> > > My assumption is that if you put an analyzer on that link, an MSI
> > > from a device would be structurally indistinguishable from a DMA
> > > write from the device.  The MSI uses a different address, but
> > > doesn't it use the same size and kind of address, at least from
> > > the PCIe protocol perspective?
> > 
> > Yeah, but in this case the address allocated to MSI belongs to a
> > hardcoded region in the host memory (not allocated by the DMA APIs
> > which will have the region attributed as DMA capable). So it doesn't
> > belong to the DMA domain, and we cannot use 'dma_addr_t'.
> 
> Doesn't .irq_compose_msi_msg() build the Message Address/Data pair
> that is programmed into a device's MSI Capability or MSI-X Table?
> The device will eventually use that to initiate a DMA write to that
> address.
> 

The device can indeed initiate the DMA transaction on this MSI address, but that
doesn't mean that the host will also use DMA to handle it. Given that the
physical address is used directly for MSI, the host might do non-DMA access
while receiving MSIs.

To clarify, if the device initiates a MSI by sending the MWr TLP to the host,
the host RC will intercept it and will signal the host CPU of the interrupt.
In this process, there is no need for the host to use DMA. DMA would certainly
make sense if the endpoint is issuing MWr/MRd TLPs to write/read to the host
DDR.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

