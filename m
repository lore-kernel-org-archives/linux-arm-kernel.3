Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1941D374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc9J5lvEv7upyVjEjf3Fct2vRKHOsrYNRWB14qGNny8=; b=FeCC6ndSnWqCATW/jhXTbB2yJe
	of8celsCL44sWI12pG0vrQ/0mbwAdeoFzAcc/qq3Ch8IfH9ItoY/YLvvFk2aJSgpZ+fqI4sX2Apco
	eRd2Tu/oFN2AFj9oOZe9tIoDigO9UeRnywh+/0BJ9OIoskjvCae3eNsQEWFewuO5mjeROtdVovTRU
	6JepG4cFN45uMx18udHKzOxZKyK7lXDAjKWy51FjJFjZ8TRml4zKdiN2ozDHYfkPwkNidWVC0QzdP
	tqEejE/lfQdX9TqTDzkj7DiaZ4bkx284qSAyi3JqCHqjhVzg7iizjqHkvgz8ugpVLIIrrCUE459XV
	2xd2zJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRds8-0000000A7Ec-35XH;
	Fri, 05 Dec 2025 22:01:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRds7-0000000A7Bp-0IEE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Lc9J5lvEv7upyVjEjf3Fct2vRKHOsrYNRWB14qGNny8=; b=Z7uf5Qkr3Ubo44U9OQDMSf/68e
	/zaS9DDnjET3AprKtdVI6ISrOmq7PjrF5niZQKD+QkR0kyFy0f+7csKEzmGlEQduwZD/gyiT1wMc1
	rRkQ8lwUqhhV0fUztas2Uf75jL1ySpgBwNNSnwX1cMopklltAOspII2sMbPkeGXQ5lpOV3wKbsV+E
	TPTy/O9EWC/J/7BnQMtp3Y+iUIt/48rrpwd45d0ChFI7Ga24Ro6W2iTx6c7ZWrrfXo5XBDhbljJ1A
	8W2Gw6+uLDR3Psga5KHTwwFlvZt7dnPH8U5QbsgvTy/Qdz1vs4Q7XULD5+caZXtp5ztwD7KGRDF8F
	aLaCdp5Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRd0S-00000006swK-3oZj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:06:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F2541BC0;
	Fri,  5 Dec 2025 14:01:35 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A45663F740;
	Fri,  5 Dec 2025 14:01:38 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [RFC PATCH 33/38] arm_mpam: Generate a configuration for min controls
Date: Fri,  5 Dec 2025 21:58:56 +0000
Message-Id: <20251205215901.17772-34-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210628_623065_228BC909 
X-CRM114-Status: GOOD (  22.48  )
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

MPAM supports a minimum and maximum control for memory bandwidth. The
purpose of the minimum control is to give priority to tasks that are
below their minimum value. Resctrl only provides one value for the
bandwidth configuration, which is used for the maximum.

The minimum control is always programmed to zero on hardware that
supports it.

Generate a minimum bandwidth value that is 5% lower than the
value provided by resctrl. This means tasks that are not
receiving their target bandwidth can be prioritised by the
hardware.

CC: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c      | 68 +++++++++++++++++++++++++++--
 drivers/resctrl/mpam_internal.h     |  2 +
 drivers/resctrl/test_mpam_devices.c | 66 ++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 1334093fc03e..741e14e1e6cf 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -721,6 +721,13 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 			mpam_set_feature(mpam_feat_mbw_part, props);
 
 		props->bwa_wd = FIELD_GET(MPAMF_MBW_IDR_BWA_WD, mbw_features);
+
+		/*
+		 * The BWA_WD field can represent 0-63, but the control fields it
+		 * describes have a maximum of 16 bits.
+		 */
+		props->bwa_wd = min(props->bwa_wd, 16);
+
 		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
 			mpam_set_feature(mpam_feat_mbw_max, props);
 
@@ -1387,7 +1394,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	if (mpam_has_feature(mpam_feat_mbw_min, rprops) &&
 	    mpam_has_feature(mpam_feat_mbw_min, cfg))
