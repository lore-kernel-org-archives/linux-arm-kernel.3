Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69782C02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9423Ul3PnX2uQ2VoOwVHhEfweSJpTCwxTHIo8325RBM=; b=X0cLroMinllhy5
	uA1XWV/S8yAGCiJHUZ3bx91UhHd5zAYHzLQR4m9jOGLtMxWgkDZNc03JLUqInT222O3kb7wfcBQ0R
	hgDr0IdcLoXBdJdg9o4Iv1PaxVhuAPVoR7KjH+3zdxSTMSdfDY2pS/0+m4n0enZEW6d+OjfZXP03A
	Mw+lbJe8HBsQdUw4SN5mlaSRy0oeKeds4zkmGJ2bJmg6PVLUx2e6soDxrHrNW49RHFhNHHvNkatrF
	maxytmniqJWSUhy/TSp5o7BL7VS3c3FuUsnfZAHNpr0hQ2axjmm+CQSCh2fxM3vC544+dDCCFcypF
	xaYwWETtRQlVcWB+DJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Jx-00000006wZb-3i8S;
	Thu, 06 Feb 2025 17:05:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Ia-00000006wJk-1dZK;
	Thu, 06 Feb 2025 17:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF0CDA4420D;
	Thu,  6 Feb 2025 17:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F06DC4CEDD;
	Thu,  6 Feb 2025 17:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738861459;
	bh=L2rPvTq6V62r+Q0cSWKfYC74gOjcnbe+1Nz7F+6fQ8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=uzeo/m7tfOupfY44sRumsHLskiD0iklYeSbmhmduTUqWpmW6kw9sueCiYyd4dsRjn
	 Xo6adFg4wOloZSBPMxO9IAaUu9eHVq+xrLqFV//6fFgvLFx+GvS6uCYdLnqzStqZwp
	 3bxYpjyWxGUY4jHjEqJsvKt8vBYMleZ1UvoPVThd61f7XYZL/IfTtkQ1RAUpxqWHOX
	 hg7Dp8zdVE+TkA3sxWAR2TBoCwgRenwtPZLoi74brutVQsI6R8Z8tktapJcTA8/VZc
	 LGoq5YyJGq1LviWgq/OgGGBnc22glvNoSOIdEplc5AAIpjoAsHHNMQ4ENGW1SXiWRj
	 imRQnjf0FK7ZQ==
Date: Thu, 6 Feb 2025 11:04:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/6] PCI: brcmstb: Refactor max speed limit
 functionality
Message-ID: <20250206170417.GA989059@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205191213.29202-2-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_090420_553722_43437D56 
X-CRM114-Status: GOOD (  25.29  )
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

On Wed, Feb 05, 2025 at 02:12:01PM -0500, Jim Quinlan wrote:
> Make changes to the code that limits the PCIe max speed.
> 
> (1) Do the changes before link-up, not after.  We do not want
>     to temporarily rise to a higher speed than desired.

This is a functional change that should be split into its own patch.
That will also make it obvious that this is not simple refactoring as
the subject line advertises.

> (2) Use constants from pci_reg.h when possible
> (3) Use uXX_replace_bits(...) for setting a register field.

> (4) Use the internal link capabilities register for writing
>     the max speed, not the official config space register
>     where the speed field is RO.  Updating this field is
>     not necessary to limit the speed so this mistake was
>     harmless.

Also a bug fix (though harmless in this case) that deserves to be
split out so the distinction between the internal and the architected
paths to the register is highlighted and may help prevent the same
mistake in the future.

> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 546056f7f0d3..f8fc3d620ee2 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -47,6 +47,7 @@
>  
>  #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
>  #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
> +#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_SPEED_MASK	0xf

If the format of this internal register is different, of course we
need a new #define for this.  But if this is just a different path to
LNKCAP, and both paths read the same bits in the same format, I don't
see the point of a new #define.

>  #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
>  #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK	0xf8
> @@ -413,12 +414,12 @@ static int brcm_pcie_set_ssc(struct brcm_pcie *pcie)
>  static void brcm_pcie_set_gen(struct brcm_pcie *pcie, int gen)
>  {
>  	u16 lnkctl2 = readw(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
> -	u32 lnkcap = readl(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
> +	u32 lnkcap = readl(pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>  
> -	lnkcap = (lnkcap & ~PCI_EXP_LNKCAP_SLS) | gen;
> -	writel(lnkcap, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
> +	u32p_replace_bits(&lnkcap, gen, PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_SPEED_MASK);
> +	writel(lnkcap, pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
>  
> -	lnkctl2 = (lnkctl2 & ~0xf) | gen;
> +	u16p_replace_bits(&lnkctl2, gen, PCI_EXP_LNKCTL2_TLS);


OK.  I am not really a fan of the uXX_replace_bits() thing because
it's not widely used (I found 341 instances tree-wide, compared to
14000+ for FIELD_PREP()), grep can't find the definition easily, and
stylistically it doesn't fit with GENMASK(), FIELD_PREP(), etc.

But it's already used throughout brcmstb.c, so we should be
consistent.

