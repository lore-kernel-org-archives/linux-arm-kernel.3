Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E8FCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32Cha62zLMX/sE9V8V6uhkKRa58D9zB/ZV8x/qJtq+0=; b=YlTVBHzU8VxLt6uluLabrS0qF8
	hCErCaonP/oUieFOdzZBusyDIGrZ0WegE7j2lMyz9QbqYTfCDaeMSdpYS7/LmmBZsENG9r8e5XbHB
	gXA470dvLCoHHqELbzz/LACuS76Vs0y49Nxdx4YO0wX/roh1ar2Wy7cxz+26caL9/YsZSli77QiVo
	V9KYuHoWvX5t58lG+rvUmv8iswqINtVnkgqkpKVFQMgaRoq1eEpJdemBrElV4X26U3QSzVj7OGzn+
	mpcLZpAQd8RfIACy0VBEpIqzcGOlwOe1lDZTN3mv3M9p6yAIOQJSdF177U+74F2VhEQvtmpvPOv0N
	Os5lgrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrz-000000047WT-3Lso;
	Sat, 23 Aug 2025 06:36:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTje-000000031ZD-3Tkx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 15:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=32Cha62zLMX/sE9V8V6uhkKRa58D9zB/ZV8x/qJtq+0=; b=jCMa6ADizcLriUwT588XGZj/CG
	Fqogp2W8pdVh8Osf+4/EaR6189X6yEvk0xY4SZs+FSeF6Iqowm2OTXwM15RwQ37XGQByRM7TZAtYc
	MGvWtpjZb4tTqZsd0LCxvNOjf+Oo1d+mQcTaR1oEgECo8fPOoVHacebqLvqDQ7/GUmlIMrk1KIjyB
	akslp+u4emhvOBxZGynVkOYxqh067ejNu/lFzEAgbNTYSUEXLrireEpvpIoyE9yU1vBHbQgoLxNwd
	aQMkl1bt3pWHsVaqJB85N1rK1D/FYmp7iq8mFTleg8mevbriS/uKhQpYsYSOUJJwCECF6YEsaRpLs
	ZKZPf14Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTjb-00000000ye5-1p4h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:31:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D773F15A1;
	Fri, 22 Aug 2025 08:31:08 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAA2C3F63F;
	Fri, 22 Aug 2025 08:31:11 -0700 (PDT)
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
Subject: [PATCH 02/33] drivers: base: cacheinfo: Add helper to find the cache size from cpu+level
Date: Fri, 22 Aug 2025 15:29:43 +0000
Message-Id: <20250822153048.2287-3-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_163119_774456_CBEECA6E 
X-CRM114-Status: GOOD (  11.01  )
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

MPAM needs to know the size of a cache associated with a particular CPU.
The DT/ACPI agnostic way of doing this is to ask cacheinfo.

Add a helper to do this.

Signed-off-by: James Morse <james.morse@arm.com>

---
Changes since v1:
 * Converted to kdoc.
 * Simplified helper to use get_cpu_cacheinfo_level().
---
 include/linux/cacheinfo.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 2dcbb69139e9..e12d6f2c6a57 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -148,6 +148,21 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
 	return ci ? ci->id : -1;
 }
 
+/**
+ * get_cpu_cacheinfo_size() - Get the size of the cache.
+ * @cpu:      The cpu that is associated with the cache.
+ * @level:    The level of the cache as seen by @cpu.
+ *
+ * Callers must hold the cpuhp lock.
+ * Returns the cache-size on success, or 0 for an error.
+ */
+static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
+{
+	struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, level);
+
+	return ci ? ci->size : 0;
+}
+
 #if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
 #define use_arch_cache_info()	(true)
 #else
-- 
2.20.1


