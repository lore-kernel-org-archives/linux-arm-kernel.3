Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F072C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrJ5AEpo7oKM8w6B20Ptt+fE9tEajhZE13PfY/sPg2E=; b=DBpfUoX93kyGEFK35Pu+QQxAGB
	zf/npWrNSGwsopYLG8W549mG3B9TSFM02ZRgwdk6eH0MOHObcvsZnubrm8K0jjOKl+Z5kRoKdQXRB
	jX3bViWIzbZWqQ+J6xUGhO2pCJ71YIibmh0bXQ/pYsCqrC6ZsbxCWIJ049wOmnI5taR+Nnbdm3BgR
	wTx2GhbF2y2B30MONm+NKQ3+y/oDmjNzrGUXf0MOHdGasy4X1HalwhYFNI3/sGG2PtOqOnSbLpQFW
	xsL80LSD9Xt0l86Uee9Wk/OiJU9LAE7WgXqlJdpiUTxQaIr+C6/RJYStefXxQuvTZHJhVIZniWHlJ
	sunKzS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlGM-0000000DPQa-18EG;
	Thu, 23 Jul 2026 04:42:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlGG-0000000DPMx-31z1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:42:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48BFF1595;
	Wed, 22 Jul 2026 21:42:14 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B0A03F86F;
	Wed, 22 Jul 2026 21:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784781738; bh=nffWLsifJcP9r6Va6IAMqAEd0WTA1E6cUxfRk4TithE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhGyeqwchikrIWFEERKDdPy49UbMPxdiJytjc9Y0/yfFyYj1474+tM9MoDGktj1OP
	 aNsyoab3XvyoGcTMlEG5OwTbx1YORuobj/q4WuufEWj+7GpoGvl932Xd2wdcmswDSc
	 7Qe1YAmEivbMdk2IhMWnzbwN83qne1d0mejf0h/4=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v4 6/6] arm64: cpufeature: Detect BBML3 based on ID_AA64MMFR2_EL1.BBM
Date: Thu, 23 Jul 2026 10:10:33 +0530
Message-ID: <20260723044034.2983651-7-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723044034.2983651-1-linu.cherian@arm.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214220_803517_21E4C04C 
X-CRM114-Status: GOOD (  11.55  )
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

Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
cpu_supports_bbml3() so that cpus with the feature would
not have to be added into MIDR based supports_bbml3_list.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 896bafdb00b1..dbd7d187520c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2133,6 +2133,12 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 
 bool cpu_supports_bbml3(void)
 {
+	u64 mmfr2;
+
+	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
+	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) >= ID_AA64MMFR2_EL1_BBM_3)
+		return true;
+
 	/* CPUs that support BBML3 but dont advertise through ID_AA64MMFR2_EL1 */
 	static const struct midr_range supports_bbml3_list[] = {
 		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
@@ -2154,15 +2160,10 @@ bool cpu_supports_bbml3(void)
 		{}
 	};
 
-	if (!is_midr_in_range_list(supports_bbml3_list))
-		return false;
-
-	/*
-	 * We currently ignore the ID_AA64MMFR2_EL1 register, and only care
-	 * about whether the MIDR check passes.
-	 */
+	if (is_midr_in_range_list(supports_bbml3_list))
+		return true;
 
-	return true;
+	return false;
 }
 
 static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
-- 
2.43.0


