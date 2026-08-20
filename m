Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA344C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VymUjEFFuZwx8Mw+2oh66HUPpcAuTPuFK1o0l/JLBgY=; b=SwD2fHVtU3NgchvXw/MVyTyqhn
	aXSs6cyB3P4e0VuTnRrbJO6iKmbvF1viKGmkrcmQZLMVSqqdN0vsolm5YxbThOneWh9sR97cwP317
	oSRMxYN6Gk5imxSPcqnT/pJ3IfL2CCObkTOreEPtdMQD6c4jJAOu/pnrp5IYOupOd/2B3L3P75iYe
	zabTZUB5CLkh2R+7bhGLAHR+6zjcKt5qfzId/5gL8Ck4XEEa9rXYk3oYaeKTWMHcUB/yAOg1zOSTl
	jzn25jRTIy7AIt7rtdrJKogSk/9doK9kbZyifHkFy+6oBGT7tX806SG7x0xKB/Atr2qsKOnI1mjdT
	N+Ms8MFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4mV-0000000Boh1-07Z6;
	Thu, 20 Aug 2026 15:34:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4mT-0000000Bof6-058j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:34:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32501691;
	Thu, 20 Aug 2026 08:34:06 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 049683F763;
	Thu, 20 Aug 2026 08:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240050; bh=CvlsiaC9CEj3pqCNXtrP9ggl485N6tB8uCE1Z39SSLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Um62joE45H0VQ9/7gE3OxZ939G0p3RxMOG9cGPNx0c0qP3jmYB0NCT9QRGyAPaF3E
	 wgkyOnEYxEMu8Q2xTVVZqmxxe6T8aJhhYGu1VaPN+B06kgJjcm4+ObFbabuPo0CPK1
	 wc2/vvWCjJqzcnrzuaUw2ab7F0b80Yrf1PYs5Uec=
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
Subject: [PATCH 1/4] selftest/arm64: Print TAP header
Date: Thu, 20 Aug 2026 16:33:23 +0100
Message-ID: <20260820153331.2448875-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820153331.2448875-1-usama.anjum@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_083413_102181_86589FE7 
X-CRM114-Status: UNSURE (   9.23  )
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

The test sets a TAP plan and emits a result but does not print the TAP
version header. Direct execution therefore starts with:

  1..1

instead of "TAP version 13", leaving the output malformed for TAP
consumers.

Print the kselftest header before the plan, matching the other arm64 MTE
tests.

Fixes: 29f080881601 ("kselftest/arm64: check GCR_EL1 after context switch")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
index 325bca0de0f6e..d23f154d3288c 100644
--- a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
+++ b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
@@ -131,6 +131,7 @@ int main(int argc, char *argv[])
 	if (err)
 		return err;
 
+	ksft_print_header();
 	ksft_set_plan(1);
 
 	evaluate_test(mte_gcr_fork_test(),
-- 
2.47.3


