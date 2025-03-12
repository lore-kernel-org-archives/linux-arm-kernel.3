Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8931BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1nk6tEL7b3ID90qu4AJEBZLI2EOg0vH33vT9aySeSSU=; b=2B1uDBPTmaXsSX
	lTioRw3TBj20zHkDzbtIbGF/kRNlxsldGR8jvpDW2zMhcIlNbT1P1sUpH3+WzxT9LD9snTOmdxbpm
	WSNTtwbW7yRzwCIquNcBL47d7AzpUzi1kXvDspYmuh8tAJMycjcV8dI8wlIhIqjfnN5K48DJ2C1N8
	SdEz6qx6R+teSnarHYAqEHkJEyhlk861rgHam1rGnTFbxvGlloy8l5ByAmW0pDhtucfmmvkMK+41k
	oUQ6p8grwxyoLhqMa5C4h5sUb0q88rLUErP9nx5dgAzF8+WC85zOB6WMT2+HEg7d3/XV+9ChNOUhX
	499CS4mD4RBq3kk/DA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOmB-000000090aD-0VpT;
	Wed, 12 Mar 2025 16:17:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOkU-000000090Ql-3Xk3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 16:16:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D8D35C5C33;
	Wed, 12 Mar 2025 16:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DDDC4CEEA;
	Wed, 12 Mar 2025 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741796161;
	bh=VsNryCp6Jdy8Cj9W96kO7ltsyTKRP2vUyvO8MTRIRCA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ltpF4bv2tpgig/rLF/SWUcRuVcjvjoqZTAwgDD/ab0SRZVZNFMNz/pO2uKoKFdUZ3
	 Efa7P5+PybmQOFHqmjcy+GO9MJyiAtGOYfr+mrGhlQpC7/AuJ9lGqOhXLihiXLnT/6
	 Tr/U34cIicPdZye4F1wPbcYYZNmQi9jSuLORnyM8fsy/2kkE/iVqElEgCVK/Ffm8F7
	 01PQdXAtnn/gCdy0zkV60RsSHtz2V4JgT6B5WM00VL29bZHnuFvCp8zH4ma+HBw7h6
	 J8Vcp02yuuuib4zPHSES5zqgX+d2N3xlacNeY4YPx6wiOVy8l/3OSk4Xj1JX7VN1mf
	 D+5gS6kD2oJ2Q==
Date: Wed, 12 Mar 2025 11:16:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Matt Ranostay <mranostay@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250312161600.GA680640@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305132018.2260771-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_091602_969626_7F8ECBA2 
X-CRM114-Status: GOOD (  25.04  )
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

[+to Matt, author of e49ad667815d]

On Wed, Mar 05, 2025 at 06:50:18PM +0530, Siddharth Vadapalli wrote:
> Commit under Fixes assigned the value of 'linkdown_irq_regfield' for the
> J784S4 SoC as 'LINK_DOWN' which corresponds to BIT(1). However, according
> to the Technical Reference Manual and Register Documentation for the J784S4
> SoC [0], BIT(1) corresponds to "ENABLE_SYS_EN_PCIE_DPA_1" which is __NOT__
> the field for the link-state interrupt. Instead, it is BIT(10) of the
> "PCIE_INTD_ENABLE_REG_SYS_2" register that corresponds to the link-state
> field named as "ENABLE_SYS_EN_PCIE_LINK_STATE".

I guess the reason we want this is that on J784S4, we ignore actual
link-down interrupts (and we don't write STATUS_CLR_REG_SYS_2 to clear
the interrupt indication, so maybe there's an interrupt storm), and we
think some other interrupt (DPA_1, whatever that is) is actually a
link-down interrupt?

> Hence, set 'linkdown_irq_regfield' to the macro 'J7200_LINK_DOWN' which
> expands to BIT(10) and was first defined for the J7200 SoC. Other SoCs
> already reuse this macro since it accurately represents the link-state
> field in their respective "PCIE_INTD_ENABLE_REG_SYS_2" register.
> 
> [0]: https://www.ti.com/lit/zip/spruj52

Thanks for the spec URL.  Can you include a relevant section number?
I searched for some of this stuff but couldn't find it.

Since I have low confidence that the URL will be valid after a few
years, I wish the spec also had a human-readable name and revision
number.  But maybe the alphabet soup or "SPRUJ52D", "revised July
2024" is all we can hope for.

> Fixes: e49ad667815d ("PCI: j721e: Add TI J784S4 PCIe configuration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on commit
> 48a5eed9ad58 Merge tag 'devicetree-fixes-for-6.14-2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
> of the master branch of Linux.
> 
> Patch has been tested on J784S4-EVM, validating that disconnecting an
> Endpoint Device connected to J784S4-EVM results in the following message
> on the J784S4-EVM:
> 	j721e-pcie 2900000.pcie: LINK DOWN!
> which wasn't seen earlier.
> 
> Regards,
> Siddharth.
> 
>  drivers/pci/controller/cadence/pci-j721e.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 0341d51d6aed..1da9d9918d0d 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -376,13 +376,13 @@ static const struct j721e_pcie_data j784s4_pcie_rc_data = {
>  	.mode = PCI_MODE_RC,
>  	.quirk_retrain_flag = true,
>  	.byte_access_allowed = false,
> -	.linkdown_irq_regfield = LINK_DOWN,
> +	.linkdown_irq_regfield = J7200_LINK_DOWN,
>  	.max_lanes = 4,
>  };
>  
>  static const struct j721e_pcie_data j784s4_pcie_ep_data = {
>  	.mode = PCI_MODE_EP,
> -	.linkdown_irq_regfield = LINK_DOWN,
> +	.linkdown_irq_regfield = J7200_LINK_DOWN,
>  	.max_lanes = 4,
>  };
>  
> -- 
> 2.34.1
> 

