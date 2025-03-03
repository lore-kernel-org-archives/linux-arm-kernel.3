Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C0BC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INEL+mkWEKLq34Mczv2nLd5ND0XQsLg0DNbt4SnzHDQ=; b=JvWNo7XcruZB5CJhIrHBpmBRl0
	RzadwInjjXhp6q1cOxwDza4Hko8UfN/c4MLQx5VIddxWfAVOczJTLHsKPbGPPAdnwjlIj4YikDJxv
	frbisoQ7U5lh2VusLbaw3aZOLwzhryqBqAvsf7Bw4KBm8AlOStiSJVVQbKmIEd+Gt+xn7DZy7LmGx
	MKRWI7Z1nrVwAtz8EqUHvsLyAATdIlV01e5UbJ7OYOJ+fZHti0dcEt2buK0MLKvzzIf9T/3xrhmOM
	hzseeJStmo3wWBYXppRdUXn7QKjPJY4GDayZaePWUTLoIrLspB+l7oSxnQRp3NuqzeY9H1WaggUWC
	R92i5eGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9Wv-00000001jWa-1BP9;
	Mon, 03 Mar 2025 17:24:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9VK-00000001jH2-3xHA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:23:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22355618fd9so80335485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 09:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741022578; x=1741627378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=INEL+mkWEKLq34Mczv2nLd5ND0XQsLg0DNbt4SnzHDQ=;
        b=bh6NNyK6NreyiH0R+hJePU3y1kOXDyY98K1aSAzVVCaV2Y1T+2pFJn1fxtfSREL+/f
         SVMgFVrOhalLSL3jekZ5msplUl1z1SRc8xA2jAF6vqYN40GOhiA8vPzXufOYld16iz9C
         NEQyZT+58cc5mPscGggbb1y/ym2C5dh3PE3WLyWl/B/5YORIauFnJiEtDLzxQyJPmHkV
         VjcdDmE8kP76D8OX0icOfRsFlmkAHnq0UBcWmp8rMuH5afM9cyPdo8srjyd6Hiv4yZc+
         vmcW3NkF7CPX46GLcKTHEcAo4xPHO4lMpFnaiG9bidVZh+dzXXG0sR8jDdveu+E1xxh1
         BKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741022578; x=1741627378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INEL+mkWEKLq34Mczv2nLd5ND0XQsLg0DNbt4SnzHDQ=;
        b=aTEZBgVfPnxzgRGruyXLria9o5QJoWvsPaDa7sO55AkYjCD8AXb5Q+WPvoccut1mbj
         7UaSSWyBzAYIPii24QE+kFv9k1j8/hW1rZrWFQabmNHqfX8d2d5jOQCDxfE+XF4YhNjZ
         Cg2n3A4nTAkqty9j9JPqWKAm567kGaH8OTaFdjrsLJU+FinFua45Cprem//AqxTgmELn
         HM1xkrAR+Ivkbm7x+C4NcY18WYfo45W1pjDIPuarEst01GLJo5VpGlCGGxwSJjZ3PAjo
         SZ6fuUPG1/Lm02oMww2dT3liTilPoepJjUD/SQgTagsKdRBH0oj/UNC/oeaZweOUe3So
         0ZCA==
X-Forwarded-Encrypted: i=1; AJvYcCWnq1l4mlUCJILykktZoVxJotu9dgbCapW2cOAVudUWNVt4sYRIegvASJxTcQT557zVAQdS0Fd29HNerpEG7sDp@lists.infradead.org
X-Gm-Message-State: AOJu0YxGZZR5N1YHukUf3o+7z5cBVBi/Vvo3EcrgeFFy0rOPZY4wyz2K
	8CXOs4upKNIl+qhFMl1mOElr2DSyKo4BEs/l6jfzgrizdsRWkVFx
