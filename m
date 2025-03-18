Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E25C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzKG5OpPSCXmvp33n0D6FbVOcTSlxn5kZp/Q/3rkA7g=; b=mPbgRbtIVUCgXqYuc2Za26msvB
	8k8/MtJkn8GKlVxZbTF+3igm5xsBP5w5Q2/VdXTZZKgjmxiBdvHNVVMiIxAa3c0U6uzZktoZVxmb/
	rYRBq23jzIqYzdQVduETGd47DQFwlwiqs9Fq54liqjFpcMGuwWmj9CXyKeT+yKWC4zUZXt1WZYx48
	DOjVD6IC5ZEDc6CEC5ZXERrZo50WHgxeK0e+lreAPRz0x/8CL4PK+9c94df7OeC1hSAH8i3ASowBi
	oOQmYzaOzXTMRNYlllkKnO7/2o6s5zd0DrhIllyInJJULwQNGrkz1FK0QittYKjXx9RHi1EJLit6C
	QiCVYVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUwM-00000005gRl-2tD2;
	Tue, 18 Mar 2025 11:16:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUsP-00000005fUQ-1FTr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 11:12:54 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZH8HW4vxNz6LDCB;
	Tue, 18 Mar 2025 19:09:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F53214050C;
	Tue, 18 Mar 2025 19:12:44 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 18 Mar
 2025 12:12:43 +0100
Date: Tue, 18 Mar 2025 11:12:42 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Saravana Kannan <saravanak@google.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Shawn
 Guo" <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 1/3] of: reserved_mem: Add functions to parse
 "memory-region"
Message-ID: <20250318111242.00007457@huawei.com>
In-Reply-To: <20250317232426.952188-2-robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
	<20250317232426.952188-2-robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_041253_482551_75659086 
X-CRM114-Status: GOOD (  18.65  )
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

On Mon, 17 Mar 2025 18:24:21 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/of/of_reserved_mem.c    | 77 +++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h | 26 +++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 75e819f66a56..fd50038dff76 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -12,6 +12,7 @@
>  #define pr_fmt(fmt)	"OF: reserved mem: " fmt
>  
>  #include <linux/err.h>
> +#include <linux/ioport.h>
>  #include <linux/libfdt.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> @@ -740,3 +741,79 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
> +
> +/**
> + * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
> + * @np:		node containing 'memory-region' property
> + * @idx:	index of 'memory-region' property to lookup
> + * @res:	Pointer to a struct resource to fill in with reserved region
> + *
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by index and return a struct resource for the entry.
> + *
> + * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
> + * is missing or unavailable, -EINVAL for any other error.
> + */
> +int of_reserved_mem_region_to_resource(const struct device_node *np, unsigned int idx, struct resource *res)

Maybe wrap?
 
> +{


