Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAC2CD5BC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DOHzn/9DAH/i+tolL3JrnlQVLcqlXrv14Zpc6GuuAyM=; b=uOx8jAxM2xApSazPRYHoEIW0CH
	wQjoI3x6u+TvbHR3ms3hHUIcHkekYjTLy9WotNXiruj8ZYSKcxxYAunOWQi+7diADiPXfR0BTD7Uj
	Yf+6zxgyva/faB/cSo7C2faP9/vToorgo/IvAUCUQlvRagEB6Q9CrGsNghkQocMyDOoM7UDuI6BrK
	/i8lfjQ2RUsG0Trpkx9hFZOl3i21NZh2kHQBjaDqOctYAm1lM0TMWlbc9tkuatjhu15iw5O+vma+I
	u5L+cSmBP/4VFuZErMjVvKhouj9VWD7IHNypgmysM+xCHzgHN/76ESD2dW2EFkCHDYZeiSEeZjFPN
	Vx0tueOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV1Y-0000000ALQc-0yKz;
	Thu, 13 Nov 2025 10:57:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV1W-0000000ALPl-0FQo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:57:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CBE112FC;
	Thu, 13 Nov 2025 02:57:43 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C34293F66E;
	Thu, 13 Nov 2025 02:57:49 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 13 Nov 2025 10:57:39 +0000
Subject: [PATCH v2] perf arm_spe: Add CPU variants supporting common data
 source packet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-perf_arm_spe_update_midr_list-v2-1-d547768f5520@arm.com>
X-B4-Tracking: v=1; b=H4sIAKK5FWkC/42NQQ6CMBBFr0JmbU1bqURX3MOQpraDTCK0mSLRE
 O5u5QQu38/L+ytkZMIM12oFxoUyxamAPlTgBzc9UFAoDFpqo6RqRELurePR5oT2lYKb0Y4U2D4
 pz+J+NrX32nkZApRGYuzpvfdvXeGhSJE/+92ifuu/5UUJJS4Ba9kYI0+mbot69HGEbtu2L5oAb
 pXIAAAA
X-Change-ID: 20251017-perf_arm_spe_update_midr_list-b654cc2ac0dd
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
 Ian Rogers <irogers@google.com>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763031469; l=2390;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=JEDHEeHplqXn7/z58T8cqTyw0I4jR/py96X9534o7VQ=;
 b=lMdTaX4c6NaFZSKte1Bs7+Lplifa78Kf/rBbmE3GUtVPqWzTzDxV3om6G1IHMWsMvUWe2MIIv
 kfBfJBqLs9uA3rQmeor7cXssSEjLfqvcEYAwyiKAZeU5WojCyXHTj9s
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_025754_223601_39B76C8D 
X-CRM114-Status: UNSURE (   9.32  )
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

Add the following CPU variants to the list for data source decoding:

  - Cortex-A715 [1]
  - Cortex-A78C [2]
  - Cortex-X1 [3]
  - Cortex-X4 [4]
  - Neoverse V3 [5]

[1] https://developer.arm.com/documentation/101590/0103/Statistical-Profiling-Extension-Support/Statistical-Profiling-Extension-data-source-packet
[2] https://developer.arm.com/documentation/102226/0002/Debug-descriptions/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
[3] https://developer.arm.com/documentation/101433/0102/Debug-descriptions/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
[4] https://developer.arm.com/documentation/102484/0003/Statistical-Profiling-Extension-support/Statistical-Profiling-Extension-data-source-packet
[5] https://developer.arm.com/documentation/107734/0002/Statistical-Profiling-Extension-support/Statistical-Profiling-Extension-data-source-packet

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Rebased on latest perf-tools-next branch.
- Link to v1: https://lore.kernel.org/r/20251017-perf_arm_spe_update_midr_list-v1-1-9de407550354@arm.com
---
 tools/perf/util/arm-spe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 614ce032f87e46d1f3754258f51bb1693ec128b7..f5bcc84eaa271f4dcc70bb585e517657e523de11 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -570,16 +570,21 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 }
 
 static const struct midr_range common_ds_encoding_cpus[] = {
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_X4),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X925),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
 	{},
 };
 

---
base-commit: da8fcfba0854dbe0b0eca465d35620c9cf4c89c1
change-id: 20251017-perf_arm_spe_update_midr_list-b654cc2ac0dd

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


