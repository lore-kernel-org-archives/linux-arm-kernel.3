Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784C3CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPQvnzMRfxtsG5/C39XmEdF1FPz6LlxH2JSIOcPwvoQ=; b=YQJ/PdPsU3bPbWmXP1GPHDWczD
	hFtqc0aguc2+6zE3JSQ52AYtN/GX/N/UdjU1wVXJnggAljn02pJiOXkja39rdGXxJXwNJ/y81R5/F
	kCyMoAvEaBBlknRbefj2xnDJtLTe6W8nTaJWsxl32tJmnrjDS43NERurfzfbCgGbg8X3pof6KMamZ
	wQsov2LDJe9t3Ig+TWwy9YT8F1zOb+bw7O+nNMWbcS8TsKVEO9l4QAUf70ase6bnIy2G4h+tPBBlV
	OQ/cO9W5wb5k0OP77ow/uhKqHeteBsMC4t2llppHzdp3AHu5MjysiBTk3xJ0isjVHt3Pwr5BoKTCi
	Z9UmqqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pg2-00000008lyB-0i6m;
	Fri, 17 Oct 2025 18:59:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pfx-00000008lt1-44a7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:59:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94CEF1595;
	Fri, 17 Oct 2025 11:59:33 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70B3C3F66E;
	Fri, 17 Oct 2025 11:59:36 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
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
	David Hildenbrand <david@redhat.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v3 29/29] arm_mpam: Add kunit tests for props_mismatch()
Date: Fri, 17 Oct 2025 18:56:45 +0000
Message-Id: <20251017185645.26604-30-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251017185645.26604-1-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115942_210438_B17FC10F 
X-CRM114-Status: GOOD (  16.45  )
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

When features are mismatched between MSC the way features are combined
to the class determines whether resctrl can support this SoC.

Add some tests to illustrate the sort of thing that is expected to
work, and those that must be removed.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes since v2:
 * Comment on why packing is only needed for kunit tests,
 * Made the reset code a function not a macro.

Changes since v1:
 * Waggled some words in comments.
 * Moved a bunch of variables to be global - shuts up a compiler warning.
---
 drivers/resctrl/mpam_internal.h     |  14 +-
 drivers/resctrl/test_mpam_devices.c | 320 ++++++++++++++++++++++++++++
 2 files changed, 333 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 6632699ae814..4f25681b56ab 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -25,6 +25,12 @@ struct platform_device;
 
 DECLARE_STATIC_KEY_FALSE(mpam_enabled);
 
+#ifdef CONFIG_MPAM_KUNIT_TEST
+#define PACKED_FOR_KUNIT __packed
+#else
+#define PACKED_FOR_KUNIT
+#endif
+
 static inline bool mpam_is_enabled(void)
 {
 	return static_branch_likely(&mpam_enabled);
@@ -180,7 +186,13 @@ struct mpam_props {
 	u16			dspri_wd;
 	u16			num_csu_mon;
 	u16			num_mbwu_mon;
-};
+
+/*
+ * Kunit tests use memset() to set up feature combinations that should be
+ * removed, and will false-positive if the compiler introduces padding that
+ * isn't cleared during sanitisation.
+ */
+} PACKED_FOR_KUNIT;
 
 #define mpam_has_feature(_feat, x)	test_bit(_feat, (x)->features)
 #define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
index 0cfb41b665c4..3e8d564a0c64 100644
--- a/drivers/resctrl/test_mpam_devices.c
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -4,6 +4,324 @@
 
 #include <kunit/test.h>
 
