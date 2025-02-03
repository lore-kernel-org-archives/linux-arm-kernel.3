Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F08C02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzj9WiLIhOB5vMReFD5p6XHQD8Hfc0IzZaAIE1EbWG4=; b=vlw0t+jETH/Zi8LaLkp2MPjYCm
	9PoemPGwrIKVVXxMSBUIrGguhbMDkOZ/mf2Cag/EUcpoIFzMyqRM4om2/npN/tGathnRGHF+LFVVy
	LoYxc3GaedCeZ4DYkOtVqilDoepcr6PcJ807qy7uViumBS7ndrsrkNf4hLz3g+Ma9n2VHNtXuGwNH
	UXmKwhnxU1DUXcp+6HxjhZxFwW3DGpDUJHo9NSVx/PIUSHTI705IN8IVPue9OgYZmrCBifOxLY4Wr
	u6yLIJH4afQlfYDpxuaxTDP8KjCmcanhDmiw8X1VkjoENBQyvnIv0nR6OrgwXaQEojyNaz9D1zF3X
	o81ttVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0d6-0000000GBPv-3Wb3;
	Mon, 03 Feb 2025 17:53:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0b3-0000000GB65-3cCK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 17:50:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2161eb95317so81111465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 09:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738605057; x=1739209857; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mzj9WiLIhOB5vMReFD5p6XHQD8Hfc0IzZaAIE1EbWG4=;
        b=J3+UWB66WDtpbMCxmckl98RJKeA4Gi/FVEuhYzsme+dBXHjFtM40LFA3mh+0frlpg8
         mU5G1tADjmGy+kTjIufPCh82bgw0xLGvYrv909+KRpMrlYvaPBgjfbOoYovJAbVksge4
         zgdeLNwmDNzBg5ltX7i9RV11niDWKzpuwMC//8Qq4kKvBPNvwnF1j6IgGu+i5GAmERGD
         8L0BmvvSIxKDIcMbI9CW5SIJXu9UYT4VMdd5zygCVYTN1sNaDzzFci86djAZvaqIBF28
         JScLY80w62nW3kzMgHSLrluMFyjwVAs6IgBD5ZErU8ZYYGS7UZakfGiShSAx364Rpl0T
         c2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605057; x=1739209857;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzj9WiLIhOB5vMReFD5p6XHQD8Hfc0IzZaAIE1EbWG4=;
        b=V5ULKYmDmb2SCnlrzgS+sKxpHa6xoOF+6PeCDL1NxjcaVLfFljVGehB33V7V9nOR6Y
         IvBqqL6XERTdR4de4BceWC6mZGVCRAu4Bw6L8cvswZDXsNLYFq9T2RE3uMh7Laa4N2xp
         3v4A30ZoXUF6d6SbcN2rOtIGzLeCnz6pIi8oz/r+xbS0JuXFwKXvfsJBdU2fRjiQFHha
         qKyxW2dKDw4tmIsrtinThcJvS+r/AGR5DD5wesmE4nEY6e762lnDfx/jfOkjxFeKwOEC
         f0u4T6Nj35daw+jknngX83MB4dYnZIloWad/tAwg9mXbTy1ZJCUEBoaSbMmgcT7x1Ax4
         EX7A==
X-Forwarded-Encrypted: i=1; AJvYcCWsuZL/sA5yQzqXie7AvVw91mSoZT/NaOOajDJFgLwBESfM1pSkjBL8LBz+ByH8uywohMu8gnlSa2IZ384YZEqh@lists.infradead.org
X-Gm-Message-State: AOJu0YyLIc7LS5BrtexRvV4k2C0zcMw0gL3z5Yc/ixXzgLzEH/zA7Lnl
	ef2e9kNZDAoRDX+AZLvaAj3CSblUmnwNNYqntW05wRl/9WiEo4bY83LFugZr8w==
