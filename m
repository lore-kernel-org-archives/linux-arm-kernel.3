Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D163C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bjcBLE5FwWnmFMxMa7wnup4jUCwAEdoBvq9Y98Ehea0=; b=Q5d5PN13GvVmiI
	M9BJirA2YmCX2vT4nlWRfXp3HvWc8qZ9HFPvGDVzEuf66c98NAlxvd4FxPKx17kdnusUoDjxn1k6Q
	sYCxuVRSaWVtK8rP5B5zgTZmqQ/TGq/YP5PR6RUwm8bnF52hpkHTPwa9/t1uVUwWvMIQibOR1NMWI
	4MR5zgCg0i8gTYgxLD0/TUIp0mxMYfwiQ1Jxtgfe7wTRX9tnqLtOHUuF/Ob3sKh3OeznrMlwaR9BJ
	D6yzRJF974dT6U8B1FzbFsk7Znh/qK3sgqIZylG3u/fzhsXtVw8Ucfc8GYu/nRBpTm/z3asz4hCOn
	7ZDH6/BrtpvnECb+nZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAkK-00000001xq5-0ooZ;
	Mon, 03 Mar 2025 18:42:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAi6-00000001xWV-3Mss;
	Mon, 03 Mar 2025 18:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 847A7A44EC4;
	Mon,  3 Mar 2025 18:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11B1C4CED6;
	Mon,  3 Mar 2025 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741027213;
	bh=LMcjnXUMRisPi6cns32MGe0Eh+x3GI+oq769ibqyYQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mOE/feWOMI5QBDfGntKwEW2sMwYsBWmxRIxRC0pbaEIRGHtz3KkUOSjnvqNUPrSB/
	 EdR894U/HftKtEilBcmM+5dxQqBeGiQRHwSaw1sVNyHCYcreVvS8fsGQ97Vtip9AnN
	 Zm17RQWrm/c4SgwAeRdkwIgWbibmJnaZP1ksgdeSUX1L/fM4MDRSF+effKh8tZTjOd
	 W2OEYlldiejka6KB+t7hJsNOMYANUYWwEUowhZEe5sSBf3mYNt3GAl+NpoJQSrcRD2
	 ibsl02/0xTC0YhdB6ZMU278KAl2kMikfDRHcZgBtsweuUzJn1jZu7McpJvYmanl4zO
	 ofod9s4njvGfw==
Date: Mon, 3 Mar 2025 12:40:11 -0600
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
Subject: Re: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of
 regulator_bulk_get()
Message-ID: <20250303184011.GA172021@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214173944.47506-5-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_104014_915877_91F908DA 
X-CRM114-Status: GOOD (  19.12  )
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

On Fri, Feb 14, 2025 at 12:39:32PM -0500, Jim Quinlan wrote:
> If regulator_bulk_get() returns an error, no regulators are created and we
> need to set their number to zero.  If we do not do this and the PCIe
> link-up fails, regulator_bulk_free() will be invoked and effect a panic.
> 
> Also print out the error value, as we cannot return an error upwards as
> Linux will WARN on an error from add_bus().
> 
> Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index e0b20f58c604..56b49d3cae19 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
>  
>  		ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
>  		if (ret) {
> -			dev_info(dev, "No regulators for downstream device\n");
> +			dev_info(dev, "Did not get regulators; err=%d\n", ret);
> +			pcie->sr = NULL;

Is alloc_subdev_regulators() buying us something useful?  It seems
like it would be simpler to have:

  struct brcm_pcie {
    ...
    struct regulator_bulk_data supplies[3];
    ...
  };

I think that's what most callers of devm_regulator_bulk_get() do.

>  			goto no_regulators;
>  		}
>  
> -- 
> 2.43.0
> 

