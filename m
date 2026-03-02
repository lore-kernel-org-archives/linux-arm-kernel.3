Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D84EB3632
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JX/Nu58kA5M2wq2cfRjJ5hGnvcTue0yUZtVSohB/Lk0=; b=QdVmH9J44tOIJbOSugmieiO0Ty
	vs/ncH0UKqmSwRPQ20S8mtgjCXBWpCROQLTWuy1P2rjhpMUds79RPn0p71fixx/7mYlboV5Se6XqN
	gGH2LhIw2Ll3dH+xX8wFBEyTKjIh+JiSNA9/vu8bdcIi/8xLivYXoR/nBSOSDcXdzL6c+04zUNdz0
	7qd++KpVKRXUgdODJNoRWNQj5Cdnd73BMp1kblAGod4BWI/aFI5aIGzcwy+3vSWJ7c3QSsv81zKei
	qJbm2vJnxG3JeuI22jGB8qSCmuIcmHMXjZNU+WrUyw1aZkTou9Xdb0HGEZ0dP4KHECfQWbfqfODB3
	7+/pfcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8fp-0000000DiLh-34tL;
	Mon, 02 Mar 2026 19:11:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8fo-0000000DiJi-3quH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 19:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Cc:To:From:Sender:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JX/Nu58kA5M2wq2cfRjJ5hGnvcTue0yUZtVSohB/Lk0=; b=dNpkdaEAxnprvXpb7U3o7jsh9t
	7TeYpElwUDDmhDzAQHLGOPbtQxyEVrIA1JgRZJkpmJruL7kHZJNUjmm6ZvK7zDPJW1mVGy6w5fLb/
	+rx/tSql1IR3GLv5Eu5pvc/kSwu4ZFf4uTBKLrs01G2LZPpcQHA/c7h8oPOYbiMEVJi2vZtfSceQt
	SuKmOdhWgFRP2C6Ec+EUhoz9m3GeVSpz7yEgrTsDS8/6XsBwxHgqWcLFnUsNnt4pDO1vCDTJGrYGR
	sVfQ/vZ5hAr7eWvhSGad6RhHJrxP6nmnWQsOS3UyfGnf/Mr9sEMhPnW6Kw6N5pVRrrPm6o8mNX5QL
	gduiwq9Q==;
Received: from mail.hugovil.com ([162.243.120.170])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8fm-00000009xIQ-0D8n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 19:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=JX/Nu58kA5M2wq2cfRjJ5hGnvcTue0yUZtVSohB/Lk0=; b=HuQL53y7mE2iDL2iyATE/j4QeV
	f422CrokHGJ/Xbki2jZ8iIOzIRA4O2Dq2bSXt7/cbhxbCa+pUszTjvAw0/vgWN2i545ZH3sMHjrmE
	3gWEDSOvuoOAWK5MgtFjKn1M9NNbau2DlEs9xUkBOnDW2SAxsmN3unsZygPiC6Isa1tU=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8fB-0007Wl-II; Mon, 02 Mar 2026 14:10:41 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:39 -0500
Message-ID: <20260302190953.669325-4-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302190953.669325-1-hugo@hugovil.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH 03/14] ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-6UL model name
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_191118_142025_8FE7700B 
X-CRM114-Status: GOOD (  12.70  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

There is no Variscite module named VAR-SOM-MX6UL.

The official name from the manufacturer is VAR-SOM-6UL.

Change SOM model name to VAR-SOM-6UL to reduce confusion.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index 085985356668f..d16e75164fd18 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-MX6UL
+ * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
  * Variscite SoM mounted on it
  *
  * Copyright 2019 Variscite Ltd.
@@ -11,7 +11,7 @@
 #include <dt-bindings/leds/common.h>
 
 / {
-	model = "Variscite VAR-SOM-MX6UL Concerto Board";
+	model = "Variscite VAR-SOM-6UL Concerto Board";
 	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
 
 	chosen {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index 30032be6fdd50..7259526e2b884 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Support for Variscite VAR-SOM-MX6UL Module
+ * Support for Variscite VAR-SOM-6UL Module
  *
  * Copyright 2019 Variscite Ltd.
  * Copyright 2025 Bootlin
@@ -13,7 +13,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Variscite VAR-SOM-MX6UL module";
+	model = "Variscite VAR-SOM-6UL module";
 	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
 
 	memory@80000000 {
-- 
2.47.3


