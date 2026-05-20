Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B34CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02+6d8dOXhR9E+F29QDQjM2pWkqHo3wDZDJjMa+yUu0=; b=m6kZ2ka3hEI2lc8HBc16FUF8Ca
	J1TY2olP8+WOnRRuH6jaFriPqwXNUCfvGB+khUzZ3wpM2VzzbN6PR+si0tOO91gbZJygKylijCQEV
	1G9ahtwxmWu/6L4ha4vrAfpg+xgkk1/guCOi7n+G7b1JPR/PLgjfuc1ExP8kXIOuobI4XrQspUWJf
	o/dxtX91OfUoHS923cKYM0nZTlxbjNytnJZy3mbiaf9XhF+df9JchWfFIuI6Dxxof6bWq0pQZShVo
	U5jGOFc8mRFbBzqqGo6ADcgTnIE7yLYr1WdYyoq9FSLb/6RCTZBX9Pjw6Nfmqo90v+nNAC9qTl3Nl
	6v1HscfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlq6-00000005VeB-3PDV;
	Wed, 20 May 2026 18:40:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpv-00000005VQP-1MA0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:40:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EECC94025C;
	Wed, 20 May 2026 18:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B121F0089A;
	Wed, 20 May 2026 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779302406;
	bh=02+6d8dOXhR9E+F29QDQjM2pWkqHo3wDZDJjMa+yUu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TxJsYXWdfmza+UhP3R5pB3RwB3VkdHYGSwnVCeXIfZWjcwPv5hyYy1pozAEtav9zc
	 ST23wnlxbaQNSejo3rEHwIRi3+Vsb+rGxZgXDu6Wg2SRyCm1gKgYG9kyT1s0+eLdMh
	 jLq+3jUpE8uIKfQfhWYcZI1RUu3KhaTsvYTa7fcRh4jeGeHIn1KWH1IQXk1A+GPle+
	 /fk//MJVx/io/TegeiPOyqkC6PuFHo2UABrmL27yz5Omg47Zm8XFMz0oUKynX/ZKE6
	 XwChghHVCC5r3gWZlyQSDgbWCdunVnBYtGrwFl8Zgn+l6bnK9CSl/JfztXE0nTPRKy
	 fbtvXvNZAq/IQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 10/10] gpiolib: turn off legacy interface by default
Date: Wed, 20 May 2026 20:38:15 +0200
Message-Id: <20260520183815.2510387-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520183815.2510387-1-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_114007_415583_4293DA28 
X-CRM114-Status: GOOD (  14.64  )
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

All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
so it can be turned off by default and only get built on platforms
that still have one unconverted driver.

Allow turning it on manually for compile testing, in order to keep
the build coverage of the legacy drivers in allmodconfig and
randconfig.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

This patch depends on patches 1 through 9 to be applied first.

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 00fcab5d09a4..eec17089eaa6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -4,7 +4,14 @@
 #
 
 config GPIOLIB_LEGACY
-	def_bool y
+	bool "Legacy GPIO interfaces" if COMPILE_TEST
+	help
+	  There are a few legacy platforms that use the traditional GPIO
+	  number based interfaces instead of GPIO descriptors.
+	  Say Y here to enable build testing drivers that are specific
+	  to those platforms.
+
+	  If unsure, say N.
 
 config HAVE_SHARED_GPIOS
 	bool
-- 
2.39.5


