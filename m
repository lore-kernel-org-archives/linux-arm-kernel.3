Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A81C9EC92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPo3kpXRu+Pt5ATvmTS8pDOmw+GZCFooH99w6q4H0tc=; b=T/lPz2IefVEJORDxKDn4yT/jiV
	QgrFHspgCJkqSVywXM2IFZ+kgx7ZLyYFGC7PnXPfrBlQBFXJH5qPz5fkLL+fYW/OuU1v2QTq1wsqc
	mjTUx4B3CTlDtKD8nXTNf4nqHxUrn7e84hWS5LiVZ0odoI8mIaEdYDVODVZW0Dz0PJTBY5zX2Bmu5
	PBabR+DyP9Lr/HXobrkaCfjnynz7XA9zxvdaKHzM6V4SWl0kveXlJnlJSliZtXFAIVkh8sUMSAqND
	X1ABazw9BUOwgwwc8W/7cdeLBw4XAVs6gUqeGNW7e+9pEutvM+AYdUmaRpCr77oQoVp7YT4IrRcxV
	OP7Er+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIO-00000005Rg9-3iWG;
	Mon, 12 Jan 2026 13:49:24 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIE-00000005RSM-3wiZ;
	Mon, 12 Jan 2026 13:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225755; x=1799761755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aiS8gJGj98x4YF0TjH5ep93m3zw75AdG3q/DYsX48BU=;
  b=XdhBpf5k2WYN8eCnvWdxa3QokeYcdJuG0ItNBfY6DeALnimTN/RV/3zH
   CorCqdTZxbk/KYy2fFaTgF3qpeI9WmEEE1bM9NnkNNZijmxYWL7mbboI0
   YEwJVpJhRehpVN6bT5NfWUkRFQ53aFIr6sxFh7F6KwAlnbVKjY1OZvDfo
   9UXlDAIy6iS5FIMwtB2Cn1QTH6ZoBRSfhxLcRPvqdO3O7cev2eCMHWxew
   PWz5Mvv8hOcUy74+mT/4nsN3UFXRCDuxFtLgDKeq4IAiuojNDX7b6g3N5
   daq4hFh/9qhi46h9dGu7dzaZsME5ma4WWErOigtoSLSWJwMtG0zJczEnd
   A==;
X-CSE-ConnectionGUID: bwndbjBfTRKYYQ6i7O6FhA==
X-CSE-MsgGUID: 5L0cpFzlTFeNispLQ6y27g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048305"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048305"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:12 -0800
X-CSE-ConnectionGUID: z96OLkJSTgCwr15rdYtM+A==
X-CSE-MsgGUID: T0ekkUYUT62isAvklhoXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618612"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BD2BE9D; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi@smida.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v1 3/7] i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:11 +0100
Message-ID: <20260112134900.4142954-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054914_986418_8C87C395 
X-CRM114-Status: GOOD (  11.31  )
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

Use defined constant to avoid the possible mistakes and to provide
an additional information on the units.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index aefdbee1f03c..cb4d3aa709d0 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -24,6 +24,7 @@
 #include <linux/scatterlist.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #define I2C_RS_TRANSFER			(1 << 4)
 #define I2C_ARB_LOST			(1 << 3)
@@ -685,7 +686,7 @@ static int mtk_i2c_get_clk_div_restri(struct mtk_i2c *i2c,
  * Check and Calculate i2c ac-timing
  *
  * Hardware design:
- * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
+ * sample_ns = (HZ_PER_GHZ * (sample_cnt + 1)) / clk_src
  * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
  *
  * Sample_ns is rounded down for xxx_cnt_div would be greater
@@ -701,9 +702,8 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 {
 	const struct i2c_spec_values *spec;
 	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
-	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
-	unsigned int sample_ns = div_u64(1000000000ULL * (sample_cnt + 1),
-					 clk_src);
+	unsigned int sda_max, sda_min, max_sta_cnt = 0x3f;
+	unsigned int clk_ns, sample_ns;
 
 	if (!i2c->dev_comp->timing_adjust)
 		return 0;
@@ -713,8 +713,9 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 
 	spec = mtk_i2c_get_spec(check_speed);
 
+	sample_ns = div_u64(1ULL * HZ_PER_GHZ * (sample_cnt + 1), clk_src);
 	if (i2c->dev_comp->ltiming_adjust)
-		clk_ns = 1000000000 / clk_src;
+		clk_ns = HZ_PER_GHZ / clk_src;
 	else
 		clk_ns = sample_ns / 2;
 
-- 
2.50.1


