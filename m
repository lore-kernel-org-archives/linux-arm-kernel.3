Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF62CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riseqr7giCwGSs0EX2LMjuRgShugdJRoGQeLK08awR0=; b=cENybWo52cRICB+87pZyXlMxVO
	pfvCxgzJ8N6MP4H3Ac24gcN96goB5kI/ui6DaQXfDLM2yp97Te6wsZEbXjMuoK51KYr3doD9/Thav
	W5bintPgmU22ByA160kU8eEfYH0oH79j/jutUJrtw9RRt+5aTANgIaDZE9won63Rv/ldmdquFuuCL
	z8Pnp8Dyf2brTILB2DZ2CG4dK5fGOJ/s9EV9XPluNkPo8VZiH0HJY+pbAs7XaCg212eEbT1kahU7F
	aORs3P28iV9zCfd6hX7y4NpBhlxKg+HIKM9vDb9uPrvRrSyvAGy9LcbYNylg/iAoKvx9ij9USdm1M
	QCfAdF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u3i-00000006ltv-1hAA;
	Thu, 09 Oct 2025 17:04:06 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u3f-00000006lsV-1UtW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 17:04:04 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cjGR31Pj7z67KQK;
	Fri, 10 Oct 2025 01:03:11 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 530081402E9;
	Fri, 10 Oct 2025 01:03:54 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Oct
 2025 18:03:53 +0100
Date: Thu, 9 Oct 2025 18:03:51 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Mark
 Rutland" <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
	<j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
	<james.clark@linaro.org>
Subject: Re: [PATCH v3 04/26] platform: Add firmware-agnostic irq and
 affinity retrieval interface
Message-ID: <20251009180351.00000d3d@huawei.com>
In-Reply-To: <20250922082833.2038905-5-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
	<20250922082833.2038905-5-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_100403_541606_FBAC26C5 
X-CRM114-Status: GOOD (  21.52  )
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

On Mon, 22 Sep 2025 09:28:11 +0100
Marc Zyngier <maz@kernel.org> wrote:

> Expand platform_get_irq_optional() to also return an affinity if
> available, renaming it to platform_get_irq_affinity() in the
> process.
> 
> platform_get_irq_optional() is preserved with its current semantics
> by calling into the new helper with a NULL affinity pointer.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Maybe a breadcrumb of a comment for those of us who can't be bothered
to figure out why this needs the ifndef CONFIG_SPARC?

Otherwise a question on whether it's worth spinning a fwnode.h handler
to hide away the fwnode type in get_irq_affinity.
I think not given the complexity already there for the platform device
irq stuff, but thought I'd mention it.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/base/platform.c         | 60 +++++++++++++++++++++++++++------
>  include/linux/platform_device.h |  2 ++
>  2 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 09450349cf323..3a058f63ef0d3 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -150,25 +150,37 @@ devm_platform_ioremap_resource_byname(struct platform_device *pdev,
>  EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_byname);
>  #endif /* CONFIG_HAS_IOMEM */
>  
> +static const struct cpumask *get_irq_affinity(struct platform_device *dev,
> +					      unsigned int num)
> +{
> +	const struct cpumask *mask = NULL;
> +#ifndef CONFIG_SPARC
> +	struct fwnode_handle *fwnode = dev_fwnode(&dev->dev);
> +
> +	if (is_of_node(fwnode))
> +		mask = of_irq_get_affinity(to_of_node(fwnode), num);
> +	else if (is_acpi_device_node(fwnode))
> +		mask = acpi_irq_get_affinity(ACPI_HANDLE_FWNODE(fwnode), num);

Not sure how useful it will be more generally, but maybe use fwnode.h and
appropriate callback rather than opencoding here?

Mind you the extra handling in existing platform_get_irq_optional()
for corner cases doesn't really fit with that model.

> +#endif
> +
> +	return mask ?: cpu_possible_mask;
> +}


