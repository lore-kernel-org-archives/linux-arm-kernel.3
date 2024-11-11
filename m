Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7468ED12D7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 07:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqjyntrpShwgAOrbVOtpFJ9NHfn8MmMD6MGkP1shDC0=; b=a9qJ+N7VWMpZxV9rtGtEyCqcpf
	RMD6p3Q+3rXYZ0z0gB9gP6LzCcuAAMtl2vbKBwbhcafzvFlnAbWapAeo6B3gk8IDIvBclaRQcwTcW
	lDWj6d/uFfQnKcqdOXGEZp5M/E40H1I1sLZAdCoTlY213UiH2FQVAzzOSd/T6u4vAw3+nf1pmFfQU
	voNq/okCwEq+tGx2nwUr47RQ/V3H430DWQb3O5uXZfBVBHLhhASj3IZhYtd3hXEWg/ZeFcjUizFsk
	W5hUcX7fBASUnIc06UJKqhz+Gb5RRYPh0HTx/nZa5r8CGKSVAcGxEFChwSFC2Yf9N7Tj9sU75+pKX
	a8Gtwbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAORp-0000000GYYr-1Ivl;
	Mon, 11 Nov 2024 07:02:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOL6-0000000GXbW-1guG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 06:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731308157; x=1762844157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=to+XTp4IW8kAmb6A0rvJQ9ZF113lclX2U2Y8R7lLOIE=;
  b=u0Gq3tSRSAsdu0Oso1kPLMPLXF97MlZKkW+GliL0uMHK6Kr3INB+dYCp
   MpMjRQ8MSdhdl30BTl7kQk0k63LhOt5nKiH2DaCj2T7SfKtA6+m3H0ISb
   za2j5vuQdcLzRkt9bufsdl3linE5e/4JRodo1K0+XGBnm2P2foTfB+OML
   T1BkYIYtCNmT4EEWL8aVD1DNKo1zthtlme7KRmgqwzBr9SwkkcnCo33q8
   6V4HLrBycjFcVTzzh6K1kO0OgkJYe/dq5lqqFtlTz6/iDtN6GxhIn2nxW
   Bxi5iUBz4nUjqLP/mS6E0lFHbdPXKLks2bBfpMYRYBFTeZPUii3B/TH0j
   w==;
X-CSE-ConnectionGUID: ep4875LgSx6tm9VmeD6HJQ==
X-CSE-MsgGUID: rkveuh0RQainZYLgjezJmg==
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="265270148"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Nov 2024 23:55:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Nov 2024 23:55:44 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 10 Nov 2024 23:55:35 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux@armlinux.org.uk>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <dharma.b@microchip.com>,
	<hari.prasathge@microchip.com>, <varshini.rajendran@microchip.com>,
	<arnd@arndb.de>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v6 3/4] MAINTAINERS: add SAM9X7 SoC's Microchip's MIPI DSI host wrapper driver
Date: Mon, 11 Nov 2024 12:25:01 +0530
Message-ID: <20241111065502.411710-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111065502.411710-1-manikandan.m@microchip.com>
References: <20241111065502.411710-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_225556_504842_F6EEB527 
X-CRM114-Status: UNSURE (   9.04  )
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

Add the Microchip's DSI controller wrapper driver that uses the
Synopsys DesignWare MIPI DSI host controller bridge for the SAM9X7
SoC series to the MAINTAINERS entry.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v3:
- Drop T: section
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5dc00438ba3..77228b16425a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15272,6 +15272,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
 F:	drivers/gpu/drm/bridge/microchip-lvds.c
 
+DRM DRIVER FOR MICROCHIP SAM9X7-COMPATIBLE MIPI DSI HOST CONTROLLER
+M:	Manikandan Muralidharan <manikandan.m@microchip.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
+F:	drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
+
 MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1


