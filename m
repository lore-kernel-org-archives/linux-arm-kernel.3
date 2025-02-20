Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6353C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YiPjJjyP/SfskdcyKsiE+Tu2gFKc0Gw/xXDAcrX5o4=; b=arJIW+CiYgWdWwnVLVRlSsqg5V
	QTivlLfI0zXqs0KK8avNoyWtFgDoK77w3PDQszpmdShMQaVBZ63Aq7/F1EBQy06E3sECsbu1Ze3yl
	mey3blZphsJjv106nf97RmEebrZfdjjbmeP29TkqfFKthDsB8C/765MsgglxrSGZqK+or1c2tuAyz
	NdmtKExnVD+EeWWKgpeIdo4tRJlCspTolpYExU4wYz/rjOGkq6M1LoKJLg0VL57wHraSoPu8mPklf
	O4iUxhHbE0pEt3titRp+akx5oIt57nGe3j5EdbifeHx1ufshXzBNorHWjNmfkF6Cx1xXI2+To56Ve
	YBIzR6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl12a-0000000HAud-1USs;
	Thu, 20 Feb 2025 07:32:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0yP-0000000H9mS-2BiO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 07:27:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220bff984a0so10454775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 23:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740036472; x=1740641272; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0YiPjJjyP/SfskdcyKsiE+Tu2gFKc0Gw/xXDAcrX5o4=;
        b=Xps4bLSDO+qNTfknJICTHGihkxTyF9Ti3GCh2VNIMXF4FujoXRTyrG75JJFo6LdEZj
         9VCFaDt2cs8Yk3Sp+Rg5Jhy2I9ZCillTFqJTzJZFXbLe0Lrc6G0u6Z/aS4bpk9usCC7h
         7U0e+OqTrbKrcaYpPdWNA7dUzqc2/FRFyoRMAag8vV+3fXynrx5ARCF61865SeMsBWfs
         Zm1Sav4/FlmwFeOyLD1N83iUjihEyL4j53DaG9HO9JPCIdF75/5eG/XMmy/NUO3X++jq
         1mQYjTpPvhKApdSiC4TvALrJoqDHl3dCAVm2FdqrhYd37rYvEArbn8bH9P+6WU0BWq0F
         0O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740036472; x=1740641272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0YiPjJjyP/SfskdcyKsiE+Tu2gFKc0Gw/xXDAcrX5o4=;
        b=K1QaV/tkp+8szGsZ38XuFLDkqLUfY1CXGrpBvgy4CLciAwJhWYj19VpxvkWMZRlJSB
         lSSNZfmcu9NSW0mbFkJUkrczwuTmM4PQfll8zvFAdASwrJ3CxBw6R7GuBtZi1uofJrFT
         X+qi5Paji9TQCT8W7osPZL3eWVotXuU2S2LK8nOyk4KjaQKu2SudNP9i99hAStT1cMzp
         7UdzzpgX81zZvoS4l+ZYq8A/5iDot50xgRPVoVFdTsmPN2b7Tfo14n2XTkp+noJQpj3R
         tiMxHIfE9L9kVAemhFRwziWuRGz//lcf5sSKjEiHB2zhkX3OZvJDTLIpn2jW6cuts4Q2
         rDgA==
X-Forwarded-Encrypted: i=1; AJvYcCW7pdu+3vcgTsJQEIn859yRXVyOYzel2w2P2g2WioyF8C6B25p+qYgNK15hCiFi3X78NONk4477MeoA3IFXB2Jp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqc8BfUxM9wdDRKWAGhJrgaPZyAxmm0E5GRA6UatXzaV7nQazd
	lHmUNCnVNKRqBvBi6N+UzqbCa/CZPafUhx9PeSRm9zCoPw7wvjXMhJtsAoGyew==
X-Gm-Gg: ASbGnctzlP0/Po3gq5tdHH/N0sQ4suD8TL4w9HaMYynKLX7N9Vk7SRMuzQ6mp/EnBdj
	+4cL+Dg6ctgfL284w903liKDag0k/hcJuqylnUh6huR4BV9U7fvOQPjQUmO7oNiMoCKrLWfxbMK
	IGHIb2b7CK3j33i3xKCqVJRIOq7hAICdg0GCljU0968g5X9fg+tMnegsfxQ1/jUX0aSHimG+GQj
	dENDsxWboCOZTKi8+fGBX4uWQTP9XGfKVBzT7vPJy0kEkGLLlo+X9i2rTg4UcyC+9NisZMS3oS5
	NSZk7MTfG5DjRf4Jh2bZerU19w==
