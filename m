Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9BDD72361
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LXDjO0Zits+baQGNf4iaD7rt+XiqyDuXVlNSdn+765A=; b=B9ZfSl8OeGrAgN
	T/Xk3lUMB5nhmUYWRXorZU3G+Z7VJrQFi0o7MQb4/l70B4NDTGpT5EQbvY04uKAK81/LEa3WRArbs
	In9CSuE1KdjOp+4WFfcetmdGnFeaLAiYCrDZO+CsYvNJ6IGzvQtNfgC6Japcb3xJ/cbA7rruWgTSY
	LLjnXyKPLrUnX61q62Epuhd/hb5agDK+imOs/itAPZSvkzKg/AgH29zuoZuHe9C0uBa6uZa+zZBHB
	P+gP+z7hblg+ttMKEkds5I+r29PGCBUhQa3ZhYXrAIzugFiEaNxO7E4Y/eEAo4nYT+2Z3gI7TFaw4
	PwlYmtstW3xCH95+AkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDR6-00000008Ysv-387s;
	Fri, 23 Jan 2026 09:26:36 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDR4-00000008YsP-3PuH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:26:36 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 17:26:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 17:26:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 0/6] Add Aspeed G7 sgpio support
Date: Fri, 23 Jan 2026 17:26:25 +0800
Message-ID: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAME+c2kC/13Myw6CMBCF4Vchs7amU+SiK9/DEFPLFGYBbVokG
 tJ3t7B0+Z/kfBtECkwRbsUGgVaO7OYc6lSAGfU8kOA+NyipKlSqFG8fl0B6esbBsxON7FusTH3
 ReIV88oEsfw7w0eUeOS4ufA9/xX3dqVoiNv/UikKKtpJkS2tfdSvvOnqifiEzno2boEsp/QB37
 HVnsQAAAA==
X-Change-ID: 20251223-upstream_sgpio-70d815c64a19
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160386; l=1733;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=GhxpaNbciIaCWw72u2Iibpyx+V9XGyJ6u4X/43gCPWI=;
 b=ha0IbVquhucHyhVDOj7Ik/OXkimaaMGrNIIgmEHWVcXtkMlFT8YWsrZpZun6A/6r2OrwYLp2p
 +c/MUBgaX6/DJhz3EpuHv5ijNQ47OZCitYyPv5W1+HSOefr3kae3Oh6
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_012634_855644_8672E5AF 
X-CRM114-Status: UNSURE (   9.83  )
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

The Aspeed 7th generation SoC features two SGPIO master controllers: both
with 256 serial inputs and outputs. The main difference from the previous
generation is that the control logic has been updated to support
per-pin control, allowing each pin to have its own 32-bit register for
configuring value, interrupt type, and more.
This patch serial also add low-level operations (llops) to abstract the
register access for SGPIO registers making it easier to extend the driver
to support different hardware register layouts.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Split the IRQ-related llops conversion into a separate patch to keep changes logically scoped.
- Minimized unrelated changes (such as variable renaming) to reduce diff noise and ease review.
- Clarified the llops design intent and semantics.
- Link to v1: https://lore.kernel.org/r/20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com

---
Billy Tsai (6):
      gpio: aspeed-sgpio: Change the macro to support deferred probe
      gpio: aspeed-sgpio: Remove unused bank name field
      gpio: aspeed-sgpio: Create llops to handle hardware access
      gpio: aspeed-sgpio: Convert IRQ functions to use llops callbacks
      dt-bindings: gpio: aspeed,sgpio: Support ast2700
      gpio: aspeed-sgpio: Support G7 Aspeed sgpiom controller

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |   4 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   | 362 +++++++++++++--------
 2 files changed, 227 insertions(+), 139 deletions(-)
---
base-commit: 39d3389331abd712461f50249722f7ed9d815068
change-id: 20251223-upstream_sgpio-70d815c64a19

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


