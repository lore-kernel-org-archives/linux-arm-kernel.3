Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D7C61DD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZpijvlSw2xNIsfL6IQ6jLABbu5LnLQd4TTudOzRHd8=; b=nbOaTH+W7mV0mzmrhAUMgwFx95
	mmL2lyd3FqreTopLx36zbP4jEtZoq8bePjxkUG8mX6vUnnYw9aSNfZU1mI2FgUbv5qiVJ9SQjR+YV
	B7LTnsJKRNIsJH7IMpvP47NAfIbQ9lYqk4eUqsHEgjKJzOyl15RZ3YLeki6vlCk+1l184pY2ZV9nf
	Wi5b/8FaN9qBk2GY6rs4CVY5mAxnxbjUHt4x0pcxcSPHNNKjqzZ5MpRHnDBGmawukpwzMpMYhVt2T
	sA7mTP7lrZeuiO1LAGfc0R0ThY4ZQzzDaRrV9TJrXzsDyyVQ6pI1I9c75KHjcPzFiaL3KECXa7Tx0
	eittAvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuO-00000004JsT-3Q1K;
	Thu, 27 Aug 2026 16:24:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuE-00000004JhH-1Zk6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mZpijvlSw2xNIsfL6IQ6jLABbu5LnLQd4TTudOzRHd8=;
	b=X57abhX2xJestC1P2bJzdl/sfZqWq7S2z/DnrQR2S6d5a9iNjQpzAs2nrZVVgINhqAiK9mlEe
	8Un9AB4ywk8zAwPRdHmdZkkfEjyoRP/9lB50ajE6W2cmsfC1XR+YoRU9zHH+zlyOCfqwx3cge8Y
	0suoxFbuxnwTqeM9jTi9eDY=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KV1gnVzJ4673;
	Fri, 28 Aug 2026 00:24:14 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id C345340572;
	Fri, 28 Aug 2026 00:24:35 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:35 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 01/18] mm: arm64 add Kconfig option for kernel replication
Date: Fri, 28 Aug 2026 00:11:41 +0800
Message-ID: <20260827161158.3618409-2-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_092446_557664_6B433E17 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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
Reply-To: artem.kuzin@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 mm/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..1302268b72b6 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1446,6 +1446,16 @@ config LOCK_MM_AND_FIND_VMA
 	bool
 	depends on !STACK_GROWSUP
 
+config KERNEL_REPLICATION
+	bool "Enable kernel text and ro-data replication across NUMA nodes"
+	default n
+	depends on ARM64 && MMU && NUMA && !MAXSMP
+
+	help
+	  Creates per-NUMA node replicas of kernel text and ro-data sections.
+	  Page tables are replicated partially, according to replicated kernel memory range.
+	  If unsure, say "n".
+
 config IOMMU_MM_DATA
 	bool
 
-- 
2.34.1


