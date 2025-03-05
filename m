Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08322C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5oLj+118MekjPiNQhRObsqao3JOH+wuRmhMOoWyOZI=; b=LtfX1MXxB9OEQxezrbkzaUAain
	JpXXmxJzI5PQcbXCQ/OZ4IjXiIii1+qPRVgxrCWePS+PKDUIetSP4NK95k3BuKs6Q8V+uiT5WMA6l
	1SmtB5mzsmQXaQaoQvKckzsFnVJJjSaNDkO4FTWeMU87OsG+bgjqRkGzumVwwf3VHwWkBczvoEr6/
	qJSvpr0F8Xhz0qGISe6L77X4fpwfyNOPKCS174TRK7iIHaRN0z+g/iA7S5dKNCUDmA+Lm3km+SOSw
	LEUabhPKnAEVMr9TIC6YLWkdbSpG2ypQBKyNZZUoAgLATv4kWaYZ2428gaNdKipnxJn4XVsy1ejEx
	Bu7Hq5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpy0m-00000009bUr-3NH0;
	Wed, 05 Mar 2025 23:18:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwkH-00000009QIf-3jMH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 21:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G5oLj+118MekjPiNQhRObsqao3JOH+wuRmhMOoWyOZI=; b=ol2hFBJn0ASyI9EVE13j8a0L55
	FIkkFzKmIrC7aPmDypbf33DcvoDwxc2gmxFjMNkS1ubFfS/xK8GVvkijsgnG0JcEkntNPYb5n/IZV
	+k5GxuG5pDrHbO3xuv281xkHP3elfvLF7wx2YkE//WQAndNs6z/IPIfz0dDJg29X6SEGy9HaY7LS5
	3CPFHEQ5btOYlvCFFXFDJqVnds/EnvZiDfDpRbUhBP1o8HeJ7VwpnNQLNQJAHBX7C47YObqD9Vzoc
	2OhNB7yxaF6D2f8gFPCOLnyGCP8fPw5jePTlPr+D41SR52xvwUtdgqkIFeVw3OoyfxfZNsBTbGAx9
	FHSoXPaw==;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwkD-00000000m0G-450Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:57:40 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224019ad9edso21332615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211854; x=1741816654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5oLj+118MekjPiNQhRObsqao3JOH+wuRmhMOoWyOZI=;
        b=bl4aqEyi3bzn7VJ3W81qPB8YZcBZlSL32q4OaZNcdMdZYb9RV8SKNUIeH/4eed0Qlj
         eTlPqobEVQDmrEsix7VdFbjRAj4KOLZqZ36t0Fqd1Gs3IcqhxhCAL0fEuUr45pc+ylA4
         5mucjaI0AE9Bc7FEVVk7Z/VOJSmIcR9dmljMiBiCzPskroFhm6GJPdlgbh9aEd+guSLu
         xbM3QTwUQyLU9Y5bwHBUlSfayqXRmmtYT1l0nVxsLJuQu5dHkwv8Y7hkcY6hafr7333I
         KOlXknmMNi4RGHn/HXT9aZVg3qWmPug6SNNgGzBNDIuOS06fJi/oCOZJye4+kyEvk5KX
         zULA==
X-Forwarded-Encrypted: i=1; AJvYcCX1PZbABveIhBM4rBuQPHknXe3GImHiWyL1PiDZdVJWYw8o8smRKkF69eg5gSBuNwsvomNdQcZP1vDiL+Yo8Lfa@lists.infradead.org
X-Gm-Message-State: AOJu0YyW/xZKUUVZheU62K43y6qiJoVB6EzqqCHKkMWyWwU1Hg4nxxJU
	32q116gOf9mtdeucvelM44us4EiJrTyQEjGqlmLeTCGsbFnUec6X
X-Gm-Gg: ASbGncuc/8dC7OCAZyjb7HdnS2OrlctzO6L/mCW+ohuEeXECuFkKDFRw1MCmuI+vjEA
	FntHRp8nG3/YtqfoY9RxN+j+U4PbEDsf0SkV9fE8U0UHXRaYp/b3hqZn539vmaWfbqyRLeax/Jz
	H4se1hKxTuJ1V1xST6nssbgK4ie9+4Xdv6dSPa7Ackoqe3JwS7lYeor3mNy2s8APf1zlsR+xiWE
	lpgdxBZyfcFSBMiiVIMp+/DAhNIPnytiN35APnGo7+nD+kzK3IY5wwwjFg64sXxivK98DZbfPi5
	eewk05thZj6ZEYFQtQhx0etZpDu5OwbsJ2bgCkAZYA7zhn8yAuFmRNQsL5nMv47oTNzYeI4qWyS
	B57Y=
X-Google-Smtp-Source: AGHT+IGuIOJavdPgCJ9sCafNt1cSRA420lYDVSVad8g7o0o+KgD598cgIajBU5IrPyUL8MNnaUygNQ==
X-Received: by 2002:a05:6a21:1f81:b0:1ee:d6ff:5abd with SMTP id adf61e73a8af0-1f34947e736mr9366143637.14.1741211854471;
        Wed, 05 Mar 2025 13:57:34 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-aee7dec415asm12522672a12.54.2025.03.05.13.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:57:33 -0800 (PST)
Date: Thu, 6 Mar 2025 06:57:31 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Fan Ni <nifan.cxl@gmail.com>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250305215731.GL847772@rocinante>
References: <20250304171154.njoygsvfd567pb66@thinkpad>
 <20250305173826.GA303920@bhelgaas>
 <20250305182833.cgrwbrcwzjscxmku@thinkpad>
 <20250305190955.GK847772@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305190955.GK847772@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_215738_481665_282A7695 
