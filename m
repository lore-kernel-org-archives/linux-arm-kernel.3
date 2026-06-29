Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10594C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbxQxhI8jkWFpggqqu0BJxCVlmjNB8rVpnB3U/bG9/8=; b=4Cejsdgt0P7QrGiuHAYk7QJLyg
	RXdFDsDuPKYxGLt1CznObfh6CT/aQ5GTi2V/1f2tmYV3NhhQhkM9bYt8XfYlgIIYEUEs01/kk3R0a
	+ymOEj7ruHKqCs17Rp3GRB0CygUnSYWggzCT0Ms98gBF7ufmQAa4yM2oLod5RyRqLHrrUOL78X6Zp
	3X+VnZufaJxjgZq6ngOIJkCuUpuxuUN+YEg/nxe7hNuBX+NEvZnHYOOVyMCxm/Sknw+W5FdTo89ks
	ReuK6j3DEpW3n/xRku4dNx3VHruheCCm3Iu0gC16EqxzRa5OPe1yp/zjbZHX2DIPGQ5XJeAUngORo
	sHOvnWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC21-0000000Ekw9-4AYs;
	Mon, 29 Jun 2026 13:28:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC20-0000000EkuS-1hZd;
	Mon, 29 Jun 2026 13:28:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFDF460008;
	Mon, 29 Jun 2026 13:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090611F000E9;
	Mon, 29 Jun 2026 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739691;
	bh=AbxQxhI8jkWFpggqqu0BJxCVlmjNB8rVpnB3U/bG9/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l+Bjn0TWuJNScCkv2eF3hy4+9W/x+N/FOa0Y6J7K1PFzRKxbGv4SQUtde7aDOLy8B
	 jZkrFSnHT6Vb61R5R/ETfTSspiaEh+nheFllga8qyHXfV3yUxDZSenK4zIhVp2ALI+
	 nzRCJXHiieCva9BC4U/A20qdEbhgbI/dhbWcdg/Jt7oAcq2GDapzVbIFKbACjvCd9P
	 uYVxIeyS3AcefXCPNeybaedPhtAmuQ8NxzQKp3Kq4z2cU2T7FaobBGokfDAJ0YP4jO
	 D6rFiTomsxEP9rkITDZ/6mMxQ/dBT7Rjpc7U1oDKGDNycGwvTBYGhfgJLQfBm3ssL7
	 lcm3OEdYqXtkw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 12/13] gpib: gpio: replace linux/gpio.h inclusion
Date: Mon, 29 Jun 2026 15:26:32 +0200
Message-Id: <20260629132633.1300009-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
References: <20260629132633.1300009-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

linux/gpio.h is going away, so use linux/gpio/consumer.h instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpib/gpio/gpib_bitbang.c b/drivers/gpib/gpio/gpib_bitbang.c
index 0e227980b493..2e8d895db06a 100644
--- a/drivers/gpib/gpio/gpib_bitbang.c
+++ b/drivers/gpib/gpio/gpib_bitbang.c
@@ -64,7 +64,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 
 static int sn7516x_used = 1, sn7516x;
-- 
2.39.5


