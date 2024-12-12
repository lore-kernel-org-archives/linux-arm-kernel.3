Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673A7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GdzRpFQ8GuqL6ob5XIWAJOYIU5mecbCSoXQsfevd8k=; b=T6AVlY9DxPFQTyZfr6ZMS3f/+b
	dfrPgU5o9EcELmnsRhYVBF+obz580d26cWNAlj9ntYeSLO5eNl2gtxpkuorQc5W6untd5PS/cw4bR
	PQGrn8Z+OiZhaK8WVPXXcfouOGJF3HQdG6g0Dlfo3poZQN5I78BI0pmgFri/HG2JzzaV29Q2s6MCv
	o7Z/qXKteJToHYoQ98WHHGFpB1l2WGj4pZbk+2xg1fdvX3kaIOFOYkWr18BFg7fAu54zl17pYg6/k
	nol03i5ZrGwEqS2aP0WS4ckjS4VsSNRxwz1oFQqJh67M9bQv1nJ3dDxWcu3Zq8wpbodz+Kx/EMdqM
	R59jij+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfnC-0000000HYLu-487f;
	Thu, 12 Dec 2024 09:47:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfjo-0000000HXm3-0zA1;
	Thu, 12 Dec 2024 09:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 062A6A426E4;
	Thu, 12 Dec 2024 09:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB5FC4CECE;
	Thu, 12 Dec 2024 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733996643;
	bh=xW8UtOL2UXi7yjUrl55suIta7E2vXsUZs6DEyaUeOyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mo06OTF2QLXnpk8pJD3fhIIcycZOR79JprHYTH7ei1OcIWL8la70QaOZRvQAZ/uhH
	 efcOtwXVSLO9VOCO9x5ULnaJ7DwHFcOCcEntyNLmi/Iu/7g/2jd306WupYjI6y0+wO
	 ktRnAY1Mo0dkvdrjOf8TxDnjC40rgrHbXgCdRdWzu5pBaFScQe29QKV8bx1Ht6p/yK
	 xxZh1p2A4AGpgYwjwDGLHT0h8f047G8xWECSF19NHyiopXQGbGG+oswKYGiOGFrtQa
	 jhgNM2mo7+yEnVhXyC1rOA7HWve1/N+sKlmUj7UuDqblpbSwgnId2nys15xpoUBgbB
	 oEBzoq5YD4Xnw==
Date: Thu, 12 Dec 2024 10:43:57 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rockchip-ep: Fix error code in
 rockchip_pcie_ep_init_ob_mem()
Message-ID: <Z1qwXYtO4pBswIXS@ryzen>
References: <Z014ylYz_xrrgI4W@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z014ylYz_xrrgI4W@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_014404_342410_BCB0E8DE 
X-CRM114-Status: GOOD (  15.52  )
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

On Mon, Dec 02, 2024 at 12:07:22PM +0300, Dan Carpenter wrote:
> Return -ENOMEM if pci_epc_mem_alloc_addr() fails.  Don't return success.
> 
> Fixes: 945648019466 ("PCI: rockchip-ep: Refactor rockchip_pcie_ep_probe() memory allocations")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
> v2: Update the git hash for the Fixes tag because the tree was rebased I guess.
> 
>  drivers/pci/controller/pcie-rockchip-ep.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
> index 1064b7b06cef..34162ca14093 100644
> --- a/drivers/pci/controller/pcie-rockchip-ep.c
> +++ b/drivers/pci/controller/pcie-rockchip-ep.c
> @@ -784,6 +784,7 @@ static int rockchip_pcie_ep_init_ob_mem(struct rockchip_pcie_ep *ep)
>  						  SZ_1M);
>  	if (!ep->irq_cpu_addr) {
>  		dev_err(dev, "failed to reserve memory space for MSI\n");
> +		err = -ENOMEM;
>  		goto err_epc_mem_exit;
>  	}
>  
> -- 
> 2.45.2
> 

Reviewed-by: Niklas Cassel <cassel@kernel.org>

