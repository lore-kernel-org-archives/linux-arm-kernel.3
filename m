Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C466DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW1cKuRtFgc98VoZXyjtJAQFKd78PcnO2hM7lIoduzI=; b=Voext8zWPuh0mewjrjSmIIusaP
	hNQ9YjNbuDXBoWM7imgvae/LBcJ4OLkEkgBXZ5MhzSz8Cbhi1IiYVHmAvEIIb2qbyV2mcMFcqcD6U
	yUdye3nnKlOSeIX1kKoeSZci1ttl0S/90uTrrvTYNkpSfs2ruYJ5IhO06eZJ2BQxdPZLfXC2V3T/X
	EiO8QRefu9f7sjc6Hy/gnn5a6CVP0CEAaf3/GStW5bhTExteeH/E3T8NeEZ87xlkk0LuNhUYkjtmh
	bJdrWiDezaq3AiVB0ze03/X48Jgw6snntCiacpcFjuG7iIFY5E3Yp+hEHtEy4SQuf2q4XmrZdkx78
	lZOQTXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVbm-00000005WUI-365J;
	Tue, 04 Mar 2025 16:59:06 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUTh-00000005HNb-1gJd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:46:42 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22355618fd9so100214935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741103200; x=1741708000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW1cKuRtFgc98VoZXyjtJAQFKd78PcnO2hM7lIoduzI=;
        b=Wo665qiteM5lP64BdIgZTIEU1ndXo9DVJsC0SUeYfn/27QQ/UQfmRLeT8v3CmKQ8kJ
         jCwgMymoq8ab70ORHar0mkcdQruUe6Ol77Y6ObJwt/li/YFkIkBnBYjz1r7N8Neyj3Uq
         fFovDkmJ/KqQKb1jd/1C7mE4LzD4PC5qaRBbtMWoziQwTi46OVpw/Qv0NMfQcJfY/XZt
         KN3wbVrDJ8t5ucmlJJfpBhSnb6+ENb+TNv7ASkkdcgzrz2vWwUQRVj8ou9HzanvpWyFN
         eVr5O3RyIkujWp5thHqCLdRIJOdgbxfmWYDvky98gZqBZlUWikZXO1SZ0woL9tkO5EUh
         6JPg==
X-Forwarded-Encrypted: i=1; AJvYcCXrtlEuVmDJQCbqG4dawQDnCBxR+JehU+LzyMDCS5vuix+yoFpmvK4VqH51qjzvYlarS7GRZkflt/ayOZbKVN3z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzee35q4osIZEhMJls7izI2a6xpBW6AavyPHOmCGKQIaqvJNCdt
	4UeaOgXGR8hl/4F+ZkGcHsXR9L7FnfLwO4vqF2YkXbvMTdfwnfhF
X-Gm-Gg: ASbGncuqRSZ6cTcjN+CjDdyZktdxAEmDsKZCKab58f1qzha2C/MTR2jK+8mMY1Oxvbw
	3w66iplKN92P7EbaWiT+pck/zy9aPiTjdtJ4W/iOXrIFzs02FwsmF8b6L3c6Jt01GfloK1eATpW
	Oq10WoEWgJM0ab+Mpsintc2gEFLTG9vI0k7Lu08WtIkUCKB1DxFk3vMV4uBkLj8dSM7Ied+o/46
	HBUoTM75VjdNE0T+TwnIWSkOyclb4dGWJrRfiSqvAY2rEWL1OodxigwwFkkYjICtUxdQEylc5Gi
	WWr6rqgRQIa/zvpwbDMeadtQmE+nC5XvjwrXVxTaVZs26+1/AYPo+lbRzDkbwOE/KQsyUjjUfEv
	KeBQ=
X-Google-Smtp-Source: AGHT+IEzaN/r/FxaRDaAv2WPggcOLIm/6Vm7eMmJxC9+tfE4ygUZ5mXkWtuc2TbBMjwycyUGGLoq3Q==
X-Received: by 2002:a17:903:230c:b0:223:7006:4db2 with SMTP id d9443c01a7336-22370064ea3mr216436475ad.31.1741103200544;
        Tue, 04 Mar 2025 07:46:40 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-223504e18b3sm96918945ad.182.2025.03.04.07.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:46:40 -0800 (PST)
Date: Wed, 5 Mar 2025 00:46:38 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fan Ni <nifan.cxl@gmail.com>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250304154638.GB2310180@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
 <20250303194647.GC1552306@rocinante>
 <CAMuHMdWens9ZZrjNH1Bd2AN3PJEP1KSUGdiJcBCt0uPGH_GiiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWens9ZZrjNH1Bd2AN3PJEP1KSUGdiJcBCt0uPGH_GiiA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074641_438686_E4DE1CAE 
X-CRM114-Status: GOOD (  21.52  )
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

> This patch is now commit 1ff54f4cbaed9ec6 ("PCI: dwc: Add debugfs
> based Silicon Debug support for DWC") in pci/next (next-20250304).
> 
> On Mon, 3 Mar 2025 at 20:47, Krzysztof Wilczyński <kw@linux.com> wrote:
> > [...]
> > > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > > +{
> > > > +   char dirname[DWC_DEBUGFS_BUF_MAX];
> > > > +   struct device *dev = pci->dev;
> > > > +   struct debugfs_info *debugfs;
> > > > +   struct dentry *dir;
> > > > +   int ret;
> > > > +
> > > > +   /* Create main directory for each platform driver */
> > > > +   snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > > > +   dir = debugfs_create_dir(dirname, NULL);
> > > > +   debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > > +   if (!debugfs)
> > > > +           return -ENOMEM;
> > > > +
> > > > +   debugfs->debug_dir = dir;
> > > > +   pci->debugfs = debugfs;
> > > > +   ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > > +   if (ret)
> > > > +           dev_dbg(dev, "RASDES debugfs init failed\n");
> > >
> > > What will happen if ret != 0? still return 0?
> 
> And that is exactly what happens on Gray Hawk Single with R-Car
> V4M: dw_pcie_find_rasdes_capability() returns NULL, causing
> dwc_pcie_rasdes_debugfs_init() to return -ENODEV.

Thank you for testing and for catching this issue.  Much appreciated.

> > Given that callers of dwc_pcie_debugfs_init() check for errors,
> 
> Debugfs issues should never be propagated upstream!

Makes complete sense.  Sorry for breaking things here!

> > this probably should correctly bubble up any failure coming from
> > dwc_pcie_rasdes_debugfs_init().
> >
> > I made updates to the code directly on the current branch, have a look:
> 
> So while applying, you changed this like:
> 
>             ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
>     -       if (ret)
>     -               dev_dbg(dev, "RASDES debugfs init failed\n");
>     +       if (ret) {
>     +               dev_err(dev, "failed to initialize RAS DES debugfs\n");
>     +               return ret;
>     +       }
> 
>             return 0;
> 
> Hence this is now a fatal error, causing the probe to fail.

I removed the changed, and also move the log level to be a warning, per:

  https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc&id=c6759a967e69aba16aef0d92f43e527b112e98a5

Would this be acceptable here?

Mani, would this be acceptable to you, too?  Given that you posted the
following recently:

  https://lore.kernel.org/linux-pci/20250303200055.GA1881771@rocinante/T/#mab9cbd5834390d259afea056eee9a73d8c3b435f

That said, perhaps moving the log level to a debug would be better served here.

	Krzysztof

