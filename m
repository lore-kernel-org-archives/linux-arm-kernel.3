Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE83DCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ihXqDf6rFoe4ZyEA7NFzt+D6bf9oIyLTCI2gHHd30lc=; b=c7NsfL7qx+3cpv
	msJvfnpIhxi6tzErpjQ6rK5g2ZWkTRox3xelJ4Agicg8+HekoNopa9lF9FGv3xdoZdkGYpH4HOPxl
	Y0y2zBekwe96TAUeqm9R8dlYRTCqtSo3EcpKKE4s+gboT9blt9QsLluhHNt6QLRpQj41rhoY3a70M
	o6vlGNcpDwLX/W/poG9MB2teGDN0iVbHckBMUtZ2d4vFmqapFnumsz3qkZ7qwn80kebcnzLN7oXXq
	mMpprGqLNOmpT6PeP316l16tUmQGa/Rra6Qrc7F3iRLqtG1j2O/uMkP7wiBST5XQEU6ix4FePizlg
	QC7aqw0xGAIDRRncvXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8AT-0000000BEw0-3vhc;
	Thu, 04 Sep 2025 11:30:17 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7ID-0000000AvLY-1soS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:34:14 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 4 Sep
 2025 18:34:01 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 4 Sep 2025 18:34:01 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/4] Add pinctrl support for AST2700 SoC
Date: Thu, 4 Sep 2025 18:33:57 +0800
Message-ID: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_033413_491033_D740DDCD 
X-CRM114-Status: UNSURE (   9.87  )
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

Document and add the pinctrl driver for AST2700 SoC.

Changes since v1:
- Update pinctrl aspeed binding files.
- Update the commit message for pinctrl binding patch.

Billy Tsai (4):
  dt-bindings: mfd: aspeed,ast2x00-scu: Support ast2700 pinctrl
  dt-bindings: pinctrl: aspeed: Add support for AST27xx
  pinctrl: aspeed: Add AST2700 pinmux support
  arm64: dts: add AST27xx pinctrl configuration nodes

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    2 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  |  115 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  |  435 +++
 .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++
 drivers/pinctrl/aspeed/Kconfig                |    8 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   |  503 ++++
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 2523 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |   47 +
 drivers/pinctrl/aspeed/pinctrl-aspeed.h       |   11 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |   35 +-
 11 files changed, 5034 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c

-- 
2.25.1


