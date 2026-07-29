Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9FAC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V71nthpwGO+GJAB/erhP7HVeTYXWWzSBe1yNAaRYKzY=; b=WvYGS+73h64og14HouqFwc62FP
	OJEwnLmZu738vqDZ7/yxqlO3VIBjiXraDtQ6tOoFwMZd2b2EIT5WidBo/rMTo4tikh3oYWHzAAOcm
	S5D9seb1aWSOr665209kKwRDnpxuqh42nxY2BmsVOu0wV1hMDaHNqPMFIEkpvuDWsuhbAzDc4vviA
	nFFhX1STcX42DszNk7tJxUxdcaI0uxiFxOtlE8T7mC1UkxRa0VDjx+tV4LMNzOzGmk4siFuBwXGCU
	gS4SYvpgGxgDR/Jhyz7fg8MXt8EaBYCO01HxXWoKOA1/gS7krfB6A2RLWkfx2Pp7VExB4oD1/B//x
	tyD+DTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxNB-00000006ybd-45rm;
	Wed, 29 Jul 2026 06:02:33 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxN7-00000006yaw-2Drk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 06:02:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=V71nthpwGO+GJAB/erhP7HVeTYXWWzSBe1yNAaRYKzY=;
	b=gedM1U4dPxFnmbzPbb3fHUR2F44fUXtqWGFuEihLGoQAzSofJYQSXHFw6UMr9MIFqEh6k9RcJ
	8o7qXbpqweRP/Er++EJCnfYOZzcWIe680lE92SEZXzrtidjzVWvytlA5e6L6xKfysJzfBfeo6sq
	S1MCiisNWZmudGbwK2WrNfk=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h91hQ0nSqzKm4b;
	Wed, 29 Jul 2026 13:52:54 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E2CE4056C;
	Wed, 29 Jul 2026 14:02:23 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 29 Jul
 2026 14:02:20 +0800
From: Sizhe Liu <liusizhe5@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wangyushan12@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <wuyifan50@huawei.com>, <liusizhe5@huawei.com>
Subject: [PATCH 0/2] perf hisi-ptt: Fix TLP header parsing and naming
Date: Wed, 29 Jul 2026 14:02:18 +0800
Message-ID: <20260729060220.624250-1-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_230230_060553_E9C2089D 
X-CRM114-Status: UNSURE (   8.05  )
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

This series fixes two issues in the hisi_ptt packet decoder that were
introduced by commit 5e91e57e6809 ("perf auxtrace arm64: Add support
for parsing HiSilicon PCIe Trace packet").

Patch 1 fixes spelling / abbreviation errors in symbol names and
macros.

Patch 2 fixes a bug:
The DW0 bit-field layout of the hisi_ptt_4dw union does not match
the actual little-endian memory ordering, so the extracted 
Format/Type/T9/T8/TH/SO/Length/Time fields are wrong.

Meanwhile, make all DW hex values printed in big-endian byte order
for readability.

Sizhe Liu (2):
  perf hisi-ptt: Fix spelling and abbreviation errors
  perf hisi-ptt: Fix PTT trace TLP header parsing

 Documentation/trace/hisi-ptt.rst              | 28 ++++-----
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 62 +++++++++----------
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   | 14 ++++-
 3 files changed, 58 insertions(+), 46 deletions(-)

-- 
2.33.0


