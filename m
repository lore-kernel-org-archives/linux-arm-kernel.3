Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CB8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6df5g93jndy+Z/1SCw4lW9zw+FLEwYaFqskZYcgfBOM=; b=yL99Iu13pBzkgbiIEqSniEHztt
	tqxydphnjYTCD8EHuYfZf0NYYXIDzUPyfy2+tBIowcDnxxIgKUnFY4QnPIk+UbhksQcsKhDaQi+gV
	E52rcGyoxf2yaiwJinolwgwmnRlq+9HM93h485a92jSD3uvakFDNNOpR3rZ11IogxIy1gxnA/T7pY
	5uf+lux+XMFoU2RwnIen4wVISO7HhqKrCS0/QOoTm16EOHIfHPSXZk87UlCLJx5YCqH5XrUt+Tfw5
	YNsBsCmuan+J1qc8b2s3Ljv4S2I+hD1qK62KI0b8Q7mSoNat0Fn/6u9Cni1gpjbpfDW7eo99g/mTA
	FRUeRw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTnW-0000000BJUY-1ngG;
	Tue, 03 Jun 2025 15:43:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSZK-0000000B9uz-2jce
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 14:24:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECDEB49BC6;
	Tue,  3 Jun 2025 14:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F937C4CEED;
	Tue,  3 Jun 2025 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748960685;
	bh=8P8VpDyERLX0d7YNci0mUwMHPwaKMA33bffoWYiDOoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcZZUlY4T6EfydwCQ090MG6vqI7M4UU9SIKhGZRzBEnWbgz/cP1Uy/djS+adVoJNQ
	 NwWME4e3vLT/EELNQnDkSgIN0y1aNf4ZGKWCDPo5D/xAPt+q4hyNS6UnuXOlGufVCl
	 aSfrdoWeAuHab//2ghDX/LhcrAp3UOwKdAf3lstikV4Pwg0tWWdtTEHK0Wlkc2A2J9
	 0E8lWXJQ7ZH959nry1KBohTeWMB1TgLyBaAE0YS174Cyqn+Qc2mHz4wROWHJwkjj/F
	 IroNYxEkovS4Ok4uCF7bLQH9LS2TKBRRB9hAYYB6BvLia1enGpH7axLzxTsG99QxfF
	 VSXmpo7Rrykwg==
Date: Tue, 3 Jun 2025 16:24:40 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] PCI/MSI: Size device MSI domain with the maximum number
 of vectors
Message-ID: <aD8FqJvZWaZR7J9m@lpieralisi>
References: <20250603141801.915305-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603141801.915305-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_072446_732044_A975C67B 
X-CRM114-Status: GOOD (  24.60  )
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

On Tue, Jun 03, 2025 at 03:18:01PM +0100, Marc Zyngier wrote:
> Zenghui reports that since 1396e89e09f0 ("genirq/msi: Move prepare()
> call to per-device allocation"), his Multi-MSI capable device isn't
> working anymore.
> 
> This is a consequence of 15c72f824b32 ("PCI/MSI: Add support for
> per device MSI[X] domains"), which always creates a MSI domain of
> size 1, even in the presence of Multi-MSI.
> 
> While this was somehow working until then, moving the .prepare()
> call ends up sizing the ITS table with a tiny value for this device,
> and making the endpoint driver unhappy.
> 
> Instead, always create the domain (and call the .prepare() helper)
> with the maximum expected size.
> 
> Fixes: 1396e89e09f0 ("genirq/msi: Move prepare() call to per-device allocation")
> Fixes: 15c72f824b32 ("PCI/MSI: Add support for per device MSI[X] domains")
> Link: https://lore.kernel.org/r/0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Tested-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pci/msi/irqdomain.c | 5 +++--
>  drivers/pci/msi/msi.c       | 8 ++++----
>  drivers/pci/msi/msi.h       | 2 +-
>  3 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> index d7ba8795d60f..c05152733993 100644
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -271,6 +271,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
>  /**
>   * pci_setup_msi_device_domain - Setup a device MSI interrupt domain
>   * @pdev:	The PCI device to create the domain on
> + * @hwsize:	The maximum number of MSI vectors
>   *
>   * Return:
>   *  True when:
> @@ -287,7 +288,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
>   *	- The device is removed
>   *	- MSI is disabled and a MSI-X domain is created
>   */
> -bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> +bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize)
>  {
>  	if (WARN_ON_ONCE(pdev->msix_enabled))
>  		return false;
> @@ -297,7 +298,7 @@ bool pci_setup_msi_device_domain(struct pci_dev *pdev)
>  	if (pci_match_device_domain(pdev, DOMAIN_BUS_PCI_DEVICE_MSIX))
>  		msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
>  
> -	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> +	return pci_create_device_domain(pdev, &pci_msi_template, hwsize);
>  }
>  
>  /**
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index d6ce04054702..6ede55a7c5e6 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -439,16 +439,16 @@ int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
>  	if (nvec < minvec)
>  		return -ENOSPC;
>  
> -	if (nvec > maxvec)
> -		nvec = maxvec;
> -
>  	rc = pci_setup_msi_context(dev);
>  	if (rc)
>  		return rc;
>  
> -	if (!pci_setup_msi_device_domain(dev))
> +	if (!pci_setup_msi_device_domain(dev, nvec))
>  		return -ENODEV;
>  
> +	if (nvec > maxvec)
> +		nvec = maxvec;
> +
>  	for (;;) {
>  		if (affd) {
>  			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index fc70b601e942..0b420b319f50 100644
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -107,7 +107,7 @@ enum support_mode {
>  };
>  
>  bool pci_msi_domain_supports(struct pci_dev *dev, unsigned int feature_mask, enum support_mode mode);
> -bool pci_setup_msi_device_domain(struct pci_dev *pdev);
> +bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize);
>  bool pci_setup_msix_device_domain(struct pci_dev *pdev, unsigned int hwsize);
>  
>  /* Legacy (!IRQDOMAIN) fallbacks */
> -- 
> 2.47.2
> 

