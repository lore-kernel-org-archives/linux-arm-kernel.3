Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD03CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsM1ztKXi3y+tX16b2iiEH9QqHspOPTUgYvJo8a7BhI=; b=Xp70soOTgLmVoNt0xUjliKz0we
	LfhQuHCwgprFoquIIQDQZfy3gdfzjoikNc2l8sL0z1nVb9c1Ce6FJcWSfpgB2fCE8X4+pchvxWUlp
	8THID+7v4fgJuN40hydC4LmDyeRPC8uuzs1TaZS3YJlSkJ8UjUbt/zz/CejhM/Jrhsgfb5a1vbOSG
	gAsCx1JacCMeriSzojnHAsogEJ9h9vUjNfLJ3WFBnLAl9LJa9GebNr/ZP2yOY5nje8AhGQtbP1VPw
	OSDYm/VGSUTYEA3eh1t3ZTtZGqa7C7Ik68nOdtHyAwfLrG+guPZNp/EoV57xxUzGeKAPUSZa9Xpwv
	kt8UN3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3a-0000000AgnC-2KWd;
	Thu, 13 Nov 2025 15:16:18 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3X-0000000Agj7-0nko;
	Thu, 13 Nov 2025 15:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046975; x=1794582975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/cxJU6vGAsQflUr/+ZE9vbpP5RWmAFwZncC3phpHqKM=;
  b=TaCmLcBQBh5PBiCKm6E/IljE1pxG4YivzorsYX8JKMpEwnWhjPUz3Wth
   8hEM84N/JqSwInEg6R+N45yd+O0AZw8vv3/PZE82VBYrQUsUjNyVhjJV4
   t4itenEWstT7qSVWOWaROAZIiax4toSgO5jZmUcTs+M72f7O8gxnrNSn/
   wDaOcNXcBr7LgSMIqYTXR6Z6OsXaR/Bgb34PLXklQXGZPZyFLN3GAkvzY
   QDMbzuIYfRydONBMH8R2zrf9GntmKP+Mr0nPdgR5uvtwIf9q+MzYVPAEv
   ZNnV1OO3MvTID1mkXjo8keLx52sC4GGQeJ+4JvOPf8MWjJNOwrKJJIFUK
   g==;
X-CSE-ConnectionGUID: u4r7AWdxQ0eOSbnTDIIdzQ==
X-CSE-MsgGUID: uVxPz+vGQMmxM+VhM6VwBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75740496"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75740496"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:16:11 -0800
X-CSE-ConnectionGUID: Jb5JgvfoRi6qyqGHFj6ZhA==
X-CSE-MsgGUID: tb3HM3EYSHO8il86T39iKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="189792115"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 07:16:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B224697; Thu, 13 Nov 2025 16:16:04 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Vinod Koul <vkoul@kernel.org>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 01/13] scatterlist: introduce sg_nents_for_dma() helper
Date: Thu, 13 Nov 2025 16:12:57 +0100
Message-ID: <20251113151603.3031717-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071615_244137_85416EA3 
X-CRM114-Status: GOOD (  12.70  )
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

Sometimes the user needs to split each entry on the mapped scatter list
due to DMA length constrains. This helper returns a number of entities
assuming that each of them is not bigger than supplied maximum length.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/scatterlist.h |  2 ++
 lib/scatterlist.c           | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 29f6ceb98d74..6de1a2434299 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -441,6 +441,8 @@ static inline void sg_init_marker(struct scatterlist *sgl,
 
 int sg_nents(struct scatterlist *sg);
 int sg_nents_for_len(struct scatterlist *sg, u64 len);
+int sg_nents_for_dma(struct scatterlist *sgl, unsigned int sglen, size_t len);
+
 struct scatterlist *sg_last(struct scatterlist *s, unsigned int);
 void sg_init_table(struct scatterlist *, unsigned int);
 void sg_init_one(struct scatterlist *, const void *, unsigned int);
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 4af1c8b0775a..21bc9c1f7c06 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -64,6 +64,32 @@ int sg_nents_for_len(struct scatterlist *sg, u64 len)
 }
 EXPORT_SYMBOL(sg_nents_for_len);
 
+/**
+ * sg_nents_for_dma - return the count of DMA-capable entries in scatterlist
+ * @sgl:	The scatterlist
+ * @sglen:	The current number of entries
+ * @len:	The maximum length of DMA-capable block
+ *
+ * Description:
+ * Determines the number of entries in @sgl which would be permitted in
+ * DMA-capable transfer if list had been split accordingly, taking into
+ * account chaining as well.
+ *
+ * Returns:
+ *   the number of sgl entries needed
+ *
+ **/
+int sg_nents_for_dma(struct scatterlist *sgl, unsigned int sglen, size_t len)
+{
+	struct scatterlist *sg;
+	int i, nents = 0;
+
+	for_each_sg(sgl, sg, sglen, i)
+		nents += DIV_ROUND_UP(sg_dma_len(sg), len);
+	return nents;
+}
+EXPORT_SYMBOL(sg_nents_for_dma);
+
 /**
  * sg_last - return the last scatterlist entry in a list
  * @sgl:	First entry in the scatterlist
-- 
2.50.1


