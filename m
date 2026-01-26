Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48031C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 03:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJznXfRb1ExPhgEM/qLqi6O5sc5Mc/cQpjqasq10Kfc=; b=YNMhRqGRE96WqhsWtbI6lmBXvU
	0/G4ANfXkghotznY/eVTbDdgqABNel+NVtSNjEvPGnOlnB12kHX03HfqNtKD41hpHPjtnDu3qfmla
	lEjn0KQiYcoNAiDdgvYQZXryC7vWimu5rOC67dnBMHN5vlsivR/PqYRijYSR7ln9TA7ATK2kP0V8c
	bx6a6HkSa1gbCfOGgb0fKC4aVqZJsLA/UJCNHgsqB6gG5YLD/ANMmdMBTKUdZl0nlGwgUG8KaNlds
	e2jD4VwD3F2SulpCqKIAqdZsGpS9zKyyESqhhM8FjLZU6SUOoqBsKXO2tpgQltfQIlmhXEu2KAIjd
	wNhR0rlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDP3-0000000Bqdw-2I0d;
	Mon, 26 Jan 2026 03:36:37 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDP0-0000000BqdX-1xN4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 03:36:35 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 60Q3UW8q017213;
	Mon, 26 Jan 2026 11:30:32 +0800 (+08)
	(envelope-from baisheng.gao@unisoc.com)
Received: from SHDLP.spreadtrum.com (zeshmbx08.spreadtrum.com [10.29.3.106])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4dzv6J0x1jz2P3QY8;
	Mon, 26 Jan 2026 11:24:40 +0800 (CST)
Received: from BJ15137PCW.spreadtrum.com (10.0.73.52) by
 zeshmbx08.spreadtrum.com (10.29.3.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Mon, 26 Jan 2026 11:30:30 +0800
From: Baisheng Gao <baisheng.gao@unisoc.com>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <cixi.geng@linux.dev>, <hao_hao.wang@unisoc.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] perf/arm-ni: Don't crash in probing clock domains without a PMU instance
Date: Mon, 26 Jan 2026 11:30:28 +0800
Message-ID: <20260126033029.7923-2-baisheng.gao@unisoc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126033029.7923-1-baisheng.gao@unisoc.com>
References: <20260126033029.7923-1-baisheng.gao@unisoc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.52]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 zeshmbx08.spreadtrum.com (10.29.3.106)
X-MAIL: SHSQR01.spreadtrum.com 60Q3UW8q017213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1769398245;
	bh=JJznXfRb1ExPhgEM/qLqi6O5sc5Mc/cQpjqasq10Kfc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rq1Rf5ZTNsTGKtBFW9tmJo2IU65pSOJ9P5RWdq5PhbZQugVhnOtuHcwkhL8lC9BMf
	 ezheTT0OGk8iXcymBvNZHtWqGHT2thuRfSP1Cq1Q1L3db+zT7Ndy3RqHlj1PdWkGVc
	 nyqoso80N4mnPOtQeVas6imtdY/S+Um0+sXQ+cifXxPK+Y3v41nFwVvF4opsPu346M
	 MFHc/g1eMdywB/YxuolBD2jywyRhau0HKvBJwcIvlo5QU7nziSMHf5agQfQtsOALMc
	 lrX+0s7EJCWvs1BjhuD0Xk66Wq4l9SC9UqlxV14WvOLvrrQTOMcMagUswUoeUz+Sh1
	 xqz3VFumlODxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_193634_939981_C5EA1F61 
X-CRM114-Status: GOOD (  12.27  )
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

The NULL pmusela pointer implies that current clock domain doesn't have
a PMU instance. Return 0 for probing the next clock domain. Otherwise a
kernel crash will happen.

Signed-off-by: Baisheng Gao <baisheng.gao@unisoc.com>
---
 drivers/perf/arm-ni.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 66858c65215d..53b656983da1 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -526,6 +526,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 {
 	struct arm_ni_cd *cd = ni->cds + node->id;
 	const char *name;
+	static atomic_t id;
 
 	cd->id = node->id;
 	cd->num_units = node->num_components;
@@ -562,6 +563,11 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 		case NI_TMNI:
 		case NI_CMNI:
 			unit->pmusela = arm_ni_get_pmusel(ni, unit_base);
+			if (!unit->pmusela) {
+				dev_info(ni->dev, "No have PMU %d\n", cd->id);
+				devm_kfree(ni->dev, cd->units);
+				return 0;
+			}
 			writel_relaxed(1, unit->pmusela);
 			if (readl_relaxed(unit->pmusela) != 1)
 				dev_info(ni->dev, "No access to node 0x%04x%04x\n", unit->id, unit->type);
@@ -591,7 +597,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMCNTENCLR);
 	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMOVSCLR);
 
-	cd->irq = platform_get_irq(to_platform_device(ni->dev), cd->id);
+	cd->irq = platform_get_irq(to_platform_device(ni->dev), atomic_fetch_inc(&id));
 	if (cd->irq < 0)
 		return cd->irq;
 
-- 
2.34.1


