Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADCAC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RbPpVruGZHVlSY4PNTNDLhM5I+XecthtbwhAx301AmY=; b=XXKyyl80lXfPyNw+Tx/CqVrBNd
	VPv3HZwLhWUhHsnoISv+UjNp11jG3G3MM79SEksBK3qsosiFYYJ6NOwABPixvdDeLmca2c2WaH5l3
	L5qj9kfSIVGooVGxVnUxM4HXEJq/ZAsoTWQABLU0uSYMElIc8LdSrJjlWUMyCKCkIsxkM5MyzJdiX
	HZeWShTj2z5qh1ZA+a5nwg5DVqnTmU0pc8/i4VDSv892N5Ul18i5A1mo7gRVQVC73uPyNwDvab2NK
	75wng0aeRXxjRAKBl7sWMPulkfjOWUrfb0ThqRbrU3H3N294bVf8VJNU6GUbB53f6YQ2gsyX+B3Nr
	TIZcd00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22G2-0000000GhCB-0fJG;
	Thu, 03 Sep 2026 07:53:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Fz-0000000Gh9B-31qX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=RbPpVruGZHVlSY4PNTNDLhM5I+XecthtbwhAx301AmY=; b=g5BEf1PvPl0DcojUFyNX/4AqCD
	1HzjRnbwwJ2Q/OIeJ+jT6+ZkjIbsatAj0fOGjdJQZm7YBFq4k9t+wpK6t7mJal9sPMlfcj+1Bd7OS
	OSpfBYI7m9JMPmbYbZILfo2AT6b99tPioDb0nxrwyyczrGsKKOm86NzMqVsBTnVja1+rg1Iotx5LH
	yRFY70r18lceeFHfKlLy3XwEL/NfcJTkEUz/QR6FIGEk6nvKc3DWs2mCewdDjGEd86LH7SVCRim8E
	BmSloGsLmZ83ltLyi9Cx2Z5PrBPJnqaGsjqO7i+KEKd45G/1KDDjjtC3MTcIu5nCcL2rFzLXR1SGx
	WHlkfr9Q==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22Fu-0000000Coot-0yrk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:53:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RbPpVruGZHVlSY4PNTNDLhM5I+XecthtbwhAx301AmY=;
	b=HKc/iROH0y5/f6LQosv4tNU/fJ+jsKBO1EQARta2VM3PI8fCj/pBkO89zhh8wdW4xMY2W8UI+
	hhNpnJNW3pLIu4lWQdyXWTF5gwM853CAXY3/juJ1duHyrnzbZYhsSXIbLDbfZvX1yBJb/+gOZan
	rji1hNX64W0nmbK1B+EJpUY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hbBPf00czzcbNp;
	Thu,  3 Sep 2026 15:41:57 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E1BD202E6;
	Thu,  3 Sep 2026 15:52:45 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 15:52:42 +0800
From: Sizhe Liu <liusizhe5@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wangyushan12@huawei.com>,
	<wuzongyu1@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <liusizhe5@huawei.com>
Subject: [PATCH v3 0/8] Enhance TLP packet decoder with field-level parsing and versioning
Date: Thu, 3 Sep 2026 15:52:33 +0800
Message-ID: <20260903075241.1445338-1-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085308_929893_2A900BCF 
X-CRM114-Status: UNSURE (   8.90  )
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

The original hisi-ptt-decoder only prints raw hex values with generic field
names for DW2/DW3, without classifying TLP types or decoding
DW2/DW3 fields according to the hardware-defined packet format.

This series enhances the HiSilicon PTT (PCIe Trace and Tuning) packet
decoder in perf tool to provide detailed field-level parsing of TLP headers
based on message type, and adds a versioning mechanism for backward
compatibility both in hisi_ptt driver and perf tool.

---
Changes in v3:
- Add explicit inclusion of <stdbool.h> (Sashiko).
- Make patch 07/08 apply cleanly to mainline (Yushan).
- Pick up the reviewed-by tag (Yushan).
- Link to v2: https://lore.kernel.org/linux-pci/20260827140442.2031128-1-liusizhe5@huawei.com/

Changes in v2:
- Split patch 01/10 and patch 02/10 from series v1 into independent patch
  series for backporting (Bjorn).
- Use bitwise operations instead of C bitfields for cross-platform cases
  (Sashiko).
- Add `pattern` parameter in hisi_ptt driver for layout compatibility.
- Link to v1: https://lore.kernel.org/linux-pci/20260604075005.2219785-1-liusizhe5@huawei.com/

---
Sizhe Liu (8):
  perf hisi-ptt: Abstract trace data buf and offset
  perf hisi-ptt: Complete the field names for 4DW and 8DW packets
  perf hisi-ptt: Extract the raw data printing part
  perf hisi-ptt: Merge 4DW and 8DW HEAD0 printing
  perf hisi-ptt: Add parsing of supported message types
  perf hisi-ptt: Add field-level parsing for header DW2/DW3
  hwtracing: hisi_ptt: Add pattern PMU config for trace format selection
  perf hisi-ptt: Pass pattern version to decoder for compatibility

 Documentation/trace/hisi-ptt.rst              |  25 +-
 drivers/hwtracing/ptt/hisi_ptt.c              |  25 +-
 drivers/hwtracing/ptt/hisi_ptt.h              |   4 +
 tools/perf/arch/arm64/util/hisi-ptt.c         |  18 ++
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 291 ++++++++++++++----
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  69 ++++-
 tools/perf/util/hisi-ptt.c                    |  51 +--
 tools/perf/util/hisi-ptt.h                    |   9 +-
 8 files changed, 405 insertions(+), 87 deletions(-)

-- 
2.33.0


