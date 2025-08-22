Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84829CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xx8od5jh0EAN2GpLqQyWXi97qHP4eXKRM1o7wX2U5B8=; b=MCAyFwr3Y9JgiuDeTlZNPswiN/
	3hGiEMkv08pKmuVLsCVjIwIt4FTWYo/fNf5ZXI7LuX3XlYAMIvHK5Yst9uAlA1YOBL0PL7DIIw4qj
	uEOMh13H3B516yfrx9tmkc+33HK0ZRuXNyITKLWM5tiA2i6WAGOQYd6+2n73pskhm2qqFnYCOCsvO
	lzWlZ7F4RGW/xuINOeYJrdLwmlAHQGQeKHAg+9siZKNsqH14IhjZBJjrf6SqaxyKwD0FuQapGgluY
	VxeN7J/r1AYUvzuW5tICCmt4ud3hhR7WEsEiYFcbuWcheGXBtbIQNB72e7KMmWlAi5km8ZMj6N0GP
	AKEf9pBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphsf-000000048XZ-0nY1;
	Sat, 23 Aug 2025 06:37:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTnB-000000033AF-3ZFJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 15:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xx8od5jh0EAN2GpLqQyWXi97qHP4eXKRM1o7wX2U5B8=; b=ZaTxlzanBxe5KXTd7A4ZnCr6O4
	ZdGb22GPgD6tgbNK/OnDzkNT4muyntVg5X1Y6UUQ/sDANi8Kvk144lmctJsqEiqAkUtaNrPIsW4Fx
	ajEnSb3+brWM2l0v+puX63I2xUjg9ASuhnCDIVy12WpCjxR0hVqPF/x2H1uqRnhtlmGWunyzsCRb3
	SkAmZHCqnsWFo9VaLI7H681rArXpdrEC9O42+GjSmGlJAnc5RYDJqWQxtPJLRSgJbh3IKRNt6BJCT
	m7DZ46w1l1mLfua7TKYtj4RETTrpSCZPd92pwbae3LWvrf4JY+T8Ogb5tuid8d0nEeMY+3t1o14Vp
	DCIui77A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTn8-00000000yms-2i6z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:35:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A0A415A1;
	Fri, 22 Aug 2025 08:34:49 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F7913F63F;
	Fri, 22 Aug 2025 08:34:52 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
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
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 07/33] arm64: kconfig: Add Kconfig entry for MPAM
Date: Fri, 22 Aug 2025 15:30:22 +0000
Message-Id: <20250822153048.2287-42-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_163458_916324_DFC3581F 
X-CRM114-Status: GOOD (  14.55  )
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/Kconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a6..658e47fc0c5a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2060,6 +2060,23 @@ config ARM64_TLB_RANGE
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
2.20.1


