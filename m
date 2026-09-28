Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE499C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e8ljvwO9tCJVUIr1sIIhyeWigwvCFhuXcYs6LrXQA6Y=; b=eEp35RxdYQWpnDd0n/9f0cjxlf
	UiUDdmRE0RS1OafRn2deFJpK13XJ+Tkzm4U6sik0o2nm1EblZClfa5DjpqC8VKoum03n2xkRRJ/ee
	4/AWv8UWGaJpRakaWvFy++xlRcp59LxtDQnDfh+DoGduiHSzvTxBNN5Whs1vdL/nymYuzXg8YzeZg
	XVp0QAYtALj08eGHOBXuvMvikrQ7twAfkRXqAtpGnBAbSekNFcbovxzctsjzefjzLCocIkcEuOVMY
	ktd9dhGl+7POr8sahPW/QyR3GZsJxSMMTqmFf+0F4tr4fEQNX5+kH1jW4/doRol92VdyGfYOa8h9e
	TVclxq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8P3-00000000KJr-0VkP;
	Mon, 28 Sep 2026 10:16:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Oz-00000000KIo-1NCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 10:16:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E42F1595;
	Mon, 28 Sep 2026 03:16:01 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C36183F86F;
	Mon, 28 Sep 2026 03:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790590564; bh=TLcuAfNS5WGF0Ruj4addevBg9cjbks/F3rMnppHCpFQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Qj293lBg/6b843xYXIk9YO/DL5ZlcuD8zBJGerZdZts+ENqsUVJep4w+Pc6KlwNJj
	 nyWECdxejVewrMEYaQiMLr6lXZE+ra/3nb/mQeRs+c2ubsQmD8OFwQlfyDFmFqeQrz
	 xKnzNC2CzPiDqaIAxo9yZSeKOCIuFOPJOIzGhrzQ=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 28 Sep 2026 11:15:51 +0100
Subject: [PATCH v2] perf test: Record kcore for the CoreSight callchain
 test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-perf_cs_etm_callchain_test_add_kcore-v2-1-24fff6fab009@arm.com>
X-B4-Tracking: v=1; b=H4sIAFY+umoC/x2N0QqDMAwAf0XyvIIWJna/MkYoaaphrkpSZCD++
 8oeD467E4xV2ODRnaB8iMlWGvhbB7TEMrOT1Bh878c++MntrBnJkOsHKa5rs6RgZasYU8I3bco
 uh5GnMOQw0B1aalfO8v1vnq/r+gGBWobudgAAAA==
X-Change-ID: 20260928-perf_cs_etm_callchain_test_add_kcore-f96e891f91c5
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790590562; l=1896;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=TLcuAfNS5WGF0Ruj4addevBg9cjbks/F3rMnppHCpFQ=;
 b=PBLAJZQTz4UAxqKrLyv3CqWD4tY8pyLYcqZhXfLSXqr1Oaz+AT7oVouvPfS9f4nU0Vezdmpw/
 96D3DunWinYB0n/QnueUdjkNQgEPoW4JEGspaRGqwiD5ogGg8Fr8j/Z
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_031605_459984_92BC3FAF 
X-CRM114-Status: GOOD (  14.33  )
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
If kcore is not available, the test will be skipped.

Add a Fixes tag so the change can be backported to stable kernels and
improve the test reliability.

Fixes: ca0e19074bd6 ("perf test: Add Arm CoreSight callchain test")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Add check /proc/kcore and skip test if absent.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/tests/shell/coresight/callchain.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/coresight/callchain.sh b/tools/perf/tests/shell/coresight/callchain.sh
index 13cca7dc11184002e3ddc058c0d0ffa1c458c483..43ad90bc30345efdd40ba4649ceeb435a1781a4b 100755
--- a/tools/perf/tests/shell/coresight/callchain.sh
+++ b/tools/perf/tests/shell/coresight/callchain.sh
@@ -30,6 +30,11 @@ skip_if_system_is_not_ready()
 		return 2
 	}
 
+	[ -e /proc/kcore ] || {
+		echo "[Skip] /proc/kcore is not available" >&2
+		return 2
+	}
+
 	return 0
 }
 
@@ -43,7 +48,7 @@ record_trace()
 
 	mkfifo "$cf" "$af"
 
-	perf record -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
+	perf record --kcore -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
 		perf test --record-ctl fifo:"$cf","$af" -w callchain >/dev/null 2>&1 &&
 
 	# It is safe to use 'i3i' with a three-instruction interval, since the

---
base-commit: 0ae6fc78c5ce0dfd18d8712a50f0fd4602eff103
change-id: 20260928-perf_cs_etm_callchain_test_add_kcore-f96e891f91c5

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


