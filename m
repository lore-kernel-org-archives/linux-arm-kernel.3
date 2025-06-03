Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B0DC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7Vy5C1bnIY0jQ7WAUn4sgA2ezEd8u19uJp5VissAjM=; b=NtuEf9bSBFZhFmsF6sRZQrLrvL
	FXi/DE2kM2pWle492gEDqLqVziAFTMZNpFXgJDk1N/PGrR7fk0r9wEFdf/rU43+tOUVWIIZXqZms1
	uvadJuYiDzXSEwbeHD+sdr9fLIEq4UKZHasNwbeIUc7+AYs9eSLXipwEz/nTv1KVgZGxOG1WCjmt4
	dFdJNISqULbd/VYHNskebzaFlJahHuf4DEZvZlaucddCBNlgdJKMx7NlHQrfn2JjU5128mWwtWz2j
	LOJmBJiHoKqMQOK5bThRtFW7hUJLjv7toM7uWOCkxCEqTOexE9o7mdeJhYKSfW/GybLgsyvZSS6HO
	l/VhwqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRm2-0000000B2v7-31ND;
	Tue, 03 Jun 2025 13:33:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRiO-0000000B2NN-0p3N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C169F5C57BB;
	Tue,  3 Jun 2025 13:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0795C4CEED;
	Tue,  3 Jun 2025 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748957403;
	bh=SqETY9ANTPbdK3VFt37imgf1Txorsar+chC5aa3Cp0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1VzN47+SCfNpJNJCugePfyugbmrcTXkDh+X/O1lCNcpPA0+A7QyVYrO9TFGii7K0
	 ba8j8G9hShux9EHPwz9xhjx2G/qXp+mGGiTcGH962uW++Ors+MQU1fjDZBteyF39Q9
	 2OSN/Ibgu7YfsFQyuWPKKvl29aVceqReWpNaBBsYV9PI9GMf8PpIwVM+9BK2uP2sif
	 JMr+onb9T0O0zB9RQyVpuJWJPoa2V0oLuJgV0T9UYS6wI6qpl7qhskF2x1c5U9AFp3
	 M8RLM3wOGavIrZbSvhhr+Y/4mnPBe56NXQ6pMwqDo0vF6xwDfLC9ixv9kMMQzQrAz2
	 ru67xXhnpJAZw==
Date: Tue, 3 Jun 2025 15:29:58 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
Message-ID: <aD741hI7MfTmi7Rl@lpieralisi>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
 <87ldq9dm54.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldq9dm54.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063004_323453_27F2F025 
X-CRM114-Status: GOOD (  24.77  )
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

On Tue, Jun 03, 2025 at 01:50:47PM +0100, Marc Zyngier wrote:
> Hi Zenghui,
> 
> On Tue, 03 Jun 2025 09:22:47 +0100,
> Zenghui Yu <yuzenghui@huawei.com> wrote:
> > 
> > > +	domain->dev = dev;
> > > +	dev->msi.data->__domains[domid].domain = domain;
> > > +
> > > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> > 
> > Does it work for MSI? hwsize is 1 in the MSI case, without taking
> > pci_msi_vec_count() into account.
> >
> > bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> > {
> > 	[...]
> > 
> > 	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> 
> Well spotted.
> 
> This looks like a PCI bug ignoring Multi-MSI. Can you give the
> following a go and let people know whether that fixes your issue?
> 
> Thanks,
> 
> 	M.
> 
> diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> index d7ba8795d60f..89677a21d525 100644
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -287,7 +287,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
>   *	- The device is removed
>   *	- MSI is disabled and a MSI-X domain is created
>   */
> -bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> +bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize)
>  {
>  	if (WARN_ON_ONCE(pdev->msix_enabled))
>  		return false;
> @@ -297,7 +297,7 @@ bool pci_setup_msi_device_domain(struct pci_dev *pdev)
>  	if (pci_match_device_domain(pdev, DOMAIN_BUS_PCI_DEVICE_MSIX))
>  		msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
>  
> -	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> +	return pci_create_device_domain(pdev, &pci_msi_template, hwsize);
>  }
>  
>  /**
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 8b8848788618..81891701840a 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -449,7 +449,7 @@ int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
>  	if (rc)
>  		return rc;
>  
> -	if (!pci_setup_msi_device_domain(dev))
> +	if (!pci_setup_msi_device_domain(dev, nvec))

If pci_msi_vec_count(dev) > maxvec we would cap nvec and size the
domain with the capped value.

In __pci_enable_msix_range() we are sizing the device according to
pci_msix_vec_count(dev) regardless of maxvec, if I read the code correctly.

While fixing it it would be good to make them consistent unless there is
a reason why they should not.

Lorenzo

>  		return -ENODEV;
>  
>  	for (;;) {
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index ee53cf079f4e..3ab898af88a7 100644
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
> 
> -- 
> Jazz isn't dead. It just smells funny.

