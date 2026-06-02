Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F148CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=87iWthhsXI0KBP5pxDKO9wFfPz1O68kzRBZHmC2bf2Q=; b=X2cWTOOXaLrnY9xTSNh/rd0tNW
	3rXiWUJGpanhG3dccoP6tp8fvXMaFskEA4yIPFRSgscyV/81+kRpo9gSJu6pijnJjfcEZPxo/yodt
	wMRzrcBTFAHFOjd8SKcJvrvMqOxI5NQHfuuapDFbxgbSYN56Hh87smbptZi6wxRp60yiGzxnp018w
	O2o61xWgoZ2XEYTGcvnGxFOCfTTV0kKUb6KU6hEFS+Ae+HO9oPqVGPpRW3LWpAv7bRIOjYdHQxsKi
	oKMzHJU0Vy2TMrhIB5wBEUoylAVH1cbDC09lqewseuvW781mDVtwdBoHeEycLFkt8X2uOfZBlCCs2
	zioaAP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQ2K-0000000DAxs-2lqN;
	Tue, 02 Jun 2026 14:24:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQ2J-0000000DAxY-1X95;
	Tue, 02 Jun 2026 14:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9851060120;
	Tue,  2 Jun 2026 14:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EF18C2BCB4;
	Tue,  2 Jun 2026 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780410246;
	bh=vaUgDr1RsviakGOYzlCjQ60oKkDSx69btm1l/dxlknk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eNxuXUsri6tijJ8q/ycYLYL0UUGj/L2NEO0UwBzXWuSHMKHc/Gw1p6EneoCK7c8Nw
	 a4pBeVrAJ4Tk0fGE+KI+iO/KKuvbY5SbdVskol9Fzdj8vMfFLAiPmi2W3d/dYqcubE
	 nsyKrHNx8zOoeksWqVVMy6q0AWRS13P+25XOHzjqygArEFYI8X9vHsmye48rPRUHSW
	 oJFYEs6LCXuLOJaSQk4uB4HlQNHmkZXLkvf3iSklEzxzGHy0WjZo7GC1q6xNCyyokw
	 N9ItNto9XKvptJX/auWVhVOCY8d706erm85jK4VQX5PUV2PUNL0+1M8kWDJCBoK1nU
	 fYyvOQikNZPxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBC1CD6E60;
	Tue,  2 Jun 2026 14:24:06 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 02 Jun 2026 16:19:20 +0200
Subject: [PATCH v3] thermal: amlogic: add missing dependency on MESON_SM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6DIBCF4asY1qUBbEG66j2aplEBnUSwYRpSY
 7x70XThyuX/MvlmJmgjWCS3YibRJkAYQ47yVJC2r0NnKZjcRDAh2VVo6uBLPSBC6Ki3OIYXeoq
 Tb8aBKqWkYUYbJRnJwjvafL7pj2fuHvAzxml7lvi6/t2SHbqJU05L10glGl1pc7nXA9jh7CJZ2
 ST2FD+mRKa4sa5qy5ZL7XbUsiw/nGGjcxABAAA=
X-Change-ID: 20260529-fix-missing-meson_sm-symbol-7776d0d9d760
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Ugj/bC+OamV3jyF8WcVc9eTJZxuCATwhl48WC6wVttE=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ5bc88YZf93YKuZbvUs0urjHhjFyltZXW8tXjJrH173aH
 8wqovmqo5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZhIhRHDP7upL/kyYjSthN9t
 V4/k/yC493zz9qe5b7r2HD1fMOP35k0Mf7gjVVZsajNQ618UsM587vaA6X9u7Qxb6mX9+nMz04t
 9v/gA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The amlogic thermal driver calls meson_sm_get() and
meson_sm_get_thermal_calib() which are exported by the meson_sm
driver. Without CONFIG_MESON_SM enabled, the build fails with
undefined references to these symbols.

Add a proper Kconfig dependency on MESON_SM instead of relying on
stub functions, which makes the dependency explicit and prevents
invalid configurations.

Closes: https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-lkp@intel.com/
Reported-by: Mark Brown <broonie@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v3:
- Add a dependency on MESON_SM instead of stub functions.
- Link to v2: https://lore.kernel.org/r/20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr

Changes in v2:
- Replace #ifdef CONFIG_MESON_SM by #if IS_ENABLED(CONFIG_MESON_SM)
  to cover builtin and module in config.
- Add missing trailers for kernel test robot.
- Link to v1: https://lore.kernel.org/r/20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr
---
 drivers/thermal/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 1c4a5cd5a23ee..810eeccedfbab 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -436,6 +436,7 @@ config AMLOGIC_THERMAL
 	tristate "Amlogic Thermal Support"
 	default ARCH_MESON
 	depends on OF && ARCH_MESON
+	depends on MESON_SM
 	help
 	  If you say yes here you get support for Amlogic Thermal
 	  for G12 SoC Family.

---
base-commit: 3929405c64376a8a54c794e8a4485023b108a97e
change-id: 20260529-fix-missing-meson_sm-symbol-7776d0d9d760

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



