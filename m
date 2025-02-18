Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC39C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YI+znzuuXksA7qnH+pwXOwBdUnfrRNphP1Aa+shefSI=; b=pwMSGHULzYmbiUoy+bPHGQuXwb
	6M5lx6/sGHLVcjew73uNnWiXkzdHil3RRlfMZxZT/5Ts7VS3wiqmbWkULfxY3OxfcXCntysOOJrjv
	4ewktKiBX8bHnaN6Vuio3HHCRQ1+1iYRc/PW/Hq3SSr70SAm8+Wshxou0SB4y1Kk1zvVtH2r7o8lB
	5hSzJrZhmx3nCtDy4NX4uzxLt/eHg4tI9p9lN87/Gf9lrhoFkxm1TPgyNS553eQIhazvcx/hYvWKt
	5+28lGz9Rq+5SbAIZ/kTwxojlWw+qkwClGKp/g2ZHTFK4RJ1tg73u1GsqawxyFvFhCzAoIbogBoYI
	Dv4/xlTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRpv-00000009FZt-48XF;
	Tue, 18 Feb 2025 17:56:47 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRnh-00000009FEI-1lBA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:54:30 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30918c29da2so48279431fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 09:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739901267; x=1740506067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YI+znzuuXksA7qnH+pwXOwBdUnfrRNphP1Aa+shefSI=;
        b=yOTOv1z7AYpjP4ooNMgHoRz6FSoiBiP6GX5Pixbosu0oP67c1+EQSMuuGhPIFH78i2
         VJpD1EDcpPW257m+tBfymYOe58mN+5fK+MT+fOgT2qfid950OVPnRcXwOgfqWxxmedXI
         BZpIyLZJVzFyEiUgft92iRbk5Pt/BFBdcTyNgcwhRuGWqBtAlmnQEItMOU66D45vMkTn
         rS8vdiNkJxpqhSF32VTs2fG5ivpZ9nzPJlKW7n+mijVpE8sBXBaX2C7v/JHEIDI7MuCy
         bSmZ42PBFIzeV9vImwsnFKjIrY3+bcIFT1kar/Ba1It7uvMmFQsrWa6vOukQzdnmzmzE
         NdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901267; x=1740506067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YI+znzuuXksA7qnH+pwXOwBdUnfrRNphP1Aa+shefSI=;
        b=vwHvAZbg/V62IzR9NUAAfzzaREZVOeO3YoIUj0GvKubSsxZRalKfuFyU7hMJMhhpsZ
         oHJz0FQwTojrt3ltHl7yzJQGX17gaxXkwrpt5H6p2EGrodmOOMAbwiwF+cZ0FPMHfXj/
         VHPTVOgRMTdEp3uDR/EwaDzx7J/58mcQYsBSSSay6hQb3LZR5ej1SeAu0Z9d44F4DNaE
         2myNSI69lyoRBMtCdAStQpSM76DVu1+K01c7vDrLfW4iys0msKpPvpTcY1JhBTnFuUm9
         Dww9X6fzOToljXJd9tcYOsehJIJwpZjxCQl3fVGyH/bIu9m4MJdZiBTrr5hidICweFq5
         eOCw==
X-Forwarded-Encrypted: i=1; AJvYcCWV9vSQEay5zr+3VIrc5nz7as+jBhYI4e+Cr/KHBDMvE9x3R0BxOSyWbCNNmd/ZMSCWJ+GUNY1TRLoEN/4hA6Q9@lists.infradead.org
X-Gm-Message-State: AOJu0YwpGdN6Y84bZw5KQEHSFjtJvqQwelvyQUH9BerHP+4q8h3+vck3
	gM7aeOHyXxhoNr1rotxB9xHFlpA4YATsdwbwZEpvdfuF1A/4Ycm2ENuh8DUGCSU=
X-Gm-Gg: ASbGncvQvOE5DjrSIfIlq1iPlMb0FD2tPgniQT4JGqPGzdfkqbeZTNh+bLwuBlCJcFC
	wCYe3XWVg25ClqL+zpEA+eYVdu2SO0TtO7UsxHTOt2bzO6DfdjJctXsT0EBOeo6VuJGbjaOP7eX
	kWDdr08zVEPmKOKRfd+N8yIKcwiy2KeiuThfvI4sKx0g8BAQgBldlGewRh6K4JBAPrt3BxI93tc
	+5P9g4RPWziEJSNN2JM/Q4g3KFBF1OndC9WSP9XARbxlsPtonWMt3XdrXfCZG0irKIC5E3XDPr9
	W2uUh1m+GbYxF3g2Cl8WCO9UObcJ6jFnBS8zHNFGIqxS8JFbp+Fg//ZY4dc3VSZDBsp+gOA=
