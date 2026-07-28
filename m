Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E89C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvJ6dCJ/r3ejrKV4VTH37NoCe/nuy0ucT0mO8Cz+CaM=; b=0fFI/aj1YOPysCBgKIDaYdN0iz
	8lfBGubMYfRbyOWIkAaO/231crdwkFTr3mFeHqj+aTHAcl1KmJkjNmuxgn7dZ4UvjFJZMbchd3v8w
	0kwwvwOtqQ8FA9CBuD9ZyI7+LhOYDjxaheAqK2HNUs3ABCHnvUSpoiBhzd3bVY1zZxQVuYujUIcGx
	oKrJdH5zeXFaAYcTQuZI8JhlYE7pSr1zkGGNFZgiHemrbxGGG6bpuXqS5jzkFQZVOXhwP8N6l0Hy8
	5/1z0HmOkVMQWwyGzzfMoyFh5myLpDVu6Ko/VfSess83mXSEZ/f5ft1PPRikPFC9TEcYdneeetwn7
	/G4dQklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop4R-00000006H2E-3JfU;
	Tue, 28 Jul 2026 21:10:39 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3o-00000006Gal-2YeD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:10:02 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8484f26852dso241483b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272999; x=1785877799; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvJ6dCJ/r3ejrKV4VTH37NoCe/nuy0ucT0mO8Cz+CaM=;
        b=es1bqq8sNQ6Oxa0Nt/bpXep62hxAMiqI9L9skV2XkcvLytlsQHP50RQxD8oMQaYzho
         qVcK8A/Ens6Ia36pDeH9qzPyzOCVqUQQjQgYWx2fz8ZtQl9rcEKZ/mGxtPBbmr8Nd993
         JW0g8iwMtVp+muD3NxIYIQunnzs9KN/nIdZF2a8OrRPHuDzoMCWND7ykUTn4tsy11b4G
         JAXH3Kz8WV8pggfNf2cPrULEC+wvR5kA6mR4w3X9pw+6TG5E3tUgaB461Ura3pylJ3WX
         iBNP1s4Aufip5hgNpo8UMXqmw157gNhzDTLrO71jmoeYGQS6COMsxAK01x5wlRz8SYpT
         yNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272999; x=1785877799;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvJ6dCJ/r3ejrKV4VTH37NoCe/nuy0ucT0mO8Cz+CaM=;
        b=H+YtmypgQQdL+oZEUNIK95bGWaK1ajnd9h8jsOcinGHizQOeiky5hgk9UnuqmYLfv/
         QWDa4JPryUtIjaISxaoNqYteZiPT51W03nujVLbFnnlHjdOk7S5tbePFnp7cetGmIKC1
         i0ch4qijvzEhRcnspkvejmgtwlgJWrwx/G9DRX6mgIwzXFgi8dWb3ZR2VBB4o01WoJdW
         s8BHFgv3ZI2GHGfQOmctE0EK+zC28KYyipn/ShHrslxHeyd7nUQAYPjv48SjdCQOFHQA
         Cr/1kkOqtE4/YGLViPyNmt3AjPRwkIhtaAQJ8e5kxoPF3W//BjG/DE2pr93gdxbzLqdR
         7+3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqfMC2yMp7d/XoVIIRClDzHIYEb2ZEy2GDFQBoN5wMtxwSSWyXlSj/ADAKYnqJV9sRkUC7fmaOoaJqfP8kU07sU@lists.infradead.org
X-Gm-Message-State: AOJu0YxaUd1USVl7bEfSRowD2imEbzDVI/21iTzBsj5sh0mXweLUFQQe
	2IMhiyk2xIOVlF+4QeiMWdS58RMNtEIAfZToMMEex/bT/UFz1xavnOQnxZxaBFjeysfvA412Vt5
	24g==
X-Received: from pgkc24.prod.google.com ([2002:a63:ef58:0:b0:c8f:d0d0:d863])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:cc6:b0:847:7a61:e68e
 with SMTP id d2e1a72fcca58-84e9316ba86mr4232449b3a.31.1785272998794; Tue, 28
 Jul 2026 14:09:58 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:26 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-11-praan@google.com>
Subject: [PATCH v9 10/12] iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_141000_676822_BD679263 
X-CRM114-Status: GOOD (  12.31  )
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
index 5f0e01dc4f6a..1253065b6db4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4431,6 +4431,9 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 	if (ret)
 		goto err_disable_pasid;
 
+	device_link_add(dev, smmu->dev,
+			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
+
 	return &smmu->iommu;
 
 err_disable_pasid:
@@ -5821,6 +5824,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (dev->pm_domain) {
+		pm_runtime_set_active(dev);
+		pm_runtime_use_autosuspend(dev);
+		pm_runtime_set_autosuspend_delay(dev, RPM_AUTOSUSPEND_DELAY_MS);
+		pm_runtime_enable(dev);
+	}
+
 	return 0;
 }
 
-- 
2.55.0.487.gaf234c4eb3-goog


