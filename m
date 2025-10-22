Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB26CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 22:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yfV3Xs0jnGsywqc4biAGPXlJeLHJcRNaLf8rKNqtzuc=; b=C7MdKDCdDkQmbb
	Fv+Yn1Bfa/HBAQVecj99bYLPBkgFQtF3lGSJPOS2NEgtlk8+uXE4mErwyNStfvRbSsbD2ygpF5sA6
	4IcL71entJEWOCT/jfW9uxPp/VEoSMHjxr2quDbezLD/PrmNrlGHN+zPhnrwuCBNElt0lYLCTl5M5
	M/DAVIyCYhT0lilLJA6zrJkiW8JIgOtwOLy4FqIKXeZ+3NAJiA21X3HRxpQRUBVJj2lujGdW3b7L8
	wC2ElcEmtwXKpoFlmX2Tt5Mr7CSXDOyxrduv6zo5JS8bzk/UYX0HrNC82RdWzwfINF1SBOcD/OSzL
	PTlTcl8RUFA7D0h1W+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBhaf-00000004TtY-1hCZ;
	Wed, 22 Oct 2025 22:45:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBhad-00000004Tt5-3PR6;
	Wed, 22 Oct 2025 22:45:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F46A60141;
	Wed, 22 Oct 2025 22:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37F4C4CEE7;
	Wed, 22 Oct 2025 22:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761173154;
	bh=ynTdZ7Aj4V2OqHNG4FGr5zyTF0msUaMb3nD6PXj6uP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Yqfl5CztoX8gCmT3Y7k2CeoIq0NY/ShnRnfOTwgXoxdN4Gg4WCZq0BIQjXAKZcRzd
	 PQN7Ef5z6lLm4/cg5Lfg+Iwd5DaUIVZ0Aoku6AOPEufutqhcxIAlNqRe+YwdBYvTuI
	 bMuq8lhq+7Mhk3lVC8AJq3CulFwn3cF33WZuekumOG72GFWSYFPN6ri26xAlO8tbop
	 HEWr7fFSlK0MEC6HjNM0LhiSMEwCogXSnAYryJNlcr3YFRdjeAF7YKgotYputtDLD9
	 n38rSDmiikUaOYBtmrBkR0v1cPSN77PWeB6wB0PcvR9iOK+V6LWf1cJkOWR1WFCf8e
	 y0c+UevrynxFQ==
Date: Wed, 22 Oct 2025 17:45:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: brcmstb: Fix use of incorrect constant
Message-ID: <20251022224553.GA1271981@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003170436.1446030-1-james.quinlan@broadcom.com>
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

On Fri, Oct 03, 2025 at 01:04:36PM -0400, Jim Quinlan wrote:
> The driver was using the PCIE_LINK_STATE_L1 constant as a field mask for
> setting the private PCI_EXP_LNKCAP register, but this constant is
> Linux-created and has nothing to do with the PCIe spec.  Serendipitously,
> the value of this constant was correct for its usage until after 6.1, when
> its value changed from BIT(1) to BIT(2);
> ...

>  #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
>  #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK	0x1f0
> -#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00

This all tangential questions for possible future changes, not
anything for *this* patch.

We have these in include/uapi/linux/pci_regs.h:

  #define PCI_EXP_LNKCAP          0x0c    /* Link Capabilities */
  #define  PCI_EXP_LNKCAP_MLW     0x000003f0 /* Maximum Link Width */
  #define  PCI_EXP_LNKCAP_ASPMS   0x00000c00 /* ASPM Support */
  #define  PCI_EXP_LNKCAP_ASPM_L0S 0x00000400 /* ASPM L0s Support */

Since you're using PCI_EXP_LNKCAP_ASPM_L0S below for writes to
PCIE_RC_CFG_PRIV1_LINK_CAPABILITY, I assume
PCIE_RC_CFG_PRIV1_LINK_CAPABILITY is another name for PCI_EXP_LNKCAP?

If so, it looks like we should also use PCI_EXP_LNKCAP_MLW instead of
PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK (although the
value is different for some reason; maybe 0x1f0 just reflects the
limits of brcmstb).

It would be nice to have a #define for the base of the PCIe
Capability so we could use that plus PCI_EXP_LNKCAP instead of
PCIE_RC_CFG_PRIV1_LINK_CAPABILITY.

But you did something like that already for PCI_EXP_LNKCTL2 using
BRCM_PCIE_CAP_REGS (0x00ac), which means LNKCTL2 and LNKCAP must be
at:

  LNKCTL2: 0x00dc (0x00ac + 0x30)
  LNKCAP:  0x04dc (0x04d0 + 0x0c)

which doesn't look at all like they would both be in the actual PCIe
Capability format.

>  #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
>  #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK	0xf8

From its usage to "un-advertise L1 substates",
PCIE_RC_CFG_PRIV1_ROOT_CAP looks like it might be related to 
PCI_L1SS_CAP, but 0xf8 doesn't really match up to
PCI_L1SS_CAP_L1_PM_SS (0x10)

If this is really related to PCI_L1SS_CAP, can we use the names from
pci_regs.h somehow?

>  	/* Don't advertise L0s capability if 'aspm-no-l0s' */
> -	aspm_support = PCIE_LINK_STATE_L1;
> -	if (!of_property_read_bool(pcie->np, "aspm-no-l0s"))
> -		aspm_support |= PCIE_LINK_STATE_L0S;
>  	tmp = readl(base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
> -	u32p_replace_bits(&tmp, aspm_support,
> -		PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK);
> +	if (of_property_read_bool(pcie->np, "aspm-no-l0s"))
> +		tmp &= ~PCI_EXP_LNKCAP_ASPM_L0S;
>  	writel(tmp, base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>  
>  	/* 'tmp' still holds the contents of PRIV1_LINK_CAPABILITY */

