Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E944EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 07:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQ8YbWKKN0JUEDEyejcT43K2AZBg1IVNzkk5e0M7RQ0=; b=yQhqG96RUMgZ2OFCxizuS2b96e
	93yOl3LebGGeQnO+NtsgXVsqeNnIpO5nbsHIr325RefVEQ1Lwx4KNPDcJQPv5snsR38jgRecKIFwH
	oRBBj4xX8MQcRciNWSPCKJaUjp36STMCAvGaoskE0jhFArYbaoQ7G6DANhHLtek02gm1deEFTaVYX
	ZWso65kRMubobpRsQ0aesMgCxkEL1OU02HyU1hJiamA70E0VAH/q1xyRfDsuUariVirJM4iN1gqeO
	GWRXM2DuLcWC2CvR1etZJMaTAzu2u1CvuNyVBSmnzMzpZhuHyk4OKVQlu+lyUdfbAjiWq/ixNEZaH
	ETqtUWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkexE-0000000BMu5-3BKZ;
	Wed, 19 Feb 2025 07:57:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkevk-0000000BMO9-0ZhW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 07:55:41 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-221050f3f00so75586085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 23:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739951739; x=1740556539; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KQ8YbWKKN0JUEDEyejcT43K2AZBg1IVNzkk5e0M7RQ0=;
        b=a0weQ48gBy4USJIGZ0eWOlOF8r/w66Uff04DErXD8qqR3DFpBVyrxDNKIg9JObXeQI
         BY5hRkSSolGXmv0+6xnybvnqyTgLK2ReMvyzT1IpcjkGvHlEZVhJ9G2n10VQxExPh+78
         HxUSt0y/qdlwfrBeHMRrMvhEqxAVCw3nHOdh9W96jyNloIHCXTk5KzSBpDDoL8H6Ny7O
         8ribvZci3VYZ1ODyPxJYS8rZAVQHvfOX+URa+doCrANBfE777LZ+oKAtl3Lh2rIhX9va
         DXXVdcTLaKs7Hh4pJ50aNjGFmWuJ0mgpPSNAmkY/SvBhKKmOgpogGFmaQvPAksrowOos
         t/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739951739; x=1740556539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQ8YbWKKN0JUEDEyejcT43K2AZBg1IVNzkk5e0M7RQ0=;
        b=lTjCLomAWcxjQ6AW31pRMvNGgJphXbbK5lRvyKvNUT5WpQi43mN3Gbg3QylEcU5zcG
         gGkgQlACEMUtx1NvLYQx+rSVZeG5XbOECHCq93bd1mjcg2pgAWtuWpFvi8HzX9gdVj/x
         ZvgIR80rUmigTMcXnQdKIK0Pkf1xMPv+AjF9I9TK7BraKRqiBLB1nyGBXiqxj1HBTMba
         N0Zkt/adqLm2c1EilevyJZfn6HbTKZiwickltwL2jIAik7K65cDfTlFrP3YryO2egIIM
         DyOyFEwDujS5kRiu7OPhaLeet8W2EBvlF7kYgSR3We50sX+2zY7GozD0F3U76ONj0ekM
         3kaA==
X-Forwarded-Encrypted: i=1; AJvYcCWp/83Qt6/jRlQp6cIINw56YxnXEMWBqdrd+YUpuTDNoai0BMD46zIE84wOSO0ZbgP2ATX/vVCM1oPfVJfj2AT6@lists.infradead.org
X-Gm-Message-State: AOJu0YwSsliJKhvYb8Ch2cm0WBae4/ySWOFzFg0JtLv3TG+rUGK8BCGH
	wZLULMLfQgjyOYc/fmCVDc6SNlh3nZnS7Q4KWRKxJ6wMIdzg1hxI87i3qKnGEA==
X-Gm-Gg: ASbGncudcDLPXIEt328fujj79xG3eQHrt7frgfhFQnfzlfCO6RqNIF4dgdw/IOlNPoD
	2jBkx9HgyBBmxncMmEpz8UgcnA6vGEa2ZAWEtaczCTCgQkNxauoxX5Wv/Q1IMLVucZINvZ51Ndi
	kE4/z1gVfKIwLSdUEcrvp+rsjoMr55Vpoybq2OVG9S54d4HI2BlGVq5L6oHvxdPs0uZOoWRoAea
	y1p8ju9KDBkv54ABmHXJhiHwMTKVqxertDdhQlnmwIPnrR6S/BEv3QMhkdmatjRwBM6UnsOg0u8
	Lq7o9hk51z81UGEpFbHpP9fcGmU=
X-Google-Smtp-Source: AGHT+IG4njE0mVfhwsbo461mQskQTrTqKLJp04nKx1lPyB6/OYKMHkjA+8znL3Lf5HXh3/3N1AgKoQ==
X-Received: by 2002:a17:903:283:b0:215:ae3d:1dd7 with SMTP id d9443c01a7336-221040269bbmr278400085ad.19.1739951739441;
        Tue, 18 Feb 2025 23:55:39 -0800 (PST)
