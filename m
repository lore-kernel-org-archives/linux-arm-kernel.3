Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8C6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bD31FNZcGehsFcrULq0RTCCuJXEwTu7ivCaIG64WknU=; b=fegOjZfbuSvXDCIegTm1782ZRk
	V6X4BbobU+rW8Sm0fg2E7688CrN5Io1N0OUGDX1H53jqeK5awVck6Q0EwNgxyykdEND9C6J8TI8eC
	nR2CN4J1yIMOP42d37MbryM7aqlOEAPF0e0xqFhSHJ5v2mL0e03OXONPgCg5pxveskftopWUfp5gv
	mUomlXTe+hRdS80aQ7si5cEPrxyTNxTmj7WFD+AUxkIEbjE1dDJZXIIeoNt7ijMlWlzJIlp9NnWoh
	LYQZLRVJKt1ELbAv4HrhYrsUDwwPLGbCiidgy1P00bGUPFX9euB99MqtZ+lOA22YGFPWFtgnvPtnP
	/URxtRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyya4-0000000GbZb-21gO;
	Sun, 30 Mar 2025 19:44:28 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyUt-0000000GbAB-3D6u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 19:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=bD31FNZcGehsFc
	rULq0RTCCuJXEwTu7ivCaIG64WknU=; b=WWG+PmK0iOXSLtFCDRz4RIMS1k+z80
	y8VV7gjpq9cfPO6931OU6l3n5ZBIdnkc5zwzuNF2R2J8I+7q1d8AL3Xr02h9Iykc
	HZ/0te5o726+MEypoBQaTEAC9BQ4bvHG7ojQCCTU2VEtLNf69Ape7ia1hIFjvqYV
	LRPCNOkh4fPf6iIxJG+MJR5p9Zq7pHrHec+OlRCFGUFACCiNuqXfpeKfdaLqUuhV
	uf8VS5aPV3he5tbOQnjgdd0g4G7hvxB1qcO+lXy9aSqdB9Ae0EahucmQ/3kO1LN8
	EQ21cqrHRwgpbEPaspFZhx74s+EEcDOiVgOum4kKzjWBSIl41gubwH+A==
Received: (qmail 964731 invoked from network); 30 Mar 2025 21:39:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 21:39:03 +0200
X-UD-Smtp-Session: l3s3148p1@AB6xdJQxRNlQ8qei
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-omap@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@lists.linux.dev,
	Tony Lindgren <tony@atomide.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v2 0/5] ARM: dts: use correct ohci/ehci node names
Date: Sun, 30 Mar 2025 21:38:31 +0200
Message-ID: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_123908_648046_B8C281B8 
X-CRM114-Status: UNSURE (   8.80  )
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

Changes since v1:
* use not "fix" in commit message to avoid backporting
* added Krzysztof's tags

Thanks for the input, Krzysztof!

After I corrected this for the at91-boards I was interested in, I let
the scripts run for the other boards, too, of course. Here is the
outcome. 49 less dtbs_check errors. Build bots were happy. No
dependencies, I suggest sub-trees apply them on their own. Thanks!

Happy hacking,

   Wolfram

Wolfram Sang (5):
  ARM: dts: marvell: use correct ohci/ehci node names
  ARM: dts: nxp: lpc: use correct ohci/ehci node names
  ARM: dts: st: use correct ohci/ehci node names
  ARM: dts: ti: omap: use correct ohci/ehci node names
  ARM: dts: vt8500: use correct ohci/ehci node names

 arch/arm/boot/dts/marvell/kirkwood-db.dtsi             | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-dir665.dts          | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood.dtsi                | 2 +-
 arch/arm/boot/dts/marvell/orion5x.dtsi                 | 4 ++--
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi                 | 2 +-
 arch/arm/boot/dts/st/spear1310-evb.dts                 | 8 ++++----
 arch/arm/boot/dts/st/spear1340-evb.dts                 | 8 ++++----
 arch/arm/boot/dts/st/spear13xx.dtsi                    | 8 ++++----
 arch/arm/boot/dts/st/spear300-evb.dts                  | 6 +++---
 arch/arm/boot/dts/st/spear310-evb.dts                  | 6 +++---
 arch/arm/boot/dts/st/spear320-evb.dts                  | 6 +++---
 arch/arm/boot/dts/st/spear320-hmi.dts                  | 6 +++---
 arch/arm/boot/dts/st/spear3xx.dtsi                     | 6 +++---
 arch/arm/boot/dts/st/spear600.dtsi                     | 8 ++++----
 arch/arm/boot/dts/ti/omap/omap3.dtsi                   | 4 ++--
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                | 4 ++--
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                | 4 ++--
 arch/arm/boot/dts/vt8500/vt8500.dtsi                   | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi                   | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi                   | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi                   | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi                   | 2 +-
 23 files changed, 49 insertions(+), 49 deletions(-)

-- 
2.47.2


