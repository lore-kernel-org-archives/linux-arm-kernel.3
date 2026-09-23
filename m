Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC28C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSqztCcECESUkqvZpzq1siSkYDE7+KUwAFIzzdqJRNk=; b=YPbAFAOfxkpzxPo7zawQNeXLyF
	fM5bH/d64zAhzaMGZAi978mL5SP3RVx36Y5Uff7iHYf7YOSpvyYukKDlkJWaT4B6EdH9ToyeJIW7L
	ciW4cLX3FQ3OqtOG6/lm9zBhdo79As8VFP0WksBSWiGlKH0LSlEW3NPKnd0geAhhBE7SkizJ9ekqA
	7ht9/oQc9Ay+3vSlj1WkkZ1optFFP4Pq7L3TgVOgr82rQMjljbWujB5d/4oFUpZJqY3VHGWGo1VVR
	78BWMgWzvqN5PSVvIyvQmZYC0uEyQq6RriSn/hzvrA1AIvJeFdrutgm/9Mvk5ne+dvShYqjU1rAMv
	rJAocy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oo2-00000008iD8-2ErW;
	Wed, 23 Sep 2026 15:22:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OnR-00000008hpJ-1kV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B0FD1CE0;
	Wed, 23 Sep 2026 08:22:05 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FE953F86F;
	Wed, 23 Sep 2026 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176928; bh=sDZ3zCmdsg/NDDnz3ZYjdtSiVUMhALulqSJXMlTIm4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lo/9NyxKyHnGlMV3zrAqgx2HIQcW8WAKeqNcS3QPYlRNALJ5SC7hfrg8NDvGn2sle
	 mFYzLSScIAjANPdgcjaCSeTonMNB3NsFTDk2kSWHmCJng98fWbjesJOuy0jfFcfcdx
	 5aAe/3lPNnWQQlP4JksM1gK7iEutmDNF4DVKlZ/Y=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:45 +0100
Subject: [PATCH v2 05/14] perf cs-etm: Use the recorded instruction size
 for A32 and A64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-5-6ab8c07a5455@arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=1132;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sDZ3zCmdsg/NDDnz3ZYjdtSiVUMhALulqSJXMlTIm4k=;
 b=aXxBtmOiw7igZ8rNNHw3nOoekoZ794ac+lyLnnnKlVfrKJwvH3th/RqpxkBY1MLhOgPY3npEe
 pU6YBbVUmJ6Bb43A1u2myH1E8pUGLyJmTDmMyx6AHAprPbzTrYvpmX+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082209_509359_95E184FC 
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

Use packet->last_instr_size in cs_etm__instr_size() instead of a
hard-coded value, allowing the decoder to supply the instruction size.

Keep per-address decoding for T32. A range can mix 16-bit and 32-bit
instructions, so last_instr_size describes only the final instruction
and cannot determine the size at an arbitrary address in the range.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 2d1ab34f7b6b5a6331005c16c6a418d123c815eb..0163d93ac2d537a2190536e77d24628b4d707751 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1358,8 +1358,7 @@ static inline int cs_etm__instr_size(struct cs_etm_queue *etmq,
 	if (packet->isa == CS_ETM_ISA_T32)
 		return cs_etm__t32_instr_size(etmq, tidq, packet, addr);
 
-	/* Otherwise, 4-byte instruction size for A32/A64 */
-	return 4;
+	return packet->last_instr_size;
 }
 
 static inline u64 cs_etm__first_executed_instr(struct cs_etm_packet *packet)

-- 
2.34.1


