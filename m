Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEEDE9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLt6KIS3heA6+KbSYDWlFsnZTNJOkMMZOLH/WTZ53uI=; b=R0QUmH420gc9OWwSbScygfUeK4
	E4X6TW2FQ3R3VCxzP4BtdlXwQ6R4r1yTi7UJ8TkyGs9bTQXMxg261TqfSEkpWiZAbrivBNYYZa9tV
	Iok4+9LtqkCBgs9JGf1TQNtTjA9be31ATgETeXE2GzwujFl6SN6cc8ODfMkTmQqIQwsmj8yGTM+oD
	mAwmU9JPyCUbWYxFSjY0fUCbflEJgmzFrmFzvBnGiA3TCH0n6x2rlh7rf8uGTVazf6R8padDe9fhj
	1FkptDj4XhWkWTw46ZTirHVqoE36Qy6anFq+z/vKwM2MuyKgB7ryEq4M9BBI/He08tA2FcF7XYNyp
	j5ffyZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXL-00000009rHA-1EuL;
	Wed, 18 Feb 2026 13:24:15 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXH-00000009rDn-3y4q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:24:13 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PLt6KIS3heA6+KbSYDWlFsnZTNJOkMMZOLH/WTZ53uI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421042;
 b=qAbnuZWdLXTNdZ3DUDRsIWzgZRopcgYqTE5J/b9v37xjVK5m5xWBnmp14aWU4DLyaTQRPCyT
 Z5ig62CUQMp/rfRfIWmAxgvnLaCbgip26B1myj+NDUlAwTq4E95REWC0GqpucG0tgCwopiJEoLp
 DevcjeGZqY2+Mj1/IoqvcUKOjqIwPz2yz8hDGtoS2BNS1wlkBHlepJW3Zw09C7rN2cEO1BnlQ3P
 lIZbxMPpUe/S3KXf/UuvQbRoug90qGLycw+2J7nomggtIzc3+yB0n/dXFQIG+OTl6DcqfimZ8rg
 qdnVzJOEpMtkFXX9mgZRt+jkuw6s6FpE0T099qJmHkDpA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421042;
 b=EOWEL88cbAbQPtISytRNx13u285PJ9BuWkVkaibfsd/wtBiZ6ttroCopw9IQK34kIcXb6wCh
 CEz9HHtWCOPII/Rr/ErlAP/tDEow8oJr/t6dGLTUcjtBUgT66I3jdpPOxsEbKX3heufyMa4qO67
 VsDlt9BC06cEA8/cINyOZ38dbJSKrA1c+iYBfbRjk4hdxmJmCFv9WIMOkYOnUSN3mQ4Y6Jvb4LC
 yrWIH4Iv8zIV73aJsuFTLArVQTOVJhXMuPfAxX+QEAmX0nY2jFoGHS5PCYMxwws595ay2vCP8fB
 H98jxl8hh4RfAYVeB3w6eERm6QBeM0x1jT+fNpaiw0VFA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 18 Feb 2026 14:24:01 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 841F9220B97;
	Wed, 18 Feb 2026 14:23:45 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems
Date: Wed, 18 Feb 2026 14:23:37 +0100
Message-ID: <20260218132339.32157-5-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fGHJy1tZKz3ycBd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ccb46d170f3ce977e46404c63492de13
X-cloud-security: scantime:1.867
DKIM-Signature: a=rsa-sha256;
 bh=PLt6KIS3heA6+KbSYDWlFsnZTNJOkMMZOLH/WTZ53uI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421041; v=1;
 b=N9sb8Lt/aSc3mJDjiUi1WNpwgMv7uB1neDesXn1JxMARQlXapJD2E7rMrboNP/ydaf9WC+TP
 TzAjd2vXtUtqTrbD/LBfdQLgAh42yy/WdAd48+jHQGUo2c+34tuJIA1MTNgL8BALUZO96x215vx
 NMDDkdjHYpIpAiwuHt81tkb3A6OBx7a8xRizrKEvVpYMT5CfBmaRNecGMJtg0fvBse1+0fU06KD
 Y+cYl83XdQF16uWfpeh1bQbCcuN5pqQikC0nDvfLQO69swgW3DBtUckHa+6t9WSfi95/7SMmyfU
 Lz81UGs0cR5M6L+wfIHsAZZ1I/kJNJn4ea+ZGYVJ5n1Bg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052412_135831_4B18B508 
X-CRM114-Status: GOOD (  12.93  )
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

TQ-Systems is written with a hyphen. Correct the spelling.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts   | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts
index 9d9b6b744a1c..9d637c0a12ec 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2018-2022 TQ Systems GmbH
+ * Copyright 2018-2022 TQ-Systems GmbH
  * Author: Markus Niebel <Markus.Niebel@tq-group.com>
  */
 
@@ -10,6 +10,6 @@
 #include "mba6ulx.dtsi"
 
 / {
-	model = "TQ Systems TQMa6UL2L SoM on MBa6ULx board";
+	model = "TQ-Systems TQMa6UL2L SoM on MBa6ULx board";
 	compatible = "tq,imx6ul-tqma6ul2l-mba6ulx", "tq,imx6ul-tqma6ul2l", "fsl,imx6ul";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
index 33437aae9822..5676904820a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts
@@ -10,6 +10,6 @@
 #include "mba6ulx.dtsi"
 
 / {
-	model = "TQ Systems TQMa6ULL2L SoM on MBa6ULx board";
+	model = "TQ-Systems TQMa6ULL2L SoM on MBa6ULx board";
 	compatible = "tq,imx6ull-tqma6ull2l-mba6ulx", "tq,imx6ull-tqma6ull2l", "fsl,imx6ull";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
index 6dd1b359e086..ac18caf5a76c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
@@ -9,7 +9,7 @@
 #include "imx6ul-tqma6ulxl-common.dtsi"
 
 / {
-	model = "TQ Systems TQMa6ULL2L SoM";
+	model = "TQ-Systems TQMa6ULL2L SoM";
 	compatible = "tq,imx6ull-tqma6ull2l", "fsl,imx6ull";
 };
 
-- 
2.43.0


