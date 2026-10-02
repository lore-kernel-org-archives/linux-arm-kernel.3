Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309DCCA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8guq4bKiO1glXbBKKUVrWqaD0/8ydByY30RAkJK0Ys=; b=mkj/eouf+Eoz7p3nceoVcmJRFT
	G/p4MgXm6JvuxkKB77l9nz9tiBeCJ+CX2NX0Dlp22ymSa8yIV/M3A/m+e8ofQgHhm2cp8fY22Z68S
	26Z9AKPbpeICqeL9BFNAmI8gKpbYLfxaHw3hVH9alq/Ete12HE2pHlHfQRC6TN/WXoq6w/R50K1ZQ
	t1BLsI/SfamK4YRVV5h55R92djjuJVWaMHhIBaNe3dxaozvprpV5IXIRlsBAaUmKq0qnW6yJ8ytc4
	VawdxuNBPZ+TiXr4Btj5+Sca/6RbRbyy/ycBXaXeWwJ+jIKoxw07OEx2nE6GFidO7qfiE7Xsc4nyx
	HzSD/CWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEu-0000000CBHD-3YxS;
	Fri, 02 Oct 2026 17:40:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEs-0000000CBF5-2Ypw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D2292F;
	Fri,  2 Oct 2026 10:40:01 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 621DA3F85F;
	Fri,  2 Oct 2026 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962804; bh=RX71MTt7ItfETHNG3n7ljK+1FQtf14J1SfejLynEffE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rgc1R1tM6muGkN5bUCVA8S/ttHxhAV1M6TlKT1J0PWMD9y0VvmQcbh/zovFSWNsDo
	 IFEu+ydyNXl9X/jame42xPJJXsADjh5WWLuOCajxX7Vi5zK2cNiK9jtNTmZJY54wdF
	 ml9yEjFPlT5XHOF7s6JePXo8K+Zl3wdiTfAeXQWQ=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 03/27] arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth counters
Date: Fri,  2 Oct 2026 18:39:16 +0100
Message-ID: <20261002173941.292319-4-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104006_697573_73E3BC39 
X-CRM114-Status: GOOD (  11.42  )
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

From: Ben Horgan <ben.horgan@arm.com>

When MPAMF_MSMON_IDR.MSMON_MBWU is 1, MSMON_MBWU is present and has a VALUE
field of 31 bits. If additionally, MPAMF_MBWUMON_IDR.HAS_LONG is 1, then
MSMON_MBWU_L is also present and has a VALUE field of 44 or 63 bits as
indicated by MPAMF_MBWUMON_IDR.LWD. Hence, if there are memory bandwidth
counters then there are always 31 bit counters irrespective of whether
there also long counters.

Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
counters.

Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 32bde94dfbc3..e349db525882 100644
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
2.53.0


