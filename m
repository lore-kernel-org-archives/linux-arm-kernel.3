Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F657CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Rdyr0rYc3/cuFD8gJ5V04xJTkpzncXdrHwvOzcV2tA=; b=Gc4RGzTy+DctFejDnkcg3HxUyM
	9cU0QKbse/i1oBkLKL+WVMHw3p2aA9bZlksPHS6nT8a9WNke8L8CHb1mg9yDcZPcfPMOG9Wq3xEU+
	89y7MMcdgLWa3Nmoa+lekOkriKQ5YCXG1ABfwYXFknutyZ+5BPT4yFq8PBNJbWUbywVIU3uNszae/
	ohRlX/JYXkvhvGUtbS2irAjMUPTV4tAvX3bGV1+p5t23fB82Ak61mQFTGFPWYJq3uq17A+Uxl4W88
	LrypRb6T9RUchGqp9+fD24RqTqz//6qXdECRMPBxjF5mZqLQSsjAtcViwe2eCrV+2pcgD/Phhj4Za
	fTUNbq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBA8H-0000000Gi0u-0b5O;
	Tue, 21 Oct 2025 11:02:25 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBA8E-0000000Gi0O-2tUq;
	Tue, 21 Oct 2025 11:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761044543; x=1792580543;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4fz4wz59GVcGyxkCosyq8sO/kNH/5xlswDAosqFoi6s=;
  b=PaU41kgYAuNmRVwP714v72REc4qmJ58fwVlmJUS4HDxK24lT4xnTKU9j
   Lc9KBBvDax19Z288OGagn+L5w+qiiZvJMSQ6fFCLsCPcQb5o4/JVI9Zjo
   ilVAG2gKeP5qEU3m60YSP5uC8CWvn3Rr6gSH9gUBIbLid1XrNnTiIGIgG
   qCF7NIyqghAcuUqvsQQTS1CleUlkXx0yMdLmVgFbKODuWBf/zw9EF6zDI
   V+gg78wxgcYTl3ef9G9Cx79v9d3WRgeeS6yDjj/JjI3Dl7wh6nt0wA23n
   jQVtGwEgO/d1h/tC2eO+2+PqaBIlNiOKM9P2b4Dor1s11rOe4RPT9qlu1
   A==;
X-CSE-ConnectionGUID: p4xdiAocQuy5RCNtnqmtKw==
X-CSE-MsgGUID: CU64mttWQxiyBJYcwhmt2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67030496"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="67030496"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 04:02:21 -0700
X-CSE-ConnectionGUID: kHz7nIy2RDGaI5xz3kOuYQ==
X-CSE-MsgGUID: TM9H9HjAQwS0ILUyoYfweQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="187971086"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 04:02:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Oct 2025 14:02:10 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>, 
    Jim Quinlan <james.quinlan@broadcom.com>
cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com, 
    jim2101024@gmail.com, Florian Fainelli <florian.fainelli@broadcom.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
    "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
    "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] PCI: brcmstb: Add panic/die handler to driver
In-Reply-To: <20251020184832.GA1144646@bhelgaas>
Message-ID: <2b0f9620-a105-6e49-f9cb-4bac14e14ce2@linux.intel.com>
References: <20251020184832.GA1144646@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_040222_749692_F08C7D46 
X-CRM114-Status: GOOD (  37.58  )
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

On Mon, 20 Oct 2025, Bjorn Helgaas wrote:

