Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E280CC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C5ZmQXx4mxY85GmIXUSq8cDz7Gu+D9pcOZjfpaZ/Z1o=; b=1Skj7ACRd/kF+0BKLr9uIH7YMz
	+NiRoSuQiPfc9uELlsIEtU8cVtC5PyP2HfKIcTrT9sraiOGb1sVW4wW+ubypfdiqnsHI4YfEXm6aG
	LGUhHDbP4hOao6q/cjoWoXhPXfUcbjzAkuYvPy6GsAl51qJuKqiMGlUH2rojVsI73xGWzkMyWqsQe
	sURBwlGwZjDBKRZXOBGoym8ZGs+YU5yHDKhDKL2bY9QPb+gyx5CgJNAGzVkDdAOVaYQxkv6jVuIf7
	46IGAcp1PbjCjy0FCKtJDqVBOumSgPKHL5ajPF4AxiGfNktY9VeEjdjYrUiey2ZU70g7t82OyGXet
	8v5CRarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Yw-0000000BWjZ-0QKi;
	Fri, 28 Feb 2025 15:46:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Dq-0000000BSN6-0Ztc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740756258; x=1772292258;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mUhcBeFz2G0AqMEg/aSARHZz8N8xLvWlhvTeO9kMMBk=;
  b=QmE9CHwhjLlwiSNAxZ8LSpMbYFgXPlO0js+dclVvI5qIYHfeFSDPVI4o
   yXNrUKIZClo9hnJ2b/YaDsIas6kgseTplj8YOz+dHH1P8YZhsRJxT3k64
   i6zxCM3HO4u04thaM9fvzNll+Sv7mZClyj+EiZEhhe147a+c7Xl0qxUXE
   Ejvcyn+dCziiqoOCy+Il5bl00EGYUImOcpd4tyOIgLichLF7iYOOMXYa4
   zopOpd9tsnecMAWw/Nea2MgrW8bjRold/jiHgMNhzZhjti0R2+FXhl42m
   fDnwUah83bopt1iqLMvkGyzPyfG1boXNer44A1dZ/tHY4YHJUoPDQ01Q5
   A==;
X-CSE-ConnectionGUID: YRQSNli+QiSyLIXFC1GTlQ==
X-CSE-MsgGUID: 7UExDHXCTZuMclqioX3IKw==
X-IronPort-AV: E=Sophos;i="6.13,322,1732604400"; 
   d="scan'208";a="42415299"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2025 08:24:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Feb 2025 08:23:54 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Feb 2025 08:23:54 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-watchdog@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v2 0/2] Add System Components for Microchip SAMA7D65 SoC
Date: Fri, 28 Feb 2025 08:24:09 -0700
Message-ID: <cover.1740675317.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_072418_304012_CCEB62F0 
X-CRM114-Status: UNSURE (   8.44  )
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

This patch set adds support for the following systems in the SAMA7D65
SoC:
- DMAs
- Chip ID
- Dual watchdog timer.

Changes v1 -> v2:
- Removed pathes that have been accepted and applied from v1 [1].
- Corrected missing newline in dt-binding.
- Corrected mismatch in watchdog dt node.

1) https://lore.kernel.org/linux-arm-kernel/09eafe54-c262-4db4-b11d-0644a1f90a14@tuxon.dev/

Ryan Wanner (2):
  dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
  ARM: dts: microchip: sama7d65: Add watchdog for sama7d65

 .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml    | 4 ++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi                  | 7 +++++++
 2 files changed, 11 insertions(+)

-- 
2.43.0


