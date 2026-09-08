Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A896FC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNJP63wk2Rkn83yG1Ei0kp9ZP/m4h3IOpChfqBS5N08=; b=ivnDAbrRndeN/IEE4muBdvkW/y
	+oGQ6tnSEh/mHS9RdGpUW2fHZze4YyjqcxuTsJjC39MQpNiTzis27j0YJSJ8cLX+NYPY1uqgjSe9E
	z78NCZ4qEDx1quSoaKb7Ii5N0LfuAUqxYuNB7CyG98iOpmW6Qn5uleHJAu1rRVAZNlylUknavEipu
	wnUk0JIzuVgSMPy4+i5vsbzK3a8uwDl6AKDulvOLfW666F2TbS6phDSWoaNL7umLhBcCSIOaDQzmK
	bqh4gnHawXbzIwEy0gCXfwL/YjKe0Ncs50IRhq8+ozm9nHrFn3/BzIFyqQmUI5/G9XCSS/odTc2LM
	zAeYecxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zSG-00000009mqm-1jEA;
	Tue, 08 Sep 2026 17:17:56 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zS6-00000009meG-3BY2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:17:47 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-862728814fcso976519b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887865; x=1789492665; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNJP63wk2Rkn83yG1Ei0kp9ZP/m4h3IOpChfqBS5N08=;
        b=dpVCNWILWuhjPsS2GWH8x57DJh3Xfscj7OTAwCzFNVdBFiY5H+fzPd98f68KH7Xdy6
         TVvvcBHuIXwfxT5mJh8lcr/13KuSMXhA0zYBLpE8aHk+aM+O+clDCNixKlnwl9m1SzFL
         6jSLSUCvCGMq45nTwQvTDPw/OH/cDg9WhjEj1Ls28faRzUzl5I5Pw3F4JaMhsyPGQF9p
         yQgiLk2XowjPEJmG7GpSeVrAqXcTjXv//oxv93TiYmUu617rCwhyNROCbbJ94Gr3jTn1
         TA/74xttysPbUC/fMxxuEOA7WUPbrPgizKUuEDMAYiu6GZUOCSXSb8F4efm0PdITPZTx
         s52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887865; x=1789492665;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNJP63wk2Rkn83yG1Ei0kp9ZP/m4h3IOpChfqBS5N08=;
        b=qR+zBESbeICS1qd+eo+6DqShmG1OL40LfkW9mywZV7zoDrT5xkvhxksGowEMfusUQ4
         g4vAomTtTj+If7mWVxP0u8YO1DtksqVAhg9MUjZt0S2zXYT5GBJYD719MvDdjgP5JIZ/
         olKBobNO/8Z9rtEbFjCx+R2cGkGjBUkc1zz8uykSkKaofi2jJluDJNrGPc0pMJauFDbu
         AsPe7ajlzsvGdsXRBLw97a9mvFo/XkyiPPT+CBel/A8Zcq+TLWEacwZvVughvqM3U/aU
         kOEUJ7ea/HVC9UOkoweawjxAWt3kAXu5SHQfBFvvY3ns5wKcE2deD/+IT1/GYXaCHjEm
         htRg==
X-Forwarded-Encrypted: i=1; AKwUvBwN3Bgm+yExxtyDbNjzQZdcCVcF/7W0h2f4YK/iQZVvtTzrDs8/8+g5CkXy8Bru6VQZUXbyPwGL/36ICM8pMpLP@lists.infradead.org
X-Gm-Message-State: AFuF++mDOvZjWLpA6mqnNZYvOmy3GLa/UcPuVC6uo6ATEHt12WDz78KR
	V22lbNYXtHztCQ1MKp8aGDHMpMkQiPNYbmGreRYYhELNG7pEar9VJBGLsqOovKSCL2FT2YS/pID
	KlQ==
X-Received: from pfbfn11.prod.google.com ([2002:a05:6a00:2fcb:b0:847:7d90:188e])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c15:b0:848:46a0:3d74
 with SMTP id d2e1a72fcca58-86169b6b588mr39091403b3a.9.1788887864762; Tue, 08
 Sep 2026 10:17:44 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:17:09 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-14-praan@google.com>
Subject: [PATCH v10 13/15] iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_101746_798591_6249C24B 
X-CRM114-Status: GOOD (  19.87  )
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

Additionally, handle runtime PM teardown in arm_smmu_disable_action()
and skip MMIO accesses during teardown and shutdown if the SMMU is
already runtime suspended, as translation is already disabled and the
hardware is in a low-power state.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 49 +++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 1c5d891564e4..0a83d495d8d2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4511,8 +4511,28 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 	if (ret)
 		goto err_disable_pasid;
 
+	/*
+	 * If linking fails on an RPM-enabled SMMU, abort probe to prevent
+	 * DMA transactions while the SMMU is autosuspended. Otherwise, warn
+	 * and continue since the SMMU is always powered.
+	 */
+	if (!device_link_add(dev, smmu->dev,
+			     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER)) {
+		if (pm_runtime_enabled(smmu->dev)) {
+			dev_err(smmu->dev, "failed to add devlink to %s\n",
+				dev_name(dev));
+			ret = -ENOMEM;
+			goto err_free_cd_tables;
+		}
+
+		dev_warn(smmu->dev, "failed to add devlink to %s\n", dev_name(dev));
+	}
+
 	return &smmu->iommu;
 
+err_free_cd_tables:
+	if (arm_smmu_cdtab_allocated(&master->cd_table))
+		arm_smmu_free_cd_tables(master);
 err_disable_pasid:
 	arm_smmu_disable_pasid(master);
 	arm_smmu_remove_master(master);
@@ -5116,9 +5136,17 @@ static void arm_smmu_disable_action(void *data)
 {
 	struct arm_smmu_device *smmu = data;
 
-	if (smmu->impl_ops && smmu->impl_ops->device_disable)
-		smmu->impl_ops->device_disable(smmu);
-	arm_smmu_device_disable(smmu);
+	/* If the SMMU is already suspended, nothing to do */
+	if (!pm_runtime_suspended(smmu->dev)) {
+		if (smmu->impl_ops && smmu->impl_ops->device_disable)
+			smmu->impl_ops->device_disable(smmu);
+		arm_smmu_device_disable(smmu);
+	}
+
+	if (pm_runtime_enabled(smmu->dev)) {
+		pm_runtime_dont_use_autosuspend(smmu->dev);
+		pm_runtime_disable(smmu->dev);
+	}
 }
 
 static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
@@ -5931,6 +5959,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * Safe to enable RPM here as client devices cannot be probed
+	 * before this probe function successfully returns.
+	 */
+	if (dev->pm_domain) {
+		pm_runtime_set_active(dev);
+		pm_runtime_use_autosuspend(dev);
+		pm_runtime_set_autosuspend_delay(dev, RPM_AUTOSUSPEND_DELAY_MS);
+		pm_runtime_enable(dev);
+	}
+
 	return 0;
 }
 
@@ -5946,6 +5985,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
+	/* If the SMMU is already suspended, nothing to do */
+	if (pm_runtime_suspended(&pdev->dev))
+		return;
+
 	arm_smmu_device_disable(smmu);
 }
 
-- 
2.55.0.979.g7e5102b832-goog


