Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3C8106FD91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGiEKHvG0g+JUevNm144GYTeOt4tfkfBWS8EbLISuQs=; b=FcM6Sad3YJh7moGFRvZdklBxuo
	D4REWQUUjFNZWjP3oZRYm0gOXnv5ovuwKtcSSrEJlwwVPa/+CWFXtxgJjbSm2m7PAGUZxjcAI3Qty
	RzWQQ9EZn0JH6FvBTHZoItZcOtlT7TIVioXxGZK7FLlkBaPmsp3SqRDUjmE/9BccrA+NL5DSZUOnV
	/Lb5+bnrUncLM2F5Bzcrfw2bZIFnOyNKJbYzxAQw36tg1D7XFzDsWhdczfBCyEubkWk5Fyl+0bl92
	LXyTQ/BO6ajS2AyB6F92DCBkTG3sqZYnH9elH8A5p4bH3V6iHyzXBDNg/8NWYDRRgwUPLm3ZCTU/2
	BrXMwtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXg-0000000Gwwc-3lLi;
	Fri, 13 Mar 2026 07:02:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXf-0000000Gwvg-3Ioz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tGiEKHvG0g+JUevNm144GYTeOt4tfkfBWS8EbLISuQs=; b=kOyu1hUXRVmZtR8Hu5pzZJYGTs
	OIR3e8pUgd9Gncj78qQ1jC8Kcm/P9IeDAFEus/U8WB097vFtCzSGdCoahp24i2pEjF9jYDn3HCY8Q
	BtUBs5BcprFWqKsphEPME6GU+Wrc+cg93RqTtDB07wpNMS+lyQhV3ptWgSYGe7ni4hJ/fXw6rNZXc
	/xrkUU27vG5UKHON5rsjLP3Md4NCOeO9YobSQwsHJWYCd/jI8fiNLxedPYyrLTsp++eN2GxjPsOxw
	N8xXV5wY96biCdrN5yT5ZjuxtbPqbEoxW4uFW5Lf7xslv0z+AdU+ZVYy+iBuYKIuUQcWpd8mu9TgE
	805T7elw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXc-00000002iOU-1dbS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tGiEKHvG0g+JUevNm144GYTeOt4tfkfBWS8EbLISuQs=; b=Wzsa58Ce4qlLYJzvuUqM0NhVZV
	qw+otAaDsVs2CC98o/wa7TmwRmr4bZhFvwHiU5vBiwGvE8amYSYY4VosNRkCXO2I3UrBWUslQNLVz
	VhJnuFehUbGOMhrT8/rH4/dTYWLoM3S3ChjWdpQti77QgO5vnMKF2nNptE9VSVnERT7ivbPPbRVPd
	P4mLIa+P0KjoCgx3MWHwsoo5YWkBuh/mV6kCbWY6KNYyuM4iYe/Iy8rmCpJRJ4yBxy9sRhGwfyykU
	Ax9Gs+wmO6sb+VbfY2O2wSWG5CapvLfeibtVYmcAz98/uzTgqbND8oOF5St+RNTWZX2+h1eT3C0pJ
	EZaZnYQg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXa-000BWa-1B;
	Fri, 13 Mar 2026 08:02:34 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXZ-0005Xv-2j;
	Fri, 13 Mar 2026 08:02:33 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: imx8mq-tqma8mq-mba8mx-tm070jvhg33: Remove compatible from overlay
Date: Fri, 13 Mar 2026 08:02:22 +0100
Message-ID: <20260313070226.579939-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
References: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070236_758923_CB09B8B2 
X-CRM114-Status: GOOD (  10.22  )
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

Override of board compatible is unexpected, especially when the same dtso
override difference mainboard. So remove it and update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved commit message

 .../freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso
index 306977d6ba0cb..78f24f72cc690 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2019-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2019-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -10,10 +10,6 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
-&{/} {
-	compatible = "tq,imx8mq-tqma8mq-mba8mx", "tq,imx8mq-tqma8mq", "fsl,imx8mq";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0


