Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4E4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DddIAx3dQJYkrsi5/J5AhJO+BlV0FG44gnmDzL0hMAQ=; b=GCpSR567D6MA5XiPGRBNUP1iyF
	x+Wj9ul2xRaicaQyBjnWg56/2IKqeP2qoJVS+b/RyNvyxxhZttnmR1eYIp2HlbrYziATEjRbWXb+2
	CAVmnwcQvpcMZU20Rqfp1mh/kovA2wqFdJA65mL4CNRUakgMjKfm4fhbbTTFNHMWEn4ReG37oHP6I
	NSfSGJRgfz+BpPyeRzI8vNUE2g6ESVYEVzxobRu5mXKhGyl9BtzLSvR449ws6stTAXrj6mfcjsvQN
	Zw46VBeQQfH0fkxhoT18kMfESLTPbHkKTs+evESLa1508VHRA/QiowMp6IV8IKvh1g/7Hu4vj6MSX
	AvEuCENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKxU-0000000AAEa-1OCr;
	Mon, 13 Jul 2026 18:00:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKxP-0000000AACo-0hHM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:00:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C316D1595;
	Mon, 13 Jul 2026 11:00:36 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73043F7D8;
	Mon, 13 Jul 2026 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783965641; bh=DQJqFZ/U3vJ2efvZuDUzj8k/llaRRz76jNOdtayJQDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vIG8dH3dZZdgsaXNcRQTd2biODr5v44c9cAOhvAxALnK++8idBV2ZjiOfGKtsZ4R7
	 wdHBSYYLIV0ufpghkdZ84nx8mV9M4IR6HwobSLAsYVh5mfR3EEpfdw15ckSLGnwiiv
	 VMSmsyBoEsDmEDwxuxHvTq/i5SjI3vFkkMCLgAJE=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 13 Jul 2026 19:00:27 +0100
Subject: [PATCH 1/2] perf cs-etm: Avoid bogus branch samples before async
 exceptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-perf_cs_etm_fix_non_taken-v1-1-4561607fc69f@arm.com>
References: <20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com>
In-Reply-To: <20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783965636; l=4148;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=DQJqFZ/U3vJ2efvZuDUzj8k/llaRRz76jNOdtayJQDQ=;
 b=Qv476C6AvXcauqu2fkvTDwGafujl2HVaDhyaw+qGl34ElQafYMC+XrSvk4YtBItFJbsCLExQW
 XiZz8ou6T+jCOQb/h7IMoXfol1ds3ueYCMEpBxoztT2u+fTuqAMqJz7
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_110043_290759_5931024B 
X-CRM114-Status: GOOD (  16.49  )
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

Consider the following code:

  00000000004000f4 <test_branch>:
  4000f4:       eb02003f        cmp     x1, x2
  4000f8:       54000109        b.ls    400118 <taken_path>

  00000000004000fc <fallthrough>:
  4000fc:       d282f2c2        mov     x2, #0x1796                     // #6038
  ...

  0000000000400118 <taken_path>:
  ...

When execution reaches 0x4000f8, the b.ls condition evaluates false, and
execution falls through to 0x4000fc. If an asynchronous exception (for
example, an interrupt) is taken before the next instruction executes,
cs_etm__exception() currently forces the previous range packet's
last_instr_taken_branch flag to true - in the case above, perf
incorrectly synthesizes a branch sample for the untaken branch, even
though execution actually falls through.

The trace log contains the following bogus branch sample at 0x4000f8:

 perf script --itrace=b -F comm,ip,insn,disasm,sym

 b_ls_not_taken_            400108 fallthrough insn: 61 ff ff 54                b.ne #0x4000f4
 b_ls_not_taken_            400108 fallthrough insn: 61 ff ff 54                b.ne #0x4000f4
 b_ls_not_taken_            4000f8 test_branch insn: 09 01 00 54                b.ls #0x400118
 b_ls_not_taken_  ffff800080010c80 vectors insn: 03 00 00 14            b #0xffff800080010c8c
 b_ls_not_taken_  ffff800080010ca4 vectors insn: 41 02 00 14            b #0xffff8000800115a8

The special fixup is only needed for SVC. For SVC exception entry,
cs_etm__set_sample_flags() has already identified the previous range as
a syscall branch, but last_instr_taken_branch is not set for the SVC
instruction. Restrict to force last_instr_taken_branch to true for a
system call only.

After:

 b_ls_not_taken_            400108 fallthrough insn: 61 ff ff 54                b.ne #0x4000f4
 b_ls_not_taken_            400108 fallthrough insn: 61 ff ff 54                b.ne #0x4000f4
 b_ls_not_taken_  ffff800080010c80 vectors insn: 03 00 00 14            b #0xffff800080010c8c
 b_ls_not_taken_  ffff800080010ca4 vectors insn: 41 02 00 14            b #0xffff8000800115a8

Fixes: 7100b12cf474 ("perf cs-etm: Generate branch sample for exception packet")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 95e3ec1171acc8442d8539a72a26a1a5a53a2f37..05e698f666bbe07af9caeda1a673f22d7196817a 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1999,17 +1999,20 @@ static int cs_etm__context(struct cs_etm_queue *etmq,
 static int cs_etm__exception(struct cs_etm_traceid_queue *tidq)
 {
 	/*
-	 * When the exception packet is inserted, whether the last instruction
-	 * in previous range packet is taken branch or not, we need to force
-	 * to set 'prev_packet->last_instr_taken_branch' to true.  This ensures
-	 * to generate branch sample for the instruction range before the
-	 * exception is trapped to kernel or before the exception returning.
+	 * cs_etm__set_sample_flags() has already copied exception flags to
+	 * the previous range packet. Do not mark every exception boundary as a
+	 * taken branch: an async exception can arrive after an untaken branch,
+	 * and forcing the flag would synthesize a bogus branch sample.
 	 *
-	 * The exception packet includes the dummy address values, so don't
-	 * swap PACKET with PREV_PACKET.  This keeps PREV_PACKET to be useful
-	 * for generating instruction and branch samples.
+	 * Keep the fixup only for SVC. The decoder reports the range ending in
+	 * SVC without last_instr_taken_branch set, but perf represents SVC
+	 * exception entry as a syscall branch and needs the flag to emit that
+	 * branch sample.
 	 */
-	if (tidq->prev_packet->sample_type == CS_ETM_RANGE)
+	if (tidq->prev_packet->sample_type == CS_ETM_RANGE &&
+	    tidq->prev_packet->flags == (PERF_IP_FLAG_BRANCH |
+					 PERF_IP_FLAG_CALL |
+					 PERF_IP_FLAG_SYSCALLRET))
 		tidq->prev_packet->last_instr_taken_branch = true;
 
 	return 0;

-- 
2.34.1


