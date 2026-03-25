Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F79109C05D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BFJKPQI5/sac9me8amIP9+ekaSHHOonqJLT2WhRtyac=; b=IhoiKq3rNs0cPe8vkl8BLFWytJ
	6ZjYDHwgM3wLxW6T52xnPnZrtSv9R7YUXcBD1G/AzrDr2ze2y5k7RrCQHkNmLpKXtplL67UMbdegS
	FoMRkrXUMZM/O4yl6194gaDV5yV3z/WPzqVFmKoSqUO/G+lPg8K9C9TqAkkcwzm5Fn6jpBCPhMdzn
	3P0kYZ7ephuU2SVSfmoRb2RCn0YCeUaqb4AnzIz9bVUdwpgzT2N662D5p78RY+EEcfCjb4+F9V2NR
	5nhOP7D4Vxmqo8Ge3BwzQqSP/RzKGvUSr+LT4nZIHgElHF1BlL9hJdE3IH+suxeBbGVyLQ/YkQSEp
	SuCEP8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VVS-00000004G89-44h0;
	Wed, 25 Mar 2026 21:11:14 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VVQ-00000004G73-261x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 21:11:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so3034891fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774473070; x=1775077870; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFJKPQI5/sac9me8amIP9+ekaSHHOonqJLT2WhRtyac=;
        b=eTz1fcNZc8R20uD51SjLh/3gEYXKnuuaGNuKnqQlYUPD1ndSGdE5j6ylsvQZ84DLfe
         bq0N33d5WpsfiAlvALY6L8nh0Zb0jcX4wtH3lYOaDxjULW9olffl4HVs9nv07V+HscTE
         AoNVovjKeyplj1nv5VqwlYmtQhgwTX7Xw4z3Z6fGh1yvA2pKxxSJGzlFiADkt2jOC1ek
         v8wFu1TiouQYc5oH7Fo5eYTr5z+meV6vrhFO8sEcw9nHIrt39u4O2Qev04sMEEkr3jok
         sGRLVbrk9eLHNfblkOuAHo81PP3DM2BU2N1qzlvN2t4lS3quW7o5PMF5b62vtDHsnNpq
         FVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774473070; x=1775077870;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFJKPQI5/sac9me8amIP9+ekaSHHOonqJLT2WhRtyac=;
        b=GtSucjvZCWh8YuCSU7gp+uSQq9fTlO71rWCH8pRi5RNLuug16G63E3wtkkjuBuslAG
         11HXo7EebeYN1yNZGpk7XqAtuDEPMiB9ygEU5P99jizRy+B8bDPnzw14MQgknqoeSodV
         296BvFO4MACYP3QbcrQCGfXQiGrCfmP3Z+FRPgicrE1sMYNTxUn4F9q4blHcCghzGaT/
         TEKQjHKGooxOccpTEy9F62dM/siADCeLKp4wtpRO57Npm47m+rtJitiO1RxrbIuYyIGV
         6wdXFzUpsdTQRk/Srx8CAPsOjXTQ1t9YDsyYaRzQfQ/JnCI5pxFPtmgJpGfEORqSVojk
         pJqg==
X-Forwarded-Encrypted: i=1; AJvYcCVBZUyF4frfTZc+Hmpt4zx96++Tcrw8sagoCHaQO85SMqC1z4F3IyEXrCzmsLa79jV4r1Bdc0e5OUKOWGCaoqOg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Xxw/VUWyobAh31gapvGpNtGPrktu5TL5bZfkVg6iMKJ9lqoA
	KHxkLTxgDGZzCalgitVwUB3NsE3bmkoOcWYPhMVtjyXH/DifptH+cuc=
X-Gm-Gg: ATEYQzwlBkbLoomhPi4BCiwnqz2VEYrtW3nadtqaH+UkbUWbeM9600Kmj0Nm/3564Cg
	WJbrsfXPls5N5ZNMvWg3a2wTGhE7ziUshPGR10scaE1i+1XScPNrxSU0HQnJrflLU9I8UlfhUOH
	ThgJD1RZCsxDLGrQ+pGLNv9MKMHQniLwH5xjP/7Nm4IfmNseOXuVQA5TVI/f3zGE3BN7apyzEl8
	aq00SGcsBaJOFr/vS2kZW0mAAM3WI031G1q+fr80bGD+D5RHJt8oyBu1qLWOkVkhBerHgZvX3S6
	cvJGi3CiR39Glxk04NeTZZDxp+BPIljA81Bccw53vWToAwmUxht5mBJj9irX+fSpAqKG6zfobSQ
	yT9clM4zsNq5SRzj8vq9ITkfRSBrjebiclk9eiC/2FgrPdugcOiXKphM2TYexTUXw8XVRx3lLJi
	W+oWK/H7RcYV030K0cZUWte9VHaSPX42dDP3HZezKeKswm4WmDeEmY1ztw+zon1yxN2pI5V1VEd
	TjSXPfGThbTg4TfiEV+J/pk
X-Received: by 2002:a2e:bcc4:0:b0:387:d29:fd4f with SMTP id 38308e7fff4ca-38c43053841mr18578111fa.1.1774473069655;
        Wed, 25 Mar 2026 14:11:09 -0700 (PDT)
Received: from [192.168.1.17] (host-79-52-171-101.retail.telecomitalia.it. [79.52.171.101])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fac168sm1524821fa.11.2026.03.25.14.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 14:11:09 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Wed, 25 Mar 2026 22:11:03 +0100
Subject: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNTQ6CMBBGr0JmbU07oBhX3sMQUsoIk1jAVhsN6
 d0d2bt8L9/PCpECU4RzsUKgxJHnSQB3BbjRTgMp7oUBNR41Gq0ebvZt9P7VLv7Gb4WWbI+drQg
 1SGsJJHpbvDbCI8fnHD7bQTI/+38rGWVUfepqU5XW6UN5Gbzl+15i0OScvxkVNjWuAAAA
X-Change-ID: 20260210-qcom_smmu_pmfix-2aead2ba4e20
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774473068; l=1749;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=c9MHl6wwCqZZZNdguQdAF7xL+qjBzLIdLAmWzKLWIrs=;
 b=nZxsZvGAgjyLb36vu1D/zn/oDYONnycLHZGwePaIYT75gLjwmEB/AP/WcoAECO0yu57KZ+ikU
 XNixHH2ZPVhDYRs4ADLGfLw/0OhzZBIQ0C9H4Duz9/j7FQodQ3+oErp
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_141112_561305_A7AB4CD8 
X-CRM114-Status: GOOD (  13.11  )
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

Previously the device was being accessed while potentially in a
suspended state.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Simplify patch by acquiring device just around the call that needs it
- Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573085349df3..cab7d110aaf5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
+	int ret;
 
 	/* The domain must have split pagetables already enabled */
 	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
@@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
 	}
 
+	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
+	if (ret < 0) {
+		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
+		return -ENODEV;
+	}
+
 	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
 
+	pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
+
 	return 0;
 }
 

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


