Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4B4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61ZqbVDQw/xvqBk0WBOL0pupyCSc6ErVs2yZMS/tx8g=; b=Hzm9eAqKdYmbAm4c6v94i+IrIq
	jn49wxg6j0yAB8WXxUfWlTYzW4Bs68wsOewmZBCCmy+Bn8E6MCUiVu7V1c5hoxNmRsVL2ZOp6ypnr
	AzLdxKhC+L2zBjrqG8VcGQgiViMRp7pV9KxgalzPf0TZC2xywJ63npy3H9qbHtuHiezSPw6c8K5cF
	y3OHG7Baguiph2LEhIoXVydMNCU0z4jVbQ+1cX8fVce9plNU+2ADd/GBt+kut7C5hiY7/w7Ldr96q
	Y4EjMMNIjLe14WWUPpl1jnvKHWjCPD0/aefDfTK+ALFY//EJqtoeMwKJKZahpLdUc/zrfoOU5h2uE
	g2tyh0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Jd-0000000ASGV-1MRr;
	Thu, 06 Mar 2025 09:14:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq77r-0000000AQTY-47TH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 09:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=61ZqbVDQw/xvqBk0WBOL0pupyCSc6ErVs2yZMS/tx8g=; b=oP+ek46NzyrSvPppxBx7CKlV2n
	DFANYNtgELeAWlhDAXQ93s/8z+I4Is3eoHmsd/EgChTRjsqFkQj8u+UvdWaa7sZlMSbBHwDzLfQfw
	8KHMpNYIQnn1Z1jKQmE1jB/FzQrz3AsruFZ1wxJFWDO/sGZ/y5cqQl85r/1vSZMEXUoOSAP0hE0cU
	Ra6jrM/bU1KTDgxg+vALiVCvTlgs1mc6wIP5nox8bSfpucIiPGUZmOWKL+DyyXwI9J1tfhVp/cAZs
	O/GPCbWZuSqASf+XvCc2NvNm4EH48vy+4yQYi3BliMV6UQ9Awm+FqcfWZLAYoVauCONUEPJHNSXZ5
	vRQlrqaA==;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq77p-00000000yrP-09Fx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:02:42 +0000
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f44353649aso680622a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 01:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251758; x=1741856558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61ZqbVDQw/xvqBk0WBOL0pupyCSc6ErVs2yZMS/tx8g=;
        b=Hr8Ks0oZJMyKJNhcb+xKNPp7+zAseo75k5jIyKa0+4rwQvug3E/Ex4iqXhl8ZQsu6B
         NmtxQBjJ7UFborpHYoV6V0dPP0yJ+5sEXou8tECF5fO0NVDlFD7DqlSsuWHwYHXe71zs
         zT7K//87Iz6eE3EpE+J271PCVaXVvpPh8fKDhyN8A9yOkMknR1Ig378ZfTC0js5S2e51
         j5dJQQ2zjfC/WqzsJ2PyZ1gbjq/eS5tcWt+qeYcmUuNhzh7Zx24OSOjuAmvdWWzrMNbo
         5jbFXeV4m9/aWde6bgYKhBc3QsX2efehNqkbpYL9bkXK4pP0esz0c2LknDz+ZyJDKzeO
         aP8w==
X-Forwarded-Encrypted: i=1; AJvYcCXI2tjVbJIAIDbB+1le30iY6eXcaAsPnLGN269dtev6lg7RD9ix86umC/J9WP5Hj+xUyTmK4TfXC0dnWlHyI3d7@lists.infradead.org
X-Gm-Message-State: AOJu0YwNNSjTiv6dhuHlwCQ7h8V2PVannngb5NVlS3mSIvxX6jylRxbP
	77CIDzNtBlaWuHVckI00bI0OmmR6TW9WHPIB0A5QTVPHzIz9ks3j
X-Gm-Gg: ASbGnctsLN2CLgofPPveV8DQEyClrtmnThrrWa8rOy8jgQLiFwovG0ZwgW+HQVMscO9
	TxYWcQcpQU0m0MEKQOYW/FiQ/iNRMlPxEHee5naIxJhPob//NZJfFFvWw7FN0vR3w+8yC39Vhkm
	sE+AKHPg3lS9fIVC4S9rO0K51kkMAzaCGiHF059AyelOP/6fNp/IeMgzAmRPeEdhJ4qEss0Za3j
	murxz8zysbKnkutQvgQAq5KinMqcOkHu/gsoyCjCSLF9q35srZBwXWMZA0YSGsnG3wfewuOYxbz
	4NuMX3LUW9kkCuO/+O8CcAYeLmH6zJHkDCfqfuv53HAq66IJ/ZJBKvQDc/1DpoWXj1DKSTFkfAk
	t3VE=
X-Google-Smtp-Source: AGHT+IEVObRPs9r9DCgAFKVxTkcg7YE/ev/oTYXjSeBAHqcHwBFpzXUfu6D3RSOSTJvuqgree5Nh5A==
X-Received: by 2002:a17:90b:4c07:b0:2ff:6ac2:c5a6 with SMTP id 98e67ed59e1d1-2ff6ac2c770mr1605779a91.31.1741251757794;
        Thu, 06 Mar 2025 01:02:37 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2ff4e75ed7csm2641751a91.3.2025.03.06.01.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:02:37 -0800 (PST)
Date: Thu, 6 Mar 2025 18:02:34 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <helgaas@kernel.org>, Fan Ni <nifan.cxl@gmail.com>,
	Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250306090234.GA390800@rocinante>
References: <20250304171154.njoygsvfd567pb66@thinkpad>
 <20250305173826.GA303920@bhelgaas>
 <20250305182833.cgrwbrcwzjscxmku@thinkpad>
 <20250305190955.GK847772@rocinante>
 <CAMuHMdVRSjkss3gPnocXpfPQ=mEo4AevpaU=fdGvm=kb3RTmcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVRSjkss3gPnocXpfPQ=mEo4AevpaU=fdGvm=kb3RTmcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_090241_243623_AA7E18DD 
X-CRM114-Status: GOOD (  15.21  )
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
> Another issue is that the caller does not handle failures correctly,
> given (A) the irqdomain WARNING I got, and (B) the half-registered
> PCI bus, oopsing on "lspci"...

This is something we will look into.  A more robust DesignWare core is
something we would definitely want to have.

Sorry about the issues with this...

[...]
> > -int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > +void dwc_pcie_debugfs_init(struct dw_pcie *pci)
> >  {
> >         char dirname[DWC_DEBUGFS_BUF_MAX];
> >         struct device *dev = pci->dev;
> > @@ -174,17 +174,15 @@ int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> >         snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> >         dir = debugfs_create_dir(dirname, NULL);
> >         debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > -       if (!debugfs)
> > -               return -ENOMEM;
> > +       if (!debugfs) {
> > +               dev_err(dev, "failed to allocate memory for debugfs\n");
> 
> There is no need to print an error message when a memory allocation
> fails, as the memory allocation core already takes care of that.
> So please drop the dev_err() call.

Done.  Thank you!

	Krzysztof

