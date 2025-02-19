Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD6CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsT69ZOLMdFZIvD1YxUdjLqp4nB+JO3UK8B0xhjxIJ4=; b=pWrtVeyUZh1tbeZwOuH8pC8jzC
	4OvLX9Ctw5efprP5LCgopxEvT00wDJZV38qQuUvftEQgvHw8ooi6EUOUbM66xaia5rK2wzZ1Uh+Tz
	e+LLLPWkV5vvvCO6q15V/6FQeBGeyaDixmUuZQj8cIMaurGDvuqqwpMRDDr2ZG1urcb75jIHD9kjg
	VBgCey5xzzCbOCXQQExIBO09WZbtU/Vs/kmhQI3HtPWG8ObvsdZJKYG9+5LoCSXZ8ULS5EDTv82Jq
	vn1DENx7CSB+FiCioPqde4V9/WWliNrPmEswGxaM4Xeoyo4FyVk/pqsV5C2bAP7jJ3icHPWJctrG3
	WcbBsqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfSi-0000000BWyU-3qo8;
	Wed, 19 Feb 2025 08:29:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfEB-0000000BS7L-2uKj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:14:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-219f8263ae0so117679365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 00:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739952883; x=1740557683; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsT69ZOLMdFZIvD1YxUdjLqp4nB+JO3UK8B0xhjxIJ4=;
        b=K18TB7hoobU6RDiQXOHaR4N1kikwreBci+sHHkKoTmCcJo3aw8YHqsQ3P2RO+CNBVB
         MSKYhKlnM/rVr44Xk4fjorVqkclfLm4vUz3lpW7ZwTGWemIgSgKFQdG8zAUVYZ6rtlsw
         ArrNDMqaTHA0+tkAL2OBhlcucA8o76AwC6q7PBUUlNqwtkWmbvBFs1JUSw5XoFOoC/QT
         bSFuh51/KgfXsxx3zTpezvgtgEBFLmimGEGBZUvd7hjrckbFfDpswjbk65R9vBPr8ZSN
         1meJJkVVrNRN1p7ZrNtmPTh0FbLr6gtFWDWry/ARvrxiccxyFQg51fqS7J9i8kMtKnTx
         pzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739952883; x=1740557683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsT69ZOLMdFZIvD1YxUdjLqp4nB+JO3UK8B0xhjxIJ4=;
        b=qVSIhlNlvFEunBDGn1+EmEu65ltHnJ1SBDRj42KhenhihcwSFXdWE7iPr+7CMj0Oaq
         Eyc49mQdW3xj5AVzWpD4W8Yhkwxwl9jsbeMPhvK2pA8GXyyTIQB2GsZFjduRrvloLC/Z
         /DGbX2lGCx90SLmrHmDZPFgwiR0nJv1snsITFitXmjHwn9zZHgRGuWS6jkPW9P5pEEBm
         abgG6Gqh3coXGKqOjWT9Y84ACOrpVvhWIbreF0cqkUrimNJrqsungA4HbhF5HwvZU0Gl
         oacm/nMNzA7wJiIzBPbvO9wLc7NLB9gR4zzE+ZE7jZOkhAxfV/SnD1NCscCdTnZi50Eb
         KSbg==
X-Forwarded-Encrypted: i=1; AJvYcCXLtqosx2qiDcsO8QdZQzbdQ9ZbcaipLbELcD7eUMnLTvnwsCufnEQjJsrXfYhoxMhLnaMkKGkLPDOCTDdNjSyD@lists.infradead.org
X-Gm-Message-State: AOJu0YzjcnCY6Nhx2CMBrNhskrJlcFcFIht5zm3LYG3402YwVsnuQ/1T
	tjGLAEO1jz9EpTArDo5ca3ly0E+uuhzo/bIVOl94MvfNnv5vBRyH2i2dUV4cCA==
X-Gm-Gg: ASbGnct2UHw2NxvbtuE3Bi7ntpGUslqi7Xi5YwbWVxxemjHOUsNlfBct1rt1R2W/39P
	i8ryeNvAR6OMWK8EFRckEZK5nuGZkqlnB7HKllDx1KuD2BjdbMcCFf+C4QYVc48QVUQCSSYblJn
	kNt+M3HhG8tkxLrtb1uEpxbfA9DoexsSVf3jJZquIA4GNBVwexc0uHFFQpak6RJNqPlLzRBJidP
	T2TLsEklTq967t0xwlLVtgapGY5WKdoHA6PZYx5GBZsbeE1oa+hkVyj1v6XoLs+vYKVYhiAOq2+
	poQ9daBPPz2Qf0sJLWcFJ1CC+a8=
