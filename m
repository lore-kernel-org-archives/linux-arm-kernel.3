Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1C6CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amPh/xh5W4B/VVjH4i+ndMFiG0NuCzFtjKIw4/O7PU8=; b=jSfx/m2fDo061AtYi/AR0VXb5d
	sgz8v2pc2dQLKT/hqnlIEaUt5XPFjgMUizItipMP/DVTECn9B9FqRhxW29mUg8MFI2GNlIEy26OAG
	apJEWbzhk6AlKmt1DMv2MhzS1+FDOqhyYhwhlzIyHB9y+9mpF+jqh34+6xv7Lm2gFSvxIDYVuCfJ4
	uFb7GJ0W1Vmz4a6+JioiDGG2xeCWH5qtMYGz5ymfuhkB3X4Q/T7Zexv4ywg3iH8vT1S3A7BqqkeFD
	QdbvQrG+7TH0a1qFmsjgUQqaHD2g85r5ckhIzsfUbNed/mU0jRMsEjeut4L9fml1T/wsm6rp3bEmk
	HbWfmmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfc-0000000BtdW-1gZY;
	Mon, 01 Jun 2026 21:59:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfb-0000000Btak-0gCz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 21:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=amPh/xh5W4B/VVjH4i+ndMFiG0NuCzFtjKIw4/O7PU8=; b=Y2Vo1vz0O9gGnxnw15MOpMfviL
	am5wtEmLrRCorrJKkesz+zVZXSNtCuMKVtgUPi4JCFXVxnMlwWz7SUu6lxoB9q/8AZwbz13vSzNAq
	+i6IRQE/b0M7EZW/Nh6xqhWHrSqjyRenTVjQJxM/Zx7dWOFdSbMrueWl0rwibsjyYxkp++DCQWpuN
	1Vq8WL517+O53ZaVv3kxbdy2gWnCsxwlJR7UmriAdq5r6tNzN9H8LlmrfeWt2YiH1KOotLFPHn9WZ
	eJygxSkaI/bcVkRy5iS9LmqTdDxzl4czr+X/Z6MRtPbg2wU8swaJT4Mp7KZw5+Mb5GWOaCThNSewn
	4K+FAmLQ==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfX-00000007otB-1DBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:38 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c0c36f4b76so18806665ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351173; x=1780955973; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=amPh/xh5W4B/VVjH4i+ndMFiG0NuCzFtjKIw4/O7PU8=;
        b=eQcHs76ioah7U6s7OpRpZNHqILjKy5G1aDMVKQT9pw2/p7L82QT52YsWEtqIh/5DND
         jmHdMvkyNsZeS7eV2f5ylbpPYOqGwBbNeO66iNw5LQzLs91WASQKiDceol/09SV3telx
         T5LKRhAs5nQcpdLmzeevFzh+Zu57ZsQkCgxuUjybCRUsEfqIw88C9slNkgY0Mtr+4A8S
         wYfBec5vKfZjieaW76NkvbDwodMtvyEAu+/HUggQBzhTYCSab5IvRAJoie/uB/MlCH7b
         RvMpPaTZr1GC71+REpMsjcq/nzeNtPcMj1mDOgzeDTAc/Wu+gdPwm/y/MZH78XoMPbb5
         q+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351173; x=1780955973;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amPh/xh5W4B/VVjH4i+ndMFiG0NuCzFtjKIw4/O7PU8=;
        b=OOxcMYDypCz1jMnFBdSULN2eDLNc4Wx8M49UC9fNKYZfRjHt9fxaDyXRtrDLfgi8RW
         cpVDAZeqAg/VSc/xYUsw9CkU4jF8McwqZW8pQ8jKQZSVqvq8pRGIGC0SlHlAxHzdRy7B
         A+tpb6MzYepPaXX1YwpMDDT3Z+4KBx1E6tGqoKYTtOz0VzRFjI1yDTb3o6yPYb5PT4UR
         vqqKhJUpxDmpY1YYGN3cmw/raEsqKdBhQRp5SkYybUorqiNDAELjPbKaHF7bR/qHhBg1
         my5x9R3Jn1Y2zlIjwuEkhPqJczhhz+/MmuBWLtPUBtR3q0xWMf5LLdec0eUcyB9WhPYU
         5zkw==
X-Forwarded-Encrypted: i=1; AFNElJ9mn/YBDTDlFoveyzhR/uuvobunk/+JUQE8FkNPvA1s2gIkwNT/wezAMKGPLM9+fqG7YeoSBOBzT3+frmsOeYhy@lists.infradead.org
X-Gm-Message-State: AOJu0YxwkNfdK+ya9Pbjxy5gHqOuCBhrs9eMuMt9YgLA1dWdSmBgaAZl
	PGRjKNCTEkimAlGOr5YGOFcsOimtzY+t3PxVZgbPXiFVs7cmO07T8QSii1DpTqA2BnKVGMwtOPG
	wUA==
X-Received: from pleb20.prod.google.com ([2002:a17:902:d414:b0:2ba:856e:d046])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1905:b0:2bd:2de3:5181
 with SMTP id d9443c01a7336-2bf367ab2aemr145926765ad.9.1780351172519; Mon, 01
 Jun 2026 14:59:32 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:07 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-11-praan@google.com>
Subject: [PATCH v8 10/12] iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_225936_001014_F9113A4A 
X-CRM114-Status: GOOD (  12.11  )
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

Enable PM runtime for SMMUs having a power-domain during smmu probe.
Add a devlink between the clients and SMMU device. The absence of a
power domain effectively disables runtime power management.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 542de3a3173a..24a1bcc8974f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4243,6 +4243,9 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 		pci_prepare_ats(to_pci_dev(dev), stu);
 	}
 
+	device_link_add(dev, smmu->dev,
+			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
+
 	return &smmu->iommu;
 
 err_free_master:
@@ -5607,6 +5610,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		goto err_free_sysfs;
 	}
 
+	if (dev->pm_domain) {
+		pm_runtime_set_active(dev);
+		pm_runtime_use_autosuspend(dev);
+		pm_runtime_set_autosuspend_delay(dev, RPM_AUTOSUSPEND_DELAY_MS);
+		pm_runtime_enable(dev);
+	}
+
 	return 0;
 
 err_free_sysfs:
-- 
2.54.0.1013.g208068f2d8-goog


