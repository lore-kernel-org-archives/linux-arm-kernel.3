Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A384BCE7B08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OboskOPEErKPwAQpls5bNzuQhdJX2qsytJypo11hl/k=; b=P41xTIycI/uPHdPjb02JksmLIH
	P9ulgsEZFSrVbIdVMDmCT6GmDZ/OR8FtGEBetefs+wwAnfipU37B1riL7JQDbLHCTFoG3tvblLIHs
	b/8e/293vZkD7pteR5Jla8ewaRXZ2QW5F+K8v2ePvlicVXaxxo3C8qEGLe4BM/iy1pYFlCPGmro0r
	COFQDYvTF+r4/Kl+BICpzWvtvGGRNaBO0BwxJL5Mbg+YvssTKQrl7u/uL4V7VEM1cQJGBXa4He8tE
	exbHsu2Rpn+khRJjJBKDmDIMNmqsTd7poXeKCVjBOsBJsYDI9IZS6goaKMZb9qaZFhh35HPXgKAxC
	nm5x5SwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0G-0000000CH3z-302c;
	Fri, 14 Nov 2025 13:38:16 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0D-0000000CH3N-2xHd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:38:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b714b1290aeso297988366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127492; x=1763732292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OboskOPEErKPwAQpls5bNzuQhdJX2qsytJypo11hl/k=;
        b=Thqu21712j2X8ocrdhgQ6srIj+HtG44lBB2aw1vdr6ooYmPqvrj6tNoXSrT9KpL9ig
         7uyn/es5958mcNRNxcx34+s+Kumv3kk2lqShx7oMxfKz5u/AVsQiQkbQ2MQtfAUnvSSr
         qZhRFPj4l4RuO2c1mNFvqp/TqL0iM22BZIoze8cV8flQ5ZSmVCBkQQff3+GuuORLM/p/
         kVY2Gx1PqhAr4K6M8SgKvgmBW0veOYPeHjo+WxJjzRGuX0eujIPx5A4hx+ic9tizf6oq
         EkLx+tAuZvI+nfaP+5NuIy1juc6MGMmbRRMddlqtuPJOpTF/FrcPeiIT1nSadWdoEen3
         7EKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127492; x=1763732292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OboskOPEErKPwAQpls5bNzuQhdJX2qsytJypo11hl/k=;
        b=eWPb72NdSEhR+3KsEMYe9SWJFtjKA9ftA1b7+7bhz3Fkow/ptYuzr5bIWQR1bSCCmw
         TZaZLYFU2iFgE5IM3XC5JIIV5h87rzT8hPSXO1I9rs7y/Of6r8ZucK9+HWtip8GdtRry
         JFKI/WZoowFgFL+yYjViqVG/sz3RkKG4HxCADQ4A4vvv5IwGXEWACvRVEl5TbmCk0Vsh
         6+VZtG6FEUc344EJxGNJkrvVRbFUeW+/u+sSwCXIIgNoXQExKAnE9GuxcZBzRlSZzNu9
         HPcUZJOHO0G5hEorUb6eJLs4St6vYYOMnVzBYecaAwnTfga0nQSNMKwtOT8VjatZWx6E
         0j+w==
X-Forwarded-Encrypted: i=1; AJvYcCWbaqILinRHh7Y+IKji17CGT5LY3i4fi67iis1XEeGUoSrCdldDFOyEiW4qO/GYnPMhZGKbqMAq/66qGKUFXEHn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx25Lm8hmAjBxHzdRPobVc///BJ4OdS3pzdxkyob3ANkqLkWJ+7
	XlrxqmALnvX3X54cpE6uy5WC2IJi4F4sIvaxGyL/X2bnvnarjnl8X0xW
X-Gm-Gg: ASbGnctHZMszWx5S2ivpRyAz2bWZdTmkKrQZdOwxHb1mKTNNc87EQRQdzPJDgNnEAK0
	zG0jb1AZbirW0U/dtpKzJ/zqj7ErlCA6cUqX3MNAN+JJP5usN+x78Itk7+7TdE+opCS7REFD9UH
	VlwQFBqZoy0XrJJ/7VCWM9KmbZzu8WS7QxfUksKqT0TT/6JFxyvtrgc/UYLg9y+dU7PIYOEDqwY
	02qdtdI502zrBWYy3BkUiDKPzVZlW5yAigS7fa813vN/cSK3fTDgX0UjlxLP772LdVduxtw+Rwc
	0/o63PJar+jB2DDC8Z2oK0AW5DEfZIhiocNDj04kvs/TKe1kOQLw4eK6sKOH5F0h+hoNvtWy+bY
	MQgjBhSa271hTmeGMlW86pw4uQKbV6crgVZZgB29BnizBWm947tQI6bwFmxl2AndIPvLhF3wcWL
	J8VsIofiQL4PyRac+pgUcK1RgYtNHPRYdDl6WFZ4A+Dig5JIQX
