Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5921073C82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8E58EMSGwgcnIpwU4wemM0n3B4XE5FBPwXkbFCfhcU=; b=yWWqw35DYnfltYQYhT/k3UbknY
	6Y0kPcsm2pZT+AyPbm7h5/Tjn6gSBiMT44i1Wket7XVXE9D/ZrJaLbaeofefZj8Sb43OB5wQzZQNY
	Sie94ODcEBEUjWHYRXxGZWmHqHstP6AyhG/mnQIFufECdto7p4VurXeUrueUAWClWVOW8pdvdPU3T
	k5kq8X+1anHs5ugCN8gECYmIAY2pC0e7RahGYBucyF+lRPbtAHWtuPHK5NLebVBWJwoHNbNUlhkAR
	kfp73TO+yglgytpk7Oa3CZrNc3AuMkAZ4Q82fUPIFVj1MaSqWocuvFcbeMp3dQYJcQYNGbKEs3SGZ
	Lm0lCe8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPRk-00000008dLX-48df;
	Wed, 08 Apr 2026 09:43:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPRg-00000008dGu-2175
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:43:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C76DF3549;
	Wed,  8 Apr 2026 02:43:29 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F1053F641;
	Wed,  8 Apr 2026 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775641415; bh=cOjsCfTIlqHDLksAzetJn1AEXlTBDB/YvI4KzpW9jBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f/2KpYMHPLtzR73A1s06GOf1gVP/LZnSAcN8oQPJIhZ3JTAkFcNoaMzDChCXW6GZT
	 foVfu9zCDGNjbuke1fdDEI9kZG5P78vbQuMIoR1kB02ESY5rFa3yB0ShsQ9Qqlmahy
	 gGpx6P66NnaQTjOwROmCfJgXQltx7fXWSgXY3Vsc=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 08 Apr 2026 10:42:33 +0100
Subject: [PATCH v5 3/4] perf report: Update document for SIMD flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-perf_support_arm_spev1-3-v5-3-b5bcea6217bb@arm.com>
References: <20260408-perf_support_arm_spev1-3-v5-0-b5bcea6217bb@arm.com>
In-Reply-To: <20260408-perf_support_arm_spev1-3-v5-0-b5bcea6217bb@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775641408; l=1398;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=cOjsCfTIlqHDLksAzetJn1AEXlTBDB/YvI4KzpW9jBk=;
 b=brLZgWmpUQvomqATFNOk4OGKkkmVelJqZUQqI5i8ZIKx+LQ4eqZkIHb60vniheyxXzuUxJdj6
 tTgJA+p+cyhCeEpVAGs3vxh0IRpGdbjvYxLw95PV0lKM+dOTyzUu5hQ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_024336_568679_4538F041 
X-CRM114-Status: GOOD (  10.51  )
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


