Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84338606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jfY3fn/F;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hOcuT6ww
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XYUbYfpJ1kU/FT3edRMSak58G4f8Z5E0Xegt0CaNa1c=; b=jfY3fn/FucMD03
	5lBMEOWy4xUThIs5iVcwVEgFbbQ25MfoF2WkNScnmoenezynr916UWaUU5/yEvoNtFcooMuyUZVR7
	8oKWfD/6FlmuXu1tyK+/4sijWRPSDjwVujH21faKiXTOAdj3y4P+aMEaJZR7V8KBSaJIhiuux4wyZ
	QpDZgh8ieiYa8EkCDPhUSolZivRfqKuZyCBVJYTy/NAPTnBap1EV1pIKwj9ff/dMobUHQsecE6/hA
	P69u4GvaBbYMo6nlh28p+MfcbNIXw6QWfLSdnxyIJnMITkeixL2BV01wmsFwwQf+Jo8QO/sGMFyq8
	j1opB6NLIBKV/MRJUxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIj-0000000BxYn-0gbq;
	Fri, 30 Oct 2026 15:13:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIT-0000000BxPf-2wf7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C0EC1BD0;
	Fri, 30 Oct 2026 08:13:33 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 819AF3F59E;
	Fri, 30 Oct 2026 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373216; bh=BSoooiGLGKzGu8BpdgDPmCLJ3dfVUU5CGa5yHLVw51Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hOcuT6wwDJ4VQV+eO7oMgYQTKFz2jG2NOTOZuVUSlLS+VzZq7//vuF1iGuj9MdM9z
	 LrvsjfUJObrwuxGmou5qZkWh8Y9DiPPqMZ8xNRr5lgdsCZBsp1jCD0vpBTFM1id8By
	 TVBATE/OOC0e8ctDayp+iqt5R+RJ/YfpXDrXLZbc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:12 +0000
Subject: [PATCH v3 05/14] perf cs-etm: Use the recorded instruction size
 for A32 and A64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-5-7629b52ab047@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=2181;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BSoooiGLGKzGu8BpdgDPmCLJ3dfVUU5CGa5yHLVw51Y=;
 b=91UvI1sbll2WAz9sQwKGKruLAz1iWbb04XvRngWxA/9KrxB1SQ4iuvNxvIFuWeQlBHM3kZdur
 9DJsGBp9DXwCpfD604SukHETZp12eEbWDsTnn9FFE2F+9u7/s69aEWY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081337_845535_FF808409 
X-CRM114-Status: GOOD (  14.82  )
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

Use packet->last_instr_size in cs_etm__instr_size() instead of a
hard-coded value of four. Ordinary A32/A64 instruction ranges are
unchanged, since their instructions are always four bytes.

Prepare for synthesizing exception entries separately from the preceding
instruction range. An exception packet may have last_instr_size = 0,
meaning that no instruction completed at the exception source PC and the
exception return address must not advance past that PC. The thread stack
computes the return address as the source PC plus the instruction size,
so returning four would incorrectly advance the return address by four
bytes.

Keep per-address decoding for T32. A range can mix 16-bit and 32-bit
instructions, so last_instr_size describes only the final instruction
and cannot determine the size at an arbitrary address in the range.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index bdcf9481312943b2bbcade8f9688311853c138f2..9126f6327e98b67852b6a55980d67abb24de17fe 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1391,8 +1391,7 @@ static inline int cs_etm__instr_size(struct cs_etm_queue *etmq,
 	if (packet->isa == CS_ETM_ISA_T32)
 		return cs_etm__t32_instr_size(etmq, tidq, packet, addr);
 
-	/* Otherwise, 4-byte instruction size for A32/A64 */
-	return 4;
+	return packet->last_instr_size;
 }
 
 static inline u64 cs_etm__first_executed_instr(struct cs_etm_packet *packet)
@@ -1572,6 +1571,15 @@ static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
 
 	sample->insn_len = cs_etm__instr_size(etmq, tidq, packet, sample->ip);
 
+	/*
+	 * The instruction length should always fit within sample->insn,
+	 * but check it to prevent an out-of-bounds write.
+	 */
+	if (sample->insn_len > sizeof(sample->insn)) {
+		sample->insn_len = 0;
+		return;
+	}
+
 	cs_etm__frontend_mem_access(etmq, tidq, packet, sample->ip,
 				    sample->insn_len, (void *)sample->insn);
 }

-- 
2.34.1


