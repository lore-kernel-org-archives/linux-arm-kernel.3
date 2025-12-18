Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801FED6ACF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Lcd65qdK3N3Syg4ISpKIf2L7mbIn3FDiBZgbtG7nCY=; b=pIB7GDoJWI+bX0S5y1ZBDCAxUZ
	1Kp3iJQ35Ao/dBrSLu0qm7VSXNxxUWESJSQGVwY2htlz8UAWQ+dPmvAT61ehXYP1QtK2zrKk25oj8
	IGRypFyxX4A4VP+RG5seRqRlBOSg3fb4UkDqPzFQ1O8HwIQojFwafVrNyd1xHv8nYA1/U3qXb1C5n
	hk8pmKJmaeOoL85a3gN60qHvIwK9kYb2BgJJ86aoetOPNIAO8tXrPISLS3L9Hnxf4VSVC0MGRwLB2
	f7z2fTIfLOMqcR/qz7X0h0wGkheGnXEP1mMbHja501Z2T8kWjgI/Ia7mOJ/lXjomHLH7g3Ax8OcTs
	cUjlSw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE2R-00000008WqC-1llR;
	Thu, 18 Dec 2025 13:27:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWE2N-00000008Wng-3oz5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766064443; x=1797600443;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=//80TLvazu3o6H3NRSjGjho+1pdoyVKmxiXPeB2mjFI=;
  b=LtHtJ79llHYAwkL0UXf93+BUIvn9vjSQdS72QsSBG/YzfnKoc3LrbI9T
   cVJhOvwxsfE0tarMTY3lfreSs4PL7OU1Ztd4BQA1+6V68onUw6GCry2ca
   YdVUNhqleOJCIaXRzeaQpBz2i7vXddjLE/KLbKOoReglPasd5Za+lvx0r
   i0IFZLPy/N/osDd+PXORQ9ssmKFZHaeoe4FTSu0yuToDVKZa9Q+Nj9EV8
   MwmCXCIEIf5oKee6BnNbq6KBMXFyjJPyCsxPZNrhBlpadiAfSplcFh4Kx
   s+a3s/4kBzCAHMiLIX44LErbCns1NLL0pr4hKsxOpVc3zyXFzlklTkxOk
   g==;
X-CSE-ConnectionGUID: ZrngCm+8QkagMlXA0BcJtA==
X-CSE-MsgGUID: NfJ73+JFTSCS7Ii8TwWKFQ==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="57519366"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2025 06:27:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Dec 2025 06:26:21 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:17 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:00 +0100
Subject: [PATCH v2 2/8] drm/atmel-hlcdc: add support for the nomodeset
 kernel parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-2-df837aba878f@microchip.com>
References: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
In-Reply-To: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=//80TLvazu3o6H3NRSjGjho+1pdoyVKmxiXPeB2mjFI=;
 b=kA0DAAoBPjnmE/d7ZC0ByyZiAGlEAPGgGn6eB10WHDtRUFszqHw8/L0r3xDXailGOZkWprGei
 YkCMwQAAQoAHRYhBAAwS8mJaaxbjW01TT455hP3e2QtBQJpRADxAAoJED455hP3e2QtTuEQAJYE
 WKxffO38DFMiYrdrgl7i7+s2unwYb3nx0CppcWNmGqFVtAAqWDr4845SSZxF+cxWGJLYhtyLQq9
 stvbbzJpxU8JFbmEwzvKGUtjsIa0ZsST0/tbYtTDakbg6Sxo4AZeydzWFGDeXw8uLSQI0OmTsRe
 ykahy6/Q0jhRxmJE6U0d2XF6NapTjVyVUGXMKxWv04jmJ1ArT8O7wLmPG3JmlhbLgPNKajCEugb
 wAwi6wVX33IjNIxoKOm/drsgTBgQZmi1DPv/92ZMn7SC/Xqe9spgSNKi25Fo/7OZwWejYLKmMxQ
 mh0BZWFDzSWhJOexfpoHtc9I7ne7QeKhLS0cOFxfavCkyCRWMyBDdkenFXVTw31IfMcvL0zEuCa
 5Z1aUMXk1kveJtXlIfZANsEETLYpYyhMqvU+bz4f+nYGW89Hjzk9XIrHndoI9+42tv3Mt7foqTz
 WJmTs1ViDMP/Ca/MmUM/AU6Jc4cZXZ63e1WhPZ166Dz4MO36bxOXM9bXnMhtQ6UJptrCOSFSPrG
 zjTwnOZ0OtG/wAqAjVY19QZCQoZcthWOmI9BYqmvN89TOGtX2Ehr3Vi2pVIuNOaJGGaM/uW2lJi
 MiVlX21RQOI/LK0OW6cgHi94BqUQ5hEJ+Tr50hRp6IXRegsPFbD4ODXP/S2pWIWSM5zulrWuxph
 PBR5Z
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_052724_000245_3F0A4BDC 
X-CRM114-Status: GOOD (  11.23  )
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

According to Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Dharma Balasubiramani <dharma.b@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 8ed029381c555db10d596efc8d52753c47767633..8ff582a394794aacf84f9e23fd59f123445926a3 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -858,6 +858,9 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 	struct drm_device *ddev;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dc = devm_drm_dev_alloc(&pdev->dev, &atmel_hlcdc_dc_driver, struct atmel_hlcdc_dc, dev);
 	if (IS_ERR(dc))
 		return PTR_ERR(dc);

-- 
2.51.0