X-Gm-Gg: ASbGncvVbjeQrHiiMByGfQBXQJSER1yPB5fLXFaJvSz7kbzy6I6aRpEKv4ot37dk//w
	B/tgkWxhU77Kc6b+l7T1WldWMI93DA/CXBMneJIW9DOegCtcUArM08QcrSfqIHEehh7Tfvf2bkD
	8vCT+deYFlRr/qGApqziu+P2cn1FUkCApS6oATaaYsW/UWJn+DdLI7KVcXnmgXfBMJkny6jkCZe
	Scjd9g5mOqcmL0CTC9f8/XdhXYdWB1GS8mwspx9dNEI0tNXJfNnCrpV6ZLkPHaSceNHijadFA+4
	wwGUwbbDDrlNtVXRD/oLKz063Q==
X-Google-Smtp-Source: AGHT+IELooHF0qMvKyeOA5tLJ+3Ezf8GfLZEZvxarJoUbgD+ShYJqVXPzWfrjpSpkcyIBau0pRT4fw==
X-Received: by 2002:a17:903:2a85:b0:216:7ee9:2235 with SMTP id d9443c01a7336-21dd7dff6aemr371780435ad.43.1738605057004;
        Mon, 03 Feb 2025 09:50:57 -0800 (PST)
Received: from thinkpad ([120.60.129.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f03edsm79348895ad.45.2025.02.03.09.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:50:56 -0800 (PST)
Date: Mon, 3 Feb 2025 23:20:49 +0530
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
Message-ID: <20250203175049.idxegqqsfwf4dmvq@thinkpad>
References: <20250201162416.azp4slqqeabo2xyl@thinkpad>
 <20250201170740.GA731664@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201170740.GA731664@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_095057_905527_C64F71F3 
X-CRM114-Status: GOOD (  32.62  )
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

On Sat, Feb 01, 2025 at 11:07:40AM -0600, Bjorn Helgaas wrote:
> On Sat, Feb 01, 2025 at 09:54:16PM +0530, manivannan.sadhasivam@linaro.org wrote:
> > On Mon, Jan 27, 2025 at 06:41:50PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> > > > On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > > > > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > > > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > > > > when
> > > > > > building on some platforms.
> 
> > > > > >       snprintf(name, sizeof(name), "port%d", slot);
> > > > > > -     port->base = devm_platform_ioremap_resource_byname(pdev,
> > > > > > name);
> > > > > > +     regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > > > name);
> > > > > > +     if (!regs)
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     port->base = devm_ioremap_resource(dev, regs);
> > > > > >       if (IS_ERR(port->base)) {
> > > > > >               dev_err(dev, "failed to map port%d base\n", slot);
> > > > > >               return PTR_ERR(port->base);
> > > > > >       }
> > > > > > 
> > > > > > +     port->msg_addr = regs->start + PCIE_MSI_VECTOR;
> > > 
> > > I think this still assumes that a CPU physical address
> > > (regs->start) is the same as the PCI bus address used for MSI, so
> > > this doesn't seem like the right solution to me.
> > > 
> > > Apparently they happen to be the same on this platform because (I
> > > assume) MSIs actually do work, but it's not a good pattern for
> > > drivers to copy.  I think what we really need is a dma_addr_t, and
> > > I think there are one or two PCI controller drivers that do that.
> > 
> > I don't see why we would need 'dma_addr_t' here. The MSI address is
> > a static physical address on this platform and that is not a DMA
> > address. Other drivers can *only* copy this pattern if they also
> > have the physical address allocated for MSI.
> 
> Isn't an MSI on PCI just a DMA write to a certain address?

That's from the endpoint prespective when it triggers MSI.

> My
> assumption is that if you put an analyzer on that link, an MSI from a
> device would be structurally indistinguishable from a DMA write from
> the device.  The MSI uses a different address, but doesn't it use the
> same size and kind of address, at least from the PCIe protocol
> perspective?
> 

Yeah, but in this case the address allocated to MSI belongs to a hardcoded
region in the host memory (not allocated by the DMA APIs which will have the
region attributed as DMA capable). So it doesn't belong to the DMA domain, and
we cannot use 'dma_addr_t'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

