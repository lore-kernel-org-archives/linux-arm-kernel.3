Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83582CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+IaSM9kT05pfBEWp0Id2Mry8ziv93Bwpy/RvFGwxDY=; b=dBYX62PZeP5uvR/sjGeHVScbpT
	nFdH1fQpK3joNcKBJVg5hf9fqBYg1Pc9ARf8T7JMQ0j2ZesbgwihXQBoGvq0zQ0r/PWUHaRcxiuXQ
	u9781vp74wAdZ8Zic4KfulkgyR8Lgf1un388Ftetk2+83mORalqgX5H0ZxnkT0nUjycPnkGNVv0ne
	lXjBCD8Gqswkl/BG48ZZnE3lnU4mZ5oIr/SMawJ+xoaGI45G+FUcj1Qh3EIB6sr7h2bOKTwdv+vu0
	o7R1Bj8nPwz2Tea/0hihu8Za/HkeBb3ENA26+942yZWBLmbCtzTmQ3m62x7yooT/aGaIoxO0Oujaz
	0TiELN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6tz-0000000GNg9-2CAC;
	Wed, 14 Oct 2026 21:52:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6tx-0000000GNfZ-4Atq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:52:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CFA543474;
	Wed, 14 Oct 2026 21:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888AC1F000C4;
	Wed, 14 Oct 2026 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014765;
	bh=D+IaSM9kT05pfBEWp0Id2Mry8ziv93Bwpy/RvFGwxDY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=luFKnl6nDaTRwLuUvwfPn1yXToQ2S1HPsjTzNUym0qJ8e7SyIg0KvlS7arhuRzpcy
	 4PkPpRlwf7D6QFnrWtwK5EzrYITdsqCmxWlo9Q+ebxhM8EnqkgnHWQw4ScGKloCiu7
	 Fgc4P0Hv9gWPN348FWMNlfdx0gXntEZPzXl3HL0DBLf8pZeLN5avrDd2gJawMMgvRR
	 gYTbwxoOiYBLLhDsEgnfcoerq+xFhZ3jE8lrgn956m+2dhQA/ghNl6VNgj/xMR43Sw
	 gyXbFe1TLs3xdr+rRcVimZDKubhrru8kRO9aXspUB+z7OGi8O/RCE+opLw9XqyhE8O
	 BxLIt38LXIC+A==
From: Thomas Gleixner <tglx@kernel.org>
To: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin
 Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa
 Saleh <smostafa@google.com>, Nicolin Chen <nicolinc@nvidia.com>, Daniel
 Mentz <danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, Radu Rendec <radu@rendec.net>, Bjorn
 Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, rafael@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, driver-core@lists.linux.dev, Pranjal Shrivastava
 <praan@google.com>, sashiko-bot@kernel.org
Subject: Re: [PATCH v11 07/16] genirq/msi: Cache MSI message in
 irq_chip_write_msi_msg()
In-Reply-To: <20260929034510.2023173-8-praan@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-8-praan@google.com>
Date: Wed, 14 Oct 2026 23:52:41 +0200
Message-ID: <875wz4eyqe.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Sep 29 2026 at 03:45, Pranjal Shrivastava wrote:
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

Sashiko reported correctly:

> [Severity: Critical]
> Does this code cause a NULL pointer dereference for domains without an
> msi_desc object?

So this needs to be:

	if (desc && desc->irq == data->irq)
		desc->msg = *msg;

Did not think about that, but that also means that this patch was not
tested on any recent (less than 10 years old) Intel x86 platform or a
x86 VM exposing HPET...

Thanks,

        tglx


