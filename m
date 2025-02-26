Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB15C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 01:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYGXr6ObxBCz/rMlq9BwzU4N8B+1nvlSFrvEr4NdUT8=; b=lEGXjwKqf+FQawU3aU20CNnqxB
	hBD+3IJB4pd6aaXQXYJLF/XF5LznXxyWhHkTtS9/bIrHktEDdMNMBsvE8y9JBWrNsXvqsSluoN6u5
	OyvUck3vnCXAl7FYYjDTaj5GptpMTJISDENcTeCB37+Le8kwlfLO9QMAOc0qC7ipP93nkj+3wrOwY
	RZBdNsAa6ki5TqsJmq3b0mrCNhcJRim4XZW0/iRsEqjE/nTjnnFhzn07Iuc3DJyc17P8BHZiXcySx
	yv1zLad7ck5DmB6v9Q/yYNKEXns4rYicqGh23y0prAucHGX8FCGUq5CoVvvqHbHOKylAyk3p6g7Vp
	eOJ4DbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6ft-000000023kh-2uiR;
	Wed, 26 Feb 2025 01:57:25 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6eH-000000023TU-2wyL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 01:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740534941; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=SYGXr6ObxBCz/rMlq9BwzU4N8B+1nvlSFrvEr4NdUT8=;
	b=s6PnOyV5Hx1wWZTvJb0tZIGlPs8yLonlr32R2ycp9In8VbyRDmOjdAkUCTY32RWL9xZPnaq0BU7Jc5ltrr94LLb3ic84yL6k+iX0CVyNQbGTnZtIA4b560QO6dt2Fy6HmJkPsmb/Pfry1rKTXIXVZ7tlR7OW6Az3uZuZR/Nbvcs=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WQGACDe_1740534937 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 26 Feb 2025 09:55:38 +0800
Message-ID: <855b4178-cbd5-4d95-a2eb-32c5ee0e5894@linux.alibaba.com>
Date: Wed, 26 Feb 2025 09:55:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] perf/dwc_pcie: Move common DWC struct definitions
 to 'pcie-dwc.h'
To: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
 robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
 Jonathan.Cameron@Huawei.com, fan.ni@samsung.com, nifan.cxl@gmail.com,
 a.manzanares@samsung.com, pankaj.dubey@samsung.com, cassel@kernel.org,
 18255117159@163.com, renyu.zj@linux.alibaba.com, will@kernel.org,
 mark.rutland@arm.com
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132024epcas5p13d6e617805e4ef0c081227b08119871b@epcas5p1.samsung.com>
 <20250221131548.59616-2-shradha.t@samsung.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250221131548.59616-2-shradha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_175546_482650_E9F51CA3 
X-CRM114-Status: GOOD (  20.65  )
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



在 2025/2/21 21:15, Shradha Todi 写道:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Since these are common to all Desginware PCIe IPs, move them to a new
> header 'pcie-dwc.h', so that other drivers like debugfs, perf and sysfs
> could make use of them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>   MAINTAINERS                 |  1 +
>   drivers/perf/dwc_pcie_pmu.c | 25 +++----------------------
>   include/linux/pcie-dwc.h    | 34 ++++++++++++++++++++++++++++++++++
>   3 files changed, 38 insertions(+), 22 deletions(-)
>   create mode 100644 include/linux/pcie-dwc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3864d473f52f..6474a2d83de4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18167,6 +18167,7 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
>   F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
>   F:	drivers/pci/controller/dwc/*designware*
> +F:	include/linux/pcie-dwc.h
>   
>   PCI DRIVER FOR TI DRA7XX/J721E
>   M:	Vignesh Raghavendra <vigneshr@ti.com>
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index cccecae9823f..da30f2c2d674 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -13,6 +13,7 @@
>   #include <linux/errno.h>
>   #include <linux/kernel.h>
>   #include <linux/list.h>
> +#include <linux/pcie-dwc.h>
>   #include <linux/perf_event.h>
>   #include <linux/pci.h>
>   #include <linux/platform_device.h>
> @@ -99,26 +100,6 @@ struct dwc_pcie_dev_info {
>   	struct list_head dev_node;
>   };
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
>   static ssize_t cpumask_show(struct device *dev,
>   					 struct device_attribute *attr,
>   					 char *buf)
> @@ -529,14 +510,14 @@ static void dwc_pcie_unregister_pmu(void *data)
>   
>   static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
>   {
> -	const struct dwc_pcie_pmu_vsec_id *vid;
> +	const struct dwc_pcie_vsec_id *vid;
>   	u16 vsec;
>   	u32 val;
>   
>   	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
>   		return 0;
>   
> -	for (vid = dwc_pcie_pmu_vsec_ids; vid->vendor_id; vid++) {
> +	for (vid = dwc_pcie_rasdes_vsec_ids; vid->vendor_id; vid++) {
>   		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
>   						vid->vsec_id);
>   		if (vsec) {
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

LGTM. Thanks.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Shuai

