Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E0AC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3NRItpj0nUOy3LytGBZhuumw92o8wwWdCrn/ZFcfo4=; b=1JhixXqVc3wHGXwRS6IFy3LyFM
	BL5y5oGEQcMMjdpc4CBHFyjiy97vvt9aKmEx/QPC1BEjQ8C+Z8++uLthND2yMwpxj3Hsy9qIXQsKD
	4jFoR+2Hqi6Fyf0L+122VYXodJBOMVz9ulKMWXiDrMO3u9RhYc1qjWkqNnw7WEHWMoioOeiXegCIB
	X8hQTrGLxhzW04l1eKPvgO4Ax2JVr503GtDsztH2FyWH+/ACG0x225JDI0DX2CJSo++PncxJBGpH1
	Q7yb9nhvjVOv4PkCvDuhr9uxq4iH6ka7q0zTsXB5ERYKrYzFN/XtCjO0g7lDKC7hqkKByrdrp0B5g
	68e1+yRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ2V-0000000DWTT-2A9p;
	Fri, 21 Aug 2026 14:16:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ2N-0000000DWQf-4APk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:16:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92F722C8;
	Fri, 21 Aug 2026 07:15:59 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D6EE3F85F;
	Fri, 21 Aug 2026 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321763; bh=GkgEk4wxjMWjKEYIzr+cfZNkqDaG360hz+dtvjwvXSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1vFUYxhNizbO0Ief3w0B/1HpfE0vGXsMMmU8mcpFtaSACD7vU+7JBBLOcNQwFi1v
	 iQItNHweUyu5fTGH1wXyzpzyuYc+oDxtas9l1EKVFUSv5vMHk5yQzadcjIoFxUMyQ/
	 7/IgeY0vNePWaH4IwO1SM0/mtPvzdrAd6nmBX01Y=
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
Subject: [PATCH v2 1/5] selftests/arm64: Print TAP header
Date: Fri, 21 Aug 2026 15:15:49 +0100
Message-ID: <20260821141556.4065894-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821141556.4065894-1-usama.anjum@arm.com>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_071604_070691_54FCD1AB 
X-CRM114-Status: UNSURE (   9.09  )
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

The GCR_EL1 context-switch test prints its TAP plan before forking 1,024
child processes. When stdout is fully buffered, the plan remains in the
stdio buffer. Each child inherits the pending "1..1" line and flushes its
copy from exit(), producing repeated plan lines.

ksft_print_header() enables line buffering before printing the TAP
header. Call it before the plan so the plan is flushed before the child
processes are forked.

Fixes: 29f080881601 ("kselftest/arm64: check GCR_EL1 after context switch")
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Explain how line buffering prevents duplicate plan lines.
- Use the selftests/arm64 subject prefix.
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


