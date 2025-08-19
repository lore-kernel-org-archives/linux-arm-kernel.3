Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E5CCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MkUJdUk4asI6zkOFWuw++bVgsWKyqPzXK5oraHvqJs=; b=QFSc9ystrsR1aLg+MHFwdemp+h
	RdZijJQhlPSGG3OtOczre9N2HLAuTkTNJKWDykeLAYfGW/gM2i1f9iWVyB/kv7gZoF1v5tSKHvGd+
	NZ/Ood+o37XuGn/zYygiWcm3kIJZKpax9PqYHrZ43LXa90ZznUgePnj1dA95gf1L7pv9Po3ABF0eb
	02X4SISM0E6PDhpzNKvothKqqlWYPK06+VF4LwNvJQE1kTM/WjPr5yEdhM+IRsv9GggIo0eqLctBK
	Dg721oxxGjlP3v3E+z82ivZiLcVHDZRYbcdyWmFrI70GIStL6NDjNuBi6EquJCcreI7WsZQ+5atSg
	4p3qNVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRvB-0000000BOsN-3EF2;
	Tue, 19 Aug 2025 19:23:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoP7J-0000000B0Kh-0d9e;
	Tue, 19 Aug 2025 16:23:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93371613EF;
	Tue, 19 Aug 2025 16:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B6DC4CEF1;
	Tue, 19 Aug 2025 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755620600;
	bh=TG5mF2gjBHDGc+RyikyQdTbwl4JX+eFWd/654sv2CnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z49I23YBEcE6OODH3koS1wODoZghGgpRhOfO6tYy5rGLdr/3RC82LDPQVokBwBnWp
	 ggAntLrGmehOlk7JiHw7h6X8HN0ecTeXZoWVdBgzLHgLP94n6w7QgAyXemsS9LTbWk
	 lJ1q+3qNOFtmpN8HegpxeG7oX6SC9k3wAPllJqoj1CxtsD4C810YWlfKXEHJnS2pY8
	 UtBaXvUfQ4j4I2KSYXF/mkXl7vYXpXkeN/Qzw5Hkvp7S1eMzp4/DOWZ1BeJFaD7mxG
	 Lc5Nvw5qtNM1+HgGhDsTBnoAayiZu6RyksBiSwm7d+tT1zoymTfZA6bQD/syxPJK6/
	 DuPSl0cyo7Chg==
Date: Tue, 19 Aug 2025 21:53:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] PCI: brcmstb: Add panic/die handler to driver
Message-ID: <on7eajzjb7bb5ut4jiwxgi4gckhspar4eztmvzfslemoohr6kr@ccffktlzlpcn>
References: <20250807221513.1439407-1-james.quinlan@broadcom.com>
 <20250807221513.1439407-3-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807221513.1439407-3-james.quinlan@broadcom.com>
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

