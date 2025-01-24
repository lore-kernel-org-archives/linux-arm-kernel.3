Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261A7C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bAOmv5FCPTXNOJDPGsnz0m7/ff6FMzEiZAc+WWEKk5w=; b=B6z70E7jdTqMTHSCWMgpXAyHF3
	FRA7UaiySURFNYtTVWVomT6bcBzdAI6qdPzlG93jPfwb5I/XU4d/DP6BCstoCSiHhhZQfhsL5u0x3
	YBxa0uCAPyuq60eAEuzdNgpNJT05567iLRzkyr/LnhGjWAEyrUly1AM/LYFEM0EIWkUnyNhaZE5TO
	KPSl2njjQ8lshOq0bTHDuxzHW5Rhf/MveEXaqR4hwlHGtbOCj/whhN8QzuOEQLtHqveWV4XufeZ/e
	PIUrebgzJV131CulYglGxqiItqe41LDTJ1Qlx0602Pw1xfS9X7K9VfMBSRyysp+EtpwT1+4PNLb3R
	bPyUqWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLKI-0000000EvSp-0oky;
	Fri, 24 Jan 2025 15:10:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLIt-0000000EvAZ-3LCh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:09:05 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so3564932a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 07:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737731341; x=1738336141; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAOmv5FCPTXNOJDPGsnz0m7/ff6FMzEiZAc+WWEKk5w=;
        b=bweYRPF4yvM+JWQrl8TY3FDWkMtTYHB3tCwcmvFOSU+muHHFDJc7Pj6mBLsvNxZWoF
         IwmW95q/XSJBPBhDoml0b5LX2QiiKjFWhyBNorEg/J2j4FcGgBPlnJ97sZwlONqB5k8D
         PbnRDPBq1/BPV8Rvj3pJDjRgunXY5fGTCEdFofxprJd4mMs7YZhPhBi0VS2daGhqZfqu
         uGCiDodRCrcdigjcYjfQzURc5E3Gk2UeBgBVNTsTZtE8wYxpzPDsyS+cyoGtO2fjaVHb
         xJfDvuv65TMGS0fImKubE3HhJj3ZL2m/naxyRChDZ0MztnS1VY8WUgtU4ju04vuo1/VK
         MHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737731341; x=1738336141;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAOmv5FCPTXNOJDPGsnz0m7/ff6FMzEiZAc+WWEKk5w=;
        b=t/+pv9ck/hrsti+EBm9hfIMixwdCtGpnMpXWKJ0czxdazFFGWrKh5G/EEnSLuMd21a
         IGeMnyFjyRdLKne0ymMcSGflNgx+tcYv/JNXmtKb+kpeTCEkXwp0/EmuJCKlja7EQt7v
         g8s1Kb97O637nX8S/IUdy8FDkkwR/TatdCbUjuxDodjMtAFauWuD7P/DjOIUMt4yZudz
         vmsY3KuBRX3N+2Y/kvdU3jeZpdhRfns0dd6GTDcTl1hLSVa1PR/EdYc59MBT0ywlwwLH
         H/a4Y5gm3gP1MREGIpUXOJjpFbs4VZvsr5EHRQlrINXDE92m4hu1e3tgPXe+9tC3qM7q
         2Slg==
X-Forwarded-Encrypted: i=1; AJvYcCXaP/zST2cAxySH5LzMuEzXUe69kkmW11R1OfpQzwNOjKca4dIV1NTkEFDMj+oDbLo8GAWRIqy3nLUU9ItupyVj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn84iKMwFWGW3DoiM8YkBp64+Kif+VLyFSwXvceCE4IfPhHpzr
	Vm5kg9G5w4SDWPl1/da3AYhmPJ4LW6nsGsoVZswcNWL+/nuOKBSATehP5z6TzbI=
