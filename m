Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1F9CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ozKbv+1B+0Drvdacp9shbqLyVNbtHTIlBt8pG/nv+3A=; b=Im+llM30kJSZjR
	1s3yabfkpbk+Ccpn/jJ+SaNeqEO/ffOfKCQj6dYnFdu1ugyPNBpQW6Df9vvgotvMQus8MfN3Jy8I0
	LQ9UqPZEgmc46/45ad1/yo+OJyXSDHlXt80ka5fcVvuRJY1s3mqnsRSBlSivr5PsPsMLpsTb/YgmN
	4AxbC/V3QIZ6XEjW6d3YaJNPX+e7dGY/VshHfgXRaszZrwJP79SBqTOp6nXAq3kuFUq+iw/CGjxEF
	8kGEbwhmO4xu+YBI1KPOj17nT6r8ililU/LSIVqOrNLdZG7UAftYRHA21NnR+jJ4hT+Hw1yyRrN0k
	DPwLl688mbo0i4ws+aLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ8hq-00000008vLn-3RHo;
	Sat, 02 May 2026 11:40:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ8hp-00000008vLe-3x8B;
	Sat, 02 May 2026 11:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 241DE6012A;
	Sat,  2 May 2026 11:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE86C19425;
	Sat,  2 May 2026 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777722020;
	bh=Ba1wqX2SN8Flrod7t3UMQ92yqgaLJRZILMs4KGu8JaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UvN+ekgwd8BBWJbXT5QkMKUdTwzEYPmQV8Tt0MSw65R2LjEfKccGzIwXqIU6oPC8Z
	 m6W5N1A3NE2WurVH3eQOX3EnBf33MxsYsE/X6erNCChhShy3oX5rAmA9ewQvl5a7TI
	 DfiaUl87B+rIOvviedQ0uG4n17Lc3/DXrqdD5SZPrBNSwqb4r2qX5W2mhsoZ0a1EEr
	 2ABXYDWxmLLZUhuWxo33Bb7bIJGAZnl2Xet65XNqcNUokSWw6ey/f9y2UOj5y/w1OC
	 Eca1fVzlOAG0AnMMxBs862CJOQ2Gg20OOVnPQXU9U5gO95VSylI25bJzyJ7eAdozs9
	 BO6KYoiyee5qw==
Date: Sat, 2 May 2026 06:40:19 -0500
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
Message-ID: <20260502114019.GA551304@bhelgaas>
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

Take a look at https://sashiko.dev/#/patchset/20260501202438.376033-1-florian.fainelli%40broadcom.com

The notes at https://github.com/raspberrypi/linux/issues/7343 assumed
PCI_SPEED_UNKNOWN was 0, but in fact it is 0xff, which means you might
want the more defensive patch instead.

I'll be happy to replace what's on pci/for-linus if so.

>  	pcie->ssc = of_property_read_bool(np, "brcm,enable-ssc");
>  
> -- 
> 2.43.0
> 

