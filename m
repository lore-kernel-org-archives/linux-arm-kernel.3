Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FD4C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkFwRrf70rNA8OmaYxw9PFrRp7+gsmsE+hCsvNFF5YM=; b=HO6LxlSMYSNvV/J+5o83MONvOT
	RnNOHS8MLBeyQHzZCq0ew4IREPHTZ81Z30IU4FKVXb7NA0cy7fxcc2xeebjOW88m9zD0U/sB6Q75y
	v5qPIK38x5OVGtCcdsIYrO/fhCrW7CDBDQfK4iONAplpFFz3qGFgYqaM/4qeUcu4UqLkf1OnpRVbb
	+uidttPG0MeGlU1M1E2NhQAxf8R0V74juJwosIPr+EKoJG0ndUUJs6BOx9mOAQHJQpmA/yolLVXO+
	AMTSkOCkUVk1qQJdfwAFYoFyrJUMLUkFOH2n0IV3W1XqwsCAt9VUntGxCLZwVZHbArqAW9Ukr/vTR
	jivxZX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8k4-00000006hKm-2qot;
	Tue, 25 Mar 2025 18:11:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8iK-00000006hAr-2HaR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 18:09:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-227d6b530d8so47448605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 11:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742926163; x=1743530963; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GkFwRrf70rNA8OmaYxw9PFrRp7+gsmsE+hCsvNFF5YM=;
        b=L0bXwteacazo/eLCMCBetE9ibeiI18q2AKBqpShQKLE9G9tpZ1H0FfeCeJGHdtL0Xz
         GVD2uAfIPjEDNgmwBUQji9tKgD/lS7ztykTwlgl6VbCwP6noSdqsqwNWjy/ny8MQtLKY
         Qj0D0P2GxY2lxlc69rTZQAbbvl8NbR7IUg8eRxgngvwSa2M8/yUHZW83/Rfd7LeCHiDQ
         xCAXSClaPumiD0yGB8jL/De80JOK9zaf5EXOHeD5VEZYZgnWio/rNCzi+eVI7Jep1ebQ
         LXAe4EGrqaz4JKQgKxLbycNYDqr5Nl+LwUsfBOt3gr23DXXB5DEsqVsWPCwMx9YvlzJ6
         N07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742926163; x=1743530963;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkFwRrf70rNA8OmaYxw9PFrRp7+gsmsE+hCsvNFF5YM=;
        b=bs8bRoVMyxx/WueeV4uxURC0k7LDrQSOY+0zwteCp9YHX4rnPlg/Ay5GHpchhDiJD2
         IrC0YigbJ3A0bip0kQ4QUe0hi65zzMTwvmvCx55jA4VoxgFwwQuyRIg+03KZlN0EpL+G
         J85SlZ9B9/ixDb2emtyYJFHUEq3IcwcHHZ1B7/iZloWzAcYQ+NmupJghRIGhuQlqzS9z
         3IHNx/peGaW/1FPnCokVfNDwhvUmzgW7YVKDaktV4oAoXmH6lDEpP1GpVbfsSQtTltzy
         4P9FAPulCSKforjbxsgSOsYMeZAqKQEUmgLuL4cfRXXOHltcETFU/F3MpMSXlu1ZSjWx
         FQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHyz6z95SxEj6/abjlcaSxo4mtqZ0TofRg8kHTWhVnjH+4Sev2Vgdw/4pFPkneYKEiUfz4cR2gPV+eb78qDwzO@lists.infradead.org
X-Gm-Message-State: AOJu0YwjnJPoAKbtZD+3enJoJOpbw3EDfrc29lPW35mxixMxAHh2GYLK
	Xi9LvNOYQeYEV0oZebld8zMh8kv8O6t01fMv60xs+qln0pWa66tzN3tHEX4PuA==
X-Gm-Gg: ASbGnctvZzRHBtZlkCARiw8hjGKKHJ0+mzOYLJS6y6dI/TZRvlM0wU8/IbrmSTafxjH
	zLVTq6i74jFytsQS1mVTCXYAjoIGpVpxTSXPtNbvfy8dtYTM4eiXNTJUpysLGfwrH+QXB84l2Uo
	sqk+VHHzRpF/9/DCar1l8r1PaXntARsL3JMTB69HLHHY0PXAwxnJerF6yZN6ZCw6Sh4widm2VdZ
	1d3gmF07aJMUB+ul7Pxw3fT/ZMiIzE+5LP4aYzKZK/IxJBb4LjIyqgCLgLPtbFIwf9u9tMc5tm8
	sb581AIHC6aGVnsjZukkFqUa6HvVKa+vNpr7Fiz51mq7OPvtYjCZ94kZDhGqmemk1Dk=
