Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB624C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4E9Qtqm6Cw3lFX8q2IDlPdhJGeFOKoozmfEKOmk/6w0=; b=0AKZHQ4gXmwTItyK0xllLffM+u
	nYlfVXQ9OPh8mhHWrpaeVwfpoQkPwp7skZf0TMNdZgQCOOl4eiKQ9y3Cq9jGeyQRh7zSwdoQHOqQT
	LWFTv4aSJGY+kuQ6bzduZxtXGot68Lw5snuwy2LN0YTZAON+4pEXKqEwJu6fovFZZct4ox1YFUOnx
	SeY76BdZjk/tDC4yjzGK5TcY7obeF8Io8sBfcs1Edk+CFNMOhiwsvDJ32FBmr2cNAIl8VSIumxnhW
	NRGXpiCYEJNlemCpzboYXR+XHUlmCMxk5d8yw4Puav2egddijjjimz4X1YuuWMZB1TzdQg1PanLna
	kasch3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPm-00000007HxJ-1BXK;
	Tue, 15 Sep 2026 15:49:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPR-00000007Hji-3nZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4087B1570;
	Tue, 15 Sep 2026 08:49:21 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 768E73F882;
	Tue, 15 Sep 2026 08:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487364; bh=rhjgu0y5asKDIU5Zxii2LNz8ZubPzlbgrZL/U/eqBEo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OduQGEJNFa8tyVkY5wFKQp9SAx8Qfw3cARQ5l45VPsp2hmU7PvqLSkxDxYqHM4WoG
	 cSwrs5fcW3UNzwzdrU5euR6ktpIPxAM/s9PHOQZBl3Drbh6OsRz1lY39buhYttDxAU
	 P4YG5BQJzqOspa73JAiuAqy3+FPeRe7InIEsJDTA=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:54 +0100
Subject: [PATCH 08/25] coresight: perf: Validate context before resuming
 trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-8-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=1830;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rhjgu0y5asKDIU5Zxii2LNz8ZubPzlbgrZL/U/eqBEo=;
 b=fCuwxc40dlV8yQA2S+XPYdRX5eTJanVhEXDcrqONj0/qW1wFYzGh+WPkluTb9yhSVawIdmIsO
 MEXwFEPbueCDE7JwXOlx88FVwMQHb+mO4Dw2ie6nkRPTXQKmqQc+7Yd
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084926_051455_74C77C20 
X-CRM114-Status: GOOD (  15.22  )
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

An AUX pause ends the current AUX output before trying to begin a new
one. That new beginning can fail, leaving the CoreSight path published
after the perf handle has become inactive. AUX resume may also overlap
a normal stop which clears the per-CPU context.

Pass the per-CPU ETM context to etm_event_resume() and centralize both
lifetime checks there. Use perf_get_aux() to confirm that the AUX output
handle is active and path to confirm that the context is still live.
Resume the source only when both checks succeed.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index c7454da5c881c4a8eea5cc77902c9113c297096e..e3c9d3cf84c502f357a430bc3bfa854a776618f1 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -517,11 +517,17 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	goto out;
 }
 
-static int etm_event_resume(struct coresight_path *path)
+static int etm_event_resume(struct etm_ctxt *ctxt)
 {
+	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *source;
+	struct coresight_path *path;
 	int ret;
 
+	if (!perf_get_aux(handle))
+		return 0;
+
+	path = etm_event_get_ctxt_path(ctxt);
 	if (!path)
 		return 0;
 
@@ -547,8 +553,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	u64 hw_id;
 
 	if (flags & PERF_EF_RESUME) {
-		path = etm_event_get_ctxt_path(ctxt);
-		if (etm_event_resume(path) < 0)
+		if (etm_event_resume(ctxt) < 0)
 			goto fail;
 		return;
 	}

-- 
2.34.1


