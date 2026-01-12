Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26053C9EC91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUiStCTPLcJqmnSIaShyUy0dCjaep8+ycoBFuxVobnI=; b=uTlkKGvWcT04No/acdqCjG2Km/
	4K/aYmirnTNQB4znnKAJlvWzeZZ3DnBdIk82G9430wuvUiYhF6ONFrUPHYYUb9x7QO+bNRe/xAYiN
	bUtU/UFqMY+G1W1JCocSdJzxH6r0+6BJ0MjwhgBMZpxekxKkHRUvK7vWJJ6/A0Yf9mjY9KMXWqPDI
	ikaRuSXpNtQpTGiIj9+lh+FrzzT6p6KHETIZVf4amuEAibBUhWZSuyTAm9jUJCjO8JQU+tydmSmXB
	paaQTMt1oG5EGsmxO8dBtpOQN9S4zfo028qaW8zVC3LnQcQCdusyXB3ZIcFd1MRKln3+X2tPXv+zj
	K/TPKgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIQ-00000005Rjz-31uk;
	Mon, 12 Jan 2026 13:49:26 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIG-00000005RVV-1dhS;
	Mon, 12 Jan 2026 13:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225756; x=1799761756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JHnL0FZuz2kBPQyoqrsR5hXiCOc45yoxM7G5SyPLrLw=;
  b=k0Mi+whWT61BdNbzCYMnIrPCz9FtWbyWz5tGH5mMU4EH29lXbWJCuf+s
   DmdM87GJpRc4e496+Q13TUvQwOXbybUFen7GavFRKfwpFghygbK2bwszl
   N3pXQC5Kg4q7+oxw53Purt2qPgz8EGgaKMc/Mzd2aHfU9hWJWtD67qBK0
   uTqU945hKm+ZE3dFFBByLQkz328+XkmdN0OiV6KHEi7tty6oPOyKqVIWP
   889bmIu5UihF1Bwo7jvl/zcEBoivCXx43Ckex0ABJqVpCJa4psi7UxVCa
   +dbswfFXIyrPKCrq95t59uEujrE+QGgbWNgD5DaFzykg7n726q9wLLD+h
   Q==;
X-CSE-ConnectionGUID: DlCWcSVQSDWJ+V76fL3DEA==
X-CSE-MsgGUID: +DNUD4sBR2SuIA57O+9IIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048316"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:16 -0800
X-CSE-ConnectionGUID: Ygp7+wInRp6lKcZ+jrQnnA==
X-CSE-MsgGUID: LmQZLVZ+QeStZkDFrDfqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618615"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C6143A1; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 5/7] i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:13 +0100
Message-ID: <20260112134900.4142954-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054916_457540_6538CC8F 
X-CRM114-Status: GOOD (  10.21  )
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
 drivers/i2c/busses/i2c-rk3x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index d4e9196445c0..fcede9f6ed54 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -19,6 +19,7 @@
 #include <linux/of_irq.h>
 #include <linux/spinlock.h>
 #include <linux/clk.h>
+#include <linux/units.h>
 #include <linux/wait.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
@@ -896,13 +897,12 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 
 	clk_disable(i2c->pclk);
 
-	t_low_ns = div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, clk_rate);
-	t_high_ns = div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
-			    clk_rate);
+	t_low_ns = div_u64(8ULL * HZ_PER_GHZ * (calc.div_low + 1), clk_rate);
+	t_high_ns = div_u64(8ULL * HZ_PER_GHZ * (calc.div_high + 1), clk_rate);
 	dev_dbg(i2c->dev,
-		"CLK %lukhz, Req %uns, Act low %lluns high %lluns\n",
-		clk_rate / 1000,
-		1000000000 / t->bus_freq_hz,
+		"CLK %lukHz, Req %luns, Act low %lluns high %lluns\n",
+		clk_rate / HZ_PER_KHZ,
+		HZ_PER_GHZ / t->bus_freq_hz,
 		t_low_ns, t_high_ns);
 }
 
-- 
2.50.1


