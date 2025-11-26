Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE974D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wyKInZW9vOOeMqe71nBxJ7HXJ/bNznUlqhwyoDm1B3s=; b=i0oXZDkDsNvi+xJqTSNqxXpor0
	57TyiXECTfBMC5FTZTZnT9B9Nex9AL2sT+gQXkM8EqcxNCgyVCJUKbsAz0vTMghndQKm8mb2UIbgM
	741OMyypVovpLhR+oMTfIDfPclOA2Y8+5V/fIcY58vz+qv3Aaq/tk5wCJ/zGW6H4HbpszXs368tSa
	4UpvWmoZugFNHz2yd/Y+VfsnbXBpvvGgZnQjKt8DEad8hc5m/W0651h3P9CmKoT55ztYk7LZxASmn
	flW9xzX2hSwaprkonKo48xC2qG1yaUynu6yLAQZ4MUz+FYNoEkrCKhT13z3yfV/LzqSeU2stLnIk6
	LskmqAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErR-0000000Ezis-0W7M;
	Wed, 26 Nov 2025 12:43:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErM-0000000EziH-3VjM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:43:03 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so11302148a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 04:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160978; x=1764765778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyKInZW9vOOeMqe71nBxJ7HXJ/bNznUlqhwyoDm1B3s=;
        b=Vmz0/1jiQp8YU9DcG6YHo7HlH6icPF6A/vgzJfdcdSExXUPerd/3yXAfYxs4Hl7zh3
         +4yoKoXb8YHb49C7k9xsIdY8a1R1UCu/7d1JAtdMNY7C4ftL1kBqz6ntu1nAuKHnlPpf
         EK6ELVtvQFqKXD9uKYqPicO4OzQwI+7OqnA25/g/cBvbZkwDNhCEpqXQSj/EV8GJOS6Q
         lytrOxnlOk60YbOZpEC+CaPwBQV9m9o92D28pTxC66hiKZhLBW2LrLr7HniekCdZF3t8
         jaUXPsucdL8Srmy6kUdCi16mlCdn5FtBe1D6d3iSdqLpljvNf1W/nZc3MXdRssDt2Uxq
         SQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160978; x=1764765778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyKInZW9vOOeMqe71nBxJ7HXJ/bNznUlqhwyoDm1B3s=;
        b=Xsb025JyhrIMhnxXTRWMjaUJTqC+2xsRVfD5jJMk4HUcj69+lc2Pd/+iAoh4wdRhgw
         vJ7pQAZJATtQb+h9GUHye3AgcqSnv/EZL6PEGlDSLtftsdKG5nVN6wMkSztD0HWPplyg
         RVN5nxU1nzwzpez9UwYtoMGMIkI3pj5mjLT/4DZqJkBJV5co0qfY+biI491hdou1Nzik
         zW93kuMbB4w+jvINe94VrZWT3SsiP6Lh+zWVwYnViCy+kl/FMZvAZNo7C9Zo4rcXHGrE
         GYMeoa1f+NzS9GEbrrPB+F8+6tTUzsUp7SwwICnRPu9tmXGM3Bqg/oxhOpNye8+6Gvlf
         jzfw==
X-Forwarded-Encrypted: i=1; AJvYcCU697b5rnlFVju5lypo0UD2XooQYxxBrVaLIkGlLCIZyaEKQDOlt7IVrECOg5gwgULbj2xEkiNHjyIGR0neuIbQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3BmgokUqxiaLnLAUvzUCuPdoi9sNNmvuz9bopgDMc5NeVAYXO
	4IZLW6oSNBku7iS2r/e+65LFTctcoj85hdzYZhLfItNgAWpGhwZnryX+
X-Gm-Gg: ASbGncuNpXsNIuKJynVZTWIheoCnFaXv9dsSFI6oiPMkcIWwWUqKWVRQfz5Ch45Orz5
	hWwNts4RALW9QKl71WUtbigcDajoo2YFO0Ac/+1pf5F5C6nuMKMhdWz7SbW22LTY3W0jyMl1Fmn
	yuob9tAbqX+IRn5gVTCRLKAhLnemRa8RzobjtuiAuCZygPdBAPqeSFtOjsUpOcvTXMnrteXP0J9
	ZJpw1bSPLcebGIUnry2/Lv/UpD1vyTzWhvw3H2VTMeM56lpIr6O9bmQ0Dn/9yEW12p8gM1PeAMm
	Rxf6AoIx7Yad0fmfX+euNCB4LssNvTD3+A/QpRDybwG4sPTYR5xSXU9gx2852BSUNeu4nLv0uVK
	IZzyl/7uzOglJtPnIzJxfuRfyE93Tp7KlgOt4U8gNupiEaIccP2C/huMw69teIpRXhX7xYMtA7Y
	MCLESSe15Y0iSStOcmJJ4iqPcf41so3Pqz4C5T
X-Google-Smtp-Source: AGHT+IElqG7jPteIbIhzrUyHVFQTvghK+ylGI6dlqjj76G/QOs8gr0LlFJkvAARUAUVCGYrcNiuMVQ==
X-Received: by 2002:a05:6402:2787:b0:641:2a61:7da2 with SMTP id 4fb4d7f45d1cf-64555be1db0mr17215942a12.17.1764160978101;
        Wed, 26 Nov 2025 04:42:58 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:42:57 -0800 (PST)
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
Subject: [PATCH v6 0/5] Add support for i.MX8ULP's SIM LPAV
Date: Wed, 26 Nov 2025 04:42:13 -0800
Message-ID: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_044301_714021_E26A55BB 
X-CRM114-Status: GOOD (  19.77  )
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
Changes in v6:

* store a "const struct imx8mp_reset_map" pointer instead of
  a "const struct imx8mp_reset_info" pointer in
  "struct imx8mp_audiomix_reset"
* switch back to the mask-based approach
* link to v5: https://lore.kernel.org/lkml/20251114133738.1762-1-laurentiumihalcea111@gmail.com/

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

Laurentiu Mihalcea (5):
  reset: imx8mp-audiomix: Drop unneeded macros
  reset: imx8mp-audiomix: Switch to using regmap API
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
  arm64: dts: imx8ulp: add sim lpav node

 arch/arm64/boot/dts/freescale/imx8ulp.dtsi |  17 +++
 drivers/reset/reset-imx8mp-audiomix.c      | 169 +++++++++++++++------
 2 files changed, 142 insertions(+), 44 deletions(-)

-- 
2.43.0


