Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917F6CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHvvzLKmf5c70RfsJL9N8TtNdChSER8kcLq/kGUzcsA=; b=nVByPmyOie8vO4VVpf+sHJUJbX
	IBW5aD31NYNA9yylRph7ppfjhqIBLtxB76knBk+qrbi2eIGBjyjkoWYZS2MtSkp7sR3YHOqxKIPv4
	2qb80XLGrRw1a5vEQ98e8woY7euDIIAss4WT2OLmPrE/rGFDkhyE2Ix+4piG6GlQVd6Kvdvg3ooST
	O+580PE3q0nnhZzbequIVnZwix5V4pMkZm2uIkWoCspjpgHsnNn4iXnKs1IWGfRuB0cfTPbfZ3Ztg
	dbvj+nZsPgBQE7fzvH+1rxwi4LsGVld5ftei7XnaCNE9RBE94hLGiMzpGw9A5/ay2n4EDFOzW4tbx
	ZCzK8y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mCE-00000008Eza-36GC;
	Fri, 17 Oct 2025 15:16:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mCD-00000008EzK-1hvK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B416A644C8;
	Fri, 17 Oct 2025 15:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE63CC4CEE7;
	Fri, 17 Oct 2025 15:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760714204;
	bh=aSPhKdG/ToVZJ5+8kusvPngAyPgxFlWXvpGemVX22Dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0MlxUnID93NFGJpRzPgr4RYfL6biZA5+XSk21KgZiWUcfAaZWdocGpmqxAeq+4Py
	 +57y3prS+YUoZ0NSeeOEPTOXdUNenjvu1Jn7dC3fOz/IZtUTLc+8VTo6tYRVjBmG63
	 4OKACN2ZBD0X5UzE/Y+MDJTV0b/3o1YfiwK1yYCA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Namhyung Kim <namhyung@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Yang Jihong <yangjihong@bytedance.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	Howard Chu <howardchu95@gmail.com>,
	Ze Gao <zegao2021@gmail.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Leo Yan <leo.yan@linux.dev>,
	ak@linux.intel.com,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	Yanteng Si <siyanteng@loongson.cn>,
	Sun Haiyong <sunhaiyong@loongson.cn>,
	John Garry <john.g.garry@oracle.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12 031/277] perf test: Add a test for default perf stat command
Date: Fri, 17 Oct 2025 16:50:38 +0200
Message-ID: <20251017145148.283904974@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017145147.138822285@linuxfoundation.org>
References: <20251017145147.138822285@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: James Clark <james.clark@linaro.org>

[ Upstream commit 65d11821910bd910a2b4b5b005360d036c76ecef ]

Test that one cycles event is opened for each core PMU when "perf stat"
is run without arguments.

The event line can either be output as "pmu/cycles/" or just "cycles" if
there is only one PMU. Include 2 spaces for padding in the one PMU case
to avoid matching when the word cycles is included in metric
descriptions.

Acked-by: Namhyung Kim <namhyung@kernel.org>
Acked-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: James Clark <james.clark@linaro.org>
Cc: Yang Jihong <yangjihong@bytedance.com>
Cc: Dominique Martinet <asmadeus@codewreck.org>
Cc: Colin Ian King <colin.i.king@gmail.com>
Cc: Howard Chu <howardchu95@gmail.com>
Cc: Ze Gao <zegao2021@gmail.com>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: Weilin Wang <weilin.wang@intel.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Jing Zhang <renyu.zj@linux.alibaba.com>
Cc: Yang Li <yang.lee@linux.alibaba.com>
Cc: Leo Yan <leo.yan@linux.dev>
Cc: ak@linux.intel.com
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Yanteng Si <siyanteng@loongson.cn>
Cc: Sun Haiyong <sunhaiyong@loongson.cn>
Cc: John Garry <john.g.garry@oracle.com>
Link: https://lore.kernel.org/r/20240926144851.245903-8-james.clark@linaro.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Stable-dep-of: 24937ee839e4 ("perf evsel: Ensure the fallback message is always written to")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/tests/shell/stat.sh | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/perf/tests/shell/stat.sh b/tools/perf/tests/shell/stat.sh
index 3f1e67795490a..c6df7eec96b98 100755
--- a/tools/perf/tests/shell/stat.sh
+++ b/tools/perf/tests/shell/stat.sh
@@ -146,6 +146,30 @@ test_cputype() {
   echo "cputype test [Success]"
 }
 
+test_hybrid() {
+  # Test the default stat command on hybrid devices opens one cycles event for
+  # each CPU type.
+  echo "hybrid test"
+
+  # Count the number of core PMUs, assume minimum of 1
+  pmus=$(ls /sys/bus/event_source/devices/*/cpus 2>/dev/null | wc -l)
+  if [ "$pmus" -lt 1 ]
+  then
+    pmus=1
+  fi
+
+  # Run default Perf stat
+  cycles_events=$(perf stat -- true 2>&1 | grep -E "/cycles/|  cycles  " | wc -l)
+
+  if [ "$pmus" -ne "$cycles_events" ]
+  then
+    echo "hybrid test [Found $pmus PMUs but $cycles_events cycles events. Failed]"
+    err=1
+    return
+  fi
+  echo "hybrid test [Success]"
+}
+
 test_default_stat
 test_stat_record_report
 test_stat_record_script
@@ -153,4 +177,5 @@ test_stat_repeat_weak_groups
 test_topdown_groups
 test_topdown_weak_groups
 test_cputype
+test_hybrid
 exit $err
-- 
2.51.0




