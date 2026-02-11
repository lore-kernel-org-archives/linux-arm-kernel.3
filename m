Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DB8E9E301
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7pDwaK17CdUZh/u5Iy4Xmvwxf0XguEjLtkZgT9LWWU=; b=As/nxFMAwVYUW8JP9+8tQY51R/
	RdtfySzPC3EX0LMXld4l7+as5Ih8xcZ4Wo68vgS2qhJlRvfpXDyRsJQ6LqRSxUGenSj2bwQfHEC2F
	m0CJ5zKbq6EAsHWwOYqEOlPdV9b/jpf+x/RHfKjMNHN8Ot0AJQcO/Fdey3DnWuymKJRz8lfDpRVLp
	Khi+zeUEKyMUxBTwQzEwnEA1OV/yG8SL36M3RSoLRuJb5uCcHCJl0pGbEpMbUfVjdy7hF2t3mPZgi
	2zNT6fSD5b3YmnNCJUpL5TiZ+q1nu30zcD35VY14Onu2Ev9vy3ScQB0vmGlmtoJOZsg9o0osV8yFH
	R8WR+PXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9RW-00000000d0b-41rD;
	Wed, 11 Feb 2026 12:35:42 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9RR-00000000cz3-3jjO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 12:35:40 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=p7pDwaK17CdUZh/u5Iy4Xmvwxf0XguEjLtkZgT9LWWU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813307;
 b=bnFg/FYSuz08VIlwXmQkUmc+PAihn88yyOQgcFSB2+cooVFLNq2fZuKdCSCUhwBOpO3LPCr8
 VMXOnfELcsgMJw4F15b3bzG7hy4h4EKb69oEmUxV5Pbqgyw/jOdScizgIdP5gplwFJneVfEEfjV
 c0BABdW2uVwHIUCoPmpbDhcFcf6nYS6fQ6T/Pv3dLO3jVSO7em/iu3nFdTyFjIHjckiuB4xArEU
 6XbZU0D1vzbvUUc4tbc3/M7dX6zF3Ok7AvuHudzOK9TnQcQgfBTmHfmfqnQ/NEoNXiUsEZTcMf/
 6wqra6i9Z3uldfVA8TpGkqTi/c2nHUgJKV2sffGMbHiLg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813307;
 b=RCfWhb08NRPNX17bLhAaw/fmlvW7ZV1Fa+D0HHYC+Fg15e+EFLLYSrscZNSSy4Ey3R+b+9ko
 3lGzeJh0hamjb2ssxDJuBG8VH+rLweg9cVRauRhQIc2wjnkGpQ5Z4QsxRMf6fjxSt698sNITLS+
 qwqXeRu5svxoCYL75Hm8HA61NLscriG7wLkg5GzlFenXfLeDsWUvmgRcrVAlvTNKX9T1dwSyp4G
 GYYrjnbnxZ7uYAs8+GMCQYwZOfjHAOL7EWsXzuw1i2nhqKpxjQKu+6/1YWBGtjHaUAb+Hzr/y6g
 f66J6f1/c9p+ewIWyuxeAXPXVK3vgUeOpTZUWsSq86TGw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Wed, 11 Feb 2026 13:35:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 01C7E5A1345;
	Wed, 11 Feb 2026 13:34:44 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 2/5] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Wed, 11 Feb 2026 13:34:29 +0100
Message-ID: <20260211123436.1077513-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4f9yYf1s13z2nJDK
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 445cfd46aa584c7bfd22defe62d9001c
X-cloud-security: scantime:1.964
DKIM-Signature: a=rsa-sha256;
 bh=p7pDwaK17CdUZh/u5Iy4Xmvwxf0XguEjLtkZgT9LWWU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813306; v=1;
 b=XpG6CePSjoPVc0eeuZCin5Jp/p4A7cFoJr/za10CGVaZ2EINIcy5ofwNsdDrwbWf/+j67e09
 SVG8rkwHYl8tRTL813AGRN0cIVpNzRts4ras5CGUemXCoQva+tA/7rKNe2K5Uoe2+u1fJ2LIivf
 SMZTyuWwNx2QS8mUPIZ1SGrt9sEDUn/oZy77ydNzpk4Pv4Zkd4UX8zzo9vQyU2qAjJDNJYqRwvf
 i0U/SLqkA9QoSHsh3i9J6lmKbWDvYoGbv4V1lhauGUFazN9nf1DPg9uTNQaUvsMYPP2IRt5gtUd
 X/4qZ2aDAAfA7QwGTwHA+z7ivt08H7Il9jmt7j/BHx+sg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_043539_221911_35EA4080 
X-CRM114-Status: GOOD (  12.55  )
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

IRQ mapping is already present. Add the missing DMA interrupt. This is
similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
DMA IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index bd6e0aa27efe9..f2c94cdb682b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
 		ranges = <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
 			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pciea_lpcg IMX_LPCG_CLK_6>,
-- 
2.43.0


