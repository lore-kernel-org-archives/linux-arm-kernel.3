Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0B5CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGcKzy66/ad1dSIdtq5qJ/h9XgDG1eOVLqadNHxudqA=; b=xhUK02rzuLeJGTCzI/bBOlTnEK
	ruhnEy165gqbbwwBWQ84M4GqEqihz1tSlnrmTvhIBTDsF3/8+H8yEXWUGn+UV1EvAxcRPXDofpjR7
	b4Uz6EvXXel9WymRn6CtsHfXwH4ByIj4tfmsuMlG+3duNRaYD9PkjXSy+/8iun3hNIeZkLg1kyjkf
	GJ7DgjbXe8kuXaNkdkYV4O9GpRM5pa+i4nNv/SR3rLJEt5t30wmOy2jlWugUkUvUhBEIiQzpzjlXu
	4AveBX+Y1ZOstsH/SMuXGalMvkrzhOQ9YnAjRJiVAVU0bi9W20RNMx0w8P9HGM2ZB/s2UP2Tz26T/
	IiaWNJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMu-00000002uoi-2LIG;
	Thu, 07 May 2026 06:37:56 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMo-00000002ufW-3XAT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:37:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GGcKzy66/ad1dSIdtq5qJ/h9XgDG1eOVLqadNHxudqA=;
	b=4m+577lWR5gkOuN+DcEO0u76lmZh/FEg8XWwUCRBNLHe3+Fkr/jMFI6wBZjVxuRGyEGEV2i0y
	t11UmY0UQkaKwhTFfRv8DLGWCArHAYNvBzyy9woAwTdNzaskAC3aEvMaCyF9FrRjvWKE8ie5vZ8
	mwEIJATP2BBh0h+2CzcX2co=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gB2SB1sn7znTV5;
	Thu,  7 May 2026 14:30:34 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 89E5F402AB;
	Thu,  7 May 2026 14:37:40 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 May 2026 14:37:40 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 7 May 2026 14:37:39 +0800
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
Subject: [RFT PATCH v2 3/7] perf-x86: iostat: Move iostat arch-specific implementation to util
Date: Thu, 7 May 2026 14:37:33 +0800
Message-ID: <20260507063737.3542950-4-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260507063737.3542950-1-wangyushan12@huawei.com>
References: <20260507063737.3542950-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_233751_613624_33A81DC2 
X-CRM114-Status: UNSURE (   9.09  )
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

To support cross-platform iostat capabilities, like record/report on
different platforms, architecture-specific implementation of iostat
should be moved out of arch directory to get built. Build scripts are
changed accordingly.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 tools/perf/arch/x86/util/Build                           | 1 -
 tools/perf/util/Build                                    | 1 +
 tools/perf/{arch/x86/util/iostat.c => util/x86-iostat.c} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/perf/{arch/x86/util/iostat.c => util/x86-iostat.c} (100%)

diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Build
index b94c91984c66..358541beaa0f 100644
--- a/tools/perf/arch/x86/util/Build
+++ b/tools/perf/arch/x86/util/Build
@@ -7,7 +7,6 @@ perf-util-y += event.o
 perf-util-y += evlist.o
 perf-util-y += mem-events.o
 perf-util-y += evsel.o
-perf-util-y += iostat.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
 
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 70cc91d00804..c7e5ada3800d 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -127,6 +127,7 @@ perf-util-y += thread-stack.o
 perf-util-y += spark.o
 perf-util-y += topdown.o
 perf-util-y += iostat.o
+perf-util-y += x86-iostat.o
 perf-util-y += stream.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
 perf-util-y += kvm-stat-arch/
diff --git a/tools/perf/arch/x86/util/iostat.c b/tools/perf/util/x86-iostat.c
similarity index 100%
rename from tools/perf/arch/x86/util/iostat.c
rename to tools/perf/util/x86-iostat.c
-- 
2.33.0


