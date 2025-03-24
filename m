Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D54C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnroRpadQs+73Z5A9Ek9rLWnGkVNNMMnwyBsGGz461s=; b=qz7cO+zjgI09zGokWyeedAozCN
	/XGZRgNr7uscC4mJyoY17jR8WeuzqI7xBv1wJYCxjzr4dTrctMN1bthf4Rgn+ZE2NIoUBScNx2bXj
	NW7Jsv09WcCj3e8vapJN/nesL7AWhvc5QZxfCigL4mDddbiHdP3OXkQNFajbqyWzj4TVD8QFRLvXc
	MKDJv9M6VQtGAAxVWaprwZ1zgVENneqbjyM1j1ySCkFFydOJkfiVpmtJCp349gBtyZfp0ArZ03Lyx
	C8Nm/IApM2IGBQf/pknT6GPrRW9sA6kuZ7KEJ4wgSNsRekQe1pqJLcuTEpVjVzonX3QD+s4lUZLak
	WWlxBUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlew-00000003n4d-1C0p;
	Mon, 24 Mar 2025 17:32:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twldC-00000003mtp-2d53
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 17:30:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22403cbb47fso89208415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 10:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742837434; x=1743442234; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SnroRpadQs+73Z5A9Ek9rLWnGkVNNMMnwyBsGGz461s=;
        b=cWfjO0593u0UpnSZjl7puBGc011A4yblC8rPf+Zy1bKlcvZH9goX7O6i43bf8/po20
         hjExxWtGpk9Wjaoh9uHco6THFDPYWuR+L2QLRU25XEI+3UCqlwmn6m8+ZEZU5Bmx14kb
         GHfPmXSzrrG+jXc3uttOixR/MfdLEn+lWboXjRJoj2YEDknz3oS0y+jCKtCJJ0crEezK
         8lwEtX46SZ5QJuYSPbiYAHk2fVgjK2fKlIhiwDYZMo/zgT8fG+MMpmu/WcdDW9lRWwpI
         k5DS4us68OQj9+BBybFj/wt7tdAdVY9he32GsWn+kQWwtfvlTb5RZqtN8PiIRF9bhTFt
         0c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837434; x=1743442234;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnroRpadQs+73Z5A9Ek9rLWnGkVNNMMnwyBsGGz461s=;
        b=otKKlSVqeSP+aG7q/l0nsPpg6mUGk8bs10BZVkOouYwHxFIe/McNLRYwW5TGyyPDCp
         YnHfYozW6fjN36g0WF2Ga/5ptB0QmGTzg/yeHwCaEk/8f48aiLpx72NlpCNNre04DpH9
         0Ijl/rKvKCkk1vdJAWBuW6+KGlsryl1SGv2rqTmXKY0uaSmNO7yT5wloKvqv66CpHoHy
         2y2xSH8wEGEZ56QxkWZDfl6sdNKEQ08DmX9IhmrDtifm8HfAI9Z58FWJC0WhqgDzMt3G
         5gTycNkqxEJmdwklM/wUVOO2ZeT8c6gjjSCGYv18XhmTF8pnt45WlhySPH4eSjbrc1Lb
         dY5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjWovseUxSPwajauam/An//R7MYv985pPLM004hSx/Q2HsE4cjeYcO5jZs9ujhRmYqaN7zjMupEH8pDgfFUgFW@lists.infradead.org
X-Gm-Message-State: AOJu0YyUu6qEgopAWpDv446J4XIn+qbNmq6gvIJrWzYikqNGq1e50ABh
	5ZBZjTCGGcoTsy+bawPnD6lChSW2T9O25NeKnFfJzlZRtO1XNttbSeEPO8M4cQ==
X-Gm-Gg: ASbGncvM9qDn7XS56P2QOh13WI/aycyGOGvWfophBqzBCX0gSK1CJ/6g1XF+GemDi5E
	2qYAdMa/LHBTbzQL4YC7DFzcdJ3BSYMavkDXfiDwiIbwu3I5Q5V7Vd6x7TRTAQN2c5QgY2Qxi0l
	k+68svi54qCoGcmEpHEXpS4VF2jHorHwRKVi9pcePXZNK3Ue2uzD9Fp5S4jm5SEbUzqSmTOsaJi
	1PEWKGVWvPl+h5Bwkt22ry5lO2FOiRjNrAZRcvNvjUnjJYDneLjm6HLkONvokQAsfYy7qqy3/sY
	F8SwkWd8peivvVmdxfWNg7y2BjWtczRXbbG4RolzwYfUunLGlMxlSzQ=
