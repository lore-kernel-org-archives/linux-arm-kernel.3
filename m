Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE8AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYSaQxxv0yy3Y7EMVpbwK7SrDhDexuagcipLxM0lKzk=; b=Xq9v+t8bXsNsxSL0Oqwe8ouTRd
	CEqpB+hiIMaM4Vc/BOxyMrqnwoTazrQVJhd+9XiQKb1BVicEnaLmRw6MLVdasx7ZAmOrFdGmLy/Zv
	JskhTTH4vw1qg/lT2tGk/qAeRmqUyP8zb9F2K3clYQKF7Ws/DqDnxxjsJpZzA6Fay65SNnKrOR+zt
	7gsld7+rikK+3XDELbjVjxpdNgr7Ad6bQ3WN8V/BV453XNaiLQ3YZLYH0i/r5I4h3P3KJ8dUei79E
	ExU/p2a7GbL+5mbNbf0QkGe6l8wgaOk8eiEtL221HS0ASzC3soapqVF1PT3Jv7M+cIv6bVCm7RCfq
	tK7jOK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTih-0000000FHrH-1VhP;
	Mon, 28 Jul 2025 19:41:11 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2h-0000000F8tq-0n1f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:44 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ae70ebad856so332780466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725221; x=1754330021; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zYSaQxxv0yy3Y7EMVpbwK7SrDhDexuagcipLxM0lKzk=;
        b=38ylnLueVh9UKzvyiAAL6n/g6WFua94CoT6/Kzvvr3FJgooX/ftWYqVeezm6NfouRm
         gnO0RqgSIwBA4fC/O9rlcJYZvR5ooENbwg2VE28THpeYjIYhr6DPXi+vj2HdKeb6HzuP
         A6+Cfwh2X+e5wqAgoBGP3LylFL+iblDUcrwKftoHSSvx0szU+zvEyhZN2aCMf0YRvs4B
         jklLza+cucsEt1zMTOsXlO9TecoK3LbMHvnHJm0V9i/QkgaP+uJPIFgAIREXlhgRMH6b
         g1MWwcNiPe2CO44ZM6AG5m5G20Wfc3nGFqvVb+PwPFtN1zYrGldc+6ibejaicGjAumSo
         oyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725221; x=1754330021;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYSaQxxv0yy3Y7EMVpbwK7SrDhDexuagcipLxM0lKzk=;
        b=r7IFmLcH3v8kiFoovbWSALhMtmcrZb+wbYugHFwz33byJbNTBWNbtEydbBfPA6pxLH
         Yr/qwXpXQmT8yj52XmsgiKbTHXK8hWkw1oRAxkyBks7lcp/5SSKXC3LIgF5ZLQ+MLw1R
         +ttXogIIunhVoZi9LMWW2OFAxyfknb9bNL9Fa0mmBWeLSabdg/5l99bgfiPwEwuQIuto
         Y2fGNx4Ppc8GkGfzUQKXQIZp7qQcnqFuM0ppCWntlyGxCrlszzxmG9YUVgeV6ml2H/OL
         ziLF/M5O+O+sgb1ZQL+F90dd8XPma2M9i9Q5jRIaFElYUhUj4luuLtKKsLNyqeLT+fYX
         XhSw==
X-Forwarded-Encrypted: i=1; AJvYcCVBd9wn7NRWTOrPBhMoTSU3cHt6Tudu60b32ZROciHOZLigAEZNG+mIdpcJvbhaz4nj7kLZvJ3j4/7OOEv7XW1m@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqa8Vjf5g0pG+dhzh2iEwYeLD1HCXHAVcb5iDR3ory1ssJLAL8
	iHzsgfu/gv5jNljicofvhuKX4hJdI1aNQiNMeFJQM7tK5vz5C0K505PY7aWE8obI/FZn3AoY0fg
	steR29gEfb86TvA==
X-Google-Smtp-Source: AGHT+IEqJ30qZTbb5uhq7Ulncx7YgH8wYLGAX5KY0xkgcaQRC+MirKkQi/xoWXPkKjKloEcVMUK+yOS2vLoJOA==
X-Received: from ejcry7.prod.google.com ([2002:a17:906:8d87:b0:ae0:d1fb:d297])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7b8b:b0:ad8:914b:7d0b with SMTP id a640c23a62f3a-af61c2adce9mr1312173166b.11.1753725221260;
 Mon, 28 Jul 2025 10:53:41 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:52:58 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-12-smostafa@google.com>
Subject: [PATCH v3 11/29] iommu/arm-smmu-v3: Move IOMMU registration to arm-smmu-v3-common.c
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105343_232703_10236EA5 
X-CRM114-Status: GOOD (  14.93  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The KVM driver will need to implement a few IOMMU ops, so move the
helpers to arm-smmu-v3-common.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common.c      | 27 +++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 18 ++-----------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  3 +++
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
index 835eeae3bf5e..7453d9894ca3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
@@ -671,3 +671,30 @@ int arm_smmu_fw_probe(struct platform_device *pdev,
 	else
 		return arm_smmu_device_acpi_probe(pdev, smmu);
 }
+
+int arm_smmu_register_iommu(struct arm_smmu_device *smmu,
+			    struct iommu_ops *ops, phys_addr_t ioaddr)
+{
+	int ret;
+	struct device *dev = smmu->dev;
+
+	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
+				     "smmu3.%pa", &ioaddr);
+	if (ret)
+		return ret;
+
+	ret = iommu_device_register(&smmu->iommu, ops, dev);
+	if (ret) {
+		dev_err(dev, "Failed to register iommu\n");
+		iommu_device_sysfs_remove(&smmu->iommu);
+		return ret;
+	}
+
+	return 0;
+}
+
+void arm_smmu_unregister_iommu(struct arm_smmu_device *smmu)
+{
+	iommu_device_unregister(&smmu->iommu);
+	iommu_device_sysfs_remove(&smmu->iommu);
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4cd0a115fc0e..8fbc7dd2a2db 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4138,21 +4138,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		goto err_disable;
 
 	/* And we're up. Go go go! */
-	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
-				     "smmu3.%pa", &ioaddr);
-	if (ret)
-		goto err_disable;
-
-	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
-	if (ret) {
-		dev_err(dev, "Failed to register iommu\n");
-		goto err_free_sysfs;
-	}
-
-	return 0;
+	return arm_smmu_register_iommu(smmu, &arm_smmu_ops, ioaddr);
 
-err_free_sysfs:
-	iommu_device_sysfs_remove(&smmu->iommu);
 err_disable:
 	arm_smmu_device_disable(smmu);
 err_free_iopf:
@@ -4164,8 +4151,7 @@ static void arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
-	iommu_device_unregister(&smmu->iommu);
-	iommu_device_sysfs_remove(&smmu->iommu);
+	arm_smmu_unregister_iommu(smmu);
 	arm_smmu_device_disable(smmu);
 	iopf_queue_free(smmu->evtq.iopf);
 	ida_destroy(&smmu->vmid_map);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 787296a2f0c2..e3c46b3344db 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -564,6 +564,9 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 			    size_t dwords, const char *name);
 int arm_smmu_fw_probe(struct platform_device *pdev,
 		      struct arm_smmu_device *smmu);
+int arm_smmu_register_iommu(struct arm_smmu_device *smmu,
+			    struct iommu_ops *ops, phys_addr_t ioaddr);
+void arm_smmu_unregister_iommu(struct arm_smmu_device *smmu);
 
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
-- 
2.50.1.552.g942d659e1b-goog


