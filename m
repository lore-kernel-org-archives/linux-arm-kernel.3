Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB6FD597AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=F+8DSvnMtK/+kFPyqK6ZYIj5qETWKP7+DJeOfOGzDV4=; b=rN4fwDMC8pBwH+
	Ft7IedJy6vF0HRp6uJKaGG8c4wigmy85aWT7u/GSXYA1F+eP24CTOt4Rm+/kMfzZPJfIFWAs7ze1o
	coKt/O713s5YIi7L3C1I5ekvUCXILlkfRI6VikMbS7JlD7QelsSd57Q0BwboPrHxyeHCpC8iIV4R6
	cuyGi7wYyRRz2UXnP45c7RXHTJMrNcObKzAVmOUf2ddmvB2yc6xCJJsS4FFm5lZLZLpxzOtyJ7R5b
	1exLzOGMntIhTTQOMNK/52roNrk0tRs82SNtgQMqWTZX/OOFptGjXN4DgQifihkST1afutjjdhJGK
	swA+I3WoS4e8+Xb3rSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyj7-000000053ha-3ZPQ;
	Tue, 12 Nov 2024 21:47:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAyfk-000000053Ct-0VbG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 21:43:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2869DA42720;
	Tue, 12 Nov 2024 21:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE84EC4CECD;
	Tue, 12 Nov 2024 21:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731447819;
	bh=TSBvSL3F8utvdtRSv0V0b72Rr2Qwe8DnowxnXL+/4GU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Zwgf7eGDinLJJQzHU5fzK0CcK8hMSQrpqCuhZlg5fCb9cZyYhPFFEaf5s1Jioe20y
	 dtIgb9DZHNR3rivnptyX2Q3U9V6ySlrzPyuu2V9GbpfouD2cLKom+s8ZjMocS4Y5/7
	 hlUW9sEc92udhXpwDVyMGoIdLA3/WShXbAxKRuUhIKuf9Y1shUh9VCV61EWCLjHLlD
	 OUyFCvw7gNvZPdYLVoXY5BT84gPmgGkKoepMdRiKP+POu45iD+rN1eexkEVSX2M0A6
	 XxfB/BW2DZZFZds0G7xrv/TpVMQd5k8AKjidTo5cOZHuWn6l8u8X0C8fbo9jFin1pq
	 JNOvJD0KBeA7g==
Date: Tue, 12 Nov 2024 15:43:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: lpieralisi@kernel.org, thomas.petazzoni@bootlin.com, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	salee@marvell.com, dingwei@marvell.com
Subject: Re: [PATCH 1/1] PCI: armada8k: Disable LTSSM on link down interrupts
Message-ID: <20241112214337.GA1861873@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112064241.749493-1-jpatel2@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_134340_314238_2D8B714E 
X-CRM114-Status: GOOD (  20.12  )
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

On Mon, Nov 11, 2024 at 10:42:41PM -0800, Jenishkumar Maheshbhai Patel wrote:
> When a PCI link down condition is detected, the link training state
> machine must be disabled immediately.

Why?

"Immediately" has no meaning here.  Arbitrary delays are possible and
must not break anything.

> Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
> ---
>  drivers/pci/controller/dwc/pcie-armada8k.c | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
> index b5c599ccaacf..07775539b321 100644
> --- a/drivers/pci/controller/dwc/pcie-armada8k.c
> +++ b/drivers/pci/controller/dwc/pcie-armada8k.c
> @@ -53,6 +53,10 @@ struct armada8k_pcie {
>  #define PCIE_INT_C_ASSERT_MASK		BIT(11)
>  #define PCIE_INT_D_ASSERT_MASK		BIT(12)
>  
> +#define PCIE_GLOBAL_INT_CAUSE2_REG	(PCIE_VENDOR_REGS_OFFSET + 0x24)
> +#define PCIE_GLOBAL_INT_MASK2_REG	(PCIE_VENDOR_REGS_OFFSET + 0x28)
> +#define PCIE_INT2_PHY_RST_LINK_DOWN	BIT(1)
> +
>  #define PCIE_ARCACHE_TRC_REG		(PCIE_VENDOR_REGS_OFFSET + 0x50)
>  #define PCIE_AWCACHE_TRC_REG		(PCIE_VENDOR_REGS_OFFSET + 0x54)
>  #define PCIE_ARUSER_REG			(PCIE_VENDOR_REGS_OFFSET + 0x5C)
> @@ -204,6 +208,11 @@ static int armada8k_pcie_host_init(struct dw_pcie_rp *pp)
>  	       PCIE_INT_C_ASSERT_MASK | PCIE_INT_D_ASSERT_MASK;
>  	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK1_REG, reg);
>  
> +	/* Also enable link down interrupts */
> +	reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG);
> +	reg |= PCIE_INT2_PHY_RST_LINK_DOWN;
> +	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG, reg);
> +
>  	return 0;
>  }
>  
> @@ -221,6 +230,35 @@ static irqreturn_t armada8k_pcie_irq_handler(int irq, void *arg)
>  	val = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_CAUSE1_REG);
>  	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_CAUSE1_REG, val);
>  
> +	val = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_CAUSE2_REG);
> +
> +	if (PCIE_INT2_PHY_RST_LINK_DOWN & val) {
> +		u32 ctrl_reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_CONTROL_REG);

Add blank line.

> +		/*
> +		 * The link went down. Disable LTSSM immediately. This
> +		 * unlocks the root complex config registers. Downstream
> +		 * device accesses will return all-Fs
> +		 */
> +		ctrl_reg &= ~(PCIE_APP_LTSSM_EN);
> +		dw_pcie_writel_dbi(pci, PCIE_GLOBAL_CONTROL_REG, ctrl_reg);

And here.

> +		/*
> +		 * Mask link down interrupts. They can be re-enabled once
> +		 * the link is retrained.
> +		 */
> +		ctrl_reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG);
> +		ctrl_reg &= ~PCIE_INT2_PHY_RST_LINK_DOWN;
> +		dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG, ctrl_reg);

And here.  Follow existing coding style in this file.

> +		/*
> +		 * At this point a worker thread can be triggered to
> +		 * initiate a link retrain. If link retrains were
> +		 * possible, that is.
> +		 */
> +		dev_dbg(pci->dev, "%s: link went down\n", __func__);
> +	}
> +
> +	/* Now clear the second interrupt cause. */
> +	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_CAUSE2_REG, val);
> +
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.25.1
> 

