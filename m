Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8A4CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CTWMLo4jsBct+sVjt0gEHIbyvUbpPYKjmDnTv4upbcQ=; b=j3S+nozbDemcCTCIsPMCUH9QTc
	u49JniHkVKLcmlkkuufJEvXb4YvPa2y1stJc6lwgNJjvektzlM5moDwf89yoCMQrfRPBiMIYrfm+R
	XiMrrhBLykmga9FAHsjqL0IRpfkgHgsB3vEEQZyLgyyt6CpdDP3Fs/mO5Ui8Xia4eyuniCNDBOwCI
	bZZ2+9ZLnZKYy3XVavzHFXc3EeR56RlzvTiCkgjgKrYiwIWYx6hGWcHso2muc4WzVe2wvccjOmmmY
	FrsU+mxWE73CArw4huJHvXlB3m81AeAzNFpPsGpSInSlCeWkJnZacWstciincic/oeyfPYQqW2JNl
	5WJdxoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMp-00000002ukN-10g8;
	Thu, 07 May 2026 06:37:51 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMm-00000002ufK-0LZF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:37:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CTWMLo4jsBct+sVjt0gEHIbyvUbpPYKjmDnTv4upbcQ=;
	b=X1WXfXJRxlpsQdJyxBrjUju1sHY/z4mQZOwc9NzXEL46Ft2/RSLmo6qlIOUdQGpEhCzz7bDa/
	Pd9/J44Sn4N6sAApXyld8YdA6N1KnwgAhXU0WMyoFszh/OrQA3Mpmi2IXnZKgC3gEoXKd/wgY1g
	be98SXZH0JfIELvZY09NWmA=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gB2Rf3hc6z1cyQT;
	Thu,  7 May 2026 14:30:06 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 9831840539;
	Thu,  7 May 2026 14:37:38 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 May 2026 14:37:38 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 7 May 2026 14:37:37 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <james.clark@arm.com>,
	<john.g.garry@oracle.com>, <will@kernel.org>, <mike.leach@arm.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jic23@kernel.org>, <leo.yan@linux.dev>, <robin.murphy@arm.com>,
	<linuxarm@huawei.com>, <hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RFT PATCH v2 0/7] perf tool: Support iostat for multiple platform
Date: Thu, 7 May 2026 14:37:30 +0800
Message-ID: <20260507063737.3542950-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_233748_454677_87F34B85 
X-CRM114-Status: GOOD (  11.36  )
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

Currently, platform-specific iostat code for PMUs is implemented as a
common iostat callback interface and invoked based on what is being
built. This approach limits support for iostat across different types of
PMUs.

Support of HiSilicon PCIe PMU iostat was raised at [1], which uses the
similar approach.

To extend support of iostat across platforms, change common iostat
interface to framework to allow perf to probe PMU capabilities during
runtime and route iostat request to the correct PMU-specific functions.
Then HiSilicon PCIe PMU iostat is supported with the new framework.

Request For Test:
Refactors has been made to x86 iostat to adapt the iostat framework, the
probe function that checks if there's any PMU's name contains
'uncore_iio' may not work properly, tests of that would be appreciated.

[1] https://lore.kernel.org/all/20240208032518.25830-1-yangyicong@huawei.com/

Changes:

RFT v2:
- Replace typedefs with plain function pointer declaration.
- Replace _Bool with bool with the help of stdbool.h.
- Moved architecture-specific iostat implementation code to utils
  directory per Ian.
- Dropped PMU wildcard matching variation, and changed pmu_name to
  pmu_name_wildcard for wildcard PMU name matching.
- Changed PMU name pattern of x86 iostat to "uncore_iio".
- Minor refactors to iostat framework.
Link: https://lore.kernel.org/all/20260126123514.3238425-1-wangyushan12@huawei.com

Shiju Jose (2):
  perf-iostat: Extend iostat interface to support different iostat PMUs
  perf-iostat: Make x86 iostat compatible with new iostat framework

Yicong Yang (1):
  perf-iostat: Enable iostat mode for HiSilicon PCIe PMU

Yushan Wang (4):
  perf stat: Check color's length instead of the pointer
  perf stat: Save unnecessary print_metric() call
  perf-x86: iostat: Move iostat arch-specific implementation to util
  perf-x86: iostat: Change iostat_prefix() to static

 tools/perf/arch/x86/util/Build                |   1 -
 tools/perf/builtin-script.c                   |   2 +-
 tools/perf/util/Build                         |   2 +
 tools/perf/util/hisi-iostat.c                 | 478 ++++++++++++++++++
 tools/perf/util/iostat.c                      |  89 +++-
 tools/perf/util/iostat.h                      |  40 +-
 tools/perf/util/stat-display.c                |   4 +-
 tools/perf/util/stat-shadow.c                 |   4 +-
 .../x86/util/iostat.c => util/x86-iostat.c}   | 100 ++--
 9 files changed, 650 insertions(+), 70 deletions(-)
 create mode 100644 tools/perf/util/hisi-iostat.c
 rename tools/perf/{arch/x86/util/iostat.c => util/x86-iostat.c} (85%)

-- 
2.33.0


