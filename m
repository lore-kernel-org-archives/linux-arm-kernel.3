Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E45CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNxwchrCVk662oSbzWaO9dPKaw5cPiYbeEGKTdYgRqw=; b=k0AOQzZ70jxHILr6N459s2eE7q
	ZFaPkTGFT44aRCkUo23KoQtU6RAoezGMH7ixI551QqJcomWo/4m1bLGiXirs+5ZXnJl2ZC7w5aDPy
	vnX0xj4TzlmpDnDESNrnXWd8peKLEbvaY6PLc0UWkOJfDt8UT9RJQDvU2iY9tsQbZaK+il0ww2/z8
	cOmgOwJAJD+9ccc1JQ6asWXvb35ypJlZjfH/whZjIfovQ1M4zSRLfisVd4Of1dmj0z95EsgUGoeGo
	lVTdcf0/GjaMf+y5jsQ+FdOEfyWMSHRQjqwU+cgRJwIBHiCjplOIcHARfJYudCm9j6IH+JiD0sqy/
	TyHi+TrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiPc-00000006PYV-2muD;
	Thu, 28 May 2026 21:37:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiPZ-00000006PY6-3T7x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:37:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b46da8c48eso1045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780004225; x=1780609025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNxwchrCVk662oSbzWaO9dPKaw5cPiYbeEGKTdYgRqw=;
        b=adHZnYvurqqAuSXgG1ipOwh1/7Ap3CU98UZyflRBtSurw/fK8LYMF4021TqIl20Fpm
         yARePiVz/bwBluTwOk6eDJdEGO2myZAkFC/ZItiIdZJgdH81lx+rfl+pHpxnc6fehUAc
         CVJR+D+Bx/+ZiZ0huBFEwnfiUzK7gOFE2CXRbjXeJifvzEFXCrXgFKPTMCN69muNKTxc
         sK6zyZpKVuWs6LhztvaAYrawu2EMw9+w1hlzxQXKGLswKKW6uWgVb1b9CFXYqH1d+JyE
         tMKMqE0bqO8gtE3GbGvOMNj6xasCKdD2uDGIhsezSAksGs2s0kJaKEeNhQPnTmigJjQS
         tE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004225; x=1780609025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNxwchrCVk662oSbzWaO9dPKaw5cPiYbeEGKTdYgRqw=;
        b=js74mwNGCVjoD7hyPKxPSnaB+UfxhpyXP5iVCQ5AcIzLmXaVWRYOrhNEENfx4MDsTF
         X7qTvxUjnBPvOfhRkU3pCACqpZCUnF4+ESOwGySL6qKTT9qIYXf1MWNgQadQMUfmQ8LY
         GTpPpmTZBRJXJiE3h2qWc3z3ywiO627mBNN2lyiQTxGHawAkBZXzXR6K31UhGVRB183B
         s8AFhBcAB1Pnnf64feSRQHFfKQZWXvuo/vAOi9WvPnPKrBqpOwgTmgPJIQuyXGkl8oOO
         wLrgFZogiS+4jOgPWLeo83ljpnBCPe4iYgeXm0wxcD3dWrEKX4zKgy1bMQojoP4sBBLa
         dLCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/F3+uGxLME+b4tAQKpnH4LssawD25Oog6OKFZkpyQ1O1QBgBLwIazjXNiH+Iszt3AhKooVwkd7OexZG2clSNXd@lists.infradead.org
X-Gm-Message-State: AOJu0YzLmPYulGnDoykcNAdWWfkk2xFjZVLDDw5xEsm5EFDmGXgtFAfL
	W2nbkTL94kDg6nEx/E/ylyAQt2H7IAlRmeharFR2PxxPaLXYr4PCcpqmX2UIhozzJw==
X-Gm-Gg: Acq92OGtLvNYkDyRzrqhbqxh/I0q7rjLiuRHvMjElNU9p4b835P9qeUYpA4d3iWvTpT
	1nmSu+u93Y8t8pVrdIug0+iBtyl8axsdi3PBafKtgaoGE9EMCFAG3Q88Ybf6nl+qUkrMqcfCcUw
	hOOK4kgVkHxxAltgN6Wf1ZfvzzgyPKkZA7mOP6NdWRL3Yvfk+HIbxtW1ggQhFw9IigCx3JcOwh/
	uA2Z+35IcT4kKs8VTOGELeAaXKDxiqppYi40XaVHAq3SwgDg3LrBL1DIyRT68fxsj7bfnife+qQ
	EuYLjFu/RH5GG/L5YC7HgA7rF9nAXNr6867CWA6CsouifQ/AMbk8BTkadShJDzaX8n5DJnSiKQn
	2vic992NhPhyICZIc8nke2qI7TDEgtAw3U0btY26hZF0d0c+kpx+KI1mJcfcXm+Eg+B6dHNeiaj
	XmryCqlLJxWjvs3W6PsntYje+yAAY+As7zICBHTgbSREobmeq1S8hd3WpP+TDo1etZjnVT
X-Received: by 2002:a17:902:ccc7:b0:2bf:193b:a195 with SMTP id d9443c01a7336-2bf20d9490bmr96165ad.11.1780004224411;
        Thu, 28 May 2026 14:37:04 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841ef4e9ec7sm2669092b3a.24.2026.05.28.14.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:37:03 -0700 (PDT)
Date: Thu, 28 May 2026 21:36:58 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 09/11] iommu/arm-smmu-v3: Enable pm_runtime and setup
 devlinks
Message-ID: <ahi1er90buWo0mWk@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-10-praan@google.com>
 <ahih9IQ9jPS34mZX@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahih9IQ9jPS34mZX@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_143705_869836_3C3DF8E9 
X-CRM114-Status: GOOD (  18.05  )
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

On Thu, May 28, 2026 at 01:13:40PM -0700, Nicolin Chen wrote:
> On Wed, May 27, 2026 at 10:14:05PM +0000, Pranjal Shrivastava wrote:
> > @@ -5592,11 +5595,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto err_disable;
> >  
> > +	if (dev->pm_domain) {
> > +		pm_runtime_set_active(dev);
> > +		pm_runtime_use_autosuspend(dev);
> > +		pm_runtime_set_autosuspend_delay(dev, RPM_AUTOSUSPEND_DELAY_MS);
> > +		pm_runtime_enable(dev);
> > +	}
> > +
> >  	/* And we're up. Go go go! */
> >  	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
> >  				     "smmu3.%pa", &ioaddr);
> >  	if (ret)
> > -		goto err_disable;
> > +		goto err_rpm_disable;
> >  
> >  	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
> >  	if (ret) {
> 
> Can we move the entire pm_runtime_* piece at the end of this probe
> function, like arm-smmu v2 driver does?
> 
> It is no-fail, so we wouldn't need to add the revert path.

Hmm.. I kept it earlier since I thought iommu_device_register starts the
whole chain of probing masters, def_domain attach etc. but I guess it
could work, the client devices can attach during the initial probe
as pm_runtime remains disabled until registration is complete. 

I'll just check if there are some weird edge cases here, just to be sure

> 
> Otherwise,
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks!
Praan

