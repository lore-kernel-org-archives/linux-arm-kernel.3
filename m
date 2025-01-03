Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEE4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qtdZoL/YUWRr3fRMQiv+FHrIoEck+BxKMEZjSEvNado=; b=f+gD3za9WTVfB2
	cOZpBwucymLoK/beFSacsrqmgSZY6/MdiBsQJTpDxgnN/GNQYtoPYXIKBkChUvha3qnkES6Ma7Nge
	EY8DLTyDe0088H3g4UZ46+TPEmcF8cTKaQAOJ6XbrRWWcIQUCrpx90IPbCaYujYffEYOr9aSdiIXn
	Ff6wzc05Zht7s3Ukex88sMbsRz1veaRH1b8zyMhsSeZv727C0N6t9QJKrlHpJAMTQzffnR/YyBaft
	nXzwX0gFUtdCb10J+WB09IXMPekNdJsRdVwl/cvyOiqKYccNbFkjmU93sFwWMRhJCX4VAFT0WfOZK
	vRWoNcRFhnaRGX73lwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn8D-0000000DoKD-1yks;
	Fri, 03 Jan 2025 19:14:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn72-0000000DoD9-0Lzl;
	Fri, 03 Jan 2025 19:13:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF251A410B4;
	Fri,  3 Jan 2025 19:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D26FC4CECE;
	Fri,  3 Jan 2025 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931614;
	bh=cCfjYjHS7nqZCqHD4TvPswK9EJtkGi/Z30r+QOPZ98Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BF4GQoft1riJRCZ3O/4squ29/iAvQ8H8Sc7Mi6NLamy1UIArGlEvWjQyMEKsXFua7
	 lMKh5CC8cwOz3fSHeHxi4Q1obg7LsCEs6c1+UjEw+lrRU+ptZYzfM1RYjOwDMaIPiT
	 5NHk2iONweDTr1k6PhyGYSeRb+O7eM6GJiohRirXALOse56RvuhLAizxEl+WEysfQE
	 f4TSGuqxaxvranwbnVF+5P9S5dAlFjjrMG62Vqlf8PkhFIlzwQx8YFM4qGqIYPUTrC
	 l+vjUu3hruYpDfJWfW7m/aHYbEHIXFdXI3mwZZAol99wgr0S1j54/f3OFUzXTCZj3i
	 6Ay3DfgyiJKxg==
Date: Fri, 3 Jan 2025 13:13:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH 5/5] PCI: mediatek-gen3: Keep PCIe power and clocks if
 suspend-to-idle
Message-ID: <20250103191331.GA4190357@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103060035.30688-6-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_111336_252362_83872D2E 
X-CRM114-Status: GOOD (  26.06  )
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

On Fri, Jan 03, 2025 at 02:00:15PM +0800, Jianjun Wang wrote:
> If the target system sleep state is suspend-to-idle, the bridge is
> supposed to stay in D0, and the framework will not help to restore its
> configuration space, so keep its power and clocks during suspend.
> 
> It's recommended to enable L1ss support, so the link can be changed to
> L1.2 state during suspend.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 48f83c2d91f7..11da68910502 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1291,6 +1291,19 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
>  	int err;
>  	u32 val;
>  
> +	/*
> +	 * If the target system sleep state is suspend-to-idle, the bridge is supposed to stay in
> +	 * D0, and the framework will not help to restore its configuration space, so keep it's
> +	 * power and clocks during suspend.

s/it's/its/

Where does the requirement for the bridge to stay in D0 come from?  Is
that part of the Linux power management framework?  Or is this
something specific to this SoC?

I guess "framework" refers to Linux power management, so maybe that
assumes nothing needs to be restored when resuming from
suspend-to-idle?

> +	 * It's recommended to enable L1ss support, so the link can be changed to L1.2 state during
> +	 * suspend.

Wrap to fit in 80 columns like the rest of the file.

s/L1ss/L1SS/

Who recommends enabling L1SS support?  I suppose enabling L1SS means
setting CONFIG_PCIEASPM=y?

What causes the transition to L1.2?  Is this done by firmware or
something else outside of Linux?

> +	if (pm_suspend_default_s2idle()) {
> +		dev_info(dev, "System enter s2idle state, keep PCIe power and clocks\n");

1) I'm a bit dubious about this since there are only two callers of
pm_suspend_default_s2idle() in the rest of the kernel.  What's unique
about this device that requires this?  Is this an indication that
we're setting mtk_pcie_pm_ops incorrectly, i.e., are we using
mtk_pcie_suspend_noirq() for a callback that is *never* supposed to
power down the device?

2) The message seems like possible overkill, maybe could be dev_dbg()?
I'm not sure the user needs this information at every suspend/resume
transition.

> +		return 0;
> +	}
> +
>  	/* Trigger link to L2 state */
>  	err = mtk_pcie_turn_off_link(pcie);
>  	if (err) {
> @@ -1316,6 +1329,11 @@ static int mtk_pcie_resume_noirq(struct device *dev)
>  	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
>  	int err;
>  
> +	if (pm_suspend_default_s2idle()) {
> +		dev_info(dev, "System enter s2idle state, no need to reinitialization\n");
> +		return 0;
> +	}
> +
>  	err = pcie->soc->power_up(pcie);
>  	if (err)
>  		return err;
> -- 
> 2.46.0
> 