X-Google-Smtp-Source: AGHT+IENOnfR6SSjOBhgQxo3L/XeWd+wkkORnG1gESsnoAjwgiA1eIzRjF76GYaTtPte8EUQzIdbFg==
X-Received: by 2002:a17:903:1a2d:b0:220:c813:dfd1 with SMTP id d9443c01a7336-221040bd77bmr283520705ad.36.1739952882676;
        Wed, 19 Feb 2025 00:14:42 -0800 (PST)
Received: from thinkpad ([120.56.197.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22178514287sm4640175ad.175.2025.02.19.00.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:14:42 -0800 (PST)
Date: Wed, 19 Feb 2025 13:44:36 +0530
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
Subject: Re: [PATCH 3/4] PCI: dwc: Add sysfs support for PTM
Message-ID: <20250219081436.ivllsfctvjgtyu25@thinkpad>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
 <20250218-pcie-qcom-ptm-v1-3-16d7e480d73e@linaro.org>
 <qvkpasuxn54dpsvsq6vinuyjvnphvnvfcedqzvmhkpgbrgurvm@7e55l7rkkqo4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qvkpasuxn54dpsvsq6vinuyjvnphvnvfcedqzvmhkpgbrgurvm@7e55l7rkkqo4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001443_737741_0129EE4E 
X-CRM114-Status: GOOD (  46.58  )
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

On Tue, Feb 18, 2025 at 07:54:24PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 08:06:42PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Precision Time Management (PTM) mechanism defined in PCIe spec r6.0,
> > sec 6.22 allows precise coordination of timing information across multiple
> > components in a PCIe hierarchy with independent local time clocks.
> > 
> > While the PTM support itself is indicated by the presence of PTM Extended
> > Capability structure, Synopsys Designware IPs expose the PTM context
> > (timing information) through Vendor Specific Extended Capability (VSEC)
> > registers.
> > 
> > Hence, add the sysfs support to expose the PTM context information to
> > userspace from both PCIe RC and EP controllers. Below PTM context are
> > exposed through sysfs:
> > 
> > PCIe RC
> > =======
> > 
> > 1. PTM Local clock
> > 2. PTM T2 timestamp
> > 3. PTM T3 timestamp
> > 4. PTM Context valid
> > 
> > PCIe EP
> > =======
> > 
> > 1. PTM Local clock
> > 2. PTM T1 timestamp
> > 3. PTM T4 timestamp
> > 4. PTM Master clock
> > 5. PTM Context update
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/ABI/testing/sysfs-platform-dwc-pcie  |  70 ++++++
> >  MAINTAINERS                                        |   1 +
> >  drivers/pci/controller/dwc/Makefile                |   2 +-
> >  drivers/pci/controller/dwc/pcie-designware-ep.c    |   3 +
> >  drivers/pci/controller/dwc/pcie-designware-host.c  |   4 +
> >  drivers/pci/controller/dwc/pcie-designware-sysfs.c | 278 +++++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-designware.c       |   6 +
> >  drivers/pci/controller/dwc/pcie-designware.h       |  22 ++
> >  include/linux/pcie-dwc.h                           |   8 +
> >  9 files changed, 393 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-platform-dwc-pcie b/Documentation/ABI/testing/sysfs-platform-dwc-pcie
> > new file mode 100644
> > index 000000000000..6b429108cd09
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-dwc-pcie
> 
> Should be a class or just a ptm group in the PCIe controller device? How
> generic are those attributes?
> 

Even though these are generic attributes, the way PTM support is exposed in
kernel right now makes it harder to make these as generic attributes. These
attributes are specific to RC/EP controllers and the generic PTM driver is for
endpoint devices. Maybe I could think of exposing it for RC/EP controller
drivers (not just DWC). But still then these would be exposed as a group under
each platform device.

> > @@ -0,0 +1,70 @@
> > +What:		/sys/devices/platform/*/dwc/ptm/ptm_local_clock
> > +Date:		February 2025
> > +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +Description:
> > +		(RO) PTM local clock in nanoseconds. Applicable for both Root
> > +		Complex and Endpoint mode.

[...]

> > +static umode_t ptm_attr_visible(struct kobject *kobj, struct attribute *attr,
> > +				int n)
> > +{
> > +	struct device *dev = container_of(kobj, struct device, kobj);
> > +	struct dw_pcie *pci = dev_get_drvdata(dev);
> > +
> > +	/* RC only needs local, t2 and t3 clocks and context_valid */
> > +	if ((attr == &dev_attr_ptm_t1.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> > +	    (attr == &dev_attr_ptm_t4.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> > +	    (attr == &dev_attr_ptm_master_clock.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> > +	    (attr == &dev_attr_ptm_context_update.attr && pci->mode == DW_PCIE_RC_TYPE))
> > +		return 0;
> 
> The pci->mode checks definitely can be refactored to a top-level instead
> of being repeated on each line.
> 

Ok.

> > +
> > +	/* EP only needs local, master, t1, and t4 clocks and context_update */
> > +	if ((attr == &dev_attr_ptm_t2.attr && pci->mode == DW_PCIE_EP_TYPE) ||
> > +	    (attr == &dev_attr_ptm_t3.attr && pci->mode == DW_PCIE_EP_TYPE) ||
> > +	    (attr == &dev_attr_ptm_context_valid.attr && pci->mode == DW_PCIE_EP_TYPE))
> > +		return 0;
> > +
> > +	return attr->mode;
> 
> I think it might be better to register two separate groups, one for RC,
> one for EP and use presense of the corresponding capability in the
> .is_visible callback to check if the PTM attributes should be visible at
> all.
> 

What benefit does it provide? I did thought about this idea, but then I didn't
find useful since the top level platform device (RC/EP) should itself
distinguish between PTM requester and responder. So one more differentiation
seemed overkill to me.

> > +}
> > +
> > +static const struct attribute_group ptm_attr_group = {
> > +	.name = "ptm",
> > +	.attrs = ptm_attrs,
> > +	.is_visible = ptm_attr_visible,
> > +};
> > +
> > +static const struct attribute_group *dwc_pcie_attr_groups[] = {
> > +	&ptm_attr_group,
> > +	NULL,
> > +};
> > +
> > +static void pcie_designware_sysfs_release(struct device *dev)
> > +{
> > +	kfree(dev);
> > +}
> > +
> > +void pcie_designware_sysfs_init(struct dw_pcie *pci,
> > +				    enum dw_pcie_device_mode mode)
> > +{
> > +	struct device *dev;
> > +	int ret;
> > +
> > +	/* Check for capabilities before creating sysfs attrbutes */
> > +	ret = dw_pcie_find_ptm_capability(pci);
> > +	if (!ret) {
> > +		dev_dbg(pci->dev, "PTM capability not present\n");
> > +		return;
> > +	}
> > +
> > +	pci->ptm_vsec_offset = ret;
> > +	pci->mode = mode;
> > +
> > +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> > +	if (!dev)
> > +		return;
> > +
> > +	device_initialize(dev);
> > +	dev->groups = dwc_pcie_attr_groups;
> > +	dev->release = pcie_designware_sysfs_release;
> > +	dev->parent = pci->dev;
> > +	dev_set_drvdata(dev, pci);
> > +
> > +	ret = dev_set_name(dev, "dwc");
> > +	if (ret)
> > +		goto err_free;
> > +
> > +	ret = device_add(dev);
> > +	if (ret)
> > +		goto err_free;
> > +
> > +	pci->sysfs_dev = dev;
> 
> Why do you need to add a new device under the PCIe controller?
> 

Just because we cannot reference the 'struct dw_pcie' from the 'struct device'
belonging to the platform device. All the controller drivers are already setting
their own private structure as drvdata.

> > +
> > +	return;
> > +
> > +err_free:
> > +	put_device(dev);
> > +}
> > +
> > +void pcie_designware_sysfs_exit(struct dw_pcie *pci)
> > +{
> > +	if (pci->sysfs_dev)
> > +		device_unregister(pci->sysfs_dev);
> > +}
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index a7c0671c6715..30825ec0648e 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -323,6 +323,12 @@ static u16 dw_pcie_find_vsec_capability(struct dw_pcie *pci,
> >  	return 0;
> >  }
> >  
> > +u16 dw_pcie_find_ptm_capability(struct dw_pcie *pci)
> > +{
> > +	return dw_pcie_find_vsec_capability(pci, dwc_pcie_ptm_vsec_ids);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_pcie_find_ptm_capability);
> 
> This API should go into the previous patch. Otherwise it will result in
> unused function warnings.
> 

Yes, but that should be fine. Unused warnings are generally acceptable if the
function is defined in subsequent patch. Only rule is that the build should not
be broken when using defconfig.

Moreover, the previous patch just adds the VSEC helpers and I inherited them
from Shradha's patch. Clubbing PTM API would make it look like two separate
changes in a single patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

