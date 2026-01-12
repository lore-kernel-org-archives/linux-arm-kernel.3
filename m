Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0D1CF45A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTMh0t9Ho4AcQTycLdH9RwmXdrDnPXbet7pHWETQBM4=; b=dKjHgHZQJ6WmjIXBC0MsOIIJn4
	PM2cKQQI9ejsbqLVTQ38UZO0O98FGoafGgiRsNMQmRVjPTUX9aU1aEN4upaW0yp30biSq8sGi3UeV
	r1lAbFw55ayKmhkzEMYJoeB+aSLI4PpsumuAop+Y0+J3NQrmr6w81bJMNKYHH30yfZxX75Ogr4VuD
	dJ8UyA2bVpXZAbyHS6sP2hopUVpJbBZozJSWIAuRY4YYLTAknGv9/OQOEplr9olGZTFWU8LQ5sxP8
	1Zw61hN4C0xi9SD00BRSCJI5rUIAfudL/T70BlUI6wXpWLQKaK06gvq4Bj7axW311/Gqr0ZK7M8NP
	Xc2HijgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLGu-00000005kxX-423g;
	Mon, 12 Jan 2026 17:00:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLGt-00000005kwY-0wm2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:00:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC9E3153B;
	Mon, 12 Jan 2026 08:59:54 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5FFA33F694;
	Mon, 12 Jan 2026 08:59:56 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev
Subject: [PATCH v3 02/47] arm_mpam: Use non-atomic bitops when modifying feature bitmap
Date: Mon, 12 Jan 2026 16:58:29 +0000
Message-ID: <20260112165914.4086692-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090003_586430_EC6F1FEB 
X-CRM114-Status: GOOD (  11.11  )
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

In the test__props_mismatch() kunit test we rely on the struct mpam_props
being packed to ensure memcmp doesn't consider packing. Making it packed
reduces the alignment of the features bitmap and so breaks a requirement
for the use of atomics. As we don't rely on the set/clear of these bits
being atomic, just make them non-atomic.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Add comment (Jonathan)
---
 drivers/resctrl/mpam_internal.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 17cdc3080d58..e8971842b124 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -200,8 +200,12 @@ struct mpam_props {
 } PACKED_FOR_KUNIT;
 
 #define mpam_has_feature(_feat, x)	test_bit(_feat, (x)->features)
-#define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
-#define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
+/*
+ * The non-atomic get/set operations are used because if struct mpam_props is
+ * packed, the alignment requirements for atomics aren't met.
+ */
+#define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
+#define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
 
 /* The values for MSMON_CFG_MBWU_FLT.RWBW */
 enum mon_filter_options {
-- 
2.43.0


