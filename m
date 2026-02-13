Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE6AEF99C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=txKv3cVQrZKTkqyDAzIwNqeoNl4lUFsfj4I12QJs6VA=; b=SyU/wAoVFq6s4t
	qJTiX3XowfzNFQv/kFPtmena46OGlQjDO1zSXxc/TtO1dZCcej5+y+UzK0B0Nmu99H3EJwPvICnul
	TXF7fcf9YyNEm7/j8PolqrBTquict42/NwO3nL6lFMht5Owo23GwY9DDkuprr+SoT9VsYvZYubaMg
	j/yAGUc6zzi8vdFkTl57q13AsFqNW51jthERZGz+8jf+zKTuIEqBpU0eZxGpirerio+d0Rbcm4C40
	bPvsCWFIOxoRgPmQp58H8ELBzAririXyDypAQVDCGtl0VmCEwjjZtjmZ716jRH/p1WmEPsx6BIUcz
	AqfapvgvS2nNX5rRBWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyIl-00000003o8Z-0tfq;
	Fri, 13 Feb 2026 18:54:03 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqyIa-00000003o1n-0282;
	Fri, 13 Feb 2026 18:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=txKv3cVQrZKTkqyDAzIwNqeoNl4lUFsfj4I12QJs6VA=; b=eqJ0WcTxn5/Ax8U/tzickw/MyD
	FKMudGpidszUaqvzamdv5bKZZ9zdsJ5PZKo9dJ62p1LLwQIvOcjcuR+NTf6PdK5iSq8ht+0dAmFMD
	JMklkfeFUb5VF4KI1xw8FvZUZ4ienM3Bilg+8PgFx+bPG4uqkIK2R9kVHg3jaVXChXuo14U11jGwX
	IebcFEFDoLibgiTZd2QJKX3c9jAAfODYqIgReZqiLG97Ogu3c/9p8hSQjtbF3cYuqVvC/I/4m3N+p
	hfqRO/VcUGK2s6xOJUyZmWSCTIFySSBMgBF4GBrjHRgUiJFWQ5PC/3ZKByEIjCVgKbUQliuRMr3bS
	fDtUWAaQ==;
Received: from [187.36.210.68] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vqyIG-000Sqv-TO; Fri, 13 Feb 2026 19:53:33 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v5 0/7] Power Management for Raspberry Pi V3D GPU
Date: Fri, 13 Feb 2026 15:52:53 -0300
Message-Id: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAZzj2kC/4XNzQrCMAzA8VeRnq00add1nnwP8dCt2Sy4Dzqpi
 uzd7QaCIsPjPyS/PNlIwdPI9psnCxT96PsuRbbdsOpsu4a4d6kZCsxEjoZH6fjQ3yjw1na2oZa
 6Kycqy7ShXFVolk6HQLW/L+zxlPrsx2sfHsuXCPP0DxiBC54bUReIJQhlDr6xF293Vd+yWYz4o
 UhYUTApQqLLdCmg0OpHkW9FCwC9osikKAKTKzLgnP5R1IeCa4pKSmVrdDVopwi/lGmaXnVhg9q
 LAQAA
X-Change-ID: 20250728-v3d-power-management-eebb2024dc96
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4729; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=0EVfKIvCHzcJxJ1ZmhXGh4Tz/RasBDlQrEbZddzRlns=;
 b=owGbwMvMwMFo/5mvq6zj1yrG02pJDJn9xcrv/KXTzI8/clis8WHlTv4ddReXqlyblLjFOj2Le
 89Zo+6/nYzGLAyMHAyyYoosP57E1jKKlbNrLiu/CDOIlQlkCgMXpwBMhDuS/Z/ttQBbntM7VwX0
 RJ1VWOGXwB7O8f7u3+X7p5y2MQ38KefOmF6zUHBfdLYOl826LKuMzpQAvz5vLktfgRPqbAwl245
 M79tRa8/+bBEze3fF8alsu3oaFLuaUhiDlRM/X+LVLH9VL/d8Zv/fyuQqv+LfCoL6M//PqrH7JM
 adeq+LP/do9HVTd+b9U0SfJql6sOt4aDiu+Pzr+i5uy+kCv6wL+pWul3ZfubvOXkKr509Mb2pdw
 OW5ncnNDAd//34yR1h9dmHR3lXfQ4urvi+ckLqBt8F+tg9DltmDuRkLn2rFF//bkc14iHtz8tWI
 gv7W9nVa9hGN/tZO3jFabCyST5JuHNnlK/F0s/3a5X0A
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_105353_165080_2142BEAF 
X-CRM114-Status: GOOD (  10.78  )
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

This series introduces Runtime Power Management (PM) support for the
Raspberry Pi V3D GPU.

Currently, the V3D clock remains enabled for the entire system uptime,
even when the GPU is idle. With the introduction of Runtime PM, the
clock can now be disabled during idle periods. For example, with this
series applied on a Raspberry Pi 5, if we check `vcgencmd measure_clock
v3d`, we get:

