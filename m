Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39291C9EC93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKwXr5ft4VTB6ti6+SzlPyE6ZKhaexskBDbJoL2DlzE=; b=YqXZ2gSlqkOKAfKwMQd3Dz8gos
	KdLgEo8+kplyzXsWNbdHgknU9ntnz3mVOmm7HxCF+tvf/mbTgtIxvDpwzaZlekgjH0v3FoUC0UAG1
	QWtRVNjhFjMTiTM+Xtn3AyLseFStRsHQVwjul4VvkzOInRkqAuOVwJWJ9OxBGCWH069kte/HIyHOM
	mowErBNN/jgD4lACihLHf77nOQ5yPq9xhKQbVa2sYXdG1r8nZeCqwv29EnRm4wzIZClsM1ABBeXxF
	dDd+/+IHn+WMyJ7rMz/1j3pVfPjYUIb716fF0GzFmk9HJRW+bF/c9HKaNoIHl+ssyYGciQhRcVd/P
	8Fqusu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIP-00000005Ri1-3I9y;
	Mon, 12 Jan 2026 13:49:25 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIF-00000005RSK-4Akp;
	Mon, 12 Jan 2026 13:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225756; x=1799761756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZqRF2S+uC/la4xASlNwAVf8XwHR045VHyV+nkWo2bqE=;
  b=oHhFFFOVUZsc288H224CdO9qpTWUTitU832Nyqjela4CxSx+4uHNo+0s
   uaw2CKXwUc4+O621IXOvAy7OYxI/lJWGyU06gsc2Xl1XhORTS4XrdYECa
   eRDKrX2/dJpGRBAKShOVsvXdAV6LDR1PB3w+zQd2bPjWWNk/H/TLx7BSu
   JZ+wL4cPrwx1cntcmLZqxYD4qwuGV0BbF5rR/VRew904b40H4ZYIgpqLb
   EBEeZIAp+Yp4ptDor1hmqEobAWyXXcDzp5C0o2cXVgIh7QIIfoVc8Pf3t
   F1VW1UdKcFK45PDUEYy1cC9y2zbXbSZDiaUrIQjE2k8B9H33ZjCOlyMao
   g==;
X-CSE-ConnectionGUID: +hR+iq0RTp2kt971Shn+rA==
X-CSE-MsgGUID: MqmKGRKVRv6KYi/cKspoIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80604534"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80604534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:16 -0800
X-CSE-ConnectionGUID: 09zSswo8RW2YuLa4zP79hA==
X-CSE-MsgGUID: iW3vkA1mTMqjQfUAGX7uIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208568103"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 05:49:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CA8B5A2; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 6/7] i2c: st: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:14 +0100
Message-ID: <20260112134900.4142954-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054916_092976_52A3EE0F 
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-st.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 97d70e667227..751ea421caaf 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 /* SSC registers */
 #define SSC_BRG				0x000
@@ -285,7 +286,7 @@ static void st_i2c_hw_config(struct st_i2c_dev *i2c_dev)
 	writel_relaxed(val, i2c_dev->base + SSC_CTL);
 
 	rate = clk_get_rate(i2c_dev->clk);
-	ns_per_clk = 1000000000 / rate;
+	ns_per_clk = HZ_PER_GHZ / rate;
 
 	/* Baudrate */
 	val = rate / (2 * t->rate);
-- 
2.50.1


