Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F45EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VJCgMwyNW3Knp0YEQPSo3ityJH+Z3AnQS9vFuyu2tc=; b=GG0BTjsb5jmHUC3iwxOXAPbfXH
	L0WoCDVHgavW4dDtdf9VJqC/XN80WK7FhfaWmVdTdooE3ubUfGqlueHr4hw57AGDaU5HTYZtNm4aD
	cvZWEYD/ypcPBp1FOx5alcNIsQ6RObqyBVf36j2aPULG1ls+aoCk3b2eQ5JG9U1z4y8hW87xQ46K/
	T2SDxSuawGd1zXW9/UdBhYRG+wC323ne+37d3Hg3l4CMwJusX/YamdOPg5hPSroJqnx7bVu1kQpgO
	k7fwwEaNeEBOKdtMwXU/clhoA7FLrP8vZmRyAqxIWNiTzeemtvBYr5/7lCtFLdvJ5DOaw7Hc7whJ7
	Ybr3UJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9q8-00000004s0Z-2Nxy;
	Fri, 10 Jul 2026 11:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9q2-00000004rus-0M5p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 576A81E7D;
	Fri, 10 Jul 2026 04:56:09 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CEBA3F85F;
	Fri, 10 Jul 2026 04:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684573; bh=aDNC81Q5P6V6soD3KMNRVbYyVWehpRsMTUtQd8Rvi28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OhVa8Nk9V1vPmQhXHtPBP7OzyhMugXg3NCHv6ERNSa9aQD/EeNW0LIO3S9fkJge9A
	 MRpPCiCWlLEjcFjQ2V1xfL0hkcxqvNIVMCsU2YSupuzo5l09kNhS4zHrXIz9VVZyYB
	 HaE3f6zfuYI87acleQ8J2DGHPki2OZ8J/hTNzx18=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 11/11] arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
Date: Fri, 10 Jul 2026 12:55:45 +0100
Message-ID: <20260710115546.29644-12-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045614_163387_D95EA3F5 
X-CRM114-Status: GOOD (  11.99  )
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

Each component cfg is sized by the size of a per-PARTID multiplied by the
number of PARTIDs. On a platform sized to push the limits of the
specification, the allocation using kzalloc_objs() will consistently
fail. Change to use kvzmalloc_objs() so that large allocations fall back to
vmalloc() based allocations.

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 9412ffde1cf1..9a7954b7a2af 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -157,7 +157,7 @@ static void mpam_free_garbage(void)
 		if (iter->pdev)
 			devm_kfree(&iter->pdev->dev, iter->to_free);
 		else
-			kfree(iter->to_free);
+			kvfree(iter->to_free);
 	}
 }
 
@@ -2667,7 +2667,7 @@ static int __allocate_component_cfg(struct mpam_component *comp)
 	if (comp->cfg)
 		return 0;
 
-	comp->cfg = kzalloc_objs(*comp->cfg, mpam_partid_max + 1);
+	comp->cfg = kvzalloc_objs(*comp->cfg, mpam_partid_max + 1);
 	if (!comp->cfg)
 		return -ENOMEM;
 
-- 
2.43.0


