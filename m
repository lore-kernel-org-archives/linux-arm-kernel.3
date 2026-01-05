Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCABC79F81
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bAJ5j54+if4yfTfzELr6jDNFmLddtHlQfg5oncGBWY=; b=VlEzHhP+CsO7HVSSG7fKCWIehW
	SC/KPP/QL+wRPo5edvhSLQKkKFEYs0/FHp2/OAt6l7EHUTGl+1lBCDrhasNgOUlZLDJZQHBDAUiZt
	QZzZtGuorx8w21/i3It0rEFBM8aYk4nI8irEURxsaYYJToevtoSacCF2ycDkag46z2/ADJA8JqeRP
	fXzI5wRam/xWHujVy/5G4VMXCJWEqc0yaxym8E2x7y1NC2bcsZ2XjuyFimc9HtkpKDb0kzXLViLxZ
	hjuTbCfcr8xJhlQ6t5x3hTMGuSLgFlq41B20A8/WSc+ElMHecAsrz6ifkL5C0BiRB5BIDJPRxMd6W
	fx7mv8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjH2-0000000BEj0-101Z;
	Mon, 05 Jan 2026 12:01:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjGy-0000000BEif-3RHz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:01:23 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlCYw6g49zHnH7t;
	Mon,  5 Jan 2026 20:01:08 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 17D0240565;
	Mon,  5 Jan 2026 20:01:11 +0800 (CST)
Received: from localhost (10.48.157.23) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 12:01:09 +0000
Date: Mon, 5 Jan 2026 12:01:08 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Marc
 Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] irqdomain: Add parent field to struct
 irqchip_fwid
Message-ID: <20260105120108.00002016@huawei.com>
In-Reply-To: <20251218-gicv5-host-acpi-v2-3-eec76cd1d40b@kernel.org>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
	<20251218-gicv5-host-acpi-v2-3-eec76cd1d40b@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.23]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_040121_169767_C53F3EA9 
X-CRM114-Status: GOOD (  21.33  )
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

On Thu, 18 Dec 2025 11:14:29 +0100
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> The GICv5 driver IRQ domain hierarchy requires adding a parent field to
> struct irqchip_fwid so that core code can reference a fwnode_handle parent
> for a given fwnode.
> 
> Add a parent field to struct irqchip_fwid and update the related kernel API
> functions to initialize and handle it.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
Hi Lorenzo,

Happy new year.

> ---
>  include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++----
>  kernel/irq/irqdomain.c    | 14 +++++++++++++-
>  2 files changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 62f81bbeb490..b9df84b447a1 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -257,7 +257,8 @@ static inline void irq_domain_set_pm_device(struct irq_domain *d, struct device
>  
>  #ifdef CONFIG_IRQ_DOMAIN
>  struct fwnode_handle *__irq_domain_alloc_fwnode(unsigned int type, int id,
> -						const char *name, phys_addr_t *pa);
> +						const char *name, phys_addr_t *pa,
> +						struct fwnode_handle *parent);
>  
>  enum {
>  	IRQCHIP_FWNODE_REAL,
> @@ -267,18 +268,39 @@ enum {
>  
>  static inline struct fwnode_handle *irq_domain_alloc_named_fwnode(const char *name)
>  {
> -	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL);
> +	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL, NULL);
> +}
> +
> +static inline
> +struct fwnode_handle *irq_domain_alloc_named_fwnode_parent(const char *name,
> +							   struct fwnode_handle *parent)

The name of this makes me think it's allocating the named fwnode parent, rather that
the named fwnode + setting it's parent.

There aren't all that many calls to irq_domain_named_fwnode(), maybe to avoid challenge
of a new name, just add the parameter to all of them? (25ish)  Mind you the current
pattern for similar cases is a helper, so maybe not.

Or go with something similar to named and have

irq_domain_alloc_named_parented_fwnode()?

I'm not that bothered though if you think the current naming is the best we can do.

Jonathan

> +{
> +	return __irq_domain_alloc_fwnode(IRQCHIP_FWNODE_NAMED, 0, name, NULL, parent);
>  }