On Thu, Aug 07, 2025 at 06:15:13PM GMT, Jim Quinlan wrote:
> Whereas most PCIe HW returns 0xffffffff on illegal accesses and the like,
> by default Broadcom's STB PCIe controller effects an abort.  Some SoCs --
> 7216 and its descendants -- have new HW that identifies error details.
> 
> This simple handler determines if the PCIe controller was the cause of the
> abort and if so, prints out diagnostic info.  Unfortunately, an abort still
> occurs.
> 
> Care is taken to read the error registers only when the PCIe bridge is
> active and the PCIe registers are acceptable.  Otherwise, a "die" event
> caused by something other than the PCIe could cause an abort if the PCIe
> "die" handler tried to access registers when the bridge is off.
> 
> Example error output:
>   brcm-pcie 8b20000.pcie: Error: Mem Acc: 32bit, Read, @0x38000000
>   brcm-pcie 8b20000.pcie:  Type: TO=0 Abt=0 UnspReq=1 AccDsble=0 BadAddr=0
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 155 +++++++++++++++++++++++++-
>  1 file changed, 154 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index ceb431a252b7..43c4ada3de07 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -14,15 +14,18 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqchip/irq-msi-lib.h>
>  #include <linux/irqdomain.h>
> +#include <linux/kdebug.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/msi.h>
> +#include <linux/notifier.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/pci.h>
>  #include <linux/pci-ecam.h>
>  #include <linux/printk.h>
> @@ -156,6 +159,39 @@
>  #define  MSI_INT_MASK_SET		0x10
>  #define  MSI_INT_MASK_CLR		0x14
>  
> +/* Error report registers */
> +#define PCIE_OUTB_ERR_TREAT				0x6000
> +#define  PCIE_OUTB_ERR_TREAT_CONFIG_MASK		0x1
> +#define  PCIE_OUTB_ERR_TREAT_MEM_MASK			0x2
> +#define PCIE_OUTB_ERR_VALID				0x6004
> +#define PCIE_OUTB_ERR_CLEAR				0x6008
> +#define PCIE_OUTB_ERR_ACC_INFO				0x600c
> +#define  PCIE_OUTB_ERR_ACC_INFO_CFG_ERR_MASK		0x01
> +#define  PCIE_OUTB_ERR_ACC_INFO_MEM_ERR_MASK		0x02
> +#define  PCIE_OUTB_ERR_ACC_INFO_TYPE_64_MASK		0x04
> +#define  PCIE_OUTB_ERR_ACC_INFO_DIR_WRITE_MASK		0x10
> +#define  PCIE_OUTB_ERR_ACC_INFO_BYTE_LANES_MASK		0xff00
> +#define PCIE_OUTB_ERR_ACC_ADDR				0x6010
> +#define PCIE_OUTB_ERR_ACC_ADDR_BUS_MASK			0xff00000
> +#define PCIE_OUTB_ERR_ACC_ADDR_DEV_MASK			0xf8000
> +#define PCIE_OUTB_ERR_ACC_ADDR_FUNC_MASK		0x7000
> +#define PCIE_OUTB_ERR_ACC_ADDR_REG_MASK			0xfff
> +#define PCIE_OUTB_ERR_CFG_CAUSE				0x6014
> +#define  PCIE_OUTB_ERR_CFG_CAUSE_TIMEOUT_MASK		0x40
> +#define  PCIE_OUTB_ERR_CFG_CAUSE_ABORT_MASK		0x20
> +#define  PCIE_OUTB_ERR_CFG_CAUSE_UNSUPP_REQ_MASK	0x10
> +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_TIMEOUT_MASK	0x4
> +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_DISABLED_MASK	0x2
> +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_64BIT__MASK	0x1
> +#define PCIE_OUTB_ERR_MEM_ADDR_LO			0x6018
> +#define PCIE_OUTB_ERR_MEM_ADDR_HI			0x601c
> +#define PCIE_OUTB_ERR_MEM_CAUSE				0x6020
> +#define  PCIE_OUTB_ERR_MEM_CAUSE_TIMEOUT_MASK		0x40
> +#define  PCIE_OUTB_ERR_MEM_CAUSE_ABORT_MASK		0x20
> +#define  PCIE_OUTB_ERR_MEM_CAUSE_UNSUPP_REQ_MASK	0x10
> +#define  PCIE_OUTB_ERR_MEM_CAUSE_ACC_DISABLED_MASK	0x2
> +#define  PCIE_OUTB_ERR_MEM_CAUSE_BAD_ADDR_MASK		0x1
> +
>  #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
>  #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0
>  
> @@ -305,6 +341,8 @@ struct brcm_pcie {
>  	struct subdev_regulators *sr;
>  	bool			ep_wakeup_capable;
>  	const struct pcie_cfg_data	*cfg;
> +	struct notifier_block	die_notifier;
> +	struct notifier_block	panic_notifier;
>  	bool			bridge_on;
>  	spinlock_t		bridge_lock;
>  };
> @@ -1730,6 +1768,115 @@ static int brcm_pcie_resume_noirq(struct device *dev)
>  	return ret;
>  }
>  
> +/* Dump out PCIe errors on die or panic */
> +static int _brcm_pcie_dump_err(struct brcm_pcie *pcie,
> +			       const char *type)
> +{
> +	void __iomem *base = pcie->base;
> +	int i, is_cfg_err, is_mem_err, lanes;
> +	char *width_str, *direction_str, lanes_str[9];
> +	u32 info, cfg_addr, cfg_cause, mem_cause, lo, hi;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pcie->bridge_lock, flags);
> +	/* Don't access registers when the bridge is off */
> +	if (!pcie->bridge_on || readl(base + PCIE_OUTB_ERR_VALID) == 0) {
> +		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
> +		return NOTIFY_DONE;
> +	}
> +
> +	/* Read all necessary registers so we can release the spinlock ASAP */
> +	info = readl(base + PCIE_OUTB_ERR_ACC_INFO);
> +	is_cfg_err = !!(info & PCIE_OUTB_ERR_ACC_INFO_CFG_ERR_MASK);
> +	is_mem_err = !!(info & PCIE_OUTB_ERR_ACC_INFO_MEM_ERR_MASK);
> +	if (is_cfg_err) {
> +		cfg_addr = readl(base + PCIE_OUTB_ERR_ACC_ADDR);
> +		cfg_cause = readl(base + PCIE_OUTB_ERR_CFG_CAUSE);
> +	}
> +	if (is_mem_err) {
> +		mem_cause = readl(base + PCIE_OUTB_ERR_MEM_CAUSE);
> +		lo = readl(base + PCIE_OUTB_ERR_MEM_ADDR_LO);
> +		hi = readl(base + PCIE_OUTB_ERR_MEM_ADDR_HI);
> +	}
> +	/* We've got all of the info, clear the error */
> +	writel(1, base + PCIE_OUTB_ERR_CLEAR);
> +	spin_unlock_irqrestore(&pcie->bridge_lock, flags);
> +
> +	dev_err(pcie->dev, "handling %s error notification\n", type);

You are not *handling* the error, but just dumping the registers due to the
error. So this error message is misleading.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

