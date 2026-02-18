Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D0CE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H7XtaRuIPxfRhcMYJA9kulG6Q4s2rf98oWSp87W40rM=; b=Xp6vS2nYBjBGWE
	vXRevm3x9HTj4v5Sv1BSFF7H6kEAg+K1XMHRqYtjqMTxwfUHfN6tBuLq90e4tMCxDRFfT8ax/98NB
	aFgFAPvIOWthvrOKwsIahcvTgMJ7wz551Q4CE+yBV/02YLJln9rZlWcldJ/pK6ttWEjou8VrCrULb
	J7U/TZMeaGUUmh0/I9/WDKCacQNLUczHOwEcbKzVCt6zaCpP/boH/wxFA8lSb5raSGMBLlwJizsK0
	qKiLNEZm/oHHjVKNwgf4uPQkC8KxKDYoCU2Laz+i7JCYSucrxmL1hBqgLahwqvZnazxrsaJdYpFGN
	m6h81djfdPVe7TEFsoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoR0-0000000AObW-20le;
	Wed, 18 Feb 2026 20:46:10 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoQv-0000000AOZj-0TwE;
	Wed, 18 Feb 2026 20:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H7XtaRuIPxfRhcMYJA9kulG6Q4s2rf98oWSp87W40rM=; b=ZGFPwQ4pixAwL0t34Wrx4xj6JX
	Q0cTu5rLGqQPAUGQ7FWFQ0zKse/IPH9nws7QGHh0pDVycni+KFfobEXpfPLxiMhOirpYMbdnAmF6V
	FxfnZPVFTzrZhSc4LcUin46VzvP4ShSjzmRqBhrXu6xe/Q7XldZ38BivLLIbvmefF5gJUWQA2aYZj
	t8DOC6mVJaQNjngUS5DT9envtTxm4kfRmubXd6JWrA+ati43wKccOrAVw5qQGPKWnd4/rLDXkr9ZM
	KTxzs04HIEEZ/Rk3d8X1kqj/LdksJNUj0o6OJ94J5LcE2hjfZZKHpln4weRAKngWuGyvZNnfD9jXO
	cZ5fieqw==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoQi-002Czn-GK; Wed, 18 Feb 2026 21:45:52 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v6 0/6] Power Management for Raspberry Pi V3D GPU
Date: Wed, 18 Feb 2026 17:44:58 -0300
Message-Id: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMoklmkC/4XQwYrCMBAG4FeRnDeSmaRp6sn3EA9JM62BbSupR
 EX67qaC6FLKHv9h/m9gHmykGGhku82DRUphDEOfg/7ZsPpk+5Z48DkzFFiIEg1P0vPzcKXIO9v
 bljrqL5zIubyhfF1plqvnSE24vdjDMedTGC9DvL+uJJin/4AJuOClEU2F6EAosw+t/Q12Ww8dm
 8WEX4qEFQWzIiT6QjsBlVYLRb4VLQD0iiKzoghMqciA93qhqC8F1xSVldo26BvQXhEulOKjIMg
 VpZj/Yo2TBsjJsvqjTNP0BAyewnbRAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5109; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=O1ka8wN/2egai+Z0WLGQ9VHr2iyNeD91B67Yr4a+ga4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliTzyUruXXD52ZSPdNA+h3RkuoXCzppbfvQ8U
 RRSdfPkjkuJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk8wAKCRA/8w6Kdoj6
 qndQB/92zOHtrrJ/gTj8fwNfOA39H0x4Kex6w3MzPvqN5JyP7HiAaszXZaD6ibh5bpbXsQmdFZC
 xGOf8wujkBRUp95ONHnUkWpmP0lS/vocOOwjC+h7x0P4/Op+ahq9bkQYdbpPVffPeb5o7oofjFi
 KOM/fbuuTz+1ww7oE9PCctc0qPw4Esdk4IahtbqMe4lTcyIKM8Jm7ooV3WY5AmK9s9SOhadenxH
 pkhVG86ugcMNG2i74uBg/NeC7hFtTC6M3OHwNsT1cM8DkNinZrJu+Kro0RJeIXjPoAxA0xbh60z
 Bf2RCIyBDtCkJl6GmYYp57RJPXX3cCjD1JY1KIg4VAdrdbf6
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_124605_589299_A11EEDA2 
X-CRM114-Status: GOOD (  10.17  )
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
series applied to a Raspberry Pi 5, if we check `vcgencmd measure_clock
v3d`, we get:

