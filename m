Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A53D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dKEiXSCwdojell1kyAFXQf/IfqH1mRcSaT2Kaw98+kw=; b=l7/ri8VDhrz+Um
	+DO+m8zGNfT+en5iVy6YVdnNZjLKmO/5IOUEUpc/Bkwxo8AgVL2HfFPQqhW9Ufpy01mPdUZmc5ZjE
	Z+uPBOZBPO2/UOXzSymnw0Q+7fB89n12NikXPkoYkqGE8Fm9mEWm268e5ZNTgtxpC9BerR7zpBpRA
	bVbbuI597KVZFd7Cqckj8+/EUFOBt+6zNmjLW+GivD9X7g3yQD7OsCmou17R5jYWoa7Ij5FSnqbMY
	KeOMyEyu+spgf2ShZ1s7gDsCL8xbyg7oItGOkBP9M5XwkspsQ9sd+Zbx7atOwzfJGMdVtxxnoPg9P
	ITOI5eDE96XLRIbL6/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA8l-00000003jkT-1YA6;
	Tue, 20 Jan 2026 11:43:19 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA8h-00000003jjE-2JE7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:43:17 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 19:43:05 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 19:43:05 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 0/3] Add pinctrl support for AST2700 SoC
Date: Tue, 20 Jan 2026 19:43:04 +0800
Message-ID: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEhqb2kC/z3MQQ7CIBBA0as0s5YGaEmpK+9hTIN0kEloSwCNp
 undJS5cvsX/O2RMhBnOzQ4JX5RpWyu6UwPWm/WBjOZqkFwqIYViz5hLQrNMkVZbUmDaiVHNjpt
 xUFCzmNDR+7e83qpd2hZWfG3+Iz7yXvCu56LVWuqBCXanED5TyYYuJkfEuaD1rd0WOI4vfEq54
 KUAAAA=
X-Change-ID: 20251215-upstream_pinctrl-8f195df0a975
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <bmc-sw@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909385; l=3007;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=XQLWMm3YsOhtEHJ6iLz4rU8Uz2JmnALhlntXC1iQkvA=;
 b=Gxi0bOC2k4CwxLCGJ3+75SuENKeJa42aygju/Eb16ieiH0uqpGEPvIX1fxidn3KU7k4v7A5Ps
 XtN9gTyxx6EA2EG7f/Ajdtc5Z9m9A08NkB9awKP6WiVs6dQwixj8jxr
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_034315_597053_4AC92C10 
X-CRM114-Status: GOOD (  12.84  )
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

This series adds device tree bindings and a pinctrl driver for the
ASPEED AST2700 SoC.

AST2700 is composed of two interconnected SoC instances, each providing
its own pin control hardware. This series introduces bindings describing
the AST2700 pinctrl architecture and adds pinctrl driver support for the
SoC0 instance.

The bindings document the AST2700 dual-SoC design and follow common
pinctrl conventions, while the driver implementation builds upon the
existing ASPEED pinctrl infrastructure.

---
Changes in v3:
dt-bindings: pinctrl: aspeed: AST2700 pinctrl improvements
- Improved binding descriptions for SoC0 and SoC1 to better explain the
  AST2700 dual-SoC architecture with independent pin control blocks
- Switched from additionalProperties to patternProperties using the
  '-state$' suffix to restrict child node naming
- Removed per-binding examples based on review feedback
- Added additionalProperties: false at the top level for stricter schema
  validation
- Dropped the aspeed,ast2700-soc1-pinctrl binding, as the SoC1 pinctrl
  registers follow a regular layout and can be described using an
  existing generic pinctrl binding
- Updated the function and group enum lists to match the definitions
  used by the AST2700 pinctrl driver

dt-bindings: mfd: aspeed: Add AST2700 SCU example with pinctrl
- Added a complete AST2700 SCU0 example demonstrating pinctrl integration
- Example covers both pin function/group configuration and pin
  drive-strength settings
- Updated child node naming to use the '-state' suffix, following common
  pinctrl conventions

pinctrl: aspeed: AST2700 SoC0 driver improvements
- Refactored pin and signal declarations to use common ASPEED pinmux
  macros (SIG_EXPR_LIST_DECL_SEMG, SIG_EXPR_LIST_DECL_SESG, PIN_DECL_*)
- Added SCU010 register definition for hardware strap control
- Reworked code structure to better align with existing ASPEED pinctrl
  drivers

- Link to v2: https://lore.kernel.org/r/20250904103401.88287-1-billy_tsai@aspeedtech.com

Changes in v2:
- Update pinctrl aspeed binding files.
- Update the commit message for pinctrl binding patch.
- Link to v1: https://lore.kernel.org/r/20250829073030.2749482-1-billy_tsai@aspeedtech.com

---
Billy Tsai (3):
      Add compatible strings for AST2700 pinctrl to the SCU binding.
      dt-bindings: pinctrl: aspeed: Add support for AST27xx
      pinctrl: aspeed: add G7(AST2700) SoC0 pinctrl support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  28 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 ++++
 drivers/pinctrl/aspeed/Kconfig                     |   8 +
 drivers/pinctrl/aspeed/Makefile                    |   1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c    | 683 +++++++++++++++++++++
 5 files changed, 850 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-upstream_pinctrl-8f195df0a975

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


