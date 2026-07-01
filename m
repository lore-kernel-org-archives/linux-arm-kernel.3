Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40E7C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOcccNEuqiOAKrfbfOjPJ6nJ9DzWE6svMrHGtrWabI4=; b=zP2XB5isXL1Ir5oLfnZSpQtx9k
	NMh9iXEpDB0c+Ss7SG1/zKkC1vyLU5IlHvJIRC4YF/tWbaEmJqdLJxavx5mcPx0lVoVPtiWcG8sCW
	dCzDdlOfJruvRbzkJeQCtUH3FySule5y2yUB6bZt3JlNa+H7MIGcXDq2FMahw5116G3oEKerIXUPk
	i97zUDlItWpEjI4FqgCtNq7WTZhk0bGY4xXkdSCPiaZT3MTYRUz6wxI8ZtjJ5pOoHnXa0NjoydjB8
	5folwjZ3yVUx6LCrIXRCvxuGKb0wit2/tKOdBYyR5kWdlbNIMGmRppvSE3dt1pUlk62BpuLZnva8+
	+2/s9wbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werSa-00000001DCn-0NGt;
	Wed, 01 Jul 2026 09:42:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werSZ-00000001DBl-0Xou
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 09:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bOcccNEuqiOAKrfbfOjPJ6nJ9DzWE6svMrHGtrWabI4=; b=D+aH6kZiIpSsO5Aa5xd+dDdMD5
	O7gRiZkDo6A8BkNcTIx8UZoLM72SSLCeAm3LR6CXH+DfZ2vILDEojyuZkvDySN3gUXjxUlaAWdFIw
	T88hx2SEKnqMEhoLwbp2yhLkbnDcS5dJHDyMNlDVh0DYitSb1HbCYiF80E8ujkSkopePpjCZ2SFjx
	wGRdewo6XgkfwcBA9sgwcl86bHdjRX/rMAYUXYlT/M8/6/IfLWKTHbtM21BPyGqDrqwQ3GgPvOmU2
	vYOecnTsa6HgU46jmq+V3N5+IODyftG9L8eaJMgIy4KtK8WHAGXxpGERBLU95RYlfEpUYfTmxIbBz
	vhtl4F7Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1werSW-00000002ZqW-0nHV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 09:42:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C30C2309;
	Wed,  1 Jul 2026 02:42:14 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 656ED3F905;
	Wed,  1 Jul 2026 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782898938; bh=+oUbiNCNZ/2xiesnpJnMijMT5yQJfZOvlwLi93kNOFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A38mih5wBAlNsvdSuUo5elF56ywR9fyg1y9jRujmOWVbKi6ofrXXptkGDyFyiXjQl
	 hUNRbhX784SIfoFDP4Jmo+TvaPpgDokx5kYIwD/CkgraxDWx/uJ6jQyyRTofhuLSvU
	 ia1Hn4Tph/ViIKbWUWomlaqFuvQzfQCxKrppYZUY=
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
Subject: [PATCH 2/5] arm64: cpufeature: Detect BBML3 based on MMFR2 ID
Date: Wed,  1 Jul 2026 15:11:28 +0530
Message-ID: <20260701094131.677636-3-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701094131.677636-1-linu.cherian@arm.com>
References: <20260701094131.677636-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104220_444056_BBAEC924 
X-CRM114-Status: GOOD (  11.69  )
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

Add MMFR2 ID based BBML3 feature detection, so
that compliant cpus doesn't need to be added to the
midr list.

Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 14 +++++++-------
 arch/arm64/tools/sysreg        |  1 +
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9986eb7b379c..d754b1b7da77 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2133,6 +2133,7 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 
 bool cpu_supports_bbml3(void)
 {
+	u64 mmfr2;
 	/* CPUs that support BBML3 but dont advertise through MMFR2 ID */
 	static const struct midr_range supports_bbml3_list[] = {
 		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
@@ -2144,15 +2145,14 @@ bool cpu_supports_bbml3(void)
 		{}
 	};
 
-	if (!is_midr_in_range_list(supports_bbml3_list))
-		return false;
+	if (is_midr_in_range_list(supports_bbml3_list))
+		return true;
 
-	/*
-	 * We currently ignore the ID_AA64MMFR2_EL1 register, and only care
-	 * about whether the MIDR check passes.
-	 */
+	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
+	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) == ID_AA64MMFR2_EL1_BBM_3)
+		return true;
 
-	return true;
+	return false;
 }
 
 static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bc1788b1662b..082256ec3bf9 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2259,6 +2259,7 @@ UnsignedEnum	55:52	BBM
 	0b0000	0
 	0b0001	1
 	0b0010	2
+	0b0011	3
 EndEnum
 UnsignedEnum	51:48	TTL
 	0b0000	NI
-- 
2.43.0


