Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0746CD343C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCVt/N6QyEJJEIA1DNB9XMDGKOgSZwDdxLTMlYYW/Ak=; b=yYsVmLttPFGJrjSM2zRruvYPyk
	o/JNyaKsg56mXPjG0e/+0ubdqSzRg0HK//rHiXuiUQQk9Y8z68HFm8oaWJN6j9BgiWAb8yRcQQw5l
	Jg6dsaiMj0wvRV7+o91kcaIYTZQDSey0NvCBJqABpnLdBM9FLu2F8fFyr2qjt4Ad+Iy9fr3c+/2J3
	acHmd8700xYS0rnMBKDBTaJfsGWaOkV9o72s+PoJ1ikMb7OmoRcMAEFnke8tRo3EOeYeND1bEppS0
	yD1KiUt4ycPMkjOJcuHO9rRw8n2UO7yuUhGe7MNplihBqelVKhNTacQdqKhPnK2NuAOHrznU3ZP0J
	dsDtKX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFhE-00000009Mig-0iQD;
	Wed, 12 Nov 2025 18:35:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFhB-00000009MiB-1I6U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:35:54 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6Bss2p2yzHnGj1;
	Thu, 13 Nov 2025 02:35:29 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id E58931402F5;
	Thu, 13 Nov 2025 02:35:48 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 12 Nov
 2025 18:35:47 +0000
Date: Wed, 12 Nov 2025 18:35:46 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Mark
 Rutland" <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
	<j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
	<james.clark@linaro.org>, Jinjie Ruan <ruanjinjie@huawei.com>, "Alexandru
 Elisei" <alexandru.elisei@arm.com>
Subject: Re: [PATCH v4 25/26] irqdomain: Kill of_node_to_fwnode() helper
Message-ID: <20251112183546.00005dda@huawei.com>
In-Reply-To: <20251020122944.3074811-26-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
	<20251020122944.3074811-26-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_103553_493545_E954F684 
X-CRM114-Status: GOOD (  15.63  )
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

On Mon, 20 Oct 2025 13:29:42 +0100
Marc Zyngier <maz@kernel.org> wrote:

> There is no in-tree users of this helper since b13b41cc3dc18 ("misc:
> ti_fpc202: Switch to of_fwnode_handle()"), and is replaced with
> of_fwnode_handle().
> 
> Get rid of it.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
I didn't bother checking all the other removal patches but didn't see
anything wrong with them!  Ripping code out is (usually) uncontroversial.


> ---
>  include/linux/irqdomain.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 9d6a5e99394fa..5907baf6099d9 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -730,12 +730,6 @@ static inline void msi_device_domain_free_wired(struct irq_domain *domain, unsig
>  }
>  #endif
>  
> -/* Deprecated functions. Will be removed in the merge window */
> -static inline struct fwnode_handle *of_node_to_fwnode(struct device_node *node)
> -{
> -	return node ? &node->fwnode : NULL;
> -}
> -
>  static inline struct irq_domain *irq_domain_add_tree(struct device_node *of_node,
>  						     const struct irq_domain_ops *ops,
>  						     void *host_data)


