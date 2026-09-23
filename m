Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD25C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLFmHvbQXYvoYcWtfzf4oZn8T9dzsaVPpx0h/eFUVSA=; b=1YGV2I1VzR/v38HkEnPwtama30
	JyqSBseFlv/MJ7I3dnic0uGpIMeMm54yYUzgDOZR1j490A2miarrdFVGuqi7Bec45UhQapNBlUXVN
	NIUjJS2VGSsnx4DQ0bdb0B3bLyt+ywVpaRAUFKNmGAgDCQv4V6sZytiTeQARLc/dYFizEyEkBp4qo
	sGC7ktI02Horl8FUKrfZqbqhNyyAiRQbQXTKllMKfbCWQ1cl8r57tla0jL61zGKtHlXtsR96e4ikn
	FnvzI1HUKbV9RbhNftcaeIM8huZnK4Z4Qx4GRiMfNHGwRN7GxGG4NMVRhkKC9r5dv93Uln+LqiS0I
	eBugmEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ont-00000008i6r-07Dj;
	Wed, 23 Sep 2026 15:22:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OnT-00000008hsQ-2T6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9321B1CE2;
	Wed, 23 Sep 2026 08:22:07 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D99793F86F;
	Wed, 23 Sep 2026 08:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176931; bh=SnVKOKvRTdz5QhlRrwDJN/1IPX5DokfIgkiOL4pojQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H/vxQG0ONNOz61LdE1YH0bQ8RYYezfLsQZhTuSf1Bdq5/MgX8LMyp6YxmZMMYzYo6
	 47g7jV1Tfb4fPu5bmH1lRiAYKz071imoljTCA1IZK5XcXMC19P19307zrko2phXdzn
	 OHHYZhytjS5VNorhgiIgdv1f0hXkj1cBydqKofYk=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:46 +0100
Subject: [PATCH v2 06/14] perf cs-etm: Mark branches that were not taken
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-6-6ab8c07a5455@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=1907;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SnVKOKvRTdz5QhlRrwDJN/1IPX5DokfIgkiOL4pojQY=;
 b=1yzQkRkAzFWtYer8yI+mq4vpBJ3bRr3SIBqwniIx2H8n/EskoPkDm6Ytax33rd2/0T4faCcus
 O9+tsnsiezNCadzV71HTR0n5jpz3+c/iAYu9EnjDYCkpj9hlGBZivkA
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082211_755587_8843201A 
X-CRM114-Status: GOOD (  12.84  )
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

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 0163d93ac2d537a2190536e77d24628b4d707751..c54218aeef53e8420447e9a2bee6e98d8225e335 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2415,6 +2415,11 @@ static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
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


