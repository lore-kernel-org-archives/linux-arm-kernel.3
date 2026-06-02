Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA65CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lGXmSGFIRxw5W1S4psSWKsImg7Oh95YsvbBNegnem7g=; b=dILfaAfLgMmADuO00tJKDnX3pY
	zhiaC+cAB/8zgrfhlywYN4s+kBw9e7n9RCz4xePOhTv5hont9E8cEv63dWDGKIcUqy76eZb1gQw10
	XWhxtQ5SB0nVa4/d6y1yQAB/xKFeJHKiXpyUG48dLeGEaGUa5DFQPQ/sMa663u8tPkDuIwoF7o3mh
	dluNeE9dyKu5b69eADRYXzZZ+mk5Pf8q5NEO+K/YJvK2Lch5tToBlOCMaka2Ky7Y9WbC4HLLgN8t1
	gwzgkKHG1PBov11ePws7YWt0Pim6CtmlwQtQifhHVZXsahEzLiS4DHT4HtMc3bIxuiDwyyLvDmhhD
	947O+tkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK5x-0000000CXFy-1f1U;
	Tue, 02 Jun 2026 08:03:29 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK5t-0000000CXFU-3xuP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:03:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id B19E91D00009;
	Tue,  2 Jun 2026 04:03:24 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 02 Jun 2026 04:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1780387404; x=1780473804; bh=lG
	XmSGFIRxw5W1S4psSWKsImg7Oh95YsvbBNegnem7g=; b=Lq6i9H7h30HaajJArR
	IJvUpDcLVuf//GX+fjV8rWwA7W23frAFyO9KBXg12u1xr9CJTcqLT/ToBefuFgj7
	QiKL+mDTJwyP+nm/EJtugDsOk+5Bv8AIhS8wuqijUSzodewalaOd4HPfxqY3zdGf
	RlJOta55lZgLuuRNlvGDlEHr88F11JPsZ7wyb6pZgrHaTWmk3CmdOSs60OAB1qm7
	6OfbzMGv1vGNJgds53yNiNoiGdjoDf89M7lS6rD0teGTinsBP86zg608xe4v4APM
	prwhJ3uXychW+DzXgFTsgarkxMvofg8s7T74l4V6Nopmh/RXWuHTRqaeIkNIjZ0Q
	0zqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1780387404; x=1780473804; bh=lGXmSGFIRxw5W1S4psSWKsImg7Oh
	95YsvbBNegnem7g=; b=aPhoWO/DeWxFjOh4QGX0+NGNHgjfItci/odL2X/5vFb9
	ZVN8LePxj3f/c3/XWTMlHllr7uwvUidiaUSQmVhQi9M5JTaUQYZ7JKt0JQadD6C4
	6wsr0P5Z6hV7hsXX17DKoz8Ejc9UfZl35vLwwi/pLyOhg7plLlgDzZPUXvtENEk7
	EnoYXhBxFqig3gRYvWdYGotHnnM2aD2qj6dSUt9Zk0QGX8ggLCILdq9VVmJM8pB4
	Ue//IqJBlb49HLi4bsSiv5cuFEUK2K0y6G4ixKTO6M/XcCIUQ70/09HNeJ/MDLB4
	OqcbqmPRE3I1cisgz5vALgDdUQ7FInJd7E1Osnz4CA==
X-ME-Sender: <xms:TI4eaqbvnh-KDqW92_fXUY5U6f4Jc47CSoveUXLFfA4wM5ScnP-h8w>
    <xme:TI4eaoMBkv6QicH0xwJTJYao2jhx4o3PLd2llDZ1LZ5k7QmD8nbgdjIE4ugFp0OME
    -IGTvwpjPs3rp_cqUn5Xl9HxyraHxtNQgbVdjQ81xxnpWNNum8b5Fw>
X-ME-Proxy-Cause: dmFkZTFkCBjeOzK27OZlT8TCpLHMh0wPKNivPsBRQ4KXfdCIvBncT0uoU4oljEEx4lnhjP
    Iymx/e26CX8qEBAB6sL45gGjW5ttfxkWfePDWlMNTsHtRQWCCU0WVbNvy40bsLbQBKy6DS
    bT4Mp43bqRT2B/bzIicT5vd/8rAW7qPjynn8yPckFB599tU8Kdek288olub1mjfOLnyBVZ
    n3EM0P8aRIQnBfPtgVCVshgnpnGN8UubxnkHa65iXjX0II974XaZ2ezrrXQqbDT6eOS+i0
    OmuRpj8Nn/BQ7/7D+sEeyh11x30JkMEPv1iEVPQl8mTz7DdIrTReqYbi2wuyCJ5u2rU6jq
    lkfkceNbXlQqcXsTv2ASHmcTBpUVk9yPnhugz88vvrFb+PC/hZ4HLF/Ud1/KEkYppwuq5A
    85SL4IggIq97XLKV6akj2S0tg+rpN80AapF5dyLhiYiWQL090sHJweXa4qT//D+fiwLMPA
    jNnxZE6BbDuz3+dHmLjXjbWEeh/orIqERYbBI2b5FpdkX4XAUr4xOrS3CCDkqAUaJXYjlJ
    CTW+cx+zuO//u3RL8GzDls/j53eZ9lUgiay7eH96fcQGDRfHRVbrOYSQ/+TC0XNlrgRGDQ
    dvQpcsVgV3E8CydP0s/jltFKi/oWSeuzerSwjr7gJY/YapbJlMeOHP1mm8yQ
