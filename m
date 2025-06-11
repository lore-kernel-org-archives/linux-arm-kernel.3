Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F83C71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tC9igT051cAeKQC1FG7K/eHY3PExhXhPl7C9JioFte8=; b=R7d2R+7nMMWQ1Etey3iWGRB5oH
	of/v1UlUArYgS+8wijiszxzATWnTDIpNhU2xfjcc4aCijj6rxQYDw6bp07IMDBMKvTVNkvXmAAXmf
	5qRX1LNHkb9pDsgAgVa02NNKvl8XBxhSo8veTC2YaPSJZKfech2sOw3WkghlfmQyW5SwRWBgRremE
	FZ+oMkrzhC3vqcKtgswUpoE7BEhmR7kivrBYrPY8JcBYcN4AygrTw1MuZWMzwgswgF5XNTBRDTnm8
	uKTdGw3c/9YhwaPq2/NjJMz9tPfbpzHbTvESk0KEQWhHaktWB4ljYX1pjthzOLM7HjianBnm5FYqC
	aGowJ4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNiX-0000000ASWM-3JsF;
	Wed, 11 Jun 2025 15:50:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKeA-00000009qq2-3Cmm;
	Wed, 11 Jun 2025 12:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 988AA5C10A5;
	Wed, 11 Jun 2025 12:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AD5C4CEEE;
	Wed, 11 Jun 2025 12:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645218;
	bh=+lrA0nPf6AP9cSWAaziIRpa/y8tw6zr1d7w3+2DHq2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A9o71ezQ1GshfhxY7QJyatz0a7jhcqxHGo42lr4cf3GMr9SkxI16i0/HNiqReRL7E
	 Rh1nXAiBH//IOdO7w20nR+g74ZWECqC/610GHCoHKMPgqDEIgBEyu1Dwu7MIce5uaR
	 +Nht8Lu6ciosHF+3ZrupkEMApE1T9Zavh3qBArK4enTaChRPJoK1vRU5YjZvEEuW7C
	 18vAD2uqUp35iG+phmHZqxMDPkwnNhD/w0JQjResqS8AnlFhNBObtgHc5LZ/d+T8BS
	 oKQIpPha4HqPAivRtDCPo3kP2eOHi0D1vYIYTfyesqb9XBm499jyDLAHIlEyDvKrBA
	 2JcAbZLc/AZEg==
Message-ID: <8a00a1ca-fe0e-4d70-a8f8-2d328f4f1620@kernel.org>
Date: Wed, 11 Jun 2025 21:33:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
To: Niklas Cassel <cassel@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Laszlo Fiat <laszlo.fiat@proton.me>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250611105140.1639031-6-cassel@kernel.org>
 <20250611105140.1639031-7-cassel@kernel.org>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250611105140.1639031-7-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_053338_903641_BE978E0E 
X-CRM114-Status: GOOD (  18.34  )
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

On 6/11/25 19:51, Niklas Cassel wrote:
> Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> and instead enumerate the bus directly after receiving the Link Up IRQ.
> 
> This means that there is no longer any delay between link up and the bus
> getting enumerated.
> 
> As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link speeds
> greater than 5.0 GT/s, software must wait a minimum of 100 ms after Link
> training completes before sending a Configuration Request.
> 
> Add this delay in the threaded link up IRQ handler in order to satisfy
> the requirements of the PCIe spec.
> 
> Laszlo Fiat reported (off-list) that his PLEXTOR PX-256M8PeGN NVMe SSD is
> no longer functional, and simply reverting commit ec9fd499b9c6 ("PCI:
> dw-rockchip: Don't wait for link since we can detect Link Up") makes his
> SSD functional again. Adding the 100 ms delay as required by the spec also
> makes the SSD functional again.
> 
> Cc: Laszlo Fiat <laszlo.fiat@proton.me>
> Fixes: ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can detect Link Up")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 93171a392879..a941a239cbfc 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -459,6 +459,13 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>  	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
>  		if (rockchip_pcie_link_up(pci)) {
>  			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");

Should maybe this message be moved after the sleep ?

> +			/*
> +			 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that
> +			 * supports Link speeds greater than 5.0 GT/s, software
> +			 * must wait a minimum of 100 ms after Link training
> +			 * completes before sending a Configuration Request.
> +			 */
> +			msleep(PCIE_T_RRS_READY_MS);
>  			/* Rescan the bus to enumerate endpoint devices */
>  			pci_lock_rescan_remove();
>  			pci_rescan_bus(pp->bridge->bus);

Other than that, looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>


-- 
Damien Le Moal
Western Digital Research

