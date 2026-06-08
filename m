Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87321CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 03:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6S6dXQ26u/Br+eaWfk8QstdVjG8sRpZI+a8oo+fYY5M=; b=zq5hHUtjgPTZc2Q731Mr1BVnmr
	DOD5XlODGrMED+idvjxjq36FJbQZXTzKr2hKAns54u27i+48wXCulBUlVW6/4G8c/g5yOsnUCorxG
	OxAN15RwF+AQdNy4vqNl8t6AvqmO9PDTmEdI2Uu4IcOyNEkzKCTTJ8kG9R68Z/dq5NPkj2XUAQsU8
	v7t2f8DYUQK3fXWun5nNHyjF9nPRwBES2lGJ16CctOS7S8XklwMu2qP2/4l04epcS0AQaWG74hvWJ
	SXINkMMYG5L6RnvyZOp6bmYJW/SciLcrM4SbtBltu+/5lwG4IH2CYRQyg+OsTokAmntExh2yP/SXH
	rTCiGbMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWQM8-00000002lGd-3c1f;
	Mon, 08 Jun 2026 03:08:52 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWQM7-00000002lG5-0nMF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 03:08:52 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5176465a4a4so56031991cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 20:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888130; x=1781492930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6S6dXQ26u/Br+eaWfk8QstdVjG8sRpZI+a8oo+fYY5M=;
        b=Yrwt3BM23DvRWHCGessdcXaI8gU9zZ+fqmpWB1VIjYf8HZnkAvHcik9BQejkF2vJvx
         0vNFjwy6Zf8zLfd66MmnPQfYAL83CoCzUC1amre+Pef+cxEcwYnEHJ7ZL2qEwSuUxb1S
         sHqEG/Pe7Z/tOw6I5FO9H0DezTy/R3tkCNwoBj9WzKgoK4Jnwout5oIzLxkEH1VwyJYf
         +2xbr6FdMkn8MYSmgb9CsO7MtiG6ZnMIRO+ypdH28UK1wBk94HxmgiEeXKBz4vbUmKJU
         lU0F9d/nj205o44LQ67yAEBWmqM6AK5G/VSwXA258jfwGCDdp+Ns4b0foDblkc2d31j4
         dTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888130; x=1781492930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S6dXQ26u/Br+eaWfk8QstdVjG8sRpZI+a8oo+fYY5M=;
        b=awEr7RJ64gbOygQDJ2HpZyVP+R2OLum3x53F4Eb0LhDajF+b1MseYXYDrhXTnT2Ol9
         LsJeFAY51UlM+s11zlzWxsBrWpi8Caa7rwbQKQTIKErcEDwf1UKahfZmSw73IKB/Bm9x
         6OdRIAw4jQTBZ4pPQehngJTj2nd7LiQ/5URspPN1gi8IBn08gltb96k/LH5SeYgVy+tB
         iBK8vh3GVSZDo8P1wEI8q/aJW4XQsLDZuyLCkk/Y7CaR+3LsBszjdNcmpBSHKtySfG2O
         4cjPrPx9gzRR2KAMt20nWl2jBfn2rvfPaxIQI/z+43ps0En5QhwQABZkPurf+sxMEszW
         WA6A==
X-Forwarded-Encrypted: i=1; AFNElJ8sLYOMiGBt04xC8JIl50XaE+7j7Ugo0MRl2wjqZyV8B/CyIYUprawf7Zbqc71Y5G9a4nYH8AyFiCxqQtPMEv8/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+IsL9/cd0TmmDEs8xhCJgomQMdxCLK28iOXwORk99doTwgJk2
	tuU0amNZ4Ykrwy0HEkvfCAfXoapT6UtyA9ar//QVBX+xrinSAfX9eOXG
X-Gm-Gg: Acq92OGUVmRsM/ThXauhBikkeCTHQY6ZBxL5o1NbhhAhjsvEN8PiqQhKi1nypQEJN0h
	kfuqhzxY2Ug20GoIqxdGu18M/rOkux2RERqmpwcZx6qQmyLffMSzPbUBo5pNSDt00rVytJPMkwc
	GQlhHAsdHNyrLZTGUO2iX7SI9JCWRwT9e2e6u52zx3FdYXptAgINnNlbWnFChY37K9iI2t25kK/
	zfEFGbhK2XC1QoBm1hflQisgZvpz5BnNiap46ANFeNNvMln+iQ2U3uWAeNOCpt6JFnjz1SdLHc5
	EKna6vfROJEiH0OubJrzRqI3quLcogiLzJ1JmapPSiSqtXi4t/d+jWTyVn4a6a7GBiT6LxqTjpb
	TIMK9atVbv7mXwc/MEmmyWTsm4iOc4nB4iA9G/JZ/JU8oMSZGkiD/wwSoN0xBA8/IaAmujdX2jz
	AIi7ZcvQRCeAT1rf0KvuvwRK5e12n+aVNSDsz9LgKBCbRyl77FsoqjwrPFQlkUcg==
