Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC27AC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OA3TAVZ4n+U4KF4ZOmO23lUr/UXhQOqopPmsBfjXcU=; b=tVvAIMprDMYh1F3It0aFkgkvfe
	+qxVyVG3WEunBe/NCg/45zKFh5fkMCRV31nuTU7XJj5v1pyORzauPYlVYytvhsLXGtaXv9nDBqDI7
	xRULVAgzTaFLvaxUryiUHqvUUp3JotpXBCZtNkUa2CwQm/yFYqngVEJ//rruHeWCEUgXIE8eaNPOS
	k6f9dvjEMIlaWVrkJnY4LUdZJfqnuWunhtLxbS0j5+GWA4xaq4m2/QM8SjEx4Kzy2XWA09aE+GrFV
	KVIC1qQIIeCZtluWZAMvvRMyT+lzwD5DMNRb14vpkZeLvzth1ua41EZQHyxK8fC6w8gopoDzP4tBP
	4JRAMT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwO9-00000008H8U-28Xn;
	Wed, 02 Jul 2025 12:16:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvZn-000000087uG-06X4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 11:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B62F6456B2;
	Wed,  2 Jul 2025 11:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A159BC4CEED;
	Wed,  2 Jul 2025 11:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751455470;
	bh=IA/2Aoc2ccg90iO9RV45Ow0muVhnCbhQUxodyLSBxrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpM27UamI+H5D2zrIla99YpfcAzFEhR1QAICOytH4cma9YVOs+qscYXwaANzm5ytL
	 d3/7JIebSp7ifjdS0FpuzJGkK36HLGj+2WgGtDPgl9ou+XndETxsyIOjum6DIXo1pi
	 zUx3WHDY0dEelfwlXhSDB/zbLo9DcEKG/Xh7nPawsDRsQf/2/7Yars1irCEJbjUA/3
	 ya+MUd6BagJdUFe8DrDdF+Xy/51i4ctMuDsm7ME8U3ixBbBqwrD+vTNormvDzzIsIT
	 9g7DZHONmjlh/BTFTap4qUsXpN6NL4LkIyJXAEYmUVZybmBRtPwCq0DqrLbJxgqKtM
	 YT7GWTyOJlsXg==
Date: Wed, 2 Jul 2025 16:54:12 +0530
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
Subject: Re: [PATCH v19 02/10] PCI: endpoint: Add RC-to-EP doorbell support
 using platform MSI controller
Message-ID: <bvwpyg4amnuuqimcqxhwrtejfng66c2jenti3t7dgeegcc73vc@o5c5isvg2s4c>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-2-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-2-77362eaa48fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_042431_106927_8E3B3645 
X-CRM114-Status: GOOD (  45.52  )
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

