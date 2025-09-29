Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976F4CCA474
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UV6sISLO4w8eGHUIdDrjvmSz9Ea/WUvFisToxeVjPY=; b=yrLxHYB3zpEh5ojoJKUEUI6nML
	y2oHSauDRcX8SiAsRrOdqktCD42kYY7tZBs+SMFEq9LlmvGx5OpEoBVgjMJWDszeEldwfbW4p+pte
	AR+ZJfhgXznKYC3Aq8FQETMRW1VKSX5GcqdgUJlk9caPdeOjUluBjqEXz88RL8AUtMTLtJp0vbOYd
	5QjsiAIMyKIK9AlYyulLj1ZwWgKF1XIql7Dvl7Y642hnbggpbluINb4uA8vc9izhWd93H6OO3TCWg
	BRlL3LjmJcgoP8UdDBq3cI43rxMNMoc97TPicyxnw9e9/uKX+5i11wPxJdugMk7sC4A/YnLGGsJC/
	UHNffdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gt9-00000002zTt-1JFc;
	Mon, 29 Sep 2025 16:38:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gt3-00000002zMV-3HWp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 621DE150C;
	Mon, 29 Sep 2025 09:37:57 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0767B3F66E;
	Mon, 29 Sep 2025 09:38:03 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:43 +0100
Subject: [PATCH 07/25] perf arm_spe: Remove unused operation types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-7-1150b3c83857@arm.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=1210;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=b0PllY8RWLZry/bueun+VAsGue4qV9iwUC/TXi6VS1k=;
 b=0em+aTqTnwCBc1YlmmYQ8zbm5lw/5m/wQJ7BFN+HQe/ZVerfp4CqaH5c6KFONambjtvrTwWQf
 SxhcZnO2qOqATimE4TRj9qB/nCpSfJ1cFM0Fxaygsq7CzyPqnpb2qZ9
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093805_871523_CFAD9ED0 
X-CRM114-Status: UNSURE (   9.11  )
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

Remove unused SVE operation types. These operations will be reintroduced
in subsequent refactoring, but with a different format.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index fbb57f8052371e51d562d9dd6098e97fc099461c..1259cbadfdc8098019afcd4cf65e733475310392 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -39,8 +39,6 @@ enum arm_spe_op_type {
 
 	/* Second level operation type for OTHER */
 	ARM_SPE_OP_SVE_OTHER		= 1 << 16,
-	ARM_SPE_OP_SVE_FP		= 1 << 17,
-	ARM_SPE_OP_SVE_PRED_OTHER	= 1 << 18,
 
 	/* Second level operation type for LDST */
 	ARM_SPE_OP_LD			= 1 << 16,
@@ -53,8 +51,6 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_UNSPEC_REG		= 1 << 23,
 	ARM_SPE_OP_NV_SYSREG		= 1 << 24,
 	ARM_SPE_OP_SVE_LDST		= 1 << 25,
-	ARM_SPE_OP_SVE_PRED_LDST	= 1 << 26,
-	ARM_SPE_OP_SVE_SG		= 1 << 27,
 
 	/* Second level operation type for BRANCH_ERET */
 	ARM_SPE_OP_BR_COND		= 1 << 16,

-- 
2.34.1


