Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A04C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fm7nTT4KMovCb4jSQoKVSqVdeJkQcXUeH2CcGeqOIo=; b=DaIAk4FiIylr+mOkxv85hR/r+d
	cMLSqLE/iXpskwkVrBgG22Lm4PNVJK4X5IH96FXRXh82pZlAkhB8/yTa+XeWNkf9AnB7UL0fJ4H3s
	BM1FT6s+22JSE0F7X5D0oAH4ydKN/Nom8QXCYX0MZZKQg8Py2d0fLuRA9UnKLgxLSJ2JD2VRWl5iP
	7k8GjiL3Lmrd/ektKF1vt2FOslWB7xBGfc038zy+gmRb3WXlG49VyNdpnGSQ05Glj4rPv+W5rwodz
	KMFDbOzBLFzvBaxKSsZvBKH7hebDAP7EBZWotVp43r/7+2MLvgI94MLj4e2vA7jHKC5zxhtwx8RhD
	8Ted3sQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsGr-0000000DoRh-0w0F;
	Wed, 15 Jul 2026 05:35:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsGj-0000000DoKj-271Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:34:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B109339;
	Tue, 14 Jul 2026 22:34:48 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 470B03F915;
	Tue, 14 Jul 2026 22:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784093692; bh=xvWUwM25jkFsnNcI43QGqVVl3Rwv1/DjKc78I+lBWqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G6wCkvGskLePoHKA/n5nuizoDjgIdhGsDiSi3elStoMYQC4zdex8jP1EUeY+hP31m
	 rsG3ez2hhDTlfLx2R3dkI5F0z8/ftZMguLrkAmRQuXKzhjTE9hyjVEvv61G5jRtSc4
	 qCo7QfHply7l6I7LieH2S16Taxc2vrr3MgB6COVo=
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
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v3 6/6] arm64: cpufeature: Detect BBML3 based on ID_AA64MMFR2_EL1.BBM
Date: Wed, 15 Jul 2026 11:04:08 +0530
Message-ID: <20260715053408.1950475-7-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715053408.1950475-1-linu.cherian@arm.com>
References: <20260715053408.1950475-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_223453_583433_9D7B0CBB 
X-CRM114-Status: GOOD (  11.76  )
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

Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 25a705e02618..b58fdcb35406 100644
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
 	/* CPUs that support BBML3 but dont advertise through MMFR2 ID */
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