X-Google-Smtp-Source: AGHT+IGgS2rblfca+YLr7ikEH5fosM1HrQ1yesZD3FLHOUzZMq39lE7Z3Ptzi8ujTytXRTzK6lCM7Q==
X-Received: by 2002:a2e:878c:0:b0:2ff:e7c3:9e2e with SMTP id 38308e7fff4ca-30927a6f5d5mr43954511fa.17.1739901267137;
        Tue, 18 Feb 2025 09:54:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a25195701sm11365691fa.4.2025.02.18.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:54:26 -0800 (PST)
Date: Tue, 18 Feb 2025 19:54:24 +0200
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
Subject: Re: [PATCH 3/4] PCI: dwc: Add sysfs support for PTM
Message-ID: <qvkpasuxn54dpsvsq6vinuyjvnphvnvfcedqzvmhkpgbrgurvm@7e55l7rkkqo4>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
 <20250218-pcie-qcom-ptm-v1-3-16d7e480d73e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-pcie-qcom-ptm-v1-3-16d7e480d73e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_095429_481506_3CD9A0F0 
X-CRM114-Status: GOOD (  41.55  )
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

On Tue, Feb 18, 2025 at 08:06:42PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Precision Time Management (PTM) mechanism defined in PCIe spec r6.0,
> sec 6.22 allows precise coordination of timing information across multiple
> components in a PCIe hierarchy with independent local time clocks.
> 
> While the PTM support itself is indicated by the presence of PTM Extended
> Capability structure, Synopsys Designware IPs expose the PTM context
> (timing information) through Vendor Specific Extended Capability (VSEC)
> registers.
> 
> Hence, add the sysfs support to expose the PTM context information to
> userspace from both PCIe RC and EP controllers. Below PTM context are
> exposed through sysfs:
> 
> PCIe RC
> =======
> 
> 1. PTM Local clock
> 2. PTM T2 timestamp
> 3. PTM T3 timestamp
> 4. PTM Context valid
> 
> PCIe EP
> =======
> 
> 1. PTM Local clock
> 2. PTM T1 timestamp
> 3. PTM T4 timestamp
> 4. PTM Master clock
> 5. PTM Context update
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/ABI/testing/sysfs-platform-dwc-pcie  |  70 ++++++
>  MAINTAINERS                                        |   1 +
>  drivers/pci/controller/dwc/Makefile                |   2 +-
>  drivers/pci/controller/dwc/pcie-designware-ep.c    |   3 +
>  drivers/pci/controller/dwc/pcie-designware-host.c  |   4 +
>  drivers/pci/controller/dwc/pcie-designware-sysfs.c | 278 +++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.c       |   6 +
>  drivers/pci/controller/dwc/pcie-designware.h       |  22 ++
>  include/linux/pcie-dwc.h                           |   8 +
>  9 files changed, 393 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-dwc-pcie b/Documentation/ABI/testing/sysfs-platform-dwc-pcie
> new file mode 100644
> index 000000000000..6b429108cd09
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-dwc-pcie

Should be a class or just a ptm group in the PCIe controller device? How
generic are those attributes?

