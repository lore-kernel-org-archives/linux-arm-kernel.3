Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9771ECD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 05:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qx6+OLMFbnSQYitW1cxexulk1PLm158GJGyvwGiHq2o=; b=EWE//ulIc99lldGZs4EZp6O1TX
	LWjel5e7AcoO/iWYv7CIvU0tklaTfYQJvb3hCAGQD/pHSGrglvPKgu6hr5/4MrzWzRKa0ZJsvVo8a
	73zL5oWxcKr3EOIf8ukQVPxCb0ZGewMpGayqk7a7WRgodH9v1nuZiebPsWm6s7uYFiYicq3pcP8A3
	nnyF7sQE7YL1gQZDENFJFB0ns/ojQQsgOMdQ9R0/++mNMzp8dfzB4liA5J+PXfWqeZwWqpHBf+pov
	v7dEWDmjj0nNOvBXuwJ/Uj2KkTVGC2diVwv1u6eTB63+0ZbIMMsV1GLS5+eSGWianGpnICvLVOyG/
	19DOe1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSSqT-000000057TV-44fs;
	Thu, 28 May 2026 04:59:49 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSSqR-000000057T9-1ZhU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 04:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779944387; x=1811480387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VPHE8yc9++1Vdm0H0mvGHvExX7WWaEVR/unz16UcOc4=;
  b=J1APSYsO4W9BUC1McWF/DeA9GZrHrcap00bEIeakwET0tRMvywzpSwp/
   KxdxWCdbE9mRMi+iFlY0xQRaaEaEYJGnKM37yM5719OToxs3vaX/ZT+vT
   TiQ+5myPQ3J8YFKrePh0lkjOw4WznC09S0IqgXSDywrSk3xSCR+f/umtX
   1UcADQrrgCd7oBzbdxgCsTZK/pMj45OrqP0LpjE8uMBOkcOc/jN2ZK2jA
   0xuN5M03+uW8JH2lR7I1wtkEI17ThzUuswNZLB91HrM/7qx0Nai3jXLax
   RBMCohRaRCexu3h3NTdZz01JqOxrD67c9vaHMqQk0/uGv1umk2Ah7xORa
   w==;
X-CSE-ConnectionGUID: L45s6pHYQtGQNiQ/saDCSg==
X-CSE-MsgGUID: 9l/f57kuQdeWR4I3/HoNvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="242146208"
X-IronPort-AV: E=Sophos;i="6.24,172,1774278000"; 
   d="scan'208";a="242146208"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 13:59:43 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6FE491002B88
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 04:59:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 25AC5CD5EEF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 04:59:43 +0000 (UTC)
Received: from sm-arm-grace07.ssoft.mng.com (unknown [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9EBC7101E475;
	Thu, 28 May 2026 04:59:37 +0000 (UTC)
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: weilin.chang@arm.com
Cc: catalin.marinas@arm.com,
	itaru.kitayama@fujitsu.com,
	joey.gouly@arm.com,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	pbonzini@redhat.com,
	shuah@kernel.org,
	suzuki.poulose@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com
Subject: [PATCH] KVM: selftest: arm64: Run shadow_stage2 varying guest modes
Date: Thu, 28 May 2026 13:59:30 +0900
Message-ID: <20260528045930.450339-1-itaru.kitayama@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516183003.799058-6-weilin.chang@arm.com>
References: <20260516183003.799058-6-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_215947_974766_6F3ED92F 
X-CRM114-Status: GOOD (  10.22  )
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

Refactor main() to use for_each_guest_mode() helper to create
a single VCPU VM with a guest mode ID.

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
---
 tools/testing/selftests/kvm/arm64/shadow_stage2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/shadow_stage2.c b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
index 5bce55abdea7..05acca22eafe 100644
--- a/tools/testing/selftests/kvm/arm64/shadow_stage2.c
+++ b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
@@ -105,7 +105,7 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
-int main(void)
+int run_test(enum vm_guest_mode mode, void *unused)
 {
 	struct kvm_vcpu_init init;
 	struct kvm_vcpu *vcpu;
@@ -114,7 +114,8 @@ int main(void)
 	gpa_t gpa;
 
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
-	vm = vm_create(1);
+	vm = __vm_create(VM_SHAPE(mode), 1, 0);
+
 
 	kvm_get_default_vcpu_target(vm, &init);
 	init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
@@ -163,3 +164,7 @@ int main(void)
 	kvm_vm_free(vm);
 	return 0;
 }
+
+int main(void) {
+	for_each_guest_mode(run_test, NULL);
+}
-- 
2.43.0


