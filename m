Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B25C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yqd9COweMw43Ke1VH5FlCV1aPcBBVhra3sps1RSmHYo=; b=Mw/zmJNcszuIZx9lWDZvjw13rv
	2Cz7nrjlgdlDM18nQP7wKxjDHwofzZ7O2D9uABXa4p7ALxT90Zv8gVWl2pgQUnKaUPxDtmeXxLzGs
	1VfRXplu7pe39ppaB57GER4XSMUBj/Cd+JWcqmL/2JUUDSIXVIlRG4vmbYitiGuOc5gz1/qR+aVqj
	6dLfXSp7X9IE9RIsjGinXoqvNk8fj8UW7VGwYwibmXKju1phQDC4+QHXh64zgpGR14mdPRav0ZqsJ
	uLQbpXVdX3JADaAcDkUBUO0zq3m0YucQldkhlCVLXWMQ4qkatsrlMm1AfKM2uqfhA6oEqrSPeNBqh
	W83P9RPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7D1P-00000007B1Z-1xvv;
	Tue, 22 Apr 2025 12:46:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Byi-00000006z1B-2E8O;
	Tue, 22 Apr 2025 11:39:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B29855C479A;
	Tue, 22 Apr 2025 11:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC25C4CEE9;
	Tue, 22 Apr 2025 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745321991;
	bh=LvVe3mABaUW4+b16EtPFOLNobUI0Izc6wjH25SG4f3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lxq+6wdbVCOSDSPGRxd2NJJi8at9gu0uT3YEYGZcGvaLp4Hkw7gqYT926bcNdFBsO
	 ZJES5SwEOCu1cE7wHVqNq9FYZM96sUKQIZWHPX5lSMhCANM4jTX0gRBWfSdgv/WRaw
	 0pEZaBS35Ja5OcQ2a8C4yq1wUziyx+T/MhrUJc6dgAVZq1/DUZFbyaC32dk93K588E
	 4U/5ERv3zZbwRz0Z6wMQTCtuEulkVD1v06qHOubA3OrRYgcwBlVJPgCgg5U+bJM2hw
	 tshbHzNrqMxBU4eeaUJMevxt9rpE7XqAz2JN8gpRzS2DEvqx6jedihlYxi/QkxS35t
	 uoEB6B2JL+PDQ==
Date: Tue, 22 Apr 2025 13:39:46 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] PCI: dw-rockchip: Unify link status checks with
 FIELD_GET
Message-ID: <aAeAAhb4R8ya_mBO@ryzen>
References: <20250422112830.204374-1-18255117159@163.com>
 <20250422112830.204374-4-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422112830.204374-4-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043952_686902_72970984 
X-CRM114-Status: GOOD (  18.32  )
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

On Tue, Apr 22, 2025 at 07:28:30PM +0800, Hans Zhang wrote:
> Link-up detection manually checked PCIE_LINKUP bits across RC/EP modes,
> leading to code duplication. Centralize the logic using FIELD_GET. This
> removes redundancy and abstracts hardware-specific bit masking, ensuring
> consistent link state handling.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index cdc8afc6cfc1..2b26060af5c2 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -196,10 +196,7 @@ static int rockchip_pcie_link_up(struct dw_pcie *pci)
>  	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
>  	u32 val = rockchip_pcie_get_ltssm(rockchip);
>  
> -	if ((val & PCIE_LINKUP) == PCIE_LINKUP)
> -		return 1;
> -
> -	return 0;
> +	return FIELD_GET(PCIE_LINKUP_MASK, val) == 3;

While I like the idea of your patch, here you are replacing something that
is easy to read (PCIE_LINKUP) with a magic value, which IMO is a step in
the wrong direction.


>  }
>  
>  static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
> @@ -499,7 +496,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>  	struct dw_pcie *pci = &rockchip->pci;
>  	struct dw_pcie_rp *pp = &pci->pp;
>  	struct device *dev = pci->dev;
> -	u32 reg, val;
> +	u32 reg;
>  
>  	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
>  	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
> @@ -508,8 +505,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>  	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
>  
>  	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
> -		val = rockchip_pcie_get_ltssm(rockchip);
> -		if ((val & PCIE_LINKUP) == PCIE_LINKUP) {
> +		if (rockchip_pcie_link_up(pci)) {
>  			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
>  			/* Rescan the bus to enumerate endpoint devices */
>  			pci_lock_rescan_remove();
> @@ -526,7 +522,7 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>  	struct rockchip_pcie *rockchip = arg;
>  	struct dw_pcie *pci = &rockchip->pci;
>  	struct device *dev = pci->dev;
> -	u32 reg, val;
> +	u32 reg;
>  
>  	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
>  	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
> @@ -540,8 +536,7 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>  	}
>  
>  	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
> -		val = rockchip_pcie_get_ltssm(rockchip);
> -		if ((val & PCIE_LINKUP) == PCIE_LINKUP) {
> +		if (rockchip_pcie_link_up(pci)) {
>  			dev_dbg(dev, "link up\n");
>  			dw_pcie_ep_linkup(&pci->ep);
>  		}
> -- 
> 2.25.1
> 