X-ME-Proxy: <xmx:TI4eakMZ7f-ApYEZagNf8Xxl8H7WhdNaFknPQUcNZl1aO1aFaCHSHQ>
    <xmx:TI4eameGfAPFMMuXhGwKfBNje7NAPUjo590CRsN4040s9A-rhJQ1Hw>
    <xmx:TI4eahvuWhuxEf5pLDuq8O_w_eIRCvUx5PRdw3hBAu_l1DIuLK6hAg>
    <xmx:TI4eanlgnXcdm6XDZozPzOYSLXIbpd0HgMhGUSiaGBe17EstGtW0iw>
    <xmx:TI4eamtXSx-xissyFJ83fHShhUllUCmHKCZI1-yeKooP3h9UuUTVNAFZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 21D6A1820082; Tue,  2 Jun 2026 04:03:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AcNZTq_C4ItF
Date: Tue, 02 Jun 2026 10:03:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.1, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_010326_390673_44A1C7D6 
X-CRM114-Status: GOOD (  14.19  )
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

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-2

for you to fetch changes up to fce4668a01227abb2c60e3202cf866137fbfcef2:

  Merge tag 'socfpga_fix_for_v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into arm/fixes (2026-06-01 16:25:19 +0200)

----------------------------------------------------------------
soc: fixes for 7.1, part 2

Following the previous set of fixes, this addresses another significant
number of small issues found in firmware drivers (tee, optee, qcomtee,
qcom ice, exynos acpm) drivers through various tools. This is about
error handling, resource leaks, concurrency and a use-after-free bug.

The fixes for the Qualcomm ICE driver also introduce interface changes
in the UFS and MMC drivers using it.

Outside of firmware drivers, there are a few fixes across the tree:

 - Minor driver code mistakes in the Atmel EBI memory controller,
   the i.MX soc ID driver and socfpga boot logic

 - A defconfig change to avoid a boot time regression on multiple
   qualcomm boards

 - Device tree fixes for qualcomm, at91 and gemini, addressing
   mostly minor configuration mistakes

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP PHYs

Alexander Dahl (1):
      memory: atmel-ebi: Allow deferred probing

Amirreza Zarrabi (1):
      tee: optee: prevent use-after-free when the client exits before the supplicant

Arnd Bergmann (12):
      tee: fix tee_ioctl_object_invoke_arg padding
      Merge tag 'tee-fixes-for-v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'optee-fix-for-v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'qcomtee-fix-for-v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'qcom-drivers-fixes-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'qcom-arm64-defconfig-fixes-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'imx-soc-fixes-for-v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into arm/fixes
      Merge tag 'samsung-drivers-fixes-7.1-2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/fixes
      Merge tag 'memory-controller-drv-fixes-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into arm/fixes
      Merge tag 'at91-fixes-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes
      Merge tag 'socfpga_fix_for_v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into arm/fixes

Bjorn Andersson (3):
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com' into drivers-fixes-for-7.1
      Merge branch '20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com' into drivers-for-7.2
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com' into arm64-fixes-for-7.1

Georgiy Osokin (1):
      tee: shm: fix shm leak in register_shm_helper()

Harshal Dev (4):
      dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk
      soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE
      arm64: dts: qcom: milos: Add power-domain and iface clk for ice node
      arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node

Linus Walleij (1):
      ARM: dts: gemini: Fix partition offsets

Manivannan Sadhasivam (7):
      soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
      soc: qcom: ice: Return -ENODEV if the ICE platform device is not found
      soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
      mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
      scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()
      arm64: defconfig: Enable PCI M.2 power sequencing driver
      soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found

Mihai Sain (1):
      ARM: dts: microchip: sam9x7: fix GMAC clock configuration

Peng Fan (1):
      soc: imx8m: Fix match data lookup for soc device

Qihang (1):
      tee: fix params_from_user() error path in tee_ioctl_supp_recv

Robertus Diawan Chris (1):
      tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()

Tudor Ambarus (5):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix false timeouts and Use-After-Free in polling
      firmware: samsung: acpm: Fix missing LKMM barriers in sequence allocator
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

Val Packett (1):
      arm64: dts: qcom: x1-dell-thena: remove i2c20 (battery SMBus) and reserve its pins

Yuho Choi (1):
      ARM: socfpga: Fix OF node refcount leak in SMP setup

 .../bindings/crypto/qcom,inline-crypto-engine.yaml |  35 ++++-
 arch/arm/boot/dts/gemini/gemini-sl93512r.dts       |   2 +-
 arch/arm/boot/dts/gemini/gemini-sq201.dts          |   2 +-
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |   6 +-
 arch/arm/mach-socfpga/platsmp.c                    |   1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   6 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  20 +--
 arch/arm64/boot/dts/qcom/milos.dtsi                |   6 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |   7 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 141 ++++++++++++++-------
 drivers/memory/atmel-ebi.c                         |   3 +-
 drivers/mmc/host/sdhci-msm.c                       |  10 +-
 drivers/soc/imx/soc-imx8m.c                        |   2 +-
 drivers/soc/qcom/ice.c                             |  66 +++++++---
 drivers/tee/optee/supp.c                           | 107 +++++++++++-----
 drivers/tee/qcomtee/core.c                         |   6 +-
 drivers/tee/tee_core.c                             |  56 ++++----
 drivers/tee/tee_shm.c                              |   2 +-
 drivers/ufs/host/ufs-qcom.c                        |  10 +-
 include/uapi/linux/tee.h                           |   1 +
 22 files changed, 327 insertions(+), 166 deletions(-)

