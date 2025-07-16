Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3160C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=4xBu3m27NNNiyYtPNYLiQI7tnJpGA2VIKgO7tKMJhM0=; b=bunPYD4FQEE+7p
	lb6YMmssa9Ac+kIDmRetz/P2CVk0Ue6mAnG6C6tPB5V9yCFpEMmIcCO32Aw4NJpbQbm27/MWeR1Fi
	+iDptWJgFjKUcFQJ5M36AqdRSqfJ11IlJKhfylBrzXmrAbggvXEESj6ElcoGUSeik3BQkv+Ek5ivq
	Jo3Qh5mIG1BSJDo1w7TI0aLCeQu4p7Qac2ajP0+2In5C9ybkX/4KPcsMOo/THGlEy2pWfLnJO7uiI
	2dEQwizphPfSU747uOlLhe2khkVaUBfy3FoNmY34+6t4yslefF4s4JRdoROBdgzZ8Uj90NuQt1MnZ
	eK0RdPr0IPmITAwnsU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc98d-00000008e2a-1eJv;
	Wed, 16 Jul 2025 20:54:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc806-00000008WoB-3W4X;
	Wed, 16 Jul 2025 19:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A89A601BB;
	Wed, 16 Jul 2025 19:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2291C4CEF1;
	Wed, 16 Jul 2025 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752694869;
	bh=GeJXBYx5qreogy5Ib1b/M+uzTrVK0WNP7q/uKYx+wC0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mvKHdPMOuiYnkaLaqsb3FXWodVA3TMXDKgD3HpGfpcNITyHhK+1ZV2+s/s1yjR5bZ
	 wApnXjCZX4+zQ3PIT4L35IPisNDX68Q2WmdUrEN2cMFVmSmp+OJnrLQdZwh6gUT0Uk
	 JKF7nKO2y/dXZX2lpbAs3ppOqgB8AA9fOt60N8srWS475NkyMwFqG8BbMnYHOLP8ox
	 lWhgOVV5pDi/IpvkEehROFwQdf3Gv0ewt/vba5cxM2rJJ6WL/H2kGFGViMFx2Vhcgq
	 v+Y+7BkWHMSYa5GymoXLrMwbNtnvynIaM07xSSYdQhPaHUBygv5m7ayKNTwJsaaVpr
	 WgSOK6tOERjtA==
Date: Wed, 16 Jul 2025 14:41:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nirmal Patel <nirmal.patel@linux.intel.com>
Cc: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 16/16] PCI: vmd: Switch to msi_create_parent_irq_domain()
Message-ID: <20250716194108.GA2552070@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716111009.000022ff@linux.intel.com>
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

On Wed, Jul 16, 2025 at 11:10:09AM -0700, Nirmal Patel wrote:
> On Thu, 26 Jun 2025 16:48:06 +0200
> Nam Cao <namcao@linutronix.de> wrote:
> 
> > Move away from the legacy MSI domain setup, switch to use
> > msi_create_parent_irq_domain().

> > -			unsigned int virq, irq_hw_number_t hwirq,
> > -			msi_alloc_info_t *arg)
> > +static void vmd_msi_free(struct irq_domain *domain, unsigned int
> > virq, unsigned int nr_irqs); +
> > +static int vmd_msi_alloc(struct irq_domain *domain, unsigned int
> > virq, unsigned int nr_irqs,
> > +			 void *arg)
> 
> Is this wrapped in 80 columns? I can see few lines are more than 80.
> Disregard this if it is wrapped and it can be my claws mail client
> issue.

Wrapped locally, thanks Nirmal.

Bjorn

