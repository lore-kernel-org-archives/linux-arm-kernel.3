Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8D6CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NLNTtvcJ1Ks96VIMWlQZpXX9TF1Lt6HYOnNjYBUVQrQ=; b=YpTpHpgmTeKvKuwy55m9SWx6Ba
	hXNQyBGLzQs6wjpyrL9N2KT+cItGPhVkS1B5jfxxUa06/eB2lEnasrjmvCMxFNMpb1K6ttiXO6PiW
	258RYo/Nz86tX/5WZmOGoTPzWwUDuSsMlFBCRzd83PqxqRbiw0lOAALuueROJdIwxBfnrQc8/owdv
	lS3UTvHZ9hnEp2uIZjCAKFwITym7prdYz0m7YXDG5Uka07I2rqU4V87OoXGs3wipA1pBqtFGGdgh2
	z38lU+X9BGi5f7BrMdUwRg4rxEPG8XbOAVvZfpGlwF1AXi4hIYqfn1KA1JGcJVlqaPUSaVlPK0ol+
	SzSptCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEYH-0000000HZsJ-1nn8;
	Tue, 21 Oct 2025 15:45:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEYG-0000000HZrx-1Lp9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B90BC6251B;
	Tue, 21 Oct 2025 15:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39119C4CEF1;
	Tue, 21 Oct 2025 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761061531;
	bh=dlcvFtDb6OWOoHzfzh8r4khgVAAzJlONTZXsa6DBayk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lDAFYe4zauOxm0ztpPeoaTFpH+ptcIs3FnZjeFSTMg1PKwu2LGzLqEOJEtlEONbTl
	 tqTTRXbE1NgxbjCRU2lxwchhMEMZbFbAPhUBJrpxMYYU8GBiPGWhV/rLul5d+isNQc
	 X/I+brRNwBetrzgcZiO84FF2bP8+XXVlDqCw4A3F5iXKJI21eujGXea5uAK6DVMGmV
	 phcPPxU0HbX1eeyDEfeOkBfDBXkVW2o4sUsSUZRp15wKS2Q+SJFazMG1XRO5i0t94F
	 Fs+cfYpeGmXFdSOi3SZDF1webtGEOOlQ7ffVW14p+H7Cnz9hO3boNQpE4q2o2R3thg
	 djeA1fhcseOEw==
Date: Tue, 21 Oct 2025 10:45:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Scott Branden <sbranden@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v4 4/5] PCI: iproc: Implement MSI controller node
 detection with of_msi_xlate()
Message-ID: <20251021154529.GA1191613@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021124103.198419-5-lpieralisi@kernel.org>
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

On Tue, Oct 21, 2025 at 02:41:02PM +0200, Lorenzo Pieralisi wrote:
> The functionality implemented in the iproc driver in order to detect an
> OF MSI controller node is now fully implemented in of_msi_xlate().
> 
> Replace the current msi-map/msi-parent parsing code with of_msi_xlate().
> 
> Since of_msi_xlate() is also a deviceID mapping API, pass in a fictitious
> 0 as deviceID - the driver only requires detecting the OF MSI controller
> node not the deviceID mapping per-se (of_msi_xlate() return value is
> ignored for the same reason).
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I assume this is material for Rob or Thomas?

> ---
>  drivers/pci/controller/pcie-iproc.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index 22134e95574b..ccf71993ea35 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -17,6 +17,7 @@
>  #include <linux/irqchip/arm-gic-v3.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_address.h>
> +#include <linux/of_irq.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
> @@ -1337,29 +1338,16 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
>  
>  static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
>  {
> -	struct device_node *msi_node;
> +	struct device_node *msi_node = NULL;
>  	int ret;
>  
>  	/*
>  	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
>  	 * for us to obtain the MSI node.
>  	 */
> -
> -	msi_node = of_parse_phandle(pcie->dev->of_node, "msi-parent", 0);
> -	if (!msi_node) {
> -		const __be32 *msi_map = NULL;
> -		int len;
> -		u32 phandle;
> -
> -		msi_map = of_get_property(pcie->dev->of_node, "msi-map", &len);
> -		if (!msi_map)
> -			return -ENODEV;
> -
> -		phandle = be32_to_cpup(msi_map + 1);
> -		msi_node = of_find_node_by_phandle(phandle);
> -		if (!msi_node)
> -			return -ENODEV;
> -	}
> +	of_msi_xlate(pcie->dev, &msi_node, 0);
> +	if (!msi_node)
> +		return -ENODEV;
>  
>  	/*
>  	 * Certain revisions of the iProc PCIe controller require additional
> -- 
> 2.50.1
> 