Received: from thinkpad ([120.56.197.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53491ecsm99383825ad.9.2025.02.18.23.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:55:39 -0800 (PST)
Date: Wed, 19 Feb 2025 13:25:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] perf/dwc_pcie: Move common DWC struct definitions to
 'pcie-dwc.h'
Message-ID: <20250219075533.dqj4rqeskilg76lj@thinkpad>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
 <20250218-pcie-qcom-ptm-v1-1-16d7e480d73e@linaro.org>
 <4nnikepf7ay4ml3audn34gmq5jttjcfz3syfnxeowmjb4no2cj@lyawl4saa3sa>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4nnikepf7ay4ml3audn34gmq5jttjcfz3syfnxeowmjb4no2cj@lyawl4saa3sa>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_235540_179023_DAEB0A67 
X-CRM114-Status: GOOD (  30.45  )
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

On Tue, Feb 18, 2025 at 06:31:02PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 08:06:40PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Since these are common to all Desginware PCIe IPs, move them to a new
> > header, 'pcie-dwc.h' so that other drivers could make use of them.
> 
> Which drivers are going to use it? Please provide an explanation.
> 

I can certainly add reference as 'upcoming pcie-designware-sysfs' driver.

> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  MAINTAINERS                 |  1 +
> >  drivers/perf/dwc_pcie_pmu.c | 23 ++---------------------
> >  include/linux/pcie-dwc.h    | 34 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 37 insertions(+), 21 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 896a307fa065..b4d09d52a750 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18123,6 +18123,7 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
> >  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> >  F:	drivers/pci/controller/dwc/*designware*
> > +F:	include/linux/pcie-dwc.h
> >  
> >  PCI DRIVER FOR TI DRA7XX/J721E
> >  M:	Vignesh Raghavendra <vigneshr@ti.com>
> > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > index cccecae9823f..05b37ea7cf16 100644
> > --- a/drivers/perf/dwc_pcie_pmu.c
> > +++ b/drivers/perf/dwc_pcie_pmu.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> > +#include <linux/pcie-dwc.h>
> >  #include <linux/perf_event.h>
> >  #include <linux/pci.h>
> >  #include <linux/platform_device.h>
> > @@ -99,26 +100,6 @@ struct dwc_pcie_dev_info {
> >  	struct list_head dev_node;
> >  };
> >  
> > -struct dwc_pcie_pmu_vsec_id {
> > -	u16 vendor_id;
> > -	u16 vsec_id;
> > -	u8 vsec_rev;
> > -};
> > -
> > -/*
> > - * VSEC IDs are allocated by the vendor, so a given ID may mean different
> > - * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
> > - */
> > -static const struct dwc_pcie_pmu_vsec_id dwc_pcie_pmu_vsec_ids[] = {
> > -	{ .vendor_id = PCI_VENDOR_ID_ALIBABA,
> > -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> > -	{ .vendor_id = PCI_VENDOR_ID_AMPERE,
> > -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> > -	{ .vendor_id = PCI_VENDOR_ID_QCOM,
> > -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> > -	{} /* terminator */
> > -};
> > -
> >  static ssize_t cpumask_show(struct device *dev,
> >  					 struct device_attribute *attr,
> >  					 char *buf)
> > @@ -529,7 +510,7 @@ static void dwc_pcie_unregister_pmu(void *data)
> >  
> >  static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
> >  {
> > -	const struct dwc_pcie_pmu_vsec_id *vid;
> > +	const struct dwc_pcie_vsec_id *vid;
> >  	u16 vsec;
> >  	u32 val;
> >  
> > diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h
> > new file mode 100644
> > index 000000000000..261ae11d75a4
> > --- /dev/null
> > +++ b/include/linux/pcie-dwc.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2021-2023 Alibaba Inc.
> > + *
> > + * Copyright 2025 Linaro Ltd.
> > + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > + */
> > +
> > +#ifndef LINUX_PCIE_DWC_H
> > +#define LINUX_PCIE_DWC_H
> > +
> > +#include <linux/pci_ids.h>
> > +
> > +struct dwc_pcie_vsec_id {
> > +	u16 vendor_id;
> > +	u16 vsec_id;
> > +	u8 vsec_rev;
> > +};
> > +
> > +/*
> > + * VSEC IDs are allocated by the vendor, so a given ID may mean different
> > + * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
> > + */
> > +static const struct dwc_pcie_vsec_id dwc_pcie_pmu_vsec_ids[] = {
> 
> Having it in the header means that there are going to be several
> copies of this data. Is that expected?
> 

Yes. I wanted to consolidate these ids in a single file to make it easy to track
them. Otherwise, these are spread across different subsystems, making it harder
to maintain.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

