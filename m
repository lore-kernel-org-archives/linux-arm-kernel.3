Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64430C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzhE+tdJAYWvPcPUwSdrS55NblQcSF6sK2zBz4cziEo=; b=jU1tqDigLoRNDg4wTEkCmJEsBg
	m+570OZND04HWSjGrTbO8YnjzG4g92jre4E39CSpNBKquzefSZtF1/B/GG9/+jWMgGaWCPBesNaBT
	/APXJtH9MURxRQK6IwrBOz+gZNTpeSzXmen+SaMKshq6T6Baodir9eXKON5ZqcJHSjt77GbfyECxL
	s6tBXzF5OcLy3QnnkEGAaKYmaDru4XHXXM/xBRtXvS5KFSWaw70J9/idirIlbChAEn39CBtLaWqya
	dOfb6az/brWkA1N5C5fg0ecwbP7htrAR/QySXGJdb+u4/wcyf8Sb6t5+c7IZZ7mMUz4dSaOUIpSN2
	4iePWOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpV64-00000005QM2-2Zuo;
	Tue, 04 Mar 2025 16:26:20 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU2L-00000005Ago-2Esj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:18:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22349bb8605so112120505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741101504; x=1741706304; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzhE+tdJAYWvPcPUwSdrS55NblQcSF6sK2zBz4cziEo=;
        b=ROLNw8gZhUETVTmM1U5o6tv8tvdlr0gd3DyBt4dMfihfCmIkGfBrhSKcDueKXba3Fo
         BU6xLzkr7+KjqbXPE+AEkmxbQU066F8J7LMKhRj8T+y1wJ/YWLUbbY1GYCv5cP5+9J/S
         Hml98ICHS4+hk3aIU9IONOY9Pa5qBipc0UqRdf+av4HDqQrJTQxPpFMYSqv0ajI0GgjS
         8rnbmK4wkwS+dlLG1sM7RfyUMFf7QCYnuBVb8nAGfEt8H9UGYQ9w6783rR4qMeL69AP9
         jQdzraDpc0ei6GjQkDvfJaOjrWroyomKgchVThD9tg2KKiAFqi1xZh6r6M+gU9tNXyGj
         bKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741101504; x=1741706304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzhE+tdJAYWvPcPUwSdrS55NblQcSF6sK2zBz4cziEo=;
        b=L8o2czbGpw+7RhJ0U7z277n7fal1BOJWXU/4BjJkf0dNG1sPflZsQJy/quIeQ6SjH5
         sYiISrBHI0RLLhOUHsq5gQDvrcdj1D175ABydavnK2VnekrTzRBk+cQ3jb98+EHrSJsw
         KDp/Gb5EcGo49xvcSEtpPXim8U0WizCQ/bSPLEJgO3zSI1GB4U2E3XQ8VRiZlSBy70cY
         5UTRd66MVW+EQTzszbFVvYZMSEPHLskLbgEL6SmPgeZ6OsXv0VKwMQbfDsVgnTaeP7CV
         EEJjR/xxagvqNtaBJxHkfEzuNP9Z/BFsetq2Bmzlbx5uaaeKrjWiKMXCzY8rn3V1elIs
         eBoA==
X-Forwarded-Encrypted: i=1; AJvYcCUvwbBDpc+GUcVRoASM+BSPvJkzpXPW/FHDqo0hQerdL5PotSQbKO2Cite0z6gy1TiJNZhNyuoW9RmdzmzWYJh2@lists.infradead.org
X-Gm-Message-State: AOJu0YxL83mQpKKH6ZLdOAvExdPVlKDQwzqdAzyQ5qW1k1TsNwQpie7v
	QmpFhkOwOzE0zk7wUJY+xFgXYP3l2d/LQpP772QID89hWo+npxcqg5ctVVeO7g==