X-Gm-Gg: ASbGncsGcmfZ6pxylqLEm4diOpL/+aW5bAyCtOTS/9tJNkxFpeIdIxV9YB4Cq4mZeu6
	ob2kL9Qv5VFokqaF4ghfevq9mWeVPY9/Hfpf5twfRavDPkJAOf5UX7N2Mc4AYWGq1C2JShrMETf
	3X/NsSHg/OXt77xvo035fNqrIfpg4L/5Dym3lqNvT62BnSYEvy7Nq72L391UafjlWe3znTxLAeL
	qdly5TJNK2RWmse8+v/uE0NxKfeO4bcqShs9ty5NDvDLF+OOoYqP4CjfKEE5cmiag7ftvd+Lc8+
	z0VlJfA+PF3z2G4FhAZ1bUXB9aZhPayOyrycfSfP3TYU6Vq4dN9OVFND3qP3+2Oa
X-Google-Smtp-Source: AGHT+IEUHPzYRalGh+hxyuLEjodrsl0WyGddaoYtcZB2H0vu5gdI49NrpaTUetnMdrHqMx1e3s6GWw==
X-Received: by 2002:a17:907:72d0:b0:aa6:912f:7ec1 with SMTP id a640c23a62f3a-ab38b44d439mr2969999266b.39.1737731341144;
        Fri, 24 Jan 2025 07:09:01 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117b02sm142670366b.173.2025.01.24.07.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:09:00 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 24 Jan 2025 15:09:00 +0000
Subject: [PATCH v4] scsi: ufs: fix use-after free in init error and remove
 paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAutk2cC/23MSwrCMBSF4a3IHRtJbh62jtyHOIh5tAFpJNGgl
 O7dtKMWHZ4D3z9Cdim4DKfdCMmVkEMc6hD7HZheD50jwdYNSFFSxjh5+dwbS3x4E4mCth4tR++
 hgkdy9V5il2vdfcjPmD5Lu7D5/ZspjDBitOKWWXGzUp7vYdApHmLqYO4UXFuxsVgtWqPwKFuqh
 f6xfG3VxvJqlW44pcLpRpqNnabpCx1P4tEdAQAA
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Satya Tangirala <satyat@google.com>, 
 Eric Biggers <ebiggers@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_070903_844800_C5C83476 
X-CRM114-Status: GOOD (  26.27  )
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

devm_blk_crypto_profile_init() registers a cleanup handler to run when
the associated (platform-) device is being released. For UFS, the
crypto private data and pointers are stored as part of the ufs_hba's
data structure 'struct ufs_hba::crypto_profile'. This structure is
allocated as part of the underlying ufshcd and therefore Scsi_host
allocation.

During driver release or during error handling in ufshcd_pltfrm_init(),
this structure is released as part of ufshcd_dealloc_host() before the
(platform-) device associated with the crypto call above is released.
Once this device is released, the crypto cleanup code will run, using
the just-released 'struct ufs_hba::crypto_profile'. This causes a
use-after-free situation:

  Call trace:
   kfree+0x60/0x2d8 (P)
   kvfree+0x44/0x60
   blk_crypto_profile_destroy_callback+0x28/0x70
   devm_action_release+0x1c/0x30
   release_nodes+0x6c/0x108
   devres_release_all+0x98/0x100
   device_unbind_cleanup+0x20/0x70
   really_probe+0x218/0x2d0

In other words, the initialisation code flow is:

  platform-device probe
    ufshcd_pltfrm_init()
      ufshcd_alloc_host()
        scsi_host_alloc()
          allocation of struct ufs_hba
          creation of scsi-host devices
    devm_blk_crypto_profile_init()
      devm registration of cleanup handler using platform-device

and during error handling of ufshcd_pltfrm_init() or during driver
removal:

  ufshcd_dealloc_host()
    scsi_host_put()
      put_device(scsi-host)
        release of struct ufs_hba
  put_device(platform-device)
    crypto cleanup handler

