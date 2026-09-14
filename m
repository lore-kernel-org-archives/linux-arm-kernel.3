Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583D3C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Sn21p4rT6NoUlG0MzRIgCQc2v7rkpn2MVo1FaJHdNY=; b=iJmkQiSGVmeKRaophj8QaTg/T5
	acRdpvkjJjCOHNO4RvrDM+FEkjA0W8WZhOe4VoTkFfnrjF7LxMVbsRCEaHy00qdUIecrXQ9iNVDyQ
	DDeDpQKumrNnXL5yBP5qcP+yq5Dp3QOW3vvfwfpC6008LE2VQdAH8M+cNLgwq3P58VPjjpMmrhrXI
	Bkbye9uRwlLIRaaVS9/XV5ssMJ5oZFof4b2gTexxk0JDoiwy1cyJqdBnmulkcmzN3fXw2ITX7MRPm
	diJNZn7rbmC0+MADPeFrlnQR7TWECuhoHWMXm6q3dLgvSHjYrfMJ/lc0ofS6qem1Dpbuh8XUIiaTC
	6YXH2YiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Gc-00000003fyX-15HJ;
	Mon, 14 Sep 2026 12:58:38 +0000
Received: from out-46.mta0.migadu.com ([2001:41d0:1004:224b::2e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66GZ-00000003fxz-3ETN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:58:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vVA+BcQVTE6b1DspVs3rDyX78CT3oRsosEdsCjY+fSM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789390712; v=1; x=1789995512;
 b=bMm8RZpyG5HUw2c0hDDsEwsGZp89eesx3rT4XUViMWRnGGz7GGJ9ihYTya34RMCfImzJ8GIp
 AmRSO2vYapdunMSFkNGnyw4L2sWKyhyZbdpD4N1NmYzYQGXbD0+6aC6hzXeNtvu0O9CDCSNAjmI
 wL/v0KyVzbZZoj8Jy2Ja7+m8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fe0470a03d8b6acf;
	Mon, 14 Sep 2026 12:58:32 +0000
X-Mizu-Trace-ID: fe0470a03d8b6acf
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: arm64: selftests: Check the mandatory SMCCC_ARCH_FEATURES queries
Date: Mon, 14 Sep 2026 13:58:27 +0100
Message-Id: <20260914125827.1645980-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260914125827.1645980-1-fuad.tabba@linux.dev>
References: <20260914125827.1645980-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_055835_955416_52940162 
X-CRM114-Status: GOOD (  15.10  )
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

tools/testing/selftests/kvm/arm64/hypercalls.c checks SMCCC_ARCH_FEATURES
with two expectations: hvc_info[] expects NOT_SUPPORTED with the
pseudo-firmware bitmaps cleared and something else with them set, and
false_hvc_info[] expects NOT_SUPPORTED for mismatched pairs. DEN0028H
7.3.6 mandates SUCCESS for arch_func_id SMCCC_VERSION and
SMCCC_ARCH_FEATURES itself, whatever the bitmaps hold, which neither
expectation allows.

Check those two in the feature-disabled and feature-enabled stages, so
the answer is asserted with the bitmaps cleared and again at their reset
values. They pass only with the preceding patch applied.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../testing/selftests/kvm/arm64/hypercalls.c  | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/hypercalls.c b/tools/testing/selftests/kvm/arm64/hypercalls.c
index 5d96cdf382c47..e74410cef0fe0 100644
--- a/tools/testing/selftests/kvm/arm64/hypercalls.c
+++ b/tools/testing/selftests/kvm/arm64/hypercalls.c
@@ -6,7 +6,8 @@
  * via the psuedo-firmware bitmap register. This includes the registers'
  * read/write behavior before and after the VM has started, and if the
  * hypercalls are properly masked or unmasked to the guest when disabled or
- * enabled from the KVM userspace, respectively.
+ * enabled from the KVM userspace, respectively. It also checks the two
+ * SMCCC_ARCH_FEATURES queries whose answer SMCCC pins to SUCCESS.
  */
 #include <errno.h>
 #include <linux/arm-smccc.h>
@@ -97,6 +98,12 @@ static const struct test_hvc_info false_hvc_info[] = {
 	TEST_HVC_INFO(ARM_SMCCC_HV_PV_TIME_FEATURES, ARM_SMCCC_TRNG_RND64),
 };
 
+/* SMCCC pins the answer to SUCCESS, whatever the bitmaps hold. */
+static const struct test_hvc_info always_hvc_info[] = {
+	TEST_HVC_INFO(ARM_SMCCC_ARCH_FEATURES_FUNC_ID, ARM_SMCCC_VERSION_FUNC_ID),
+	TEST_HVC_INFO(ARM_SMCCC_ARCH_FEATURES_FUNC_ID, ARM_SMCCC_ARCH_FEATURES_FUNC_ID),
+};
+
 static void guest_test_hvc(const struct test_hvc_info *hc_info)
 {
 	unsigned int i;
@@ -128,6 +135,23 @@ static void guest_test_hvc(const struct test_hvc_info *hc_info)
 	}
 }
 
+static void guest_test_always_hvc(void)
+{
+	struct arm_smccc_res res;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(always_hvc_info); i++) {
+		memset(&res, 0, sizeof(res));
+		do_smccc(always_hvc_info[i].func_id, always_hvc_info[i].arg1,
+			 0, 0, 0, 0, 0, 0, &res);
+
+		__GUEST_ASSERT(res.a0 == SMCCC_RET_SUCCESS,
+			       "a0 = 0x%lx, func_id = 0x%x, arg1 = 0x%lx, stage = %u",
+			       res.a0, always_hvc_info[i].func_id,
+			       always_hvc_info[i].arg1, stage);
+	}
+}
+
 static void guest_code(void)
 {
 	while (stage != TEST_STAGE_END) {
@@ -137,6 +161,7 @@ static void guest_code(void)
 		case TEST_STAGE_HVC_IFACE_FEAT_DISABLED:
 		case TEST_STAGE_HVC_IFACE_FEAT_ENABLED:
 			guest_test_hvc(hvc_info);
+			guest_test_always_hvc();
 			break;
 		case TEST_STAGE_HVC_IFACE_FALSE_INFO:
 			guest_test_hvc(false_hvc_info);
-- 
2.39.5


