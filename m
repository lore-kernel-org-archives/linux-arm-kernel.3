Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23338CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG6xl+zArKhOaKdO3w71nbx8p2GqDAZeXAH/EjoYemA=; b=SPCqi5IsQIlKohPOF+a5/BwISw
	i5GxL0HbBK04bpT2ZrI2aIgvWW2/+sLFfSY8isD88oVGtSslMTu8x68ea61baFmybLmaNYj5Xi6Er
	VVVAVWfsA8Y80RWQ4kYB10lbQ2n8Gga0GC55VEpday73UoMIOqduOZOEYGiGP6Nv5hhdYlhepZO4q
	o0/2wisqeYnckA4BTKeWcGyz+fX6bR3alqrlZcCFjzKd9Wm4GvkE80RS7cp/HLIN4bR/BSmJ0uNrx
	7kINPgcejIkbHrtqT4EdMALmZqt8eJkrwHnAtSntWZIXtSsfrp5tDLiygU5pYlDXA5CIKCKTjxYYY
	cvs+Do+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfjh-00000001bY0-0MyK;
	Wed, 06 May 2026 17:08:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfjf-00000001bXR-3M2e;
	Wed, 06 May 2026 17:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EED546015B;
	Wed,  6 May 2026 17:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C94C2BCB0;
	Wed,  6 May 2026 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778087314;
	bh=BMEOMKlCQHVzxUJsWvxH+VWNDNsnOa86BVNbOsfuUpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCgO/4lfvlhr58bNd1rnosxSp3cQL0RDHVEFc0noaCY0Dy4skeO1ZVlYjCHH6pq8D
	 mg23M7LCdrRdSNNVMglJimnDHXgVdN7f6qMRnKt+RD8wr+fbex8VusCrSOj+1PQcHe
	 /4lDBJdfVMZBwp+oAv0VlfZFb0RVb4AJS//pYejsSMGOoWVaj58yyhk/e761StBwGs
	 1OCycAJREI9arLs0pkiQSvV8leGcY2xw7170XL1l04kw7LtiQDnDyu/ZAw5QTpL1tn
	 B6qOmt9xFACoE3kzKWpodenJKQ/7ivA4waHngKu27qyV8O0mZAvFRsGTa0No/AzOG2
	 BN9nqp9qzfwyQ==
Date: Wed, 6 May 2026 22:38:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pci@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Hans Zhang <18255117159@163.com>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: brcmstb: Assign pcie->gen from
 of_pci_get_max_link_speed()
Message-ID: <t3u7r2ee6gdkjceula2ctvgditgxibwxcpaejc7ekbgdjog3br@c6n6ztzsbhpu>
References: <mid:20260501202438.376033-1-florian.fainelli@broadcom.com>
 <20260506164537.103196-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506164537.103196-1-florian.fainelli@broadcom.com>
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

On Wed, May 06, 2026 at 09:45:37AM -0700, Florian Fainelli wrote:
> After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
> pcie->gen stopped being assigned and as a result the established PCIe
> link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
> to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
> 
> Whether the 'max-link-speed' property is not specified, or it exceeds
> Gen3, resort to the HW defaults.
> 
> Link: https://github.com/raspberrypi/linux/issues/7343
> Reported-by: Dom Cobley <popcornmix@gmail.com>
> Reported-by: Phil Elwell <phil@raspberrypi.com>
> Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Since this is a 7.1 material:

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> Change-Id: Ic5431469dd7a6c8b391f84f27119dad876256880

This Change-Id is irrelevant to upstream.

- Mani

> ---
> Changes in v2:
> 
> - utilize of_pci_get_max_link_speed() directly
> - also validate against exceeding Gen3
> 
>  drivers/pci/controller/pcie-brcmstb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 714bcab97b60..08a0e7091ced 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -2072,8 +2072,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>  		return PTR_ERR(pcie->clk);
>  
>  	ret = of_pci_get_max_link_speed(np);
> -	if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
> +	if (ret < 0 || ret > 3)
>  		pcie->gen = 0;
> +	else
> +		pcie->gen = ret;
>  
>  	pcie->ssc = of_property_read_bool(np, "brcm,enable-ssc");
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

