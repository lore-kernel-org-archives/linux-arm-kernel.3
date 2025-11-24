Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05735CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 00:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sp1w+eZZjEhgXtL1xF4e8qR3Rt0nm3rPRScz7bL5s2w=; b=RILfqZ+2UbyDK4zdNZt+ujXNA+
	ztsxIQqSGULg8sFdr2Cuav1TT52918HogYVZKJpB8x1sMmCvJwhLToUqt2rNtb5y809eKKJVZKkj9
	R4W9qIutXZ5QWghmlgH9HbX2BMpci+nXjpqMJS5Q0aSc7VSxAlN98wHS7Ru+Qoei59xDn8AfVick0
	dOy1LZfpPuZjjf3FWWeE3MGA6IZeXJTUgGwC6w4zFKcDENenRjlFpeOGsRUPgMBqeefFbu2hiuDHS
	owv+KICOnjEt6ETu1rbnWzzf83BpNiJC9fXgvcwNmrhIYT1Sy4h/8fQrCtAYDmi/T/9PmUZxsz3f2
	5vUhPuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbe-0000000AqxE-3H5t;
	Mon, 24 Nov 2025 00:39:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbd-0000000Aqww-1395
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 00:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5DCE60051;
	Mon, 24 Nov 2025 00:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B998C113D0;
	Mon, 24 Nov 2025 00:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944739;
	bh=ZhoNPDXJHC7TiqZOtG3ztIsi7d4KbS0+5ZUx4cRA0g4=;
	h=From:To:Cc:Subject:Date:From;
	b=poPtU+RQO8RjB8GAMlOW7WNtJYy88FQzbJTa8a406xYJnr+5Pg7+01FdDO75ny0Fc
	 pk/FW2DdD6RwWMEpB/c7Dpbw6CWOQ/EDJE5ByAmyxjN2CcejqDm/Bh13A387bqsdYT
	 vD7i9x8YVpE+sSge4pyEHfTi28cibFjDS0p6mP7pA3iCpOCaUoR9EkEHpG7OrHZVUj
	 U4hLU3bA1bPNLD0D9L/8xTU4nXzGnj8S7ckfiTeZoKmht7gwW3aCU0WJPxyw6PwabZ
	 77Hla0Evtr0vhITWuBYFzM4A9KKbTAketkHaryUAMXHpIFx4PfX3P3H64eXAlECS0O
	 UO2zJ5Mb4JfIw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
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
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v5 00/14] gpio: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:51 +0800
Message-ID: <20251124002105.25429-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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

since v4:
  - collect Reviewed-by tags.
  - use pm_ptr() instead of pm_sleep_ptr() for gpio-tqmx86 
  - drop patch5 for gpio-pxa due to maintainer's conern with memory waste

since v3:
  - fix typos.
  - fix the stray change in gpio-pxa driver.

since v2:
  - collect Acked-by, Reviewed-by tags.
  - move the embeddng the structure for pm in gpio-dwapb out, will send
    it as a separate patch.

since v1:
  - rebase on the latest gpio/for-next branch.
  - collect Acked-by, Reviewed-by tags.
  - clarify the trival memory wasted numbers with CONFIG_PM=n in the
    dwapb's patch commit message as suggested by Andy.
  - drop patch to bt8xxx since the clean up is acchieved when switching
    to generic PCI pm framework.


Jisheng Zhang (14):
  gpio: dwapb: Use modern PM macros
  gpio: brcmstb: Use modern PM macros
  gpio: htc-egpio: Use modern PM macros
  gpio: pl061: Use modern PM macros
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
 drivers/gpio/gpio-dwapb.c     | 18 ++++--------------
 drivers/gpio/gpio-htc-egpio.c | 21 ++++++++-------------
 drivers/gpio/gpio-ml-ioh.c    | 12 ++++++------
 drivers/gpio/gpio-mlxbf2.c    |  8 ++++----
 drivers/gpio/gpio-msc313.c    |  8 ++++----
 drivers/gpio/gpio-omap.c      | 15 +++++++--------
 drivers/gpio/gpio-pch.c       | 12 ++++++------
 drivers/gpio/gpio-pl061.c     | 17 ++---------------
 drivers/gpio/gpio-tqmx86.c    |  9 ++++-----
 drivers/gpio/gpio-uniphier.c  |  9 ++++-----
 drivers/gpio/gpio-xgene.c     |  8 ++++----
 drivers/gpio/gpio-xilinx.c    | 15 +++++++--------
 drivers/gpio/gpio-zynq.c      | 15 +++++++--------
 14 files changed, 70 insertions(+), 109 deletions(-)

-- 
2.51.0


