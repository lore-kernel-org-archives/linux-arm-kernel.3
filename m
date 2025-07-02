Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9BDC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVv4IAazawmO/JvuBZNdt1HHYuW3kMLqoIeF8lsxUkk=; b=XgaEU43mjdnNjOPgY9DN+41ayD
	zkkYsj+USFab+HrTClBV60z7DYvSFd2iQrV/28HQfqDwwY8qvfWK6D3OLqnSrghUfMmRgYvA0BsuR
	TauTH9prt0LuTBHKEvTZj7pU4t/oKCunehUIDVfUwRhhYwSclYgxqx8DC4+J1kxnQ+LYQprvJTQNt
	HVp24YR1Wr6Efl0iIjc/LybVqMuNoN5TWHlM3tHzxIt92kn+NKMLHPT2ODc8Q/RAir80Lw64iUT1M
	QQNvHBrUQPDeehVtUcieIuURJ/DYOcL3/HrmQkOouE+/br28AAd3j8MS0x8MudQ9g1cvs0c/Xy+Lt
	IvZJQdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwQT-00000008HgT-248W;
	Wed, 02 Jul 2025 12:18:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvfm-000000088fx-2WFA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 11:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 931066141F;
	Wed,  2 Jul 2025 11:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658DAC4CEED;
	Wed,  2 Jul 2025 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751455841;
	bh=jS6HsOJudSh3pJt2UZUlf0WLtRDJKg8n2+rVm/g7mQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edqp5nXGm3PK7QHRdw05jl6Dn/i98BFF9vLc5Nd2+sm0ltDQzNlDH6290VOTuy1dE
	 7bWOZnjX7twJklwOY3t4+bsKt66v+Csx2Wod+W3w2WzZlYKUHIWkPFfvz3CUy7VtW8
	 uEnMQSSOBAA/Jh262IihH+jk098VNyleLL/TaAr766MQFATIXVWZKFclJc6tMer8/8
	 fvAFflUU/2b3tWzZ47xsAG/dXBgRk+MeurjCsIaompbAzZVmjooJn4OQDJkIa0nk0o
	 F3Mx6RQ0NGbZajeuFwitVmu/bfkWtkkeRQSWj7H/9PKvKxblCRBLj0s7ltbyKE9EZ/
	 6vEa4TE6c+uDg==
Date: Wed, 2 Jul 2025 17:00:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 03/10] PCI: endpoint: pci-ep-msi: Add MSI
 address/data pair mutable check
Message-ID: <5axgxbtyqbwwncimjiiedvkm3ap7at553vgj72bht4kynke5cd@xfghwfmp6cy7>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-3-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-3-77362eaa48fa@nxp.com>
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

On Mon, Jun 09, 2025 at 12:34:15PM GMT, Frank Li wrote:
> Some MSI controller change address/data pair when irq_set_affinity().
> Current PCI endpoint can't support this type MSI controller. Call
> irq_domain_is_msi_immutable() check if address/data pair immutable.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v18
> - update commit message. remove 'include/linux/msi.h' part.
> 
> change from v14 to v17
> - none
> 
> change from  v13 to v14
> - bring v10 back
> 
> Change from v9 to v10
> - new patch
> ---
>  drivers/pci/endpoint/pci-ep-msi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
> index 549b55b864d0e..c0e2d806ee658 100644
> --- a/drivers/pci/endpoint/pci-ep-msi.c
> +++ b/drivers/pci/endpoint/pci-ep-msi.c
> @@ -44,6 +44,14 @@ int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 num_db)
>  
>  	dev_set_msi_domain(dev, dom);
>  
> +	if (!irq_domain_is_msi_parent(dom))
> +		return -EINVAL;

This check is not justified in commit message.

> +
> +	if (!irq_domain_is_msi_immutable(dom)) {
> +		dev_err(dev, "Can't support mutable address/data pair MSI controller\n");
> +		return -EINVAL;

GICv3 ITS is an immutable MSI controller. From the earlier patches, I could see
that you have tested this series with ITS. How did that happen if it errors out
here?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

