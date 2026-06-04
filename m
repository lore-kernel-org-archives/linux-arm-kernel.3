Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7258CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iKhnmKKSbhjeNdqT2fB30yYTWXHZcg0QMpTiu5anmd0=; b=Td2lkcmn1ZKYIxYe8khvjKJGw0
	9SYakhgpW4EkegjfgHJDk0/xsFbwkaiOKlB1UM1j4yHF4cLR5kVMtam85i35nb8PZyh1O8phYam/8
	eRkFg+Hzxd1XLkw/HSzylaeTIWgjDEF5VkpoZh8HKtfVUET8j6TyeVp9KCpR9h0pWuiaL0usnCe13
	HD/9wb/KFzjGgVoHbfrlORr+zRB2Tlpgbg7DZcviDZGwREOQ1V/YwDZpKxBbjccyuZqJeabt+/elI
	UbWJIVdNT0i9dN8t3CqzuXiHcEKVMBwR7hoY/Oycc+kOn0eezvjPpJAP2lSt82Gmsu9UtA1cyl77V
	fE3hyb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2qV-0000000GKKe-0PeY;
	Thu, 04 Jun 2026 07:50:31 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2qP-0000000GKB7-3Qwq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:50:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iKhnmKKSbhjeNdqT2fB30yYTWXHZcg0QMpTiu5anmd0=;
	b=ioFbu4NVRgf3LNPhc//0xFgLW/sRh9rqxYVVddoZbjMClBRr/6NDkF7bkGHmFpANOSXBcY9Vk
	ZaPiu9leZp97LBHEsrw8FVfsuFTOdQdikbm19YHu3yVHJFDpEQkrPpfGeLZvcP9svaIPVA/Q3Cl
	w1tvAPATCnOb+95EV2ScSfM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gWGjy27Cpz1prPH;
	Thu,  4 Jun 2026 15:42:14 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 54E3D40561;
	Thu,  4 Jun 2026 15:50:07 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:07 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:05 +0800
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
	<shenyang39@huawei.com>, <gaozhihao6@h-partners.com>,
	<yuzhichengcheng@h-partners.com>, <liyihang9@h-partners.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <wuyifan50@huawei.com>,
	<liusizhe5@huawei.com>
Subject: [PATCH 00/10] perf hisi-ptt: Enhance TLP packet decoder with field-level parsing and versioning
Date: Thu, 4 Jun 2026 15:49:55 +0800
Message-ID: <20260604075005.2219785-1-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn200012.china.huawei.com (7.202.194.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_005026_181742_3A889E82 
X-CRM114-Status: UNSURE (   7.12  )
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

This series enhances the HiSilicon PTT (PCIe Trace and Tuning) packet
decoder in perf to provide detailed field-level parsing of TLP headers
based on message type, and adds a versioning mechanism for backward
compatibility.
The original decoder only prints raw hex values with generic field
names for each DW, without classifying TLP types or decoding
DW2/DW3 fields according to the hardware-defined packet format.
Patch overview:
  Patches 1-2: Bug fixes
    - Fix spelling/abbreviation errors (FIELD_LENTH, kpt_desc)
    - Fix DW0 bit field ordering and DW hex value printing
  Patches 3-7: Refactoring for field-level parsing
    - Rename union and add named struct member for multi-DW reuse
    - Abstract trace buffer/offset into struct hisi_ptt_pkt_buf
    - Complete missing field name entries in 4DW/8DW tables
    - Extract raw data printing into function
    - Unify 4DW/8DW HEAD0 printing into hisi_ptt_print_head0()
  Patch 8: TLP message type classification
    - Parse Format/Type from DW0 to classify packets as
      MWr/Msg/Atomic/IO/Cfg/Cpl
  Patch 9: Field-level DW2/DW3 parsing
    - Decode DW2 fields for MWr/Msg/Atomic/IO TLPs
    - Decode DW3 fields for Completion and Configuration TLPs
  Patch 10: Version compatibility
    - Add V1/V2 version in auxtrace info to distinguish old
      (generic field names) from new (detailed field parsing)
      trace data, with backward compatibility for V1 files

Sizhe Liu (10):
  perf hisi-ptt: Fix spelling and abbreviation errors
  perf hisi-ptt: Fix PTT trace TLP Header parsing
  perf hisi-ptt: Rename hisi_ptt_4dw union for reuse
  perf hisi-ptt: Abstract trace data buf and offset
  perf hisi-ptt: Complete the field names for 4DW and 8DW packets
  perf hisi-ptt: Extract the raw data printing part
  perf hisi-ptt: Merge 4DW and 8DW HEAD0 printing
  perf hisi-ptt: Add parsing of supported message types
  perf hisi-ptt: Add field-level parsing for header DW2/DW3
  perf hisi-ptt: Add decoder version compatibility

 Documentation/trace/hisi-ptt.rst              |  28 +-
 tools/perf/arch/arm64/util/hisi-ptt.c         |   2 +
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 352 +++++++++++++++---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  27 +-
 tools/perf/util/hisi-ptt.c                    |  46 ++-
 tools/perf/util/hisi-ptt.h                    |   4 +-
 6 files changed, 365 insertions(+), 94 deletions(-)

-- 
2.33.0


