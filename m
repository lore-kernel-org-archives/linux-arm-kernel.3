Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2WYsGMPQpFANCHXxl2mkfQyQ24a8EKaADn28F99e5I=; b=QZ8YpVxm60mnv0t1pLkgg/4LKU
	p9Xdb0+NxIyb/aD9szrUISjB93k4ocZ/WUPxAC7HFsLVGoD2bXPV5XpxkuUQxIYHtK4VSAvKPzJao
	h/q+DsevP8OAnn4KzM7tixOVq1xoJ9M47V3A7KPMmMIvhp8GuHWnuD+pXGF/4BY5ETwA32Pf7p7BB
	huxb+TTNdud8GZCr9tKTwagO1oRuh0YB4BJDs9DPdtlfJ4CrUYpEn8LHTH/7s4/J7xSNjlKVjObfy
	BHWLADAGX0fbD5D3r4ia3MaUHnyJO7LUfP0uzIHHXZnm0436lAA4YiKhbgV7YnXpIuBDLHPTYkKNa
	0l7Z2yGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkR3-0000000DPz9-3aZx;
	Fri, 03 Jan 2025 16:22:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkPo-0000000DPlE-3PQ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=B2WYsGMPQpFANCHXxl2mkfQyQ24a8EKaADn28F99e5I=; b=QKkMte/rHHfXcBmU0nceXRubrn
	iQeMg4csyJfv3OOg9qe1ys9p6TcH3O+Uf7s16qM+6WDAiPySZIRXwyfDVd+723zmFSHs2cCwFF1NX
	kycyeuUZRyJC6CiabE2wIamZg+SUnhNRrzGWcz+ye5LemvpCn9yPnrtYm+GrJjRGMyYU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTkPb-0015Hv-95; Fri, 03 Jan 2025 17:20:35 +0100
Date: Fri, 3 Jan 2025 17:20:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH net-next 01/13] net: enetc: add initial netc-lib driver
 to support NTMP
Message-ID: <829ccd93-8b4e-4dd9-bd15-58d345797aca@lunn.ch>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
 <20250103060610.2233908-2-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103060610.2233908-2-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_082048_848164_67C2A1B0 
X-CRM114-Status: GOOD (  16.84  )
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

> +#define NTMP_FILL_CRD(crd, tblv, qa, ua) \
> +({ \
> +	typeof(crd) _crd = (crd); \
> +	(_crd)->update_act = cpu_to_le16(ua); \
> +	(_crd)->tblv_qact = NTMP_TBLV_QACT(tblv, qa); \
> +})
> +
> +#define NTMP_FILL_CRD_EID(req, tblv, qa, ua, eid) \
> +({ \
> +	typeof(req) _req = (req); \
> +	NTMP_FILL_CRD(&(_req)->crd, tblv, qa, ua); \
> +	(_req)->entry_id = cpu_to_le32(eid); \
> +})


These are pretty complex for #defines. Can they be made into
functions? That will get you type checking, finding bugs where
parameters are swapped.

> +int netc_setup_cbdr(struct device *dev, int cbd_num,
> +		    struct netc_cbdr_regs *regs,
> +		    struct netc_cbdr *cbdr)
> +{
> +	int size;
> +
> +	size = cbd_num * sizeof(union netc_cbd) + NTMP_BASE_ADDR_ALIGN;
> +
> +	cbdr->addr_base = dma_alloc_coherent(dev, size, &cbdr->dma_base,
> +					     GFP_KERNEL);
> +	if (!cbdr->addr_base)
> +		return -ENOMEM;
> +
> +	cbdr->dma_size = size;
> +	cbdr->bd_num = cbd_num;
> +	cbdr->regs = *regs;
> +
> +	/* The base address of the Control BD Ring must be 128 bytes aligned */
> +	cbdr->dma_base_align =  ALIGN(cbdr->dma_base,  NTMP_BASE_ADDR_ALIGN);
> +	cbdr->addr_base_align = PTR_ALIGN(cbdr->addr_base,
> +					  NTMP_BASE_ADDR_ALIGN);
> +
> +	cbdr->next_to_clean = 0;
> +	cbdr->next_to_use = 0;
> +	spin_lock_init(&cbdr->ring_lock);
> +
> +	/* Step 1: Configure the base address of the Control BD Ring */
> +	netc_write(cbdr->regs.bar0, lower_32_bits(cbdr->dma_base_align));
> +	netc_write(cbdr->regs.bar1, upper_32_bits(cbdr->dma_base_align));
> +
> +	/* Step 2: Configure the producer index register */
> +	netc_write(cbdr->regs.pir, cbdr->next_to_clean);
> +
> +	/* Step 3: Configure the consumer index register */
> +	netc_write(cbdr->regs.cir, cbdr->next_to_use);
> +
> +	/* Step4: Configure the number of BDs of the Control BD Ring */
> +	netc_write(cbdr->regs.lenr, cbdr->bd_num);
> +
> +	/* Step 5: Enable the Control BD Ring */
> +	netc_write(cbdr->regs.mr, NETC_CBDR_MR_EN);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(netc_setup_cbdr);

I assume there is a version 3 in development, which will need a
different library, or at least different symbols. Maybe you should
think about the naming issues now?

> diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> new file mode 100644
> index 000000000000..7cf322a1c8e3
> --- /dev/null
> +++ b/include/linux/fsl/ntmp.h
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> +/* Copyright 2025 NXP */
> +#ifndef __NETC_NTMP_H
> +#define __NETC_NTMP_H

Does this header need to be global? What else will use it outside of
drivers/net/ethernet/freescale/enetc?

	Andrew

