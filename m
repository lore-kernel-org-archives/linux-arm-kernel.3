Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34523C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wUSYVC8RFXMOBblpJTxkPOOEO8+kx3KB+SF4zeqbhxs=; b=zQtg23rcZFsqod0MKCKDcLbFxA
	R4qGC2wdRjoQa4nR1NfiPiAJMJZ+UQ2Mqe534Eyog4QTriSNviJ1rUkdn92F8/2lWqVTXJLoyXtQz
	2+M/KcKbBBkciH7NruB9bruGLCwf7WRypXHvFXJVOGOOlTkv4w+lU83E1NKcPrq5SU+Sxznw02wf1
	Z5dAtP9vPT1/AvpsTh51dn8hwKMOvuIHY3icLgKSMJ1n2UOmctm2ytjRRbWKbArOvKZjCUepSMP+M
	Yo8R2+e5pQjcQFYLiIfn65ZUaI2nc7y4YnhEOrJZX+8/gmJzBrh0WZPbw1lwMRlct7w2PZahWseow
	IiMxrBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaj1-000000046zC-0FgC;
	Thu, 27 Aug 2026 14:05:03 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaiu-000000046wg-3Ytv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:05:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wUSYVC8RFXMOBblpJTxkPOOEO8+kx3KB+SF4zeqbhxs=;
	b=XQbn0BdqJFCp5eXrsclw/2+1Ove1XReqsTNyH2vdH0yELJj4f/0S+YkVtOZtaY0MikUxpeEyJ
	SrZQnV8ho5fkQ3tq2XFRkNfw4faZvu4trS5rhnFqKEtOZlZ8/S57l+cgJn7WlEDk5QbYpjSJHT9
	shMLICOzS+N2kfqavFt3u20=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hW3091WQczRhR0;
	Thu, 27 Aug 2026 21:54:01 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 92BBA4056D;
	Thu, 27 Aug 2026 22:04:45 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 22:04:43 +0800
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
Subject: [PATCH v2 0/8] Enhance TLP packet decoder with field-level parsing and versioning
Date: Thu, 27 Aug 2026 22:04:34 +0800
Message-ID: <20260827140442.2031128-1-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_070457_493827_6B33A592 
X-CRM114-Status: UNSURE (   8.40  )
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
Changes in v2:
- Split patch 01/10 and patch 02/10 from series v1 into independent patch
  series for backporting.
- Use bitwise operations instead of C bitfields for cross-platform cases.
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
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  68 +++-
 tools/perf/util/hisi-ptt.c                    |  51 +--
 tools/perf/util/hisi-ptt.h                    |   9 +-
 8 files changed, 404 insertions(+), 87 deletions(-)


base-commit: bec06676f4b2a4276b6277783eb91cd3cffd4b33
-- 
2.33.0


