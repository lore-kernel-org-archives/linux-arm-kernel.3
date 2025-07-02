Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F11C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnLZ/2Xviz/6muxe5yHyS9lT/kjUwltIWfpVFviJg0s=; b=sY0vNk737obR2tM9CVYJ4hHJtX
	hkhQMXvsAKXB3+Z/7MW9NVpO8XIvqKbUUHtI9Rrnlic/Z4QNiQkwMDbtyAer79xLUaQOFGYEnAk6X
	Hti9o0KtDK1taJBcWsnDHQZ0KBZ3n9TJb7tt/giXMw9nIUIax++PEw8hSdhu6lfXt2JObLbwiUPqp
	Kxe2gqTyWuveSSbi/AdxPMG3v9pmrvq0N1as4zDumPEzSqMSfOBr8hxq9eNfyXGN44yZRVOGuVpEL
	l6iw/Yw20BrWR+AaE71Nren7eJBc2g/Y8qMxzkiPWm35mULFPKEs/hpK4djULAl4w2E+9Qa9/wxjV
	1I08T3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwCY-00000008EzU-0nBH;
	Wed, 02 Jul 2025 12:04:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvDB-000000083Hj-25TP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 11:01:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E51F961428;
	Wed,  2 Jul 2025 11:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A8DC4CEF2;
	Wed,  2 Jul 2025 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751454068;
	bh=RFTsJI5sebVc6rQB1mNjRTzyqHDuoXH7hmxEz6lfgXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bleWrWMzJUWkSA4hfhDbCHs3ljC7N8MVMNJn+qU8ltD4F4Wpp2E5i9GV2eJuqXXQf
	 o9XFhIx7lMVcxXWs6nXbPw/E1TysnvVB8PDw++JXHCkVYaHfh+wQddfkJklxomBiZH
	 hnEMzXIyRvcZanBEQa48sgVoVK5KbCHZBfKCdEuuDT+rVhadi9UICoZ/n7HUSDCOwE
	 9T2pVqNtRqh0XvAgXASjtARXZyQqiV5SO40R1yvfqsbQmI2Xxstz0AFylc3I4SbkLM
	 sc7GrtovYQ6IetTadN0jVGlORfoBXlv6qd8nkkeW86JpWdBPhWEdcIoa2OWSX999L8
	 a2otSMg4EnZXw==
Date: Wed, 2 Jul 2025 16:30:48 +0530
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
Subject: Re: [PATCH v19 01/10] PCI: endpoint: Set ID and of_node for function
 driver
Message-ID: <ne5yrjtdevmndqds4uwo2ppq6gay2wuwjouyf33lqr5g3nfkwr@lkwqlwqjqbmx>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-1-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-1-77362eaa48fa@nxp.com>
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

On Mon, Jun 09, 2025 at 12:34:13PM GMT, Frank Li wrote:
> Set device ID as 'vfunc_no << 3 | func_no' and use
> 'device_set_of_node_from_dev()' to set 'of_node' the same as the EPC parent
> device.
> 
> Currently, EPF 'of_node' is NULL, but many functions depend on 'of_node'
> settings, such as DMA, IOMMU, and MSI. At present, all DMA allocation
> functions use the EPC's device node, but they should use the EPF one.
> For multiple function drivers, IOMMU/MSI should be different for each
> function driver.
> 

We don't define OF node for any function, so device_set_of_node_from_dev() also
ends up reusing the EPC node. So how can you make use of it in multi EPF setup?
I don't understand.

> If multiple function devices share the same EPC device, there will be
> no isolation between them. Setting the ID and 'of_node' prepares for
> proper support.
> 

I don't know who you can provide *isolation* by reusing the EPC OF node. It is
same as using the EPC node directly.

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v14 to v16
> - none
> 
> change from v13 to v14
> new patch
> ---
>  drivers/pci/endpoint/pci-epf-core.c | 4 ++++
>  include/linux/pci-epf.h             | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
> index 577a9e490115c..95fb3d7c1d45e 100644
> --- a/drivers/pci/endpoint/pci-epf-core.c
> +++ b/drivers/pci/endpoint/pci-epf-core.c
> @@ -120,12 +120,16 @@ int pci_epf_bind(struct pci_epf *epf)
>  		epf_vf->sec_epc_func_no = epf->sec_epc_func_no;
>  		epf_vf->epc = epf->epc;
>  		epf_vf->sec_epc = epf->sec_epc;
> +		epf_vf->dev.id = PCI_EPF_DEVID(epf->func_no, vfunc_no);
> +		device_set_of_node_from_dev(&epf_vf->dev, epc->dev.parent);
>  		ret = epf_vf->driver->ops->bind(epf_vf);
>  		if (ret)
>  			goto ret;
>  		epf_vf->is_bound = true;
>  	}
>  
> +	epf->dev.id = PCI_EPF_DEVID(epf->func_no, 0);
> +	device_set_of_node_from_dev(&epf->dev, epc->dev.parent);
>  	ret = epf->driver->ops->bind(epf);
>  	if (ret)
>  		goto ret;
> diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
> index 749cee0bcf2cc..c0864935c6864 100644
> --- a/include/linux/pci-epf.h
> +++ b/include/linux/pci-epf.h
> @@ -216,6 +216,8 @@ static inline void *epf_get_drvdata(struct pci_epf *epf)
>  	return dev_get_drvdata(&epf->dev);
>  }
>  
> +#define PCI_EPF_DEVID(func_no, vfunc_no) ((vfunc_no) << 3 | (func_no))
> +
>  struct pci_epf *pci_epf_create(const char *name);
>  void pci_epf_destroy(struct pci_epf *epf);
>  int __pci_epf_register_driver(struct pci_epf_driver *driver,
> 
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

