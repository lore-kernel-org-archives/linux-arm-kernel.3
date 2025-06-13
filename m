Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31129C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SRXme3Of48u+7e0GODTojES10C+785CJEGiEThyvqJo=; b=CQnaLnCdMUikAz
	h9lj8bF+ZSEIL42rDI9YZ61pXr3Du/IpPM/F6d2AZ1v9rO7ajISZGEGE2Nzk/8M86+RB4bqjHbmwu
	EnHN95T2TbHlv8KoUH4HUnCodO+cznqOVdd7b437Jn6b11DRBqJJwZrK8xIv558+2nZ8oysoneOej
	PnYW1qzT8rkcJYSwTe7H4vHr2B4B0ecNi+y8bezM1tSZvq/Ru1idy0TGt0Y0uj3LiZK3i+6CiRbOu
	E2gGcED4SW7kY68VHXiIe4mVMtaI3weKAFfLaQg2tWkVU5MppYycbWrDKCbLsxrvDSiRUItNm6XZe
	mA1xzvFPmeYEUR+p9m/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAp7-0000000HXvg-1ux2;
	Fri, 13 Jun 2025 20:16:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAmx-0000000HXX9-3dFA;
	Fri, 13 Jun 2025 20:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D8A662A10;
	Fri, 13 Jun 2025 20:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C517AC4CEE3;
	Fri, 13 Jun 2025 20:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749845650;
	bh=Zio/9ed1ISRgWicUqk/j1UAIrxh6W2Aq1NctnSkSqjg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IAJP7Raic0SQjqE3t8ej2YiZWcFDLxcJmuLnstD+ww4P3KgdECE5SlqmEi5uEyddi
	 YDto2pIAg7qcILAQnVArh8oefuPEdsdPYiixPquLyBIkr/ecbhxxM/Ryqsj1wQkYdF
	 7IStXXPPxsQTSt4dgXOxj/IGLRXwBb3sI4ATE9EgyHlKr2gMKp1GSaJbIbG7+cx5p0
	 ujnOhVrJN0B60glcRgz01Ju042eHHU+Yn4ueM1WQ2Lkbl5aiVnwjm2onOwvA8YvZnd
	 OT1IdOTIiJ5QEuP2Mx533U8q53XlJY5TtZ2CxpYL4QOXbtVSTEROAeAqEpPKADmbge
	 PPBLYTUp8U3jg==
Date: Fri, 13 Jun 2025 15:14:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v4 1/5] PCI: rockchip: Use standard PCIe
 defines
Message-ID: <20250613201409.GA973486@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <992ab6278af59b8f2f82521bf4611f69a916bbe1.1749827015.git.geraldogabriel@gmail.com>
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

On Fri, Jun 13, 2025 at 12:05:31PM -0300, Geraldo Nascimento wrote:
> Current code uses custom-defined register offsets
> and bitfields for standard PCIe registers. Change
> to using standard PCIe defines.

Wrap to fill 75 columns so there's space for "git log" to add
indentation.

> @@ -40,18 +40,18 @@ static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
>  {
>  	u32 status;
>  
> -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  	status |= (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
> -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  }
>  
>  static void rockchip_pcie_clr_bw_int(struct rockchip_pcie *rockchip)
>  {
>  	u32 status;
>  
> -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  	status |= (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;

It looks funny to write PCI_EXP_LNKCTL with bits from PCI_EXP_LNKSTA.
I guess this is because rockchip_pcie_write() does 32-bit writes, but
PCI_EXP_LNKCTL and PCI_EXP_LNKSTA are adjacent 16-bit registers.

If the hardware supports it, adding rockchip_pcie_readw() and
rockchip_pcie_writew() for 16-bit accesses would make this read
better.

Hopefully the hardware *does* support this (it's required per spec at
least for config accesses, which would be a different path in the
hardware).  Doing the 32-bit write of PCI_EXP_LNKCTL above is
problematic because writes PCI_EXP_LNKSTA as well, and PCI_EXP_LNKSTA
includes some RW1C bits that may be unintentionally cleared.

> -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  }
>  
>  static void rockchip_pcie_update_txcredit_mui(struct rockchip_pcie *rockchip)
> @@ -269,7 +269,7 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
>  	scale = 3; /* 0.001x */
>  	curr = curr / 1000; /* convert to mA */
>  	power = (curr * 3300) / 1000; /* milliwatt */
> -	while (power > PCIE_RC_CONFIG_DCR_CSPL_LIMIT) {
> +	while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
>  		if (!scale) {
>  			dev_warn(rockchip->dev, "invalid power supply\n");
>  			return;
> @@ -278,10 +278,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
>  		power = power / 10;
>  	}
>  
> -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCR);
> -	status |= (power << PCIE_RC_CONFIG_DCR_CSPL_SHIFT) |
> -		  (scale << PCIE_RC_CONFIG_DCR_CPLS_SHIFT);
> -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
> +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
> +	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
> +	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);

This assumes the value you read from PCI_EXP_DEVCAP had zeroes in
these bits.  It might, but it would look safer to do:

  status &= ~(PCI_EXP_DEVCAP_PWR_VAL | PCI_EXP_DEVCAP_PWR_SCL);
  status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
  status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);

> +	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
>  }

>  /**
> @@ -309,14 +309,14 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  	rockchip_pcie_set_power_limit(rockchip);
>  
>  	/* Set RC's clock architecture as common clock */
> -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  	status |= PCI_EXP_LNKSTA_SLC << 16;
> -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  
>  	/* Set RC's RCB to 128 */
> -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  	status |= PCI_EXP_LNKCTL_RCB;
> -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  
>  	/* Enable Gen1 training */
>  	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
> @@ -341,9 +341,9 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  		 * Enable retrain for gen2. This should be configured only after
>  		 * gen1 finished.
>  		 */
> -		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
> +		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  		status |= PCI_EXP_LNKCTL_RL;
> -		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
> +		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
>  
>  		err = readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
>  					 status, PCIE_LINK_IS_GEN2(status), 20,
> @@ -380,15 +380,15 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
>  
>  	/* Clear L0s from RC's link cap */
>  	if (of_property_read_bool(dev->of_node, "aspm-no-l0s")) {
> -		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LINK_CAP);
> -		status &= ~PCIE_RC_CONFIG_LINK_CAP_L0S;
> -		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LINK_CAP);
> +		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
> +		status &= ~PCI_EXP_LNKCAP_ASPM_L0S;
> +		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
>  	}
>  
> -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCSR);
> -	status &= ~PCIE_RC_CONFIG_DCSR_MPS_MASK;
> -	status |= PCIE_RC_CONFIG_DCSR_MPS_256;
> -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCSR);
> +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
> +	status &= ~PCI_EXP_DEVCTL_PAYLOAD;
> +	status |= PCI_EXP_DEVCTL_PAYLOAD_256B;
> +	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);

Similar problem here; PCI_EXP_DEVCTL is only 16 bits, and writing the
adjacent PCI_EXP_DEVSTA may clear RW1C bits you didn't want to clear.

Bjorn

