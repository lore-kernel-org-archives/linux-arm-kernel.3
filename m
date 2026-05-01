Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8300BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 22:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=V9PBUeKWPVN2+qLw1PCFUbeTvA3zcd7i7ZQTpnR+m90=; b=VlYNRgDYriKDqQ
	qeXH/7pfS6QnHFxKJryoHoJRFe2N/OMMAV8xQPyrv+NFRvkiNMjHAMUZ6zUdCj9zzoRUh1WwjV4xK
	Q+8n/YHnvT1oluUUpJVDthJ2uA6Bb5HJRLK/6acK6JnAPefrTTAFg3AcHoqg1jnatuL7OQRJlIIKI
	I8iMg9H51zBgEzSZcW3JSpLaG7w9AnMl7kbVet3LWDjMl7oHkNy/Op5JjHZEbop4smJCjaWsV6ESg
	jwHAPjMHwu/m2x65lzU+8LGgbWW6icbrCFfO41nAqoHVFeqPtZpqCfrsEpcWFxaj7mdyfaK36P5dX
	mZZ/POlhzz5ox2oyf9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvxs-00000007jhD-1OLr;
	Fri, 01 May 2026 22:04:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvxq-00000007jh1-2ibW;
	Fri, 01 May 2026 22:04:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5832F6011F;
	Fri,  1 May 2026 22:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BC8C2BCB4;
	Fri,  1 May 2026 22:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777673041;
	bh=HKVDY3YeNH8AZP6qEwAmEqYoxJ5WPVlsvJuzoKf9Vk0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NCGJRs/cGzIKN9rsmSBDs5PTJvhYXE+WvOWqUlR0bsfZSjtxPYIfYfT62C8ZHNWYq
	 ClSRidEbvJjyXtUehEm70BKzW/Bt1I4X3L877ewRPNrT0I/nI5NJ+/lQ/U8AEM+t2L
	 Xsf7mHGvQIOFBfJCuN6JrmWi70PUs9eL1O3y58ZxBpT84+BckUcjQcSYin9fkseApi
	 qObiWeXe9yLhxklJROn+Swl7u30/xNtszmgNiWn/gjYJYVvlVj3B4JXXzuwvZ5vSpi
	 DHND5usVcsaa67o0/RYNdejkiYwC9rIfXlpOyOuhqrts0iRerRAslhxpH5S4ZwWA40
	 CsIM1jxQ4r/9A==
Date: Fri, 1 May 2026 17:03:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pci@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Hans Zhang <18255117159@163.com>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: brcmstb: Assign pcie->gen from pcie_get_link_speed()
Message-ID: <20260501220359.GA522578@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501202438.376033-1-florian.fainelli@broadcom.com>
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

On Fri, May 01, 2026 at 01:24:38PM -0700, Florian Fainelli wrote:
> After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
> pcie->gen stopped being assigned and as a result the established PCIe
> link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
> to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
> 
> Link: https://github.com/raspberrypi/linux/issues/7343
> Reported-by: Dom Cobley <popcornmix@gmail.com>
> Reported-by: Phil Elwell <phil@raspberrypi.com>
> Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to pci/for-linus for v7.1, thanks, and sorry for the breakage.

> ---
>  drivers/pci/controller/pcie-brcmstb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 714bcab97b60..6138fc4bc064 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -2072,8 +2072,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>  		return PTR_ERR(pcie->clk);
>  
>  	ret = of_pci_get_max_link_speed(np);
> -	if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
> -		pcie->gen = 0;
> +	pcie->gen = pcie_get_link_speed(ret);
>  
>  	pcie->ssc = of_property_read_bool(np, "brcm,enable-ssc");
>  
> -- 
> 2.43.0
> 

