Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B875C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuJtPNFjyz41SjwXp/5VVgglnbPZECusRZbOkARzVFA=; b=h8hhKRUdcP7lCz4k8WsYauvNj5
	kKXQWJ+xAjororQsXh+jRqvXDoN5ki2Due13CL8S/D+GqTs0TJandt3j1sgOGjlqkOkuIo6Y6Y9s2
	KW+01GUscznJbUw8SzHYtvJTvSlv3sxcqRrWoRdr0EsEc4aL6SGK9YkCPSSQsqLQprIkHjFNIHlb+
	ktHn/zmZm5AhXAqRSMbvmfjVPcdnZx/CUzY8UPwB5eiAO5Er1Yl0SrYLWELcSSICFw3AzYP4xfAAd
	M0hcQGQQovGOtnW+/VWWCTNUIDmMg0tfsBKvpuH0wR3v6blhJx04MtWshvdWMb+WLlvpEEU5V9kPB
	r9HYLdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc4IU-0000000HZtA-1lw4;
	Sun, 26 Jan 2025 15:11:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc4FF-0000000HYvM-1duw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 15:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A80065C5EF8;
	Sun, 26 Jan 2025 15:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F0DC4CEE2;
	Sun, 26 Jan 2025 15:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904096;
	bh=wU4p/1jhFmOpkLwYEez7JQ4/M7aI4yao+Hq6x1njINs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOp5L6OM4wVDh1s+xSL1DRfSgmYJB/iZLOxusQ8l/9jrHKWkKcypxWJd2LiXRf+eZ
	 5haWKU6tm8YuHrNw7Frw0TOp+LjS3SWGMaYODqjcx45DJl5DB2LIhpEGIkcHrLKyih
	 KtOFZIreDsFKtgHDJ32qv2AfmL6YUD+iZugULefpFnK9R2yFRcj6zI7ifr9u0uSafl
	 AY8hoHnSj1uKIxaxP7zycqanT7ETyxcfFg/3x5qXtIYmN+cxPuNdp6wkXi9iKPGLHM
	 gOSjess8MvhGBu33LpaNrAovnPD6Iu01DoLZ8dRQxanUTPko076/4dRLJe3JEAGW74
	 JQswOcTQEJZxw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 04/14] iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
Date: Sun, 26 Jan 2025 10:07:51 -0500
Message-Id: <20250126150803.962459-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150803.962459-1-sashal@kernel.org>
References: <20250126150803.962459-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_070817_482169_CE95C3C3 
X-CRM114-Status: GOOD (  10.50  )
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

From: Richard Acayan <mailingradian@gmail.com>

[ Upstream commit 42314738906380cbd3b6e9caf3ad34e1b2d66035 ]

Add the compatible for the separate IOMMU on SDM670 for the Adreno GPU.

This IOMMU has the compatible strings:

	"qcom,sdm670-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"

While the SMMU 500 doesn't need an entry for this specific SoC, the
SMMU v2 compatible should have its own entry, as the fallback entry in
arm-smmu.c handles "qcom,smmu-v2" without per-process page table support
unless there is an entry here. This entry can't be the
"qcom,adreno-smmu" compatible because dedicated GPU IOMMUs can also be
SMMU 500 with different handling.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20241114004713.42404-6-mailingradian@gmail.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4bc..601fb878d0ef2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -567,6 +567,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
+	{ .compatible = "qcom,sdm670-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
-- 
2.39.5