X-CRM114-Status: GOOD (  31.24  )
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

> > > > Even though debugfs_init() failure is not supposed to fail the probe(),
> > > > dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating that
> > > > failure would be canolically correct IMO.
> > > 
> > > I'm not sure about this.  What's the requirement to propagate
> > > devm_kzalloc() failures?  I think devres will free any allocs that
> > > were successful regardless.
> > > 
> > > IIUC, we resolved the Gray Hawk Single issue by changing
> > > dwc_pcie_rasdes_debugfs_init() to return success without doing
> > > anything when there's no RAS DES Capability.
> > > 
> > > But dwc_pcie_debugfs_init() can still return failure, and that still
> > > causes dw_pcie_ep_init_registers() to fail, which breaks the "don't
> > > propagate debugfs issues upstream" rule:
> > > 
> > >   int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > >   {
> > >           ...
> > >           ret = dwc_pcie_debugfs_init(pci);
> > >           if (ret)
> > >                   goto err_remove_edma;
> > > 
> > >           return 0;
> > > 
> > >   err_remove_edma:
> > >           dw_pcie_edma_remove(pci);
> > > 
> > >           return ret;
> > >   }
> > > 
> > > We can say that kzalloc() failure should "never" happen, and therefore
> > > it's OK to fail the driver probe if it happens, but that doesn't seem
> > > like a strong argument for breaking the "don't propagate debugfs
> > > issues" rule.  And someday there may be other kinds of failures from
> > > dwc_pcie_debugfs_init().
> > > 
> > 
> > Fine with me. I was not too sure about propagating failure either.
> 
> What if we do this?
> 
> diff --git i/drivers/pci/controller/dwc/pcie-designware-debugfs.c w/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> index 586a9d107434..fddf71f014c4 100644
> --- i/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> +++ w/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> @@ -162,7 +162,7 @@ void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
>  	debugfs_remove_recursive(pci->debugfs->debug_dir);
>  }
> 
> -int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> +void dwc_pcie_debugfs_init(struct dw_pcie *pci)
>  {
>  	char dirname[DWC_DEBUGFS_BUF_MAX];
>  	struct device *dev = pci->dev;
> @@ -174,17 +174,15 @@ int dwc_pcie_debugfs_init(struct dw_pcie *pci)
>  	snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
>  	dir = debugfs_create_dir(dirname, NULL);
>  	debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> -	if (!debugfs)
> -		return -ENOMEM;
> +	if (!debugfs) {
> +		dev_err(dev, "failed to allocate memory for debugfs\n");
> +		return;
> +	}
> 
>  	debugfs->debug_dir = dir;
>  	pci->debugfs = debugfs;
>  	err = dwc_pcie_rasdes_debugfs_init(pci, dir);
> -	if (err) {
> -		dev_err(dev, "failed to initialize RAS DES debugfs, err=%d\n",
> -			err);
> -		return err;
> -	}
> -
> -	return 0;
> +	if (err)
> +		dev_warn(dev, "failed to initialize RAS DES debugfs, err=%d",
> +			 err);
>  }
> diff --git i/drivers/pci/controller/dwc/pcie-designware-ep.c w/drivers/pci/controller/dwc/pcie-designware-ep.c
> index c6e76a07c2c9..11ff292ca87d 100644
> --- i/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ w/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -838,9 +838,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> 
>  	dw_pcie_ep_init_non_sticky_registers(pci);
> 
> -	ret = dwc_pcie_debugfs_init(pci);
> -	if (ret)
> -		goto err_remove_edma;
> +	dwc_pcie_debugfs_init(pci);
> 
>  	return 0;
> 
> diff --git i/drivers/pci/controller/dwc/pcie-designware-host.c w/drivers/pci/controller/dwc/pcie-designware-host.c
> index 2081e8c72d12..6501fb062c70 100644
> --- i/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ w/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -548,9 +548,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (pp->ops->post_init)
>  		pp->ops->post_init(pp);
> 
> -	ret = dwc_pcie_debugfs_init(pci);
> -	if (ret)
> -		goto err_stop_link;
> +	dwc_pcie_debugfs_init(pci);
> 
>  	return 0;
> 
> diff --git i/drivers/pci/controller/dwc/pcie-designware.h w/drivers/pci/controller/dwc/pcie-designware.h
> index 7f9807d4e5de..dd129718fb41 100644
> --- i/drivers/pci/controller/dwc/pcie-designware.h
> +++ w/drivers/pci/controller/dwc/pcie-designware.h
> @@ -815,12 +815,11 @@ dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
>  #endif
> 
>  #ifdef CONFIG_PCIE_DW_DEBUGFS
> -int dwc_pcie_debugfs_init(struct dw_pcie *pci);
> +void dwc_pcie_debugfs_init(struct dw_pcie *pci);
>  void dwc_pcie_debugfs_deinit(struct dw_pcie *pci);
>  #else
> -static inline int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> +static inline void dwc_pcie_debugfs_init(struct dw_pcie *pci)
>  {
> -	return 0;
>  }
>  static inline void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
>  {
> 
> I think this would be fine, especially given the rules around debugfs and
> a quick look around Git history to see what the prefernce would be typically.

Changed dev_warn() to dev_err() per Bjorn's feedback off mailing list,
and squashed against the current code on the branch.

Thank you!

	Krzysztof

