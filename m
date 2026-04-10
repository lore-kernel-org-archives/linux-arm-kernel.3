Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5049E99066
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eaKFcm7WaRcTi7W+2ANoOnjYHJTX3BGhNlM3aaAYpQQ=; b=TbMpG0NMvBktXBI9h4iN8Q4mTc
	FreLKZNs9Ef9yX+JemEEijQFLW8JUwwtMUcddM5kLYYuOZm81b8jFQVBeknO0jgZpAliAxNfZIgod
	JTVmZ1oiUtM0ubW+Bcsi2P5xgmK7/eJm4iOFBK7y6wJn9+8uz2bD7VaOho+iErj+KFPovBt6OQeGT
	RIUfZtARhS7Amk8sPkUITgRHmNU4CN1RQFbkw2XyNTgh9poaFULg9Yg3q5v7Cuwujt8oCD5nydpnv
	sdP8BUfaBZ81hF+/Uw3KnnsC7O7ELeCwLC9l3H6vU316pjV6DWgD4qIK5N//U7Nmw0XTBt0a+CPiL
	7TQQ8h6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8ND-0000000Bw7h-1ZeG;
	Fri, 10 Apr 2026 09:41:59 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8NA-0000000Bw5m-0a4U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 09:41:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eaKFcm7WaRcTi7W+2ANoOnjYHJTX3BGhNlM3aaAYpQQ=;
	b=ftaG4TBW6olA0Qt7k6NCms1MUPqX5IHmNzU4ckrQEjB3yB7CRqJx6jWEp/wcfODXMTvxcbP8+
	ZokDm7GQm4fucOGuRkq1K4eN869Df5xg/Cs6Ftgk2c9PUoUqjFu4mw41KFrT6T2HGXMrMOiRGgt
	stR6yDw8SLD8Ca0rR0K2RQA=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fsWqy08cNzcb29;
	Fri, 10 Apr 2026 17:35:26 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 03889203C0;
	Fri, 10 Apr 2026 17:41:47 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:41:46 +0800
From: Pengjie Zhang <zhangpengjie2@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<lenb@kernel.org>, <robert.moore@intel.com>, <beata.michalska@arm.com>,
	<zhenglifeng1@huawei.com>, <zhanjie9@hisilicon.com>, <sumitg@nvidia.com>,
	<cuiyunhui@bytedance.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <wanghuiqiang@huawei.com>, <xuwei5@huawei.com>,
	<lihuisong@huawei.com>, <yubowen8@huawei.com>, <zhangpengjie2@huawei.com>,
	<wangzhi12@huawei.com>
Subject: [PATCH 0/2] CPPC: reduce FFH feedback-counter sampling skew on arm64
Date: Fri, 10 Apr 2026 17:41:43 +0800
Message-ID: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_024156_331771_239208E5 
X-CRM114-Status: UNSURE (   7.23  )
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

The legacy CPPC feedback-counter path reads the delivered and reference
performance counters separately.

On arm64 systems using AMU-backed CPPC FFH counters, each FFH read is
served through a cross-CPU counter read helper. Reading the counters
separately therefore widens the sampling window between them and can
skew the delivered/reference ratio used by cpuinfo_cur_freq. Under heavy
load, the skew is observable as transient values that may exceed the
platform maximum, as discussed in [1] and [2].

This series adds a small generic hook for architectures that can obtain
both FFH feedback counters in one operation, while preserving the
existing per-register read path as the fallback.

Patch 1 adds the generic CPPC hook and uses it from cppc_get_perf_ctrs().
Patch 2 implements the hook on arm64 by sampling both AMU counters in a
single operation on the target CPU.

[1] https://lore.kernel.org/all/20231025093847.3740104-4-zengheng4@huawei.com/
[2] https://lore.kernel.org/all/20231212072617.14756-1-lihuisong@huawei.com/

Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>

Pengjie Zhang (2):
  ACPI: CPPC: add paired FFH feedback-counter read hook
  arm64: topology: read CPPC FFH feedback counters in one operation

 arch/arm64/kernel/topology.c | 75 ++++++++++++++++++++++++++++++++----
 drivers/acpi/cppc_acpi.c     | 58 +++++++++++++++++++++++++---
 include/acpi/cppc_acpi.h     |  7 ++++
 3 files changed, 127 insertions(+), 13 deletions(-)

-- 
2.33.0


