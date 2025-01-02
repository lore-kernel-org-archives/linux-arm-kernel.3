Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B76E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 18:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZmBLyMaEsdOn4Q5STQE+mhdoJd5pHTPZlhfFO4wWcQY=; b=HFeWS7zEYg97Pl1gpKO+WCYG4y
	h0Sd9rxxcvOkFvQph3MV01ZpNuncXSVAhtX3cBgC/Z9kc4FtibzG5nTizzyRYDZbRGutOrMXuYlDY
	S4iKbcAx+6AZe0haBNPh5rtHjAHVvNhSJkuiZZAYdpHDqnF2H/5X+iI5t7ksOsXNGeX32eIrvjvBg
	Ns5YEGII+xJLH/rLRrTp7IgqmrFFH9tF8rvXsIjLHnAFeASZnURhDle6IVWqHtsGQVy54JAJ8riPI
	DmFiP24NjkELjN8Cfq9ALFPAAs2U3yjd3XPJxxghbSDWHvY5Vbbss5F3EEQtqnANkA0pSimtr1Vsw
	8uSw/fhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQ1K-0000000B951-2cLp;
	Thu, 02 Jan 2025 18:34:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPzp-0000000B8Sq-3EHq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 18:32:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2163bd70069so60483365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 10:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735842756; x=1736447556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmBLyMaEsdOn4Q5STQE+mhdoJd5pHTPZlhfFO4wWcQY=;
        b=eSdz7bi783T2jFzNSJJl7orlCJvPbFgzYVrXrMFn8CCLLVx1p0pvDSJkVkDIdNBSpA
         MR2HhB/CIK58LjSpxs6wuHNGAHzjs9tUZzmvjY1daedaPEOn74YDWGltHrnz1KJkcW8Y
         sy0T4RmUGQEQM7nFZGXO690CPNcIcnZ7KVmgbZUZXLO48cgh5mKf3KmUz+826FWWiLfK
         53BbOQnH+8nHeUUYv3DYkJMisIuHwPaTPmXqGZb/YYVS4ON8qCSX3yghvglngAxom8FO
         EVxrR5U7iMAzjv/7qee0qUA0YP06AZj4zIMJZawGJMjpV0wDSE99hs1aP2Sq8mopII4z
         BMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735842756; x=1736447556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmBLyMaEsdOn4Q5STQE+mhdoJd5pHTPZlhfFO4wWcQY=;
        b=aKBa45SglS5ywx0jIsKxwtFFpN85bAXptv2YNB63ZHf/3ED7NJpcBKoBCZIzV9CoH0
         2ySm2J1oOChceDUpSisEbGmoUcNevHSHNYMxnK71Qafvf8yEPEJj/bIRdfkCZzVpaR3w
         zPRQ9d/4t/y4jNhV53ZVEcrVnBpaQa62TR32w8voxz5HMqfheY13Tflz1AHa8LVGZ+3S
         AelnUdb8DRjE3RQnuVLU/0pF9VXfTNMGArHU3ALW4RhTKHj6/CSwnGe9KLPgzTGdFOPs
         bz7Y2tjKbLBM7d/AIXkTXSuYNDU23VVlUDILgjHK2kpheG4UMq1sjy/8Hjv/Ecc6ojyy
         9RjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz2YMDYz6GL9Q8SdgGI7bx74O98U4VqelgBRzkd++qYYchSqVX19IdgwqCKULEajszLHoSNrv6w1N9omNbhLRL@lists.infradead.org
X-Gm-Message-State: AOJu0YwchPe/v+Wx2G7r3wEDClIeSYfw6G+QSPDpZVrtnV031plkChOq
	ti9rOKNZ8DLPOtBTdGpb8iS+4wqOGzuN+q7723qQ8zOyfAPsNlrO
X-Gm-Gg: ASbGncsGRBkxBzQTZYG1ofEN0jErY8LCYKh0XcqheRQEnaZhUlQY5xIAgHm9M48v0pm
	xjxvRDJ1vYrkzNCYWl27e4rxNuvEzjB/lQaRli/biSNxg+KTV/CB2MSsbEevl79w4NfPhfpWBz7
	Js+off4RST5tXtVwUaGMJd7RBjKipi7ZPwPTZTqnhc8ey6xFaWANwOut0fDknuL6krdfZ8TVhrX
	rNQL3vMv5BWb+j2UYrVdf7Qs5clYyirDr2QVOYtBXkJQSO7R9G6OgBJf282Ftd+q2wq661d+sdv
	qPHLzzA3VOfRcsVP7t30Eg5Lx9Gohnw=
X-Google-Smtp-Source: AGHT+IHpGOLVThnWV3UDWPVggKt9JZyqBWGCDD4mG3rXl7oRcepmQ9fGjP9tbJJ2H/XG2/M6m4kRPA==
X-Received: by 2002:a05:6a00:3406:b0:725:eacf:cfdb with SMTP id d2e1a72fcca58-72abdeeed6emr71219209b3a.24.1735842756061;
        Thu, 02 Jan 2025 10:32:36 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbabsm25601698b3a.101.2025.01.02.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:32:35 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Date: Thu,  2 Jan 2025 10:32:31 -0800
Message-ID: <20250102183232.115279-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_103237_867081_96516B53 
X-CRM114-Status: GOOD (  16.51  )
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

From: Rob Clark <robdclark@chromium.org>

On mmu-500, stall-on-fault seems to stall all context banks, causing the
GMU to misbehave.  So limit this feature to smmu-v2 for now.

This fixes an issue with an older mesa bug taking outo the system
because of GMU going off into the weeds.

What we _think_ is happening is that, if the GPU generates 1000's of
faults at ~once (which is something that GPUs can be good at), it can
result in a sufficient number of stalled translations preventing other
transactions from entering the same TBU.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2: Adds a modparam to override the default behavior, for debugging
    GPU faults in cases which do not (or might not) cause lockup.
    Also, rebased to not depend on Bibek's PRR support.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4b..3239bbf18514 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -16,6 +16,10 @@
 
 #define QCOM_DUMMY_VAL	-1
 
+static int enable_stall = -1;
+MODULE_PARM_DESC(enable_stall, "Enable stall on iova fault (1=on , 0=disable, -1=auto (default))");
+module_param(enable_stall, int, 0600);
+
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
@@ -210,7 +214,9 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
+	const struct device_node *np = smmu_domain->smmu->dev->of_node;
 	struct adreno_smmu_priv *priv;
+	bool stall_enabled;
 
 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
 
@@ -237,8 +243,17 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
-	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+
+	if (enable_stall < 0) {
+		stall_enabled = of_device_is_compatible(np, "qcom,smmu-v2");
+	} else {
+		stall_enabled = !!enable_stall;
+	}
+
+	if (stall_enabled) {
+		priv->set_stall = qcom_adreno_smmu_set_stall;
+		priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	}
 
 	return 0;
 }
-- 
2.47.1


