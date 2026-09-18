Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B970FC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WDc8DpSSL6xeenR3f7B9dkwiSMj/qsRmoLVpnEXznnw=; b=zCo+QSuVZmCajoj5nf8ErmSyrp
	apTu/7sLqhHwouj6lc2jA0FN7paAr/Efo+zsaC4ARsjkB2LoVXCrPHSiuFpTEcBEAwGaKYyuPRc95
	7eNQLGAcfujDNmx3eg8v6ag+wGqJyMFceuOc8/G9zQwC41erlk4D5cwpGHe3nOkbEVugEP7W4agOa
	y5p6F280NuMJz8JbyHRBMtFDoaZSzpM3ejgqxumnXtS2zpVXREZo0gxyaQdt8IOqq9zcIyjqj1HnF
	/37ULWor0xkld9ne5ygaSPMssR8oZ9hnHNgeUcOFi65cleuKLtigPq67KlvNknskBK1QYV5OwituE
	CgUE9R2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yqb-0000000Ec34-0ym8;
	Fri, 18 Sep 2026 13:41:49 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YqV-0000000Ec06-357m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:41:47 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C017EC009B;
	Fri, 18 Sep 2026 09:41:41 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 18 Sep 2026 09:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1789738901; x=1789825301; bh=WD
	c8DpSSL6xeenR3f7B9dkwiSMj/qsRmoLVpnEXznnw=; b=Mr7Tv2bP/hog3TIUp3
	P16eZ9W/LLvncmqHNpMP55bo3FUkNgaDcOv3d/LC2nzJai2K5Md/40un33Cn+hEP
	ZwKbPERsYveLarpfYklnkl2bIuGUtgfLKpricRWKv460VIW5aCGcMnNb06MtDZs+
	8XHn13nvfbg8jGi6nn1ClE9zLIjvKws/6e7rveJNN9xXQRdjBemYjexdQNlfRGRm
	qgTCw1IRPmdlcIsYJRg45WfblafqyyHBXm3DEv3KkmwozoR/kZzGRpygA0bV/3wK
	ydZ5T+T8hDx98dPm88Xw8K2sRgFVGJpCHqOWjsFZC39fm26MxVH3coLHM+1UWwpq
	PWIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1789738901; x=1789825301; bh=WDc8DpSSL6xeenR3f7B9dkwiSMj/
	qsRmoLVpnEXznnw=; b=ONKNgcFz4djiOCG4zkw5fWuSsITyGJrZT3zvh7lQN2aP
	Xe8PNp1R33IEWe5wauni380HFQEtsqCFTwP9SX//NQ9xhsXhoMT689018SgmeJW4
	mtcjjOtTz1wICH8PwQLsrAea0wRIEZBuVeMKAryyg/Kl8MgDcIHENEA+YrCNodcf
	iiJjXEk/lyGXYg+GEWj5bnZJvxVxxtVIcC/WCKXBqY1LLKcPwJgdtVhv2t7KIW2T
	wMfqJm/0dvI3G5Gd0HestFJYzWqvWXVqehuAQLjTuHRwnVtEy/CrI8ear2SEM0sa
	lo+PnIqu/88iWIPmCQQmDuJrv0VYIReY6d1MO4zM5Q==
X-ME-Sender: <xms:kj-tajdMtSiTcgGplErWwDSEr9wwr8ka6wddYs7UkT_Q3HRBJQKUUg>
    <xme:kj-takCx7QfxhfW1ro4oXo_O0HLuEmloaUIg8NvOqmgqoE2BjyVHyW27dXd_OTKL6
    I-buqBcbEDzhzOaLw44kZkgtbvxSDY6TdquP6NuWa3njmFz9pzKVixA>
X-ME-Proxy-Cause: dmFkZTGQUrswI84w9O/dwRHYGX6Rx3EXW1Mv2gy8tGpGpoK5fUV5wxu4q95mLzQX8LNsQX
    aQkAnQ/gDGiRGKGp2lO072Icn6IB0iIqAxHAxH9oIoOjS0gzUcERv5Ed6OZc34CWL4Xu5L
    uU0oJadRfLu6otat+5wLUdy4JqpoRuvp5YM5hYrVi4QuFg+JqY5gigQEfMn+Jq8AufeFnW
    AfCbPHGOOSfPmAfsmyvRHp9HqAv4I3l4QPBOGOfXzBK6PSgBPonUPlMPBv6FkpORIShIJu
    rdnmNl5Equu24/slQxP8VdBD6dXn8zQoSDerkqA48cc4VKKj37JhS5hDmIHNlEEkA9mFgW
    ovObCM3/gRy9BiujrYMPV3xbyokkYPTZy2H7XoL3hule2WN3Ok/f5AERx1PXg4Kr7x4H/7
    Qw72AJQIBp4QTG/q3/UTcUnOzw/NrbJ/BUHvrfwlt8Ke9OTZlB4uSaTFTxzNJrJ4mdakRn
    T9htQDjSd/bpD4SAUaUnXYDTGCYOUTFmOwzpyfFNGMkNS4hLH7pyx/ta+BpTtz55PSMkH7
    /5unfnlSB/cF4W7mKYRr50txw0/1k7nZbwwstr6mvEPSVCh8CdonvhSUjYhuGqHPp22cW+
    8jZvBzCb+Y/csuDZ3fz4yCpOgAVdKumj3scLx1wFWFae/osEce1m+9Me8CNg