> On Fri, Oct 03, 2025 at 03:56:07PM -0400, Jim Quinlan wrote:
> > Whereas most PCIe HW returns 0xffffffff on illegal accesses and the like,
> > by default Broadcom's STB PCIe controller effects an abort.  Some SoCs --
> > 7216 and its descendants -- have new HW that identifies error details.
> > 
> > This simple handler determines if the PCIe controller was the cause of the
> > abort and if so, prints out diagnostic info.  Unfortunately, an abort still
> > occurs.
> > 
> > Care is taken to read the error registers only when the PCIe bridge is
> > active and the PCIe registers are acceptable.  Otherwise, a "die" event
> > caused by something other than the PCIe could cause an abort if the PCIe
> > "die" handler tried to access registers when the bridge is off.
> > 
> > Example error output:
> >   brcm-pcie 8b20000.pcie: Error: Mem Acc: 32bit, Read, @0x38000000
> >   brcm-pcie 8b20000.pcie:  Type: TO=0 Abt=0 UnspReq=1 AccDsble=0 BadAddr=0
> 
> > +/* Error report registers */
> > +#define PCIE_OUTB_ERR_TREAT				0x6000
> > +#define  PCIE_OUTB_ERR_TREAT_CONFIG_MASK		0x1
> > +#define  PCIE_OUTB_ERR_TREAT_MEM_MASK			0x2
> > +#define PCIE_OUTB_ERR_VALID				0x6004
> > +#define PCIE_OUTB_ERR_CLEAR				0x6008
> > +#define PCIE_OUTB_ERR_ACC_INFO				0x600c
> > +#define  PCIE_OUTB_ERR_ACC_INFO_CFG_ERR_MASK		0x01
> > +#define  PCIE_OUTB_ERR_ACC_INFO_MEM_ERR_MASK		0x02
> > +#define  PCIE_OUTB_ERR_ACC_INFO_TYPE_64_MASK		0x04
> > +#define  PCIE_OUTB_ERR_ACC_INFO_DIR_WRITE_MASK		0x10
> > +#define  PCIE_OUTB_ERR_ACC_INFO_BYTE_LANES_MASK		0xff00
> > +#define PCIE_OUTB_ERR_ACC_ADDR				0x6010
> > +#define PCIE_OUTB_ERR_ACC_ADDR_BUS_MASK			0xff00000
> > +#define PCIE_OUTB_ERR_ACC_ADDR_DEV_MASK			0xf8000
> > +#define PCIE_OUTB_ERR_ACC_ADDR_FUNC_MASK		0x7000
> > +#define PCIE_OUTB_ERR_ACC_ADDR_REG_MASK			0xfff
> > +#define PCIE_OUTB_ERR_CFG_CAUSE				0x6014
> > +#define  PCIE_OUTB_ERR_CFG_CAUSE_TIMEOUT_MASK		0x40
> > +#define  PCIE_OUTB_ERR_CFG_CAUSE_ABORT_MASK		0x20
> > +#define  PCIE_OUTB_ERR_CFG_CAUSE_UNSUPP_REQ_MASK	0x10
> > +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_TIMEOUT_MASK	0x4
> > +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_DISABLED_MASK	0x2
> > +#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_64BIT__MASK	0x1

Double __

> > +#define PCIE_OUTB_ERR_MEM_ADDR_LO			0x6018
> > +#define PCIE_OUTB_ERR_MEM_ADDR_HI			0x601c
> > +#define PCIE_OUTB_ERR_MEM_CAUSE				0x6020
> > +#define  PCIE_OUTB_ERR_MEM_CAUSE_TIMEOUT_MASK		0x40
> > +#define  PCIE_OUTB_ERR_MEM_CAUSE_ABORT_MASK		0x20
> > +#define  PCIE_OUTB_ERR_MEM_CAUSE_UNSUPP_REQ_MASK	0x10
> > +#define  PCIE_OUTB_ERR_MEM_CAUSE_ACC_DISABLED_MASK	0x2
> > +#define  PCIE_OUTB_ERR_MEM_CAUSE_BAD_ADDR_MASK		0x1

Maybe use BIT() instead for single bits?

> IMO "_MASK" is not adding anything useful to these names.  But I see
> there's a lot of precedent in this driver.
>
> >  #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
> >  #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0

Please don't add unnecessary _SHIFT defines as FIELD_GET/PREP() for the 
field define should have most cases covered that require shifting.

This define is also entirely unused in this patch.