+/*
+ * This test catches fields that aren't being sanitised - but can't tell you
+ * which one...
+ */
+static void test__props_mismatch(struct kunit *test)
+{
+	struct mpam_props parent = { 0 };
+	struct mpam_props child;
+
+	memset(&child, 0xff, sizeof(child));
+	__props_mismatch(&parent, &child, false);
+
+	memset(&child, 0, sizeof(child));
+	KUNIT_EXPECT_EQ(test, memcmp(&parent, &child, sizeof(child)), 0);
+
+	memset(&child, 0xff, sizeof(child));
+	__props_mismatch(&parent, &child, true);
+
+	KUNIT_EXPECT_EQ(test, memcmp(&parent, &child, sizeof(child)), 0);
+}
+
+static struct list_head fake_classes_list;
+static struct mpam_class fake_class = { 0 };
+static struct mpam_component fake_comp1 = { 0 };
+static struct mpam_component fake_comp2 = { 0 };
+static struct mpam_vmsc fake_vmsc1 = { 0 };
+static struct mpam_vmsc fake_vmsc2 = { 0 };
+static struct mpam_msc fake_msc1 = { 0 };
+static struct mpam_msc fake_msc2 = { 0 };
+static struct mpam_msc_ris fake_ris1 = { 0 };
+static struct mpam_msc_ris fake_ris2 = { 0 };
+static struct platform_device fake_pdev = { 0 };
+
+static inline void reset_fake_hierarchy(void)
+{
+	INIT_LIST_HEAD(&fake_classes_list);
+
+	memset(&fake_class, 0, sizeof(fake_class));
+	fake_class.level = 3;
+	fake_class.type = MPAM_CLASS_CACHE;
+	INIT_LIST_HEAD_RCU(&fake_class.components);
+	INIT_LIST_HEAD(&fake_class.classes_list);
+
+	memset(&fake_comp1, 0, sizeof(fake_comp1));
+	memset(&fake_comp2, 0, sizeof(fake_comp2));
+	fake_comp1.comp_id = 1;
+	fake_comp2.comp_id = 2;
+	INIT_LIST_HEAD(&fake_comp1.vmsc);
+	INIT_LIST_HEAD(&fake_comp1.class_list);
+	INIT_LIST_HEAD(&fake_comp2.vmsc);
+	INIT_LIST_HEAD(&fake_comp2.class_list);
+
+	memset(&fake_vmsc1, 0, sizeof(fake_vmsc1));
+	memset(&fake_vmsc2, 0, sizeof(fake_vmsc2));
+	INIT_LIST_HEAD(&fake_vmsc1.ris);
+	INIT_LIST_HEAD(&fake_vmsc1.comp_list);
+	fake_vmsc1.msc = &fake_msc1;
+	INIT_LIST_HEAD(&fake_vmsc2.ris);
+	INIT_LIST_HEAD(&fake_vmsc2.comp_list);
+	fake_vmsc2.msc = &fake_msc2;
+
+	memset(&fake_ris1, 0, sizeof(fake_ris1));
+	memset(&fake_ris2, 0, sizeof(fake_ris2));
+	fake_ris1.ris_idx = 1;
+	INIT_LIST_HEAD(&fake_ris1.msc_list);
+	fake_ris2.ris_idx = 2;
+	INIT_LIST_HEAD(&fake_ris2.msc_list);
+
+	fake_msc1.pdev = &fake_pdev;
+	fake_msc2.pdev = &fake_pdev;
+
+	list_add(&fake_class.classes_list, &fake_classes_list);
+}
+
+static void test_mpam_enable_merge_features(struct kunit *test)
+{
+	reset_fake_hierarchy();
+
+	mutex_lock(&mpam_list_lock);
+
+	/* One Class+Comp, two RIS in one vMSC with common features */
+	fake_comp1.class = &fake_class;
+	list_add(&fake_comp1.class_list, &fake_class.components);
+	fake_comp2.class = NULL;
+	fake_vmsc1.comp = &fake_comp1;
+	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
+	fake_vmsc2.comp = NULL;
+	fake_ris1.vmsc = &fake_vmsc1;
+	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
+	fake_ris2.vmsc = &fake_vmsc1;
+	list_add(&fake_ris2.vmsc_list, &fake_vmsc1.ris);
+
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris2.props);
+	fake_ris1.props.cpbm_wd = 4;
+	fake_ris2.props.cpbm_wd = 4;
+
+	mpam_enable_merge_features(&fake_classes_list);
+
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
+	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 4);
+
+	reset_fake_hierarchy();
+
+	/* One Class+Comp, two RIS in one vMSC with non-overlapping features */
+	fake_comp1.class = &fake_class;
+	list_add(&fake_comp1.class_list, &fake_class.components);
+	fake_comp2.class = NULL;
+	fake_vmsc1.comp = &fake_comp1;
+	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
+	fake_vmsc2.comp = NULL;
+	fake_ris1.vmsc = &fake_vmsc1;
+	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
+	fake_ris2.vmsc = &fake_vmsc1;
+	list_add(&fake_ris2.vmsc_list, &fake_vmsc1.ris);
+
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_cmax_cmin, &fake_ris2.props);
+	fake_ris1.props.cpbm_wd = 4;
+	fake_ris2.props.cmax_wd = 4;
+
+	mpam_enable_merge_features(&fake_classes_list);
+
+	/* Multiple RIS within one MSC controlling the same resource can be mismatched */
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cmax_cmin, &fake_class.props));
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cmax_cmin, &fake_vmsc1.props));
+	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 4);
+	KUNIT_EXPECT_EQ(test, fake_vmsc1.props.cmax_wd, 4);
+	KUNIT_EXPECT_EQ(test, fake_class.props.cmax_wd, 4);
+
+	reset_fake_hierarchy();
+
+	/* One Class+Comp, two MSC with overlapping features */
+	fake_comp1.class = &fake_class;
+	list_add(&fake_comp1.class_list, &fake_class.components);
+	fake_comp2.class = NULL;
+	fake_vmsc1.comp = &fake_comp1;
+	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
+	fake_vmsc2.comp = &fake_comp1;
+	list_add(&fake_vmsc2.comp_list, &fake_comp1.vmsc);
+	fake_ris1.vmsc = &fake_vmsc1;
+	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
+	fake_ris2.vmsc = &fake_vmsc2;
+	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
+
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris2.props);
+	fake_ris1.props.cpbm_wd = 4;
+	fake_ris2.props.cpbm_wd = 4;
+
+	mpam_enable_merge_features(&fake_classes_list);
+
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
+	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 4);
+
+	reset_fake_hierarchy();
+
+	/* One Class+Comp, two MSC with non-overlapping features */
+	fake_comp1.class = &fake_class;
+	list_add(&fake_comp1.class_list, &fake_class.components);
+	fake_comp2.class = NULL;
+	fake_vmsc1.comp = &fake_comp1;
+	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
+	fake_vmsc2.comp = &fake_comp1;
+	list_add(&fake_vmsc2.comp_list, &fake_comp1.vmsc);
+	fake_ris1.vmsc = &fake_vmsc1;
+	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
+	fake_ris2.vmsc = &fake_vmsc2;
+	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
+
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_cmax_cmin, &fake_ris2.props);
+	fake_ris1.props.cpbm_wd = 4;
+	fake_ris2.props.cmax_wd = 4;
+
+	mpam_enable_merge_features(&fake_classes_list);
+
+	/*
+	 * Multiple RIS in different MSC can't control the same resource,
+	 * mismatched features can not be supported.
+	 */
+	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
+	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_cmax_cmin, &fake_class.props));
+	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 0);
+	KUNIT_EXPECT_EQ(test, fake_class.props.cmax_wd, 0);
+
+	reset_fake_hierarchy();
+
+	/* One Class+Comp, two MSC with incompatible overlapping features */
+	fake_comp1.class = &fake_class;
+	list_add(&fake_comp1.class_list, &fake_class.components);
+	fake_comp2.class = NULL;
+	fake_vmsc1.comp = &fake_comp1;
+	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
+	fake_vmsc2.comp = &fake_comp1;
+	list_add(&fake_vmsc2.comp_list, &fake_comp1.vmsc);
+	fake_ris1.vmsc = &fake_vmsc1;
+	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
+	fake_ris2.vmsc = &fake_vmsc2;
+	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
+
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris2.props);
+	mpam_set_feature(mpam_feat_mbw_part, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_mbw_part, &fake_ris2.props);
+	fake_ris1.props.cpbm_wd = 5;
+	fake_ris2.props.cpbm_wd = 3;
+	fake_ris1.props.mbw_pbm_bits = 5;
+	fake_ris2.props.mbw_pbm_bits = 3;
+
+	mpam_enable_merge_features(&fake_classes_list);
+
+	/*
+	 * Multiple RIS in different MSC can't control the same resource,
+	 * mismatched features can not be supported.
+	 */
+	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
+	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_mbw_part, &fake_class.props));
+	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 0);
+	KUNIT_EXPECT_EQ(test, fake_class.props.mbw_pbm_bits, 0);
+
+	reset_fake_hierarchy();
+
+	/* One Class+Comp, two MSC with overlapping features that need tweaking */
+	fake_comp1.class = &fake_class;
+	list_add(&fake_comp1.class_list, &fake_class.components);
+	fake_comp2.class = NULL;
+	fake_vmsc1.comp = &fake_comp1;
+	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
+	fake_vmsc2.comp = &fake_comp1;
+	list_add(&fake_vmsc2.comp_list, &fake_comp1.vmsc);
+	fake_ris1.vmsc = &fake_vmsc1;
+	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
+	fake_ris2.vmsc = &fake_vmsc2;
+	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
+
+	mpam_set_feature(mpam_feat_mbw_min, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_mbw_min, &fake_ris2.props);
+	mpam_set_feature(mpam_feat_cmax_cmax, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_cmax_cmax, &fake_ris2.props);
+	fake_ris1.props.bwa_wd = 5;
+	fake_ris2.props.bwa_wd = 3;
+	fake_ris1.props.cmax_wd = 5;
+	fake_ris2.props.cmax_wd = 3;
+
+	mpam_enable_merge_features(&fake_classes_list);
+
+	/*
+	 * RIS with different control properties need to be sanitised so the
+	 * class has the common set of properties.
+	 */
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_mbw_min, &fake_class.props));
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cmax_cmax, &fake_class.props));
+	KUNIT_EXPECT_EQ(test, fake_class.props.bwa_wd, 3);
+	KUNIT_EXPECT_EQ(test, fake_class.props.cmax_wd, 3);
+
+	reset_fake_hierarchy();
+
+	/* One Class Two Comp with overlapping features */
+	fake_comp1.class = &fake_class;
+	list_add(&fake_comp1.class_list, &fake_class.components);
+	fake_comp2.class = &fake_class;
+	list_add(&fake_comp2.class_list, &fake_class.components);
+	fake_vmsc1.comp = &fake_comp1;
+	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
+	fake_vmsc2.comp = &fake_comp2;
+	list_add(&fake_vmsc2.comp_list, &fake_comp2.vmsc);
+	fake_ris1.vmsc = &fake_vmsc1;
+	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
+	fake_ris2.vmsc = &fake_vmsc2;
+	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
+
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris2.props);
+	fake_ris1.props.cpbm_wd = 4;
+	fake_ris2.props.cpbm_wd = 4;
+
+	mpam_enable_merge_features(&fake_classes_list);
+
+	KUNIT_EXPECT_TRUE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
+	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 4);
+
+	reset_fake_hierarchy();
+
+	/* One Class Two Comp with non-overlapping features */
+	fake_comp1.class = &fake_class;
+	list_add(&fake_comp1.class_list, &fake_class.components);
+	fake_comp2.class = &fake_class;
+	list_add(&fake_comp2.class_list, &fake_class.components);
+	fake_vmsc1.comp = &fake_comp1;
+	list_add(&fake_vmsc1.comp_list, &fake_comp1.vmsc);
+	fake_vmsc2.comp = &fake_comp2;
+	list_add(&fake_vmsc2.comp_list, &fake_comp2.vmsc);
+	fake_ris1.vmsc = &fake_vmsc1;
+	list_add(&fake_ris1.vmsc_list, &fake_vmsc1.ris);
+	fake_ris2.vmsc = &fake_vmsc2;
+	list_add(&fake_ris2.vmsc_list, &fake_vmsc2.ris);
+
+	mpam_set_feature(mpam_feat_cpor_part, &fake_ris1.props);
+	mpam_set_feature(mpam_feat_cmax_cmin, &fake_ris2.props);
+	fake_ris1.props.cpbm_wd = 4;
+	fake_ris2.props.cmax_wd = 4;
+
+	mpam_enable_merge_features(&fake_classes_list);
+
+	/*
+	 * Multiple components can't control the same resource, mismatched features can
+	 * not be supported.
+	 */
+	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_cpor_part, &fake_class.props));
+	KUNIT_EXPECT_FALSE(test, mpam_has_feature(mpam_feat_cmax_cmin, &fake_class.props));
+	KUNIT_EXPECT_EQ(test, fake_class.props.cpbm_wd, 0);
+	KUNIT_EXPECT_EQ(test, fake_class.props.cmax_wd, 0);
+
+	mutex_unlock(&mpam_list_lock);
+}
+
 static void test_mpam_reset_msc_bitmap(struct kunit *test)
 {
 	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
@@ -58,6 +376,8 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
 
 static struct kunit_case mpam_devices_test_cases[] = {
 	KUNIT_CASE(test_mpam_reset_msc_bitmap),
+	KUNIT_CASE(test_mpam_enable_merge_features),
+	KUNIT_CASE(test__props_mismatch),
 	{}
 };
 
-- 
2.39.5


