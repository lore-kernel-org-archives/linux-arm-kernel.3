Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfDNrOLDRsSoKnoiSnKZrCZ6ys+s/p6oKC6Xtt3UxnY=; b=eV0yVoWetf7nSN/bacmimmSzff
	DVfsoG4EDZLRgB+ZAq9XQvB1vksig+1OFu1qF2cS1lxoTqS2ZZ6D6W1CxYB+H/e5X4mvkpNXVBj2W
	k0pqMJiY6l+Imm1D0n6t6FGg83IfC3IPVTIUsa56/0HNI7JlNmqVhSkpIOqOrRoFxFbge1mUKEyEs
	+lKPusP+VZYD1Is2/WmDzScoesYKUIQmAemHwXFdkc+Am+H+1X8+mXH+dSyEDXfOA8bkl8ixEYWS8
	pOrPpZUp+O+XDyCAZYGhkl841k3ShAQi8lyz2s7aXs3v/rEYXrqkvu2yIQoDA3VOp9KvgVUka0yAD
	RMA4Ga4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twixH-00000003Pqo-2ioK;
	Mon, 24 Mar 2025 14:39:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiuO-00000003PX8-0ThB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 14:36:09 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224171d6826so8101445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742826967; x=1743431767; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gfDNrOLDRsSoKnoiSnKZrCZ6ys+s/p6oKC6Xtt3UxnY=;
        b=r2VU+vV6KxGOyUiQCFq6s74qnhhLbX67bOM+lSf+O4GqxWHCwJnDdnvuvZxJaiS82e
         oCna8IIUqB7Nxis6VKjreyMJJ6n67q4+e1ECHGUuiTP4FcRqs3hfkufvWmIZHMeNR50U
         Gn9G6jv7VPtMVjkzgp1ndCxZ1ko0f5HvtLAldWUWqfwZuUprSo3b+BESmRGMa5xwe+iw
         zzy0y3Ea5VzL11sDpX+0i6ouwR2W5yuX20jtCE5q+BNvjZpLOyXaGnWAFReISQelw3hb
         nYJCthMxz8JQmAnXyUcnlNgsT9VqWqA8Dvo8Rx4nni8SZFk/s5n978l97FlqtJPVfSpP
         unVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742826967; x=1743431767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfDNrOLDRsSoKnoiSnKZrCZ6ys+s/p6oKC6Xtt3UxnY=;
        b=R/GE3z0wo0YAvnmnvL1PThAg3IZm8u4At4xajrBY1loXRP4Hw8zixithTNRtvLPzyS
         p1FoECldwn3JLpLd5/8uXKZpqre8tKPxrwGDdpKKWQzBgjk+tOTQg4fcUHfejMPvzxld
         QOGrttlqfsVBTabphsN33dl81PLsDK2C5j1omy3RB08UG+Z9pBu1mqkwpR6N1x700wPx
         hOdsDgetgYw/5Dh3q3/2tbhzy5veZ/LOfaHu4tLCEf8bQ4sbp/OCVDb8oc8yA3eGjBGF
         MdPwWWKxCvyzT36cgX2ewpjoNWn++t43velLEugGa6LjgPbFDOKT1EtjLXIKrNu5oHUc
         KurQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMbsvHUNngHvS2VLv7kC9dL7IDhjdxXtq8mBLwl8GkzHPXQynZPlT9ULUWusfkP8AHWYyRQP2220HI58KTWSW/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd0n/halKYixz5lo9C/uedLNh+3dnnJxhx4JSAzPWpibijDYZ8
	covxs8giPup0u3uW28X2aDrs1oQx5wWUHtRkuqauQ0qyABuePfJc++3sa0Qtsg==
X-Gm-Gg: ASbGncv8kHs0pGt+lf46kWkSw/kq9t64MZwsfFMCKYdXVa/0HtJUBxHhx5Uy+cKPV/v
	HlumJNmxF02h14laZnEqMjhUTsRuf61PyjYj8TPWloqaUf0TsPtUGdne96dxTagOyNuMJm1/JRt
	rVtLwWj7AdlaPjREOUVDE27tF+/SQLYVUiKE5zFseu2Ui+By3pCC+cAhdXREvWwG3RqtS2QrTYN
	ZP/txivVB6LFKdFb5ndpLUrdr8HGY7ER9IYKVTCRxTzEjHHqEJ/3bxwxHHIf3h7HotPNaI9nu3L
	/dtDLm7tLzIkse3onwt+gMdq64qzu4NbTSHrd1TExPCqWttQiqexoUk=
