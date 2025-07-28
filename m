Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7413C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VU5EK1O4shzZ8WGIAcVRMsxGJyv6yO+NIH7YM+/dws8=; b=GWpWo1/00Gxha+
	VShwpZ2Q+nBdrliKLcUVC+A8HTT9IDJPpFjhgOr5H5WqgnPuXIK9lFB5ogNhOyT7OaSQMmC19+Am8
	UIt3z4yU3W9m8lCO6Kd7mZiQsaVMXWiaupt/cK9NFxev9tIwEr0YhaK3N+BA0691MbB3UVhaxQvZ/
	cQXo8X6L49ErQaFNzrxxcUAg0kAEbHeu7nIe+Rj0vcHtoTm3WWMnL+OKPrmBXT+jUjxCay27EGjgX
	tPy79nG3D/GDnlsRuKYHASqjjfKGO2U6p3lDtEYx76Qy+g5Ul+tc5ShZdYga9M8TZKkFOcG8GaqIe
	9xT5Q5yIQfNZioYiiSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugNAm-0000000ERlN-1j2j;
	Mon, 28 Jul 2025 12:41:44 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugN5p-0000000ERPq-0s0p;
	Mon, 28 Jul 2025 12:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VU5EK1O4shzZ8WGIAcVRMsxGJyv6yO+NIH7YM+/dws8=; b=g/G/d37qRoSQYNoY4eyNEcay0E
	xUT06QBjmYiuYibLdQqFPj4tUxNPOX7A8CrXybeLdMoIH8YcJ2BaMUHstLhrAZ+GZ7mTdl8OUujWo
	JkKjx9CkmkLwyT38QlR4q2yop4SKRgWUFPi6BCG4cvclPyZdBvzK93a+loKCobwzWruY6OSpFlNPO
	IGGKsvfmLlw9WAaXhyBUOCHWc24zF3czNwzKtl48h9WLoUvfXTPmMDhqekJZAhGrgQEZuO71e4agh
	vOuKOb+i3lencN+PyWRi26tH2RrfnCE8GZqS19CbFUrb0fbMipBdV1cS9qDnexsuQRB4/lbLs190+
	7ZROmRSA==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1ugN5Y-004u0J-Cz; Mon, 28 Jul 2025 14:36:20 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/3] Power Management for Raspberry Pi V3D GPU
Date: Mon, 28 Jul 2025 09:35:37 -0300
Message-Id: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJpuh2gC/x2MTQ5AMBQGryJv7SXUv6uIRemHt1DSChJxd43lJ
 DPzkIcTeGqjhxxO8bLZAGkc0bhoO4PFBCaVqCKpVM1nZnjfLjhetdUzVtiDgWEIRm7GpqSQ7g6
 T3P+269/3A+c97xRmAAAA
X-Change-ID: 20250728-v3d-power-management-eebb2024dc96
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=VZB4TY2XDNSiEWoEhnr9I9NCUpRbewBq82IBfHPpAQM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoh26+klHq7mJ02coyITsL7uFituOV+joiNpDlJ
 Ac53ERSxhyJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIduvgAKCRA/8w6Kdoj6
 qhriB/4k4oXHgtpfuTtVv1M43tkR3ikAAMqGVrZOhRjUU3YtAnc5czLrQoN50cuEH825AtRVr8g
 04E8V7ypYKUTVqfeZSTJuVBhMWgAymMtoGyKZIaEPkf40Hv3S+FzyB6XeYQ77zrYm6fTS/nio5k
 E3zTKxb9rNcoFFoY5pQIdXLN8L9dT6hsPC0JWUVAzabiBUp7IQjw4xOjgyDtHGPcG2DnH6+8fQy
 a40ufjlCI/CMN8iH+fHx5f+puGqjk80nOoVea7gt8/tS1VUI/lMgkI/NzHbIgD0IcvPBiJBxyw5
 dy2J5iCCkgE1U2kDjGEnq/84yvokfc1H8RAMTwmHT2S45o+l
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_053637_235259_EA92C6DA 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

This series introduces Runtime PM for Raspberry Pi's GPU, V3D.
Currently, the GPU clock stays up during the whole operation, even if
the GPU is idle. By introducing Runtime PM, we can now turn off the
clock completely during idle. For example, with this series, when
checking `vcgencmd measure_clock v3d` in the Raspberry Pi 5, we get:

(idle)

$ vcgencmd measure_clock v3d
frequency(0)=0

(running glmark2)

$ vcgencmd measure_clock v3d
frequency(0)=960016128

To implement PM for V3D, it was needed to add a prepare and unprepare
hook to RPi's firmware clocks. Currently, they don't turn on and off,
nor lower the clock rate. Therefore, PATCH 1/3 addresses this issue in
clk/bcm/clk-raspberrypi.c.

The other two patches are related to PM enablement in the V3D driver.

To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
backporting this series to rpi-6.12.y [1].

[1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-v2

Best Regards,
- Maíra

---
Maíra Canal (3):
      clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing
      drm/v3d: Allocate all resources before enabling the clock
      drm/v3d: Introduce Runtime Power Management

 drivers/clk/bcm/clk-raspberrypi.c |  41 ++++++++-
 drivers/gpu/drm/v3d/Makefile      |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c |  23 ++++-
 drivers/gpu/drm/v3d/v3d_drv.c     | 171 +++++++++++++++++++-------------------
 drivers/gpu/drm/v3d/v3d_drv.h     |  21 ++++-
 drivers/gpu/drm/v3d/v3d_gem.c     |  18 +++-
 drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
 drivers/gpu/drm/v3d/v3d_power.c   |  79 ++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
 10 files changed, 291 insertions(+), 111 deletions(-)
---
base-commit: a7352c849492a30b5d8491fcb9314ab376a3942f
change-id: 20250728-v3d-power-management-eebb2024dc96


