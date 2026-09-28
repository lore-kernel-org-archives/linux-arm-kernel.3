Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066C3C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tPT4eIJ3bO4Y6/bp4coEeTKG5zZQgf8FfVlOTSUhqfE=; b=e7mql7XxhHurgWrgHv6KhghHJ5
	+nRCCiErGlShEviWssHWxUI/SKnEVk9jLLolxq2WCHxlWLTyKpvJGY9AbVAcOx4RY6PyEogpBA1qP
	b15XIZjDZ8ILXXoshWhYZcD20R39Tlll/FxFQLMWp+wOYk25pQi6Z+m/WGvXTlXbWTMjpc9e3AX9h
	jgRR7tSHyIYEJ7W3HJmOrSwG0lXFlWdYLGW3LrHxZ8375k1mQK/gtlIr61ii1/RAtN0LK2TrCl9iQ
	NVhD45GOiOg31TPEU3o1eR05FWGCrueMI7OHw02ch++R+dG7dKwL4xQUuhirlxNpsjZ451VZZcL2P
	cWd/MjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7KD-00000000B7k-39Cj;
	Mon, 28 Sep 2026 09:07:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7KA-00000000B6r-32Tj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:07:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF7F31570;
	Mon, 28 Sep 2026 02:06:57 -0700 (PDT)
Received: from e132581.cambridge.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 358D23F763;
	Mon, 28 Sep 2026 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790586421; bh=VGuceae+65pE0fRe+nT4QcJlTJKE/a66Mqdu1VWBOpc=;
	h=From:To:Cc:Subject:Date:From;
	b=brVXqz2fq+ArRdhpdmw+IBCRFLWgiSeLWN4GMUR730bA/DPWCI1xa9e9T8gpA1GyM
	 38u6PlQ2vDSi/EZ8FNh3EK6v+eBaa0e5SF53vgpMgcqJ8A6sCb+fis3IFwV80tSRKx
	 5vBz8KBfhuY3Am1gXTjru/eXeY3jPUwRVBd1udH8=
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] perf test: Record kcore for the CoreSight callchain test
Date: Mon, 28 Sep 2026 10:06:44 +0100
Message-Id: <20260928090644.24346-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_020702_890911_A4D0DD0E 
X-CRM114-Status: GOOD (  13.24  )
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

The CoreSight callchain test traces both userspace and kernel execution
and checks the callchain across a syscall.

Add --kcore to perf record to save the running kernel image alongside
the trace data so perf script can use it to decode the kernel trace.

Add a Fixes tag so the change can be backported to stable kernels and
improve the test reliability.

Fixes: ca0e19074bd6 ("perf test: Add Arm CoreSight callchain test")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/tests/shell/coresight/callchain.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/coresight/callchain.sh b/tools/perf/tests/shell/coresight/callchain.sh
index 13cca7dc1118..b69187f1a37f 100755
--- a/tools/perf/tests/shell/coresight/callchain.sh
+++ b/tools/perf/tests/shell/coresight/callchain.sh
@@ -43,7 +43,7 @@ record_trace()
 
 	mkfifo "$cf" "$af"
 
-	perf record -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
+	perf record --kcore -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
 		perf test --record-ctl fifo:"$cf","$af" -w callchain >/dev/null 2>&1 &&
 
 	# It is safe to use 'i3i' with a three-instruction interval, since the
-- 
2.34.1


