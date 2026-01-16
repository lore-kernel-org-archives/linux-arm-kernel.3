Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C34BC982C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pi/RgB1Unl19HefTzRzEML+gH6nwxFlmQo0yAUtLu50=; b=AA4MOtihxi7Hn9
	tId5BNTUZF3YB4q4MZNQw98Ek/K8sE4U9MQv8xpKuCjGX/1Dx3Fn06iBo4CPPNDDOclX18ZyAZGCJ
	s/dNpkGwU3T4eyh5bPXEWIKDUkNsIQh8f/axrpYK9i2X7jH4N9q6GHYfUIIQ+HaJheXKmv3jpCTz9
	z/mSgBjXof9d+saguGV84pQ6bfg0Q3Vn07IL9wwMWzis0wXMrRDIFjgFlCQqQk/Utq+CEqxLVbb/B
	6cpHHoRsewdK4NKDH9pHgSFhaU9eUDX/LxZg5n+skVwD2CplQXWtKxWBy+IQol5ATnOXDebZ0waOw
	+bmmUrxiwGzM+PTMIn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqIh-0000000Enyd-3ljU;
	Fri, 16 Jan 2026 20:20:07 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqIb-0000000EnvW-0B8b;
	Fri, 16 Jan 2026 20:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pi/RgB1Unl19HefTzRzEML+gH6nwxFlmQo0yAUtLu50=; b=gPZ/XnEfysgzVoe7cAHYKmaSM6
	MnV3MbHFJstrlliwKK8D4lydxC3BNKdgBmmI+vlP33T2NpuQpSlnkIi2X3w6I1ymmTwEz/oBsNa7f
	tfSUuXdjgCx4K7OtIQ5Kq2pWih4NfO+yw3fJxmlcoANr6JbfVVr/Hc282XZqbNlxQdsBiDVUeDyLq
	1kRBQbNjykWiMnNvobOVRaWAN/3TyOY/IaPg7lhSfAR8LSEEuMvWE+nJlVPQStxb66psi4R/6wrdL
	5ofbJeVpjtVyMsbgHLKyviNuyRLZ7O1zYf04VOCJvqc53ZlTu+czwwWU3ybuvRdinaQbwn43YfAtd
	eNVbgJ7A==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vgqIL-006Ixj-NB; Fri, 16 Jan 2026 21:19:45 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 0/4] Power Management for Raspberry Pi V3D GPU
Date: Fri, 16 Jan 2026 17:19:21 -0300
Message-Id: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEmdamkC/4XNzQ7CIAzA8VcxnMVA2acn38N4gNFtTdxYYEHNs
 neX7aQH4/HftL8uLKAnDOx8WJjHSIHcmEIdD6zp9dghJ5uagYBclFDxqCyf3AM9H/SoOxxwnDm
 iMWkjs01dsHQ6eWzpubPXW+qewuz8a/8S5Tb9A0bJBS8r0dYARoqsulCn76RPjRvYJkb4UJT8o
 UBShAKbF0bIusi+lHVd3/BRqc//AAAA
X-Change-ID: 20250728-v3d-power-management-eebb2024dc96
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3820; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=7LO6dBysStjJCgGOxwLNnnvymrV1b0iyEoeH8+uq/HU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpap1XGa785xzblDV26B8st9hr/i9zDrBoX3wgT
 b/N4WHsEkCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWqdVwAKCRA/8w6Kdoj6
 qsIfCACTw1ugyC8RJ61VNgnGoOTjZFRX4EEkp3B0G6ZuumCDGEHD955np+TUPNOFFxmNpZL8rqE
 UTqzZKRnJWzC3twgvonI2geHhx34TYNufK+Q/khzBmFFtiOGQ09kelxiKPdDvoDEEItk24SDMoA
 2ci4k56418zrWjSKBOR/d86t0h51fyj7Jmsi89SVdH4T+pU5CAEYnaYG5c0bwSiQj8d0xXCZTND
 tie3GjV26cDjZJzvV6wLSeIXKzq2+PyOtbyUTpsiOer0RTqKTaRv0W2NpUC5vGWuC+ITtQvM0MP
 zJNIhLh2mkoyjvjcWp2P+2PPnqHLDQoodu3IgrfN5/4AVAtw
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_122001_465282_A169D735 
X-CRM114-Status: GOOD (  13.72  )
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

One particular change was required in this version to ensure a
meaningful reduction in idle power consumption: the V3D clock rate must
be explicitly set to the minimum rate during suspend. As explained in
an inline comment, this is needed as some firmware versions may not
fully power off the clock when its state is set to off. This issue can
be mitigated by setting the clock rate to 0 during suspend. For this
same reason, PATCH 1/4 has been added in this version.

Apart from that, the v3d patches are mostly identical to v2, but rebased
on top of drm-misc-next.

To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
backporting this series to rpi-6.18.y [1].

[1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-6.18

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
- [4/4] s/drm_err/DRM_ERROR
- [4/4] Set the clock rate to 0 during suspend and to the maximum rate
  during resume

---
Maíra Canal (4):
      clk: bcm: rpi: Let V3D consumers manage clock rate
      clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED
      drm/v3d: Allocate all resources before enabling the clock
      drm/v3d: Introduce Runtime Power Management

 drivers/clk/bcm/clk-raspberrypi.c |   9 +--
 drivers/gpu/drm/v3d/Makefile      |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c |  23 +++++-
 drivers/gpu/drm/v3d/v3d_drv.c     | 163 ++++++++++++++++++--------------------
 drivers/gpu/drm/v3d/v3d_drv.h     |  23 +++++-
 drivers/gpu/drm/v3d/v3d_gem.c     |  21 ++++-
 drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
 drivers/gpu/drm/v3d/v3d_power.c   |  96 ++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
 10 files changed, 270 insertions(+), 114 deletions(-)
---
base-commit: 26b4309a3ab82a0697751cde52eb336c29c19035
change-id: 20250728-v3d-power-management-eebb2024dc96


