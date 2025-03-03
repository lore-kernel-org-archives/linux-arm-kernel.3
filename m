Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D3EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Dek+FDPeZjeeIpsF2E44gvfK0e/oZIfm/67LelXRus=; b=4hNIKmV8aG5dqvejtp6oF8kcP6
	2BxsCg1Ls6ezShZshninHUpGR2wr/NsVziW9QrbXC5C1VezxEwy45VoIvMJqSPB5cWPakJwhFXa/S
	v2krcDKL3ODZTxIWhK9MVwyMdISbiFo+HqAy+MgHE7xJ/TDLUTHNbNNDsF/bI+AUHKHT6wJYvMVTV
	Jq3K8wBm0jp6CqSRcus4VK6Qsiu0mDToBrKHZGh/uP/XfHU67C2a63ojjrzyMLAvnZEdJagVVzflr
	EI1NKjI+Z55k4vDVNAIUvousir/co4f/SR1LKOkD0h8Q3ZWAFBLin0xkpPwTaxJ6Z5oumJpeIF6eV
	RFIBNwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBm8-000000026DA-0jFr;
	Mon, 03 Mar 2025 19:48:28 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBkY-0000000261f-2hYX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:46:51 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22398e09e39so33204805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 11:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741031210; x=1741636010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dek+FDPeZjeeIpsF2E44gvfK0e/oZIfm/67LelXRus=;
        b=fbYXFzm3BjhcpTMdw6MJya2T1exnf6BbkpnE1eqL5/pp+iA94mpXCteh/jEMiVQw9+
         ln0QsFz9t8/4GeBr4Wf2l6uL6R5MW6GBHT6NLceoxhnQmOfUpwz3NPyjwe2Nc06ygyNg
         tyWm8T8xa+SAB4uZtgMRripQqvNxTjWcbzGP4jnM4H6384MNPJAnGlIPmW+1rYJyxAzl
         4JfJE9WD5yvz50ghSkqdPzoqqWFqoWlhY5FTwIMpx99562Wp9SA+R5lx+nI8MIu9AKJx
         uKTyn2bTJweTYH74DRGpVxIGzKyXmD/4TORkUhFH9aUgLbpjLVYzwu2kD2FDmSXz3S+X
         5G6A==
X-Forwarded-Encrypted: i=1; AJvYcCVgvCch1+6QX34Niqr+wIWFnjIVsWs0Yg2JQ+IqaTcsey+gtncJwtLrHOXIctk0+F6i+OxrfDtRlCP1ONipl76T@lists.infradead.org
X-Gm-Message-State: AOJu0YwPJoLZsXGXpe5Wr4WzNYck+XsHID1ESY2sqsah6Zn3+OmRRZLc
	l/pkZf5bxasScRtNtlGcead+4YUCkUt6C0so2j8OUZhZwmg31Fba
X-Gm-Gg: ASbGncvjutfHw4jhqfRUcBZsCnNfdjqSb7CPbSLg9L0eSGvcrM7M1wf8kLeNmBpG392
	686ofLpCPZCwZ/0E5DOj7GKR8Z3El2NZfXNeJh9QQnfm7fC3Hij/+EQ9arzn/O5ZXGjlCgcNbWh
	lfSif6kuEWYqTN3J1+kDm1obYFLAjwH9pI3YFWdJgzCRADmhyaRv3S6f0EG+8xIFYncHllrZvGP
	RqLxrOneRLUeBXBhKZyv5YHvGp24ZE8jmEdVtptfhty3CN3km7uIIDpG6j9FVJr91LnbrDwjMnQ
	15S99uiYiyy2yWcEIP7FeAIqd0NAKNTO5nm9mb1ujAKbEeMbRGAqDiLfg71DpDG7gnp/XK6bvnU
	HnP8=
X-Google-Smtp-Source: AGHT+IFb6LGLr6n2gvyZ7SSG3EPL8TvaZlZ1WJzOGXC85Bkw4k+sVACmwEySy6Gx9cQRP604zBwk+w==
X-Received: by 2002:aa7:98cf:0:b0:736:339b:8290 with SMTP id d2e1a72fcca58-736339b83admr10650834b3a.17.1741031209589;
        Mon, 03 Mar 2025 11:46:49 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-734a004026dsm9251122b3a.155.2025.03.03.11.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:46:48 -0800 (PST)
Date: Tue, 4 Mar 2025 04:46:47 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Fan Ni <nifan.cxl@gmail.com>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250303194647.GC1552306@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XrYxP_pZr6tFU8@debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_114650_683596_12336501 
X-CRM114-Status: GOOD (  12.24  )
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

Hello,

[...]
> > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > +{
> > +	char dirname[DWC_DEBUGFS_BUF_MAX];
> > +	struct device *dev = pci->dev;
> > +	struct debugfs_info *debugfs;
> > +	struct dentry *dir;
> > +	int ret;
> > +
> > +	/* Create main directory for each platform driver */
> > +	snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > +	dir = debugfs_create_dir(dirname, NULL);
> > +	debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > +	if (!debugfs)
> > +		return -ENOMEM;
> > +
> > +	debugfs->debug_dir = dir;
> > +	pci->debugfs = debugfs;
> > +	ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > +	if (ret)
> > +		dev_dbg(dev, "RASDES debugfs init failed\n");
> 
> What will happen if ret != 0? still return 0? 

Given that callers of dwc_pcie_debugfs_init() check for errors,
this probably should correctly bubble up any failure coming from
dwc_pcie_rasdes_debugfs_init().

I made updates to the code directly on the current branch, have a look:

  https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc&id=1ff54f4cbaed9ec6994844967c36cf7ada4cbe5e

Let me know if this is OK with you.

Good catch, thank you!

	Krzysztof

