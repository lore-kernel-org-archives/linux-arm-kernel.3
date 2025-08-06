Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE08C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 19:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GxuHH36kKrrdCJx6MEJVIMq7VxyJ/matkiWk7a2/pqM=; b=aGB1+jtt353kBD
	wxigfr63mc3sQdTMaqC9sKzeO1YANKReFg5MKGK/Q/z5gSTN7o+tBgOA/+4MV7ysuNQjWOXAHX5CC
	B5x8G+pPdWc7cGWkDbV1IIEc1tCYDhC7BPuOAo5oGaA4hrEDGSAWAZylP1UK7owztoipeHLA3pwAE
	XeRbht6hm8CD5u1o5WicApt/wLze0MFUZ+STcBD2lTuIHeB3JK5DUeazsu7Gsps096DFhqlNExyzv
	szCL0/6UqDRCHl1DTCzqw4gOfAYawPpwu34Y4pzPR5fkeL+V+8F1jcLxW+Qs8+meDQ2C1y+g545It
	dbRlxYQDKJUG3YmNIRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjdj-0000000GBRo-0Khz;
	Wed, 06 Aug 2025 19:17:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjb9-0000000GB3k-2mai;
	Wed, 06 Aug 2025 19:14:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2105A55BC0;
	Wed,  6 Aug 2025 19:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614E5C4CEE7;
	Wed,  6 Aug 2025 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507690;
	bh=ydQo/qDZK3xKlXT0YMaYteDL2FGoGeQkbdadaVZY63M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MQdhWvEgHPdVSeTX/z+JUajRTvqoAcxHTNRJqIhduPRIbyO2lWvEBIax3jQJ3Nfd6
	 sNrjSeQogRo3tjlaW6l3W9YFqW4FnDYFldaNOqVh/rPv1MGPhTIKcQUx2iSUKMj7ea
	 XDXGge1JXnyfYsabfYt0Q90qq646oQU6PvRW1ghNTYI19CR4UP8+1Zy5HxvAkX+13n
	 iiacjk6d58Dxb4fHt24A/dJCeElI/hXAMa9H74VFIm5glVxjrCaAtH1COi+9hma/I7
	 sYEaOFAM+w3kdKihYX2J7rRd9KUjvy91oQbPIkalAj4Cps/j4SQQuUUOJX5Ps7DpYS
	 7WUel1/hOmzYA==
Date: Wed, 6 Aug 2025 14:14:48 -0500
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
Subject: Re: [PATCH 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge
 is active
Message-ID: <20250806191448.GA8432@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613220843.698227-2-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_121451_848701_084E44C8 
X-CRM114-Status: GOOD (  35.80  )
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

On Fri, Jun 13, 2025 at 06:08:42PM -0400, Jim Quinlan wrote:
> In a future commit, a new handler will be introduced that in part does
> reads and writes to some of the PCIe registers.  When this handler is
> invoked, it is paramount that it does not do these register accesses when
> the PCIe bridge is inactive, as this will cause CPU abort errors.
> 
> To solve this we keep a spinlock that guards a variable which indicates
> whether the bridge is on or off.  When the bridge is on, access of the PCIe
> HW registers may proceed.
> 
> Since there are multiple ways to reset the bridge, we introduce a general
> function to obtain the spinlock, call the specific function that is used
> for the specific SoC, sets the bridge active indicator variable, and
> releases the spinlock.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 40 +++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 92887b394eb4..400854c893d8 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -29,6 +29,7 @@
>  #include <linux/reset.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  
> @@ -254,6 +255,7 @@ struct pcie_cfg_data {
>  	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
>  	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
>  	int (*post_setup)(struct brcm_pcie *pcie);
> +	bool has_err_report;

It doesn't look worth it to me to add this.  It only avoids locking in
a non-performance path.

>  };
>  
>  struct subdev_regulators {
> @@ -299,6 +301,8 @@ struct brcm_pcie {
>  	struct subdev_regulators *sr;
>  	bool			ep_wakeup_capable;
>  	const struct pcie_cfg_data	*cfg;
> +	bool			bridge_on;
> +	spinlock_t		bridge_lock;
>  };
>  
>  static inline bool is_bmips(const struct brcm_pcie *pcie)
> @@ -306,6 +310,24 @@ static inline bool is_bmips(const struct brcm_pcie *pcie)
>  	return pcie->cfg->soc_base == BCM7435 || pcie->cfg->soc_base == BCM7425;
>  }
>  
> +static inline int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	if (pcie->cfg->has_err_report)
> +		spin_lock_irqsave(&pcie->bridge_lock, flags);
> +
> +	ret = pcie->cfg->bridge_sw_init_set(pcie, val);
> +	if (ret)
> +		pcie->bridge_on = !val;

AFAICT, .bridge_sw_init_set(1) asserts reset, .bridge_sw_init_set(0)
deasserts reset, and it returns 0 for success, so I'm confused about
this.  If either assert or deassert failed (ret != 0), I guess we
don't know the state of the bridge and can't assume it's active, so I
would have expected something like:

  ret = pcie->cfg->bridge_sw_init_set(pcie, val);
  if (ret)
    pcie->bridge_on = false;
  else
    pcie->bridge_on = !val;

Tangent: the last "return ret" in brcm_pcie_bridge_sw_init_set_generic()
should be "return 0" and drop the unnecessary initialization of "ret".

And the code there would be vastly improved by using FIELD_PREP() or
u32p_replace_bits() and getting rid of the shifting.

> +	if (pcie->cfg->has_err_report)
> +		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
> +
> +	return ret;
> +}
> +
>  /*
>   * This is to convert the size of the inbound "BAR" region to the
>   * non-linear values of PCIE_X_MISC_RC_BAR[123]_CONFIG_LO.SIZE
> @@ -1078,7 +1100,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>  	int memc, ret;
>  
>  	/* Reset the bridge */
> -	ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
> +	ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
>  	if (ret)
>  		return ret;
>  
> @@ -1094,7 +1116,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>  	usleep_range(100, 200);
>  
>  	/* Take the bridge out of reset */
> -	ret = pcie->cfg->bridge_sw_init_set(pcie, 0);
> +	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
>  	if (ret)
>  		return ret;
>  
> @@ -1545,7 +1567,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
>  
>  	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
>  		/* Shutdown PCIe bridge */
> -		ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
> +		ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
>  
>  	return ret;
>  }
> @@ -1633,7 +1655,9 @@ static int brcm_pcie_resume_noirq(struct device *dev)
>  		goto err_reset;
>  
>  	/* Take bridge out of reset so we can access the SERDES reg */
> -	pcie->cfg->bridge_sw_init_set(pcie, 0);
> +	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
> +	if (ret)
> +		goto err_reset;
>  
>  	/* SERDES_IDDQ = 0 */
>  	tmp = readl(base + HARD_DEBUG(pcie));
> @@ -1901,7 +1925,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "could not enable clock\n");
>  
> -	pcie->cfg->bridge_sw_init_set(pcie, 0);
> +	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not un-reset the bridge\n");

"un-reset" doesn't mean anything to me.  Is this the same as "could
not take the bridge out of reset"?  Or maybe "could not deassert
bridge reset"?

>  	if (pcie->swinit_reset) {
>  		ret = reset_control_assert(pcie->swinit_reset);
> @@ -1976,6 +2003,9 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	if (pcie->cfg->has_err_report)
> +		spin_lock_init(&pcie->bridge_lock);
> +
>  	return 0;
>  
>  fail:
> -- 
> 2.34.1
> 