X-Google-Smtp-Source: AGHT+IFJCOVJt8P803wd2MA7JhfBhloa/XWaXKSzLJsxknH/vt3+SULEZbCYIKyBwnuGPda9wxAY4g==
X-Received: by 2002:a05:6a20:d81b:b0:1f5:67c2:e3e9 with SMTP id adf61e73a8af0-1fe4342cc6emr22747430637.29.1742837433231;
        Mon, 24 Mar 2025 10:30:33 -0700 (PDT)
Received: from thinkpad ([120.60.67.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061598f2sm8309667b3a.153.2025.03.24.10.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:30:32 -0700 (PDT)
Date: Mon, 24 Mar 2025 23:00:24 +0530
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
Message-ID: <x2r2xfxrnkihvpoqiamgjmvppverjugp5r4we7lcfpz6jloxzy@7kdfzxiwv2po>
References: <20250315201548.858189-1-helgaas@kernel.org>
 <20250315201548.858189-7-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315201548.858189-7-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_103034_668853_311AA5D1 
X-CRM114-Status: GOOD (  28.26  )
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

On Sat, Mar 15, 2025 at 03:15:41PM -0500, Bjorn Helgaas wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> dw_pcie_parent_bus_offset() looks up the parent bus address of a PCI
> controller 'reg' property in devicetree.  If implemented, .cpu_addr_fixup()
> is a hard-coded way to get the parent bus address corresponding to a CPU
> physical address.
> 
> Add debug code to compare the address from .cpu_addr_fixup() with the
> address from devicetree.  If they match, warn that .cpu_addr_fixup() is
> redundant and should be removed; if they differ, warn that something is
> wrong with the devicetree.
> 
> If .cpu_addr_fixup() is not implemented, the parent bus address should be
> identical to the CPU physical address because we previously ignored the
> parent bus address from devicetree.  If the devicetree has a different
> parent bus address, warn about it being broken.
> 
> [bhelgaas: split debug to separate patch for easier future revert, commit
> log]
> Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-5-01d2313502ab@nxp.com
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 26 +++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h | 13 ++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 0a35e36da703..985264c88b92 100644
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
> @@ -1126,5 +1127,28 @@ resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
>  
>  	of_property_read_reg(np, index, &reg_addr, NULL);
>  
> +	fixup = pci->ops->cpu_addr_fixup;
> +	if (fixup) {
> +		fixup_addr = fixup(pci, cpu_phy_addr);
> +		if (reg_addr == fixup_addr) {
> +			dev_warn(dev, "%#010llx %s reg[%d] == %#010llx; %ps is redundant\n",
> +				 cpu_phy_addr, reg_name, index,
> +				 fixup_addr, fixup);
> +		} else {
> +			dev_warn(dev, "%#010llx %s reg[%d] != %#010llx fixed up addr; devicetree is broken\n",
> +				 cpu_phy_addr, reg_name,
> +				 index, fixup_addr);
> +			reg_addr = fixup_addr;
> +		}
> +	} else if (!pci->use_parent_dt_ranges) {

Is this check still valid? 'use_parent_dt_ranges' is only used here for
validation. Moreover, if the fixup is not available, we should be able to
safely return 'cpu_phy_addr - reg_addr' unconditionally.

> +		if (reg_addr != cpu_phy_addr) {
> +			dev_warn(dev, "devicetree has incorrect translation; please check parent \"ranges\" property. CPU physical addr %#010llx, parent bus addr %#010llx\n",
> +				 cpu_phy_addr, reg_addr);
> +			return 0;
> +		}
> +	}
> +
> +	dev_info(dev, "%s parent bus offset is %#010llx\n",
> +		 reg_name, cpu_phy_addr - reg_addr);

This info is useless on platforms having no translation between CPU and PCI
controller. The offset will always be 0.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

