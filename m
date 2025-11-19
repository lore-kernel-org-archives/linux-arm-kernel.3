Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C07BCF3961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lDxbtxsx4g2tD8Vnghj8nvG5hgn/JPmAsF4pK26hodA=; b=uGS3TT6teLIGwPohVKoSZID9GB
	sDtU0sZtAD6oFx6vvyJsP6w17GamnQutgPGeLSGRBLyuAL+lpojlt5/xqTOdKvn47iKrw54uNNMs8
	xj6u73Sfkl0OHuL3hy3RvUUZdwMZZ8BFgZFUV8uLeVVVLvy5GtiaPl6rAgEL/5YDwB9oF0r/rOQK3
	l5Vy8ipCxINGfYaSLDK1cEwmEJm5P7DGot/m+er5ZTgfJh+vof8HNUZO39szyEUOuj+Pp1U98qvgG
	YZ+GG2vt4stNhz61UBMPKWZAj2YkRomFcqZtldVrB0pCVf2jNr6KSF2W183S09sHEjgZ07S5iiroT
	+WOESgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlOt-00000003k76-2QF8;
	Wed, 19 Nov 2025 16:51:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlOs-00000003k6Z-062r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 272A96016B;
	Wed, 19 Nov 2025 16:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22644C4CEF5;
	Wed, 19 Nov 2025 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571081;
	bh=0z5blc1dd07XmocvlDywgo0sdBdKMV/nbSwKqdt7BFU=;
	h=From:To:Cc:Subject:Date:From;
	b=OD98aEJCUvHftzsI8L6yY4uAIJK8Qy1OHWLWyKTx7GuV41kvYavvN66UuX9ERLoUk
	 1Lu/rTJAmrIdDoi7HghhXM061bC1CcWTnczfXXtDobj8BRZxFYz1eBuSqTFHGYHaN9
	 4U4RUP+GW1urGvWetLrKkBEcy51233o7npzQOZNMBdLu2v3+ZMT9LlPUAvz/IRjenH
	 dQL9THDAl/6fKQTjQCA781bHcTINNLHCNkAxF6FhGQseBIABm1zbYNLn6CJmXhurnR
	 TxWwpk0Lw7OOEVLWlIIj0E145KDSpre4ThetaH04krPF0InncnOqRZs+SYaIfVx5DY
	 7L2kDmoVXZtlg==
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
Subject: [PATCH v4 00/15] gpio: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:12 +0800
Message-ID: <20251119163327.16306-1-jszhang@kernel.org>
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
 drivers/gpio/gpio-dwapb.c     | 18 ++++--------------
 drivers/gpio/gpio-htc-egpio.c | 21 ++++++++-------------
 drivers/gpio/gpio-ml-ioh.c    | 12 ++++++------
 drivers/gpio/gpio-mlxbf2.c    |  8 ++++----
 drivers/gpio/gpio-msc313.c    |  8 ++++----
 drivers/gpio/gpio-omap.c      | 15 +++++++--------
 drivers/gpio/gpio-pch.c       | 12 ++++++------
 drivers/gpio/gpio-pl061.c     | 17 ++---------------
 drivers/gpio/gpio-pxa.c       | 11 ++---------
 drivers/gpio/gpio-tqmx86.c    |  9 ++++-----
 drivers/gpio/gpio-uniphier.c  |  9 ++++-----
 drivers/gpio/gpio-xgene.c     |  8 ++++----
 drivers/gpio/gpio-xilinx.c    | 15 +++++++--------
 drivers/gpio/gpio-zynq.c      | 15 +++++++--------
 15 files changed, 72 insertions(+), 118 deletions(-)

-- 
2.51.0


