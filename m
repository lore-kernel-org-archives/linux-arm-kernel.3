Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2FFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSpTLk5lQ7NViy72KNwEiQE++3u7If+QCC1bqr5TgNA=; b=lsRNA+3gkUT3MvaechDmFYFPJ4
	vaEm2aXQGfJU4lCs0Dy9Ok1KtaRev1jr9qg59WZsuLevSvFcN9htofxlFe50moVBbwpNkb8IkXEDX
	RnbbCpWpqB2iYQMIARSPmJU7XP91KxgaYI3+ivIvrd5JTsfSyU1Den5Rw/zL9AdjzW3ELvH8huYoV
	yhVVQtBSWt77uWoZQxOEPIc/mUVPraZ8MYIh7z0vbRhY5/QIOEIMYPVIxqZCg1ZRPE0ZLB1erk9rs
	vrsZVRoK2x4wwAhxDsUgekPWdHVMvBcKifERiBJD2woDLTiBv/RYWw1fAL7wvhm6jMAu60+NHchrb
	heq8FvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tqK-00000006jSl-04db;
	Thu, 09 Oct 2025 16:50:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tqH-00000006jSC-1yei
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 16:50:14 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cjG4t1CR7z6L4yc;
	Fri, 10 Oct 2025 00:47:26 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 44B5B1402F0;
	Fri, 10 Oct 2025 00:50:02 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Oct
 2025 17:50:01 +0100
Date: Thu, 9 Oct 2025 17:49:59 +0100
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
Subject: Re: [PATCH v3 03/26] of/irq: Add IRQ affinity reporting interface
Message-ID: <20251009174959.00001b05@huawei.com>
In-Reply-To: <20250922082833.2038905-4-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
	<20250922082833.2038905-4-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_095013_656681_58921A16 
X-CRM114-Status: GOOD (  15.82  )
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

On Mon, 22 Sep 2025 09:28:10 +0100
Marc Zyngier <maz@kernel.org> wrote:

> Plug the irq_populate_fwspec_info() helper into the OF layer
> to offer an IRQ affinity reporting function.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Trivial comment inline but I don't care that much.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/of/irq.c       | 20 ++++++++++++++++++++
>  include/linux/of_irq.h |  7 +++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 74aaea61de13c..9a205cb033bda 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -479,6 +479,26 @@ int of_irq_get(struct device_node *dev, int index)
>  }
>  EXPORT_SYMBOL_GPL(of_irq_get);
>  
> +const struct cpumask *of_irq_get_affinity(struct device_node *dev, int index)
> +{
> +	struct of_phandle_args oirq;
> +	struct irq_fwspec_info info;
> +	struct irq_fwspec fwspec;
> +	int rc;
> +
> +	rc = of_irq_parse_one(dev, index, &oirq);
> +	if (rc)
> +		return NULL;
> +
> +	of_phandle_args_to_fwspec(oirq.np, oirq.args, oirq.args_count,
> +				  &fwspec);
> +
> +	if (!irq_populate_fwspec_info(&fwspec, &info))
> +		return info.affinity;
My slightly picky mental consistency filter suggests that this would look
more like the ACPI version as

	if (irq_populate_fwspec_info(&fwspec, &info))
		return NULL;

	return info.affinity;

But I don't really care.

> +
> +	return NULL;
> +}
> +


