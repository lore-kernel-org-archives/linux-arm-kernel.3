Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAE0CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbSd/ESNIR+81iacIbnfQdvC7ljtd4pmEmTksUKikaQ=; b=d46v7EBo5Bbr+pQT7has4IO5fn
	h9GNJadECMuPykRtA5EQdKbts9HRp6/NPdtD2jEzG1KaD4mFHQYHr+e2L37ZfLNq4QHhGlWig5N65
	zEdU3aHl1SIEy+hAmBMF/99F/WiWn17xZ7b3tWxTPKP+PmLxbqirHiwwNwQfwoCgXFtsWPaXN4yxF
	DurK/Qal8iU7jbb2d7s3n+FbwXaK9ftVjR7IyCXCy9/NFeIZnO7MnWWrAvwhjxRdtfxyxN+nr5fN8
	Ca0iXYWh+PviV1R+u7cbBDLpI7XH1N9EhhuHOFYxkWVNFijW5TVjar5j9of/md11kaK8jG+do+Ilf
	391wyp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8w7k-00000000mxI-2CeF;
	Wed, 15 Oct 2025 07:40:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8w7i-00000000mws-0JTh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 822A262973;
	Wed, 15 Oct 2025 07:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8505C4CEF9;
	Wed, 15 Oct 2025 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760514037;
	bh=aezqpQtdc2IZVeJjr14RhvvsN/PyWhP34fokKeuwJ1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jhp0dbfdB9IfysKdHQfz5NWlOzPWwmQ31A4BFqUFwFEbgY1eP0BBN14FnFDk9XzXx
	 nWFkCjbnGV5+64K9IzHbL59dmPD9vHWDT4V4schr0SYd8WuodbFoMyBUONgfvuAOpm
	 6Z9xN1pYdvTtWmbqirbLzbvwQZVcZzO7n+8NQNzG6RfqAwYlrDnpX3s7w2cox7NgSb
	 Uw86vUseBdw0jPzVaWjSlBZ8nHhX/CzRJBmd2GMIS2VV/r4rMT7z7cdLQbQOEBACZ2
	 sNAVxx2WLUczpUvj1aQxw8/vQmnUtA1fHsV0daueMemmscUJen2SQ0v/Rv8XtQ7Snf
	 b2TcwOJLkfdwQ==
Date: Wed, 15 Oct 2025 09:40:30 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, Scott Branden <sbranden@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 3/4] PCI: iproc: Implement MSI controller node
 detection with of_msi_xlate()
Message-ID: <aO9P7rRW0o9UmFz1@lpieralisi>
References: <20251014095845.1310624-1-lpieralisi@kernel.org>
 <20251014095845.1310624-4-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014095845.1310624-4-lpieralisi@kernel.org>
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

On Tue, Oct 14, 2025 at 11:58:44AM +0200, Lorenzo Pieralisi wrote:
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
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> ---
>  drivers/pci/controller/pcie-iproc.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)

Heads-up (I will have to respin anyway), of_msi_xlate() needs to be
exported for this to work when compiled as a module, kbuild-bot barfed
at it, I have fixed it already - if anyone can help me test it anyway
that would be great.

Thanks,
Lorenzo

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

