Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FB2C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=z4K2GXVJiuaKILQGQTItkLUww/Aie+jD+a1eWqS2IOU=; b=LLu9v9Py9FggrW
	nKx9Ko+g1wUn+YzEn1FeGL+46E88OEguuW1yIH2u/eSnO5fygV4x7x25XCpGY+d380kBVP6srTYa2
	Gx7BZOSriPHa15tD6KIbO/My4eK+yIoo6nfD3zieLHtegFDfw5fCj0kr3zkCE7m1PndFrDK2TXS2/
	9YI/BEuBnY89XNBJ3d5qjG3Kn0kJJSNBkDjMgZQhBUR4FN+BUWP93rgvXqo0blPXuMvBxr5YjNaDz
	7dine97kOM9uavyJYPiKafXer2q7ZFTLIlP7P6sYsCj1LNoB7Ipt6lrZ9EML+g+ZafNYZFVJ/LSg6
	/IL/KrJ2tjO72MRzhpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHwy-000000031y3-14BJ;
	Mon, 30 Jun 2025 17:05:48 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH8q-00000002qrX-1v3g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 16:14:01 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-407a6c6a6d4so1468181b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751300039; x=1751904839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z4K2GXVJiuaKILQGQTItkLUww/Aie+jD+a1eWqS2IOU=;
        b=cWsvbHnM03TMo6qahUnnFZhNnUG0cWeT9TUlnShfCe5oYfxYL3wjzJathlk11Zq0NQ
         rYP9amftw3CX2DxP6Mu9GqNh2chPrHc54/jwHIcXLRCnApYRlDf3PsvGpGm8mYUo1ZC1
         2MsT0KMxjG66ziQW77iqEFfXLXd1AeH2HloPAvuLKiZZRN6GVSVngE0EZl47If4G3CD/
         1e9djRADZh/TiKiZeDfXmMuSNjtSo1RAGQP1UqwLSWcH2ImoxRxqAPcgA7w9+6M7ElHG
         k6/8b1lCOhC5o0omLnY2vOxHuHSOUpVPXZyJ/s/ePsEk7VyDQ3zupv8lxG3LlkE1BRCy
         zHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300039; x=1751904839;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4K2GXVJiuaKILQGQTItkLUww/Aie+jD+a1eWqS2IOU=;
        b=RCNVUxgp0S6DTX8UFBqCPHMaaFG1nGiIWLeyuvY17Vo6Rb6BPSte9FTg/GuWuvk/DT
         K3ZWr++mAKmHRKXQ6kAtHPW1zSxAkx/YyXXbbhBZMwjdA7zfmHRR4s1EQldJGQBzVgfD
         YOSo6ef1S0/aco2jw2kMxQ/itLWd6oEtvmI5AH8geXPeNOMSTwnohmNiPxlo+j5WRY51
         l4r4lpGWObKHE0l2o6tKioq75xjx87Ti8EzayOOG7kWN2NU9TdjC3aDcYrJRwSyhKv0A
         dFgghxIfthOM6OoTFyRqI57Gc2co0OfoKHLsYGIFxxklkXqoY3xkw5ioQqpp1U1nUy8r
         uPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcKNJ33Hmhu1fJ2dGu9sUigOGLmBH/jw3QtSd050E+Xu8DsCQnSI71UW0w2CP42BpgZRkrLbzZu3SdB8RbyFBB@lists.infradead.org
X-Gm-Message-State: AOJu0Yye/saYn9Nx5Brc4lCI/VMR9uYJ1k948AspXmooM+D/hOA5d92G
	cPla2OoSfm++AZQIcnsOF4eDrYCbG3bNZSCbvxlJq1iB9uMhVqm6NoQ/wIf+bCZ5aIA=
X-Gm-Gg: ASbGncu1eH5HOXRrJHS92x6w2eVAOQmyh/UQJyfTBHe7HZSII7Sp25v248RH6Mu2vyu
	ReWIlSCgVnqw1oQUtV40fl4MHRQR0P9lI2S/Y/+vT3odi69L3xERlWoB4jeUZzyEqLtXscAmiXV
	cxiL/gOECseQ2aX4XvxYlYnYieN4QslIICyWPsL3tHo8wTw7dJm78qzkcuYNnV8618FdVa9a7gX
	WVd/FzwZnFVvyHXAgvWghG3qMSW0AzihaC2c1GEW/ZRVHKaVM7VWahHsXPJ6PNu5GdTRCI7lN2X
	tISReD4xuYeWpbjnohgwXXMdRyBu6M1CXlTmY5CU4tn15Z2H7H1Wm48gYhxvxR3PAGQT
X-Google-Smtp-Source: AGHT+IFAFlASv7Ojn6bTOl96SOGAN68965wAV7Dt6BYrHwwgQEMEUSNQsxpaQz7AhcjUol0ME8awag==
X-Received: by 2002:a05:6808:4f54:b0:404:764:f7b6 with SMTP id 5614622812f47-40b33c469c7mr12480268b6e.9.1751300038962;
        Mon, 30 Jun 2025 09:13:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32406a58sm1743722b6e.29.2025.06.30.09.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:13:58 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:13:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, nicolas.dufresne@collabora.com, jgg@ziepe.ca
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <9d247bec-d206-495e-b8d6-23a7c3cc0882@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623153931.158765-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_091400_500895_30F31EE3 
X-CRM114-Status: GOOD (  10.01  )
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

Hi Benjamin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20250623-234734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250623153931.158765-4-benjamin.gaignard%40collabora.com
patch subject: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
config: alpha-randconfig-r073-20250627 (https://download.01.org/0day-ci/archive/20250629/202506290711.T0HOr5wS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506290711.T0HOr5wS-lkp@intel.com/

smatch warnings:
drivers/iommu/vsi-iommu.c:657 vsi_iommu_probe() error: uninitialized symbol 'err'.

vim +/err +657 drivers/iommu/vsi-iommu.c

15ea72d5401fb7 Benjamin Gaignard 2025-06-23  639  static int vsi_iommu_probe(struct platform_device *pdev)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  640  {
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  641  	struct device *dev = &pdev->dev;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  642  	struct vsi_iommu *iommu;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  643  	int err;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  644  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  645  	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  646  	if (!iommu)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  647  		return -ENOMEM;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  648  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  649  	iommu->dev = dev;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  650  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  651  	iommu->regs = devm_platform_ioremap_resource(pdev, 0);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  652  	if (IS_ERR(iommu->regs))
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  653  		return -ENOMEM;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  654  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  655  	iommu->num_clocks = devm_clk_bulk_get_all(dev, &iommu->clocks);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  656  	if  (iommu->num_clocks < 0)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23 @657  		return err;

s/err/iommu->num_clocks/

15ea72d5401fb7 Benjamin Gaignard 2025-06-23  658  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  659  	err = clk_bulk_prepare(iommu->num_clocks, iommu->clocks);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  660  	if (err)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  661  		return err;
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  662  
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  663  	iommu->irq = platform_get_irq(pdev, 0);
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  664  	if (iommu->irq < 0)
15ea72d5401fb7 Benjamin Gaignard 2025-06-23  665  		return iommu->irq;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


