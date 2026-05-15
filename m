Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFC2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nz40TiFNC9+ht1LjUoKBL2ZBUTaGeJKCxbuiHSpIf2s=; b=VyUN121Nvt9ITW
	8uRXWLbCBj9B10Q/61KYC0l87dweCgxhoQY+/2YcXk52zfpUPyrkKa8R6sf2qScKLfTZgTpQcxKYP
	xKXrWI21ZeBieOx/ul5+kn/gYgDsxnvK8l/P2HOi+5Rrs3Y0I/IkSZeQ15yyNPaaPzqifqLSBvVRu
	wGZ/CkuULYM1Qmjs9qjY+EzPPi7/ff/zUV1fwQ4r9MpNs63yZ+bknk5z1HE6uxgx2kqNduuJefV7w
	H4sYn74QjwvNC7WFj+yHxn8aYtHphofavueKZLZCtWibIMIwfENitIEBSyovg0oR5JwrbvQfYUIG6
	VDofKiX+lDkou9DmOWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNozQ-00000007v7S-2JTq;
	Fri, 15 May 2026 09:37:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNozO-00000007v6V-1eLX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:37:52 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 15 May
 2026 17:37:38 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 15 May 2026 17:37:38 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 0/3] pinctrl: aspeed: Add AST2700 SoC1 support
Date: Fri, 15 May 2026 17:37:36 +0800
Message-ID: <20260515-pinctrl-single-bit-v3-0-e97da4312104@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDpBmoC/23NQQ6CMBCF4auQrq1pp4rgynsYF6VMYRIspG0aD
 eHuFhLjQpb/S+abmQX0hIFdi5l5TBRodDnUoWCm165DTm1uBgJKAVLyiZyJfuCBXDcgbyjyVoN
 UFiow9Znlw8mjpdeG3h+5ewpx9O/tR5Lr+uXUHpckF9yUwoJtKoG2uekwIbYRTX8045OtZoKfo
 0S560B2LnUtK2N1U57kn7MsyweU7CU4AQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837858; l=4269;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=9Cn9pDIuyFA9O7PKzEDGkjk/BPWLh9Gxh6Xx0JghGi0=;
 b=GkjgcF1HK1mq+U56PeB/4J8NkQ8iJNGyrh5Cu984mgNvSqUvhC42xoHRoQtJ3QGQZlqDRIlzz
 +L1gv+Tlej5DXm/LV7HbijCAWqOKfNlEhvJszrkCnwAgTa5+TLPmcJc
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_023750_451504_555D1B09 
X-CRM114-Status: GOOD (  11.73  )
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

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v3:
- Added pin configuration group support for AST2700 SoC1 by
  implementing `pin_config_group_get()` and `pin_config_group_set()`.
- Restricted AST2700 SoC1 `drive-strength` settings to the supported
  4/8/12/16 mA values in the pinctrl driver.
- Convert kernel-doc comment for aspeed_g7_soc1_drv_map to a regular
  comment to avoid kernel-doc warning reported by kernel test robot.
- Update the AST2700 SoC1 pinctrl binding to describe the `reg`
  property and require it.
- Allow standard pinconf properties in pin state nodes.
- Add a binding example for the AST2700 SoC1 pinctrl node.
- Add state-node description, function+groups dependency constraint,
  and oneOf groups/pins constraint to the binding, matching the SoC0
  binding style.
- Add pins enum (212 entries) to the binding to cover all physical pins
  that support per-pin configuration.
- Add UART modem-line signals as independent functions/groups:
  NCTS0/1/5/6, NDCD0/1/5/6, NDSR0/1/5/6, NDTR0/1/5/6,
  NRI0/1/5/6, NRTS0/1/5/6; remove those pins from UART0/1/5/6 groups.
- Add LTPI_PS_I2C0/1/2/3 functions/groups for I2C-over-LTPI;
  extend I2C0/1/2/3 functions with the new LTPI groups.
- Fix typo: rename RMII0RCKO/RMII1RCKO to RMII0RCLKO/RMII1RCLKO.
- Fix wrong index: rename DSGPM1 to DSGPM0.
- Kconfig: use "Aspeed G7 SoC1 pin control" to match neighbouring entries.
- pin_config_get: fix BIAS_DISABLE readback (val=!val must be skipped
  for BIAS_DISABLE since hardware bit=1 means pull disabled).
- set_mux: remove dead null check on grp; propagate regmap_update_bits()
  return value.
- gpio_request_enable: propagate regmap_update_bits() return value.
- Link to v2: https://lore.kernel.org/r/20260306-pinctrl-single-bit-v2-0-79918cfab641@aspeedtech.com

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
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml       |  760 +++++++++
 drivers/pinctrl/aspeed/Kconfig                     |   14 +
 drivers/pinctrl/aspeed/Makefile                    |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c    | 1732 ++++++++++++++++++++
 5 files changed, 2508 insertions(+)
---
base-commit: e532a5a81d0db872acd2c0a92d2639580ca3da44
change-id: 20260211-pinctrl-single-bit-da213f282c95

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


