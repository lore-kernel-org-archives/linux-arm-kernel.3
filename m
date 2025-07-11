Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0740FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wz/8qaPAYoB9ZPHbwSihSrm3yhct/2CzuwFM8zklgIg=; b=zYkekmTn4J2RQxr3k3Odt4ddf7
	bWmKm7AaILJwr8TOkF1hl0cDNI/vWnEAeOpS2tXVvy9JpT6pifwVt0XBGkc++wKzOlv5vfEFGVAWm
	aB8kJljFYDs/Qwiv6NY/LVzV6P+AO+1gEYgkHW6j12OETyMVvYD43h5slvKtmxTwZeaIbh+UVIIRb
	kBGZ2dmKkZfLZV743ST9qfQNhLuV3DTNOvkpl0weQka01HAxL/zOhwwgMdhCIQ1EPvcgcR+0TlWa4
	w33lLpblan0zxijaF8WZ0DXfA3ft54Mb074rxzvGXj5lQp4G8uXk1KYZSdi9EwFmu/WFJ3w9o8VSV
	VLRcUuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJ4x-0000000FbjW-3C5E;
	Fri, 11 Jul 2025 19:06:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIcn-0000000FX9b-3Hd4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBFB12247;
	Fri, 11 Jul 2025 11:37:22 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85B573F694;
	Fri, 11 Jul 2025 11:37:30 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 09/36] arm64: kconfig: Add Kconfig entry for MPAM
Date: Fri, 11 Jul 2025 18:36:21 +0000
Message-Id: <20250711183648.30766-10-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113733_859624_502EF306 
X-CRM114-Status: GOOD (  14.11  )
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

The bulk of the MPAM driver lives outside the arch code because it
largely manages MMIO devices that generate interrupts. The driver
needs a Kconfig symbol to enable it, as MPAM is only found on arm64
platforms, that is where the Kconfig option makes the most sense.

This Kconfig option will later be used by the arch code to enable
or disable the MPAM context-switch code, and registering the CPUs
properties with the MPAM driver.

Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/Kconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..5f08214537d0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2058,6 +2058,23 @@ config ARM64_TLB_RANGE
 	  ARMv8.4-TLBI provides TLBI invalidation instruction that apply to a
 	  range of input addresses.
 
+config ARM64_MPAM
+	bool "Enable support for MPAM"
+	help
+	  Memory Partitioning and Monitoring is an optional extension
+	  that allows the CPUs to mark load and store transactions with
+	  labels for partition-id and performance-monitoring-group.
+	  System components, such as the caches, can use the partition-id
+	  to apply a performance policy. MPAM monitors can use the
+	  partition-id and performance-monitoring-group to measure the
+	  cache occupancy or data throughput.
+
+	  Use of this extension requires CPU support, support in the
+	  memory system components (MSC), and a description from firmware
+	  of where the MSC are in the address space.
+
+	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
+
 endmenu # "ARMv8.4 architectural features"
 
 menu "ARMv8.5 architectural features"
-- 
2.39.5


