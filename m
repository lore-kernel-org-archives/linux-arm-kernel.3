Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A31C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+MjpK+xNhEozl1f0h7MVHC1jQP3C+2dr4CfbSjI9cU=; b=cOfrU22aAkSC22GRhAG2I8gKWI
	EamriyyW2AqOchGNOpijxLFUeBmnFgiD/RSgl/qJFS2APkPwu8hPSV7zl2SVFmuX7tSEmiKeSdork
	oXN7jLG85I3njxsr4rdzjPANg3PYtnGxSrr7e3aKa9pNUhNIAONrSxSgaKV5oIi1H0xqdE6+UpjvS
	HJfaBEIM/hd/jIhmopUa/ammAokA1vXoI7dOqyxt+26Cl0Rx6OVmLyOkXJx/+rv0xsxfyxi4AEcyl
	F6DNywiNyiEwB1BiSPDKCA9cNlISUHaJrvtKjN702OLuFKNMVUO+2tSmv83VxPE2osSAOFWLuzK4R
	gjpUiZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypC1-00000000fxq-3Aae;
	Tue, 25 Aug 2026 11:19:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypBr-00000000fss-372m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:19:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB0981688;
	Tue, 25 Aug 2026 04:19:34 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1B833F66F;
	Tue, 25 Aug 2026 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656778; bh=P7OYcyFhp0FOazsEulZVO/ysmQGGewaznoTVnl08A+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cFk9WPLVQgepJwAoS50dyvTqjKvWQiFi55eaaR6zTPVlI8V/Lh4Ldg56lFMWfRLkn
	 ZxjkIJVwAUzr/+sNcCnKBZs+7mkSvkwO/uvNhgE+JvAZWEFpaziXN17YcwHSeMkCgY
	 cZ1gtZ8ngBJmGh2jyApTbLz1vJOxQ5An52wYq4Wk=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 3/4] selftests/arm64: Fix MTE prctl TAP plan
Date: Tue, 25 Aug 2026 12:18:36 +0100
Message-ID: <20260825111929.2882324-4-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_041939_816590_1509BE6B 
X-CRM114-Status: GOOD (  11.54  )
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