X-Google-Smtp-Source: AGHT+IHlE5emn9yan7ANjC9v1EbG+iM1kGDrBeJiQfoNgY5bOTMIJhsyHpkBfuIpxhI2l/GF362j1w==
X-Received: by 2002:a17:907:d78b:b0:b73:2b08:ac70 with SMTP id a640c23a62f3a-b736793db12mr270335166b.49.1763127491149;
        Fri, 14 Nov 2025 05:38:11 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:10 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v5 0/6] Add support for i.MX8ULP's SIM LPAV
Date: Fri, 14 Nov 2025 05:37:32 -0800
Message-ID: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053813_774120_1394C6CE 
X-CRM114-Status: GOOD (  19.31  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
LPAV subsystem, which offers clock gating, reset line
assertion/de-assertion, and various other misc. options.

This series adds support for the IP by introducing a new clock HW provider
driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
allow it to be used for i.MX8ULP's SIM LPAV as well.

This series is a spin-off from [1].

[1]: https://lore.kernel.org/lkml/20240922174225.75948-1-laurentiumihalcea111@gmail.com/

---
Changes in v5:

* drop patches that were already picked up by Philipp/Abel.
* include the "bits.h" header.
* replace mask with bit index.
* link to v4: https://lore.kernel.org/lkml/20251104120301.913-1-laurentiumihalcea111@gmail.com/

Changes in v4:

* shorten commit message for patch 5
* drop base from "struct imx8mp_audiomix_reset" and use local variable
* imx8mp_audiomix_reset_get_regmap() now takes "struct imx8mp_audiomix_reset *"
  as its argument instead of a "struct device *"
* use base pointer as the data argument for devm_add_action_or_reset()
* shorten commit message for patch 6
* drop regmap field from "struct clk_imx8ulp_sim_lpav_data", use local
  variable and let devres manage it
* drop base field from "struct clk_imx8ulp_sim_lpav_data", use local
  variable and let devres manage it.
* CONFIG_CLK_IMX8ULP now selects CONFIG_AUXILIARY_BUS, which is needed
  for devm_auxiliary_device_create().
* drop static definition of "struct regmap_config" and change to using
  local one in the clock driver.
* link to v3: https://lore.kernel.org/lkml/20251029135229.890-1-laurentiumihalcea111@gmail.com/

Changes in v3:

* rename "lpav_bus", "hifi_core", and "hifi_plat" to "bus", "core", "plat"
* don't assign the "name" field of "struct clk_parent_data". Previously, we
  were assigning the local parent name to this field, which wouldn't have
  worked anyways if, for whatever reason, the fallback mechanism would kick in.
* replace the whole auxiliary reset driver creation chunk by
  a single devm_auxiliary_device_create() call.
* replace the "shift" field from "struct imx8mp_reset_map" with the usage of
  ffs()
* shorten commit description for patch 6
* cast "id->driver_data" to "void *" instead of the previous
  "const struct imx8mp_reset_info *", which makes the line shorter.
* open question resulting from Peng Fan's comment on V2: how to access
  interconnect QoS registers? do we need to model the sim_lpav as an
  interconnect provider as well or is it fine to have another interconnect
  provider that references the sim_lpav node and accesses its registers
  via regmap (dev_get_regmap(), specifically, NOT syscon).
* link to v2: https://lore.kernel.org/lkml/20251017112025.11997-1-laurentiumihalcea111@gmail.com/

Changes in v2:

* drop redundant description for "#clock-cells"/"#reset-cells" properties
  from binding
* make "mux-controller" and "#reset-cells" properties mandatory
* add "mux-controller" child to binding example node
* drop the compatiblity with syscon - this was never actually needed and
  it was done to allow using "mmio-mux", which requires a syscon parent
* modify the auxiliary reset driver to use regmap - this will allow the
  mux controller, clock control and reset control APIs to use the same
  spinlock.
* rename "imx8ulp-reset-sim-lpav.h" to "fsl,imx8ulp-sim-lpav.h"
* drop the "IMX8ULP_CLK_SIM_LPAV_END" macro, which doesn't belong to the
  binding headers
* fix the values of "IMX8MP_AUDIOMIX_EARC_RESET_MASK" and
  "IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK", which were previously incorrect
* drop redundant macros from auxiliary reset driver - replace their
  occurrences with their values
* squash the binding-related macro additions into the binding patch
* add mux-controller child node to the sim_lpav node
* make the "gates" array static
* link to v1: https://lore.kernel.org/lkml/20250804155407.285353-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  reset: imx8mp-audiomix: Drop unneeded macros
  reset: imx8mp-audiomix: Replace mask with bit index
  reset: imx8mp-audiomix: Switch to using regmap API
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
  arm64: dts: imx8ulp: add sim lpav node

 arch/arm64/boot/dts/freescale/imx8ulp.dtsi |  17 +++
 drivers/reset/reset-imx8mp-audiomix.c      | 170 +++++++++++++++------
 2 files changed, 141 insertions(+), 46 deletions(-)

-- 
2.43.0


