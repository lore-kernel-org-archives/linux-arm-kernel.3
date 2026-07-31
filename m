Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D842C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU+tsc+RzMuyFa7007MrWHfZ9LjITE8iUwHkl/UCfAM=; b=smmNlMnffAJm5s+xTxEt/D+clI
	HoVVRxOjRjzisX41DIwSsVaJZ09Oh67q89XlhWdSnAgBg/ZnG7JxrbIU0jbFVp6PYf43M7CHKuctL
	D1iN4rv9TEvH3GMQXs3HqFlpRPHcMbXQa+ihq9xMooF7EV0eCPXe6koskMnwmXI6iDDJ79O3DM9lU
	9tozbdZnd5/WBclgEfPIlmXJzMlWh7EMLB5AKna3ODO+ZX8QuTP7cdjuPJeW3cHD8UEl17Oa+IXfq
	wSYxteBx04N3Ts01U9dU0ahL7lx80rpT6r0lfPdwGxtNyiWX+uGiy57Vc87KHbG/B5ACS9VBNw/wp
	AiFxwJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprQQ-0000000DIr6-3jjT;
	Fri, 31 Jul 2026 17:53:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPw-0000000DIaZ-3Bjb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:53:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4A031595;
	Fri, 31 Jul 2026 10:53:03 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 020CE3F66F;
	Fri, 31 Jul 2026 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785520387; bh=6EfGYUXnKKBHHuYowjEcCKBALcv0osir6Ea6z6Kf8rE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTLCEDE1Ps8dQVe4Hox+3nPTmum8Kyyex0QDAF+Bip2eNzX4XM1J/FeR34SJzI+SF
	 9snuoxNt7sNekDBi3bK8h+gPFygWO+RnGWm5FylJoKgj/fkIrjHy2XEHPMJawZheV5
	 WxomhmEYFyWUoDcOovpb4H1ZxgjaWR/RR1jELB1A=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com,
	will@kernel.org
Cc: james.morse@arm.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	gshan@redhat.com,
	tan.shaopeng@jp.fujitsu.com,
	sdonthineni@nvidia.com,
	jonathan.cameron@oss.qualcomm.com
Subject: [PATCH 5/6] arm64: mpam: Add memory bandwidth usage (MBWU) documentation
Date: Fri, 31 Jul 2026 18:52:42 +0100
Message-ID: <20260731175243.904730-6-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731175243.904730-1-ben.horgan@arm.com>
References: <20260731175243.904730-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_105309_245180_96FAEEAF 
X-CRM114-Status: GOOD (  14.01  )
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

Memory bandwidth monitoring make uses of MBWU monitors and is now exposed
to the user via resctrl. Add some documentation so the user knows what to
expect.

Co-developed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v4:
Add paragraph about the future.

Changes since v5:
Add R-b's from Fenghua and Gavin
---
 Documentation/arch/arm64/mpam.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 570f51a8d4eb..67fe515ed501 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -65,6 +65,28 @@ The supported features are:
   there is at least one CSU monitor on each MSC that makes up the L3 group.
   Exposing CSU counters from other caches or devices is not supported.
 
+* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
+  L3 cache-id to identify where the memory bandwidth is measured. For this
+  reason the platform must have an L3 cache with cache-id's supplied by
+  firmware. (The platform doesn't need to support MPAM.)
+
+  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
+  makes up the L3 group. If the memory bandwidth monitoring is on the memory
+  rather than the L3 then there must be a single global L3 as otherwise it
+  is unknown which L3 the traffic came from.
+
+  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
+  match the topology of the L3 cache so that the cache-id's can be
+  repainted. For example: Platforms with Memory bandwidth monitors on
+  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
+  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
+  cannot distinguish local traffic from global traffic.
+
+  All these restrictions based on L3 cache are due to resctrl, currently, only
+  supporting monitoring at the L3 scope. It is expected that going forward more
+  MBWU monitors can be exposed to the user after support for more monitoring
+  scopes is added to resctrl.
+
 Reporting Bugs
 ==============
 If you are not seeing the counters or controls you expect please share the
-- 
2.43.0