> @@ -0,0 +1,70 @@
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_local_clock
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM local clock in nanoseconds. Applicable for both Root
> +		Complex and Endpoint mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_master_clock
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM master clock in nanoseconds. Applicable only for
> +		Endpoint mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_t1
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM T1 timestamp in nanoseconds. Applicable only for
> +		Endpoint mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_t2
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM T2 timestamp in nanoseconds. Applicable only for
> +		Root Complex mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_t3
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM T3 timestamp in nanoseconds. Applicable only for
> +		Root Complex mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_t4
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM T4 timestamp in nanoseconds. Applicable only for
> +		Endpoint mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_context_update
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RW) Control the PTM context update mode. Applicable only for
> +		Endpoint mode.
> +
> +		Following values are supported:
> +
> +		* auto = PTM context auto update trigger for every 10ms
> +
> +		* manual = PTM context manual update. Writing 'manual' to this
> +			   file triggers PTM context update (default)
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_context_valid
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RW) Control the PTM context validity (local clock timing).
> +		Applicable only for Root Complex mode. PTM context is
> +		invalidated by hardware if the Root Complex enters low power
> +		mode or changes link frequency.
> +
> +		Following values are supported:
> +
> +		* 0 = PTM context invalid (default)
> +
> +		* 1 = PTM context valid
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b4d09d52a750..1c3e21cfbc6e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18120,6 +18120,7 @@ M:	Jingoo Han <jingoohan1@gmail.com>
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  L:	linux-pci@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-platform-dwc-pcie
>  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
>  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
>  F:	drivers/pci/controller/dwc/*designware*

[...]

> +
> +static struct attribute *ptm_attrs[] = {
> +	&dev_attr_ptm_context_update.attr,
> +	&dev_attr_ptm_context_valid.attr,
> +	&dev_attr_ptm_local_clock.attr,
> +	&dev_attr_ptm_master_clock.attr,
> +	&dev_attr_ptm_t1.attr,
> +	&dev_attr_ptm_t2.attr,
> +	&dev_attr_ptm_t3.attr,
> +	&dev_attr_ptm_t4.attr,
> +	NULL
> +};
> +
> +static umode_t ptm_attr_visible(struct kobject *kobj, struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct dw_pcie *pci = dev_get_drvdata(dev);
> +
> +	/* RC only needs local, t2 and t3 clocks and context_valid */
> +	if ((attr == &dev_attr_ptm_t1.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> +	    (attr == &dev_attr_ptm_t4.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> +	    (attr == &dev_attr_ptm_master_clock.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> +	    (attr == &dev_attr_ptm_context_update.attr && pci->mode == DW_PCIE_RC_TYPE))
> +		return 0;

The pci->mode checks definitely can be refactored to a top-level instead
of being repeated on each line.

> +
> +	/* EP only needs local, master, t1, and t4 clocks and context_update */
> +	if ((attr == &dev_attr_ptm_t2.attr && pci->mode == DW_PCIE_EP_TYPE) ||
> +	    (attr == &dev_attr_ptm_t3.attr && pci->mode == DW_PCIE_EP_TYPE) ||
> +	    (attr == &dev_attr_ptm_context_valid.attr && pci->mode == DW_PCIE_EP_TYPE))
> +		return 0;
> +
> +	return attr->mode;

I think it might be better to register two separate groups, one for RC,
one for EP and use presense of the corresponding capability in the
.is_visible callback to check if the PTM attributes should be visible at
all.

> +}
> +
> +static const struct attribute_group ptm_attr_group = {
> +	.name = "ptm",
> +	.attrs = ptm_attrs,
> +	.is_visible = ptm_attr_visible,
> +};
> +
> +static const struct attribute_group *dwc_pcie_attr_groups[] = {
> +	&ptm_attr_group,
> +	NULL,
> +};
> +
> +static void pcie_designware_sysfs_release(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
> +void pcie_designware_sysfs_init(struct dw_pcie *pci,
> +				    enum dw_pcie_device_mode mode)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	/* Check for capabilities before creating sysfs attrbutes */
> +	ret = dw_pcie_find_ptm_capability(pci);
> +	if (!ret) {
> +		dev_dbg(pci->dev, "PTM capability not present\n");
> +		return;
> +	}
> +
> +	pci->ptm_vsec_offset = ret;
> +	pci->mode = mode;
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return;
> +
> +	device_initialize(dev);
> +	dev->groups = dwc_pcie_attr_groups;
> +	dev->release = pcie_designware_sysfs_release;
> +	dev->parent = pci->dev;
> +	dev_set_drvdata(dev, pci);
> +
> +	ret = dev_set_name(dev, "dwc");
> +	if (ret)
> +		goto err_free;
> +
> +	ret = device_add(dev);
> +	if (ret)
> +		goto err_free;
> +
> +	pci->sysfs_dev = dev;

Why do you need to add a new device under the PCIe controller?

> +
> +	return;
> +
> +err_free:
> +	put_device(dev);
> +}
> +
> +void pcie_designware_sysfs_exit(struct dw_pcie *pci)
> +{
> +	if (pci->sysfs_dev)
> +		device_unregister(pci->sysfs_dev);
> +}
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index a7c0671c6715..30825ec0648e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -323,6 +323,12 @@ static u16 dw_pcie_find_vsec_capability(struct dw_pcie *pci,
>  	return 0;
>  }
>  
> +u16 dw_pcie_find_ptm_capability(struct dw_pcie *pci)
> +{
> +	return dw_pcie_find_vsec_capability(pci, dwc_pcie_ptm_vsec_ids);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_find_ptm_capability);

This API should go into the previous patch. Otherwise it will result in
unused function warnings.

> +
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val)
>  {
>  	if (!IS_ALIGNED((uintptr_t)addr, size)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 501d9ddfea16..7d3cbdce37c8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -260,6 +260,21 @@
>  
>  #define PCIE_RAS_DES_EVENT_COUNTER_DATA		0xc
>  
> +/* PTM register definitions */
> +#define PTM_RES_REQ_CTRL		0x8
> +#define PTM_RES_CCONTEXT_VALID		BIT(0)
> +#define PTM_REQ_AUTO_UPDATE_ENABLED	BIT(0)
> +#define PTM_REQ_START_UPDATE		BIT(1)
> +
> +#define PTM_LOCAL_LSB			0x10
> +#define PTM_LOCAL_MSB			0x14
> +#define PTM_T1_T2_LSB			0x18
> +#define PTM_T1_T2_MSB			0x1c
> +#define PTM_T3_T4_LSB			0x28
> +#define PTM_T3_T4_MSB			0x2c
> +#define PTM_MASTER_LSB			0x38
> +#define PTM_MASTER_MSB			0x3c
> +
>  /*
>   * The default address offset between dbi_base and atu_base. Root controller
>   * drivers are not required to initialize atu_base if the offset matches this
> @@ -439,6 +454,7 @@ struct dw_pcie_ops {
>  
>  struct dw_pcie {
>  	struct device		*dev;
> +	struct device		*sysfs_dev;
>  	void __iomem		*dbi_base;
>  	resource_size_t		dbi_phys_addr;
>  	void __iomem		*dbi_base2;
> @@ -464,6 +480,8 @@ struct dw_pcie {
>  	struct reset_control_bulk_data	app_rsts[DW_PCIE_NUM_APP_RSTS];
>  	struct reset_control_bulk_data	core_rsts[DW_PCIE_NUM_CORE_RSTS];
>  	struct gpio_desc		*pe_rst;
> +	u16			ptm_vsec_offset;
> +	enum			dw_pcie_device_mode mode;
>  	bool			suspended;
>  };
>  
> @@ -478,6 +496,7 @@ void dw_pcie_version_detect(struct dw_pcie *pci);
>  
>  u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
>  u16 dw_pcie_find_ext_capability(struct dw_pcie *pci, u8 cap);
> +u16 dw_pcie_find_ptm_capability(struct dw_pcie *pci);
>  
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val);
>  int dw_pcie_write(void __iomem *addr, int size, u32 val);
> @@ -499,6 +518,9 @@ void dw_pcie_setup(struct dw_pcie *pci);
>  void dw_pcie_iatu_detect(struct dw_pcie *pci);
>  int dw_pcie_edma_detect(struct dw_pcie *pci);
>  void dw_pcie_edma_remove(struct dw_pcie *pci);
> +void pcie_designware_sysfs_init(struct dw_pcie *pci,
> +				enum dw_pcie_device_mode mode);
> +void pcie_designware_sysfs_exit(struct dw_pcie *pci);
>  
>  static inline void dw_pcie_writel_dbi(struct dw_pcie *pci, u32 reg, u32 val)
>  {
> diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h
> index 261ae11d75a4..13835896290a 100644
> --- a/include/linux/pcie-dwc.h
> +++ b/include/linux/pcie-dwc.h
> @@ -31,4 +31,12 @@ static const struct dwc_pcie_vsec_id dwc_pcie_pmu_vsec_ids[] = {
>  	{} /* terminator */
>  };
>  
> +static const struct dwc_pcie_vsec_id dwc_pcie_ptm_vsec_ids[] = {
> +	{ .vendor_id = PCI_VENDOR_ID_QCOM, /* EP */
> +	  .vsec_id = 0x03, .vsec_rev = 0x1 },
> +	{ .vendor_id = PCI_VENDOR_ID_QCOM, /* RC */
> +	  .vsec_id = 0x04, .vsec_rev = 0x1 },
> +	{ }
> +};
> +
>  #endif /* LINUX_PCIE_DWC_H */
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

