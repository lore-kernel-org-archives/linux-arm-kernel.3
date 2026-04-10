Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B7BF44868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ANiLXy2khpgRJ4NUYD3KloSLAU+fqIeMO0q9LkbLPm4=; b=1HRbSSXOXomjx0PNBIidKDDJRV
	avO/EkB04oPUx76ex6yj/WPhHLFf0n1WhEq/Uc3X2rHv2Owhep5TEX9i+ZumwpkQ15QUkBEJVEMzl
	lr8EfQAXM9qBIVjHVAFmcPns7wFfjQ0rZh1TcifJmePvGmtlKUMWCrCE2/R1SEyov7C5Zc2wKk0xg
	mFaPeNSKV2TGLbODYKYMhSF1Ot82Y3BN/rQ4YV7nUynuo1KO892Qqvd52SeYkq4xZHBbuR6d6HmWX
	eDvgIkiir9nwxzhi/28RhJDlXpItwYYcZyv7W6VDbtZI5ThqCA2I7yCZgQ9cLk4zgvfTTpuEuHv7X
	8lCzDuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBru-0000000CJeF-3s9T;
	Fri, 10 Apr 2026 13:25:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBrt-0000000CJe2-49Zn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 13:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ANiLXy2khpgRJ4NUYD3KloSLAU+fqIeMO0q9LkbLPm4=; b=OdBSMhFLsAwOFSbnOVsaQlOd/k
	CyZfMv7t4IYbmPD5EhPi4TfnywsxU002vX4XZ8UFC5vuMKzEvEiXLzmq1epCM2zptFTXj2wj8aoKp
	LDozlc6hFKuzF5yQkoEsbgqpFytVdmtn0gd3kjutSNJCwvM996Ky4NhzNInI4eP1Vbuz41Od7Hslt
	9PBvpnfTqEI8ZL1uFCIlitFHBmu5TWA6qXD/xai6d6KeLWx5ty8wIOeAnJThig32SgforXpUuMqCd
	GIFiQuuYJRkG3xVbTVU2zgYSNxx8wMgdmgXJtAbyZaEyCuzfPk0nanC5w+mWzKOv6hwVUNw+cRXHK
	86ScAQCg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBrq-0000000DZfB-3jd1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:25:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5D701C5C1A1;
	Fri, 10 Apr 2026 13:26:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A675603F0;
	Fri, 10 Apr 2026 13:25:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 163A91045001A;
	Fri, 10 Apr 2026 15:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775827541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ANiLXy2khpgRJ4NUYD3KloSLAU+fqIeMO0q9LkbLPm4=;
	b=cChgOkzENzUd4hXa/ttfMXyZ0RDfND2LkMVRzbdjblDPHSJc/Ngf2fCJu5n2R/sFyZJKRz
	KEuV56FWmssZhlk0CmVElB56ny+lg/JfOgnIpDlkNvAM7yHm2BGXtUR3VLdx0KWonKsDSU
	7tyf6NHe2AgUU2J1I70ERoP4IrSZTkH9HV+5ozPDUyE6NvYDBosShh1WN613k2OfC8x+X7
	/cg/OYZRN+6tJXePzv8I5eOChkJyBnRboBs1x3maxI+Bi46hVFvRcvy4aM9axrFwO1G/5r
	aqBN1yCuGy6kY9Bo4ce7ozcEsGTAooQs67FI0Azh0RzERrAAn7skZYCPNOcYFg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v7.1 (#1)
Date: Fri, 10 Apr 2026 15:25:39 +0200
Message-ID: <87cy072bho.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_142551_036071_E6BBCF24 
X-CRM114-Status: UNSURE (   8.68  )
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

Here is the first pull request for dt64 for mvebu for v7.1.

Gregory

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-7.1-1

for you to fetch changes up to 00e6d608fe80b0f68c325cb46862f78e9a8ec768:

  arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller nod=
e (2026-04-09 10:14:40 +0200)

----------------------------------------------------------------
mvebu dt64 for 7.1 (part 1)

- Armada 37xx/3720 device tree fixes:
   - Reorder USB PHYs, standardize names, drop undocumented
     properties, fix schema alignment

- Add Marvell 7k COMe board bindings and uDPU ethernet aliases

- Cleanup: drop unused .dtsi files

----------------------------------------------------------------
Elad Nachman (2):
      arm64: dts: a7k: use phy handle
      dt-bindings: arm64: add Marvell 7k COMe boards

Gabor Juhos (6):
      arm64: dts: marvell: armada-3720: drop 'marvell,xenon-emmc' properties
      arm64: dts: marvell: armada-37xx: align 'phy-names' of EHCI node with=
 DT schema
      arm64: dts: marvell: armada-37xx: drop redundant status property
      arm64: dts: marvell: armada-37xx: drop 'marvell,usb-misc-reg' from US=
B host nodes
      arm64: dts: marvell: armada-37xx: use 'usb2-phy' in USB3 controller's=
 phy-names
      arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller=
 node

Rob Herring (Arm) (1):
      arm/arm64: dts: marvell: Drop unused .dtsi

Robert Marko (1):
      arm64: dts: marvell: uDPU: add ethernet aliases

 .../bindings/arm/marvell/armada-7k-8k.yaml         |  11 ++
 arch/arm/boot/dts/marvell/armada-380.dtsi          | 148 -----------------=
----
 .../boot/dts/marvell/armada-3720-atlas-v5.dts      |   1 -
 .../boot/dts/marvell/armada-3720-espressobin.dtsi  |   1 -
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi  |   7 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   9 +-
 .../boot/dts/marvell/armada-7020-comexpress.dtsi   |   2 +-
 arch/arm64/boot/dts/marvell/armada-8020.dtsi       |  20 ---
 .../boot/dts/marvell/cn9130-db-comexpress.dtsi     |  96 -------------
 9 files changed, 21 insertions(+), 274 deletions(-)
 delete mode 100644 arch/arm/boot/dts/marvell/armada-380.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/armada-8020.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

