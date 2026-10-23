Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FD606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXbIOyye;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOm50d/S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NNM5yQ01YePyoWldFqWq1JW4Jzta8vvLgFBnOX/HqDU=; b=LXbIOyyesHsxTQdNWnRgyHSRxh
	uto0hloOishvUBZx0HLsCACCUEFAhWP/8WMKW0ym759Z7+T8ymafSZDdUo3qC7IjCOQPQoH986H4D
	QBBa3tNN0Y+FWiFyx7PKVtuVEBallye7swCc3vyhdolf+cB02TN51C2vZMpwj1/vXrcEmeFUnegP/
	bBrgJLxGhFxdAtkPda2EQzehKOmuq7kr1YSQ9YRotINfp6jXHkQhARnEwWQYvncsijwX096TM5CLp
	DNKKTplIjT6ligU8guTRM6DVwVyxI3BapYc63vXGb04HIOcUyFG9Bch6zbIyz+hfhvI33AaPsujO2
	SUjFa9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKDw-0000000GnPp-3XAe;
	Fri, 23 Oct 2026 18:42:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKDu-0000000GnOB-3dOJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:42:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B862543B6D;
	Fri, 23 Oct 2026 18:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDD41F01825;
	Fri, 23 Oct 2026 18:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792780956;
	bh=NNM5yQ01YePyoWldFqWq1JW4Jzta8vvLgFBnOX/HqDU=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=QOm50d/SekKZDk9PZzzdmMiGdo9+EvMc1kTKhKGCpVimfDSJqEY36jZdKP7id95/U
	 jScPyyUqy/i3WUy2mMzcp4Cs0wRL4Px/qmnP8M5HeRjYAe6/J9105zSLiX366sNvK1
	 wSOLNqN87VANC5ZQPzL3JNPB6S6JSE7wQAurc41tc1bD9IGvXkCcxcHqN4NjKjRPtb
	 i7L+H/9mrrBVKyqrYqAd69xyKBev591tphdWoQ+LDvnL+g10dhLRLLONLxNzWFUkr6
	 ZwQjLLPQk+aTNVkNJiMwm282NxbUJeMDCmXlEfYNxxmnx3yrM4FDQHFLa1hBRg9WNw
	 G93UmNmqn6/Eg==
Date: Fri, 23 Oct 2026 13:42:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 07/16] genirq/msi: Cache MSI message in
 irq_chip_write_msi_msg()
Message-ID: <20261023184235.GA2800344@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929034510.2023173-8-praan@google.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 03:45:01AM +0000, Pranjal Shrivastava wrote:
> Currently, PCI MSI caches the composed MSI message into the MSI
> descriptor inside __pci_write_msi_msg(), whereas platform MSI and other
> device MSI domains do not cache the message in the core, forcing
> individual drivers to manually copy the message into desc->msg if they
> need to restore it across power transitions.
> 
> Cache desc->msg in irq_chip_write_msi_msg() before invoking the chip
> callback so all hierarchical MSI domains automatically record the
> latest message. Document why the redundant assignment in
> __pci_write_msi_msg() must remain for direct callers outside the
> irq_chip hierarchy.
> 
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>

With the fix testing Thomas proposed:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/msi.c | 6 ++++++
>  kernel/irq/msi.c      | 9 +++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 80a9db417dc8..f7bedc31d486 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -257,6 +257,12 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
>  		pci_write_msg_msi(dev, entry, msg);
>  	}
>  
> +	/*
> +	 * Although irq_chip_write_msi_msg() already caches the message,
> +	 * keep the assignment here for callers that invoke
> +	 * __pci_write_msi_msg() or pci_write_msi_msg() directly outside
> +	 * the irq_chip hierarchy.
> +	 */
>  	entry->msg = *msg;
>  
>  	if (entry->write_msi_msg)
> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> index fb5f372215bf..df460a574d80 100644
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -634,6 +634,15 @@ static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid
>  static inline void irq_chip_write_msi_msg(struct irq_data *data,
>  					  struct msi_msg *msg)
>  {
> +	struct msi_desc *desc = irq_data_get_msi_desc(data);
> +
> +	/*
> +	 * PCI Multi-MSI shares a single descriptor across all vectors and
> +	 * the device stores only the base message. Cache the message of the
> +	 * first interrupt only, so that sub-vectors cannot overwrite it.
> +	 */
> +	if (desc->irq == data->irq)
> +		desc->msg = *msg;
>  	data->chip->irq_write_msi_msg(data, msg);
>  }
>  
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

