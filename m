Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6122106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSAIwJeWCXlw83FxcwNStIyG+Czo3r5yMNXs52VRR84=; b=4Aj7wCrkjeDQnHsLwx5y0gUB/z
	NnWbcPweUa1Q5xKiTmnKoXjybOGf0O0SebrFm7VkETYNFtKddHxahH7lLN4spv8kSveGuMWfutIuk
	PpY4+8n7ovChI/5ERa098NeEzui+ebwhTDsB/0URQXPVnRxzNjF+wx6Fo0Sktk+EksiBvwpowg3wT
	bvaRE5+5+lo5fgHdnDwwNsXsYbq2vW52mc9IB4C9GD0DYiF4asCByTdySeWTi9P+6GuLHtikx0c6i
	a65Zrdif9fc0/itrpzUirDSds60e/CzD47k+Xjw6k2mcd6z733k8TQc5D4zEUEoNpRHgS1pz3V4sc
	7kCfHhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXg-0000000Gww9-2YZL;
	Fri, 13 Mar 2026 07:02:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXf-0000000Gwvf-3Gsh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bSAIwJeWCXlw83FxcwNStIyG+Czo3r5yMNXs52VRR84=; b=eq/lk7cd/4TD6w1mXV0MftT+Rj
	J4os5NQh/eVka9I3g/ize7hkxdIZyjzodV8M7mcHZpX3Pxm3CuHCh7tPtBR7qEgPEF8AvMUfqIJlt
	Ap2CBDPJhxY12uTl7NWMbvNXsYvWUHFWPiadsl1Heo2QNm8rTAYNJjqGw+dKlUhm6oMRoOiHOhJj9
	qu3R3V98nk9IiN/GfghgqExDEwfd7X5Q/NOjNO6Jl733PTWlmnhcUJzx6fQCtnos3uqSpHY9u008T
	qQjsdL6DsbcC0PI/FBrTZuE74V9gAN4KX52Yy+DCU7OoE3E3oN/DHVU/6g2KgrytBB/fx+FOJd2fu
	1Typv5mQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXc-00000002iOV-2QI2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bSAIwJeWCXlw83FxcwNStIyG+Czo3r5yMNXs52VRR84=; b=cpbdLBh8qGvzxKZQ/wBTmp+xKn
	riVkb5Pq/4mWGAp38ncNv7M6dAGKYFnu8d+YGbRHksfBfNDGMLPEv1+T3PDu6F29s15PTbZ4nFAWj
	FrZh+bvRBv+3OpY7gc0nSb6rvDdqCtcuxUuRmXPTTIf0SW9c9LZ6StTW1haWi2NWONgu8Morzom2G
	e66P/Z2/WwcWtc+B2RkELmN+gtzgTNFfXBQdFrqjzbt+3C6Guu40k0aYCQFaySwdmENxQgJAWHlAQ
	EmAZeoA81NepgoJYiljhZ2LzVDA1/xUOfwJC5QbOiHnhPVuBoOymqf0JN66TmtIdXBAWFbxm1yRT2
	6YiCeCWg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXb-000BWl-0l;
	Fri, 13 Mar 2026 08:02:35 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXa-0005Xv-2J;
	Fri, 13 Mar 2026 08:02:34 +0100
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
Subject: [PATCH v2 4/5] arm64: dts: imx8mn-tqma8mqnl-mba8mx-tm070jvhg33: Remove compatible from overlay
Date: Fri, 13 Mar 2026 08:02:23 +0100
Message-ID: <20260313070226.579939-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
References: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070236_754975_347F454F 
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

 .../freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
index 29235e390a5d7..0f4cf1855bf3a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -10,10 +10,6 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
-&{/} {
-	compatible = "tq,imx8mn-tqma8mqnl-mba8mx", "tq,imx8mn-tqma8mqnl", "fsl,imx8mn";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0