-		mpam_write_partsel_reg(msc, MBW_MIN, 0);
+		mpam_write_partsel_reg(msc, MBW_MIN, cfg->mbw_min);
 
 	if (mpam_has_feature(mpam_feat_mbw_max, rprops) &&
 	    mpam_has_feature(mpam_feat_mbw_max, cfg)) {
@@ -2693,24 +2700,77 @@ static bool mpam_update_config(struct mpam_config *cfg,
 	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, has_changes);
 	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, has_changes);
+	maybe_update_config(cfg, mpam_feat_mbw_min, newcfg, mbw_min, has_changes);
 
 	return has_changes;
 }
 
+static void mpam_extend_config(struct mpam_class *class, struct mpam_config *cfg)
+{
+	struct mpam_props *cprops = &class->props;
+	u16 min, min_hw_granule, delta;
+	u16 max_hw_value, res0_bits;
+
+	/*
+	 * MAX and MIN should be set together. If only one is provided,
+	 * generate a configuration for the other. If only one control
+	 * type is supported, the other value will be ignored.
+	 *
+	 * Resctrl can only configure the MAX.
+	 */
+	if (mpam_has_feature(mpam_feat_mbw_max, cfg) &&
+	    !mpam_has_feature(mpam_feat_mbw_min, cfg)) {
+		/*
+		 * Calculate the values the 'min' control can hold.
+		 * e.g. on a platform with bwa_wd = 8, min_hw_granule is 0x00ff
+		 * because those bits are RES0. Configurations of this value
+		 * are effectively zero. But configurations need to saturate
+		 * at min_hw_granule on systems with mismatched bwa_wd, where
+		 * the 'less than 0' values are implemented on some MSC, but
+		 * not others.
+		 */
+		res0_bits = 16 - cprops->bwa_wd;
+		max_hw_value = ((1 << cprops->bwa_wd) - 1) << res0_bits;
+		min_hw_granule = ~max_hw_value;
+
+		delta = ((5 * MPAMCFG_MBW_MAX_MAX) / 100) - 1;
+		if (cfg->mbw_max > delta)
+			min = cfg->mbw_max - delta;
+		else
+			min = 0;
+
+		cfg->mbw_min = max(min, min_hw_granule);
+		mpam_set_feature(mpam_feat_mbw_min, cfg);
+	}
+}
+
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
-		      struct mpam_config *cfg)
+		      struct mpam_config *user_cfg)
 {
 	struct mpam_write_config_arg arg;
 	struct mpam_msc_ris *ris;
+	struct mpam_config cfg;
 	struct mpam_vmsc *vmsc;
 	struct mpam_msc *msc;
 
 	lockdep_assert_cpus_held();
 
+
 	/* Don't pass in the current config! */
-	WARN_ON_ONCE(&comp->cfg[partid] == cfg);
+	WARN_ON_ONCE(&comp->cfg[partid] == user_cfg);
 
-	if (!mpam_update_config(&comp->cfg[partid], cfg))
+	/*
+	 * Copy the config to avoid writing back the 'extended' version to
+	 * the caller.
+	 * This avoids mpam_devices.c setting a mbm_min that mpam_resctrl.c
+	 * is unaware of ... when it then changes mbm_max to be lower than
+	 * mbm_min.
+	 */
+	cfg = *user_cfg;
+
+	mpam_extend_config(comp->class, &cfg);
+
+	if (!mpam_update_config(&comp->cfg[partid], &cfg))
 		return 0;
 
 	arg.comp = comp;
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index b13d5e55e701..d381906545ed 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -277,6 +277,7 @@ struct mpam_config {
 	u32	cpbm;
 	u32	mbw_pbm;
 	u16	mbw_max;
+	u16	mbw_min;
 
 	bool	reset_cpbm;
 	bool	reset_mbw_pbm;
@@ -618,6 +619,7 @@ static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
  * MPAMCFG_MBW_MAX - MPAM memory maximum bandwidth partitioning configuration
  *                   register
  */
+#define MPAMCFG_MBW_MAX_MAX_NR_BITS	16
 #define MPAMCFG_MBW_MAX_MAX		GENMASK(15, 0)
 #define MPAMCFG_MBW_MAX_HARDLIM		BIT(31)
 
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
2.39.5


