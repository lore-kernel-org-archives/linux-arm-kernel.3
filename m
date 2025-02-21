Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC16C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn1YK5Rbwl21fIMQLMa2jkRsxua5z7AprrlyzmypaHk=; b=RTtVymsTRFQe77XsT+Zv1YvujY
	unWRQ2SkMQI/hiHFWmE+joQRbe2UujIySMp9hKf9IwTCGRa2SohCqcWBc/ZKC1xdQSsOmTBZsmkvn
	HIQFFBl6TZhafx58Ro9u1Mr68PtCXi917MQ7bicF0cp6XVOvm8HCcEf5rFVWd+QlIuy5tMAkcTlFw
	sD4ix9A0UHSUtDlw8zI05My4Jaf9zJxmuWTTHj9K1Iic5PgzEOLemI4rL9wEpRKITVmRXiHIksufv
	TnSmZASqEfTUdFNjh6O1sUOZR59MQNBIBq6oO7WIx+rYMhh2tLUyRJvI8jQVwxTrDS0WH0Zivef9h
	1FoeHXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPaE-00000004zYX-0daT;
	Fri, 21 Feb 2025 09:44:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPME-00000004vqS-0AFI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:30:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740130204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xn1YK5Rbwl21fIMQLMa2jkRsxua5z7AprrlyzmypaHk=;
	b=z0oFasjwUX4OqPrCTmczsUAX4b9VPP+qb/2lqi56qbQKsREDNb7LRXybObX4Sri8xtEh40
	pJ/0xgrS406ocbif7fccA9wR1Np72hrF44BBcnSI/EN+VIOD8hdnL9v4vA+8wUfeqQh1x1
	vDg26BX0Y/Pd0GDfdmhbnJdaQ1WSqaU7N20QizOoRgSdEBk7ETU0pnHuA62oHYDh9oVl/t
	kYbV1/ynbFj4z7RjHX6LGzL6iivPjH406BMza5ecuWaRFsG+1bDTV70jZTI7m02vDDIY89
	aqc3yU3daGVh138wwksFkfXPsCeSQH9kAmKGNesuEv3SLNlxOrUF8P9+akghfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740130204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xn1YK5Rbwl21fIMQLMa2jkRsxua5z7AprrlyzmypaHk=;
	b=ocZ9Ror/AAB+Q4FTa3HD5O9awyQCTRyOoL8WdHe7hnu0bgWzMQd+Vig5zy5amULt0hWGjE
	Mc0A5LU5PKJ2e6BQ==
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
 kevin.tian@intel.com, maz@kernel.org
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 shuah@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 eric.auger@redhat.com, baolu.lu@linux.intel.com, yi.l.liu@intel.com,
 yury.norov@gmail.com, jacob.pan@linux.microsoft.com,
 patches@lists.linux.dev
Subject: Re: [PATCH v2 4/7] irqchip: Have CONFIG_IRQ_MSI_IOMMU be selected
 by irqchips that need it
In-Reply-To: <a2620f67002c5cdf974e89ca3bf905f5c0817be6.1740014950.git.nicolinc@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <a2620f67002c5cdf974e89ca3bf905f5c0817be6.1740014950.git.nicolinc@nvidia.com>
Date: Fri, 21 Feb 2025 10:30:04 +0100
Message-ID: <87frk7hcgz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_013006_331082_AD49362A 
X-CRM114-Status: GOOD (  12.24  )
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

On Wed, Feb 19 2025 at 17:31, Nicolin Chen wrote:

> From: Jason Gunthorpe <jgg@nvidia.com>
>
> Currently, IRQ_MSI_IOMMU is selected if DMA_IOMMU is available to provide
> an implementation for iommu_dma_prepare/compose_msi_msg(). However, it'll
> make more sense for irqchips that call prepare/compose to select it, and
> that will trigger all the additional code and data to be compiled into
> the kernel.
>
> If IRQ_MSI_IOMMU is selected with no IOMMU side implementation, then the
> prepare/compose() will be NOP stubs.
>
> If IRQ_MSI_IOMMU is not selected by an irqchip, then the related code on
> the iommu side is compiled out.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

I don't think I have conflicting changes here, so the MSI/IRQ related
changes can be routed through the IOMMU tree along with the rest.

Thanks,

        tglx

