Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503C8CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t3O1Iu/ksHRGyZsz6LMTY3M2UTA+pLqkjIUkkgFcc18=; b=E/9DMM5c3MZ0oeIRjndlxlB39n
	z4+4AZkMEdQLBrPDulAA/9xYYaht/wKJoftnRnqkzT1WkjxLknffpNS6U17WkTKpMC59JvBHU01Lk
	7FcuvcXz84eAPDNdp4HMlyJ7Q0anpyIocuHpwPyugQgvzuxzoqHAYHzurIglizT3wVh0UXJLbzlot
	ydEdZ02/+seN1IO8dcAdgJHCRSW8/KfxgnaGW3XELFtw/d8xAxntXDpGEw5w9gwJDjkRUsdYZCKMZ
	X152zJdhCSpGFpAxPppPMLnMuJ4sR/uNTblmaHb/iOT/quBiXkUX6JNwSjfXcS862/QXHm1XWZwRk
	dicORhjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6eg-00000001SfE-19EV;
	Wed, 29 Oct 2025 13:56:02 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6ed-00000001SeV-2KBe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:56:00 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so1507546266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746157; x=1762350957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3O1Iu/ksHRGyZsz6LMTY3M2UTA+pLqkjIUkkgFcc18=;
        b=hydAcs7M+Gugonk2lFxO6sLeXKJMKBDZGDCVRq1mtFHhXMj/412/Eec9rq3K/P25l6
         Fj/yLzJhIBCs2vq/upwYYG62IjmMelCbs48VH74928rNOXIUPZmzydyrFGAX5ZbbvCCR
         anRkblZxx/zvSalxnxxnTRh7zi4u5iQcmxsCIG92UBe/02NOsOAU9TRZSgPEtS7h+9G3
         u6N04Wg8DG2Ppu3pHRyiG+KfNpOpels8CLYz9U0TIX0OVkOgzBnS271VbdKwKA/GJMRx
         ebOIpaWT1fZiwNPuFz9RHWLzUBnRev0yT9j2TQDXemexPx2ssx7kqT41oUL31T1109f1
         e7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746157; x=1762350957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3O1Iu/ksHRGyZsz6LMTY3M2UTA+pLqkjIUkkgFcc18=;
        b=qL/2/EbwkguD8NL2iteRdCxaDGl9WHCqti2fCFbUtyki+J5GM+wxxpQwX8ofRoo2wn
         rW9Nst/4q5x42iBZRL6eURsOOBuUFUQR7EMo+qaFuXtPFXJfWl6p6YYmJWKZNjJCkV0A
         07V59WrzM5Ip5ZfT3M8duZEo35GhuBJlmPEF7tk3PiW4rQOhzeOqb7tQfFVoGCOFp2GD
         JVAAW3oBqhY7liwg374uvUCCBdXVji48WlxwDPhqRXrNaevQnj5gE5ZOy+otDgBQCpfa
         7YK45txo0BxbR5J5rfx9GI/7pHzoTQZ9FO8jeq0tNNWx8QuftQiqTyHkpEwFJJFow0Wt
         5qRg==
X-Forwarded-Encrypted: i=1; AJvYcCWTRdUmnXx8cyd0rMOEsV2cNFZP4Vh7RtmhLjtWXrWN1N3VT0mkumml+mva40RgV7+gkAOgIweXiGaliTn3ugjd@lists.infradead.org
X-Gm-Message-State: AOJu0Yymait7KV3pNWigYfQZ5AI7/KaP7rQ77BG1TKxZb5uSP2iR9Kb6
	YqCkqIdc1Mx8hzXiAsUcJKhcy0bMh+m/kaDkXJ2ZxmIQUDzCQ5nLFC2n
X-Gm-Gg: ASbGncu7OJNDj5kFFFpQ9UdRCihwgCGaKYCRmcCW9Qp1JNyieVyLRDfTRRyULLnG8Wb
	pNOBUhFOpn8jQ+shT2+DzAhKdOw7RhtUvf+1aGwpCfqyVMo6t5m2NaJpzrfnsHCmupxIeCth9iy
	XYPEKltjHBWTbEeWXVyiQmpGOWJWHINBspyab//SBZf78cpm/rgaVGSZbYYwlnETp9hNTYTR5zs
	RTGWjYVzsT2XJtXMr4RYWJEt6fAqmUlOILXQr4hLang+UwtSljkrepx/MKx62kfY6fkMWyUXOsS
	+i125bnKm+GMgGBJDpPgR8kkGvjW61wGXqsu222IGPEhjpz2RVlAc+wQsdY2EIFyTp1NYvt+2uc
	rSw2RIHyU0Jsu0/tPN89E1Hg748yuTx5QkJ80XjnpxFQsQGKJzbneHBGXFO4Y7zssvW0zsYiI31
	VFxO7OU4TPnVNy7V3ZwrJN61PTiA==
X-Google-Smtp-Source: AGHT+IG3fjXdxPy5yprhsiCpSi+P154WFnEbny0GwxKhkE7eZydOCcZ5Zo9k8sLJC5ZAu8sCW+HiNg==
X-Received: by 2002:a17:906:ee8b:b0:b45:913d:f523 with SMTP id a640c23a62f3a-b703d2fe6ffmr341163266b.18.1761746157108;
        Wed, 29 Oct 2025 06:55:57 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:55:56 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 0/8] Add support for i.MX8ULP's SIM LPAV
Date: Wed, 29 Oct 2025 06:52:21 -0700
Message-ID: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_065559_641096_4A370844 
X-CRM114-Status: GOOD (  20.58  )
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
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c        | 160 +++++++++++++++++
 drivers/reset/reset-imx8mp-audiomix.c         | 164 +++++++++++++-----
 include/dt-bindings/clock/imx8ulp-clock.h     |   5 +
 .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  |  16 ++
 7 files changed, 392 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h

-- 
2.43.0


