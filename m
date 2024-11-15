Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1384D6DDF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d3SL9vH2e3pgLXSrAw/DmX0mWevotMaQ8nhbnV7C+c=; b=xYpKZmLx9QC262Lj38rTcIWXqe
	BXrDaTAw3jQNt7efEff7BEntnKyP83liC0GCWfm4ezj9ajqbPaUgoI2dr8APl/IwdDj16OwKzyxLb
	f97TkL5fv6ELbh+nCmOgIvXqANogY8BPNTPV1K3AJjq4C2H1pbqbl3FMSSX0O3ZYIYSolNn8GQhci
	SFDCSdtKUA+Os39IxD1x6puiJzmGLBXk9eQvX+71dSLxK0BLGJxDRXNpdNO1JJ2vyzdQop6Z1wFVd
	HkmbJs9B56fx/HaZKAdnzjGuvDI8h+nQ/s/vSN0sdg8GfJXR9pZo01dI/tUrlRwKq3djBU59euy6+
	oNUnNitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBvaZ-00000002g4D-1NJH;
	Fri, 15 Nov 2024 12:38:15 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBvZd-00000002fsu-1tGb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 12:37:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ea0bd709c0so1244840a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 04:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731674236; x=1732279036; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9d3SL9vH2e3pgLXSrAw/DmX0mWevotMaQ8nhbnV7C+c=;
        b=C6QLjUvAGIExue7fEF63bd4Nz7AHcLdZ/wT+43IgbXxge1N+f1CDStfo2Si5MIHekK
         hpv6CoI0n0LvZap7atuEHzTH+XBGgCa0NCG6HH6jC81GDSwUWW2vldZslp91K1E5qBBk
         hgk1ldskCc16oz5+Rebg4Nu0hvrKSLV/00WbNPGyQh+MQ1J/FbYxcKurTlAWwiezfzIG
         of9H5lUFM++sWMzPoE1cEbPvVSy+oQU26J9TDUvSH4cGyUg/V2K1AeR+oy2ezY9DSRFO
         mXwgzKl5+E4nTsE9TFJhueXz87Ov3qB4YXKX1u/4hNIJ1mKI3Y1I+QUYcH+62xRu4oFU
         k5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674236; x=1732279036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9d3SL9vH2e3pgLXSrAw/DmX0mWevotMaQ8nhbnV7C+c=;
        b=F+oZWUGcITXUNHGgvoakBdFuqlGPeSz1rCBgRYl5h7593K+Rr1P34xo1E5ZwlysS4M
         wco0yH2Ng7aw3cB5gUL/pCUF0elT8TOA158DpXJJtl28L8Zr4rb8jt2pO/hA8+1MJbm1
         FV8WCvN5osNTG9KuoUeuo2NM8HcIE22Q54q8kfXN6KIT6IbFQA379cE4aTxaffZjYnO/
         jVYfvJblgRS0e+dmLVEDbznOPPFmnrpFU9JLz5wVX1K6wnbEhVn1m9VADGdwnBdQzAXQ
         UhLqVeQMRh7zIV5xD6V22bUVk1mQ4g2ZaHiFy5MCAHAqtvNAwUmXxnI1uzElQqMi4gxD
         uGCg==
X-Forwarded-Encrypted: i=1; AJvYcCXv2a+ka3F0XUjO4fS/h9gN3qkwxbG0lcl6EAEfOO9pnKepuZtvr/KJywGzh0zXPyrY+AKfmuFd1EFpkARKbZtJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+WlusXLnY7bg8CEHzLX+1bjy6uvq2yT06cztBpQFWcuKs06B
	HWECZwB20czJy8hZkxWfZj7jQO6NQZmD9tj6wuBe6X/vGIpzksTATJG5fyirAQ==
X-Google-Smtp-Source: AGHT+IFQSkHpmOGv/LSYibpTXHi0sXyBiyJoTKFZ11di0ptf1fGsM/SheI+/mVrvRrtADmFkp80Y8g==
X-Received: by 2002:a17:90b:17c2:b0:2d8:8430:8a91 with SMTP id 98e67ed59e1d1-2ea154f5ee9mr3269168a91.10.1731674236386;
        Fri, 15 Nov 2024 04:37:16 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f9c51esm2703383a91.39.2024.11.15.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 04:37:15 -0800 (PST)
Date: Fri, 15 Nov 2024 18:07:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] PCI: mediatek-gen3: Move reset/assert callbacks
 in .power_up()
