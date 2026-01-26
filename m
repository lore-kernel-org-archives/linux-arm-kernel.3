Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050F7D19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WzBUc5N1uABfKTBaSkUrbtG7cZ34SqM6HHCoVrUSUaA=; b=b0GywBM1qPXvLdTtxbBGBcQgQH
	GB1IL0fhRXeHEeJPAxsUgD7byeASzfwLnt8mCif6RBaK7u8Po9KHPr8iepCtB9oQBkeKJcR8diZ/F
	MRiy3qgetoV51g5XtbhOTEMgYC8oqQDiIFOrc2iq5Qkp5o3XIE2RTCuibMV6+tO9N8vLUKWSnDVOn
	idGU+JJS3lH3iB6CGnUqVo7wrsIITUDH1itcNaEU/VJE8br6MHcGGx5TXqhaSQUH/dP9c0XEZ1EzL
	GaHLQ1TzJ7mJ1SXjhMg7Q0V/ebZWyXu2VAs2A2CUiXJDBvkECSmzbYVNv5emIfoUzrJUVJOrtARye
	mKVzk1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPLx-0000000Cr1w-29C8;
	Mon, 26 Jan 2026 16:22:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPLv-0000000Cr1G-0SCW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:22:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so52354995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444529; x=1770049329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WzBUc5N1uABfKTBaSkUrbtG7cZ34SqM6HHCoVrUSUaA=;
        b=Qb2ZlWVKxBXonCCFS6bH3+2HVyB2dIO2zkDoWqosxooyBYkHHLfcfAOHiAY+yFkVgW
         yYePwb0+MTjdw2+JAUzkL6j2ai/9/o0vh4qSH/33dY1I++HdsPOgOEG0QiRKpdsqzK/4
         5W4eBOGsiArKoXjeWvkhI0BtyvBbWrwnYWrbM9cUeUfrAKmB8mziU4M9pFy29XrxtLAz
         XJPzmrufvr+S2xvriZwA8g/SDLXloj/382mBESglHih3NFz9/qhcUh9npdFapaKIoZhS
         pzInroeyeBaknm4LaneN1l5tKFOCaV3s8UC8eB9aMybmLDnxTwNQWZzF/8eFtAlb58lC
         JDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444529; x=1770049329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzBUc5N1uABfKTBaSkUrbtG7cZ34SqM6HHCoVrUSUaA=;
        b=XM3uQeMxQh1ttB32zdZQllkQw/H27Nu8vR3l318vynoptN2dl2K3/O2g6JkyqtoCQi
         uWl5BF36u/5GISbKiCX+pTFFPxSFIN4tzYmv8m1GV8kOYUrKKT2MKgqLloSssacKEXG2
         nJsOyeevjlkj2sLi2nmEJSlN52p44no4Usy76MCFNgyYmOsUfU2k8+pcm/2fdsWxdKq1
         aSNP8nCA19rtQH0lbSW3/5CtY2pcIQe+lSI08lKM6mFv6i+SfRlUQvpHdv3m0+W+VBVK
         DtA2buzMYo3vhDagJ9CsMYSjN1RbQet4lPsSbcod0jqU9cXCXBdfUSNtKI7mmIAiFj6F
         zdjA==
X-Forwarded-Encrypted: i=1; AJvYcCW0epgdDIPGfSpBzUzzeYkeZ17lRN55I8uYca8BjeJ0uJbEIvuD+vwPMgMfxhW6c7JGXzOnwj/0Tpc7SHjN068m@lists.infradead.org
X-Gm-Message-State: AOJu0YwuIViL1LVOp5GBknt6b8EHoIalNkaSs2KsyGpbNMQ2eoleli2Y
	4SGcPvMIN5+STbpPoQJDyhOiO+lRf5JG8tsLVMsOD9X9Ac8H8AlbqwaW
X-Gm-Gg: AZuq6aIXl81A41Wz6Z8USxjOctol8z/q/f4fo2b99Hc5lCePvCtyEbVXyQi137sJB/7
	SqkdJB5twHVwlUN9d+j3cLmVKlY2Xjasyv6L/ZnMBrzRQ1IBVINeQSIsSzlWMQAIn5uRy8X35dX
	//U6n63Nk/iyP44d9Rpr8bodYrgNnuhLKOtAH8T3FrmjWMYkHlGTC/LTL+KioQIQXTsTtcI+HO5
	oZnPt1swacMsLJiRN/hiMl+fxLEcmNaryhkgp/FaO5CwiFynwLadUKy+Ne+9ldOBWwIjPVZ7X6F
	rtmNHSmnMIGLQyQp/399hvE8ngIuA5fXYn5KyKbLjIq/z0mVmXfUr7EQU+OA51LDIoGGWTFoe/K
	crWiqYvnae0dnwo++pB9M7zgkItymj00yAcFdOtclJkLcPyntSx52XaQKhw0HMlypcnR7/F4Fwd
	75eHoyCtZ5FuAr1VqrXCL84fdmEAS1uluZWlap5w==
X-Received: by 2002:a05:600c:3e1a:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-4805ce4e55dmr88548785e9.10.1769444528753;
        Mon, 26 Jan 2026 08:22:08 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:08 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 0/4] Add support for i.MX8ULP's SIM LPAV
Date: Mon, 26 Jan 2026 08:21:59 -0800
Message-ID: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_082211_175644_B97090DB 
X-CRM114-Status: GOOD (  19.25  )
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
Changes in v7:

* drop the DTS-related patch, which was already picked up by Shawn.
* link to v6: https://lore.kernel.org/lkml/20251126124218.803-1-laurentiumihalcea111@gmail.com/

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

Laurentiu Mihalcea (4):
  reset: imx8mp-audiomix: Drop unneeded macros
  reset: imx8mp-audiomix: Switch to using regmap API
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV

 drivers/reset/reset-imx8mp-audiomix.c | 169 +++++++++++++++++++-------
 1 file changed, 125 insertions(+), 44 deletions(-)

-- 
2.43.0


