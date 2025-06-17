Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E89C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v15/g1x4c/2ZZw8td8Ey+AMbBpLgIhmxTwVDweDpF5k=; b=H0cM8k2M/v+XHeI3M5tKiiLyVv
	ubDp3RvriQ7Lltun9+E/JdkbOWuUl9RV2OdZcPe4TU+9XuWGRtq5oY34xcjBth7o+EgT+kPBUmEPB
	V06myQ/qRK1abSjx69dnY7G1jMaDFT4bPiaFnwWkkkBkfJFRLvmzQDH3Nm60FY7FQrtTI0YoioqSC
	eXldNmedbYFQNplypi1oGx7SpsrizILb2lVN8ZD1Mzlw5+sJJVcjqSxIotI44vPgIUWncXty8pkqs
	+xIOQ45dVDYBJTumsafHO4vNvjRSGHeJRjBFkdMhK5aJQkC3gyK1FS9cGyt+5YRUs0MdmYh3u8AMi
	H2f8hZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbHP-00000008Aa5-16ZR;
	Tue, 17 Jun 2025 18:43:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbAr-000000089cB-0066
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 18:36:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 197DD1A32;
	Tue, 17 Jun 2025 11:36:22 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 26E4B3F58B;
	Tue, 17 Jun 2025 11:36:41 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 2/7] arm64/kvm: expose FEAT_LSUI to guest
Date: Tue, 17 Jun 2025 19:36:30 +0100
Message-Id: <20250617183635.1266015-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617183635.1266015-1-yeoreum.yun@arm.com>
References: <20250617183635.1266015-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_113645_076889_59F424A0 
X-CRM114-Status: UNSURE (   8.79  )
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
---
 arch/arm64/kvm/sys_regs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..5c5a9c3ace2f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1636,7 +1636,8 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 			val &= ~ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_WFxT);
 		break;
 	case SYS_ID_AA64ISAR3_EL1:
-		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
+		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX |
+		       ID_AA64ISAR3_EL1_LSUI;
 		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
@@ -2921,7 +2922,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
 	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
-				       ID_AA64ISAR3_EL1_FAMINMAX)),
+				       ID_AA64ISAR3_EL1_FAMINMAX | ID_AA64ISAR3_EL1_LSUI)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),
 	ID_UNALLOCATED(6,6),
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