Message-ID: <20241115123707.in4x27ub4wtwdggh@thinkpad>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
 <20241109-pcie-en7581-fixes-v2-3-0ea3a4af994f@kernel.org>
 <20241115090231.nwmxl6acspxqflpc@thinkpad>
 <ZzcRG3OInXZ2TP-Z@lore-rh-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzcRG3OInXZ2TP-Z@lore-rh-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_043717_515255_6196A823 
X-CRM114-Status: GOOD (  31.79  )
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

On Fri, Nov 15, 2024 at 10:15:07AM +0100, Lorenzo Bianconi wrote:
> > On Sat, Nov 09, 2024 at 10:28:39AM +0100, Lorenzo Bianconi wrote:
> > > In order to make the code more readable, move phy and mac reset lines
> > > assert/de-assert configuration in .power_up() callback
> > > (mtk_pcie_en7581_power_up()/mtk_pcie_power_up()).
> > > 
> > 
> > I don't understand how moving the code (duplicting it also) makes the code more
> > readable. Could you please explain?
> 
> Hi Manivannan,
> 
> this has been requested by Bjorn in
> https://patchwork.kernel.org/project/linux-pci/patch/aca00bd672ee576ad96d279414fc0835ff31f637.1720022580.git.lorenzo@kernel.org/#26110282
> 

Ok. The description needs to state the reason i.e., the
reset_control_bulk_assert() is moved to make it pair with
reset_control_bulk_deassert() in mtk_pcie_setup() and
mtk_pcie_en7581_power_up().

Btw, could you explain why reset_control_bulk_deassert() is present in
mtk_pcie_setup()?

- Mani

> > 
> > > Introduce PCIE_MTK_RESET_TIME_US macro for the time needed to
> > > complete PCIe reset on MediaTek controller.
> > > 
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  drivers/pci/controller/pcie-mediatek-gen3.c | 28 ++++++++++++++++++++--------
> > >  1 file changed, 20 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > index 8c8c733a145634cdbfefd339f4a692f25a6e24de..1ad93d2407810ba873d9a16da96208b3cc0c3011 100644
> > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > @@ -120,6 +120,9 @@
> > >  
> > >  #define MAX_NUM_PHY_RESETS		3
> > >  
> > > +/* Time in us needed to complete PCIe reset on MediaTek controller */
> > 
> > No need of this comment. Macro name itself is explanatory.
> 
> ack, I will fix it.
> 
> Regards,
> Lorenzo
> 
> > 
> > - Mani
> > 
> > > +#define PCIE_MTK_RESET_TIME_US		10
> > > +
> > >  /* Time in ms needed to complete PCIe reset on EN7581 SoC */
> > >  #define PCIE_EN7581_RESET_TIME_MS	100
> > >  
> > > @@ -867,6 +870,14 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> > >  	int err;
> > >  	u32 val;
> > >  
> > > +	/*
> > > +	 * The controller may have been left out of reset by the bootloader
> > > +	 * so make sure that we get a clean start by asserting resets here.
> > > +	 */
> > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > +				  pcie->phy_resets);
> > > +	reset_control_assert(pcie->mac_reset);
> > > +
> > >  	/*
> > >  	 * Wait for the time needed to complete the bulk assert in
> > >  	 * mtk_pcie_setup for EN7581 SoC.
> > > @@ -941,6 +952,15 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
> > >  	struct device *dev = pcie->dev;
> > >  	int err;
> > >  
> > > +	/*
> > > +	 * The controller may have been left out of reset by the bootloader
> > > +	 * so make sure that we get a clean start by asserting resets here.
> > > +	 */
> > > +	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
> > > +				  pcie->phy_resets);
> > > +	reset_control_assert(pcie->mac_reset);
> > > +	usleep_range(PCIE_MTK_RESET_TIME_US, 2 * PCIE_MTK_RESET_TIME_US);
> > > +
> > >  	/* PHY power on and enable pipe clock */
> > >  	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> > >  	if (err) {
> > > @@ -1013,14 +1033,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
> > >  	 * counter since the bulk is shared.
> > >  	 */
> > >  	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> > > -	/*
> > > -	 * The controller may have been left out of reset by the bootloader
> > > -	 * so make sure that we get a clean start by asserting resets here.
> > > -	 */
> > > -	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
> > > -
> > > -	reset_control_assert(pcie->mac_reset);
> > > -	usleep_range(10, 20);
> > >  
> > >  	/* Don't touch the hardware registers before power up */
> > >  	err = pcie->soc->power_up(pcie);
> > > 
> > > -- 
> > > 2.47.0
> > > 
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்



-- 
மணிவண்ணன் சதாசிவம்

