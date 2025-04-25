Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E5DC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09rqSqAfaG0G179Zn3pdk09IZgTXsBY0qFv+DZ0rOZI=; b=BTbJLAMUNd2oZSNvYZ5zmcLUZr
	7ICJ2UUlbrHhUDnO/OXqgK/c3dFBtSBizXGSligpNzozsT52Aw8XQG0DkCe3bUv+jeA7tR5ms/d9n
	eGZFDFgACL2hpSqrqfzBe0Evlceed2IXFHQbynVqk37VtOp8XA6Bqrfzipd2YrXqcw2UMjw9Mhwow
	ccG5v1gxtCORRhvHHpc33YPScaRsbvh6oAzcsTo7nqH/3k2P8wR7mZCqiBe8Qt3B63wDn6Xr1swox
	unFfNkIvACYhlSQOntqp/wg05C6KYY0bF0PX5sgnhY8nWeGO6acP7KdD1EfVoxVzFi7ew60Egte44
	8esomFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89xb-0000000Frzt-2rdM;
	Fri, 25 Apr 2025 03:42:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89tz-0000000Frk5-4Auk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:39:01 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZkJPc71ndzQk1s;
	Fri, 25 Apr 2025 11:35:00 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C9BF1400D9;
	Fri, 25 Apr 2025 11:38:53 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 25 Apr 2025 11:38:52 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <acme@kernel.org>, <namhyung@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<mark.rutland@arm.com>, <jolsa@kernel.org>, <john.g.garry@oracle.com>,
	<james.clark@linaro.org>, <leo.yan@linux.dev>, <irogers@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>,
	<linuxarm@huawei.com>, <wangyushan12@huawei.com>, <caijingtao@huawei.com>,
	<xueshan2@huawei.com>, <prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v2 3/3] perf mem: Count L2 HITM for c2c statistic
Date: Fri, 25 Apr 2025 11:38:45 +0800
Message-ID: <20250425033845.57671-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250425033845.57671-1-yangyicong@huawei.com>
References: <20250425033845.57671-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_203900_184023_0C97CA00 
X-CRM114-Status: GOOD (  10.50  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

L2 HITM is not counted in c2c statistic decoding. Count it for lcl_hitm
like how we handle L2 Peer snoop.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 tools/perf/util/mem-events.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 884d9aebce91..a384a866a562 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -680,7 +680,10 @@ do {				\
 			if (lvl & P(LVL, LFB)) stats->ld_fbhit++;
 			if (lvl & P(LVL, L1 )) stats->ld_l1hit++;
 			if (lvl & P(LVL, L2)) {
-				stats->ld_l2hit++;
+				if (snoop & P(SNOOP, HITM))
+					HITM_INC(lcl_hitm);
+				else
+					stats->ld_l2hit++;
 
 				if (snoopx & P(SNOOPX, PEER))
 					PEER_INC(lcl_peer);
-- 
2.24.0


