Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D859AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnKnrrLM0lW49yKrMxDGfcC6kIFCPs2nu6ENeGpeinw=; b=hZLIWz4HVI3444OokBv8SLHON6
	8+0pBMR+tIoq6sriMjHgQowMy1kArO9TIeQB+ph2E/RgnG+D/h0S13zdzOR62CwDBXE81Nq2OKtTo
	EtiWsFAn8uWX0Rbft0BRe1kQKs8XiSJeTRiypkAccaq/QqL/T516rrdT0x2aQQaBSvYRbiDic/iyA
	h5TcIWsg2icO5oZ9Gd77ya7BliYgTWCi/P97FBE13x2p6Lp0Anbq4VY/d/SZBjvyOeNOJJBjRCX9h
	9l0ntqyhKCUhZBcZQtFI0ALqA8tjAT5km3soqWoxuzzunmVhry0Be/k/8g+7W5PYi8cPwSDgvq+4s
	3Wf7tYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVg-0000000HNYS-3A2f;
	Wed, 08 Jul 2026 14:44:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVd-0000000HNW5-40yh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:44:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E65751CDD;
	Wed,  8 Jul 2026 07:44:16 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69A4B3F7B4;
	Wed,  8 Jul 2026 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783521861; bh=tetLVoUTiMzTHiqb6qREc2LJ1mi75j3jXctvOdMJdmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PoAzkEB3AdCqEi5+xMMcjhDTGGcVJTJ88f25wbbAijdHAEvPVcQCCqbmQGoE7r7KZ
	 5KqeSSE+etfRspyybPtIP2DoDA4Lp1NCe+IMtDW+W+GoUsa+ezsDIDl/uWumxcutJY
	 q7Xnq3VKs74QjGSrSqqSiBIucuryN5C+maKSySWY=
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
Subject: [PATCH v2 6/6] arm64: cpufeature: Detect BBML3 based on MMFR2 ID
Date: Wed,  8 Jul 2026 20:13:31 +0530
Message-ID: <20260708144331.679816-7-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708144331.679816-1-linu.cherian@arm.com>
References: <20260708144331.679816-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_074422_043476_2BC13BAB 
X-CRM114-Status: GOOD (  11.40  )
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
 arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index e9ecaa036479..3f4a36f152d0 100644
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
@@ -2153,15 +2159,10 @@ bool cpu_supports_bbml3(void)
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


