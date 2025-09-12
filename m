Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A53CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mKf2as6BBkWoxSaDquCtCeCYxtNSJDqDRTLH5rwrkxY=; b=yQ5is5CJhKEF3gz0+WvNfBjD3B
	u/u+rNOvZrLp1EvNPDUYH5XEQTAgq+sk1WD30MHmduBs+FwEGC2ITp2jnpm7XCiVpBVhEo+CmfEaG
	4oBZS3zfQp+4ij984WzZJtMUMIkm7Jh7JvTaZiC/Ii3nxRzqazY/9ke30eH1ZFQFreVlFfgfcs93I
	pJicRRXyEufVUrhzm96Y7quajIPYoG55KvuT31VA4OQqZLxQCDtd0BOrn0dgyKs+4u02WIwLEaiXW
	8DKG6aNi5uzlxVqd31t+RXBQIvlCtf1KFYoKjQF4lKcxzIOkLIdrPupGtfIePr67BVOx2mB1w8UU7
	uU6dlqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5T5-0000000AAI9-0mYn;
	Fri, 12 Sep 2025 15:13:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5T1-0000000AAFd-24Jw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:13:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48524C6B3A1;
	Fri, 12 Sep 2025 15:13:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3748E60638;
	Fri, 12 Sep 2025 15:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C824102F29C9;
	Fri, 12 Sep 2025 17:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757690015; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=mKf2as6BBkWoxSaDquCtCeCYxtNSJDqDRTLH5rwrkxY=;
	b=YUO2WmfkKeRb23RFGkED6wJLMXYx8RFrt/da2FAwwBVXtROhHrbjdKUuxs2NtST17yaF0n
	/+SXSsTxxfMxdg/y3r+if4nLEsZcMy2iw1wWWRR2Odig4Zp3j7iGdT0q5pheqJlQ0XnddV
	kHZKz8gJrDydcy9vbtI/Mzz2/4ycFJsnlu5nQUdMuTjEJHQEGjtpcj+Dpqanbi1W6HbE8b
	iibh607qPa+zU54U9TVzTNedYIcAWCqiH/7h+erneB2p+X75f6x7uxsnbmCPQz1QNCwZZF
	KKSLKFXBcyYuQT6r99qGoP/R2289hY57BLSYUVULr2Nu8FRpiwnbawcGeQ1ezQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v6.17 (#1)
Date: Fri, 12 Sep 2025 17:13:26 +0200
Message-ID: <87ikhnn1pl.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081339_725746_3E5FBE6A 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
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

Hi,

Here is the first pull request for fixes for mvebu for v6.17.

Gregory

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-6.17-1

for you to fetch changes up to 794a066688038df46c01e177cc6faebded0acba4:

  arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x2 and x4 ports (2025-09-12 14:54:38 +0200)

----------------------------------------------------------------
mvebu fixes for 6.17 (part 1)

Fix SATA ports on various boards: Macchiatobin, CN913x-solidrun.
Fix audio on Armada 370 DB and OpenRD.
Disable eMMC high-speed modes on the CN9132 CEX-7 module.
Disable runtime reconfiguration for PCIe lanes on the CN9132 CEX-7 module.

----------------------------------------------------------------
Jihed Chaibi (2):
      ARM: dts: armada-370-db: Fix stereo audio input routing on Armada 370
      ARM: dts: kirkwood: Fix sound DAI cells for OpenRD clients

Josua Mayer (3):
      arm64: dts: marvell: cn913x-solidrun: fix sata ports status
      arm64: dts: marvell: cn9132-clearfog: disable eMMC high-speed modes
      arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x2 and x4 ports

Russell King (Oracle) (1):
      ARM64: dts: mcbin: fix SATA ports on Macchiatobin

 arch/arm/boot/dts/marvell/armada-370-db.dts        |  2 +-
 .../boot/dts/marvell/kirkwood-openrd-client.dts    |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |  2 ++
 arch/arm64/boot/dts/marvell/cn9130-cf.dtsi         |  7 ++++---
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |  6 ++++--
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts    | 22 ++++++++++++++++------
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi    |  8 ++++++++
 7 files changed, 36 insertions(+), 13 deletions(-)