> > @@ -306,6 +342,8 @@ struct brcm_pcie {
> >  	bool			ep_wakeup_capable;
> >  	const struct pcie_cfg_data	*cfg;
> >  	bool			bridge_in_reset;
> > +	struct notifier_block	die_notifier;
> > +	struct notifier_block	panic_notifier;
> >  	spinlock_t		bridge_lock;
> >  };
> >  
> > @@ -1731,6 +1769,115 @@ static int brcm_pcie_resume_noirq(struct device *dev)
> >  	return ret;
> >  }
> >  
> > +/* Dump out PCIe errors on die or panic */
> > +static int _brcm_pcie_dump_err(struct brcm_pcie *pcie,
> 
> What is the leading underscore telling me?  There's no
> brcm_pcie_dump_err() that we need to distinguish from.
> 
> > +			       const char *type)
> > +{
> > +	void __iomem *base = pcie->base;
> > +	int i, is_cfg_err, is_mem_err, lanes;
> > +	char *width_str, *direction_str, lanes_str[9];
> > +	u32 info, cfg_addr, cfg_cause, mem_cause, lo, hi;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&pcie->bridge_lock, flags);
> > +	/* Don't access registers when the bridge is off */
> > +	if (pcie->bridge_in_reset || readl(base + PCIE_OUTB_ERR_VALID) == 0) {
> > +		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
> > +		return NOTIFY_DONE;
> > +	}
> > +
> > +	/* Read all necessary registers so we can release the spinlock ASAP */
> > +	info = readl(base + PCIE_OUTB_ERR_ACC_INFO);
> > +	is_cfg_err = !!(info & PCIE_OUTB_ERR_ACC_INFO_CFG_ERR_MASK);
> > +	is_mem_err = !!(info & PCIE_OUTB_ERR_ACC_INFO_MEM_ERR_MASK);
> > +	if (is_cfg_err) {
> > +		cfg_addr = readl(base + PCIE_OUTB_ERR_ACC_ADDR);
> > +		cfg_cause = readl(base + PCIE_OUTB_ERR_CFG_CAUSE);
> > +	}
> > +	if (is_mem_err) {
> > +		mem_cause = readl(base + PCIE_OUTB_ERR_MEM_CAUSE);
> > +		lo = readl(base + PCIE_OUTB_ERR_MEM_ADDR_LO);
> > +		hi = readl(base + PCIE_OUTB_ERR_MEM_ADDR_HI);
> > +	}
> > +	/* We've got all of the info, clear the error */
> > +	writel(1, base + PCIE_OUTB_ERR_CLEAR);
> > +	spin_unlock_irqrestore(&pcie->bridge_lock, flags);
> > +
> > +	dev_err(pcie->dev, "reporting data on PCIe %s error\n", type);
> 
> Looks like this isn't included in the example error output.  Not a big
> deal in itself, but logging this:
> 
>   brcm-pcie 8b20000.pcie: reporting data on PCIe Panic error
> 
> suggests that we know this panic was directly *caused* by PCIe, and
> I'm not sure the fact that somebody called panic() and
> PCIE_OUTB_ERR_VALID was non-zero is convincing evidence of that.
> 
> I think this relies on the assumptions that (a) the controller
> triggers an abort and (b) the abort handler calls panic().  So I think
> this logs useful information that *might* be related to the panic.
> 
> I'd rather phrase this with a little less certainty, to convey the
> idea that "here's some PCIe error information that might be related to
> the panic/die".
> 
> > +	width_str = (info & PCIE_OUTB_ERR_ACC_INFO_TYPE_64_MASK) ? "64bit" : "32bit";
> > +	direction_str = (info & PCIE_OUTB_ERR_ACC_INFO_DIR_WRITE_MASK) ? "Write" : "Read";

Please use str_read_write() + don't forget it's include.

It might be also worth to add str_64bit_32bit() in the form with the
dash ("64-bit") as there a couple of other drivers print the same choice.


> > +	lanes = FIELD_GET(PCIE_OUTB_ERR_ACC_INFO_BYTE_LANES_MASK, info);
> > +	for (i = 0, lanes_str[8] = 0; i < 8; i++)
> > +		lanes_str[i] = (lanes & (1 << i)) ? '1' : '0';
> > +
> > +	if (is_cfg_err) {
> > +		int bus = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_BUS_MASK, cfg_addr);
> > +		int dev = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_DEV_MASK, cfg_addr);
> > +		int func = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_FUNC_MASK, cfg_addr);
> > +		int reg = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_REG_MASK, cfg_addr);
> > +
> > +		dev_err(pcie->dev, "Error: CFG Acc, %s, %s, Bus=%d, Dev=%d, Fun=%d, Reg=0x%x, lanes=%s\n",
> 
> Why are we printing bus and dev with %d?  Can we use the usual format
> ("%04x:%02x:%02x.%d") so it matches other logging?
> 
> > +			width_str, direction_str, bus, dev, func, reg, lanes_str);
> > +		dev_err(pcie->dev, " Type: TO=%d Abt=%d UnsupReq=%d AccTO=%d AccDsbld=%d Acc64bit=%d\n",
> > +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_TIMEOUT_MASK),
> > +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ABORT_MASK),
> > +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_UNSUPP_REQ_MASK),
> > +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_TIMEOUT_MASK),
> > +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_DISABLED_MASK),
> > +			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_64BIT__MASK));
> > +	}
> > +
> > +	if (is_mem_err) {
> > +		u64 addr = ((u64)hi << 32) | (u64)lo;
> > +
> > +		dev_err(pcie->dev, "Error: Mem Acc, %s, %s, @0x%llx, lanes=%s\n",
> > +			width_str, direction_str, addr, lanes_str);
> > +		dev_err(pcie->dev, " Type: TO=%d Abt=%d UnsupReq=%d AccDsble=%d BadAddr=%d\n",
> > +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_TIMEOUT_MASK),
> > +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_ABORT_MASK),
> > +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_UNSUPP_REQ_MASK),
> > +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_ACC_DISABLED_MASK),
> > +			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_BAD_ADDR_MASK));
> > +	}
> > +
> > +	return NOTIFY_OK;
> 
> What is the difference between NOTIFY_DONE and NOTIFY_OK?  Can the
> caller do anything useful based on the difference?
> 
> This seems like opportunistic error information that isn't definitely
> definitely connected to anything, so I'm not sure returning different
> values is really reliable.
> 

