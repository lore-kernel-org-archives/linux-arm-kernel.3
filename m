Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECC5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wubwNYnRxbbJb5iwummV8vvrrP0RpUNviFPSyRr144w=; b=sk+Kml598QG5/k1ONgUTirPmMx
	0V/RAJpO+PPz8G5Np+HjtMV+q81gsl+oA/L5swJ7ry+ICNOpa7/OZfY6bgo+wytk3h613IrYZdgWT
	hOH++5ZOHgjQRbf0hm5uT4Z9dNOACpFKb+MWqMTscaCrnXJDnlTwPIIo4YY5l5zL4cba8Phgr6m93
	vHLS+lLNWSMkXvW81PbIlQYUq90znNBjdjVAcM/XZGmMdHFAOOm/90dbuGSEmwzqKpRw1HyDN7gPA
	oo2P/HUwuPYYepO1icjAiNS7tZ1H3D5gCzWtjbT3w0vtr5Ke3I7PWqVK4YWc2FLRmv0gESy/HBjWB
	9X1eprnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVWK-0000000GbOb-0sdh;
	Tue, 30 Jun 2026 10:16:48 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVWG-0000000GbLx-2GAi;
	Tue, 30 Jun 2026 10:16:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A8C21CD232;
	Tue, 30 Jun 2026 13:16:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782814602; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wubwNYnRxbbJb5iwummV8vvrrP0RpUNviFPSyRr144w=;
	b=CPeInz/PD9TfYK5P2xBKbWzAuQ9Pn0cbTUo9LrCjhuQh3OZBirifZDmplUpkVHG7460bLY
	jpz9ZcannzFXFYkvrvVKT4znbrFaWqptJM3ELVrI4mgRTSZYdcp0jmxu4RZFmDls3qMyZB
	CYggGjJo8BGctjyd3eNkVwOu+Qxqsj7LjQ31CvHHEjL3RnXZoULbvpFml4LWY8CIjyQQXZ
	Z/KdYPV8HPNUW95gFahDnR8ElRhHO6wNp8D1lWZE0QQIBwtk0HkGfs28PFdZi3znxnOdjz
	6gzT6LJ1j3zhxZ+6iz2s7zXZDerH324yotiuIIj5OKpXFVzJdaZcXEMpl5TTug==
From: Viacheslav Bocharov <v@baodeep.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] pinctrl: meson: restore non-sleeping GPIO access
Date: Tue, 30 Jun 2026 13:15:45 +0300
Message-ID: <20260630101545.800625-3-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630101545.800625-1-v@baodeep.com>
References: <20260630101545.800625-1-v@baodeep.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_031644_755207_6D00C00C 
X-CRM114-Status: GOOD (  12.37  )
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

Commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
sleeping") set gpio_chip.can_sleep = true to work around
gpio-shared-proxy holding a spinlock across a sleeping pinctrl config
path. That locking bug is now fixed in the shared-proxy itself ("gpio:
shared-proxy: always serialize with a sleeping mutex"), so the
controller-wide workaround is no longer needed; the meson GPIO
controller does not sleep.

meson_gpio_get/set/direction_* access MMIO through regmap. The
regmap_mmio bus uses fast I/O (spinlock) locking, so these value
callbacks do not contain sleeping operations. Since gpio_chip.can_sleep
describes the get/set value path, restore can_sleep = false.

Marking the controller sleeping also broke atomic value consumers such
as w1-gpio (1-Wire bitbang): w1_io.c runs its read time slot under
local_irq_save() and uses the non-cansleep gpiod_set_value() /
gpiod_get_value(), which with can_sleep=true trigger WARN_ON(can_sleep)
in gpiolib on every transferred bit (from w1_gpio_write_bit() /
w1_gpio_read_bit() via w1_reset_bus() and w1_search()). The printk and
stack dump inside the IRQs-off, microsecond-scale time slot destroy the
bit timing, so reset/presence detection and ROM search fail: the bus
master registers but w1_master_slave_count stays at 0 and no devices
are found. Verified on an Amlogic A113X board (DS18B20 on GPIOA_14):
with can_sleep restored to false the warnings are gone and the sensor
is detected and read again.

This must not be applied or backported without the shared-proxy locking
fix above; otherwise the original Khadas VIM3 splat returns on boards
that genuinely share a meson GPIO.

Fixes: 28f240683871 ("pinctrl: meson: mark the GPIO controller as sleeping")
Link: https://lore.kernel.org/all/20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com/
Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 4507dc8b5563..18295b15ecd9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -619,7 +619,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.set = meson_gpio_set;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
-	pc->chip.can_sleep = true;
+	pc->chip.can_sleep = false;
 
 	ret = gpiochip_add_data(&pc->chip, pc);
 	if (ret) {
-- 
2.54.0