(idle)

$ vcgencmd measure_clock v3d
frequency(0)=0

(running glmark2)

$ vcgencmd measure_clock v3d
frequency(0)=960016128

To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
backporting this series to rpi-6.18.y [1].

[1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-v5

Best regards,
- Maíra

---
v1 -> v2: https://lore.kernel.org/r/20250728-v3d-power-management-v1-0-780f922b1048@igalia.com

- [1/5] NEW PATCH: "clk: bcm: rpi: Add missing logs if firmware fails" (Stefan Wahren)
- [2/5] Remove the "Fixes:" tag (Stefan Wahren)
- [2/5] dev_err_ratelimited() instead of dev_err() (Stefan Wahren)
- [2/5] Instead of logging the clock ID, use clk_hw_get_name(hw) to log the name (Stefan Wahren)
- [2/5] Add a newline character at the end of the log message (Stefan Wahren)
- [2/5] Use CLK_IS_CRITICAL for all clocks that can't be disabled (Maxime Ripard)
- [3/5] NEW PATCH: "clk: bcm: rpi: Maximize V3D clock"
- [4/5] Use devm_reset_control_get_optional_exclusive() (Philipp Zabel)
- [4/5] Make sure that resource are cleaned in the inverse order of allocation (Philipp Zabel)

v2 -> v3: https://lore.kernel.org/r/20250731-v3d-power-management-v2-0-032d56b01964@igalia.com

- Rebased on top of drm-misc-next
- Patches "[PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware
  fails", "[PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
  preparing/unpreparing", and "[PATCH v2 3/5] clk: bcm: rpi: Maximize
  V3D clock" were applied to clk-next.
- [1/4] NEW PATCH: "clk: bcm: rpi: Let V3D consumers manage clock rate"
- [2/4] NEW PATCH: "clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED"
- [3/4] Added Philipp's R-b (Philipp Zabel)
- [4/4] s/DRM_ERROR/drm_err
- [4/4] Set the clock rate to 0 during suspend and to the maximum rate
  during resume

v3 -> v4: https://lore.kernel.org/r/20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com

- Rebased on top of drm-misc-next
- [1/6, 3/6] Add Melissa's A-b (Melissa Wen)
- [2/6] NEW PATCH: "clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE
  behavior" (Stefan Wahren)
- [4/6] NEW PATCH: "drm/v3d: Use devm_reset_control_get_optional_exclusive()" (Melissa Wen)
- [5/6] Include more context to the commit message (Melissa Wen)
- [5/6, 6/6] Instead of creating the function v3d_gem_allocate(), use v3d_gem_init()
  and move HW initialization out of it (Melissa Wen)

v4 -> v5: https://lore.kernel.org/r/20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com

- [2/7] Add Stefan's A-b (Stefan Wahren)
- [2/7, 5/7, 6/7] Add Melissa's R-b (Melissa Wen)
- [4/7] NEW PATCH: "pmdomain: bcm: bcm2835-power: Increase ASB control timeout"
- [7/7] Remove redundant pm_runtime_mark_last_busy() from v3d_pm_runtime_put()
- [7/7] Use pm_runtime_get_if_active() in v3d_mmu_flush_all() instead of
  pm_runtime_get_noresume() + pm_runtime_active()
- [7/7] Add missing PM runtime calls to v3d_perfmon_start() and v3d_perfmon_stop()

---
Maíra Canal (7):
      clk: bcm: rpi: Let V3D consumers manage clock rate
      clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE behavior
      clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED
      pmdomain: bcm: bcm2835-power: Increase ASB control timeout
      drm/v3d: Use devm_reset_control_get_optional_exclusive()
      drm/v3d: Allocate all resources before enabling the clock
      drm/v3d: Introduce Runtime Power Management

 drivers/clk/bcm/clk-raspberrypi.c    |  15 ++--
 drivers/gpu/drm/v3d/Makefile         |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c    |  23 ++++-
 drivers/gpu/drm/v3d/v3d_drv.c        | 163 +++++++++++++++++------------------
 drivers/gpu/drm/v3d/v3d_drv.h        |  20 +++++
 drivers/gpu/drm/v3d/v3d_gem.c        |  25 +++---
 drivers/gpu/drm/v3d/v3d_irq.c        |  15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c        |  10 ++-
 drivers/gpu/drm/v3d/v3d_perfmon.c    |  18 +++-
 drivers/gpu/drm/v3d/v3d_power.c      |  96 +++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c     |  19 +++-
 drivers/pmdomain/bcm/bcm2835-power.c |   5 +-
 12 files changed, 286 insertions(+), 126 deletions(-)
---
base-commit: df4dc947c46bb9f80038f52c6e38cb2d40c10e50
change-id: 20250728-v3d-power-management-eebb2024dc96


