Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1ECF01834
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KKkuAbOfK+Xms3bT2Y9Dwq2okjxn8DYWqAZp2qZr8ME=; b=yg6RT01bPGPCG2
	rgyyGKV6zv3Cbu57IzrMTT4LgnJIaLtt7q6cDUMZUsssWibjDztQuNEZ8XaEBH7KFY4mMkhqPRIkb
	CEhLtIDrU7FQLqQ58XyNYgcYrFra4KODRQru/qZCqLZwpWUeJAGDNTXLMhA+DkCcL57M1+8VcKEt+
	+d+iakCxqp876txvKfhXXa4TPiGsPH83QapQcxp3bN3WoNDb8vVtSCzxTeeGEHpvG/s49EgGaaCKo
	KF8Kl+zwHxcGsDvYytqxk6dRStedBc9jvt8ZOyDgtnrze7I00Oof1KM9lbJj6MmPTsEHFFxlTQhIS
	gefxXJEhyc8PetZHQIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUhH-00000003hHE-0Rz9;
	Fri, 06 Mar 2026 12:54:27 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUhF-00000003hFv-0iAV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:54:26 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 20:54:21 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 20:54:21 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH RFC v2 0/3] pinctrl: aspeed: Add AST2700 SoC1 support
Date: Fri, 6 Mar 2026 20:54:06 +0800
Message-ID: <20260306-pinctrl-single-bit-v2-0-79918cfab641@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7OqmkC/22NwQqDMBBEf0X23C3JSsX2VCj0A3otHjRudMEmk
 gRpEf+9QXrs8c0wb1aIHIQjXIoVAi8SxbsMdCjAjK0bGKXPDKSoUqQ1zuJMChNGccPE2EnCviV
 dWqrJnE+Qh3NgK+9d+oTH/QZNDkeJyYfPfrTovfo5y3/ORaNCUylLtqsV2+7axpm5T2zGo/Eva
 LZt+wL3C6+FvgAAAA==
X-Change-ID: 20260211-pinctrl-single-bit-da213f282c95
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, "Lee
 Jones" <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, <openbmc@lists.ozlabs.org>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772801661; l=3185;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=FgiYEQd/P2zQqeWQzEAv96N7SJQXOUfd3voSn7UKLcw=;
 b=OhK+Shi+Y07/ZBUyGlUufjEdu0QvSIE8H2raDh9DupNusnglAd76Kyexn1MvtHR6BtL0JvD6L
 xZb/zExG+PyBJsauseKS+YVku1jBM/b8mL31HyYHs6Lu7zucY2IIu3g
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_045425_215558_5CEB7A18 
X-CRM114-Status: GOOD (  11.98  )
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

Legacy ASPEED pin controllers have historically not had a coherent
register interface. Control fields often had no consistent mapping to
individual pins, and configuring a function frequently required
coordinating multiple control bits across several registers. As a
result, the existing ASPEED pinctrl drivers rely on complex macro
infrastructure to describe the dependencies between pins, functions,
and register fields.

The pin controller for SoC1 in the AST2700 breaks from this legacy
design.

For SoC1, each pin maps directly to a dedicated function field in the
SCU register space that determines the active mux function for that
pin. This results in a much more regular register layout compared to
previous generations.

While the behaviour is conceptually similar to pinctrl-single, the
register layout and configuration model differ enough that reusing
pinctrl-single directly is not practical. Therefore this driver is
implemented as a SoC-specific pinctrl driver using static data tables
to describe the register layout.

The binding reuses the standard pinmux and generic pin configuration
schemas and does not introduce any custom Devicetree properties.

This series touches some of the same files as the AST2700 SoC0 pinctrl
series and may conflict if the two series are applied independently.

Known overlap includes:

  - Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
  - drivers/pinctrl/aspeed/Kconfig
  - drivers/pinctrl/aspeed/Makefile

The AST2700 SoC0 series can be found at:

https://lore.kernel.org/linux-aspeed/20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com/

A binding example is not yet provided as there were differing opinions
during review about whether it should live in the SCU binding or the
pinctrl binding. I can add one in a follow-up revision once the
preferred location is agreed.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Updated the series title to focus on AST2700 SoC1 support.
- Reworked implementation to use static SoC-specific layout tables
  instead of a generic packed-field model.
- Dropped the generic "pinctrl-packed" driver approach.
- Removed custom Devicetree properties.
- Updated binding to reuse standard pinmux and generic pin
  configuration schemas.
- Link to v1: https://lore.kernel.org/r/20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com

---
Billy Tsai (3):
      dt-bindings: mfd: aspeed,ast2x00-scu: Support AST2700 SoC1 pinctrl
      dt-bindings: pinctrl: Add aspeed,ast2700-soc1-pinctrl
      pinctrl: aspeed: Add AST2700 SoC1 support

 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |    1 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml       |  449 ++++++
 drivers/pinctrl/aspeed/Kconfig                     |   13 +
 drivers/pinctrl/aspeed/Makefile                    |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c    | 1573 ++++++++++++++++++++
 5 files changed, 2037 insertions(+)
---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260211-pinctrl-single-bit-da213f282c95

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


