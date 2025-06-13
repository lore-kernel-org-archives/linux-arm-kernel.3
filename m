Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D787C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7f4CT74Y+o3nXDgWu1V9kGFaYDDQC422GWIVBdFRDn8=; b=A4lkoFdozEx3jaECsboQQqid7I
	vaLvopq1iyr7yMNSRj9XFjO0QE11EZBobbBN4QaWkwkLcBNCJmvBsrRcNHBqblssndorqzH+KBE6J
	1tC8s2ePp/i07NNeEay6mIA+T90Honb2hrxoB+HANBgwzQqZHotcitBhKCYEgurjHwr21GQHCiQAS
	Bsk+1koVRj+yj+7A4eSVz8koqu67Gkid8IID2wiehNvZ8V5vahYkCSLlZy11wsoAglY/W4hJFP74R
	CWMEsTtOz6vEIpDBGFOBjIP4ZVOJ7YCFw7l97WRN/zfEBsqaL0So/ESCdHakgJENA08iNXydIE6JZ
	CQkqc8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4IJ-0000000GTQU-0l3j;
	Fri, 13 Jun 2025 13:18:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ44y-0000000GRwr-2TBL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:04:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9450B1CDD;
	Fri, 13 Jun 2025 06:03:59 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2FF13F59E;
	Fri, 13 Jun 2025 06:04:18 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 5/5] cacheinfo: Add helper to find the cache size from cpu+level
Date: Fri, 13 Jun 2025 13:03:56 +0000
Message-Id: <20250613130356.8080-6-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250613130356.8080-1-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_060420_667772_6E37FA7F 
X-CRM114-Status: GOOD (  13.05  )
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

The MPAM driver needs to know the size of a cache associated with a
particular CPU. The DT/ACPI agnostic way of doing this is to ask cacheinfo.

Add a helper to do this.

Signed-off-by: James Morse <james.morse@arm.com>
---
 include/linux/cacheinfo.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 9c959caf8af8..3f1b6b2e25b5 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -148,6 +148,26 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
 	return ci ? ci->id : -1;
 }
 
+/*
+ * Get the size of the cache associated with @cpu at level @level.
+ * cpuhp lock must be held.
+ */
+static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
+{
+	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(cpu);
+	int i;
+
+	if (!ci->info_list)
+		return 0;
+
+	for (i = 0; i < ci->num_leaves; i++) {
+		if (ci->info_list[i].level == level)
+			return ci->info_list[i].size;
+	}
+
+	return 0;
+}
+
 #if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
 #define use_arch_cache_info()	(true)
 #else
-- 
2.39.5


