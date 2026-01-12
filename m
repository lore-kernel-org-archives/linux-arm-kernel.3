Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10E9C9EC92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs4xg16d/UeZGwRaqG6MsgU0QhqtrZXhq2dKXZL9o4A=; b=oJw5W5yXu+MCW1Po331qlqnapA
	tnBAhJ7WFjjbnKDzMti+0NgJ7ERKepRI/pYOjQQWHnoeNopMGMCaXWwpyls9T/NLc4cSvtCEmWTt7
	coinZyZB1Je7U1kXz3p9yJumlA4PTmlc9slE1GGst5PBaDTz9hePnyCMtROV9eLX0XFL9+y+MWdSe
	6cHwtbAb9L/lWeFtjJRKphx2nKaaC1+6s79xtvbuis1/mzStd1XJiSIjUXJbN7fGxZ1OglYRqFOfo
	+uvK6LFHwi0kAjP2SG+37jtue/lyakAI9Trsju7SFq3BqV3+xqtlRqlGQgObTJFfRn6zXwQqS0TZC
	6hzBOyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIS-00000005RnF-1Mm7;
	Mon, 12 Jan 2026 13:49:28 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIH-00000005RVV-2XfQ;
	Mon, 12 Jan 2026 13:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225757; x=1799761757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bvkjFMtSsNyVlD/gDmFcbP4PilFhSduRbbSoTWljZyA=;
  b=IBeUwzY+XWvqbIZn2DpXc4ruJP4f0U+5wfyqL1BSXsKqj8z46MSCt3wd
   nLL8J6RkFsEmVhOxf/7oax+El6yxGL09jn56JYWSTu5SwBWaqvGqbB0lM
   TX47QiDkcLCKJTZGDkCkxXYG0+HKZDiQNlth+8knZAkxs1YnOG7Pyp2fe
   n7wrG9B6t7nlAxYRSY4p/pNBHOe6+644LnrSZzunDNIi4buZHh2DMW1kv
   u53qwcOwzKqpshiCQRfnq62x2sa/JK0SraIJv51M8FGKPsivTyWK6hKJQ
   42RUzYb9eez1YnQ0np4E3M+M3J9U76VcMR7im2z1xa+Z7n5l8pcKZKds7
   A==;
X-CSE-ConnectionGUID: 6cnYFzfLT2mYvFeWux7hyQ==
X-CSE-MsgGUID: rJBkaY0mSeOObJSsaIegrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048328"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048328"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:16 -0800
X-CSE-ConnectionGUID: qxmDXGGUSi2DaE8/GG5AqQ==
X-CSE-MsgGUID: /vn6Qq1uQVGqJCdFULVPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618616"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CEC9DA4; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 7/7] i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:15 +0100
Message-ID: <20260112134900.4142954-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054917_677457_C0894CFF 
X-CRM114-Status: UNSURE (   9.53  )
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

Use defined constant to avoid the possible mistakes and to provide
an additional information on the units.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-synquacer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index 1230f51e1624..4891d68bf0ee 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -18,9 +18,10 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/units.h>
 
 #define WAIT_PCLK(n, rate)	\
-	ndelay(DIV_ROUND_UP(DIV_ROUND_UP(1000000000, rate), n) + 10)
+	ndelay(DIV_ROUND_UP(DIV_ROUND_UP(HZ_PER_GHZ, rate), n) + 10)
 
 /* I2C register address definitions */
 #define SYNQUACER_I2C_REG_BSR		(0x00 << 2) // Bus Status
-- 
2.50.1


