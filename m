Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312FBC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qqd8wGXWEw9LjEjKWEX/5ui0R27Uajy4hyfMozJIyIY=; b=AFgeUNY2w4xnrXwLH6rmiwSE2a
	KtAI4fEzy9WWxBk3RzWpLkfI7wvOv5wMb6OeRXN47w4xsX31egDFEDjhd9XZKFdO3EoSWBOTCLW9G
	3TX/sDlPl1PJ/6008JCy8aEp5x/eUUVE9K7FhrII+4+06+Llh7CeJfgPlp9SvEVXZLB9iPInzHtIj
	fbAQFywW1oP+EY6mOJ3sTV7IOiE6NZGkJSC3biUvDtLbESwO/5G4vENQ9pI8IyWCUYnj2t/BxSfle
	w4lRUHhaiDKHwTSLyPNa+BQ4CybxohQnPlLx1ANYngL32vMHGqIZ6fGfNC9ev9xFHELK162POQ7BF
	NUz5IAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKEn-00000009bmh-1ebm;
	Thu, 30 Jul 2026 06:27:25 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKEj-00000009blr-1kpr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:27:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Qqd8wGXWEw9LjEjKWEX/5ui0R27Uajy4hyfMozJIyIY=;
	b=Rt+xRyeG+TiNo/EjpbUkr58F4sKUjxE5+cx3G9V2AMZ+e0oyStS2I+T3Ha50VqaYd6DzVaiuv
	ijRpeWxCTOBesuGB2s60YJm+DZhsQX9mjCib58AFLtuHTPBJv6KDhIZ3msJPRTS//vSgvtwHHRJ
	fsOCQ5HX0ZoRRRoE0VtVdto=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h9fBf1bvQz1cyTD;
	Thu, 30 Jul 2026 14:17:46 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 52B9540572;
	Thu, 30 Jul 2026 14:27:12 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 30 Jul
 2026 14:27:09 +0800
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
Subject: [PATCH v2 0/3] perf hisi-ptt: Fix TLP header parsing and naming
Date: Thu, 30 Jul 2026 14:27:06 +0800
Message-ID: <20260730062709.534139-1-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_232721_961002_49373B70 
X-CRM114-Status: GOOD (  10.59  )
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

This series fixes bugs and issues in the hisi_ptt packet decoder that were
introduced by commit 5e91e57e6809 ("perf auxtrace arm64: Add support
for parsing HiSilicon PCIe Trace packet").

Patch 1: Bugfix:
The DW0 bit-field layout of the hisi_ptt_4dw union does not match
the actual little-endian memory ordering, so the extracted
Format/Type/T9/T8/TH/SO/Length/Time fields are wrong.

Meanwhile, make all DW hex values printed in big-endian byte order
for readability.

Patch 2: Fix endianness / Heap out-of-bounds read / Integer truncation
issues.

Patch 3: Fix spelling / abbreviation errors in symbol names and macros.

---
Changes in v2:
- Move spelling error fixes to the end of the patch series.
- Add fixes tag only for bugfix.
- Use get_unaligned_le32() to make memory read more robust.
- Fix pre-existing issues reported by Sashiko in patch 2.
- Link to v1: https://lore.kernel.org/linux-pci/20260729060220.624250-1-liusizhe5@huawei.com/

---
Sizhe Liu (3):
  perf hisi-ptt: Fix PTT trace TLP header parsing
  perf hisi-ptt: Strengthen auxtrace event handling and packet type
    detection
  perf hisi-ptt: Fix spelling and abbreviation errors

 Documentation/trace/hisi-ptt.rst              | 28 ++++-----
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 63 ++++++++++---------
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   | 14 ++++-
 tools/perf/util/hisi-ptt.c                    | 24 +++++--
 4 files changed, 77 insertions(+), 52 deletions(-)

-- 
2.33.0


