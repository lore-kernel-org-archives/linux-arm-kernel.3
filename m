Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hfVg6S5CJnyo7yEt3ekiJpLUo6gHb6MkazeFuTaLUug=; b=vPxTXeKDlif3CEMjsHBjcHgKQK
	+YWg3W3LZ66lPM681w1EZJPj+c0CIKCg+xaWpwB2lQGwtDUVGp6IPLc1ULcYDQWTj4WLUYtvcq+bQ
	3bGJ4saiUWlG6TjA90JpPBNvSV4KlsG/7CGclgLW6ypdB6jmCYDqv4f1fjX3J6S7y9Ixhfig2BDm3
	GYFACJzS66pnnmwCRyHxGkKNchMVoqUUC7BFDBRBbfuynH/XJ71rOS3THp/15gyh3byw7+dJs2QER
	UljroLLm1ReLjl7hYNaZu9MWdB+TQs1j7NEPV8lM4gIKfiGG9jVPl/0ogl8E3XaHitZ+kIxF1zOvw
	L7+Q2uvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeIU-00000003qCz-3cN5;
	Tue, 01 Apr 2025 16:17:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeEu-00000003pSZ-2xSJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743524004; x=1775060004;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oSwJs4scoL8ULhTOhuRgce9k9EhyWpP90w5Fz+liDCo=;
  b=02uDrfNgt865XCOSasTd3u2LxJjFg7n7pktlJYB24b2HF/IlTVnT+zJx
   BD6lWgOaFWpo9TkPDEL/H+84qTjkMYbHOij8i9oli7yt8DGpCNUekujcZ
   1u3U0A+8DZVKTIFbNtMKR7YAEcNQkfb2Ltf8htUBSvO05JGyOiIUaVBHE
   gonAjK3lmWJhWc0k/Xr5AxJ/oSdReZse9siWEURTSA3upF+tLBeDlHLbn
   eN5vgrB+qXXVGVQYhjCnJcWGq9gvypHokbHfZ7GOD6UClI62ELoAMP8OQ
   YHNntcj8mLP/Xu9lp2RuKKsIEYtj8kJDqxEeuQLeuP2y/FhK6puENrsp+
   w==;
X-CSE-ConnectionGUID: ggLzNIpETriZ0zPViMY9HA==
X-CSE-MsgGUID: rWQOGm/mQu2gEKSfpww8yQ==
X-IronPort-AV: E=Sophos;i="6.14,293,1736838000"; 
   d="scan'208";a="39512774"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Apr 2025 09:13:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 09:13:01 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 09:13:01 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <onor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <nicolas.ferre@microchip.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 0/6] Enable FLEXCOMs and GMAC for SAMA7D65 SoC
Date: Tue, 1 Apr 2025 09:13:16 -0700
Message-ID: <cover.1743523114.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091324_967284_5D6B540F 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This patch set adds all the supported FLEXCOMs for the SAMA7D65 SoC.
This also adds the GMAC interfaces and enables GMAC0 interface for the SAMA7D65 SoC.

With the FLEXCOMs added to the SoC the MCP16502 and the MAC address
EEPROM are both added to flexcom10.

The dt-binding for USART is here [1]. And the dt-binding for DMA has
been applied here [2].

1) https://lore.kernel.org/linux-arm-kernel/20250306160318.vhPzJLjl19Vq9am9RRbuv5ddmQ6GCEND-YNvPKKtAtU@z/
2) https://lore.kernel.org/linux-arm-kernel/174065806827.367410.5368210992879330466.b4-ty@kernel.org/

Ryan Wanner (6):
  dt-bindings: net: cdns,macb: add sama7d65 ethernet interface
  ARM: dts: microchip: sama7d65: Add gmac interfaces for sama7d65 SoC
  ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC
  ARM: dts: microchip: sama7d65: Enable GMAC interface
  ARM: dts: microchip: sama7d65: Add MCP16502 to sama7d65 curiosity
  ARM: dts: microchip: sama7d65_curiosity: add EEPROM

 .../devicetree/bindings/net/cdns,macb.yaml    |   1 +
 .../dts/microchip/at91-sama7d65_curiosity.dts | 207 ++++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 299 ++++++++++++++++++
 3 files changed, 507 insertions(+)

-- 
2.43.0


