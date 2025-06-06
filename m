Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A924AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 07:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdKAueApaLj6qn/MZTFF3VbFObT57e93KhxiPZQFaQs=; b=AadaLovBbyuPSnWwt5Vb86AZ2l
	m6ATtA3PoYqiallRb2hYDdchS3z8dIMO/T+Ri+nO62d9M6hVgMNndbWTiLzUgfQdG9fkT+wmSb8nx
	rXViqxjjma395BqUmVE9Ud+LNXCNd+8Y3tNZWOT91zZPRFMT1N7X4htKqJxvfcbPoyzzrSwWrk+Qc
	bkpwV0lEQ5AjfSv4kMpRD4cjMOrHLxwPJWc0/ye1JIjuawGVJemsYBDYWTDetKMZinuC7/rlTMSuJ
	goyABgsa82fg73hoWYtZQtUgbcSugF9zTpKGVV9Scax9Lg8M/UGT9mig5hE38a+QHEDZy4MA4t+Mh
	GXxmGPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNR6W-0000000HFvT-42R0;
	Fri, 06 Jun 2025 07:03:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQdW-0000000HCrs-0sd1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 06:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749191586; x=1780727586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EgMVvjrq/bC4ZR8YwwCqCXYWKr03o6IaHYPp3OFjU2M=;
  b=XVE+6TlzVaMrfnPk4D0r9Q3R7P0nW5OsxTz3jx29GFNlG0MqcGTV0fQk
   OXM1h0ZwJZnlQ2N4u12PkWDVYJOdJt25VvZzEDjZrzCWlOvgqHVH1YmFd
   cwlPChySemcBi/OzTS17zVtOXLJmrQIHJQMAXzHTnwFpsoYru0dLywUfz
   Dsh5AnkO/ywNZAfZjxzJhK0qNecujVGkYUL+n4I/JbG81kC2aC/pRv6QD
   TH0l1wyNkh9rQDZZp9NqwU4/RIgrtywS/OLTXB7f2Fjh6Gj5cPkNbuVrL
   X5SfRqdN52HN27ji7sYBfAEnwG/aSC0xslMliAlFEEvEV29TDRJoxVfJF
   w==;
X-CSE-ConnectionGUID: 7bOu4lzXThWtLeFYOSzTdQ==
X-CSE-MsgGUID: HhPlYsP7QTKsbAc+X0ECAQ==
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="209983028"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jun 2025 23:33:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 5 Jun 2025 23:32:04 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 5 Jun 2025 23:31:53 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux@armlinux.org.uk>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <ebiggers@google.com>,
	<varshini.rajendran@microchip.com>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <mihai.sain@microchip.com>,
	<dharma.b@microchip.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v6 RESEND 4/4] ARM: configs: at91: Enable Microchip's MIPI DSI Host Controller support
Date: Fri, 6 Jun 2025 12:00:55 +0530
Message-ID: <20250606063055.224159-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606063055.224159-1-manikandan.m@microchip.com>
References: <20250606063055.224159-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_233306_326591_B4ABAC8D 
X-CRM114-Status: UNSURE (   8.15  )
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

Enable the Microchip's DSI controller wrapper driver that uses
the Synopsys DesignWare MIPI DSI host controller bridge for
sam9x7 SoC family.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v6:
- Rewrite commit message
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index ff13e1ecf4bb..78b7873d0e45 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -145,6 +145,7 @@ CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
+CONFIG_DRM_MICROCHIP_DW_MIPI_DSI=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_FB_ATMEL=y
-- 
2.25.1


