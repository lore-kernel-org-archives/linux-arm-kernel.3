Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4AACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJyrWd++2CyEQ1DEtYR8yWrZNRnCvq4DMS3BL4be+io=; b=tsXdiw9xD7vJ+Cd/W6sNxgWO6O
	ACfnx000gtBk21EfwKhNbSegakJEK7WJZfidcFlevwqrpTxwDfMICVT1cZG/bkTpEidIJvNlr6gYD
	TuKGQdqk+vaLEDq6srJxILMznJ66JcczAYI73grWsw976xsi6nNlgRpTQPT7B6p7xvjvekl2jFvS0
	TE7xVToF+Jwk+R4QjathjIe9H0ejTr+TUQWRMDsMLdKtUSQgSMiTtlS4r3Oi70y5u561+OkKfkl84
	+3g7ffkZFHl+OF6IuiayNngFg6B2QXo7HefLXEmjewNcE9mOVwn2sMtP16YP7ZNyP/WGkIiYbve3V
	IaXOJiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybhV-00000008tcr-0RXm;
	Tue, 16 Sep 2025 19:50:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybhS-00000008tc3-0VzO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 19:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758052250; x=1789588250;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hseq//EDsBEnv5NDrY+cP9+6SHkGyS860cCT1WxT8j4=;
  b=cyvCwONbk9xkMjaPMCwA8XtvpdRTXtsFEc/Bq+2NWQHmBL0dhWRgriaW
   LBfjUUSXZ4SVFwXeH0SV7sqxoIJDbiM7V6MwunjD9/4oOvgae6VOUOtOt
   CpbM6XStnmrCLyNT8/dfCbXDzAm1TCMyqG40zYKGUwEp2XYmyg9CwC0Sg
   GyBSsf47G46pgG290Gk50eaUWeUfuPRuR5VM+eRQmLlDOTB7Do7mZ+49d
   Zi5O/2xUznrxZf03mu4PZ4TrTgOwPc1qQdxG3M6a/AG/PpTTgxc98mWzv
   Lqpz2hWjF918fxAJ2oUQACkqynKnxGIbUsVwSGBvwwwRUqFLlNsx0mVzU
   A==;
X-CSE-ConnectionGUID: OpVEzCAsSoaW6AVT1s3wKQ==
X-CSE-MsgGUID: 8eDFBDG6T+uCphA8wzxghA==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47129844"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 12:50:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 12:50:16 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 16 Sep 2025 12:50:16 -0700
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 0/3] AT91 Low Power Mode adjustments
Date: Tue, 16 Sep 2025 12:50:29 -0700
Message-ID: <cover.1758051358.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_125050_401375_9F93F3B1 
X-CRM114-Status: UNSURE (   8.42  )
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

This patch set adds the Low Power Mode pin feature to the SAMA7 SoCs.

Changes v1 -> v2:
- The 2.5v regulator has been removed as it has been applied.
- Adjust the dt-binding to allow more than 1 phandle.
- Adjust the commit message to explain better what the Low power mode
  pin does.
- Simplify the how the lpm pin property is parsed from the DT.

Claudiu Beznea (2):
  ARM: at91: PM: implement selection of LPM
  ARM: dts: at91: sama7g5ek: add microchip,lpm-connection on shdwc node

Varshini Rajendran (1):
  dt-bindings: power: reset: atmel,sama5d2-shdwc: add lpm binding

 .../power/reset/atmel,sama5d2-shdwc.yaml      | 19 ++++
 .../arm/boot/dts/microchip/at91-sama7g5ek.dts |  1 +
 arch/arm/mach-at91/pm.c                       | 96 ++++++++++++++++++-
 arch/arm/mach-at91/pm.h                       |  1 +
 arch/arm/mach-at91/pm_data-offsets.c          |  1 +
 arch/arm/mach-at91/pm_suspend.S               | 48 +++++++++-
 6 files changed, 158 insertions(+), 8 deletions(-)

-- 
2.43.0


