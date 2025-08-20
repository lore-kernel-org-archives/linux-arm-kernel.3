Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D98CA0FE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Utgvq17dOhRcd8e4JHWNzQErAoQNmz7FZUgX8c4fE+Q=; b=2h3nchEAlghseIvtg5BDJvhYIN
	ViH0NKDyRUiha64zx/IDBQGyA6ENSwHpD4gvNnbBT7hoIfD7S3d3UL5HFhIPDBLcb7+Kn3s+8q3eu
	tdW8cMAj6XXUkKVmCxmcbgfLMuFHR/DmlG9+I3LO+YrDm7goYRmxPa9yzLccBxjw3w1yDsB106WLC
	5k6UZ5SJyuBCMLBG5D+z73034QhFb7bLm8B+74CGDgWG+UW7bUyZTI98cMty5gUTH5EQFuH6rOk+A
	Y9IDCuXV5RlHT+oz/P452pmT7/0O0tZX1zJ25yJv20hBWGAB50m2n6+xegUQ7goiKNPSwyU/jderD
	BequhidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkW-0000000Erx0-1t3S;
	Wed, 20 Aug 2025 20:49:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolCR-0000000EK05-19a7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F06C44022;
	Wed, 20 Aug 2025 15:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A78C4CEE7;
	Wed, 20 Aug 2025 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705485;
	bh=vMfJ9Va4IKsTzlQUghLpkBMK6vkLLgkukvvU2MzIBYY=;
	h=From:To:Cc:Subject:Date:From;
	b=ROJM/pzpJ4u7Pbb3L5KIWV6dXR3TeNJnRXx4CC90NWtGXnBGzh31Vaj911zYkJT+N
	 68FfMgr1Y429jUja//5sKClo7TtlGVNUd6VHIcmj826LfOycJpkJgEzUEnUDX3mbOl
	 KklMdBztLIY0eE8qFFlvAHTV7NwsmJA+lgWoXq/HeNYNwdxY4T1Ua3nz7QYwXXnUrc
	 AXNiUGD91rc/l1ekcZGwPor5WX68s2d/VUUsEoDLeBYVmWqUvJBh5MJX3lKBDIMsyN
	 QsGBca1ckbBwFXUUZ4i3R8aUrc56VZbM8d4gzD9T1QIA7AJ85zQljCkLlDYB1KnF1W
	 SPxoWy3DoyO3w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Buesch <m@bues.ch>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 00/16] gpio: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:21 +0800
Message-ID: <20250820154037.22228-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085807_353456_76155EE2 
X-CRM114-Status: GOOD (  10.57  )
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

Use the modern PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
__maybe_unused.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
left as is, because the memory for saving HW context is not trivial,
if we convert them, then the two drivers' users may complain for
!CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.

patch to gpio-dwapb.c is tested on real HW, others are compile-tested only.

Jisheng Zhang (16):
  gpio: dwapb: Use modern PM macros
  gpio: brcmstb: Use modern PM macros
  gpio: bt8xx: Use modern PM macros
  gpio: htc-egpio: Use modern PM macros
  gpio: pl061: Use modern PM macros
  gpio: pxa: Use modern PM macros
  gpio: ml-ioh: Use modern PM macros
  gpio: mlxbf2: Use modern PM macros
  gpio: msc313: Use modern PM macros
  gpio: omap: Use modern PM macros
  gpio: pch: Use modern PM macros
  gpio: tqmx86: Use modern PM macros
  gpio: uniphier: Use modern PM macros
  gpio: xgene: Use modern PM macros
  gpio: xilinx: Use modern PM macros
  gpio: zynq: Use modern PM macros

 drivers/gpio/gpio-brcmstb.c   | 12 +++---------
 drivers/gpio/gpio-bt8xx.c     | 11 ++---------
 drivers/gpio/gpio-dwapb.c     | 31 +++++++------------------------
 drivers/gpio/gpio-htc-egpio.c | 21 ++++++++-------------
 drivers/gpio/gpio-ml-ioh.c    | 12 ++++++------
 drivers/gpio/gpio-mlxbf2.c    |  8 ++++----
 drivers/gpio/gpio-msc313.c    |  8 ++++----
 drivers/gpio/gpio-omap.c      | 15 +++++++--------
 drivers/gpio/gpio-pch.c       | 12 ++++++------
 drivers/gpio/gpio-pl061.c     | 17 ++---------------
 drivers/gpio/gpio-pxa.c       | 12 ++----------
 drivers/gpio/gpio-tqmx86.c    |  9 ++++-----
 drivers/gpio/gpio-uniphier.c  |  9 ++++-----
 drivers/gpio/gpio-xgene.c     |  8 ++++----
 drivers/gpio/gpio-xilinx.c    | 15 +++++++--------
 drivers/gpio/gpio-zynq.c      | 15 +++++++--------
 16 files changed, 77 insertions(+), 138 deletions(-)

-- 
2.50.1


