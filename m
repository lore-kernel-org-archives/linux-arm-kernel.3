Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADFCC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXPXpb0OW66ZkLEN2m6wM6XYk3DPdgp8C5/7xfZkYOg=; b=EbySDYGoWpNQGF4B4Qj/PznStE
	Q7Erp3//pxte0xcrlHKkfZzjJeHNUJ4kVV3g7R/SWnqfQi43B6R5f2mvRy2kmwFNW6zmLUdELmNkl
	gvguS3Z/jInM+8wtwSoDgtIKgIia17LVCXOS4DthR/K8S/f01S/2f7CGbKv1zXjPVMlHDG747rflI
	/e1NGZABKPVGrg2SIA+ds8/iLK5AWqnzBArvE3blWvp7+/xYl1utx5wAHWk56lPsIP7nKHACHWh/J
	RZNBs0NhTS5OS1/G8GpcGXUps2ZmUwaPeDM/nJH0F3HkVzifbDvM3r/IZxLEdcBXCDA4XtGPOhaAO
	zVLaN9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RTU-0000000CgAf-0rEb;
	Tue, 01 Sep 2026 16:36:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RTM-0000000Cg8O-1bbC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:36:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B4871CDD;
	Tue,  1 Sep 2026 09:36:27 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33A033F85F;
	Tue,  1 Sep 2026 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788280591; bh=xJBbbZZo8b7Loc2wr9E8P5lEJOTEHAM+aFvWr+qdXhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EM8CxYAWvFTLZFh0H/z6mpdd9NrmrQRe8QHmNNgz+t0RU4prsoZ6+n1K08iRTbkV3
	 F426Y2ZUqI71KqHVvGA535Y4anINcoy0PD0eimS6JVnetR3DyG/bJTM4nSv/qn5PpY
	 1bA3QrIuHlJJubkZlgZVoq/mS/wbF+15aBRp+LPc=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Sep 2026 17:36:16 +0100
Subject: [PATCH 2/3] perf: arm_spe: Suppress redundant ITRACE start records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-perf_suppress_itrace_start_records-v1-2-c4fbc6860859@arm.com>
References: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
In-Reply-To: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788280584; l=957;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xJBbbZZo8b7Loc2wr9E8P5lEJOTEHAM+aFvWr+qdXhE=;
 b=U8GkIQ8Sa/aUuleZ6Wj4REIryoMRqoWn5U6OhXZpm1juwlPzaVL9WmQR05GKeh/IO7oVIrb/+
 QY4IxQxArNoAQ9NmbMz1/OF8YDj53W+3YjRXtXjfuPXpgnG5kAy8HoE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093632_463632_C78CFB9D 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

PERF_RECORD_ITRACE_START establishes the initial thread context at the
beginning of a trace. Afterwards, decoders track the thread context using
context packets or recorded sched_switch events.

Call perf_event_itrace_started() when event starts to prevent perf core
from emitting redundant PERF_RECORD_ITRACE_START records on later
schedule-ins.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index b70f3fedf0282baba1395ce1116272ec5f961ea8..40314ef8b731e1272e02783a9e6dc7d92ec47139 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -890,6 +890,8 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
 		return;
 	}
 
+	perf_event_itrace_started(event);
+
 	reg = arm_spe_event_to_pmsfcr(event);
 	write_sysreg_s(reg, SYS_PMSFCR_EL1);
 

-- 
2.34.1


