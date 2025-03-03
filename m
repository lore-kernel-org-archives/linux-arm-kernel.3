Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E247EC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRLgSxdqlBvInXl2DZuy/8p0+JAmavEVWC8IUWE/7IY=; b=b7d6AZeH0v6kYKjcfPT6WTc50N
	265GVoJ+oztO5geop/QKyjrLkSLXtdTGCkurqvjtJtJShaxIWZZTE7px/LiKwOaPLpQMlTFxSNMu8
	7ZyPgHrl7gv6RV96NIxaQjId6X4OCn17KCLGOjCd5xeJfXlOHDup/uvwvBqxySR60m2Jy2LlsF0EO
	Iu+hyH5joAIcq7v8z3ylrpFHNncNvBX0d6ehliO8koUu4KTETGxLhWJJfVStaaesFNkZAHCNOKsEk
	jpqotpPln0KoF6EEkKBJze+Q8lggovYvKnv5sM7rnI8px7VukOqPYb62O6rSeAFOo6AlF95m3/2+5
	XPeR8jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9Ts-00000001iuF-0tzB;
	Mon, 03 Mar 2025 17:21:28 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9SE-00000001iX6-1mD8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:19:47 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6e8a8d6c38fso43465316d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 09:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741022385; x=1741627185; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRLgSxdqlBvInXl2DZuy/8p0+JAmavEVWC8IUWE/7IY=;
        b=Rn7uEHsPaYU/QpXkyAg+ybkoagpQztfL1vyMjTL/aRrZolJOIeFXDcNzwRoYTaBH0m
         h2Lwwnpuv6jOpQv6AqdddL/IYqQn+V1W9BxSAGzB/bGMPhfm3lgIYR4HZLg5iKZZpHx3
         A/j3aAYOMVWfx08m0CTSEfH+98BTvzZCa4Hr7fUn0G6AdamdQp4kcLV5m2jiseSEqrQb
         LMivfmyPGWUedwlt3wGdPs4K/XhEK8ZbfsMRRXj8aljCkrceSjXF89X270SO4c0CFwIi
         SgPHY5M/nVGbZSuxihF9fjTvvhfpswyM5JJYp5Yi7HmiAhRrbVZ/X/E3fkXyb2V8W36M
         56lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741022385; x=1741627185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRLgSxdqlBvInXl2DZuy/8p0+JAmavEVWC8IUWE/7IY=;
        b=dwN9E0ikH8vgIh9EaxNAThnMk2L5W81CRviNqwkKk2oh6uUYuNeFL+sAy8Cv8oa8W1
         /KVA8W39Az/AMwv2gB8MrO+mmAxRoPutIqtiInP2wWCrfgYroz1jNISjAU1yJUkhn0Dj
         Pb8A6b1pYhYjtgZrtq6839oziAt7vCztRPpA0waxKVqxNAvq0C/t+7XuGNcQShNBoqLV
         ofnucWlsEs5uvIH8CwGYpLNn3GQFBjFH+VnltZbys+pQHKo1aNMRpQjV1Vh7E/Z7xGIm
         IN5Th2V1XX4PmSQ/R61Cck9oc3OYRe1ZLlvwBjvr6P0rOrMzyyponzjCmC7qejsTeOw3
         3blw==
X-Forwarded-Encrypted: i=1; AJvYcCWmDXVFMfnBz8kQcRHbXlJc52jYXBLWM1GRieMDOuBXS+C2+nWapI+7Fsmjg/+TewuFY08qYFGoBNh7X1BTWF9k@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Ks59o1eGYr/KK8nuTVATShZZIgE9S3t602O148sCugIMHCnD
	YO4YG60ev60fdlue27n4q4B5akQwZGMmRtdKrmQtzOgzfbAZCUMq
X-Gm-Gg: ASbGncvLzK8i+NecGxhbnWvV52ctDNCtKQ5fa6CqpP+l6WOOt/FmU++duWe3mkolbnl
	KUZaXWJy5YXYOZKtzwTaO0vAUe7+W7nIV23ov4Kn0TuQUEg2J2RUlgd2GMTqpONsUIzLcS5BZ2y
	2nH9z8ZocxRtVptC2RjlLldGa291kDCR1S3pXDUMzByXIZU7ZUKylTRGIWlvSXEf0ocdqjCao+q
	JAhKh3ztWyoebU8qbXuTOueNipOm9h/xjvGEjK+l/P1jZOWzFVyoO89/Pow05ey+HygehOUzzMZ
	AedA5BPmQiMWspXH383PfDXK9lM5GfHphXgPFafp
X-Google-Smtp-Source: AGHT+IG0zVy7lg60mYfgSImCsh74mBuzqU36VHUksDzxDuyNJ/s3ohxIrUrwvRq5twPzh4X1lLXSdA==
X-Received: by 2002:ad4:5ec9:0:b0:6d4:c6d:17fe with SMTP id 6a1803df08f44-6e8a0d066f7mr250591406d6.25.1741022384595;
        Mon, 03 Mar 2025 09:19:44 -0800 (PST)
