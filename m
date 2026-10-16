Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F382DCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+Q/gijWLNYJalY5gR1Couj/LNq0adkq+xT5gR4tON8=; b=FhGYnL8UL0u9Lg3CQOKI6MdwBr
	anPT1quA/bLTmpUscRklFRX32luqkYZzg1LJRMV/vH6RlN/l0x/NNrtf0eW1ftQtRlWTlYzfNaTsf
	bgjAlKpAiIT2JXSX97nec7uQWweA9sXren/Sp0L0FW4C5fWe/GZQWbZ5Ga8KrEGtP5UJqovUHapft
	pYZ4scM1ckDKlJO5l3ScJhW4AJC4xHDwyugg7a9deevGSlseHVzPSu3NO4RBznWjt0is7SgmB54Fy
	lrO+RDHJs+w91TjL2dYtY7RhMNQKjSfjvWwx6XiRpZJmgkUIIgN+VAtMBMXKw/yIuyOwsKc++QL5G
	mE5DqZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeWV-00000002Wyi-3GeJ;
	Fri, 16 Oct 2026 09:46:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeWU-00000002WyG-0tne
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8FE060A56;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DAFBC2BCFB;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792144005;
	bh=WN8ne8APJSKDOBLbnZQKiIgT1j4FX2dGzt2uRPetLwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JoywHDUbBTIXhVgObe6+aS0RoLo4ClD6bdr4JQhQqy0ZJJmt0q+na2AI7VpyBvH+/
	 afzsUpgU5JK5+fmriEddiVYFFLp/zIv8cjhTs17tOS9vME/EHE3MTTXbVbeF1td5PT
	 PDFKoB9UTBMehdWYcm/W4clDpb92qQoZNMS/OQ1oYc+Ew8ttXJe+CGV/SeEfhnh9Xt
	 Tyg8HQ+bQJR0OUsZxpAGXhhc9oN3+o2aIaSoVv9TEjCFTDok+h4rstoqhZmmwEBiky
	 I1rfAgiNvvuJeR3DWMQVpIjnArJ1qf0lQG68cTo4QPESKCB9mrUDsgvqK/jzzzj0RN
	 FUjkwej4aGSzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D152CCA48B;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 16 Oct 2026 15:16:41 +0530
Subject: [PATCH 2/2] iommu/arm-smmu-qcom: Skip PRR setup on SM7250 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-smmu-sm7250-v1-2-e11fc0384cfa@brar.si>
References: <20261016-smmu-sm7250-v1-0-e11fc0384cfa@brar.si>
In-Reply-To: <20261016-smmu-sm7250-v1-0-e11fc0384cfa@brar.si>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792144002; l=1110;
 i=patches@brar.si; h=from:subject:message-id;
 bh=VF/mGbM1EJsewrS92EWhHwKM9QYUxif31RQPsJ22WkY=;
 b=MgCQW+q+gdFxZtCWsk0t82jYnAc0w2/vWkXnNsoCO55m+Zt6MIUZx590bsXBO94tK74UYRbTg
 nMtTRX6V0tsDmJoW4NKUgkU3htbhLWlIwJGie3sIh3NVX6sdywqjsP2
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
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
Reply-To: patches@brar.si
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ishu Brar <patches@brar.si>

As on SM8250, the firmware on SM7250 resets the device when the Adreno
SMMU PRR registers are written. This happened as soon as the first
per-process GPU pagetable was created. Do not install the PRR
callbacks for the SM7250 GPU SMMU either.

Tested on a OnePlus Nord (SM7250) with Vulkan.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e..55071eb03 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -394,6 +394,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_prr_addr = NULL;
 
 	if (of_device_is_compatible(np, "qcom,smmu-500") &&
+	    !of_device_is_compatible(np, "qcom,sm7250-smmu-500") &&
 	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
 	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
 		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;

-- 
2.56.0



