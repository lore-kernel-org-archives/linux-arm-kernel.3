Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA737CF65F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eTwA8vL6Im2v+uyk5X4ovdq50U/xpwJjkiF9udIQIcQ=; b=0SdqjBaLU9PTYPKRBPrOoK05Kg
	jY+6IuvKXfdEHLA1NBQcwb5TDUKm1fBRpir7Fk199kd9ZdzADZ1kzMtcMU8RZi0OcV0jnvGvnrtkR
	E94H/JtbZBeB5s8pwIi4Wbmr3HW8ap5oXmQODsVwiNYZPdB3ctSFfA4Gbpz8oj0P0dRZTuzacwJ+O
	Rtj8rXi1+iF88xzdlGU2RH3WIjksRtd57MFyuoHG+QaBGbCEbxoigFQpUCPUaHx01Im9r1OCkWKIa
	ymYwDK0keYjZ4JsNNnduXiebASHLpTuYgKCUC2HvNX4jFoR9CsWaFIfsZKo06t5Pqw2wTZyYOoeCP
	8LnT+qNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoY-0000000CYCo-2w0m;
	Mon, 26 Jan 2026 12:35:30 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoU-0000000CYAZ-2Nw1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:35:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eTwA8vL6Im2v+uyk5X4ovdq50U/xpwJjkiF9udIQIcQ=;
	b=sQudvXE7YbO9ohqCC4wlpeeD4RA7NbzwvB4wmO4tBhTIA0UNTj4s9HmyqHUk72hjEbPBdqAP1
	v1bMxMuDyXXBZPHoYzAi219AvFwsz5rAtGQnfE8T+XgYMucoVPtUO4G9kZ6prbftnn9nirACd1n
	Xh9W+rtv7g+L4ty9C75C8ys=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f07F54SGNznTw8;
	Mon, 26 Jan 2026 20:31:21 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C2B140562;
	Mon, 26 Jan 2026 20:35:16 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Jan 2026 20:35:16 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 26 Jan 2026 20:35:15 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <peterz@infradead.org>,
	<john.g.garry@oracle.com>, <Jonathan.Cameron@huawei.com>,
	<shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RFT PATCH 0/7] perf tool: Support iostat for multiple platforms
Date: Mon, 26 Jan 2026 20:35:07 +0800
Message-ID: <20260126123514.3238425-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_043527_254235_6BB1AE6D 
X-CRM114-Status: GOOD (  11.98  )
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
probe function that checks if there's any PMU's name contains 'x86-iio'
may not work properly, tests of that would be appreciated.

[1] https://lore.kernel.org/all/4688a613-c94a-49b0-9d0f-09173c64082d@arm.com/

Shiju Jose (2):
  perf-iostat: Extend iostat interface to support different iostat PMUs
  perf-iostat: Make x86 iostat compatible with new iostat framework

Yicong Yang (1):
  perf-iostat: Enable iostat mode for HiSilicon PCIe PMU

Yushan Wang (4):
  perf stat: Check color's length instead of the pointer
  perf stat: Save unnecessary print_metric() call
  perf-x86: iostat: Change iostat_prefix() to static
  perf-iostat: Support wilder wildcard-match for pmus

 tools/perf/arch/arm64/util/Build         |   1 +
 tools/perf/arch/arm64/util/hisi-iostat.c | 479 +++++++++++++++++++++++
 tools/perf/arch/x86/util/iostat.c        | 105 +++--
 tools/perf/builtin-script.c              |   2 +-
 tools/perf/util/iostat.c                 |  79 ++--
 tools/perf/util/iostat.h                 |  21 +-
 tools/perf/util/pmus.c                   |  12 +-
 tools/perf/util/pmus.h                   |   3 +
 tools/perf/util/stat-display.c           |   4 +-
 tools/perf/util/stat-shadow.c            |   4 +-
 10 files changed, 638 insertions(+), 72 deletions(-)
 create mode 100644 tools/perf/arch/arm64/util/hisi-iostat.c

-- 
2.33.0


