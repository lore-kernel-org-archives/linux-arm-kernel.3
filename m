Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89952CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vBMk3PhG45+guUabEnkluWqRaJ2BLe+ZMWIzHxgO8k=; b=p8e0zjdjr5prCOzyZ7plC5uMFo
	IHWrgP4TYadvQnIWSMJTmWM24qvCd+WoaBePv7rDxJvP9ebcp3Jj9/DUSo5oIA7u++VQrOFnwTM4s
	0szVtFo/92osQClMfL+2ixNIBAwMULUp3KlVqsmMfx/S7/w7J0t2PChZUbnlJCAU8sheq9LytbjmR
	o/rHnk7rOH9Jcef8mPyjvt6o1CI64APKqgzxypyPfWiZKmuRX2qXvlYIYGP3lYw7ofFAnyhf6Q8e8
	5Y52LnfMmjnRTFoNj1rMdm4L3C2LSN8WIW1DSESXrofhAfOApdOaDIBMqdG0sVhivi/50jYHQK2Tw
	rJaCKFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c9t-0000000Fuih-0zAL;
	Tue, 14 Oct 2025 10:21:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c9r-0000000Fuh3-0eHz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:21:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9FCA1A9A;
	Tue, 14 Oct 2025 03:21:21 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC6C93F6A8;
	Tue, 14 Oct 2025 03:21:27 -0700 (PDT)
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
Subject: [PATCH 3/3] KVM: arm64: selftests: Consider all 7 possible levels of cache
Date: Tue, 14 Oct 2025 11:21:08 +0100
Message-ID: <20251014102108.2442391-4-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014102108.2442391-1-ben.horgan@arm.com>
References: <20251014102108.2442391-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_032131_232179_68E14191 
X-CRM114-Status: GOOD (  10.32  )
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

In test_clidr() if an empty cache level is not found then the TEST_ASSERT
will not fire. Fix this by considering all 7 possible levels when iterating
through the hierarchy. Found by inspection.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index a0b81b627037..731f8b23b1c5 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -678,7 +678,7 @@ static void test_clidr(struct kvm_vcpu *vcpu)
 	clidr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_CLIDR_EL1));
 
 	/* find the first empty level in the cache hierarchy */
-	for (level = 1; level < 7; level++) {
+	for (level = 1; level <= 7; level++) {
 		if (!CLIDR_CTYPE(clidr, level))
 			break;
 	}
-- 
2.43.0