Received: from debian ([2607:fb90:8e63:c2b3:5405:c8bf:c1d1:41d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c378da08f2sm617957485a.81.2025.03.03.09.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:19:44 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 3 Mar 2025 09:19:38 -0800
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, nifan.cxl@gmail.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 1/5] perf/dwc_pcie: Move common DWC struct definitions
 to 'pcie-dwc.h'
Message-ID: <Z8XkqnQir1CfilvM@debian>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132024epcas5p13d6e617805e4ef0c081227b08119871b@epcas5p1.samsung.com>
 <20250221131548.59616-2-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-2-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_091946_460754_0E0267A8 
X-CRM114-Status: GOOD (  25.84  )
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

On Fri, Feb 21, 2025 at 06:45:44PM +0530, Shradha Todi wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Since these are common to all Desginware PCIe IPs, move them to a new
> header 'pcie-dwc.h', so that other drivers like debugfs, perf and sysfs
> could make use of them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>

Reviewed-by: Fan Ni <fan.ni@samsung.com>

> ---
>  MAINTAINERS                 |  1 +
>  drivers/perf/dwc_pcie_pmu.c | 25 +++----------------------
>  include/linux/pcie-dwc.h    | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 22 deletions(-)
>  create mode 100644 include/linux/pcie-dwc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3864d473f52f..6474a2d83de4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18167,6 +18167,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
>  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
>  F:	drivers/pci/controller/dwc/*designware*
> +F:	include/linux/pcie-dwc.h
>  
>  PCI DRIVER FOR TI DRA7XX/J721E
>  M:	Vignesh Raghavendra <vigneshr@ti.com>
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index cccecae9823f..da30f2c2d674 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -13,6 +13,7 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> +#include <linux/pcie-dwc.h>
>  #include <linux/perf_event.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> @@ -99,26 +100,6 @@ struct dwc_pcie_dev_info {
>  	struct list_head dev_node;
>  };
>  
> -struct dwc_pcie_pmu_vsec_id {
> -	u16 vendor_id;
> -	u16 vsec_id;
> -	u8 vsec_rev;
> -};
> -
> -/*
> - * VSEC IDs are allocated by the vendor, so a given ID may mean different
> - * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
> - */
> -static const struct dwc_pcie_pmu_vsec_id dwc_pcie_pmu_vsec_ids[] = {
> -	{ .vendor_id = PCI_VENDOR_ID_ALIBABA,
> -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> -	{ .vendor_id = PCI_VENDOR_ID_AMPERE,
> -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> -	{ .vendor_id = PCI_VENDOR_ID_QCOM,
> -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> -	{} /* terminator */
> -};
> -
>  static ssize_t cpumask_show(struct device *dev,
>  					 struct device_attribute *attr,
>  					 char *buf)
> @@ -529,14 +510,14 @@ static void dwc_pcie_unregister_pmu(void *data)
>  
>  static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
>  {
> -	const struct dwc_pcie_pmu_vsec_id *vid;
> +	const struct dwc_pcie_vsec_id *vid;
>  	u16 vsec;
>  	u32 val;
>  
>  	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
>  		return 0;
>  
> -	for (vid = dwc_pcie_pmu_vsec_ids; vid->vendor_id; vid++) {
> +	for (vid = dwc_pcie_rasdes_vsec_ids; vid->vendor_id; vid++) {
>  		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
>  						vid->vsec_id);
>  		if (vsec) {
> diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h
> new file mode 100644
> index 000000000000..40f3545731c8
> --- /dev/null
> +++ b/include/linux/pcie-dwc.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2021-2023 Alibaba Inc.
> + *
> + * Copyright 2025 Linaro Ltd.
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#ifndef LINUX_PCIE_DWC_H
> +#define LINUX_PCIE_DWC_H
> +
> +#include <linux/pci_ids.h>
> +
> +struct dwc_pcie_vsec_id {
> +	u16 vendor_id;
> +	u16 vsec_id;
> +	u8 vsec_rev;
> +};
> +
> +/*
> + * VSEC IDs are allocated by the vendor, so a given ID may mean different
> + * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
> + */
> +static const struct dwc_pcie_vsec_id dwc_pcie_rasdes_vsec_ids[] = {
> +	{ .vendor_id = PCI_VENDOR_ID_ALIBABA,
> +	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> +	{ .vendor_id = PCI_VENDOR_ID_AMPERE,
> +	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> +	{ .vendor_id = PCI_VENDOR_ID_QCOM,
> +	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> +	{} /* terminator */
> +};
> +
> +#endif /* LINUX_PCIE_DWC_H */
> -- 
> 2.17.1
> 

