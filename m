Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B62606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c1oHKmnH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MV7nwiJK;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rubo54JP;
	dkim=neutral header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rubo54JP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zwnkwYmhLzhEKJg+U7p50UnqjYbQ/FzJRIwMkHplZOY=; b=c1oHKmnH8QI8rQb0lm4zOLsjPE
	95GOxWmg8TjCPvaxgW1fd/S2/sdT91oGooQAZPp8lmwoeFD1yx2OfOQ2/NeeObiB7F5SSJhtrR0ot
	f3htemMTOeJ6NRHbQMELHaTJ6fpCrXWtQd8eSi/JVhrfwKjeoQkcw3b5EubbveVyibz3fmgItsS3E
	zwqvZkyZ2dqpirMQEdDVkTlESY8A1GNqiQ1pKAZpnCG667mDxUhG8K8l/hMHDZor/pcwrwWKrbOn3
	WgFSPpTUbD6WCXB1fgi+hi/nr5/VTIZPYMW9K6vkJgPAZEyaNbKhk4oAAbJyaKRgvkpxgXtXKy7LT
	f0Ggn2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoU9-0000000DkqP-2v2z;
	Thu, 22 Oct 2026 08:49:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoU6-0000000Dkot-2a0q
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 08:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zwnkwYmhLzhEKJg+U7p50UnqjYbQ/FzJRIwMkHplZOY=; b=MV7nwiJKxXx8HK8huRat3TrwCD
	7pYsGWIGIZGrowVYn1XFxT9ipsTjjgvQwSfUJtHipWz7VhG4QZKTb57806k4vgo9tvF1fdZIw2KsA
	IYr/ldeqXBudjq49C9ssVvg/CqbSdCUJbjD9ycuvvSgQH03pr0BtjhNi99XnzmYft+6efs+gwbx7I
	mP5xeiHM3ARdFT1gJeYBec/xxg1WYQUu8LA1w9YDxzqmZ3LDtknhdnifxkqrS3PXfGSRYMdJWuqcD
	zvMTEaWHfcJJDI53qtOhZjcGcIpLdpLG6PffoH2973lmk+9zeO2EsNK6DzhZ+ZD8Db3GBmLnxhIt3
	/MXFjXTQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoU1-0000000HI0O-2ecJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:49:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zwnkwYmhLzhEKJg+U7p50UnqjYbQ/FzJRIwMkHplZOY=;
	b=rubo54JPTGrIBz4b1PiDbWS16Xkx7CuU84EBhVhdvDGVyBFQOyHT1PNlvUi/RZCd2hd5ES5eD
	g0wkPRBp1tSNixcPk8GD0MxrGxtqCB6UmAY3pd7M587lQO/scb9ZsSBabtTtycrtkQPPMbzd/BX
	tV7iviiipHFuaAOxADqrJqI=
Received: from canpmsgout02.his.huawei.com (unknown [172.19.92.185])
	by szxga04-in.huawei.com (SkyGuard) with ESMTPS id 4j9KYj5hmDz126M3G
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 16:48:25 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zwnkwYmhLzhEKJg+U7p50UnqjYbQ/FzJRIwMkHplZOY=;
	b=rubo54JPTGrIBz4b1PiDbWS16Xkx7CuU84EBhVhdvDGVyBFQOyHT1PNlvUi/RZCd2hd5ES5eD
	g0wkPRBp1tSNixcPk8GD0MxrGxtqCB6UmAY3pd7M587lQO/scb9ZsSBabtTtycrtkQPPMbzd/BX
	tV7iviiipHFuaAOxADqrJqI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ73Xb6zcb3K;
	Thu, 22 Oct 2026 16:48:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FA1F40537;
	Thu, 22 Oct 2026 16:48:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:49 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 2/7] fs/resctrl: Add the L2 monitor events
