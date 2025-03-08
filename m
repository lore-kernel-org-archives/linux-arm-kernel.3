Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54019C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjSoUBvhcQw/y04Nu5LFvXZ5AJDuaSz5Df8S6I6vgwI=; b=PbUgBCQ/4BmvOI03qIJXU7/Uer
	FLtzLWuma1rjHYjOQfFYKsYaJpr0Ni6ryFz0x0lU2Dr6am1dVkg+YrJRsRwKm6j1Razc4ETBGVJqZ
	nrCjdJFRlzKbnbpdT5E1xfqxEB3vV/Qxp7Uas+EMh8OyOyeoxtwWJAFxhhje64F5F8uwih2itpe3v
	ADz+jk/EDmgIJimIQ8t9mliZnSrxEvx+wXCLh7JZQNCKi/ysrDzzr7U3K8SsEockAK/TzJ8RkNAu5
	Qn9j+1mV1srF9yOzxBERbpRdiQyj7/rg8pDcAVlmPRdlXQ3Lm9wiRJqWUO8qYhzgQV7lPgk5Q5A6m
	KlPgQKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjSy-0000000G1kD-3PVe;
	Sat, 08 Mar 2025 01:59:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjDm-0000000G0KB-3sVf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C5A15C6602;
	Sat,  8 Mar 2025 01:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA71C4CEE5;
	Sat,  8 Mar 2025 01:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398201;
	bh=OG5d4gY7vmYN/Ho4ZXDwy54ckaj7MCjmkwbMaApZrvU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JQq5yZxJlsLHgKqwEIJjBV36D0Kdgq3y8Ju9bXkzTOORm1xc2n8YZ89xtV+KxH4cR
	 J0hSfIHtRE/RZhILpnFZN/jvw/q+O61Cv5dCsOJMLsbG22OKQwertUg/gsaWNK+CjG
	 Lm0xLwep/ejVBAyJgQyAxt0iTspdKtdJd/ADwsTiopeVxh8Bl6JS2AZ3EXlk+TArIF
	 YVDYo5MNJlnaIHuytj/FFTU3FzFF9Jjrjd6l53fwTHNjsM/L0QAo6gN92Cv9D1Zu7P
	 h7EKGJCF6OjhbtuYleg5p4I5qGVRGtpnGeXJMJqf5x5lp1NFW41xCSqWGTwYjUejzs
	 9CUdXmUfCH+Mw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:27 +0200
Subject: [PATCH 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-9-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j/LGXpgnuRffqJSRqVOkk/ZdY8s1uzD2F9Jjdwztl/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6CAxxZGDgsjcLcAI1NZ2TOAk2MEfUKHJoSf5
 XfKxzcufCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8uggAAKCRCLPIo+Aiko
 1dM/B/9hE66yTgSssAuebWoQUA0xTmBhut7MIiW8AzsAp6XUxO5+gBnmAu0vc76K+ON8DqKP0a7
 exediHmxBxwPm+jtH/vOnd9Nyw+QZFohfmyMPcnYwl6EiLZCptHnDR59t5dwFSOCRmnpF1Q7+0K
 NPoGLkVRcTMyddOB1wHSG03Uwm+LF+Fq0v7ZGuOjw28ilCDiDcCwa4lpaSlO2SkA0V0bQtY2ngC
 K3aDcYf6wQ37aHiN6R7fVQ51Nvc/Vfn2kAoEsHy0pdgUs8TAc7j485cIsqc7le+csce3tN2f9iO
 dZkXgfi5xVEwi4mENH7Fn0t0eLukFsRkgfDo/Pt6u9zOUbRe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_174323_086988_2EA909B2 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5


