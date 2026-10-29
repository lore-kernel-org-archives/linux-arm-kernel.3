Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4DB606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qco4Ovxn;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2NDqIrmr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rDEtaspdOXY+TyY6QFCs+29HkRKM7qOXYrR2YBy0WWw=; b=qco4OvxnPkNaxf1hrk/xg8V4Tx
	UIX81Rp4jIACqjrXJ09aV4jevxVkizVZTwOPmV4aez+M2k/pkzUllmJfO3Nl9PkLF6AXtJ96bK2II
	uT0M46Y4GD430XEpgvtS3hf00wJuT44oJ/T9qlWRYJ+PuAJSx2ufhWCBoHexjhDT3Cs0qXgbCx6fA
	r675JwViPkSUWTYi27TpI7IYa4ESQdhMGGmrswa5YZ2A6qxoaZ31/Lb2dHUPWVUT0Ce3+q2qdG8T4
	+gIrRoOrO5NNMaCnFWCPg2mBcHWq/aKPAnUih7fnMYSDJzh7bp4u8oLrzrAjaa3I98DyXJoamFpG/
	4ZGYm/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPON-00000009CO7-0RRT;
	Thu, 29 Oct 2026 12:38:03 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNH-00000009AYn-2Zck;
	Thu, 29 Oct 2026 12:36:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rDEtaspdOXY+TyY6QFCs+29HkRKM7qOXYrR2YBy0WWw=;
	b=2NDqIrmrlk0+/8bOSrpJRXhgzksB84oNUrMJxlH7Asmr7apEdcrz12cdWg1uTHzrcA5bh+qjo
	jMJsAzZvsymPZGNw4uHmrxcmOsCNGsnfMw9x1rEKg01lJ2reiIjilggp0eyTsdmft1ufYR1wlBu
	vBEMZJBL9Oi9g5F4eou/19s=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jFkJC1sQNznTV7;
	Thu, 29 Oct 2026 20:36:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DE86840586;
	Thu, 29 Oct 2026 20:36:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2 monitor events
Date: Thu, 29 Oct 2026 20:36:11 +0800
Message-ID: <20261029123611.1108424-20-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053656_016728_1A60BCEB 
X-CRM114-Status: GOOD (  16.00  )
X-Spam-Score: -2.1 (--)
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

resctrl can now monitor at the L2 scope, so MPAM exposes the CSU and
MBWU counters of an L2 group as l2c_occupancy and mbm_core_bytes.

Update the list of supported features. Say why a bandwidth counter is
assigned for the life of the monitoring group: rewriting its filter
restarts the count.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/arch/arm64/mpam.rst     | 23 ++++++++++++++---------
 Documentation/filesystems/resctrl.rst |  6 ++++++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index e445f4078ee1..9c0a08ef74bf 100644
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
 
 Command line parameters
 =======================
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..c07d8f7223ff 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -495,6 +495,12 @@ with the following files:
 		bytes) at which a previously used LLC_occupancy
 		counter can be considered for reuse.
 
+If monitoring is available at other cache levels there will be a
+"<LEVEL>_MON" directory for each of them, with the same "num_rmids" and
+"mon_features" files. For example an L2 cache exposes "l2c_occupancy" and
+"mbm_core_bytes" in "L2_MON". The counter assignment interface
+("mbm_assign_mode", "mbm_L3_assignments") is specific to the L3.
+
 If telemetry monitoring is available there will be a "PERF_PKG_MON" directory
 with the following files:
 
-- 
2.34.1


