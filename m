Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8504FCD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mB+jidnHrl/N0FlGSUv0inUMZByeV2hru+vnQ9bAklg=; b=f/jpaVnDV5r3VzFSLTputx6XXL
	/0OQUR8UJaGdqcuNh8Mvh8RHncLaaz2QCTQAFvLHsQ2k29BVtcPA4h8tY2Z200Hos2C1TNZxoiLVb
	4ruXGP89US59OuI8fS9whJERonAaEwr5W//lBIsNKTQ2Y6AYBBdZiSlCaLFagVRrlPruJTIh0RPsH
	5SRqzKgmnmDjKMsBDjVkFxqxK7BriUjenKEkfoS4/PpP2ymOkuBViy/2KL1LL4EPxFXeyiKZyg37g
	GNud21VhO5CfaNWcigmzlJ5aLNRPFPddFt9o5bVVRNqYQp6NGYDhT1tcTwAWtOHWcpMZBU6fYRAW+
	cmASj34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLT-00000000oLo-2w2Q;
	Tue, 19 May 2026 09:02:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLC-00000000o71-2TXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181338; x=1810717338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GN9Elk55Ckw9oiHQjukAbkq2ymh10RJ8TnEXN6zUYIA=;
  b=vxaIDucgvdVv4mccruMZjCUPWhT7MvHnrVeSu/eF+p1ZIreXRa9x23ee
   EXq2WqDOVE9BwhAhsHGpHxRwqLA6RzXtV2wFjIlVAJHH4eRzBifZVZatL
   CG4QCZEgv93p3YxwqbKXNI+2svjNgLgOD9uxdpZkuvIu8ouQ3UgzXfux4
   BXvevjjxKQmgm6SewRmDMTVk3V/+rG0DThVTqAhfX6AQe7LtjEhAVj8u+
   sugHJb6U7uKsgH5VGOWPl3zie2vmMTC8ZfOOTEpubq58ir+aBESFCm59L
   sLEX5sYUJ46EkP2542BCOJnoUoK3l0iOd2xuCRXiRZx6WjaQKJzoikq9i
   g==;
X-CSE-ConnectionGUID: cRB7afV+QCu/Kd7rCmC/lA==
X-CSE-MsgGUID: VBVl8s9QTi+FiNqzdZOfJg==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="224955560"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 May 2026 02:02:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 19 May 2026 02:02:17 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:02:12 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 4/8] drm: atmel-hlcdc: define ATMEL_HLCDC_CLKDIV_MAX and fix divider fallback
Date: Tue, 19 May 2026 14:31:31 +0530
Message-ID: <20260519090135.1188405-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519090135.1188405-1-manikandan.m@microchip.com>
References: <20260519090135.1188405-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020218_691241_D954DD8D 
X-CRM114-Status: GOOD (  12.44  )
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

Introduce ATMEL_HLCDC_CLKDIV_MAX to replace the raw mask.In the divider
overflow fallback, restrict the clock source switch and halved rate
retry to SoCs that support the 2x system clock path.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 9 +++++----
 include/linux/mfd/atmel-hlcdc.h                | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index f30138da1ed8..c7e77bb2941a 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -117,11 +117,12 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		div = 2;
 	} else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
 		/* The divider ended up too big, try a lower base rate. */
-		cfg &= ~ATMEL_HLCDC_CLKSEL;
-		prate /= 2;
-		div = DIV_ROUND_CLOSEST(prate, mode_rate);
+		if (!crtc->dc->desc->fixed_clksrc) {
+			cfg &= ~ATMEL_HLCDC_CLKSEL;
+			div = DIV_ROUND_CLOSEST(prate >> 1, mode_rate);
+		}
 		if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
-			div = ATMEL_HLCDC_CLKDIV_MASK;
+			div = ATMEL_HLCDC_CLKDIV_MAX;
 	}
 
 	cfg |= ATMEL_HLCDC_CLKDIV(div);
diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
index 07c2081867fd..8e86219293b7 100644
--- a/include/linux/mfd/atmel-hlcdc.h
+++ b/include/linux/mfd/atmel-hlcdc.h
@@ -50,6 +50,7 @@
 #define ATMEL_HLCDC_CLKDIV_SHFT		16
 #define ATMEL_HLCDC_CLKDIV_MASK		GENMASK(23, 16)
 #define ATMEL_HLCDC_CLKDIV(div)		((div - 2) << ATMEL_HLCDC_CLKDIV_SHFT)
+#define ATMEL_HLCDC_CLKDIV_MAX		((ATMEL_HLCDC_CLKDIV_MASK >> ATMEL_HLCDC_CLKDIV_SHFT) + 2)
 
 #define ATMEL_HLCDC_PIXEL_CLK		BIT(0)
 #define ATMEL_HLCDC_SYNC		BIT(1)
-- 
2.25.1


