Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB77CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHaq84ewHb1MO9RdExeQEKDLUZGS0ij+mmnBqifrVPA=; b=X3GH7cuIE2KMeBWvW7zshiKCBG
	KizSBdkxnVLG8NkZx+K3mxlf4LlKSiIVoWGYoANv1g6uvnUvjAvwD0rEXXm4J4tbUW+03MXHDrdow
	Vrlc2l0dslCXw2EkEwH7qwv65+e3fGtO93T4JDyPkCJm63gt9r8NYbaiY4incCk3NM/nLPtGpiC4V
	LAK6IrqTrGB9QbHNi2Q8nIQXyQ07ye+LSvJhONVzDcbU6yRVxKuaTJ7rVtdcR680c+jY7+wju+1mh
	hByR4KOcdU1sqS57ApfjRCOeoLRaK+34JzTWoxqpOY2DS3dewp36GvvXqvO9xxlWB9+9P9IP/4HE2
	rGKJ53zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPI1-00000005Ca9-48IG;
	Mon, 10 Nov 2025 10:38:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHw-00000005CW9-3nrj;
	Mon, 10 Nov 2025 10:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WHaq84ewHb1MO9RdExeQEKDLUZGS0ij+mmnBqifrVPA=; b=ICFaDab6Vf83z08eXiqBCZL/Em
	YUOkAVWmRFoevSnA2XmVaUVEN7tCZyHhmdXwoCSxMYCgKPbNdQu2krnais/g74QjV52voVtuTmNx2
	ZHC+SP/BAcc4P7loE1P+hLftAGjkbMbiNBY9wObBFP4KKk6pbkHxEefp6rRLw3fhk+ky0//5YVkfD
	CHt/ogBRKm23FPLxavADcvkaAvjQ/5R87QNTSyVVL6j+h5scg9i7PhHCGeef6HokCE/Bf9n+QbnZA
	V3gyQu239Ugp4ZHgKRxDlmBrdubjSaKXjbTml4q9GvC7wxLVlYGEFnYkTtVGEjd8Dpu8+nNzl++sK
	RCBJVbdQ==;
Received: from mgamail.intel.com ([198.175.65.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOQD-0000000AP5U-1igS;
	Mon, 10 Nov 2025 09:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771098; x=1794307098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=okEedZx1EnwftUj5MeqZGlbG2fo9V7Tn4+bnq/5DJvo=;
  b=YHaO8ImcWeRTzCD2decgSTs2ETBKlmx9uMaeA6gCB1EcgjcYESmyWOF1
   LLrX+t4f3k/txHRiqR5WUYbmOL8DmFmwmVVHe+8zAn7q8R5aD58TbU4Sb
   j/45aPT+qLl19GjDyLrjv5R3WAQu6X0Nbi3QTRUWlDzrpk4Q21AJShz7x
   PUTMIIlJxEMZtnt4AB/4XUOtaFLpoLty9AeC0m+Gx881mKwOkJDpgcao8
   jyMDhbdcS3U8GhEpezdUHGTUS6hGncq/e8F2Nlhm0wIEvvl1et2Lu0qx4
   8XffdQrQAYYgz0hnWNtXOVgT+vczuJbqpYA0OAzAF+DjpKs15sycUG9LS
   g==;
X-CSE-ConnectionGUID: GKwrCHevR8CROgHiinSooA==
X-CSE-MsgGUID: 8kDDaDp1TwGhHHlWYEIxAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="76270135"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="76270135"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:13 -0800
X-CSE-ConnectionGUID: 0FzUCnuZTWC9x35V0/Pj1g==
X-CSE-MsgGUID: N7zDuTyBSiyQNna+/YVpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="189361329"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2025 02:38:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 699E696; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Subject: [PATCH v2 01/13] scatterlist: introduce sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:28 +0100
Message-ID: <20251110103805.3562136-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094249_899888_46F93514 
X-CRM114-Status: GOOD (  12.98  )
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/scatterlist.h |  2 ++
 lib/scatterlist.c           | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

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
index 4af1c8b0775a..4d1a010f863c 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -64,6 +64,31 @@ int sg_nents_for_len(struct scatterlist *sg, u64 len)
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
+
 /**
  * sg_last - return the last scatterlist entry in a list
  * @sgl:	First entry in the scatterlist
-- 
2.50.1


