Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716EECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z17c0Z6gdvcqsoZbJLjmb3Fjyl+nR7eyCn4ibpLPBn0=; b=33nxf+ze21F+hlOcknRhomKldA
	723MRJwoUICmZCdS4VjMhLxxkzy0+bigKFDR1mYBTRPF/47Xxrm9X9pCMq9Tv8ETMQZyGr9ee5WFr
	H+GTxQiRjEcmHmTPlvG6IZtVEzoSBDNyKcukQ5x81LaCSazlA+1Dso8iLCozTARbuToNcpnUIDRaR
	FR2zl1ectP97ACk+n030pEMLDr6XyF1f7DlDabmROyueiGVFMPD2MOnUZpXob4emF0tShjYUzdoLJ
	GfycTtK60RPflZWA3nQGGW01udgAKD3Z/u1zILRiZ1ZspLrrjTV3NtFHedd94BC+JYh7mMCQ4uDbv
	lhEfh5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGos-00000000THx-1Skf;
	Thu, 18 Sep 2025 15:45:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGop-00000000TE6-1Msy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z17c0Z6gdvcqsoZbJLjmb3Fjyl+nR7eyCn4ibpLPBn0=; b=Nf2/1UP+XIGMJBRahiVU6lI3vX
	OnVSD9BW0+yi+AiZ74nQ0UvxxvwSvBGsLXX80PKhjdVEk/wCBegyrYI6tca1thPES0YCtsYBK0Y+8
	UBqbuUHF1K4dXoLj+yJIXNEb1sR4mSlQlukjwsw0SY3Cw/UPK1bmoDaZcwcNZ3RiQBZZTbrbZgbQy
	P9Nf0ijipzEdOcFlWmL5KmP/eWmzVAa6nc2lWNOPHCHkdp02cF0OXJeow4Wlk/V+uzlla2Gr/B5kX
	7jMEZLwpSYbrPGznDLmC9/8s/wy/FjMBOQ79dTkWxSojbXSB4CxgBYwuIE/xPIbh1XmqJdnGnhYbS
	fxsvuGAg==;
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGok-00000007dnC-49Uv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:45:09 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uzGoa-00B1eF-QM;
	Thu, 18 Sep 2025 15:44:56 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 4/7] arm64: dts: imx8mm-venice-gw700x: reduce RGMII CLK drive strength
Date: Thu, 18 Sep 2025 08:44:48 -0700
Message-Id: <20250918154451.2531802-5-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918154451.2531802-1-tharvey@gateworks.com>
References: <20250918154451.2531802-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164507_139472_D4FA5EBF 
X-CRM114-Status: UNSURE (   9.06  )
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

The i.MX8M Mini FEC RGMII tracelength is less than 1in and does not
require a x6 drive strength. Reduce the CLK drive strength to x1 for
lower emissions. Additionally since TXC is not a high frequency clock,
use slow slew rate (FSEL=0) for lower emmissions and improved signal
quality.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v2: add FSEL detail to log (Peng)
---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
index baf46fe28133..dca213c85cc3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
@@ -446,7 +446,7 @@ MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
 			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
 			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
 			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
-			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x0
 			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
 			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
-- 
2.25.1


