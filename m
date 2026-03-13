Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE22105F79C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjnQd5X78Z17qUNY/CjSBfwHi61igTR49wOu82EKJas=; b=U6iHv3BmOvGFntn47ptVO5ILSr
	Yqqs9cUsquZlNq3lpES5VGiarTRgAWdKY20zxcTtuuYcGYpClfXGZslpwRSCTOSEgaodS+OX1Oipr
	SZCoSM+KrmT4lRPuJ/AU7nNZixNA5hYC0aCD/hNuUxbdbcthAtFfWfNc1IRAPeDTDsfLlmTLMjun5
	/mllYW8tGSVOr1+/REiTfWHA3f14qZ7YMj2jFHkz4slD/5gTUCM+ddIMKFLg2OS0ephJsKdMaywRI
	UQ9ZPKaXxZqyAxXZXBuy/2Uwz6bzakuM8ba3XAB+2eMu2pPgN6ojwBsV0QukOpBsp41PWJYpWKdGi
	NBThtQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10mq-000000002M9-3IFL;
	Fri, 13 Mar 2026 11:34:36 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10mj-000000002Ib-2Z5M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VjnQd5X78Z17qUNY/CjSBfwHi61igTR49wOu82EKJas=; b=C24+MHx9Mgb4ZQAmDbZ3j0qR1J
	lpDhTw+lompiKtfEAz3xllYrJ0Rad4/aNAdT2DGJpYmoo4o2Y8uYNCQsBpxG6xnVoGX4pEgFjoxjn
	NVFyhjgDyPc4uKHjJkt0PtmwCU2d+32E9fMBJhAmTqrFGSVkpGs8ByTQjA9R5CIZVtCZ6UGJteIIh
	cNJwqsQ6xLovSOI6p+ibqSnVd/4fJAlzJ0DjhIt+eN9cuxh8+++/i8ZDXbvUz9cOglCsP+cBhNEj9
	1Xt/ANSkGG8ivu5BgGpJVPw/zd4T3z6cwVB0JslpykGiq5vzfnBdp5yjFg+vb8GTKGXR0wIMfq4Lo
	/I2kdujw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mh-00070m-2p;
	Fri, 13 Mar 2026 12:34:27 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mh-0004VU-1H;
	Fri, 13 Mar 2026 12:34:27 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 3/3] arm64: dts: freescale: tqma8mqnl-mba8mx: Add dual-channel LVDS overlay
Date: Fri, 13 Mar 2026 12:34:20 +0100
Message-ID: <20260313113422.1722787-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
References: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27939/Fri Mar 13 07:24:42 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_043429_647015_AF5F5A3F 
X-CRM114-Status: UNSURE (   9.08  )
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

This adds an overlay for the supported LVDS display AUO G133HAN01.
The same overlay as for TQMa8MxML can be applied.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f1b54f1b0a23a..18fe5134ff407 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -216,8 +216,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 
+imx8mn-tqma8mqnl-mba8mx-lvds-g133han01-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtbo
 imx8mn-tqma8mqnl-mba8mx-usbotg-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-usbotg.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-usbotg.dtb
 
-- 
2.43.0