Date: Thu, 22 Oct 2026 16:48:16 +0800
Message-ID: <20261022084821.4014873-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_094910_187526_456BBCB5 
X-CRM114-Status: GOOD (  18.73  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the L2 cache occupancy (l2c_occupancy) and L2 bandwidth
(mbm_core_bytes) monitor events, and route RDT_RESOURCE_L2 through the
same per-domain read path as the L3.

As ARM MPAM Specification said, MPAM resource monitors are associated
with a shared partitionable resource in an MSC, not with a particular
cache level: the level comes from firmware's description of the MSC.
L2 monitors were only missing a resctrl scope. The events are
exposed once an architecture reports the L2 resource
mon_capable; x86 never does.

Update Documentation/arch/arm64/mpam.rst to mention L2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/arch/arm64/mpam.rst | 23 ++++++++++++++---------
 fs/resctrl/monitor.c              |  9 +++++++++
 include/linux/resctrl_types.h     | 13 ++++++++++++-
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 67fe515ed501..f0697dedde03 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -32,8 +32,9 @@ Because the user interface to MPAM is via resctrl, only MPAM features that are
 compatible with resctrl can be exposed to user-space.
 
 MSC are considered as a group based on the topology. MSC that correspond with
-the L3 cache are considered together, it is not possible to mix MSC between L2
-and L3 to 'cover' a resctrl schema.
+the L3 cache are considered together, as are MSC that correspond with the L2
+cache; it is not possible to mix MSC between L2 and L3 to 'cover' a resctrl
+schema.
 
 The supported features are:
 
@@ -61,9 +62,11 @@ The supported features are:
   When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
   schema, it prefers the group closest to the L3 cache.
 
-* Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
-  there is at least one CSU monitor on each MSC that makes up the L3 group.
-  Exposing CSU counters from other caches or devices is not supported.
+* Cache Storage Usage (CSU) counters expose the occupancy of the cache they
+  monitor: 'llc_occupancy' for the L3 group and 'l2c_occupancy' for the L2
+  group, provided there is at least one CSU monitor on each MSC that makes up
+  the group. Exposing CSU counters from other caches or devices is not
+  supported.
 
 * Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
   L3 cache-id to identify where the memory bandwidth is measured. For this
@@ -82,10 +85,12 @@ The supported features are:
   have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
   cannot distinguish local traffic from global traffic.
 
-  All these restrictions based on L3 cache are due to resctrl, currently, only
-  supporting monitoring at the L3 scope. It is expected that going forward more
-  MBWU monitors can be exposed to the user after support for more monitoring
-  scopes is added to resctrl.
+  MBWU monitors on an L2 MSC expose the bandwidth the cache sees as the
+  'mbm_core_bytes' event on the L2 resource.
+
+  These restrictions are due to resctrl only supporting monitoring at the L2
+  and L3 cache scopes. MBWU monitors on caches at other levels, or on devices,
+  are not exposed.
 
 Reporting Bugs
 ==============
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f9f4d4486c1b..ee296c27c6e8 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -543,6 +543,13 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 			return __mon_event_count_one_domain(rdtgrp, rr);
 		else
 			return __l3_mon_event_count_sum(rdtgrp, rr);
+	case RDT_RESOURCE_L2:
+		WARN_ON_ONCE(rr->evt->any_cpu);
+		if (WARN_ON_ONCE(!rr->hdr)) {
+			rr->err = -EINVAL;
+			return -EINVAL;
+		}
+		return __mon_event_count_one_domain(rdtgrp, rr);
 	case RDT_RESOURCE_PERF_PKG: {
 		u64 tval = 0;
 
@@ -1032,6 +1039,8 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
 	MON_EVENT(QOS_L3_OCCUP_EVENT_ID,		"llc_occupancy",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(QOS_L3_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(QOS_L3_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
+	MON_EVENT(QOS_L2_OCCUP_EVENT_ID,		"l2c_occupancy",	RDT_RESOURCE_L2,	false),
+	MON_EVENT(QOS_L2_MBM_CORE_EVENT_ID,		"mbm_core_bytes",	RDT_RESOURCE_L2,	false),
 	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a5f56faa18d2..f31b8f2ccb8b 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -37,7 +37,14 @@
 /* Number of memory transactions that an MBM event can be configured with */
 #define NUM_MBM_TRANSACTIONS		7
 
-/* Event IDs */
+/*
+ * Monitor Event IDs, representative a variety of monitoring events:
+ * QOS_L3_OCCUP_EVENT_ID:     L3 Cache Occupancy statistics event
+ * QOS_L3_MBM_TOTAL_EVENT_ID: Global Memory Bandwidth statistics event
+ * QOS_L3_MBM_LOCAL_EVENT_ID: L3 Cache Bandwidth statistics event
+ * QOS_L2_OCCUP_EVENT_ID:     L2 Cache Occupancy statistics event
+ * QOS_L2_MBM_CORE_EVENT_ID:  L2 Cache Bandwidth statistics event
+ */
 enum resctrl_event_id {
 	/* Must match value of first event below */
 	QOS_FIRST_EVENT			= 0x01,
@@ -50,6 +57,10 @@ enum resctrl_event_id {
 	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
 
+	/* ARM MPAM L2 Events */
+	QOS_L2_OCCUP_EVENT_ID,
+	QOS_L2_MBM_CORE_EVENT_ID,
+
 	/* Intel Telemetry Events */
 	PMT_EVENT_ENERGY,
 	PMT_EVENT_ACTIVITY,
-- 
2.43.0


