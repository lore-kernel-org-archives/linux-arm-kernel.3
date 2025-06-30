Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEB6C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKO8n41CGdYUXrhyYKrodGkOGTzpd25N+gmGhxXBQiU=; b=Zdj3Qjc0W6LpQSVsR5dQEV/wcJ
	sA2F5DUqSskXsxatp2AI9TKRvyqV0rSnaY7/5Dk2PDgaTu13+zDY05iSCyGkHiW4br5uE21Dl999Z
	OXjICcbOiDxfna0lGPhz6cqoGWgtcqVpqrIR3VmMObcEmtBzo4evdnoPHRkn4ekkDueLBerDSTg0i
	Cc6919PfSTK7CyjiHD3uAysJuFRKW/PpxyF7huu1l3PVhSTOD+K2tyOgAd4gbFecqf1SN9HuQ00Yq
	1/hymjZlGOz61va1HQRgRkJ68FWLeqV9qU6dwGqsQiKRLwmN5qYAVKRwwDx0P47iYGgMg1oM5Yb/7
	8cDxtlaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJss-00000003GCx-0pXr;
	Mon, 30 Jun 2025 19:09:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlw-00000003FKP-1HDI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 19:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RKO8n41CGdYUXrhyYKrodGkOGTzpd25N+gmGhxXBQiU=; b=NAHgyY1CA9dMezwCbNrO+VcIyD
	FJHFmwUJua/Qh2PiMl1fW54ugrv/+kSLebEkVRABr07deWUlsYmfc2CBgwsLhOw7w98NB9oacKBYO
	IgjrU5kQUj3dn2T2K1QElf3SER/aae6nJoBARgRkHG84JbXOpgokmDrdljjY7uVgiihEc9zXRbfoo
	ViAt6WDdbqTwCAXDwQjxPfMllIgSpYxl/wqUu1AbYKORFv8teTKkOqPLBIVTMe7tjxbgxtcMCQfxU
	5TLkBrQHGnS3AXtfZiDIwYXNrrZm+SzVBoRsAF5vgd9WAI1UhxrcEFpngZwwbTSt2W14Sqxqw/yTD
	sJsBua8Q==;
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlr-00000006s7U-3U59
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:02:30 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 20D30C0000E8;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 20D30C0000E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=DxngdZTCXB3RrhxRGvXeovYfJ2Dg0ax80WtH2OTFOpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQa8YH087mqLSZpm0iYkcWRs+XKYrzLRkM+c7UdEP0/iNF6kNR+BhC52pBuafewZU
	 NB9PQkhwPN0h6ocyvlGw/PTHrdEmJYa1xaZoM1XayeM0u7bGVXBpdXRxl8exT0oY44
	 GJdE769Hjl5s//cftRVj/k1amlZxrtV4nvE2TwxU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EFE1318000847;
	Mon, 30 Jun 2025 12:02:21 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/5] Broadcom devicetree changes for 6.17
Date: Mon, 30 Jun 2025 12:02:13 -0700
Message-ID: <20250630190216.1518354-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_200228_785568_2FBF5484 
X-CRM114-Status: GOOD (  11.55  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/devicetree

for you to fetch changes up to 8df00d6bdb0ab976637ba15829be5771dad2073f:

  ARM: dts: bcm958625-meraki-mx6x: Use #pwm-cells = <3> (2025-06-09 10:10:41 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree updates
for 6.17, please pull the following:

- Linus makes a number of updates to the BCMBCA SoCs Device Tree files
  to correct UART interrupt numbers, add interrupts to the RNG block,
  and leverage the fact that all SoCs have the same peripherals at the
  same aperture

- Uwe corrects the Merakia MX6X DTS file to have #pwm-cells = 3 as per
  the binding

----------------------------------------------------------------
Linus Walleij (8):
      ARM: dts: bcm6878: Correct UART0 IRQ number
      dt-bindings: rng: r200: Add interrupt property
      ARM: dts: bcm6846: Add interrupt to RNG
      ARM: dts: bcm6855: Add BCMBCA peripherals
      ARM: dts: bcm6878: Add BCMBCA peripherals
      ARM: dts: bcm63138: Add BCMBCA peripherals
      ARM: dts: bcm63148: Add BCMBCA peripherals
      ARM: dts: bcm63178: Add BCMBCA peripherals

Uwe Kleine-König (1):
      ARM: dts: bcm958625-meraki-mx6x: Use #pwm-cells = <3>

 .../devicetree/bindings/rng/brcm,iproc-rng200.yaml |   6 +
 arch/arm/boot/dts/broadcom/bcm63138.dtsi           |  79 ++++++++++++-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi           |  64 +++++++++++
 arch/arm/boot/dts/broadcom/bcm63178.dtsi           | 112 ++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |   1 +
 arch/arm/boot/dts/broadcom/bcm6855.dtsi            | 127 +++++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi            | 120 ++++++++++++++++++-
 .../dts/broadcom/bcm958625-meraki-mx6x-common.dtsi |   7 +-
 8 files changed, 510 insertions(+), 6 deletions(-)