On Mon, Jun 09, 2025 at 12:34:14PM GMT, Frank Li wrote:
> Doorbell feature is implemented by mapping the EP's MSI interrupt
> controller message address to a dedicated BAR in the EPC core. It is the
> responsibility of the EPF driver to pass the actual message data to be
> written by the host to the doorbell BAR region through its own logic.
> 
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v15 to v16
> - fix rebase conflict
> 
> Change from v14 to v15
> - check CONFIG_GENERIC_MSI
> 
> Fix below build error
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502082204.6PRR3cfG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/pci/endpoint/pci-ep-msi.c: In function 'pci_epf_alloc_doorbell':
> >> drivers/pci/endpoint/pci-ep-msi.c:53:15: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs' [-Werror=implicit-function-declaration]
>       53 |         ret = platform_device_msi_init_and_alloc_irqs(&epf->dev, num_db, pci_epf_write_msi_msg);
> 
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502082242.pOq1hB1d-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/pci/endpoint/pci-ep-msi.c: In function 'pci_epf_alloc_doorbell':
> >> drivers/pci/endpoint/pci-ep-msi.c:49:14: error: implicit declaration of function 'irq_domain_is_msi_immutable'; did you mean 'irq_domain_is_msi_device'? [-Werror=implicit-function-declaration]
>       49 |         if (!irq_domain_is_msi_immutable(dom)) {
> 
> Change from v13 to v14
> - basic roll back to v9
> - use device:id as msi-map input, its will handle it
> - use existed platform_device_msi_init_and_alloc_irqs()
> - pass down epf->dev point, because epf->dev of-node will be the same as
> epc's parent.
> 
> Change from v12 to v13
> - Use DOMAIN_BUS_DEVICE_PCI_EP_MSI
> 
> Change from v10 to v12
> - none
> 
> Change from v9 to v10
> - Create msi domain for each function device.
> - Remove only function support limiation. My hardware only support one
> function, so not test more than one case.
> - use "msi-map" descript msi information
> 
>   msi-map = <func_no << 8  | vfunc_no, &its, start_stream_id,  size>;
> 
> Chagne from v8 to v9
> - sort header file
> - use pci_epc_get(dev_name(msi_desc_to_dev(desc)));
> - check epf number at pci_epf_alloc_doorbell
> - Add comments for miss msi-parent case
> 
> change from v5 to v8
> -none
> 
> Change from v4 to v5
> - Remove request_irq() in pci_epc_alloc_doorbell() and leave to EP function
> driver, so ep function driver can register differece call back function for
> difference doorbell events and set irq affinity to differece CPU core.
> - Improve error message when MSI allocate failure.
> 
> Change from v3 to v4
> - msi change to use msi_get_virq() avoid use msi_for_each_desc().
> - add new struct for pci_epf_doorbell_msg to msi msg,virq and irq name.
> - move mutex lock to epc function
> - initialize variable at declear place.
> - passdown epf to epc*() function to simplify code.
> ---
>  drivers/pci/endpoint/Makefile     |  1 +
>  drivers/pci/endpoint/pci-ep-msi.c | 82 +++++++++++++++++++++++++++++++++++++++
>  include/linux/pci-ep-msi.h        | 28 +++++++++++++
>  include/linux/pci-epf.h           | 16 ++++++++
>  4 files changed, 127 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/Makefile b/drivers/pci/endpoint/Makefile
> index 95b2fe47e3b06..c502ea7ef367c 100644
> --- a/drivers/pci/endpoint/Makefile
> +++ b/drivers/pci/endpoint/Makefile
> @@ -6,3 +6,4 @@
>  obj-$(CONFIG_PCI_ENDPOINT_CONFIGFS)	+= pci-ep-cfs.o
>  obj-$(CONFIG_PCI_ENDPOINT)		+= pci-epc-core.o pci-epf-core.o\
>  					   pci-epc-mem.o functions/
> +obj-$(CONFIG_GENERIC_MSI_IRQ)		+= pci-ep-msi.o

I don't think we should build this driver for generic CONFIG_GENERIC_MSI_IRQ
Kconfig. You should create a new EP specific Kconfig and make it depend on
CONFIG_GENERIC_MSI_IRQ.

> diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
> new file mode 100644
> index 0000000000000..549b55b864d0e
> --- /dev/null
> +++ b/drivers/pci/endpoint/pci-ep-msi.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PCI Endpoint *Controller* (EPC) MSI library
> + *
> + * Copyright (C) 2025 NXP
> + * Author: Frank Li <Frank.Li@nxp.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/of_irq.h>
> +#include <linux/pci-epc.h>
> +#include <linux/pci-epf.h>
> +#include <linux/pci-ep-cfs.h>
> +#include <linux/pci-ep-msi.h>
> +#include <linux/slab.h>
> +
> +static void pci_epf_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> +{
> +	struct pci_epf *epf = to_pci_epf(desc->dev);
> +
> +	if (epf && epf->db_msg && desc->msi_index < epf->num_db)
> +		memcpy(&epf->db_msg[desc->msi_index].msg, msg, sizeof(*msg));
> +}
> +
> +int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 num_db)
> +{
> +	struct pci_epc *epc = epf->epc;
> +	struct device *dev = &epf->dev;
> +	struct irq_domain *dom;
> +	void *msg;
> +	u32 rid;
> +	int ret;
> +	int i;
> +
> +	rid = PCI_EPF_DEVID(epf->func_no, epf->vfunc_no);
> +	dom = of_msi_map_get_device_domain(epc->dev.parent, rid, DOMAIN_BUS_PLATFORM_MSI);
> +	if (!dom) {
> +		dev_err(dev, "Can't find msi domain\n");

s/msi/MSI

Perhaps, "Can't find MSI domain for parent device" to be more explicit that we
are searching for MSI domain in parent device?

> +		return -EINVAL;

-ENODATA

> +	}
> +
> +	dev_set_msi_domain(dev, dom);
> +
> +	msg = kcalloc(num_db, sizeof(struct pci_epf_doorbell_msg), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	epf->num_db = num_db;
> +	epf->db_msg = msg;
> +
> +	ret = platform_device_msi_init_and_alloc_irqs(&epf->dev, num_db, pci_epf_write_msi_msg);
> +	if (ret) {
> +		/*
> +		 * The pcie_ep DT node has to specify 'msi-parent' for EP
> +		 * doorbell support to work. Right now only GIC ITS is
> +		 * supported. If you have GIC ITS and reached this print,
> +		 * perhaps you are missing 'msi-map' in DT.
> +		 */

msi-map is a generic property, no need to tie it with GIC ITS. Also, this API
could fail for different reasons. So please get rid of this comment.

> +		dev_err(dev, "Failed to allocate MSI\n");
> +		kfree(msg);
> +		return -ENOMEM;

Why are you overriding the errno and not using 'ret'?

> +	}
> +
> +	for (i = 0; i < num_db; i++)
> +		epf->db_msg[i].virq = msi_get_virq(dev, i);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pci_epf_alloc_doorbell);
> +
> +void pci_epf_free_doorbell(struct pci_epf *epf)
> +{
> +	platform_device_msi_free_irqs_all(&epf->dev);
> +
> +	kfree(epf->db_msg);
> +	epf->db_msg = NULL;
> +	epf->num_db = 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_epf_free_doorbell);
> diff --git a/include/linux/pci-ep-msi.h b/include/linux/pci-ep-msi.h
> new file mode 100644
> index 0000000000000..6dfbe9353f0d8
> --- /dev/null
> +++ b/include/linux/pci-ep-msi.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * PCI Endpoint *Function* side MSI header file
> + *
> + * Copyright (C) 2024 NXP
> + * Author: Frank Li <Frank.Li@nxp.com>
> + */
> +
> +#ifndef __PCI_EP_MSI__
> +#define __PCI_EP_MSI__
> +
> +struct pci_epf;
> +
> +#ifdef CONFIG_GENERIC_MSI_IRQ
> +int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 nums);
> +void pci_epf_free_doorbell(struct pci_epf *epf);
> +#else
> +static inline int pci_epf_alloc_doorbell(struct pci_epf *epf, u16 nums)
> +{
> +	return -EINVAL;

-ENODATA

> +}
> +
> +static inline void pci_epf_free_doorbell(struct pci_epf *epf)
> +{
> +}
> +#endif /* CONFIG_GENERIC_MSI_IRQ */
> +
> +#endif /* __PCI_EP_MSI__ */
> diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
> index c0864935c6864..9634bf2c1ac06 100644
> --- a/include/linux/pci-epf.h
> +++ b/include/linux/pci-epf.h
> @@ -12,6 +12,7 @@
>  #include <linux/configfs.h>
>  #include <linux/device.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/msi.h>
>  #include <linux/pci.h>
>  
>  struct pci_epf;
> @@ -128,6 +129,17 @@ struct pci_epf_bar {
>  	int		flags;
>  };
>  
> +/**
> + * struct pci_epf_doorbell_msg - represents doorbell message
> + * @msi_msg: MSI message
> + * @virq: irq number of this doorbell MSI message
> + * @name: irq name for doorbell interrupt

'name' is not present in the struct.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

