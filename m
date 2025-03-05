Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEEBC28B26
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zodeiabiec4o+24nRPQhB7bjurm79o/P+gs1t8Gp0w0=; b=fLZZsE3CLUtfCyS0J+2PRh2gtt
	P/Mhn4ejS5rSGJsz3zkyOIlLQ3vUYxTM7dO4Ovxhlm03/MGn5hrV1g8G3wM0iJJ8WvH51D93BAgcs
	+fZaHYHMdhSyPeWLyw7UD0pfm0onl/Ly2FZ811adIQ++qwZSR1Cbl4NQcoUhYr/KfuMiM9cR3Swym
	LnK1VTN+2DekJiQZYLKmpcnQ2v5H0NWBYFRmIFh9IjK/1IgxEnt8Gln1V7ZFyRnUR3al7El6blsZU
	HLIg9qk6OfqiMrdDQNXFUZl+IFrFayFs+psEL7o3p5Rujsib299fpp0dkawzmiuvxt7B6dboE5M+B
	L0Rstz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvfc-00000009GXH-1W21;
	Wed, 05 Mar 2025 20:48:48 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu7y-0000000920Z-3u0I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:10:00 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fea795bafeso2316069a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201798; x=1741806598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zodeiabiec4o+24nRPQhB7bjurm79o/P+gs1t8Gp0w0=;
        b=LRrTjEL+K/aAzla4ECMy4j6oCo6k8v68YEjJ2FAF4ytq6wBT1DSNfdHIEzEdpNgCWe
         3tFLSNCdix2mxWXzQ79/rFwdzWZAuOSY4dJbU4YlgnQ3hIe3+2+sXBrF/s8qZtd59XK5
         yzdpWb9J9tieUNUpFYBrd/QjFE98yxvW3oV+QQvk59VMrTc1soeiygCcsOGgedFOA6mt
         YuQeGEBWQAapAQM2KfqZlNpIBIbGC3sWouOgR0YQUw5jxCOaVpy/UZAWwfAp+7x8bkud
         Ff1fGLa5N7qlBHjkSh+bGyO3yzRLIGhiYQLTaQR/rEP2ju3lbYWCWyGq2NYQYpVCB24J
         WSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW65+iSB4TH+nvipwcqsH04Qa21vQAHTyEF1wKSuKj5C+3TAKLq1fyfH3jWeFvwEH7lzHCJjbf/u1tkfQfeK1zz@lists.infradead.org
X-Gm-Message-State: AOJu0YwECLJgW/F7kn0Bdif0/+5CvYaT4Jj0Afnyd/wenACMZ+MvzN4Z
	ubvsAhPVOiGfmPRiSAvd1FcfBP3BTyqIuxpZawr/7Mhj17/lajgS
X-Gm-Gg: ASbGncs3ckPZqOGHbOVIBxi38kFHPJ2Qs+w9r/a6HL5PRxlKRtN3dVbsr6fp896AM9S
	tdqjBwnkT32Em7stL2xrTWywRpSvrUP2dCsJC+V1AZ+lSuoRw8VUhWDgiizbXmPolti8wdcSxmY
	WoG/w+PhBZg3bi7MqwXygedSbcubb/TPDPt/YWgsOif+R+J4fCcnROVb/Qqug4mtrzl2Oxb1mXc
	9qLLPsOhw+UVs254xRunnKNvpw5kWbKj+HN3F4d1GGUPXshawiaigPOgiGE1njgfVQoa69IRtc+
	sTZQYt2GqWUygwg9n+kFSa2/cbNLwLhM6w3CBic5Fc2R+h+GwZnMhaPBT7McoRpPLaz1CXpsqbn
	Qprw=
X-Google-Smtp-Source: AGHT+IGNbRJpJbMeXjomF31jB4KIZE5TJ2wjy21GKVWmGQR/3PyTIYjAGlF+BWxQ8A3iKolTn3utJQ==
X-Received: by 2002:a17:90b:3ec5:b0:2ea:8aac:6ac1 with SMTP id 98e67ed59e1d1-2ff617b5145mr663825a91.15.1741201797566;
        Wed, 05 Mar 2025 11:09:57 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2ff53eda418sm1213607a91.45.2025.03.05.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:09:57 -0800 (PST)
Date: Thu, 6 Mar 2025 04:09:55 +0900
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
Message-ID: <20250305190955.GK847772@rocinante>
References: <20250304171154.njoygsvfd567pb66@thinkpad>
 <20250305173826.GA303920@bhelgaas>
 <20250305182833.cgrwbrcwzjscxmku@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305182833.cgrwbrcwzjscxmku@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_110958_967554_803847B4 
