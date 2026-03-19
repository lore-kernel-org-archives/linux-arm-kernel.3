Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28971090253
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XTWxwwyFRV0edc/CsRaOQfQYJO3vq7buLBrqA+5Rcc=; b=ivb/ln5vLtY9hNgdZPti14hphE
	Hqr9fXTUE0o2j+xdU8wuPOEZyO/PIfFK8L5wj7jc0OWie5H9JPds+A2ORE1XR9FqbLCGAUMdVTIqr
	cX7DC6Qn2qerE1QWYgi3bgjN5KrSXmvkvTj5Vcmk6d3vX0bGv6jGNJA8AReA0e042ida2V7lE1g75
	vQRVxXrmHDxZjP9CQ3z72cOtKvwVVTVdKAz994oEQN37Rg/hzq0iFCaffxtT2dVzrRELPjkpCcMvu
	5etCofYTVnvVywZXgERG1a92HEdg2+zJD0xEN/3eh3CCPoAdX1z0tE1bvzTlUdCZJK7zjzdfH3iFd
	H9pwbAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GfP-0000000B7rD-0Oz7;
	Thu, 19 Mar 2026 16:56:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GfJ-0000000B7no-3js2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:56:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C78F520E3;
	Thu, 19 Mar 2026 09:56:02 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC4043F7BD;
	Thu, 19 Mar 2026 09:56:05 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	zengheng4@huawei.com
Subject: [RFC PATCH v2 5/5] arm64: mpam: Add memory bandwidth usage (MBWU) documentation
Date: Thu, 19 Mar 2026 16:55:40 +0000
Message-ID: <20260319165540.381410-6-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319165540.381410-1-ben.horgan@arm.com>
References: <20260319165540.381410-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_095609_970742_A0F18B39 
X-CRM114-Status: GOOD (  12.34  )
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
---
 Documentation/arch/arm64/mpam.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 570f51a8d4eb..208ff17068c4 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -65,6 +65,23 @@ The supported features are:
   there is at least one CSU monitor on each MSC that makes up the L3 group.
   Exposing CSU counters from other caches or devices is not supported.
 
+* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
+  L3 cache-id to identify where the memory bandwidth is measured. For this
+  reason the platform must have an L3 cache with cache-id's supplied by
+  firmware. (It doesn't need to support MPAM.)
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
 Reporting Bugs
 ==============
 If you are not seeing the counters or controls you expect please share the
-- 
2.43.0


