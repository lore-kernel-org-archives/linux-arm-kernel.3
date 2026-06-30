Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wN+EcU0gGHH33bhyn/gHbeG7JZHnwpKvV3LKnR2eWeM=; b=eBtbZJD4uc1Ey91IoomAO8lyz2
	a7PeonzDJX7o11T5nTqpenV8aUyKlNCkvH+175PqB6GDxASIM+CWs5AY8k5ZFl7MC0f4TQcezla86
	cIA02Pt8RRpAlyF5reMlkUaAUvcBIzICT+sEgqSFtBtKFk9lSbPfygkvutu4Zo9zoiW04FEqDz1Os
	bF5NVDtaPXhPpgR1Bbu+bm0OxrPW/diUDp4iFtiFEyvFYAuLbCqPt2VWLUzb811Ic367p1zpZbOy0
	+jpyNuf0FOHxMlIl64XXbiEdYCqM/wMsrJGAAaLTEb89UJzxpKYX3qy2F4PIgn5nc9BvKxW1nc4An
	YYZYBRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVW4-0000000GbI7-34Ie;
	Tue, 30 Jun 2026 10:16:32 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVW0-0000000GbHf-32Oh;
	Tue, 30 Jun 2026 10:16:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DC1D1CD0CC;
	Tue, 30 Jun 2026 13:16:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782814585; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wN+EcU0gGHH33bhyn/gHbeG7JZHnwpKvV3LKnR2eWeM=;
	b=jC5ljsv/fRpC1AtIMayTHfeg0yZ0qKe3UHL+ssTZe5GiIleQX+Myb6i/5wARIpwukmdGOf
	QJFTuIGKV2MQA1M310phV3qVyA9mZj4j+mkUfT+Lk2N2zJFDQ33btXi9eLN9nKLrjsuI2h
	Vpp9lVjL/GB8xT7JYAQCPHwIC+p2HgwuMxU9fm51+i5RZ/59eWzCwm5pkFD7KpLYKIbVBB
	lDdzflPJ1asiQxq3co7fi2OEu6pYO6S4941wKqhNEVy3amf5Ugu7qy/33HiTr54wp3mTSC
	xtoSlGgBlLk6G/ebVuEnv+A4NnxvrXG6JL9zAQSkPYBPDwuDbU73oPWgzDHgVA==
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
Subject: [PATCH v3 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Tue, 30 Jun 2026 13:15:43 +0300
Message-ID: <20260630101545.800625-1-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_031629_931738_555EC28E 
X-CRM114-Status: GOOD (  10.43  )
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

gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
the underlying chip's can_sleep, but under that lock it calls config and
direction ops that reach sleeping pinctrl paths. On a controller with
non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
runs from atomic context:

  BUG: sleeping function called from invalid context
    ... pinctrl_gpio_set_config <- gpiochip_generic_config
    <- gpio_shared_proxy_set_config (voting spinlock held)
    <- ... <- mmc_pwrseq_simple_probe

This was reported on Khadas VIM3 and worked around for Amlogic by
commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
sleeping"), which marked the whole meson controller sleeping. That
workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
no longer detects devices, because its IRQ-disabled read slot calls the
non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.

Patch 1 fixes the proxy locking generically (always a sleeping mutex).
Patch 2 then restores meson can_sleep=false, fixing 1-Wire.

Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
gating on gpiod_cansleep() change behaviour. No current device needs
atomic (non-cansleep) value access on a shared GPIO -- every report
(Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
(eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
which is what the proxy exists to vote on; bit-banging that needs atomic
access cannot work through voting anyway. An alternative that keeps
atomic value access (split locking) is possible but adds a second lock
and new race windows, so this series takes the simpler mutex-only
approach.

The two are a unit: patch 2 must not be applied without patch 1,
otherwise the original VIM3 splat returns on boards that share a meson
GPIO -- please keep the order. I have not Cc'd stable; I will request
stable backports separately once both patches have landed.

Changes since v2:
- gpio: shared-proxy: drop the set_func callback from
  gpio_shared_proxy_set_unlocked() and call gpiod_set_value_cansleep()
  directly. The shared direction_output path drives the already-output
  line through the value setter instead of re-issuing
  gpiod_direction_output() (equivalent, minus a redundant per-edge
  re-assert of drive config/bias). No change to the voting/value
  behaviour.

Changes since v1:
- gpio: shared-proxy: open-code the descriptor mutex; drop the
  gpio_shared_desc_lock guard and the gpio_shared_lockdep_assert()
  helper, move the mutex rationale to the can_sleep assignment.

v1: https://lore.kernel.org/linux-gpio/20260610153329.937833-1-v@baodeep.com/
v2: https://lore.kernel.org/linux-gpio/20260625115718.1678991-1-v@baodeep.com/

Viacheslav Bocharov (2):
  gpio: shared-proxy: always serialize with a sleeping mutex
  pinctrl: meson: restore non-sleeping GPIO access

 drivers/gpio/gpio-shared-proxy.c      | 76 ++++++++++-----------------
 drivers/gpio/gpiolib-shared.c         |  9 +---
 drivers/gpio/gpiolib-shared.h         | 28 +---------
 drivers/pinctrl/meson/pinctrl-meson.c |  2 +-
 4 files changed, 33 insertions(+), 82 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0

