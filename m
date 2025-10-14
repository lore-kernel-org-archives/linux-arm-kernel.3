Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BC7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ffi0kDsUGDn0YlBrnDHPA7Pmvk4QN6zGjVxles4PQXo=; b=pFot7yj85v91bdeNLLN2+GhlT4
	LjJwQkjd90jqW7y+gy1CwmqjzKLncul7rNSSqwCQgf6WiT95iP1PCreKuZUD0aCT1cHoJ79y4zQCS
	nnHgCGnRLJLGJ5oJ31kqsUxD2AvjALTFsGLkpsXv6MsipMsfCoH8ta+zUb9ROIa6P0qCOpMG+8gag
	zNHzXDkGyr60Lep9Gi8nbAFjhNB3QCBYSnXma0DVFv3CHuc+z81PQtt56H8VECGwtSSGJ5xkJBmMy
	y+u0xa/HK4HISmmvDOUSgm2sZ/D5kJAdPvhg+xF40tiDZDq3d7fn+U9PDn9yq6GXUjVqX37wm8+pA
	ebCnfCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c9j-0000000FudE-2dyi;
	Tue, 14 Oct 2025 10:21:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c9h-0000000FucM-29HD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:21:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BAF81A9A;
	Tue, 14 Oct 2025 03:21:13 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D7F83F6A8;
	Tue, 14 Oct 2025 03:21:19 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	shuah@kernel.org
Cc: Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 1/3] KVM: arm64: selftests: Count test_guest_reg_read() as a test
Date: Tue, 14 Oct 2025 11:21:06 +0100
Message-ID: <20251014102108.2442391-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014102108.2442391-1-ben.horgan@arm.com>
References: <20251014102108.2442391-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_032121_587094_871DD69C 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

The test test_guest_reg_read() is run without announcing its presence or
contributing to the test count. Rectify this.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 5e24f77868b5..6878ee23310e 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -655,6 +655,8 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
 			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
 		}
 	}
+
+	ksft_test_result_pass("%s\n", __func__);
 }
 
 /* Politely lifted from arch/arm64/include/asm/cache.h */
@@ -786,7 +788,7 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
+	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;
-- 
2.43.0


