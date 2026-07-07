Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3158EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+33hMeHs3BEv01WTcju3yTqg9cS4Wi4qJadm19fJTs=; b=sT8GBKNt3UwRp+P2pCjZ7H3yrP
	XHOfzRp91x1rZGwqQdot4k6wEokUGbgACJsqFCjEgwtZwGNMZew4oavie06EBbb8CDEjEW4OHn20G
	yhVedPH9BwO4gSJS/5wCPAu7RoCmujYIkVcFt/TRA44c7A2PW4ZxkVSI5+Zynye7p2r7b0VqILz5r
	6WgjHip1m+nKCjcdbufFPmKIfwchSbW/0MYuXlG7WHra8Qk+0pzmuWVPxRyyILVQoagcbRB2fqsIw
	/vBFPyMu6iA/i0NNf95byTiNshTJUbO4/UicpdDtVjvbW9GKrALykcvDwsTrIxj9ZcQMzeSQn1dLo
	XkNzZo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bo-0000000FSPz-2wFv;
	Tue, 07 Jul 2026 16:25:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bm-0000000FSNp-1Vnr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:25:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35DC61BB0;
	Tue,  7 Jul 2026 09:25:13 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23B083F7B4;
	Tue,  7 Jul 2026 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783441517; bh=skf3xvc9C8uPR46EyGjHSQzNuuoVBCCGuuQu/WQtEu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDkhUOlQChUiQ9ej3yEoI9DWPC1qnAx1rN7MzMOTLqboLSyuVYGrwZULmuxe8e6/u
	 xkgK3Bn8iF+JxmuHnkfNQTdCVNpe3RMn5fftpmhoNBsedaJoZ2oxpVC19BwdaInQkv
	 tLJbHHBnTaQiHEJFRfIhNA8uuPzvPv/nx280PYmo=
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
	jic23@kernel.org,
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
	zengheng4@huawei.com,
	x86@kernel.org,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v5 5/5] arm64: mpam: Add memory bandwidth usage (MBWU) documentation
Date: Tue,  7 Jul 2026 17:24:40 +0100
Message-ID: <20260707162440.12132-6-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707162440.12132-1-ben.horgan@arm.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_092518_492460_40CB142D 
X-CRM114-Status: GOOD (  14.10  )
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
---
Changes since v4:
Add paragraph about the future.
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


