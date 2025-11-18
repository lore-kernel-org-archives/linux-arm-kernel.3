Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC237CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FAvDlihThd5m6MXP6QD0zYn5eJ4EBjBycrhTVRWL0bE=; b=zdcD65JNKpC7fspMWE1vHJt+qL
	2fCW8euaRv5bUNLg+U/sMSxXwYtEIgMbEOAzZA7XZHjbl7/GNbxxZHMAQKQoZnB9Pr4EQdsNZaEQ/
	ILarnLCWnQRrg9mcnApl1dzs+eN1bUQP4fIgKyYYA9WlUBIqhGbwMuKqDMTvdoH2yJ744SlUHK2i3
	QLKS3VwtNam+sQWQ1+65vCrwlwmqAmq61NyWBe0L70DdExksGAIjU8NVcHGtvq9FpWOECu/ctNXPB
	nVmz4WvQ/av9dpmauNGF5vxYNR/AlYz5QgljobrAMfRwI6xlbbh3LX/Vb30Whxxw+rVvFu8+kOPvB
	TJ/QvEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9vP-0000000H3ol-0ZsW;
	Tue, 18 Nov 2025 00:50:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9vN-0000000H3oY-0xl1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AB316025B;
	Tue, 18 Nov 2025 00:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B58C4CEF1;
	Tue, 18 Nov 2025 00:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427024;
	bh=mEy7eGq9siBmXAuz9GOyA9Ova3BHTyifJWJpUXtCrkw=;
	h=From:To:Cc:Subject:Date:From;
	b=DSOEKIGREs3XjdSH4j5xJA78fcZdfWed8bZFjSPBOegjFA2jTTUfn5Vd+p11tMojC
	 +EIZ9v7kgqG5Rc1eQoDqiC6VQ6sUF2sGmHcCLkYv7xnKjEZhhEAk8Y7ceFj7O9Oj79
	 kcALwuTBbnPLtKikjaVzsACAE1bCFmsXvHmYBWgNcwr6tXKSDz/Eb2CvzHXR2BIxmH
	 aCQkcFbEAhoToMd6X+IkzZZm3q9UKQcT5NJL7vtXHaqDdnd4HjHptrGbu+94EESPe6
	 WLQRaEqMcVzLsPxz9R3xncSKOrZYS6qdmky1wzwIDSgxIJN4um2tNEQZ5yJ40k+dtD
	 NB0C+aAJjD0pw==
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
Subject: [PATCH v2 00/15] gpio: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:14 +0800
Message-ID: <20251118003229.26636-1-jszhang@kernel.org>
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

since v1:
  - rebase on the latest gpio/for-next branch.
  - collect Acked-by, Reviewed-by tags.
  - clarify the trival memory wasted numbers with CONFIG_PM=n in the
    dwapb's patch commit message as suggested by Andy.
  - drop patch to bt8xxx since the clean up is acchieved when switching
    to generic PCI pm framework.

Jisheng Zhang (15):
  gpio: dwapb: Use modern PM macros
  gpio: brcmstb: Use modern PM macros
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
 drivers/gpio/gpio-dwapb.c     | 32 ++++++++------------------------
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
 15 files changed, 76 insertions(+), 129 deletions(-)

-- 
2.51.0


