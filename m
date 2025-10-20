Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A21CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NqGYobboUdW1G9PLBetA4b9la5YBiKRpKr8cFBtnww4=; b=MPYwpNqGlO03qb
	96EpJHn6OsBtt3l/g0bBrLT8dWUQ+Fw6BCr0RhWb2mmcUusGXL/UtMlWn8mLbquKhsg1qrm2cM6hw
	EYCEmLJ4wYFg8tQNRh0qhXko2kbH0OpVKFPFOmXk/a2GizRp6VDGeMzflOgnsk/42MJE5jNyn7yeq
	TXi0dqR8dYxS9vsb0hq2oOcGL8BiI1LsVPJuuhNkow5c4Z2DmtU2s6LE+NYcsMT9u6f7HMSAPkDcP
	UcBikZdynIReFxQGpHOvxbPY8oDpU6gdaREh+K46uESXhLNv6PH3y7NHxnFQKcMNKx20Wt8DyWOD/
	Ei7ZWCTyTSKfoUnQsJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuvt-0000000EfeZ-0Ng3;
	Mon, 20 Oct 2025 18:48:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuvq-0000000Efdh-3Rwb;
	Mon, 20 Oct 2025 18:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C53BB45753;
	Mon, 20 Oct 2025 18:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87273C113D0;
	Mon, 20 Oct 2025 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760986113;
	bh=o/Sy2P8YFH5ANKdlTpZx1IEAMq0gSZpaNcIbyeS/PII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=losduLJAc7dAsf3wyrLi+rC/AOAjmanuRRkZpjuzOAryHiqMxNGC4fkX45HwQt0mK
	 2wOLx1BssZsLCEhHY4SFi9C0mCiiKireXPeWwxbYxjdIlJIMoMq2wP6uwypeHSczJw
	 tPZnn9CifhdvSS6DWWbExHByyNcpqq8B7zjufkjuvBrjVzuebDbufka1MxKebaGMv/
	 Y67hYZULhqD/dSuxJbBzQr/KS8WO/b/sSaQ4cK6KEO06zEQizp6UmKjA/3K+iWiGph
	 LvpsGEMo7zCx8STtys5VHLCFt+gLP7PI1QXcsmpohMczQhCoiaWewBcMoil7bMk9i2
	 f8ZIoIcYP+/8g==
Date: Mon, 20 Oct 2025 13:48:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] PCI: brcmstb: Add panic/die handler to driver
Message-ID: <20251020184832.GA1144646@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003195607.2009785-3-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_114834_901950_296E1C18 
X-CRM114-Status: GOOD (  27.94  )
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

On Fri, Oct 03, 2025 at 03:56:07PM -0400, Jim Quinlan wrote:
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

IMO "_MASK" is not adding anything useful to these names.  But I see
there's a lot of precedent in this driver.

>  #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
>  #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0
>  
> @@ -306,6 +342,8 @@ struct brcm_pcie {
>  	bool			ep_wakeup_capable;
>  	const struct pcie_cfg_data	*cfg;
>  	bool			bridge_in_reset;
> +	struct notifier_block	die_notifier;
> +	struct notifier_block	panic_notifier;
>  	spinlock_t		bridge_lock;
>  };
>  
> @@ -1731,6 +1769,115 @@ static int brcm_pcie_resume_noirq(struct device *dev)
>  	return ret;
>  }
>  
> +/* Dump out PCIe errors on die or panic */
> +static int _brcm_pcie_dump_err(struct brcm_pcie *pcie,

What is the leading underscore telling me?  There's no
brcm_pcie_dump_err() that we need to distinguish from.

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
> +	if (pcie->bridge_in_reset || readl(base + PCIE_OUTB_ERR_VALID) == 0) {
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
> +	dev_err(pcie->dev, "reporting data on PCIe %s error\n", type);

Looks like this isn't included in the example error output.  Not a big
deal in itself, but logging this:

  brcm-pcie 8b20000.pcie: reporting data on PCIe Panic error

suggests that we know this panic was directly *caused* by PCIe, and
I'm not sure the fact that somebody called panic() and
PCIE_OUTB_ERR_VALID was non-zero is convincing evidence of that.

I think this relies on the assumptions that (a) the controller
triggers an abort and (b) the abort handler calls panic().  So I think
this logs useful information that *might* be related to the panic.

I'd rather phrase this with a little less certainty, to convey the
idea that "here's some PCIe error information that might be related to
the panic/die".

> +	width_str = (info & PCIE_OUTB_ERR_ACC_INFO_TYPE_64_MASK) ? "64bit" : "32bit";
> +	direction_str = (info & PCIE_OUTB_ERR_ACC_INFO_DIR_WRITE_MASK) ? "Write" : "Read";
> +	lanes = FIELD_GET(PCIE_OUTB_ERR_ACC_INFO_BYTE_LANES_MASK, info);
> +	for (i = 0, lanes_str[8] = 0; i < 8; i++)
> +		lanes_str[i] = (lanes & (1 << i)) ? '1' : '0';
> +
> +	if (is_cfg_err) {
> +		int bus = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_BUS_MASK, cfg_addr);
> +		int dev = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_DEV_MASK, cfg_addr);
> +		int func = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_FUNC_MASK, cfg_addr);
> +		int reg = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_REG_MASK, cfg_addr);
> +
> +		dev_err(pcie->dev, "Error: CFG Acc, %s, %s, Bus=%d, Dev=%d, Fun=%d, Reg=0x%x, lanes=%s\n",

Why are we printing bus and dev with %d?  Can we use the usual format
("%04x:%02x:%02x.%d") so it matches other logging?

> +			width_str, direction_str, bus, dev, func, reg, lanes_str);
> +		dev_err(pcie->dev, " Type: TO=%d Abt=%d UnsupReq=%d AccTO=%d AccDsbld=%d Acc64bit=%d\n",
> +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_TIMEOUT_MASK),
> +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ABORT_MASK),
> +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_UNSUPP_REQ_MASK),
> +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_TIMEOUT_MASK),
> +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_DISABLED_MASK),
> +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_64BIT__MASK));
> +	}
> +
> +	if (is_mem_err) {
> +		u64 addr = ((u64)hi << 32) | (u64)lo;
> +
> +		dev_err(pcie->dev, "Error: Mem Acc, %s, %s, @0x%llx, lanes=%s\n",
> +			width_str, direction_str, addr, lanes_str);
> +		dev_err(pcie->dev, " Type: TO=%d Abt=%d UnsupReq=%d AccDsble=%d BadAddr=%d\n",
> +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_TIMEOUT_MASK),
> +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_ABORT_MASK),
> +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_UNSUPP_REQ_MASK),
> +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_ACC_DISABLED_MASK),
> +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_BAD_ADDR_MASK));
> +	}
> +
> +	return NOTIFY_OK;

What is the difference between NOTIFY_DONE and NOTIFY_OK?  Can the
caller do anything useful based on the difference?

This seems like opportunistic error information that isn't definitely
definitely connected to anything, so I'm not sure returning different
values is really reliable.

