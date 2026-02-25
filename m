Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE90FD377D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoLzcNTEKOIdh7EEsukWLJwARDuHwGO1ctmgWJifAAo=; b=AsDnJwmhC20z++i+sOD9KBvBKV
	Wl/1XLv05X9UZMamkCXvmKVZ6MxGvpe+gXIsWnGAw/J6HJ7yFvU8M3kAjaJEXjgDc8AA2NUGOk/70
	lc60UjmLAjXDOfm8TOCYB+3ykk78Vrovf7wdnH366VwB5vi9JfYFrc0rddcu/Ji4fuGRaYWKiUTT7
	nrGiALvjmruoC44eaZ4li8fyE+aK0SosrzLBYR6qWBrUksGtYJwE/uNtjkXAHvFXirxhzsFnvZ5by
	b07yHDYyB1nDDP/O0zDcb1WExu74hw3do9zFcscbnvN1ZwR6jy60DYp5nU0xY6g/4rzzRMXvHZAd3
	vyN/fxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvJbb-00000004jiN-0JDp;
	Wed, 25 Feb 2026 18:27:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvJbU-00000004jfr-2q9r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 18:27:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6425F15A1;
	Wed, 25 Feb 2026 10:27:13 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEB613F73B;
	Wed, 25 Feb 2026 10:27:16 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	yeoreum.yun@arm.com
Subject: [PATCH v14 2/8] KVM: arm64: expose FEAT_LSUI to guest
Date: Wed, 25 Feb 2026 18:27:02 +0000
Message-Id: <20260225182708.3225211-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225182708.3225211-1-yeoreum.yun@arm.com>
References: <20260225182708.3225211-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_102720_754670_73E6EBED 
X-CRM114-Status: UNSURE (   8.25  )
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

expose FEAT_LSUI to guest.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a7cd0badc20c..b43e2bec35db 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1805,7 +1805,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		break;
 	case SYS_ID_AA64ISAR3_EL1:
 		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_LSFE |
-			ID_AA64ISAR3_EL1_FAMINMAX;
+			ID_AA64ISAR3_EL1_FAMINMAX | ID_AA64ISAR3_EL1_LSUI;
 		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
@@ -3249,6 +3249,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 					ID_AA64ISAR2_EL1_GPA3)),
 	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
 				       ID_AA64ISAR3_EL1_LSFE |
+				       ID_AA64ISAR3_EL1_LSUI |
 				       ID_AA64ISAR3_EL1_FAMINMAX)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