X-ME-Proxy: <xmx:lD-talLOgqEQLRo2uIVXoROSurOQo-9BZ3WqjAmDMTC8JGCZ4jkBCQ>
    <xmx:lD-taoBr1LSvNjZyhjOPmFCBgrs6vKJDwzhVVtXFgxtI3eH9c2aVLw>
    <xmx:lD-tamBYGZSNEqjarcCypXEuWyK6OGr3PR0Cf9UtB4SQ7pDtiXx7yw>
    <xmx:lD-taiALUhIyUCJZ9KQdOZs5_gqPDL9aEy1UqqVc4OHXwoMiBiTucg>
    <xmx:lT-tagSMllu7iDZI22AO1n-Za2suEo8obi9QjqlBcH3NoCjVqV6XLvLm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9DF8D32A0087; Fri, 18 Sep 2026 09:41:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 15:40:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@lists.linux.dev
Message-Id: <d55156c3-cbad-48f7-b8e2-a74cc48575dc@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064144_195967_2902CADF 
X-CRM114-Status: GOOD (  10.30  )
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

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3

for you to fetch changes up to 4dd1999783d7d12434006289338373e49492dc96:

  soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node (2026-09-18 14:39:19 +0200)

----------------------------------------------------------------
soc: fixes for 7.3

The driver fixes are all for simple mistakes: a use-after-free bug
on Samsung Exynos, error handling and reference counting on Arm SCMI
firmware and a problem dealing with inconsistent firmware information.

The rest are devicetree fixes for arm64 platforms from Altera, Renesas
and Amlogic. On the Renesas platform, one patch addresses a boot time
regression, the rest address minor performance and correctness issues.

----------------------------------------------------------------
Alexey Klimov (1):
      soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node

Arnd Bergmann (6):
      Merge tag 'socfpga_fix_for_v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into arm/fixes
      Merge tag 'socfpga_dts_fix_for_v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into arm/fixes
      Merge tag 'renesas-fixes-for-v7.3-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes
      Merge tag 'scmi-ffa-fixes-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'amlogic-fixes-v7.3-rc' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into arm/fixes
      Merge tag 'renesas-fixes-for-v7.3-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes

Dinh Nguyen (1):
      arm64: dts: socfpga: change access permission from 755 to 644

Hemanth Selam (1):
      firmware: arm_scmi: Fix typo "upto" in comment

Koichiro Den (1):
      arm64: dts: renesas: r8a779f0: Set UFS lane count

Lucas Tanure (5):
      arm64: dts: amlogic: t7: use the real UART pclk
      arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
      arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
      arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
      arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

Ovidiu Panait (5):
      arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to WRR
      arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR

Pengpeng Hou (1):
      ARM: socfpga: select the PL310 erratum 753970 workaround

Sudeep Holla (2):
      firmware: arm_ffa: Tear down driver during shutdown
      Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux

Xixin Liu (5):
      firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
      firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
      clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
      clk: scpi: register scpi-cpufreq once and clear on failure
      clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq

 arch/arm/mach-socfpga/Kconfig                      |   2 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dtsi   |   0
 .../dts/altera/socfpga_stratix10_socdk_emmc.dts    |   0
 .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |   2 +-
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 113 ++++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |  44 ++++++--
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  10 ++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  10 ++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  10 ++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  27 +++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  27 +++++
 drivers/clk/clk-scpi.c                             |  11 +-
 drivers/firmware/arm_ffa/driver.c                  |   1 +
 drivers/firmware/arm_scmi/driver.c                 |   2 +-
 drivers/firmware/arm_scpi.c                        |   9 +-
 drivers/soc/samsung/exynos-pmu.c                   |   7 +-
 17 files changed, 253 insertions(+), 23 deletions(-)
 mode change 100755 => 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtsi
 mode change 100755 => 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts

