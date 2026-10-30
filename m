Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E10D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uXqr4C60;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fzRdxyNe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1MLWFfUJ7F55h4sb4NUxEMLDS0WrEggl4s/5D7oHub4=; b=uXqr4C60R1Kpwk
	J3Ml1P/JIUasNBqR7tZZClrwG+rddz/7VtSxue0bd76Wg5TcmougMhLOc074MWFYXfDbnJSaanzUk
	SealgXSh1uKtZPmsS6+vTv8fsBJ0Nd8xOh6jPDFSoOp+jf6RXpWJnVrHrBAMeBSnXfI84ODSE/56l
	NXtttmZR99qQBuXrWvOP+xarR/SjPjndlBWQqTIdhgBEx7vUKopFkskMON5l0Kt0agwnm8BqwPKPa
	bucoNf7oJOMNhh/Y9tah7IjZyRIGcoY0Dxz0NJHlf2VCwelBzBZ8MHUo9Yf/0KA3BnsX0PKeCZFfy
	bHVgLurxu5eBJxgItDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIj-0000000BxZ9-1KxR;
	Fri, 30 Oct 2026 15:13:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIX-0000000BxRj-09iQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33D571682;
	Fri, 30 Oct 2026 08:13:36 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18A3D3F59E;
	Fri, 30 Oct 2026 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373219; bh=Ir98YJCZTEZmvWLsHi0UjK0B8K30meN/k+Jc00XpUqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fzRdxyNeV60QRhcFw8FZqGL5kGhC59QctJKcNU+GycnG/YEh6IpMA4JxqFGlmZXO6
	 BKyOAypX+Qp7dl+UoEOJW32ONwPxFI/8AhOpJJt88DVaywyv6YcH+YpHOeonovyPFW
	 smiAQq5bgS+r3VIg3P3bcPp54dZd4Kf/QV/gL9uE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:13 +0000
Subject: [PATCH v3 06/14] perf cs-etm: Mark branches that were not taken
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-6-7629b52ab047@arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=1932;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ir98YJCZTEZmvWLsHi0UjK0B8K30meN/k+Jc00XpUqU=;
 b=f+qzmd9pJ3zuO8A5Cr0MGhXVst6eEd4MCmRqaQL2S+bE5H88Sv1XYgqXMQvitbl89kd0R7sEz
 O3bkIRG7AdQAaskvhiTfTRhJYcUiRnzaDM8CDXuiJ8H7U4qVlTKvdgc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081341_164661_5CC22465 
X-CRM114-Status: GOOD (  12.58  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An exception can transfer execution to the kernel after any instruction.
When this creates a trace boundary, perf may attribute the trace-end
sample to the last instruction in the range. If that instruction is an
untaken branch, reporting only its branch type can make the transfer look
like a taken branch.

Set PERF_IP_FLAG_NOT_TAKEN for branch ranges when
last_instr_taken_branch is false. This records the decoded branch
outcome independently of exception entry.

For a discontinuity without an exception element, perf script previously
reported an untaken B.LS as:

  tr end  jcc             4000f8 => 0       b.ls #0x400118
  tr strt jmp                  0 => 4000fc

With the not-taken flag set:

  tr end  jcc/not_taken/  4000f8 => 0       b.ls #0x400118
  tr strt jmp                  0 => 4000fc

Here, 4000f8 remains the last traced instruction and 4000fc is the trace
restart address. These boundary samples do not establish an IRQ entry or
an exception return; the not_taken flag records only the branch outcome.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 9126f6327e98b67852b6a55980d67abb24de17fe..7cb9f69ead2b134b62653f133da7bdec23aaf280 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2457,6 +2457,11 @@ static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
 			packet->flags = PERF_IP_FLAG_BRANCH |
 					PERF_IP_FLAG_RETURN;
 
+		/* Report branch that is not taken */
+		if ((packet->flags & PERF_IP_FLAG_BRANCH) &&
+		    !packet->last_instr_taken_branch)
+			packet->flags |= PERF_IP_FLAG_NOT_TAKEN;
+
 		/*
 		 * Decoder might insert a discontinuity in the middle of
 		 * instruction packets, fixup prev_packet with flag

-- 
2.34.1


