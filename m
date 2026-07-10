Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B1BC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJ8eZm20C+xzG4yO5VoeZarfoPNUMBd6HINk9uGXZrs=; b=pamaDqF6jk80mRdaSyDUD2HiNd
	amW4IaOmIAiuomOwxOh+bh68gUwL8TY0SdD0GXqO6i1ot8hUNTsA7As5jQ0289hVSuTRWVoF8FUB/
	VjxT9GOdbOEm0bkKtVcZ9zvmCD1vcSjrOYD6qLUDEgZ5q3M92PbHfXHw4VIVvBtz1qMvzJFYS/ixe
	mabZrRzn6j5AmBkZt2WgXP7Y0N1PFCqEB1XF6354p+RQiNlsgibeBwsIQYs0ttS89eHDJKK1KGBIQ
	fDpKME3v8FbnbZCz9pWGaTH7StQx3ik+uk9Wj5cVTwaVaVr90l6HATZL/uhvNOR4hpb+MGzRp1yfb
	2KljAVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pw-00000004rol-2xTj;
	Fri, 10 Jul 2026 11:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pp-00000004rl4-40Ym
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C08711F60;
	Fri, 10 Jul 2026 04:55:56 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C851C3F85F;
	Fri, 10 Jul 2026 04:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684561; bh=jyZaWrzQW2+8ZjtDhJRNf/X0UVefC+oLDCOLf6ASGqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QFNh6fEAFTyAscqIw9g93BiLidXr3mLZ3y/IHfxWQl42qwCuWpv022dLWmZbZ3uqC
	 QIAt0dOE71+/i4vDu8WeRNiZMf0ohZAN8auOTfGS1plu2eYq70pqIiXc1cZkHyj+PM
	 yISlYJdEVwmuTsYy4FREuxmj8MNPLji3u+xJZmb4=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 03/11] arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth counters
Date: Fri, 10 Jul 2026 12:55:37 +0100
Message-ID: <20260710115546.29644-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045602_041983_EA376288 
X-CRM114-Status: GOOD (  10.56  )
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

If there are memory bandwidth counters then there are 31 bit counters even
if there are also 44 bit counters or 63 bit counters.

Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
counters.

Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index acfa9a4dc2fc..11b10c3bc334 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -930,9 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 						mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
 					else
 						mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
-				} else {
-					mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
 				}
+
+				mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
 			}
 		}
 	}
-- 
2.43.0