X-CRM114-Status: GOOD (  26.29  )
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
> > > Even though debugfs_init() failure is not supposed to fail the probe(),
> > > dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating that
> > > failure would be canolically correct IMO.
> > 
> > I'm not sure about this.  What's the requirement to propagate
> > devm_kzalloc() failures?  I think devres will free any allocs that
> > were successful regardless.
> > 
> > IIUC, we resolved the Gray Hawk Single issue by changing
> > dwc_pcie_rasdes_debugfs_init() to return success without doing
> > anything when there's no RAS DES Capability.
> > 
> > But dwc_pcie_debugfs_init() can still return failure, and that still
> > causes dw_pcie_ep_init_registers() to fail, which breaks the "don't
> > propagate debugfs issues upstream" rule:
> > 
> >   int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> >   {
> >           ...
> >           ret = dwc_pcie_debugfs_init(pci);
> >           if (ret)
> >                   goto err_remove_edma;
> > 
> >           return 0;
> > 
> >   err_remove_edma:
> >           dw_pcie_edma_remove(pci);
> > 
> >           return ret;
> >   }
> > 
> > We can say that kzalloc() failure should "never" happen, and therefore
> > it's OK to fail the driver probe if it happens, but that doesn't seem
> > like a strong argument for breaking the "don't propagate debugfs
> > issues" rule.  And someday there may be other kinds of failures from
> > dwc_pcie_debugfs_init().
> > 
> 
> Fine with me. I was not too sure about propagating failure either.

What if we do this?

diff --git i/drivers/pci/controller/dwc/pcie-designware-debugfs.c w/drivers/pci/controller/dwc/pcie-designware-debugfs.c
index 586a9d107434..fddf71f014c4 100644
--- i/drivers/pci/controller/dwc/pcie-designware-debugfs.c
+++ w/drivers/pci/controller/dwc/pcie-designware-debugfs.c
@@ -162,7 +162,7 @@ void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
 	debugfs_remove_recursive(pci->debugfs->debug_dir);
 }

-int dwc_pcie_debugfs_init(struct dw_pcie *pci)
+void dwc_pcie_debugfs_init(struct dw_pcie *pci)
 {
 	char dirname[DWC_DEBUGFS_BUF_MAX];
 	struct device *dev = pci->dev;
@@ -174,17 +174,15 @@ int dwc_pcie_debugfs_init(struct dw_pcie *pci)
 	snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
 	dir = debugfs_create_dir(dirname, NULL);
 	debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
-	if (!debugfs)
-		return -ENOMEM;
+	if (!debugfs) {
+		dev_err(dev, "failed to allocate memory for debugfs\n");
+		return;
+	}

 	debugfs->debug_dir = dir;
 	pci->debugfs = debugfs;
 	err = dwc_pcie_rasdes_debugfs_init(pci, dir);
-	if (err) {
-		dev_err(dev, "failed to initialize RAS DES debugfs, err=%d\n",
-			err);
-		return err;
-	}
-
-	return 0;
+	if (err)
+		dev_warn(dev, "failed to initialize RAS DES debugfs, err=%d",
+			 err);
 }
diff --git i/drivers/pci/controller/dwc/pcie-designware-ep.c w/drivers/pci/controller/dwc/pcie-designware-ep.c
index c6e76a07c2c9..11ff292ca87d 100644
--- i/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ w/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -838,9 +838,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)

 	dw_pcie_ep_init_non_sticky_registers(pci);

-	ret = dwc_pcie_debugfs_init(pci);
-	if (ret)
-		goto err_remove_edma;
+	dwc_pcie_debugfs_init(pci);

 	return 0;

diff --git i/drivers/pci/controller/dwc/pcie-designware-host.c w/drivers/pci/controller/dwc/pcie-designware-host.c
index 2081e8c72d12..6501fb062c70 100644
--- i/drivers/pci/controller/dwc/pcie-designware-host.c
+++ w/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -548,9 +548,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (pp->ops->post_init)
 		pp->ops->post_init(pp);

-	ret = dwc_pcie_debugfs_init(pci);
-	if (ret)
-		goto err_stop_link;
+	dwc_pcie_debugfs_init(pci);

 	return 0;

diff --git i/drivers/pci/controller/dwc/pcie-designware.h w/drivers/pci/controller/dwc/pcie-designware.h
index 7f9807d4e5de..dd129718fb41 100644
--- i/drivers/pci/controller/dwc/pcie-designware.h
+++ w/drivers/pci/controller/dwc/pcie-designware.h
@@ -815,12 +815,11 @@ dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
 #endif

 #ifdef CONFIG_PCIE_DW_DEBUGFS
-int dwc_pcie_debugfs_init(struct dw_pcie *pci);
+void dwc_pcie_debugfs_init(struct dw_pcie *pci);
 void dwc_pcie_debugfs_deinit(struct dw_pcie *pci);
 #else
-static inline int dwc_pcie_debugfs_init(struct dw_pcie *pci)
+static inline void dwc_pcie_debugfs_init(struct dw_pcie *pci)
 {
-	return 0;
 }
 static inline void dwc_pcie_debugfs_deinit(struct dw_pcie *pci)
 {

I think this would be fine, especially given the rules around debugfs and
a quick look around Git history to see what the prefernce would be typically.

Thank you!

	Krzysztof

