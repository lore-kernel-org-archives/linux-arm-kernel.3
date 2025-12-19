Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8861CD7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUu7QMwBz4Zc/M/k/oBT2y0cRg9hqYXU7+WtYJB70T8=; b=RFLNl43BIPNAfnsPbPJGxno5QN
	puoq7QDk9UvEehC8QjaQwZ3bF0y4XoKu5tltiVezSDGlzwiskg9VrFYrOiwKaJgaMnJo5qIqpkwuL
	ugt1bX2qz7yAhvMVfhrUw9Z8h89TF+5lzDH4S+ZD2G/EZ8oRMYGgROsqMI0mfd9EZHfQlXB4BD2jK
	8xJwMv7bwYzD7XDXGC+/klYwLJaA1udy4I2/lUk6txOyjxcuNR3qgezdgCeZu6PRNSNAkAzSk13P0
	Jnq2pM80vNklrD9ziGvIWXjpS6+6KzO9fSKfwWeN3mb9FPq9qqsklLagcd1dwnYxBMxj/VO25u2O0
	56k6vv6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWexg-0000000Akua-2dpS;
	Fri, 19 Dec 2025 18:12:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWexd-0000000AktX-2klQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:12:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60426106F;
	Fri, 19 Dec 2025 10:12:09 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08C563F5CA;
	Fri, 19 Dec 2025 10:12:11 -0800 (PST)
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
Subject: [PATCH v2 03/45] arm_mpam: Use non-atomic bitops when modifying feature bitmap
Date: Fri, 19 Dec 2025 18:11:05 +0000
Message-ID: <20251219181147.3404071-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101217_742007_5B64977D 
X-CRM114-Status: GOOD (  10.58  )
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

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 17cdc3080d58..aaaf31ca9210 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -200,8 +200,8 @@ struct mpam_props {
 } PACKED_FOR_KUNIT;
 
 #define mpam_has_feature(_feat, x)	test_bit(_feat, (x)->features)
-#define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
-#define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
+#define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
+#define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
 
 /* The values for MSMON_CFG_MBWU_FLT.RWBW */
 enum mon_filter_options {
-- 
2.43.0


