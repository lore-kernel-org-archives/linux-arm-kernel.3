Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC24CFC28A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Lcd65qdK3N3Syg4ISpKIf2L7mbIn3FDiBZgbtG7nCY=; b=ckqODIr950gam57sqmwSKfI1yZ
	K7HDv7mCJfmlet1Q90KRt1ZAPuUPOI4a1dRtkh2ZrtIgdU6PWz3RyWEgk7rqS5qUB3SY+3s//4QNI
	kh38/cMBcQn2mOpJUTLckxor5NF8RjRoa8muFaGNyEmyViShe6vTEc5zWU2ew26S7rf3xDWpN4tu2
	cYgsbKpk4rBA+moyLdso37J/erWkeJ8lYU3SnhpwyO0uAUP6JOqc1Y53sycdV6j/yxl/IJEcVTsli
	HwSDa3qqCdza9DbNS6CpwbSgS4sLwlfcoXaJv8Xyd2tU1yZwQ0d7NXcJj74+H74JQq868e86OoqCW
	bdMJF6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSiZ-00000008ZOI-2X4P;
	Fri, 21 Nov 2025 15:06:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSiT-00000008ZLZ-3UJE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763737589; x=1795273589;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=//80TLvazu3o6H3NRSjGjho+1pdoyVKmxiXPeB2mjFI=;
  b=ayarKmuf5AngIs1jAey49jAVFR+gNOj4JloFnsftXmagdf/XnSHvrsB2
   T2fJdjIKNVVbg7bwgrkjWuId+/f9NYa94E5XGnKG8W+eEB5tNNPbNVEgb
   N7majq5VR07AIfLzv3fYrYwhi0l8PFAFDtCT/IOlx1qjUrbG7ruTRsvEc
   e03iHN+t5ib6kPKoJwt8iBaz0exs5SHZe5077ehAyu4rHE300MHK2WW9K
   T2JMDPG2mSFKUkVBTsxOlfhAlUSSr63LzyQ3M9y+LVrAsWhK8YOp2+PNo
   /vJAkkq+DLSyppJRLrOLJN3m7EDW7HOSEcivqOeUQw58BnVHDDtsvVYxr
   A==;
X-CSE-ConnectionGUID: Ubo8wtofT1S9f5fCNZ+Rrw==
X-CSE-MsgGUID: gZ3q7jPvQZ2UJm2tgreohw==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="56053149"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Nov 2025 08:06:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 08:06:15 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:10 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:34 +0100
Subject: [PATCH 2/8] drm/atmel-hlcdc: add support for the nomodeset kernel
 parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-2-2587e6fe4d67@microchip.com>
References: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
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
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/Wx435lU4YdoP1U1wLYVVkjIgThXEiZrDNh
 hJx10HGQMqJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LVmZD/9xc9Spy6hS+6PVIpR2aBWpK1pbeCzt7GdY7RPvUtQJ50ErAwpoAk6gw9QfYTfdr7I7RhP
 Horf8ZT+0UvYNnN/lsZkLzNfCunuHzqgCxuYddEO3L9d1kTetlwruZbu2x3Wgw438cAu2GlIO/s
 FsrDGyWo274YN6t6N2smyNmeBS/XqzuAGtRx0wrVLnqL6bshf2LqTsgw5TqKmQivoj6H6aSHMQS
 ypTwk6aRN4iCjXLikwHkyj3yH4qgrFlvlp00fPRvtt/sxVLV4imFOIHLPcVL8LIQ1NG5YjAyx8L
 3d33IPZUak1i5NQn+mFOS9Swwt4oEtubB1tYgaVZX+UPSCjbHcnd8fkaCMKVfoB0CdgLV3oxgcX
 V9j5Z2QdxCFRqESCWpA708gs+PV3VjFYsLGI8vR/+8qotLvm0BWh/0CUChflGi5An0l5GtlSEwd
 N0ApHTQejTfp9c/KpoINc/r4rIGqcUMC+ItGZB9I0YgL5ngPqWary4avm63cJ/WdS249i83y60c
 H0zvKpFsfdTJ9ULifiqevM3O2owjGZM4JXywM+oE0VxCHBsVVLR+CX/ueF7cg2edvNOWH0rQZ4Y
 u/qxasf2VWZJM1vUI/UHUbKNjc92RDd4LL8actkbkY5Avx0OQzMC79o5XiOyjCqgKXWjczi+AWh
 kERr9QPgdxRkgAA==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_070629_890071_FE3A9280 
X-CRM114-Status: GOOD (  11.57  )
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