X-Google-Smtp-Source: AGHT+IEbtwoZL/ZxWNIg3lz+aSPbQjpyQnSpBy7VKI7Jg+TnXQypLzMP3r745tdSDFVEJjlsB7KSqg==
X-Received: by 2002:a17:903:1a0e:b0:220:f1a1:b6e1 with SMTP id d9443c01a7336-22104028854mr364462485ad.19.1740036472649;
        Wed, 19 Feb 2025 23:27:52 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366242sm115665795ad.87.2025.02.19.23.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 23:27:52 -0800 (PST)
Date: Thu, 20 Feb 2025 12:57:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: 'Shuai Xue' <xueshuai@linux.alibaba.com>,
	'Jing Zhang' <renyu.zj@linux.alibaba.com>,
	'Will Deacon' <will@kernel.org>,
	'Mark Rutland' <mark.rutland@arm.com>,
	'Jingoo Han' <jingoohan1@gmail.com>,
	'Bjorn Helgaas' <bhelgaas@google.com>,
	'Lorenzo Pieralisi' <lpieralisi@kernel.org>,
	'Krzysztof =?utf-8?Q?Wilczy=C5=84ski'?= <kw@linux.com>,
	'Rob Herring' <robh@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] perf/dwc_pcie: Move common DWC struct definitions to
 'pcie-dwc.h'
Message-ID: <20250220072747.azfluj6mrkqy5osq@thinkpad>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
 <CGME20250218143703epcas5p2c0b9a60d17e030f7d3ce37c00c9b56ca@epcas5p2.samsung.com>
 <20250218-pcie-qcom-ptm-v1-1-16d7e480d73e@linaro.org>
 <02d901db835c$f0710450$d1530cf0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02d901db835c$f0710450$d1530cf0$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_232753_562235_2105CA12 
X-CRM114-Status: GOOD (  28.01  )
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

On Thu, Feb 20, 2025 at 11:31:49AM +0530, Shradha Todi wrote:
> 
> 
> > -----Original Message-----
> > From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
> > Sent: 18 February 2025 20:07
> > To: Shuai Xue <xueshuai@linux.alibaba.com>; Jing Zhang <renyu.zj@linux.alibaba.com>; Will Deacon <will@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>; Jingoo Han <jingoohan1@gmail.com>; Bjorn Helgaas <bhelgaas@google.com>; Lorenzo Pieralisi
> > <lpieralisi@kernel.org>; Krzysztof Wilczyński <kw@linux.com>; Rob Herring <robh@kernel.org>
> > Cc: Shradha Todi <shradha.t@samsung.com>; linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-perf-
> > users@vger.kernel.org; linux-pci@vger.kernel.org; linux-arm-msm@vger.kernel.org; Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org>
> > Subject: [PATCH 1/4] perf/dwc_pcie: Move common DWC struct definitions to 'pcie-dwc.h'
> > 
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Since these are common to all Desginware PCIe IPs, move them to a new header, 'pcie-dwc.h' so that other drivers could make use of
> > them.
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
> > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c index cccecae9823f..05b37ea7cf16 100644
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
> >  static u16 dwc_pcie_des_cap(struct pci_dev *pdev)  {
> > -	const struct dwc_pcie_pmu_vsec_id *vid;
> > +	const struct dwc_pcie_vsec_id *vid;
> >  	u16 vsec;
> >  	u32 val;
> > 
> > diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h new file mode 100644 index 000000000000..261ae11d75a4
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
> > + * VSEC IDs are allocated by the vendor, so a given ID may mean
> > +different
> > + * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
> > + */
> > +static const struct dwc_pcie_vsec_id dwc_pcie_pmu_vsec_ids[] = {
> 
> Rename this to dwc_pcie_rasdes_vsec_ids? pmu was perf file specific but technically the vsec is rasdes.
> 

Sure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