(idle)

$ vcgencmd measure_clock v3d
frequency(0)=0

(running glmark2)

$ vcgencmd measure_clock v3d
frequency(0)=960016128

To ease testing on Raspberry Pi 4 and 5, I prepared a downstream branch
backporting this series to rpi-6.18.y [1].

[1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-v6

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
- [4/5] Make sure that resources are cleaned in the inverse order of allocation (Philipp Zabel)

v2 -> v3: https://lore.kernel.org/r/20250731-v3d-power-management-v2-0-032d56b01964@igalia.com

- Rebased on top of drm-misc-next
- Patches "[PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware
  fails", "[PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
  preparing/unpreparing", and "[PATCH v2 3/5] clk: bcm: rpi: Maximize
  V3D clock" were applied to clk-next.
- [1/4] NEW PATCH: "clk: bcm: rpi: Let V3D consumers manage clock rate"
- [2/4] NEW PATCH: "clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED"
- [3/4] Add Philipp's R-b (Philipp Zabel)
- [4/4] s/DRM_ERROR/drm_err
- [4/4] Set the clock rate to 0 during suspend and to the maximum rate during resume

v3 -> v4: https://lore.kernel.org/r/20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com

- Rebased on top of drm-misc-next
- [1/6, 3/6] Add Melissa's A-b (Melissa Wen)
- [2/6] NEW PATCH: "clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE
  behavior" (Stefan Wahren)
- [4/6] NEW PATCH: "drm/v3d: Use devm_reset_control_get_optional_exclusive()" (Melissa Wen)
- [5/6] Include more context in the commit message (Melissa Wen)
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

v5 -> v6: https://lore.kernel.org/r/20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com

- [1/6] NEW PATCH: "clk: bcm: rpi: Manage clock rate in prepare/unprepare
  callbacks" (Maxime Ripard)
    - Replaces "clk: bcm: rpi: Let V3D consumers manage clock rate" and
      "clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE
      behavior" 
- [6/6] Stop setting min and max clock rates directly in v3d (Maxime Ripard)

---
Maíra Canal (6):
      clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks
      clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED
      pmdomain: bcm: bcm2835-power: Increase ASB control timeout
      drm/v3d: Use devm_reset_control_get_optional_exclusive()
      drm/v3d: Allocate all resources before enabling the clock
      drm/v3d: Introduce Runtime Power Management

 drivers/clk/bcm/clk-raspberrypi.c    |  65 ++++++++------
 drivers/gpu/drm/v3d/Makefile         |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c    |  23 ++++-
 drivers/gpu/drm/v3d/v3d_drv.c        | 160 +++++++++++++++++------------------
 drivers/gpu/drm/v3d/v3d_drv.h        |  18 ++++
 drivers/gpu/drm/v3d/v3d_gem.c        |  18 ++--
 drivers/gpu/drm/v3d/v3d_irq.c        |  15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c        |  10 ++-
 drivers/gpu/drm/v3d/v3d_perfmon.c    |  18 +++-
 drivers/gpu/drm/v3d/v3d_power.c      |  83 ++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c     |  19 ++++-
 drivers/pmdomain/bcm/bcm2835-power.c |   5 +-
 12 files changed, 290 insertions(+), 147 deletions(-)
---
base-commit: 948e195dfaa56e48eabda591f97630502ff7e27e
change-id: 20250728-v3d-power-management-eebb2024dc96


