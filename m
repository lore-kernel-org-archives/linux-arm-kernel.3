Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709B1C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=akAZcCXApKmwr9fL0Nee5K8HyD7g2IZvIQTiXZJTi2A=; b=mKDdk+Ddge2omZ+wcTq1DOSmc2
	sX7Bt4D3Rl0SC+FgGg/3En66LbGn7iJGkrPM8kcKKIUqP0xiN/iaD9na0EiGr2BGtLesXoOubNJCx
	/NtajWF81RHLs8KU89SGrzymPC5tVAqhy7o41fZpI2mc0d5RJMjq/jj0I3uFXyQTMjuZAl1/Co7cI
	MTJ2lMq+yg5zuLVVyyJiL48wjMjFB+7CDivrPddXG6Urks3WDKGbBF4h6m1VkEC4u+RP45CbigC1L
	5nRZRFK3WnQnHaGiFclCuAo9nY1a4KABAV04Q0mIlC1hffX0Hf2I70c5KSlA90Ko65fkt4XHG0VUS
	pSG6G7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrf1-0000000GByk-0kMD;
	Sun, 30 Mar 2025 12:21:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrYO-0000000GB8f-2mcW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 12:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=akAZcCXApKmwr9
	fL0Nee5K8HyD7g2IZvIQTiXZJTi2A=; b=PCNNhs+pernjiTV4Rzfbu6uVHuFdqP
	K5HUKrHhpGf2jjok2afE8zgj2nFb2VNSJ7+uYsGQvXx5et+J+ecyFIpy13zmZ3d+
	+twwoqwFFD1kl4XJXgVzRRwGFlljf7HO/aWMS2d+PeWEvwbR7ogYYGv8cqrynwW9
	Ihmp5tT+kT/HIzFUqfbTNXO5cBe5IXR4qfkCD0tphtOt/J8ZDGdLCEOOG+42asfv
	gYJHUoor4EF4IGNdHUmfdMx0CC14tw2EjRkcqxlO9D7QMnTc4JABBT39WwxnKwT0
	10Md+hgP77Mh0hy3fcjlaRPZKnT0kgPIv25VK8PpQClp8VTKA6skeVnQ==
Received: (qmail 855621 invoked from network); 30 Mar 2025 14:14:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:09 +0200
X-UD-Smtp-Session: l3s3148p1@ouCSPY4xTjBtKjBa
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
Subject: [PATCH 0/5] ARM: dts: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:23 +0200
Message-ID: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_051417_568630_0977C072 
X-CRM114-Status: UNSURE (   8.77  )
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

After I fixed this for the at91-boards I was interested in, I let the
scripts run for the other boards, too, of course. Here is the outcome.
49 less dtbs_check errors. Build bots were happy. No dependencies, I
suggest sub-trees apply them on their own. Thanks!

Happy hacking,

   Wolfram

Wolfram Sang (5):
  ARM: dts: marvell: fix faulty ohci/ehci node names
  ARM: dts: nxp: lpc: fix faulty ohci/ehci node names
  ARM: dts: st: fix faulty ohci/ehci node names
  ARM: dts: ti: omap: fix faulty ohci/ehci node names
  ARM: dts: vt8500: fix faulty ohci/ehci node names

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


