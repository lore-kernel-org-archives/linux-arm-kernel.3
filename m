Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A658DCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31o55f3VkuC8l8T21nAR5d6paqxEzUQw0xt13BBag+w=; b=yWENUpawcXivjUxbphHCMmPQZ+
	Vlz8IE9g5252gIx5FKYuDPehs16QOnfL1TLuRvxtbANC5F3yXmICpE3z85HDeELXQGtIJnoACWZgL
	Kg5tO2LdD3pmSTlQQKC87nb2zrJ2UQucJ+RBy1ZCWdWW9SJqLUHySY+h8/Y6Khi7uifSrcLTnpZKA
	vU6DCr1wI5uexukrJE+6xQbhO3TSJiwwiIF4MJ53jYFVSzC4CtyhlqnNhNN7dU1uHUDrX1dw7g7UT
	9pZP6Hf8FQoVvzI5YN9nmWR/QoJDQLS0GNFVcJTdsDZEH0VnBOdvImWhax/yq2vaNQUjP2wn5bSlR
	3pdTV8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGos-00000000THO-04rQ;
	Thu, 18 Sep 2025 15:45:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGop-00000000TE8-108e
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=31o55f3VkuC8l8T21nAR5d6paqxEzUQw0xt13BBag+w=; b=hwpEaNRtjpJZEqYDg/NzAvJrx7
	4L4scAyxqtk5+WfRo1kTPba3xaQD7fj4tnfAU4qcMxXAYZebZz2ta1kM10oTizGgqN2vZSq3S+wX8
	CrPVrNUqu/7Iq+2BueqIKVVnvLZnjQqa962+YkOgzesHMAiBt1v6mcKworWrAQ7qkKgXPwlzXOEXc
	KWU9HFmNLNHlsfEMU7QUuBaCWY4zmxhsZOpMfILtovW6tFCyKFQMhnQ9o5rk2e4gdmAQg4WttpNxp
	niPOJv32a3hG15u9qpsHEUAV5RnWOItJ7DmYRG46NVdgVCoJ2wVHZk6WClZIV9Km56zT1P2qJtt5+
	OAes/QEg==;
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGol-00000007dnM-1qSU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:45:09 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uzGoZ-00B1eF-UP;
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
Subject: [PATCH v2 3/7] arm64: dts: imx8mp-venice-gw702x: reduce RGMII CLK drive strength
Date: Thu, 18 Sep 2025 08:44:47 -0700
Message-Id: <20250918154451.2531802-4-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918154451.2531802-1-tharvey@gateworks.com>
References: <20250918154451.2531802-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164507_589979_D581D567 
X-CRM114-Status: UNSURE (   9.07  )
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

The i.MX8M Plus EQOS RGMII tracelength is less than 1in and does not
require a x6 drive strength. Reduce the CLK drive strength to x1 for
lower emissions. Additionally since TXC is not a high frequency clock,
use slow slew rate (FSEL=0) for lower emmissions and improved signal
quality.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v2: add FSEL detail to log (Peng)
---
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
index a1232a4f8485..dd9eeb3479fd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
@@ -462,7 +462,7 @@ MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1		0x16
 			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2		0x16
 			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3		0x16
 			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x16
-			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x0
 		>;
 	};
 
-- 
2.25.1


