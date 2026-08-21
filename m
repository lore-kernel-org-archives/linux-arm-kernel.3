Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CB6C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+MjpK+xNhEozl1f0h7MVHC1jQP3C+2dr4CfbSjI9cU=; b=Ibhy+ww0T9NWFrrDoasqpfEeM5
	UulIcE5ehngBC5wfdSLMejVM45fjT/ljgyoQGrDZMz1vBvPtiR6p5tU13UbTOZqGeBsNsrUBg3sdB
	JfVrKTjXP7MtEEA5jXFimI2bKs6zaaCDPkDfp27Gg1VnA71ebu6VNnLh5CJ5MdMmirral18Q1cqMX
	YeVomDgCeiuXO2KQnA/oI8Lee3zFx/Ri3SR/0F4rr2BMfAndHJrsVfuKkg03BgcfBIDmydyTc7sfz
	BAmtqcgvF55uBHVP1nz16DithFxYOhDlSkg3kqEkXhNdIrxJrflmUo8GxHe9pMYytM/gbyNc5Arj7
	a30xkJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ2k-0000000DWdS-3p4h;
	Fri, 21 Aug 2026 14:16:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ2W-0000000DWUX-2P9T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:16:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C4E1153B;
	Fri, 21 Aug 2026 07:16:07 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA7AD3F85F;
	Fri, 21 Aug 2026 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321770; bh=P7OYcyFhp0FOazsEulZVO/ysmQGGewaznoTVnl08A+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZsXHl8o5s1wdXyMnL/7ixTPhIj6HJ2FLidCCW0srvfe6JG9F/Yk1W0ZcMQnH6i9k
	 F4w8IC2EsaauQW/Sl+gzq8JT4NNIXaF6rb9IR1IvP3SuN+KvKkmzf956rnNNsbUJK5
	 i0vSw0Ft/UiJ0aTj26Cdxge8VtDs0oZeBl3pUpsQ=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v2 4/5] selftests/arm64: Fix MTE prctl TAP plan
Date: Fri, 21 Aug 2026 15:15:52 +0100
Message-ID: <20260821141556.4065894-5-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821141556.4065894-1-usama.anjum@arm.com>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_071612_647768_C781BE4E 
X-CRM114-Status: GOOD (  11.38  )
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

The MTE prctl test emits one result from check_basic_read() followed by
one result for each of the seven entries in mte_modes[]. However, the TAP
plan only accounts for the array entries, producing:

  # Planned tests != run tests (7 != 8)

Include the basic read check in the plan so that all eight emitted results
are declared.

Reviewed-by: Mark Brown <broonie@kernel.org>
Fixes: 1f488fb91378 ("kselftest/arm64/mte: Add MTE_STORE_ONLY testcases")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Use the selftests/arm64 subject prefix.
---
 tools/testing/selftests/arm64/mte/check_prctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/mte/check_prctl.c b/tools/testing/selftests/arm64/mte/check_prctl.c
index f7f320defa7b9..d16a91117eef9 100644
--- a/tools/testing/selftests/arm64/mte/check_prctl.c
+++ b/tools/testing/selftests/arm64/mte/check_prctl.c
@@ -119,7 +119,7 @@ int main(void)
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(mte_modes));
+	ksft_set_plan(ARRAY_SIZE(mte_modes) + 1);
 
 	check_basic_read();
 	for (i = 0; i < ARRAY_SIZE(mte_modes); i++)
-- 
2.47.3


