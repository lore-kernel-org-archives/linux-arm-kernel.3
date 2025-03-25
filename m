Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB083C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAN8pH8Ut28XPLXmagHcSIRCR5cT6OsT/i3KQOlTfm0=; b=GpQShCt6LQgOjRm5+5o+oIWC/b
	NvRjki9bmJXwkj6o6dFOdvy/nsfpifMwjJN103lkHgRE9SK10JGSQ3rwCm+D1s7VwhXhq/Dl0ULSD
	oBg5Q67RWBhTTRoaVfwiLQNULHSSHSppODOoSdcVuQ1y/OIT6hyGfvb21M7GnYMWMyiUDP1nD0AcW
	h3cVON7/9MQhUddej28aCpFYRRk+5pxZvm8CH+hdjV13kxhZ9dGeGUTVnbAs/TjE+LmzqdwcHuYw0
	Veo0rKFpFHjIrSZwR37IIHjjRlWq0+nfhxENgXECKYZlwnvRnQCDhx4K2WllYIR2CT1xkpVlzUoo8
	23V2Z05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4bx-0000000652A-2gAD;
	Tue, 25 Mar 2025 13:46:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4NV-000000062SP-41sN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 382CDA45E3B;
	Tue, 25 Mar 2025 13:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04CAC4CEE4;
	Tue, 25 Mar 2025 13:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742909496;
	bh=GQ0OSrkpXzh86AWjzuws2IWSbtpMjCSYAmwHhrKpEKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/hJF1Wq2qMQCh1xCP+ds2qNFt0FUdt8os2fzl9sKpawHLMgTMbrNJLqjnwsNiBBJ
	 iT7ruZgeCbxf3H8k9+vXz/s8aF+zEufqtLseKxsgRHzBrpuVB70HA+Mhp9mZRGYB43
	 ZOmVybQ4HbNrkexYjkkKWO4xqBkThLJ8sCVasLVRLkzW5Cmqt9jCza0wV2iOwccxjR
	 nCN0p39F157IBcc69OySumhd+ysZuh9w4xIcQhr5M8n54Evbbt+Zlpy7SgUunFYnbF
	 jnecHXidiRMZMKkWuBF+QKO9XKNYTo/9qo3CTk+XvPBOHyxLygtT26aduvdQCe9FjK
	 NqVApGeTkJvww==
Date: Tue, 25 Mar 2025 08:31:35 -0500
From: Rob Herring <robh@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 00/13] PCI: apple: Add support for t6020
Message-ID: <20250325133135.GB1717731-robh@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_063138_140479_87928F4A 
X-CRM114-Status: GOOD (  24.62  )
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

On Tue, Mar 25, 2025 at 10:25:57AM +0000, Marc Zyngier wrote:
> As Alyssa didn't have the bandwidth to deal with this series, I have
> taken it over. All bugs are therefore mine.
> 
> The initial series [1] stated:
> 
> "This series adds T6020 support to the Apple PCIe controller. Mostly
>  Apple shuffled registers around (presumably to accommodate the larger
>  configurations on those machines). So there's a bit of churn here but
>  not too much in the way of functional changes."
> 
> The biggest change is affecting the ECAM layer, allowing an ECAM
> driver to provide its own probe function instead of relying on the
> .init() callback to do the work. The ECAM layer can therefore be used
> as a library instead of a convoluted driver.
> 
> The rest is a mix of bug fixes, cleanups, and required abstraction.
> 
> This has been tested on T6020 (M2-Pro mini) and T8102 (M1 mini).
> 
> * From v1[1]:
> 
>   - Described the PHY registers in the DT binding
> 
>   - Extracted a ecam bridge creation helper from the host-common layer
> 
>   - Moved probing into its own function instead of pci_host_common_probe()
>     
>   - Moved host-specific data to the of_device_id[] table
> 
>   - Added dynamic allocation of the RID/SID bitmap
> 
>   - Fixed latent bug in RC-generated interrupts
> 
>   - Renamed reg_info to hw_info
> 
>   - Dropped useless max_msimap
> 
>   - Dropped code being moved around without justification
> 
>   - Re-split some of the patches to follow a more logical progression
> 
>   - General cleanup to fit my own taste
> 
> [1] https://lore.kernel.org/r/20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io
> 
> Alyssa Rosenzweig (1):
>   dt-bindings: pci: apple,pcie: Add t6020 compatible string
> 
> Hector Martin (6):
>   PCI: apple: Fix missing OF node reference in apple_pcie_setup_port
>   PCI: apple: Move port PHY registers to their own reg items
>   PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
>   PCI: apple: Use gpiod_set_value_cansleep in probe flow
>   PCI: apple: Abstract register offsets via a SoC-specific structure
>   PCI: apple: Add T602x PCIe support
> 
> Janne Grunau (1):
>   PCI: apple: Set only available ports up
> 
> Marc Zyngier (5):
>   PCI: host-generic: Extract an ecam bridge creation helper from
>     pci_host_common_probe()
>   PCI: ecam: Allow cfg->priv to be pre-populated from the root port
>     device
>   PCI: apple: Move over to standalone probing
>   PCI: apple: Dynamically allocate RID-to_SID bitmap
>   PCI: apple: Move away from INTMSK{SET,CLR} for INTx and private
>     interrupts
> 
>  .../devicetree/bindings/pci/apple,pcie.yaml   |  11 +-
>  drivers/pci/controller/pci-host-common.c      |  24 +-
>  drivers/pci/controller/pcie-apple.c           | 241 +++++++++++++-----
>  drivers/pci/ecam.c                            |   2 +
>  include/linux/pci-ecam.h                      |   2 +
>  5 files changed, 204 insertions(+), 76 deletions(-)

For the series,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

