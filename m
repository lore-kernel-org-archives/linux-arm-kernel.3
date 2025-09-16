Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F84CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKrQ7Q/cL94bNT+7F1MA/puO3DVX7gc8gfSDQSwYKIs=; b=IeolRlpGnLfdgtzdfKxuQe8rAD
	YQatQ0ebUAjs5wW5zknDeBvgry0bSpTiXSJ8dtAWhGj5lyWHzPG2ielI1QgZ1Vupv23YBe/6wOrat
	Qaq1fo44D6XmW5RzHoFxgDD/9TsXQ2S3X1310zy8Qg2tw9FwrJ90lID/eWNWpztq3ViIZOv5jzP0p
	VZhySvv4vdZRW6n7MdnkC/UkEqTd2cSWUgA8Pj54YET+qsIlxiSQSOIegHa/e0EehyMmC8GG8Dv50
	53F/fMRra1OosFzEYrLCoB05Tcvm9kKiBzqNDjy063HhJYUblVJBOuO5mhFbKrFWOEqlh1PBCuV7E
	u/xSNYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXXB-00000008HQp-1kKG;
	Tue, 16 Sep 2025 15:23:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXX9-00000008HQS-0bo1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:23:56 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cR5Fn6LWLz6K9K9;
	Tue, 16 Sep 2025 23:21:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A43D1402F0;
	Tue, 16 Sep 2025 23:23:49 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 16 Sep
 2025 17:23:48 +0200
Date: Tue, 16 Sep 2025 16:23:46 +0100
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
Subject: Re: [PATCH v2 04/25] platform: Add firmware-agnostic irq and
 affinity retrieval interface
Message-ID: <20250916162346.0000782a@huawei.com>
In-Reply-To: <20250915085702.519996-5-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
	<20250915085702.519996-5-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_082355_331666_ECD87D40 
X-CRM114-Status: GOOD (  15.97  )
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

On Mon, 15 Sep 2025 09:56:41 +0100
Marc Zyngier <maz@kernel.org> wrote:

> Expand platform_get_irq_optional() to also return an affinity if
> available, renaming it to platform_get_irq_affinity() in the
> process.
> 
> platform_get_irq_optional() is preserved with its current semantics
> by calling into the new helper with a NULL affinity pointer.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/base/platform.c         | 60 +++++++++++++++++++++++++++------
>  include/linux/platform_device.h |  2 ++
>  2 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 09450349cf323..fad33d6b2349a 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c

>  /**
> - * platform_get_irq_optional - get an optional IRQ for a device
> + * platform_get_irq_affinity - get an optional IRQ and its affnity for a device

affinity

>   * @dev: platform device
>   * @num: IRQ number index
> + * @affinity: optional cpumask pointer to get the affinity of a per-cpu IRQ
>   *


> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index 074754c23d330..ad66333ce85ce 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -102,6 +102,8 @@ devm_platform_ioremap_resource_byname(struct platform_device *pdev,
>  
>  extern int platform_get_irq(struct platform_device *, unsigned int);
>  extern int platform_get_irq_optional(struct platform_device *, unsigned int);
> +extern int platform_get_irq_affinity(struct platform_device *, unsigned int,
> +				     const struct cpumask **);
>  extern int platform_irq_count(struct platform_device *);
>  extern int devm_platform_get_irqs_affinity(struct platform_device *dev,
>  					   struct irq_affinity *affd,


