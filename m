Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAF0C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btU0w+uNVFHY2e6nf/JYninIaoVDv7TVqnoTKzlZWZc=; b=X2u0CJc/NH3iEiQ9jwa0SKYuHq
	3mFlzRZAgCzvVb1ZeEQe5rHg8slvf7gZCQFd79O6FcKbX3xY6xpVhNQFwXMZRgHsnSMqKxEmq7b8B
	p2xTZJBxkHFk8RtU5sEz5gMMy/blnrQwGdOddvVDDM1nfU2ItjP69oRVNvT2zQVoI39aK48E3kaH5
	sPo7VEBT2UlP4WIlaAG1WlwLkyHlWpXoa4sG0TKtXZbLS7OZAPoRnfqo+0YUyToSxGZjvEa7npPAh
	Nx8646O2ksJIOZm7r/3DOv/kP8SYEfz8rcwgk2MnCgOTEyK6tx2eARDpxWi+vI32KGaHHTuSAnnmB
	AjP3+AhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQWV-00000008z6M-1Zw8;
	Tue, 18 Feb 2025 16:32:39 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQV1-00000008yo1-3cl8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:31:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5439e331cceso6601235e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739896266; x=1740501066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=btU0w+uNVFHY2e6nf/JYninIaoVDv7TVqnoTKzlZWZc=;
        b=p4iGtBGu9hILcVd0kJAN9lsn57VJclOvG8QmF7ABeXJAP2wXMKEEA/Wgym/OcoVM6e
         8ccnyhu1I4lgzXxwKmsdt7AwudJb1r7483U0B3d5E9vp4luTkDRD7LRLvvFcuQVObWRW
         CzeI1pMCQFAjAm781UHVRpKDW8b1fKf8DkQkAmq63PWyn4lZG3Xq53wTShJQIzPEX8i5
         wd9+SKD0y3LF0yxmMBf0ujWaTUR/FisqcaXexBLuHJ9aV29H9QPpN4juF7vVE5FBzet3
         Ih23aq1+yH4T4Mnc1+sTLj9JqspZcKOrjgnFYU8mWP53Wbz+gLgHO9BzMaaFyzfLAwNc
         6hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896266; x=1740501066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btU0w+uNVFHY2e6nf/JYninIaoVDv7TVqnoTKzlZWZc=;
        b=dWnCiCDvJrIlrdKD3X9C0cZi/5qmbvQVrQhqL9vq2o51/jGpMuY342Q9uSsCL5D11Q
         sIUiRd1KnD1duBgY1ZsD4bTH9DU+o02OhQKUtGmv6SHtx7ke/sGKRS0y0x/JaenIrQJ6
         gO6WUpiAlMN61NccN7ulE31JCJAW5ESaB3o3o44E7Vt7VuJMsqd/lPq0fXx2Fm6Vc6OK
         B93QHHPZOMQrsUwNKiYLCqOGI9r5q5ey12LtgFOC+/+0NH6QbLWv9KcNpvA2qquPCUEV
         fTW97aeKHs6uHZioaVoCUGKMslYv+5CdVDi0NjyLkGqAR03ZlrmDMDOZeFaRCoZmgT/9
         2u3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW520or8i2R3VIPdspnZ0tLO4rNfC1SR743dazpB13uY4SzjsfaSZ+qO7EiZc3b9hUcUtsxK0i2sVDGWj0QZoxL@lists.infradead.org
X-Gm-Message-State: AOJu0YzV3UwZgp51++RoR2Gg63aULfkKdiWLE6XUHkihowUJNxJquh5w
	vB7Wb4s/SpB5GkuD4/sRGx0tHAJ58CJrN21F3doAPXP9kuwLqfr3gWMTSK4hYXI=
X-Gm-Gg: ASbGncvxiq3YIgEGh6ER9H0tTVgIBkFPb0CBFyNEYZoqISVnPg79Q+UnQigKAys2ihR
	d6i/M9ZZCvRoAg26gwfoLY47th9ev9G7nePqDFga1l8rIX2uhU0kkX+CittN9blf4oisL+8d3aX
	Ozl1oyrcE6vwRhozUWp89T4pumnmyIAf1zEE93MD/zsSMN7zluzurt9JIKp4pjpaOZdgYrYwDi9
	IaEGHEk55NRNoP0wBckYpEdab31ar+1jdml2lfhva2Tm1sRzygaHKddwrz8v3yJNNHRUpa0g/vZ
	zAABCkxdnF2NDdWD3q2MR3bSYwS2n+QR95b32ZbXzy2HWsuZYYMCt2F7vvNCbGTLQzgEPXw=
X-Google-Smtp-Source: AGHT+IEtC0aFiCVfXRyL9SzdaH9Q4MvJkCVZReT3BK5AY1Ni+JC9UVla9+Vl5hHTO/rCaSOKR4FQqA==
X-Received: by 2002:a05:6512:130b:b0:545:e19:ba12 with SMTP id 2adb3069b0e04-5462ef20f0dmr90751e87.51.1739896265862;
        Tue, 18 Feb 2025 08:31:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452fa00e6esm1360335e87.162.2025.02.18.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:31:04 -0800 (PST)
Date: Tue, 18 Feb 2025 18:31:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: manivannan.sadhasivam@linaro.org
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, 
	Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] perf/dwc_pcie: Move common DWC struct definitions to
 'pcie-dwc.h'
Message-ID: <4nnikepf7ay4ml3audn34gmq5jttjcfz3syfnxeowmjb4no2cj@lyawl4saa3sa>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
 <20250218-pcie-qcom-ptm-v1-1-16d7e480d73e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-pcie-qcom-ptm-v1-1-16d7e480d73e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_083107_906204_6559D62A 
X-CRM114-Status: GOOD (  26.49  )
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

On Tue, Feb 18, 2025 at 08:06:40PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Since these are common to all Desginware PCIe IPs, move them to a new
> header, 'pcie-dwc.h' so that other drivers could make use of them.

Which drivers are going to use it? Please provide an explanation.

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  MAINTAINERS                 |  1 +
>  drivers/perf/dwc_pcie_pmu.c | 23 ++---------------------
>  include/linux/pcie-dwc.h    | 34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 21 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..b4d09d52a750 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18123,6 +18123,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
>  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
>  F:	drivers/pci/controller/dwc/*designware*
> +F:	include/linux/pcie-dwc.h
>  
>  PCI DRIVER FOR TI DRA7XX/J721E
>  M:	Vignesh Raghavendra <vigneshr@ti.com>
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index cccecae9823f..05b37ea7cf16 100644
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
> @@ -529,7 +510,7 @@ static void dwc_pcie_unregister_pmu(void *data)
>  
>  static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
>  {
> -	const struct dwc_pcie_pmu_vsec_id *vid;
> +	const struct dwc_pcie_vsec_id *vid;
>  	u16 vsec;
>  	u32 val;
>  
> diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h
> new file mode 100644
> index 000000000000..261ae11d75a4
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
> +static const struct dwc_pcie_vsec_id dwc_pcie_pmu_vsec_ids[] = {

Having it in the header means that there are going to be several
copies of this data. Is that expected?

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
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

