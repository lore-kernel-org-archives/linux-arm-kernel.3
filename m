Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7477C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA0yOVAYbs6l0ZckmIs0Ox//Qo1RL1DMIwaKQmmFu1c=; b=hIsraQ3Z6p8a9f1GmQY/6vn84c
	PS19WKnZxxc5g9Jr2OA09YSRqiY7JXuEmrzVY4WOFQn5FKb/wjiDg2le0YnFbq6tSpAnCmydS6lG4
	NzZzqm9FpMIDrO37DHhNrZf4V3kH5qjATLRGDKi3nW2Cl81Di75NIjJe7NLxFObGtL+RbYCXtzi5e
	2WLCC11PMyGtSb9h603uPPCZ7Z4xYLVZMEzo8J79+lPqPAQj/0UTdHLJx4zVM2uaIzaydqtJWOsW/
	NHbrL+4J2VZBAtJ32ChZpUr0QrBkgN8hJkFn/9hBCDdJPEvOq+oa6Jkbx7R5FO+qv72bVyGpIVDaS
	ZS6wjDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6t-00000005quy-3NsZ;
	Tue, 15 Sep 2026 10:09:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6r-00000005qt6-3VTP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hA0yOVAYbs6l0ZckmIs0Ox//Qo1RL1DMIwaKQmmFu1c=; b=W3W2oQQm9ZKjCpOijonStDSU63
	AoMHUKB/2JBOeLxHNHRNUfX1q4uPXdz0loyg+aE1/XClJwJmMdN6PF8Pynqp8CFQe2WonX9T/meJP
	95KOrdTVBuc9wYNY7qT1XqNuZ7F1azdqpqjs3GYTxQ7Q/XQhX+WpMzBaHr2DrRIJ0n1Y3AvwP3EDg
	FRIOtiNAQ7ZGm6dyo5P+1sgNa/5wewDdnylqxSEKfr6fCPjagLs6LXLvIf07OMKvMg99JE11EBXxi
	tDXagnzefkeOQDy4K095A9VcbOETRsw1GId9CCMAwzNyvHRTNsIcO9UsZtpdABA/YJXn1s3mMy/XE
	O/QIrTYA==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Q6o-00000006X19-2gUX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466990; x=1821002990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0d8AW04j6ZeFgJ4c0uEx4Ne8a9AlVDa/j/DF24QsWEE=;
  b=PbF+CoRFV6+ZL2xfszXZIk/HFSShEg/CEYXvDZEM12glGu50oWqSKnrM
   gNCJyws9XU11AYjwJEIkwRDn6P0CGjHNbXyyuHhDGGl9PndfJG3LJD+BD
   OsVHYxF4M4x+jHpGZOUtuatv20d+jUZUDpNfqMtm7ISjtp7HqtT3LLF4o
   tZxtLuKYx/UpPGvWNoqTiiurs6zk+ZZi5Z6Ts53tqZZ2HSgq7vkBeyThE
   LVEct/HL0hbtnqT0PnKoJqgP/HQPsbyYoXEKXgANeaLRmfc3/3bxG0Z8f
   MOd/Jb0xpvAc2jAbGe3WjBrZU2/jbFdl8rUvP2NISM3s8ki6E1YB3S+Em
   Q==;
X-CSE-ConnectionGUID: pPV8+LPWSUKk8BC1Kd4zFQ==
X-CSE-MsgGUID: /mIkcK+OSAyCikUQKPwDjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115360974"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115360974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:47 -0700
X-CSE-ConnectionGUID: 6KAa62Q0Q8ql7BY528Qu4g==
X-CSE-MsgGUID: tKnat4EfTZSUkMp5WOouHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271517612"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2026 03:09:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7D1F3A5; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v1 7/7] dmaengine: Remove deprecated dma_request_slave_channel()
Date: Tue, 15 Sep 2026 12:04:28 +0200
Message-ID: <20260915100931.3593242-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_110951_094952_1C7BD451 
X-CRM114-Status: UNSURE (   9.34  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

No more users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/dmaengine.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index c50497ecd52d..7596ebdac466 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1763,15 +1763,6 @@ void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
 #define dma_request_channel(mask, x, y) \
 	__dma_request_channel(&(mask), x, y, NULL)
 
-/* Deprecated, please use dma_request_chan() directly */
-static inline struct dma_chan * __deprecated
-dma_request_slave_channel(struct device *dev, const char *name)
-{
-	struct dma_chan *ch = dma_request_chan(dev, name);
-
-	return IS_ERR(ch) ? NULL : ch;
-}
-
 static inline struct dma_chan
 *dma_request_slave_channel_compat(const dma_cap_mask_t mask,
 				  dma_filter_fn fn, void *fn_param,
-- 
2.50.1


