Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8C0E99050
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8E58EMSGwgcnIpwU4wemM0n3B4XE5FBPwXkbFCfhcU=; b=LpY1ccm0Sx9jBLbjSXNINJ0wBi
	TzZy8Wo+Af6RfzJe3pS15IuIZfE/XMW8/ZRXj0jQ4vy8KkD5lc+HPBs/Q8L6kqQjpq5Rt1wgSEmzb
	B3QjcE2jPC9BgUtIU+M/Zhk3f2ZlVeMvbgM6inEnM1l+yAHO5bqynWleVNsYRgNCBIrgUQt1W5Ntb
	ut2I6BfDb1ZwpG2D+18VKenBDJDOQ2FEcxpCbGZ0oYxHWdoQ4dDuBRgCd3+CyhuRPqGm+f8PI82uE
	mgZ4kE3AhwNGb4dDJ7xwWcZ9N/YZsngxq+ClAjK2uRajegxmb3dPdXVhlq1sxb+8e0fYQU/fe5+QI
	6v10HZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6QZ-0000000BkFF-1BLr;
	Fri, 10 Apr 2026 07:37:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6QU-0000000BkBa-0NCr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:37:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABBAD2008;
	Fri, 10 Apr 2026 00:37:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E21743FAF5;
	Fri, 10 Apr 2026 00:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775806632; bh=cOjsCfTIlqHDLksAzetJn1AEXlTBDB/YvI4KzpW9jBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SU8JzM1KuaKW28CDLX3pbekN3ZRdRb+ZqSzUZzdAmQVmRwNBQ5NVEqQSe4I/Icdfx
	 JOYWTAECwIOJsjmbUy+ur/pNBiMKLcvwSpEORxjz3Ime6SPl598LljG0OH5TlhBi3V
	 S/6D0geiEjiDv9qZicuik4c0hjAyMfZeWXBByXaA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 10 Apr 2026 08:37:00 +0100
Subject: [PATCH v6 3/4] perf report: Update document for SIMD flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-perf_support_arm_spev1-3-v6-3-3c6f2dfe2cd3@arm.com>
References: <20260410-perf_support_arm_spev1-3-v6-0-3c6f2dfe2cd3@arm.com>
In-Reply-To: <20260410-perf_support_arm_spev1-3-v6-0-3c6f2dfe2cd3@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806625; l=1398;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=cOjsCfTIlqHDLksAzetJn1AEXlTBDB/YvI4KzpW9jBk=;
 b=EyBDyzU2HoPN2Cq+viFTjtt2uQ9zvOK4C+W0J+zduJwZ6pAEQqTOKpFrz7VzOu2AkegMAvYXe
 WuCmgNGYdR4BEZWpd9lfI3cCPgs4V+1zrULYcnlmxL31OKsa/pUoPCJ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_003714_166011_330EEBCD 
X-CRM114-Status: GOOD (  10.69  )
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

Update SIMD architecture and predicate flags.

Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/Documentation/perf-report.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Documentation/perf-report.txt b/tools/perf/Documentation/perf-report.txt
index 52f316628e43ac9851ecaa85f706e22c26294649..22f87eaa3279653836eaaa07a358c14f2e0afa75 100644
--- a/tools/perf/Documentation/perf-report.txt
+++ b/tools/perf/Documentation/perf-report.txt
@@ -136,7 +136,10 @@ OPTIONS
 	- addr: (Full) virtual address of the sampled instruction
 	- retire_lat: On X86, this reports pipeline stall of this instruction compared
 	  to the previous instruction in cycles. And currently supported only on X86
-	- simd: Flags describing a SIMD operation. "e" for empty Arm SVE predicate. "p" for partial Arm SVE predicate
+	- simd: Flags describing a SIMD operation. The architecture type can be Arm's
+	  ASE (Advanced SIMD extension), SVE, SME. It provides an extra tag for
+	  predicate: "e" for empty predicate, "p" for partial predicate, "d" for
+	  predicate disabled, and "f" for full predicate.
 	- type: Data type of sample memory access.
 	- typeoff: Offset in the data type of sample memory access.
 	- symoff: Offset in the symbol.

-- 
2.34.1


