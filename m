Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB4CC624D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sIzLT/xRcPzl/3H+A9x90LFxp0WAG3bfsSL5ZILRtwA=; b=bgQ+zEyRZ3FNjg
	ux7YSUQIWvfqcMtpf0OY7IBxfhIkMoydhzg5RJnOHhGSfe/3XjSGRSyjPtZ28XOc0d5Qj70L7sg7p
	4fvUnlqhv2pDpgTz/W9sSO1qLABIC36fx//5GuNiKrAvNFAQwhXquLPT5hGy2ZFqz6tzlpfvXjigd
	doGPuYCsivc3uiDOmSdptp/Kzbgjus4dO+MAX9jhnXOq2WKuoNerTUfMSam3gxeZS5ItDbFiUv/Zs
	0jWOZF3aGn4hXQNCPkqp7DCLyFVHU4hiah2vFrNem4kCQ/mAdDFhcDHGbvWAR2ig+Zm1Lbis/x0id
	YZOA7gos+agpaerCuKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RTR-0000000Cg9x-2eH2;
	Tue, 01 Sep 2026 16:36:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RTK-0000000Cg7x-30Jx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:36:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D27D1756;
	Tue,  1 Sep 2026 09:36:23 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 156F53F85F;
	Tue,  1 Sep 2026 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788280586; bh=zCJfrcWau7jbwN72fLHboX/CuuSQr1vM6q6Bc/NBwBo=;
	h=From:Subject:Date:To:Cc:From;
	b=QiwuEj1dRF3pQYhiMJDVjIXlk6l2bFvWyInpmizT+KDdGrBMEHTx3xAHswKSRpA+Z
	 PQ0TfcYd71YZMd0urzSWzdSq62w/xI6oHpIRFlZKGhm2AGbO3FiaXyMB4PdyDezcVx
	 IMyweNi939V6HiRu2xrXHe9gCTjuwyvy8RJT6rjI=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/3] perf: Suppress redundant ITRACE start records for Arm
 SPE and CoreSight
Date: Tue, 01 Sep 2026 17:36:14 +0100
Message-Id: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7+lmoC/x2NwQqDMBAFf0X23EAMWkh/pUgI8cXuRcNuLIL47
 waPA8PMSQphKH26kwR/Vt7WBv2ro/SL6wLDc2Ny1r2tt70pkBx0L0WgGrhKTAhao9QgSJvMaga
 XYx5G+ARPLdTUzMcz+U7XdQNAVaCydAAAAA==
X-Change-ID: 20260901-perf_suppress_itrace_start_records-42faf45e9ce9
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788280584; l=1790;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zCJfrcWau7jbwN72fLHboX/CuuSQr1vM6q6Bc/NBwBo=;
 b=6lzMWVLUtIPg/UE/t2UwAum630KRWxLtZUOdj3e5NzZk00au2gVpwEJ/JeAjMQAzYdE4s80R8
 0i0k0B/m8/UBSPK3wNfeGmRhvTCJ902iXl96pUW1iKGUWhXpQgdxArH
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093630_833038_C87600AC 
X-CRM114-Status: UNSURE (   9.12  )
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

Thanks to Tamas Petz for noticing that Arm CoreSight perf data can contain
many PERF_RECORD_ITRACE_START records.

PERF_RECORD_ITRACE_START provides the decoder with the initial thread
context when that information is absent from the trace stream. Once
tracing has started, Arm SPE and CoreSight decoders track subsequent
context changes using context packets or recorded sched_switch events.

Have both drivers call perf_event_itrace_started() after successfully
starting event. This prevents perf core from emitting redundant
PERF_RECORD_ITRACE_START records when an event is scheduled in again.

Since the Arm SPE and CoreSight drivers can be built as modules, export
perf_event_itrace_started() before using it in those drivers.

This series was verified with Arm CoreSight using the commands below.
The perf data contains 100 sched_switch events but only one
PERF_RECORD_ITRACE_START record:

  taskset -c 2 perf record -e cs_etm//u -e sched:sched_switch -- \
	  taskset -c 2 bash -c 'while true; do sleep 0.01; done'
  ^C

  perf script -D 2>&1 | grep -c sched_switch
  100

  perf script -D 2>&1 | grep -c PERF_RECORD_ITRACE_START
  1

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (3):
      perf/core: Export perf_event_itrace_started()
      perf: arm_spe: Suppress redundant ITRACE start records
      coresight: perf: Suppress ITRACE start records

 drivers/hwtracing/coresight/coresight-etm-perf.c | 2 ++
 drivers/perf/arm_spe_pmu.c                       | 2 ++
 kernel/events/core.c                             | 1 +
 3 files changed, 5 insertions(+)
---
base-commit: 786262be6048deab760f68c8acc2c85607165894
change-id: 20260901-perf_suppress_itrace_start_records-42faf45e9ce9

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


