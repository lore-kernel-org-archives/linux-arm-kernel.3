Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D6BFCC056
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 18:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNNR5W9/Jz+AmdMDmY0R9zV4NDU9ad10eTt2f6rjOc4=; b=Cf32lYXTTFnRk+v8MowMpkyVPs
	HCBXrIQJFeatxiuJKzFSWLi1LS8NCjaR4m9sdxEYfDd51Gi9ME9uzq2YlW7Oy+gGItQFOA16GnkhY
	LDkpiifASQ5HfF46Q4O1IsEQGsmiDt7+PW1q0mKU9kTzgbtEzASWFP4t1I9ww1FLgh6YFc+ho0t5E
	uN96YT8VHRsnXP46TZLTc2gEcx8McjEtiRSbmlL8dIAS8qU7LgyNDeIAHhltvedGRMc2NSH4goRoJ
	K66NH+vR2/9tCdp+EdTjcP3ApWDCT+5j7+Gvtz/8i+oamDgDSDFyhPUcZI4Luye7AztSanRhoTvQC
	+TaZ3gRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZtj-00000004K1n-3Adv;
	Fri, 06 Mar 2026 18:27:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZth-00000004K0I-0aoO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 18:27:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 867841516;
	Fri,  6 Mar 2026 10:27:29 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9FA83F7BD;
	Fri,  6 Mar 2026 10:27:34 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Ben Horgan <ben.horgan@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 2/3] arm_mpam: Disable preemption when making accesses to fake MSC in kunit test
Date: Fri,  6 Mar 2026 18:27:17 +0000
Message-ID: <20260306182718.150569-3-james.morse@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306182718.150569-1-james.morse@arm.com>
References: <20260306182718.150569-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_102737_226312_3D94CDED 
X-CRM114-Status: GOOD (  11.18  )
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

Accesses to MSC must be made from a cpu that is affine to that MSC and the
driver checks this in __mpam_write_reg() using smp_processor_id(). A fake
in-memory MSC is used for testing. When using that, it doesn't matter which
cpu we access it from but calling smp_processor_id() from a preemptible
context gives warnings when running with CONFIG_DEBUG_PREEMPT.

Add a test helper that wraps mpam_reset_msc_bitmap() with preemption
disabled to ensure all (fake) MSC accesses are made with preemption
disabled.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/test_mpam_devices.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
index 3e8d564a0c64..75bd41bcc395 100644
--- a/drivers/resctrl/test_mpam_devices.c
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -322,6 +322,14 @@ static void test_mpam_enable_merge_features(struct kunit *test)
 	mutex_unlock(&mpam_list_lock);
 }
 
+static void __test_mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
+{
+	/* Avoid warnings when running with CONFIG_DEBUG_PREEMPT */
+	guard(preempt)();
+
+	mpam_reset_msc_bitmap(msc, reg, wd);
+}
+
 static void test_mpam_reset_msc_bitmap(struct kunit *test)
 {
 	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
@@ -341,31 +349,31 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
 
 	test_result = (u32 *)(buf + MPAMCFG_CPBM);
 
-	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
+	__test_mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
 	KUNIT_EXPECT_EQ(test, test_result[0], 0);
 	KUNIT_EXPECT_EQ(test, test_result[1], 0);
 	test_result[0] = 0;
 	test_result[1] = 0;
 
-	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 1);
+	__test_mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 1);
 	KUNIT_EXPECT_EQ(test, test_result[0], 1);
 	KUNIT_EXPECT_EQ(test, test_result[1], 0);
 	test_result[0] = 0;
 	test_result[1] = 0;
 
-	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 16);
+	__test_mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 16);
 	KUNIT_EXPECT_EQ(test, test_result[0], 0xffff);
 	KUNIT_EXPECT_EQ(test, test_result[1], 0);
 	test_result[0] = 0;
 	test_result[1] = 0;
 
-	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 32);
+	__test_mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 32);
 	KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
 	KUNIT_EXPECT_EQ(test, test_result[1], 0);
 	test_result[0] = 0;
 	test_result[1] = 0;
 
-	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 33);
+	__test_mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 33);
 	KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
 	KUNIT_EXPECT_EQ(test, test_result[1], 1);
 	test_result[0] = 0;
-- 
2.51.0


