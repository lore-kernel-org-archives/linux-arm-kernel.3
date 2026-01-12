Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203EFC9EC93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRubClLmzavqnfQ0UMjEODLIhXHLBrNqh2E4vhasu94=; b=2c3mZ+oxWEdIVWVJqRyYxL+MTk
	k09aSt+ZuO+Cd0oz3WRStna4vpkTNbPyAHvGBP5J62vD5loIxLoyjHUtk+3mEXlxK+AcnZBUggFbx
	7kJgRh4yHnqos2udAMrUNQLxY+V58x+jkseTHgHpQxudyOcrmQgfxquwkktX11uXXATK8pCPqygP3
	ATm0/zyeQweit7ZTVmxd7AyxH42SAv+znoVxI9HdYnd22c+7Wqvu7zcSr82cREYlqx1eSrVuH0ApB
	HrWux7NWSw+SuUAg6Tz0Hfj+kJfOAh17GBBCMzE6/BBHBmzqMa/SHwwFGr3dJpK22JozWc56f3qOD
	EGC6fJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIF-00000005RU0-0rxj;
	Mon, 12 Jan 2026 13:49:15 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIC-00000005RSM-2Iob;
	Mon, 12 Jan 2026 13:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225752; x=1799761752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s4D8kw7OoyHkWsenYF7E+9Z6vB4aK7eDBACFxTCsJgQ=;
  b=NbBz32xlKfw4WC5rQuACOLX2uAA5MKEq77HbfUzoi3mzZK0UfOuIHsya
   3ILZt71mIOg8W21+wuFmkxidY1qmSW/HKqujBrxe8KxF9ZmJB7GOOShrp
   lsBvw6+H7BuE+UI5uERhziG232wG8zLiLQRGsgYJ1v9g/8qA6gdsfLh+K
   que2njKiolt/zicehhpNI4afql50EByx2jFEQpNOcpjvDpgRKRanxZrTz
   875/6aolKIyyWmmhbpXOHs9g1141W8dI0H/+a+U1jZtjYLjysmaQB3FU6
   DXrRJAvWBPx7dmeTFc8qx95oELBw5vDYmJMcbTYPI3dAvNeP5FMNqEj/T
   w==;
X-CSE-ConnectionGUID: sD7b/lShQjqGG0dxpeRPuA==
X-CSE-MsgGUID: m0tsEvJDSKCi7cIJgdxQtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048262"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:11 -0800
X-CSE-ConnectionGUID: RSGfaLd6QVqd0LuDupeO2Q==
X-CSE-MsgGUID: JO2qZ07QS3e8APOkDDRiqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618599"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C1CDE9E; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 4/7] i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:12 +0100
Message-ID: <20260112134900.4142954-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054912_627552_7AF18CC7 
X-CRM114-Status: GOOD (  10.51  )
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

While at it, drop unneeded 64-bit division, all operands fit 32-bit.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d..b63ee51c1652 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -31,6 +31,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #define DRIVER_NAME "nmk-i2c"
 
@@ -419,10 +420,10 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	 * modes are 250ns, 100ns, 10ns respectively.
 	 *
 	 * As the time for one cycle T in nanoseconds is
-	 * T = (1/f) * 1000000000 =>
-	 * slsu = cycles / (1000000000 / f) + 1
+	 * T = (1/f) * HZ_PER_GHZ =>
+	 * slsu = cycles / (HZ_PER_GHZ / f) + 1
 	 */
-	ns = DIV_ROUND_UP_ULL(1000000000ULL, i2c_clk);
+	ns = DIV_ROUND_UP(HZ_PER_GHZ, i2c_clk);
 	switch (priv->sm) {
 	case I2C_FREQ_MODE_FAST:
 	case I2C_FREQ_MODE_FAST_PLUS:
-- 
2.50.1


