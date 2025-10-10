Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE687CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JMk9hcJAy3ZVMhG6YSM/xH04IxQZbcaAsPWvqEY86e0=; b=eeijN20oeKrjbu
	W9ldcCj5M9PMWIr26EjkFgl166NBAMI6jwOkcbK9p+NBTIRl8KDiCR0HDjlZtDlo9lcWpmc894/NY
	nYNPfYwlUky3L5O7mfx4cGfgiIJCPIIMjsESNHtUbCKG0futIgFlocupBCYOdpFoykyASuI9WFSaT
	tvSYcDpFaAxEGeUf0JbpF2cjytBLPmKhdwBXcqPyxrbiWSecm7sRNUbpg+K9Wn68K0dHy2zjp2oKM
	9/k/OrC9HGzGLCD9lYVo9mak5m2pUcWVIknKs0i8wifEbj+XlgTBx2Cy0Jm1i3KhlVFK06IocJALq
	YFxEfira67r6hGw7iUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v785y-00000007vwV-3M67;
	Fri, 10 Oct 2025 08:03:22 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v785w-00000007vuB-2F03
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:03:21 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Oct
 2025 16:03:15 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Oct 2025 16:03:15 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/3] watchdog: aspeed: Add AST2700 support
Date: Fri, 10 Oct 2025 16:03:12 +0800
Message-ID: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_010320_570137_70A4379F 
X-CRM114-Status: UNSURE (   7.47  )
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

This patch series improves the ASPEED watchdog driver to support newer
AST2700 SoC. It enhances reset mask handling to accommodate platforms
with multiple registers, adds AST2700-specific configuration, and
updates the device tree bindings accordingly.

Changes in v2:
  - Removed 'num_reset_masks' field from AST2400 platform configuration.
  - Simplify 'if' contional statement for platforms after AST2400.

Chin-Ting Kuo (3):
  dt-bindings: watchdog: aspeed,ast2400-wdt: Add support for AST2700
  watchdog: aspeed: Support variable number of reset mask registers
  watchdog: aspeed: Add support for AST2700 platform

 .../bindings/watchdog/aspeed,ast2400-wdt.yaml |   8 +-
 drivers/watchdog/aspeed_wdt.c                 |  30 +++-
 include/dt-bindings/watchdog/aspeed-wdt.h     | 138 ++++++++++++++++++
 3 files changed, 167 insertions(+), 9 deletions(-)

-- 
2.34.1


