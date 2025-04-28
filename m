Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DD3C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQb6/JrtA/eLzoukWftU2fxvtoqJ28zJBaZAc0hVsHY=; b=xvyoxNYrtrKRR8d+M0nK+ZzlAF
	6SxArlFjOWGJQo1TF2CPHGGA5tYMuvRbr04W7Jy6b1P1dK9LvvaB8qeaFfz31iLd+ekq9+4QG9vl+
	My7bmjwuPqFPVRNZZJTiUKGB97xdZ/HODyLvlLHT1po5L3DtV+c6f89rYern8nQDY0fu5Vrbm1JoX
	LNg2LFRyI7skZIRMs1+nvE3YjC3CxPKcsmHn+QDG8yiBWYCmh9Wf+1jPgPGiSYoJc7Mu/WPTst+wS
	UJMcmMICe+YaX51SxzaQRkG/RnuvnFAdhorZCvGaHaAuqxkibZSYyoOcUygQHnxI3tJYC99kYpTaw
	jkGftNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JkO-00000005Owa-1OrO;
	Mon, 28 Apr 2025 08:21:52 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ja5-00000005MdB-17ij
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:11:15 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S11XbV010761;
	Mon, 28 Apr 2025 10:10:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PQb6/JrtA/eLzoukWftU2fxvtoqJ28zJBaZAc0hVsHY=; b=QwoydfmJnqrIp1Bs
	q/5op7P9yWgVMKAfoFEU1jyURgEx+qPUDq86ch/CQCNROm4Mxk9HC6YD7MH4Xtmi
	3rQphDkC1+X5k47wruX25t+hfl48d3DGpsuF3Prb14wiAMj+EsbVHwphl0Fu3qJz
	SmEK1tY8GUZaWs/i9ClheBgwg8NcYqTGZ+VSKcG1b0C7i2O4SBvWc3y/7E+zvtYc
	NiEaxlGfyjdSwBnETaBtVc2kCpyyptb1Xq8l0qLOVuwN/IFbtdMo8w9pvWlHIbyO
	23nxIBPn1Iz2uNbsjaTymfeLeJPQ8YA5tJnyzsDOlcOhxPHwotSdRgbyLDKFfAI7
	tGWyzA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg5gx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:10:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EF3BA4004F;
	Mon, 28 Apr 2025 10:09:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8252A342DD;
	Mon, 28 Apr 2025 10:07:54 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:07:54 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:07:52 +0200
Message-ID: <4e6840e5-34a7-4f15-a13a-1ff1ea5eff85@foss.st.com>
Date: Mon, 28 Apr 2025 10:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] of: reserved_mem: Add functions to parse
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Saravana Kannan
	<saravanak@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
	<wens@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Daniel Baluta
	<daniel.baluta@nxp.com>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <20250423-dt-memory-region-v2-v2-1-2fbd6ebd3c88@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250423-dt-memory-region-v2-v2-1-2fbd6ebd3c88@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_011113_802293_F12A314A 
X-CRM114-Status: GOOD (  25.87  )
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

Hello Rob,

On 4/23/25 21:42, Rob Herring (Arm) wrote:
> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Wrap function parameters
> ---
>  drivers/of/of_reserved_mem.c    | 80 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h | 26 ++++++++++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index ee2e31522d7e..f87915cce961 100644
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
> @@ -740,3 +741,82 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
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
> +int of_reserved_mem_region_to_resource(const struct device_node *np,
> +				       unsigned int idx, struct resource *res)
> +{
> +	struct reserved_mem *rmem;
> +
> +	if (!np)
> +		return -EINVAL;
> +
> +	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
> +	if (!target || !of_device_is_available(target))
> +		return -ENODEV;
> +
> +	rmem = of_reserved_mem_lookup(target);
> +	if (!rmem)
> +		return -EINVAL;
> +
> +	resource_set_range(res, rmem->base, rmem->size);
> +	res->name = rmem->name;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource);
> +
> +/**
> + * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
> + * @np:		node containing 'memory-region' property
> + * @name:	name of 'memory-region' property entry to lookup
> + * @res:	Pointer to a struct resource to fill in with reserved region
> + *
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by name and return a struct resource for the entry.
> + *
> + * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
> + * is missing or unavailable, -EINVAL for any other error.

of_property_match_string() can return some other error values.

Thanks,
Arnaud

> + */
> +int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +					      const char *name,
> +					      struct resource *res)
> +{
> +	int idx;
> +
> +	if (!name)
> +		return -EINVAL;
> +
> +	idx = of_property_match_string(np, "memory-region-names", name);
> +	if (idx < 0)
> +		return idx;
> +
> +	return of_reserved_mem_region_to_resource(np, idx, res);
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_byname);
> +
> +/**
> + * of_reserved_mem_region_count() - Return the number of 'memory-region' entries
> + * @np:		node containing 'memory-region' property
> + *
> + * This function allows drivers to retrieve the number of entries for a node's
> + * 'memory-region' property.
> + *
> + * Returns the number of entries on success, or negative error code on a
> + * malformed property.
> + */
> +int of_reserved_mem_region_count(const struct device_node *np)
> +{
> +	return of_count_phandle_with_args(np, "memory-region", NULL);
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_count);
> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
> index e338282da652..f573423359f4 100644
> --- a/include/linux/of_reserved_mem.h
> +++ b/include/linux/of_reserved_mem.h
> @@ -7,6 +7,7 @@
>  
>  struct of_phandle_args;
>  struct reserved_mem_ops;
> +struct resource;
>  
>  struct reserved_mem {
>  	const char			*name;
> @@ -39,6 +40,12 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
>  void of_reserved_mem_device_release(struct device *dev);
>  
>  struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
> +int of_reserved_mem_region_to_resource(const struct device_node *np,
> +				       unsigned int idx, struct resource *res);
> +int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +					      const char *name, struct resource *res);
> +int of_reserved_mem_region_count(const struct device_node *np);
> +
>  #else
>  
>  #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
> @@ -63,6 +70,25 @@ static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np
>  {
>  	return NULL;
>  }
> +
> +static inline int of_reserved_mem_region_to_resource(const struct device_node *np,
> +						     unsigned int idx,
> +						     struct resource *res)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +							    const char *name,
> +							    struct resource *res)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int of_reserved_mem_region_count(const struct device_node *np)
> +{
> +	return 0;
> +}
>  #endif
>  
>  /**
> 

