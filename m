Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A837D4336D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7Q6QoEiEO9rPiJbnODG/3JHSdHtA76goK8z9pjG+QU=; b=B9RMrTMjVrHeV2zR7CMaEi7GNU
	YooPJRnjAuJ/UFXgg/LsMppTsdju+PhqX8wy7+Zt/YrmsH8n43MA2w96KwZju0uZZdB+KxcKSNjTj
	dowB0s7vmpdkwxNuFQXggUqhVTwA4/RhAMiyipm7vt2F+02mkVfG8R6Kt1WnGMChjStOE+yFMm+zr
	JVwtO4aKG+gW0Z2LX2aIshAdhYstMLWLZOEJ8lNJGrbQfHsLCYAcB9YmGl8yfH3HZmqwOq8T0oVd/
	tFvZH//8uIYHqhqt4FQCSQmG6p4yG7dalLN3es3WPov/GcdZ6/GkCs91PJPjiQvHqAPlueIn/beR2
	dyW8IJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t942y-00000007NZu-3ZZy;
	Thu, 07 Nov 2024 15:03:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t941C-00000007NJx-2uti
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:01:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E509D497;
	Thu,  7 Nov 2024 07:02:23 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE05C3F66E;
	Thu,  7 Nov 2024 07:01:51 -0800 (PST)
Message-ID: <0952ca36-c5d9-462a-ab7b-b97154c56919@arm.com>
Date: Thu, 7 Nov 2024 15:01:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu: Defer probe of clients after smmu
 device bound
To: Will Deacon <will@kernel.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: catalin.marinas@arm.com, kernel-team@android.com, joro@8bytes.org,
 jgg@ziepe.ca, jsnitsel@redhat.com, robdclark@chromium.org,
 quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, quic_charante@quicinc.com,
 stable@vger.kernel.org, Prakash Gupta <quic_guptap@quicinc.com>
References: <20241004090428.2035-1-quic_pbrahma@quicinc.com>
 <173021496151.4097715.14758035881649445798.b4-ty@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <173021496151.4097715.14758035881649445798.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_070154_860487_88F3A451 
X-CRM114-Status: GOOD (  17.54  )
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

On 29/10/2024 4:15 pm, Will Deacon wrote:
> On Fri, 04 Oct 2024 14:34:28 +0530, Pratyush Brahma wrote:
>> Null pointer dereference occurs due to a race between smmu
>> driver probe and client driver probe, when of_dma_configure()
>> for client is called after the iommu_device_register() for smmu driver
>> probe has executed but before the driver_bound() for smmu driver
>> has been called.
>>
>> Following is how the race occurs:
>>
>> [...]
> 
> Applied to will (for-joerg/arm-smmu/updates), thanks!
> 
> [1/1] iommu/arm-smmu: Defer probe of clients after smmu device bound
>        https://git.kernel.org/will/c/229e6ee43d2a

I've finally got to the point of proving to myself that this isn't the
right fix, since once we do get __iommu_probe_device() working properly
in the correct order, iommu_device_register() then runs into the same
condition itself. Diff below should make this issue go away - I'll write
up proper patches once I've tested it a little more.

Thanks,
Robin.

----->8-----
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 737c5b882355..b7dcb1494aa4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3171,8 +3171,8 @@ static struct platform_driver arm_smmu_driver;
  static
  struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
  {
-	struct device *dev = driver_find_device_by_fwnode(&arm_smmu_driver.driver,
-							  fwnode);
+	struct device *dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
+
  	put_device(dev);
  	return dev ? dev_get_drvdata(dev) : NULL;
  }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8321962b3714..aba315aa6848 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1411,8 +1411,8 @@ static bool arm_smmu_capable(struct device *dev, enum iommu_cap cap)
  static
  struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
  {
-	struct device *dev = driver_find_device_by_fwnode(&arm_smmu_driver.driver,
-							  fwnode);
+	struct device *dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
+
  	put_device(dev);
  	return dev ? dev_get_drvdata(dev) : NULL;
  }
@@ -2232,21 +2232,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
  					i, irq);
  	}
  
-	err = iommu_device_sysfs_add(&smmu->iommu, smmu->dev, NULL,
-				     "smmu.%pa", &smmu->ioaddr);
-	if (err) {
-		dev_err(dev, "Failed to register iommu in sysfs\n");
-		return err;
-	}
-
-	err = iommu_device_register(&smmu->iommu, &arm_smmu_ops,
-				    using_legacy_binding ? NULL : dev);
-	if (err) {
-		dev_err(dev, "Failed to register iommu\n");
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return err;
-	}
-
  	platform_set_drvdata(pdev, smmu);
  
  	/* Check for RMRs and install bypass SMRs if any */
@@ -2255,6 +2240,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
  	arm_smmu_device_reset(smmu);
  	arm_smmu_test_smr_masks(smmu);
  
+	err = iommu_device_sysfs_add(&smmu->iommu, smmu->dev, NULL,
+				     "smmu.%pa", &smmu->ioaddr);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to register iommu in sysfs\n");
+
+	err = iommu_device_register(&smmu->iommu, &arm_smmu_ops,
+				    using_legacy_binding ? NULL : dev);
+	if (err) {
+		iommu_device_sysfs_remove(&smmu->iommu);
+		return dev_err_probe(dev, err, "Failed to register iommu\n");
+	}
+
  	/*
  	 * We want to avoid touching dev->power.lock in fastpaths unless
  	 * it's really going to do something useful - pm_runtime_enabled()

