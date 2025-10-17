Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A081CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GHxuguXwRCKSru0uXicJ4DiSuAkx/togV3KxcZAkR0E=; b=B5O7RZ7pGCG3VDUEeK1OuPw3Tu
	zMR6pwXYKErHZZVVlz7tJYSzOTwURlguQjacU+s29R8+gRiJYVDA8S6r/SFmD0TIqEETk7MAIC0j6
	eTKJ48rE0Mb/gY8LNWhEldcAUNqWzEg8FadH4KQ/GSFZJEkGXHCMX2Kscf/E3DW0d2weHkkJeIj58
	sRwDLOqenKpiK7w21q83f/mxu3Qx6wfEJOPOHcDDrbMJAgNrt2sP2HHDgLBtaEaRkugrhriYmdeHQ
	0swbxq3sduLZbeBKiFGoRYoBZo6aPY0WmGeWkFm4LH0zDJseTKcKNJuuJgM3F6HrvQgapCjM3gmJV
	6KGr68Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjK-00000008KFJ-3PHA;
	Fri, 17 Oct 2025 15:50:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjJ-00000008KF2-3YwK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 15:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=GHxuguXwRCKSru0uXicJ4DiSuAkx/togV3KxcZAkR0E=; b=gEJjaT54IRhv+0tTrc1UhmvTZj
	+tSDKrXBTEsGTXxlbUJtiXIXW+7og9kxkNeMSaep+hcVbUNmczB3f6DL+OHOx8CywvxPJRC8P4Jnc
	E3ybQ6/Hucqp3lWcDGAP15SwE8+z4hxx3rd7OI0zA9cUoKQxXQhPYiJz7T/f6UpF60tfcBAr9iFp0
	PODwMZ04EkbMr+2AG6kWjiLsYfbh6MJYa1EKLMS31kUJXZlFDdtuok3gifepg5i1IsKZgBHAljXJn
	gUCtjpQu1rI0pcHSgh9i1w7hjZnS95PBRSnMq1QdAgDm5eRAebvPmFfkXdJMF2U/TDmhWaeVJVm5B
	W3Dhf27g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjG-00000007hdS-1OVa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:50:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D34881595;
	Fri, 17 Oct 2025 08:50:44 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D4D73F66E;
	Fri, 17 Oct 2025 08:50:51 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 16:50:43 +0100
Subject: [PATCH] perf arm_spe: Add CPU variants supporting common data
 source packet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_arm_spe_update_midr_list-v1-1-9de407550354@arm.com>
X-B4-Tracking: v=1; b=H4sIANJl8mgC/x3MUQqDMAwA0KtIvldoi27gVcYItYlbQF1JVATx7
 iv7fD/vBGMVNuibE5R3MfkuFeHWQP6k5c1OqBqij13w4eEK64hJZ7TCuBVKK+MspDiJrW64d23
 OMWVPBPUoyqMc///5uq4fIa8rF28AAAA=
X-Change-ID: 20251017-perf_arm_spe_update_midr_list-b654cc2ac0dd
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
 Ian Rogers <irogers@google.com>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760716251; l=2176;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6Wqhms50dYo+mpC/2gnjNhYq7LooLhisZkEyDlyLBSo=;
 b=NPVrX0ce/W+YK8PqJr32Ok0ttL+esGUjb+brOzCBnglsKQQAk1a0GOqCQ8l1EJODXLLiFGwrF
 pVNbdFrK5/XD6oxv6Eu5gSiPU4IPxqxuQS8vN6ayViCtHVHyK2HWPhH
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165054_660178_3CFF1F61 
X-CRM114-Status: UNSURE (   8.54  )
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
 tools/perf/util/arm-spe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 71be979f507718caadc091714c40bcee073c1d60..47e86699fe3378e44df4dd04a0aab8aa832142cc 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -570,15 +570,20 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 }
 
 static const struct midr_range common_ds_encoding_cpus[] = {
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
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
base-commit: f3b601f900902ab80902c44f820a8985384ac021
change-id: 20251017-perf_arm_spe_update_midr_list-b654cc2ac0dd

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


