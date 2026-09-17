Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA22C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H0sONgMstB32PT+6wzA0a4y05FNhZp1Hw/SakxRfpo=; b=D2JFbnsgLiPziwaxqK4DeCNQ5w
	8yW9fPY6D1rnf5NpIJRMdgC1uFvX3AjijaP6JIP7ByZN+adFuypl+Mxyd6Ex1RiouQ6BXkJGBuTFI
	XKkyceSudiUEhB1guJ2txHCHSWMHMQ+REUCD34wwbrOkcy6OSR749U43IKqujT2/51EaQMZDiwEjC
	oCNQUXwH/jDg+ihRmvQfyPoRcXZX6KpiAMOxhrorVztGESnu++V905z85WoUyK7dQ8NhLYgd1gMEy
	pNDd1RO+EiuviWwBlG8WmDw+pF2i0Kw7w7dp3yUduv2sPNXG/XFxv/gDp1EwbvxP7eASLmEFVUqTS
	Lh9B3h7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXd-0000000BbDk-0fug;
	Thu, 17 Sep 2026 14:56:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXN-0000000Bb61-2HyF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EE551F37;
	Thu, 17 Sep 2026 07:56:28 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B77843F86F;
	Thu, 17 Sep 2026 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656992; bh=BOF7ChOk2hTz/uF1IrvSVSlzJ1TxdzunfQ+vnFOetvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nPxbo8ahRo+UuzWnMO0orlrjGfjMXwWcLZ3pTnpejWNdcNf5M1Jz0ghziKLAqnU8t
	 V7/Zu0sOQMHVZsKz82FGKQc31O1kwmn8kCTTvvbUj7pCLSYYrB9FXonBiqJ30kUSKd
	 PZ0TVROBoNlrQbfNKC+UVTm3UE7tC/YhyjktynEs=
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
Subject: [PATCH v2 03/12] arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth counters
Date: Thu, 17 Sep 2026 15:56:08 +0100
Message-ID: <20260917145617.2202986-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075633_628633_6F56A18F 
X-CRM114-Status: GOOD (  10.05  )
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
2.43.0


