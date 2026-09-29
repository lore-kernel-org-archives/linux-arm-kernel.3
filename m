Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDCBCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIxR9gKP4j1PYg6iofZ/XK63ShN3XaQLf38quAwtMeA=; b=Mb4HTZuAF9fNChUvQWVXR5K5UN
	QXrDhNgTyyuQA6AIlSoRJ+yOHe+mECQwhEF9NzLxZ/lm0+Zc9TRTm0WdGGrsx4/HuaFrkQYFOOAOC
	S9dm6vCQ4ZYwW1Sh2sNpSTcdRyfQB2lUWEEE9BqRo3WCm5PFmIo7nsCtESF5fIxqYnOP8YtBrDUTP
	4Wfv3l8nYCCqqal30EfEGpV1l6b+JOGyj0fE9mKPaioo2sUFd/mEe2rPROhX/oR94QDXpnsLACQvT
	7aMiokue1A7XQuotSGxj26vJLrzKxvam+QjMrWYJiV/2AokbqT2cwj/3d1fD2qmhCr3+bfQYRE6d4
	bXi0uF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOnt-00000002Gwj-1YWJ;
	Tue, 29 Sep 2026 03:46:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOn9-00000002Gc0-2AoA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jIxR9gKP4j1PYg6iofZ/XK63ShN3XaQLf38quAwtMeA=; b=Tr9ipUctqpkcCetsd8gwiSeNvj
	cXuxjPdV3LFwxni9j/Jnwk1sPsJ92uBcwIGQ0cJPvXUF+PgS5W9NK/Y+ZSeuY8TYQi5PavJM2JW5C
	tpAokezcKa9n312n+HLxYxvqN7w8TPILnzuetqNVPJ86bQ+of2ltbCB5v5Hxs1XaovBwsbLQB0/Sa
	lS1/PJc4QFV7zBf/5a8gqDHQ3wwSEs3M3nxmm74Lmy+Yw0lJvpBC7AA1I4lPeAAbAwct3sQ5Q2JTF
	egYV+8AqIYSDjXty9WSCF3BQ/7T5AiLDftQnE0IPDFKIOt5F/ncSRbWh/6etf9FeJ4ybEKG7hHJAr
	RizQMmgQ==;
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBOn1-000000029T2-3ezu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:46:05 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2e2c785aa62so4708935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653554; x=1791258354; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIxR9gKP4j1PYg6iofZ/XK63ShN3XaQLf38quAwtMeA=;
        b=mR/NTWSo/32c8JT/LdTeUobq0W1i/9IoyZ72AfMOokh5UggXPn4eqs1Bg49xj1tw25
         ZaHx+y5XLMR+AE0ZwWgeMK1h7My9zg/YEnI3lAXJ8DKHyfTzCKpYVvv4QZA52Zt9V2gr
         wcdkWA+8O10cWns6ho0VEo4CvDRfR9mzqxF1TkNthOYQlhrEm98uLmeFWuPgmCnBmw7Q
         qIbs3vL0lilhCbbDoazfqQPF2qlzAAhzzDWESUXNYgCcTk0V3DXo2U/jHQOiut82rD/3
         qtA1j2FCaFima1kMbNWjmhLaa4H4uc+CRTT0MvdM7ZBMujIv+w6239k1sqyoUg5PZGVJ
         g6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653554; x=1791258354;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIxR9gKP4j1PYg6iofZ/XK63ShN3XaQLf38quAwtMeA=;
        b=BTLoHAWCwKz8uuNoOeSrBspvRrZff4Q8suuBm8mEOmoiI/DFhOyqXfILCG/VRfHs1M
         JRFV99sV30qPZXbbldsZ/4MvT7ZAyXnuqg1eDUsJI98FKjaaBDB1ozpxmsKFYnh9+IHD
         /2FIsy9Zr5XfYGscZWHsHccKrWIHq3qwq6QsIfMAWkqthAHbummPiYYlos6FcgyHX9OS
         7N9qMF35CqS6MLPHY8AT+XdIjlwqKIUMtYv5cRG7HcwjMGlGwuUZTdUa+Se+tV6gcRT8
         frWokq9DMVr9dXwLNEXyf5CrZrO6l2PohGuwwbW9rPxRxFgupytYAD7fvZY0sI5kIpJ3
         1xTA==
X-Forwarded-Encrypted: i=1; AKwUvBzYlUHxIKSNZcmUxmA4Fh/mi8aafL9lyreHjLRMK+X+2rGrXf+pUkGPf2M4sAt2m79ouIIk/agWQEsLPsmI3Ntj@lists.infradead.org
X-Gm-Message-State: AFq9FYJH2I3cLYZF46iA17Pu1pgz779U9UGJpVuppLZYxtGqgyFdqlr2
	YWBX+FrSV6DcL4B53pT4YfwpDw0AZEj7aFcjt+bJGcYgURtUDSnRkDCR4gnffCgQRhWyNVsWjUl
	3SA==
X-Received: from pgce10.prod.google.com ([2002:a05:6a02:1ca:b0:cc7:9b89:2a8d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c1:b0:39e:6c68:c77b
 with SMTP id 98e67ed59e1d1-3a098e078b8mr13128801a91.49.1790653554263; Mon, 28
 Sep 2026 20:45:54 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:08 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-15-praan@google.com>
Subject: [PATCH v11 14/16] iommu/arm-smmu-v3: Enable pm_runtime and setup devlinks
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_044601_449275_704B74EA 
X-CRM114-Status: GOOD (  21.50  )
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
index e127e3be3a6b..2a1b5ce6ff1c 100644
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
@@ -5097,9 +5117,17 @@ static void arm_smmu_disable_action(void *data)
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
@@ -5912,6 +5940,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
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
 
@@ -5927,6 +5966,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
+	/* If the SMMU is already suspended, nothing to do */
+	if (pm_runtime_suspended(&pdev->dev))
+		return;
+
 	arm_smmu_device_disable(smmu);
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


