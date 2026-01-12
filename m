Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ABFCF45AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zkw0quPYE09PYYBiF34shktwK/AVOcAF1ZCsjcw1J8=; b=P2O2dPqqpaVT5QHgcUI0xzaq/2
	//CbeuTivxuBzo34usm4YjXX0GVWbiJOFvWN5xsBJfWR7SeIvCCVIVNd1xIr5yiv8sZWlJOOXna6y
	XBPXgAxBg8Fc28NSpfOXxwnk+b99YYiOa6GiteB29rtaUHIhsYo/bhxGZqFb1O+CR3kv+zrY3ny/v
	EHu016M78nJEnF5LA3o0jmJ+3T3a6oU7jBVD5l50D7uOdgLkzz8hTUv3cIA/4L9MS98ehTgIob3ks
	0bye0BkKcgXcaQaWlDxVAgOxqrE4hEPcbrI3PR7gvnAYjKftpVwS9b3iFWBwxv4Vdjt5T04dfR90w
	dMoG2fYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLKS-00000005oJi-0PTU;
	Mon, 12 Jan 2026 17:03:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLKP-00000005oGY-0P1q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:03:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEFA6153B;
	Mon, 12 Jan 2026 09:03:33 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F3613F694;
	Mon, 12 Jan 2026 09:03:35 -0800 (PST)
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
Subject: [PATCH v3 42/47] arm_mpam: resctrl: Add kunit test for mbw min control generation
Date: Mon, 12 Jan 2026 16:59:09 +0000
Message-ID: <20260112165914.4086692-43-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090341_217518_C48E409F 
X-CRM114-Status: GOOD (  10.71  )
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

By default we generate a minimum bandwidth value that is 5% lower
than the maximum bandwidth value given by resctrl.

Add a test for this.

Signed-off-by: James Morse <james.morse@arm.com>
[horgan: Split test into separate patch]
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/test_mpam_devices.c | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
index 3e8d564a0c64..2f802fd9f249 100644
--- a/drivers/resctrl/test_mpam_devices.c
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -322,6 +322,71 @@ static void test_mpam_enable_merge_features(struct kunit *test)
 	mutex_unlock(&mpam_list_lock);
 }
 
+static void test_mpam_extend_config(struct kunit *test)
+{
+	struct mpam_config fake_cfg = { };
+	struct mpam_class fake_class = { };
+
+	/* Configurations with both are not modified */
+	fake_class.props.bwa_wd = 16;
+	fake_cfg.mbw_max = 0xfeef;
+	fake_cfg.mbw_min = 0xfeef;
+	bitmap_zero(fake_cfg.features, MPAM_FEATURE_LAST);
+	mpam_set_feature(mpam_feat_mbw_max, &fake_cfg);
+	mpam_set_feature(mpam_feat_mbw_min, &fake_cfg);
+	mpam_extend_config(&fake_class, &fake_cfg);
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_max, &fake_cfg));
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_min, &fake_cfg));
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_max, 0xfeef);
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_min, 0xfeef);
+
+	/* When a min is missing, it is generated */
+	fake_class.props.bwa_wd = 16;
+	fake_cfg.mbw_max = 0xfeef;
+	fake_cfg.mbw_min = 0;
+	bitmap_zero(fake_cfg.features, MPAM_FEATURE_LAST);
+	mpam_set_feature(mpam_feat_mbw_max, &fake_cfg);
+	mpam_extend_config(&fake_class, &fake_cfg);
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_max, &fake_cfg));
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_min, &fake_cfg));
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_max, 0xfeef);
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_min, 0xf224);
+
+	fake_class.props.bwa_wd = 8;
+	fake_cfg.mbw_max = 0xfeef;
+	fake_cfg.mbw_min = 0;
+	bitmap_zero(fake_cfg.features, MPAM_FEATURE_LAST);
+	mpam_set_feature(mpam_feat_mbw_max, &fake_cfg);
+	mpam_extend_config(&fake_class, &fake_cfg);
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_max, &fake_cfg));
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_min, &fake_cfg));
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_max, 0xfeef);
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_min, 0xf224);
+
+	/* 5% below the minimum granule, is still the minimum granule */
+	fake_class.props.bwa_wd = 12;
+	fake_cfg.mbw_max = 0xf;
+	fake_cfg.mbw_min = 0;
+	bitmap_zero(fake_cfg.features, MPAM_FEATURE_LAST);
+	mpam_set_feature(mpam_feat_mbw_max, &fake_cfg);
+	mpam_extend_config(&fake_class, &fake_cfg);
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_max, &fake_cfg));
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_min, &fake_cfg));
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_max, 0xf);
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_min, 0xf);
+
+	fake_class.props.bwa_wd = 16;
+	fake_cfg.mbw_max = 0x4;
+	fake_cfg.mbw_min = 0;
+	bitmap_zero(fake_cfg.features, MPAM_FEATURE_LAST);
+	mpam_set_feature(mpam_feat_mbw_max, &fake_cfg);
+	mpam_extend_config(&fake_class, &fake_cfg);
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_max, &fake_cfg));
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_min, &fake_cfg));
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_max, 0x4);
+	KUNIT_EXPECT_EQ(test, fake_cfg.mbw_min, 0x0);
+}
+
 static void test_mpam_reset_msc_bitmap(struct kunit *test)
 {
 	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
@@ -378,6 +443,7 @@ static struct kunit_case mpam_devices_test_cases[] = {
 	KUNIT_CASE(test_mpam_reset_msc_bitmap),
 	KUNIT_CASE(test_mpam_enable_merge_features),
 	KUNIT_CASE(test__props_mismatch),
+	KUNIT_CASE(test_mpam_extend_config),
 	{}
 };
 
-- 
2.43.0


