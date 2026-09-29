Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804AACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1RFsrmvqzfCr7LOhw8jt9AAfSNusZSHU7RkgdOYHbfg=; b=2lv9tDn0FYBu6fjakcvO44KgXH
	gzN9PSA897QyHfIez5BxmAKHzcKrVBoFSjALYh3mUZ+FENNXpkwXGje/ZPUgN78J+TIcuBNCRVAfs
	6ttVTFpLSvWivl0j+xw2KIfWR6PRq7JJL+WTuhnZHAlOCoAcwupj+0uSid4mnQr9JQ6zKR29T735g
	SWFlOtfbZHx/RNNWdcR2zq2uiDsJjCVjOe1YSOebob3iETwc8VAxATetyZrs1d84RWIcIP0OE/a0v
	ZjHU80iOxRyRMmXsmyx3apcdnHMADKJwfDJWCqBBBqQrEpFytxAK/F4BjxDSMq+v+3fveZhM/36mw
	THf4AXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV6Q-00000003Atv-1RlG;
	Tue, 29 Sep 2026 10:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV6K-00000003ArR-348p
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1RFsrmvqzfCr7LOhw8jt9AAfSNusZSHU7RkgdOYHbfg=; b=XzK4KSHvnr3FtxjDb0S6W7dYhf
	Z8609BeyYxhzSufpxJReQuqwaRyEbJjea2pCH/KfllXGMhEBeRabnNnY8KE7hnbXrwa1DBMDriXTh
	qZwSXPwHamgHJ4nxR8wSAj7g7d+bQM71LVj4Fjv+XZ6bO16jMZoCfc9wkncKTSsSoOxK6o+D2wmnT
	TEREc2mQiszmF56xnvW1ey/NLahuinBCrCIIqf9gje1DlqJfW/hcBXs6SadUiUFLk0afOMKpCqG+v
	e38b7YLVbGN3hWh6QynWURysE/dZXkxcb+7Ys0oCAf8SZkv1thbzMLt4tT7W/64gR/eLtfwvO4lWZ
	pL+68AvA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBV68-00000002Tx3-3hFK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:30:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B72CD1516;
	Tue, 29 Sep 2026 03:30:03 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.52.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 423703F86F;
	Tue, 29 Sep 2026 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790677807; bh=Tpveh4XNU6D/ngwovmJo5878W7WdVBobXm56TA+n/Bo=;
	h=From:To:Cc:Subject:Date:From;
	b=rZyfygmTRgWWSHwMAJpjZSZbToSmZ5vlhLIkvgdoWWwwRW/Qs2i9L14hx7MyJERan
	 xOlu6yHQ1Q1zJi9q2BBUosTZDEx2/rxfsWXK12sVwtbbcHFWmMNB9lypSWwJgrEn31
	 fN0GAs3sa/5INS7FtjROdytVPpdS4OMh21g9j/Qs=
From: Christian Loehle <christian.loehle@arm.com>
To: rafael@kernel.org
Cc: zhenglifeng1@huawei.com,
	zhongqiu.han@oss.qualcomm.com,
	viresh.kumar@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Shubhang Kaushik <sh@gentwo.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	jonathanh@nvidia.com,
	zhanjie9@hisilicon.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH 0/3] cpufreq: Resolve CPPC frequencies to performance levels
Date: Tue, 29 Sep 2026 11:29:54 +0100
Message-Id: <20260929102957.2591657-1-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113009_425409_8CCD213F 
X-CRM114-Status: UNSURE (   9.85  )
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

For table-based cpufreq drivers, the core resolves requests to supported
frequency-table entries before governors such as schedutil compare them
with their cached target. Different kHz requests selecting the same entry
therefore need not reach the driver again.

Table-less cppc-cpufreq lacks this resolution: the core returns the requested
kHz value even if firmware exposes only a few CPPC performance levels.
Different requests can miss the governor's cache yet program the same
Desired Performance value. The tested ARM AGI CPU exposes only 61 levels,
with bounds visible at:

  /sys/devices/system/cpu/cpuX/acpi_cppc/{lowest,highest}_perf

Add ->resolve_freq() so table-less ->target() drivers can canonicalize
requests without constructing a frequency table. CPPC resolves requests
before sugov_update_next_freq(), allowing its existing cache to skip
equivalent requests. Raw limit notifications still trigger
reconsideration, but only changed resolved limits force a driver update.
Failed limit writes remain pending for retry.

Testing on an ARM AGI CPU (61 distinct CPPC levels) with schedutil gives
the following end-to-end results across 16 iterations:

  schbench -m 2 -t 31 -F 256 -n 5 -R 18000 -r 60 -w 20 -i 60

  metric                         baseline       resolve-freq      change
  median p99                    3364 us          3280 us          -2.5%
  mean of run p99s              3664.2 us        3299.0 us       -10.0%
  worst run p99                 4360 us          3500 us         -19.7%
  median throughput             16431.08 RPS     16460.69 RPS     +0.2%

In an instrumented run of the same workload, cppc_set_perf() calls fell
from 1,136,868 to 866,703, a 23.8% reduction.

Christian Loehle (3):
  cpufreq: Add a driver frequency resolution callback
  cpufreq: CPPC: Resolve frequencies to performance levels
  cpufreq: Skip updates for unchanged resolved limits

 Documentation/admin-guide/pm/cpufreq.rst |   4 +
 Documentation/cpu-freq/cpu-drivers.rst   |  19 ++
 drivers/cpufreq/cppc_cpufreq.c           | 257 +++++++++++++++++++++--
 drivers/cpufreq/cpufreq.c                |  99 +++++++--
 include/linux/cpufreq.h                  |  11 +
 kernel/sched/cpufreq_schedutil.c         |  19 +-
 6 files changed, 359 insertions(+), 50 deletions(-)


base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509