X-Google-Smtp-Source: AGHT+IHosn533Honkxz5Gkn47lhA4z7ibid7YzujQ4Q5gGN1wmrSmuIZVipbX/6bHz2UT8zZDxLukA==
X-Received: by 2002:a05:6a00:1885:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-73905623ea3mr21273776b3a.0.1742826966908;
        Mon, 24 Mar 2025 07:36:06 -0700 (PDT)
Received: from thinkpad ([120.60.67.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905faa565sm8053740b3a.1.2025.03.24.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 07:36:06 -0700 (PDT)
Date: Mon, 24 Mar 2025 20:05:58 +0530
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
Subject: Re: [PATCH v12 00/13] PCI: Use device bus range info to cleanup RC
 Host/EP pci_fixup_addr()
Message-ID: <brhtmymbntt7dk3bqgcwjb72ai4g2bn4b5emcaxntbizvu4i7f@ulvm37yyl4oq>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_073608_151979_483A3858 
X-CRM114-Status: GOOD (  18.27  )
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

On Sat, Mar 15, 2025 at 03:15:35PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This is a v12 based on Frank's v11 series.
> 

Mostly looks good to me. But I do have a few comments, that I'll share.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> v11 https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-0-01d2313502ab@nxp.com
>     
> Changes from v11:
>   - Call devm_pci_alloc_host_bridge() early in dw_pcie_host_init(), before
>     any devicetree-related code
>   - Call devm_pci_epc_create() early in dw_pcie_ep_init(), before any
>     devicetree-related code
>   - Consolidate devicetree-related code in dw_pcie_host_get_resources() and
>     dw_pcie_ep_get_resources()
>   - Integrate dw_pcie_cfg0_setup() into dw_pcie_host_get_resources()
>   - Convert dw_pcie_init_parent_bus_offset() to dw_pcie_parent_bus_offset()
>     which returns the offset rather than setting it internally
>   - Split the debug comparison of devicetree info with .cpu_addr_fixup() to
>     separate patch so we can easily revert it later
>   - Drop "cpu_addr_fixup() usage detected" warning since we always warn
>     about something in that case anyway
> 
> Any comments welcome.
> 
> 
> Bjorn Helgaas (3):
>   PCI: dwc: Consolidate devicetree handling in
>     dw_pcie_host_get_resources()
>   PCI: dwc: ep: Call epc_create() early in dw_pcie_ep_init()
>   PCI: dwc: ep: Consolidate devicetree handling in
>     dw_pcie_ep_get_resources()
> 
> Frank Li (10):
>   PCI: dwc: Use resource start as iomap() input in
>     dw_pcie_pme_turn_off()
>   PCI: dwc: Rename cpu_addr to parent_bus_addr for ATU configuration
>   PCI: dwc: Call devm_pci_alloc_host_bridge() early in
>     dw_pcie_host_init()
>   PCI: dwc: Add dw_pcie_parent_bus_offset()
>   PCI: dwc: Add dw_pcie_parent_bus_offset() checking and debug
>   PCI: dwc: Use devicetree 'reg[config]' to derive CPU -> ATU addr
>     offset
>   PCI: dwc: ep: Use devicetree 'reg[addr_space]' to derive CPU -> ATU
>     addr offset
>   PCI: dwc: ep: Ensure proper iteration over outbound map windows
>   PCI: dwc: Use parent_bus_offset to remove need for .cpu_addr_fixup()
>   PCI: imx6: Remove cpu_addr_fixup()
> 
>  drivers/pci/controller/dwc/pci-imx6.c         | 18 +---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 74 +++++++++++------
>  .../pci/controller/dwc/pcie-designware-host.c | 57 ++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.c  | 82 ++++++++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.h  | 24 +++++-
>  5 files changed, 171 insertions(+), 84 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

