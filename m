Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEDFC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hpJMj7KMKQRohuWdO05V/+SWQB59JwF6l8GNpxeKfnM=; b=D3BjQlmIIaJf6u
	17Fd2W3Mfrd6/nCbjbdPtUoazuqscax2zmj08wlXRdZg7laii/Zra6B/J9E3TMrkRL2pC+I1mKlGM
	zqyxMLyrAs0FbuRzKE2aJSulJM8eEurNnzSyhKy6+GvSmIILWw0VF6h5r96cX0R0o9tvIafLXWWoj
	mNU3Q+ci/QXxetYkYNiCuPXDU9nCiVFjx9I9zhnjMe0tpdTix8RnEnwNCAGlfNWkONo4BM7LjZM8v
	TMCBciiN3ekzM5jQzzh86LA/sf4AV2PubDU7u4Lrhs0b/YggbFEit+eed+C8RkdpKHj0zluWQzXn9
	sgTdB5KlVxcp+t46Uy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5ns-000000070aS-0vLO;
	Thu, 06 Feb 2025 17:36:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5kM-00000007069-0mhA;
	Thu, 06 Feb 2025 17:33:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4CAE5C670A;
	Thu,  6 Feb 2025 17:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7D5C4CEDD;
	Thu,  6 Feb 2025 17:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863181;
	bh=z9GAocz8DODcIKXLrUrORxsX+oxn+vboEuxbPCGncwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gadxXX3KKjq1UP9zGVooJUv+QtyRdjAnVrI+e8Hmt27c5V9C/3OyhHzCqJJT7wlOJ
	 EgYtKtB3f+E2yIjm2IU+PCK6rjcWAuVM/xR2lPi8VQl2KeM21iNyT/NqMhjwKXbMue
	 RHKK4jIYqPnaNXeZEqKDodl6gni/UrHr7u4ZRZ4qegwAekIg5L8uFcpKjrqyAlXJR8
	 Qff8lr4peg3OXr1iva9Md8JzQ9L3ZjS0FeXQRwNceygZgRnETbKwAhVxzlp1pm873D
	 i3Bzvaqcq2UXIBLHQp/vhVjcDmABGp+5LL/RBnPMBIvq9P7rTLpzQ2OENUykdrWacx
	 HZyoLuELrGxHQ==
Date: Thu, 6 Feb 2025 11:32:59 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/6] PCI: brcmstb: Fix potential premature regluator
 disabling
Message-ID: <20250206173259.GA991437@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205191213.29202-4-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_093302_272258_622C8692 
X-CRM114-Status: GOOD (  20.54  )
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

In subject,

s/regluator/regulator/

On Wed, Feb 05, 2025 at 02:12:03PM -0500, Jim Quinlan wrote:
> Our system for enabling and disabling regulators is designed to work
> only on the port driver below the root complex.  The conditions to
> discriminate for this case should be the same when we are adding or
> removing the bus.  Without this change the regulators may be disabled
> prematurely when a bus further down the tree is removed.

What did the user do to cause the bus to be removed?  I'm wondering if
we turn off the power while the link is still up.  If we do, how does
it get turned back on?  Does that require a manual rescan, and the
scan of the child bus gets the power turned back on?

> Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index bf919467cbcd..4f5d751cbdd7 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1441,7 +1441,7 @@ static void brcm_pcie_remove_bus(struct pci_bus *bus)
>  	struct subdev_regulators *sr = pcie->sr;
>  	struct device *dev = &bus->dev;
>  
> -	if (!sr)
> +	if (!sr || !bus->parent || !pci_is_root_bus(bus->parent))
>  		return;
>  
>  	if (regulator_bulk_disable(sr->num_supplies, sr->supplies))
> -- 
> 2.43.0
> 