To fix this use-after free, change ufshcd_alloc_host() to register a
devres action to automatically cleanup the underlying SCSI device on
ufshcd destruction, without requiring explicit calls to
ufshcd_dealloc_host(). This way:

    * the crypto profile and all other ufs_hba-owned resources are
      destroyed before SCSI (as they've been registered after)
    * a memleak is plugged in tc-dwc-g210-pci.c remove() as a
      side-effect
    * EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) can be removed fully as
      it's not needed anymore
    * no future drivers using ufshcd_alloc_host() could ever forget
      adding the cleanup

Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to blk_crypto_profile")
Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- add a kdoc note to ufshcd_alloc_host() to state why there is no
  ufshcd_dealloc_host() (Mani)
- use return err, without goto (Mani)
- drop register dump and abort info from commit message (Mani)
- Link to v3: https://lore.kernel.org/r/20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org

Changes in v3:
- rename devres action handler to ufshcd_devres_release() (Bart)
- Link to v2: https://lore.kernel.org/r/20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org

Changes in v2:
- completely new approach using devres action for Scsi_host cleanup, to
  ensure ordering
- add Fixes: and CC: stable tags (Eric)
- Link to v1: https://lore.kernel.org/r/20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org
---
In my case, as per above trace I initially encountered an error in
ufshcd_verify_dev_init(), which made me notice this problem both during
error handling and release. For reproducing, it'd be possible to change
that function to just return an error, or rmmod the platform glue
driver.

Other approaches for solving this issue I see are the following, but I
believe this one here is the cleanest:

* turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
  pointer, in which case it doesn't matter if cleanup runs after
  scsi_host_put()
* add an explicit devm_blk_crypto_profile_deinit() to be called by API
  users when necessary, e.g. before ufshcd_dealloc_host() in this case
* register the crypto cleanup handler against the scsi-host device
  instead, like in v1 of this patch
---
 drivers/ufs/core/ufshcd.c        | 31 +++++++++++++++++++++----------
 drivers/ufs/host/ufshcd-pci.c    |  2 --
 drivers/ufs/host/ufshcd-pltfrm.c | 28 +++++++++-------------------
 include/ufs/ufshcd.h             |  1 -
 4 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 43ddae7318cb..4328f769a7c8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10279,16 +10279,6 @@ int ufshcd_system_thaw(struct device *dev)
 EXPORT_SYMBOL_GPL(ufshcd_system_thaw);
 #endif /* CONFIG_PM_SLEEP  */
 
-/**
- * ufshcd_dealloc_host - deallocate Host Bus Adapter (HBA)
- * @hba: pointer to Host Bus Adapter (HBA)
- */
-void ufshcd_dealloc_host(struct ufs_hba *hba)
-{
-	scsi_host_put(hba->host);
-}
-EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
-
 /**
  * ufshcd_set_dma_mask - Set dma mask based on the controller
  *			 addressing capability
@@ -10307,12 +10297,26 @@ static int ufshcd_set_dma_mask(struct ufs_hba *hba)
 	return dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(32));
 }
 
+/**
+ * ufshcd_devres_release - devres cleanup handler, invoked during release of
+ *			   hba->dev
+ * @host: pointer to SCSI host
+ */
+static void ufshcd_devres_release(void *host)
+{
+	scsi_host_put(host);
+}
+
 /**
  * ufshcd_alloc_host - allocate Host Bus Adapter (HBA)
  * @dev: pointer to device handle
  * @hba_handle: driver private handle
  *
  * Return: 0 on success, non-zero value on failure.
+ *
+ * NOTE: There is no corresponding ufshcd_dealloc_host() because this function
+ * keeps track of its allocations using devres and deallocates everything on
+ * device removal automatically.
  */
 int ufshcd_alloc_host(struct device *dev, struct ufs_hba **hba_handle)
 {
@@ -10334,6 +10338,13 @@ int ufshcd_alloc_host(struct device *dev, struct ufs_hba **hba_handle)
 		err = -ENOMEM;
 		goto out_error;
 	}