X-Google-Smtp-Source: AGHT+IHsQEtK5eDuRWsdEQBYf6f44q2yB07kDLfDBWhVOxMWTo+zOzGbIhIFFRGiGOEd2PP4iDFCkA==
X-Received: by 2002:a17:902:f693:b0:226:3781:379d with SMTP id d9443c01a7336-22780e1044fmr239586185ad.33.1742926163021;
        Tue, 25 Mar 2025 11:09:23 -0700 (PDT)
Received: from thinkpad ([120.60.136.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3962esm93992265ad.4.2025.03.25.11.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:09:22 -0700 (PDT)
Date: Tue, 25 Mar 2025 23:39:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Niklas Cassel <cassel@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v12 06/13] PCI: dwc: Add dw_pcie_parent_bus_offset()
 checking and debug
Message-ID: <3rtte7uyv7gilxnstcxjizpkdlfk5rfxwyc3bd4ednjakn5rfc@fhidkj5vvmtf>
References: <x2r2xfxrnkihvpoqiamgjmvppverjugp5r4we7lcfpz6jloxzy@7kdfzxiwv2po>
 <20250324200437.GA1257874@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324200437.GA1257874@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_110924_590653_9F721C2F 
X-CRM114-Status: GOOD (  47.06  )
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

On Mon, Mar 24, 2025 at 03:04:37PM -0500, Bjorn Helgaas wrote:
> On Mon, Mar 24, 2025 at 11:00:24PM +0530, Manivannan Sadhasivam wrote:
> > On Sat, Mar 15, 2025 at 03:15:41PM -0500, Bjorn Helgaas wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > dw_pcie_parent_bus_offset() looks up the parent bus address of a PCI
> > > controller 'reg' property in devicetree.  If implemented, .cpu_addr_fixup()
> > > is a hard-coded way to get the parent bus address corresponding to a CPU
> > > physical address.
> > > 
> > > Add debug code to compare the address from .cpu_addr_fixup() with the
> > > address from devicetree.  If they match, warn that .cpu_addr_fixup() is
> > > redundant and should be removed; if they differ, warn that something is
> > > wrong with the devicetree.
> > > 
> > > If .cpu_addr_fixup() is not implemented, the parent bus address should be
> > > identical to the CPU physical address because we previously ignored the
> > > parent bus address from devicetree.  If the devicetree has a different
> > > parent bus address, warn about it being broken.
> > > 
> > > [bhelgaas: split debug to separate patch for easier future revert, commit
> > > log]
> > > Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-5-01d2313502ab@nxp.com
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware.c | 26 +++++++++++++++++++-
> > >  drivers/pci/controller/dwc/pcie-designware.h | 13 ++++++++++
> > >  2 files changed, 38 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > > index 0a35e36da703..985264c88b92 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > @@ -1114,7 +1114,8 @@ resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
> > >  	struct device *dev = pci->dev;
> > >  	struct device_node *np = dev->of_node;
> > >  	int index;
> > > -	u64 reg_addr;
> > > +	u64 reg_addr, fixup_addr;
> > > +	u64 (*fixup)(struct dw_pcie *pcie, u64 cpu_addr);
> > >  
> > >  	/* Look up reg_name address on parent bus */
> > >  	index = of_property_match_string(np, "reg-names", reg_name);
> > > @@ -1126,5 +1127,28 @@ resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
> > >  
> > >  	of_property_read_reg(np, index, &reg_addr, NULL);
> > >  
> > > +	fixup = pci->ops->cpu_addr_fixup;
> > > +	if (fixup) {
> > > +		fixup_addr = fixup(pci, cpu_phy_addr);
> > > +		if (reg_addr == fixup_addr) {
> > > +			dev_warn(dev, "%#010llx %s reg[%d] == %#010llx; %ps is redundant\n",
> > > +				 cpu_phy_addr, reg_name, index,
> > > +				 fixup_addr, fixup);
> > > +		} else {
> > > +			dev_warn(dev, "%#010llx %s reg[%d] != %#010llx fixed up addr; devicetree is broken\n",
> > > +				 cpu_phy_addr, reg_name,
> > > +				 index, fixup_addr);
> > > +			reg_addr = fixup_addr;
> > > +		}
> > > +	} else if (!pci->use_parent_dt_ranges) {
> > 
> > Is this check still valid? 'use_parent_dt_ranges' is only used here for
> > validation. Moreover, if the fixup is not available, we should be able to
> > safely return 'cpu_phy_addr - reg_addr' unconditionally.
> 
> Yes, that's true IF the devicetree has the correct 'ranges'
> translation.  This is to avoid breaking platforms with broken
> devicetrees.
> 

You mean the driver without cpu_addr_fixup() and devicetree with broken 'ranges'
property? So the existing platforms... Not a bad idea though.

> > > +		if (reg_addr != cpu_phy_addr) {
> > > +			dev_warn(dev, "devicetree has incorrect translation; please check parent \"ranges\" property. CPU physical addr %#010llx, parent bus addr %#010llx\n",
> > > +				 cpu_phy_addr, reg_addr);
> > > +			return 0;
> > > +		}
> > > +	}
> > > +
> > > +	dev_info(dev, "%s parent bus offset is %#010llx\n",
> > > +		 reg_name, cpu_phy_addr - reg_addr);
> > 
> > This info is useless on platforms having no translation between CPU and PCI
> > controller. The offset will always be 0.
> 
> You're right.  This was probably an overzealous message for any
> possible issues.
> 
> What would you think of the below as a replacement?  It should emit at
> most one message, and none for platforms where devicetree describes no
> translation and there never was a .cpu_addr_fixup().
> 
> It's still pretty aggressive logging, but I'm just concerned about
> being able to quickly debug and fix any regressions.  Ideally we can
> revert the whole thing eventually.
> 
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 27b464a405a4..4b442d1aa55b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -1114,7 +1114,8 @@ resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
>  	struct device *dev = pci->dev;
>  	struct device_node *np = dev->of_node;
>  	int index;
> -	u64 reg_addr;
> +	u64 reg_addr, fixup_addr;
> +	u64 (*fixup)(struct dw_pcie *pcie, u64 cpu_addr);
>  
>  	/* Look up reg_name address on parent bus */
>  	index = of_property_match_string(np, "reg-names", reg_name);
> @@ -1126,5 +1127,42 @@ resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
>  
>  	of_property_read_reg(np, index, &reg_addr, NULL);
>  
> +	fixup = pci->ops ? pci->ops->cpu_addr_fixup : NULL;
> +	if (fixup) {
> +		fixup_addr = fixup(pci, cpu_phys_addr);
> +		if (reg_addr == fixup_addr) {
> +			dev_info(dev, "%s reg[%d] %#010llx == %#010llx == fixup(cpu %#010llx); %ps is redundant with this devicetree\n",
> +				 reg_name, index, reg_addr, fixup_addr,
> +				 (unsigned long long) cpu_phys_addr, fixup);
> +		} else {
> +			dev_warn(dev, "%s reg[%d] %#010llx != %#010llx == fixup(cpu %#010llx); devicetree is broken\n",
> +				 reg_name, index, reg_addr, fixup_addr,
> +				 (unsigned long long) cpu_phys_addr);
> +			reg_addr = fixup_addr;
> +		}
> +
> +		return cpu_phys_addr - reg_addr;
> +	}
> +
> +	if (pci->use_parent_dt_ranges) {
> +
> +		/*
> +		 * This platform once had a fixup, presumably because it
> +		 * translates between CPU and PCI controller addresses.
> +		 * Log a note if devicetree didn't describe a translation.
> +		 */
> +		if (reg_addr == cpu_phys_addr)
> +			dev_info(dev, "%s reg[%d] %#010llx == cpu %#010llx\n; no fixup was ever needed for this devicetree\n",
> +				 reg_name, index, reg_addr,
> +				 (unsigned long long) cpu_phys_addr);

So this check is to detect the usage of old DTs with new kernel without
cpu_addr_fixup()? If so:

(1) The log is not accurate
(2) The driver would be broken, so the log should be an error. This condition
should not be met (if we do not remove the fixup for some time). But I think
this check should be moved ahead of cpu_addr_fixup() so that the correct DTs
would be honored first and the fixup would be ignored for them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