X-Gm-Gg: ASbGnctXFNBcBO1N/ErZ202YSTS3kMUIIVGeCR9PmCRM40DafrC/ynzrgj7f29TT0fP
	P3CtXa/Bq7MaGptxw08r0keQdx9fMVPc0QiKWshYjx8TF80bN6Gtrg8blNQGtrMKxF0NjirG0pa
	wzBogfxgYx5Grl0LLTDb8Tsuy+fVhJ0jPlfejQL6TU09olteyxdv37qUnVs03WCBXRuXH8VJuwS
	tJjIPPje9Y0AxAo7PTDlsdtk1wq6PZZK9u11qV4s4YoHpEAMgtTf0y7+dTnI7Ab3ngNoF2+In/w
	z/xK+F/sNMl00eVpPO27PxUjBVU2xWoFVBuBcIkelhASGy5nd5BUxF8=
X-Google-Smtp-Source: AGHT+IE5m+vrO6nNhOZDvuax+Cu982tB5v2FtygKBkyOtqqZSXWNrXN1iB/dSPoQj7bI+IrEJ3ckng==
X-Received: by 2002:a17:902:e752:b0:21f:45d:21fb with SMTP id d9443c01a7336-22368f61965mr234071745ad.3.1741101503081;
        Tue, 04 Mar 2025 07:18:23 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504db7a6sm95889145ad.160.2025.03.04.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:18:22 -0800 (PST)
Date: Tue, 4 Mar 2025 20:48:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Fan Ni <nifan.cxl@gmail.com>,
	Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250304151814.6xu7cbpwpqrvcad5@thinkpad>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
 <20250303194647.GC1552306@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303194647.GC1552306@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_071825_571372_229DACBD 
X-CRM114-Status: GOOD (  19.51  )
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

+ Geert (who reported the regression in -next)

On Tue, Mar 04, 2025 at 04:46:47AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> [...]
> > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > +{
> > > +	char dirname[DWC_DEBUGFS_BUF_MAX];
> > > +	struct device *dev = pci->dev;
> > > +	struct debugfs_info *debugfs;
> > > +	struct dentry *dir;
> > > +	int ret;
> > > +
> > > +	/* Create main directory for each platform driver */
> > > +	snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > > +	dir = debugfs_create_dir(dirname, NULL);
> > > +	debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > +	if (!debugfs)
> > > +		return -ENOMEM;
> > > +
> > > +	debugfs->debug_dir = dir;
> > > +	pci->debugfs = debugfs;
> > > +	ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > +	if (ret)
> > > +		dev_dbg(dev, "RASDES debugfs init failed\n");
> > 
> > What will happen if ret != 0? still return 0? 
> 
> Given that callers of dwc_pcie_debugfs_init() check for errors,
> this probably should correctly bubble up any failure coming from
> dwc_pcie_rasdes_debugfs_init().
> 
> I made updates to the code directly on the current branch, have a look:
> 
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc&id=1ff54f4cbaed9ec6994844967c36cf7ada4cbe5e
> 
> Let me know if this is OK with you.
> 

If the SoC has no RASDES capability, then this call is bound to fail (which will
break existing platforms). I'd propose to return 0 if
dw_pcie_find_rasdes_capability() fails in addition to this change:

diff --git a/drivers/pci/controller/dwc/pcie-designware-debugfs.c b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
index dca1e9999113..7277a21e30d5 100644
--- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
+++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
@@ -471,7 +471,7 @@ static int dwc_pcie_rasdes_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
        ras_cap = dw_pcie_find_rasdes_capability(pci);
        if (!ras_cap) {
                dev_dbg(dev, "no RASDES capability available\n");
-               return -ENODEV;
+               return 0;
        }
 
        rasdes_info = devm_kzalloc(dev, sizeof(*rasdes_info), GFP_KERNEL);

This will fix the regressions like the one reported by Geert:

https://lore.kernel.org/linux-pci/CAMuHMdWuCJAd-mCpCoseThureCKnnep4T-Z0h1_WJ1BOf2ZeDg@mail.gmail.com/

- Mani

-- 
மணிவண்ணன் சதாசிவம்