X-Gm-Gg: ASbGncuC+pIkmoy+LUPwaP2HyqWQcOrFl0pdFaHswSPebJzYgZok/uNFWLxhv1KEEU+
	vK8sMvdQSS6Si2iSa3C/hGS8njBwmn0CmmltFYgU+cNEsKRBWYrVw0feQ58PrNggPaiSJUXehF3
	r2QjovNOo7xbrwUpk30GO9YILennzympWF716jcwzWNQg3ZMnFUz9Q6JOpA9kBN1XspdTe2C4wN
	bwBbj0cszUuwrOpW5Jggs4TnJxISk1qRG9ktUE6YHUN4T+Rk0ClSUubmR+YQ0ZMRT0/o283Y5o/
	zdzkLhcYW29L6MWy0wEerSPywlKOYDSGV5LUIgNx
X-Google-Smtp-Source: AGHT+IGYNi+2VxBOSdALmg07N0zm4mXQing5p3PqQ+CWp+YUijGcJXrzBi5jiCAbCilBAkdB5b8amA==
X-Received: by 2002:a17:903:fa5:b0:220:f40c:71e9 with SMTP id d9443c01a7336-22368f71f0dmr184667325ad.9.1741022576289;
        Mon, 03 Mar 2025 09:22:56 -0800 (PST)
Received: from debian ([2607:fb90:8e63:c2b3:5405:c8bf:c1d1:41d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c596esm80333925ad.152.2025.03.03.09.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:22:55 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 3 Mar 2025 09:22:50 -0800
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
Subject: Re: [PATCH v7 2/5] PCI: dwc: Add helper to find the Vendor Specific
 Extended Capability (VSEC)
Message-ID: <Z8XlapjLRfz44hF7@debian>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132029epcas5p1e56dd355e7ac912ceb25325595de0d24@epcas5p1.samsung.com>
 <20250221131548.59616-3-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-3-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_092258_978966_9762CAB4 
X-CRM114-Status: GOOD (  18.42  )
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

On Fri, Feb 21, 2025 at 06:45:45PM +0530, Shradha Todi wrote:
> dw_pcie_find_vsec_capability() is used by upcoming DWC APIs to find the
How are about "Add dw_pcie_find_ext_capability(), which will be used by
..."

Other than that,


Reviewed-by: Fan Ni <fan.ni@samsung.com>

> VSEC capabilities like PTM, RAS etc.
> 
> Co-developed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 40 ++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 145e7f579072..a7c0671c6715 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -16,6 +16,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/ioport.h>
>  #include <linux/of.h>
> +#include <linux/pcie-dwc.h>
>  #include <linux/platform_device.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
> @@ -283,6 +284,45 @@ u16 dw_pcie_find_ext_capability(struct dw_pcie *pci, u8 cap)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_find_ext_capability);
>  
> +static u16 __dw_pcie_find_vsec_capability(struct dw_pcie *pci, u16 vendor_id,
> +					  u16 vsec_id)
> +{
> +	u16 vsec = 0;
> +	u32 header;
> +
> +	if (vendor_id != dw_pcie_readw_dbi(pci, PCI_VENDOR_ID))
> +		return 0;
> +
> +	while ((vsec = dw_pcie_find_next_ext_capability(pci, vsec,
> +						       PCI_EXT_CAP_ID_VNDR))) {
> +		header = dw_pcie_readl_dbi(pci, vsec + PCI_VNDR_HEADER);
> +		if (PCI_VNDR_HEADER_ID(header) == vsec_id)
> +			return vsec;
> +	}
> +
> +	return 0;
> +}
> +
> +static u16 dw_pcie_find_vsec_capability(struct dw_pcie *pci,
> +					const struct dwc_pcie_vsec_id *vsec_ids)
> +{
> +	const struct dwc_pcie_vsec_id *vid;
> +	u16 vsec;
> +	u32 header;
> +
> +	for (vid = vsec_ids; vid->vendor_id; vid++) {
> +		vsec = __dw_pcie_find_vsec_capability(pci, vid->vendor_id,
> +						      vid->vsec_id);
> +		if (vsec) {
> +			header = dw_pcie_readl_dbi(pci, vsec + PCI_VNDR_HEADER);
> +			if (PCI_VNDR_HEADER_REV(header) == vid->vsec_rev)
> +				return vsec;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val)
>  {
>  	if (!IS_ALIGNED((uintptr_t)addr, size)) {
> -- 
> 2.17.1
> 

