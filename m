Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C32ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ngAYffa1yoRXkD3A+58buw0rAaHWd53bAkBFdTtZvA=; b=GLE91MPeYRQhOWHwrrDEhqBmdt
	o0/mE3hctYhpYZpomvu3JXz/GNn18lmiUXYYdrRGVI9yetZhrfdukUr4xkjqfZLe2n9NKow+ZXbKN
	Kg4FC8QJ1QCVKgkKR38uwyW4dEla7++SxdCkxd4wTP84/WqzgL4QPv2ktl5ZKbTDM/gRsiEW5toFP
	DDgvhFTR8cYRGNgZU9cOYcpiJefSdKyhw+7jQ2XkLRs45lVr3ljtwa7zOmoKcNr3Q/TzbAEMaQ04f
	X9pCEw/5zD5RpJg3vez6pmFaUHQgSHX/ttUXRO4GaUqYra+R/2bFFclmcMy6fQwWIN5XFTYk/IvU+
	O7U5qPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3ik-00000008AwF-3fRt;
	Mon, 18 Aug 2025 17:32:35 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo25e-00000007x5y-3FA9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:48:08 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IFlxAV2748841;
	Mon, 18 Aug 2025 10:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755532079;
	bh=9ngAYffa1yoRXkD3A+58buw0rAaHWd53bAkBFdTtZvA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H1Y7bYkC2iNKRS9JqNtclq8Hhw6VnZNrWrfJ0WpwaP2319teF4+iq3Z5L/OJeK3xq
	 psyJDLcwDHnWOx1L5RgCcb5DjDL+0OzJQrKK+dOlBElGpnY1YoILvqUcUnxJKhGeL6
	 Vhzm9b3Dqkh60dJRNd14fN8dHehGn1nVAcMxilqg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IFlxiw619538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 10:47:59 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 10:47:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 10:47:58 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IFlk8m1551018;
	Mon, 18 Aug 2025 10:47:53 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <neil.armstrong@linaro.org>, <jessica.zhang@oss.qualcomm.com>,
        <airlied@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <s-jain1@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel: panel-simple.yaml: Add Raspberry pi dsi panel compatible
Date: Mon, 18 Aug 2025 21:17:44 +0530
Message-ID: <20250818154746.1373656-2-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818154746.1373656-1-h-shenoy@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_084806_859449_3E61EC73 
X-CRM114-Status: UNSURE (   8.79  )
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

Add RPi DSI panel[0] as a valid compatible for simple-panel.

[0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/

Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1ac1f0219079..65f486f2bc9d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -268,6 +268,8 @@ properties:
       - rocktech,rk070er9427
         # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
       - rocktech,rk043fn48h
+        # Raspberry, 7" dsi panel
+      - rpi,7inch-dsi
         # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
       - samsung,ltl101al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
-- 
2.34.1


