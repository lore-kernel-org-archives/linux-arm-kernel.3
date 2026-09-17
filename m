Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A927CC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrcPjE/0mFG4qdETjotqWDqwqPebFdi9EAni1l2QCWQ=; b=OcPWDrBGONr6chUA+q+KyOAgmV
	Xlr9hJA2HHPWaOk92/GLhT7bpwtio1S9Ut6eorBSCEiKAT7MBz8MG3eWddpY5WTCe2O6m5V67tyX9
	EvEJKGot502/MedmLmEJ2WgCeZWZftwDkwCl45otS+mb8PWsiX2qDTis9B0PYg5XDrPixt+6QXMf1
	EDI4SB7L1lfWHQb47Rv/3X8WnzN/JanI1GDRsYdbf4QQeu0Q3ZH99o2dCBsCFArqEX9oUrF8g0lfQ
	flmaVBCimj1zVc/PKlqXaI8CxY+a89f7dQiASSVENt/A8KT3s3aM5KFKsexK9skFF7QIdxkhBWvuP
	AA29lz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXe-0000000BbIK-340a;
	Thu, 17 Sep 2026 14:56:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXa-0000000BbC4-1aQR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E3C0202C;
	Thu, 17 Sep 2026 07:56:42 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F22A3F86F;
	Thu, 17 Sep 2026 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657005; bh=97Sj1papgKbZfZ9Y/oUn8Fq54WwKNnH1rTCLTp8yrc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kowBOuiirP6gixi9Ls22o4QmnlevEKFEIlEOss2zXha4QR1mVBq/rWQhWSoFZGK2i
	 liqug7r55sox1O/nzcwTJfSnPs1QN/RzxqiDRI9MDcSIHIVYLJTalFQPjpnIuKRRGy
	 vSFk+P9tC76m8i2p97OB5SR+G/GVNqTTktsx8eOg=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 11/12] arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
Date: Thu, 17 Sep 2026 15:56:16 +0100
Message-ID: <20260917145617.2202986-12-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075646_462271_97DE5B68 
X-CRM114-Status: GOOD (  11.29  )
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
Tested-by: Gavin Shan <gshan@redhat.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 10fc5168699b..d74292f8cdfd 100644
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
 
@@ -2692,7 +2692,7 @@ static int __allocate_component_cfg(struct mpam_component *comp)
 	if (comp->cfg)
 		return 0;
 
-	comp->cfg = kzalloc_objs(*comp->cfg, mpam_partid_max + 1);
+	comp->cfg = kvzalloc_objs(*comp->cfg, mpam_partid_max + 1);
 	if (!comp->cfg)
 		return -ENOMEM;
 
-- 
2.43.0