X-Received: by 2002:a05:622a:834d:b0:517:a133:7b91 with SMTP id d75a77b69052e-517a1337de6mr125318111cf.16.1780888129733;
        Sun, 07 Jun 2026 20:08:49 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm152128986d6.28.2026.06.07.20.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:08:49 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] dmaengine: qcom: hidma-mgmt: Fix sysfs cleanup on setup failure
Date: Sun,  7 Jun 2026 23:08:46 -0400
Message-ID: <20260608030846.2602111-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_200851_247153_16D4B51A 
X-CRM114-Status: GOOD (  17.60  )
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

hidma_mgmt_init_sys() creates the chanops kobject, per-channel
kobjects and sysfs files incrementally. If a later creation step fails,
the function returns without tearing down the objects already created.

Those sysfs callbacks reference devm-managed driver data. A later probe
failure can free that data while the sysfs entries and kobjects remain
registered.

Track the chanops kobject in struct hidma_mgmt_dev, unwind the sysfs
files and channel kobjects on setup failure, and register the same
cleanup with devm after successful setup.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.h     |  1 +
 drivers/dma/qcom/hidma_mgmt_sys.c | 65 +++++++++++++++++++++++++------
 2 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt.h b/drivers/dma/qcom/hidma_mgmt.h
index 30e8095988bf..4fb6759e3371 100644
--- a/drivers/dma/qcom/hidma_mgmt.h
+++ b/drivers/dma/qcom/hidma_mgmt.h
@@ -24,6 +24,7 @@ struct hidma_mgmt_dev {
 	resource_size_t addrsize;
 
 	struct kobject **chroots;
+	struct kobject *chanops;
 	struct platform_device *pdev;
 };
 
diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 930eae0a6257..280b3af6ec03 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -231,20 +231,52 @@ static int create_sysfs_entry_channel(struct hidma_mgmt_dev *mdev, char *name,
 	return sysfs_create_file(parent, &chattr->attr.attr);
 }
 
+static void hidma_mgmt_uninit_sys(struct hidma_mgmt_dev *mdev,
+				  unsigned int sysfs_count,
+				  unsigned int chroot_count)
+{
+	unsigned int i;
+
+	for (i = 0; i < sysfs_count; i++) {
+		struct attribute attr = { .name = hidma_mgmt_files[i].name };
+
+		sysfs_remove_file(&mdev->pdev->dev.kobj, &attr);
+	}
+
+	for (i = 0; i < chroot_count; i++) {
+		kobject_put(mdev->chroots[i]);
+		mdev->chroots[i] = NULL;
+	}
+
+	if (mdev->chanops) {
+		kobject_put(mdev->chanops);
+		mdev->chanops = NULL;
+	}
+}
+
+static void hidma_mgmt_uninit_sys_action(void *data)
+{
+	struct hidma_mgmt_dev *mdev = data;
+
+	hidma_mgmt_uninit_sys(mdev, ARRAY_SIZE(hidma_mgmt_files),
+			      mdev->dma_channels);
+}
+
 int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 {
+	unsigned int chroot_count = 0;
+	unsigned int sysfs_count = 0;
 	unsigned int i;
-	int rc;
 	int required;
-	struct kobject *chanops;
+	int rc;
 
 	required = sizeof(*mdev->chroots) * mdev->dma_channels;
 	mdev->chroots = devm_kmalloc(&mdev->pdev->dev, required, GFP_KERNEL);
 	if (!mdev->chroots)
 		return -ENOMEM;
 
-	chanops = kobject_create_and_add("chanops", &mdev->pdev->dev.kobj);
-	if (!chanops)
+	mdev->chanops = kobject_create_and_add("chanops", &mdev->pdev->dev.kobj);
+	if (!mdev->chanops)
 		return -ENOMEM;
 
 	/* create each channel directory here */
@@ -252,9 +284,12 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 		char name[20];
 
 		snprintf(name, sizeof(name), "chan%d", i);
-		mdev->chroots[i] = kobject_create_and_add(name, chanops);
-		if (!mdev->chroots[i])
-			return -ENOMEM;
+		mdev->chroots[i] = kobject_create_and_add(name, mdev->chanops);
+		if (!mdev->chroots[i]) {
+			rc = -ENOMEM;
+			goto err_uninit;
+		}
+		chroot_count++;
 	}
 
 	/* populate common parameters */
@@ -262,7 +297,9 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 		rc = create_sysfs_entry(mdev, hidma_mgmt_files[i].name,
 					hidma_mgmt_files[i].mode);
 		if (rc)
-			return rc;
+			goto err_uninit;
+
+		sysfs_count++;
 	}
 
 	/* populate parameters that are per channel */
@@ -271,15 +308,21 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 						(S_IRUGO | S_IWUGO), i,
 						mdev->chroots[i]);
 		if (rc)
-			return rc;
+			goto err_uninit;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
 						(S_IRUGO | S_IWUGO), i,
 						mdev->chroots[i]);
 		if (rc)
-			return rc;
+			goto err_uninit;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(&mdev->pdev->dev,
+					hidma_mgmt_uninit_sys_action, mdev);
+
+err_uninit:
+	hidma_mgmt_uninit_sys(mdev, sysfs_count, chroot_count);
+
+	return rc;
 }
 EXPORT_SYMBOL_GPL(hidma_mgmt_init_sys);
-- 
2.43.0