+
+	err = devm_add_action_or_reset(dev, ufshcd_devres_release,
+				       host);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "failed to add ufshcd dealloc action\n");
+
 	host->nr_maps = HCTX_TYPE_POLL + 1;
 	hba = shost_priv(host);
 	hba->host = host;
diff --git a/drivers/ufs/host/ufshcd-pci.c b/drivers/ufs/host/ufshcd-pci.c
index ea39c5d5b8cf..9cfcaad23cf9 100644
--- a/drivers/ufs/host/ufshcd-pci.c
+++ b/drivers/ufs/host/ufshcd-pci.c
@@ -562,7 +562,6 @@ static void ufshcd_pci_remove(struct pci_dev *pdev)
 	pm_runtime_forbid(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	ufshcd_remove(hba);
-	ufshcd_dealloc_host(hba);
 }
 
 /**
@@ -605,7 +604,6 @@ ufshcd_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	err = ufshcd_init(hba, mmio_base, pdev->irq);
 	if (err) {
 		dev_err(&pdev->dev, "Initialization failed\n");
-		ufshcd_dealloc_host(hba);
 		return err;
 	}
 
diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index 505572d4fa87..ffe5d1d2b215 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -465,21 +465,17 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 
 	mmio_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mmio_base)) {
-		err = PTR_ERR(mmio_base);
-		goto out;
-	}
+	if (IS_ERR(mmio_base))
+		return PTR_ERR(mmio_base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto out;
-	}
+	if (irq < 0)
+		return irq;
 
 	err = ufshcd_alloc_host(dev, &hba);
 	if (err) {
 		dev_err(dev, "Allocation failed\n");
-		goto out;
+		return err;
 	}
 
 	hba->vops = vops;
@@ -488,13 +484,13 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 	if (err) {
 		dev_err(dev, "%s: clock parse failed %d\n",
 				__func__, err);
-		goto dealloc_host;
+		return err;
 	}
 	err = ufshcd_parse_regulator_info(hba);
 	if (err) {
 		dev_err(dev, "%s: regulator init failed %d\n",
 				__func__, err);
-		goto dealloc_host;
+		return err;
 	}
 
 	ufshcd_init_lanes_per_dir(hba);
@@ -502,25 +498,20 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 	err = ufshcd_parse_operating_points(hba);
 	if (err) {
 		dev_err(dev, "%s: OPP parse failed %d\n", __func__, err);
-		goto dealloc_host;
+		return err;
 	}
 
 	err = ufshcd_init(hba, mmio_base, irq);
 	if (err) {
 		dev_err_probe(dev, err, "Initialization failed with error %d\n",
 			      err);
-		goto dealloc_host;
+		return err;
 	}
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
 	return 0;
-
-dealloc_host:
-	ufshcd_dealloc_host(hba);
-out:
-	return err;
 }
 EXPORT_SYMBOL_GPL(ufshcd_pltfrm_init);
 
@@ -534,7 +525,6 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 	ufshcd_remove(hba);
-	ufshcd_dealloc_host(hba);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 }
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index da0fa5c65081..58eb6e897827 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1311,7 +1311,6 @@ static inline void ufshcd_rmwl(struct ufs_hba *hba, u32 mask, u32 val, u32 reg)
 void ufshcd_enable_irq(struct ufs_hba *hba);
 void ufshcd_disable_irq(struct ufs_hba *hba);
 int ufshcd_alloc_host(struct device *, struct ufs_hba **);
-void ufshcd_dealloc_host(struct ufs_hba *);
 int ufshcd_hba_enable(struct ufs_hba *hba);
 int ufshcd_init(struct ufs_hba *, void __iomem *, unsigned int);
 int ufshcd_link_recovery(struct ufs_hba *hba);

---
base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
change-id: 20250113-ufshcd-fix-52409f2d32ff

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


