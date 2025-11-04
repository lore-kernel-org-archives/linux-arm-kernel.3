Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A012CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qh/FaSl/m4qbaZem8OmSgJ3Jnx8x/VamxQ11Z+7Z+Ns=; b=NMlV8n3Sedq1PvSQB2LW9mGLH0
	9Vb92LclsBgn06y255vH+TVLQLDvpkbxU/vPv7zaKhBqQZmpUyerv5PQ5/1MeXIkKkszL1YlMfIyD
	xuS7YXpFFsZ5xlv7xT+8MdgrhU00iJf2Qc81qqTW/HmQmXoOLpT3PN5ucC4QfE5LByxg8/wvfQOoh
	70p3qi4tjOttoRU6MZaH1fRPZga59SeCMIo1AYT8z/aFSTEiVBqaNE/y9pbHXV+oIKGAeDmF7+LSW
	MCh5DtOFkUkhcHCIgovAQ2oEwXJwzxEZbyngKNCnHsQsqqHnTUR2LmaB2plDdDo8+64UXdv9wu71x
	9DkOrQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlW-0000000Bkoq-1bAl;
	Tue, 04 Nov 2025 12:03:58 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlU-0000000Bko3-0Efl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:03:57 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso9256853a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257834; x=1762862634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qh/FaSl/m4qbaZem8OmSgJ3Jnx8x/VamxQ11Z+7Z+Ns=;
        b=AMoLdOjq2Ss6V6pG8LhNHR59Ef+HdWi4Q98nKg6JJG/VGSmJvtAU7jbweYAAE7fGGU
         d5f/wokP06Bs9WbZb/O09VbtLCc9DBme4hmlZsKQoTjC5cfewNA8MEhEaZalbzDp3j6c
         9QyuxZtPuGPSo38lgbgp/TOwVTQOHEz9f9T7mjqJSvWUeYtISpBSD2Pp8z53CdIFd30+
         I2GKCsW6EBvbmq1rl48+Arm8bui/UO/Q6OPYUDD09ZkhJpwYE0d/NhBYRgtKoGJHl3FO
         MfVwD/1O1p7RtWrUwNRqf/KC1Kkr2r11BjyPABJzrqXdF64jn/I3ZxQn5m7oF2M9+GPQ
         S4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257834; x=1762862634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh/FaSl/m4qbaZem8OmSgJ3Jnx8x/VamxQ11Z+7Z+Ns=;
        b=EYUe9vJiwNpgD3LkyEUP5ZDzOg3fQB7Eu/snRUacinzHX/10o00hU8IALuMO/ISoGr
         gH32bydZzdrFMAjYt/w61T0rpmz+evJqc6Gh4ANV1x79sAhu6mlC943caivkmKhNfdIj
         0n3aTo0g19vFjLdICYvjFpxxWeh8Sqp1f+tz1ovN2z0amKmxb0bUKPWQ90kxm0hxICr2
         b1YClsf1QVGVddP/goY/o4bkF2RqgQ7BMeoYg4Zn30yQFyAiY0xQCSI87fKCMC+Q3dZj
         3lkJoseRH6dq4Kf7RW8aT/Gy8lvoOY4GS1/xWGVytIvYtevampaZveJ3Hl/vD60hJC5T
         90Lw==
X-Forwarded-Encrypted: i=1; AJvYcCU65y/b/B7ik7O3NI3sVUz2GCn7y4AQNVMtKsH34BgI0BXy5HbdMnc88L3uq/AdwNzZa2BnkMbU001ZReDatqtJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyXnDt+ivnS9irh1Xey8dtqZHDEM3YsHVenwvbGTOIcxB8rL71I
	8NEx6Lq4/k8PhWVT1NCjiBV9zjDfMGD+MkPZnbnZvTrp2nNVSJE3TTiY
X-Gm-Gg: ASbGncubzECJeCZLticAoHmu/HHI8xcl9tOjXMegiOgdpCTwhkhOUxVNUzEe4eAHiGa
	zwd7wcKIevGkuA5n2ypZA+5iSWlqZnJUXcgcyEiHtUfkp1IuKWO0l4wvRfugX2QgMUJh+AnrhVc
	5Zg33i1jilczRAsWcjrhp3rpKF+kTUVJ2P6HqSrMwD5SrkpwhYW9NpXHTQUkNz1NNQ+1rkNGqrK
	pQF72dojJM24zfN1AKy5KYELEHh7Iu17ZuY3Nftsn1LyD10vMtzMlHWzQ9qtDfLwFYO1oWs0jV0
	dfliXmlRsk7yL262uA+Qad0L+3Gn6jbUf1i1EA/ycH5/oldNELwewtjcmxumyEJkJwjHkVw3zsT
	d8a/7PtZf6MrFY/OMaZowseIniS7FCsETxGatxnKsCeTlXyGMude0dV27iCVn6cLnEzU0ipADLT
	RAlhCI/hxyLf3cf6DPGiHqIlwFQA==
X-Google-Smtp-Source: AGHT+IGLk4LxQpLQapehWO+/gGriK9GLCN/WjqIegAT6m6BmY/Rle/Qz0hXlvkpjCOOsut/JbPkSdw==
X-Received: by 2002:a17:906:9fce:b0:b42:9840:eac1 with SMTP id a640c23a62f3a-b70706302f6mr1560163066b.49.1762257833816;
        Tue, 04 Nov 2025 04:03:53 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:03:53 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 0/8] Add support for i.MX8ULP's SIM LPAV
Date: Tue,  4 Nov 2025 04:02:53 -0800
Message-ID: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040356_121617_562C0979 
X-CRM114-Status: GOOD (  21.79  )
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

Laurentiu Mihalcea (8):
  reset: imx8mp-audiomix: Fix bad mask values
  dt-bindings: clock: document 8ULP's SIM LPAV
  clk: imx: add driver for imx8ulp's sim lpav
  reset: imx8mp-audiomix: Drop unneeded macros
  reset: imx8mp-audiomix: Switch to using regmap API
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
  arm64: dts: imx8ulp: add sim lpav node

 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  |  72 ++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  17 ++
 drivers/clk/imx/Kconfig                       |   1 +
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c        | 156 ++++++++++++++++
 drivers/reset/reset-imx8mp-audiomix.c         | 166 +++++++++++++-----
 include/dt-bindings/clock/imx8ulp-clock.h     |   5 +
 .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  |  16 ++
 8 files changed, 390 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h

-- 
2.43.0


