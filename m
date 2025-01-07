Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF8FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQt81lT3ohtYAwl2Xf5CAr0qwa/PSJBKzCsUu5z2In4=; b=usxyggVhgjrq08Fl2YwXHIMi09
	+5PDkC98NMB/huQh+DWCf3lu/wfbHOoVp1JNHXfThw9zVBBn/m2tMnLSwVtU8A339j6JVa8LM9lan
	iJus41MMHOX/qoD3SFiOeLe8MRCJSlzNZz/kfxpbT0uNHSfC5Y0WV/X0WzF/XUDovf317DZ1jJC8V
	BvbBmxJF4gGRNG0u1HmCfNHH1tNSX54HTzh7+47nMKEyi2CcCKUNr/HyHtaJR8e8qQghfueGaQq1Z
	Cvk4zWU1Tgn2FpCrBhEULhWGTBkjMgE8h3oVJ0gqPVojxf5rRPzPqQ6QslINWHHGcLOMYOhvDsPkw
	Wg1VWrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAQZ-00000005A93-2H19;
	Tue, 07 Jan 2025 14:19:27 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAIw-0000000581Q-1nZx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736259094; x=1767795094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RQt81lT3ohtYAwl2Xf5CAr0qwa/PSJBKzCsUu5z2In4=;
  b=GysZQZ4wGKpSWgAh+ESeeU1GPDm+l14p8OSTTyBHvZehJeqn653wDvwT
   9N2rqBiWqKw72s6exjtIH6Pj2p6jl9xsbSQjtmDn4GInu12j4ltNbJ9rX
   RqON7J/6LFEmxHy0guwrvTUDVHXtMdqJn0J7dzffT654WrNTGpMQpAExA
   TEHYjA0zCC4vd0lwuiFR/9jip9PC66dhYLrvbrUqXJw56ism3c11jQNrI
   B505JCbxUCS6sB5bFSaq7y4RyjOFxqqgBC153CLOoLY2AjchAJ1Fjq/nH
   3+gUyahjU0G22q/SIqbrbuMUAvFJS72yo/AbaraVWhGwCseAPFMYY9fQK
   A==;
X-CSE-ConnectionGUID: GLtVm3fZTMmsqRBmuV9kRQ==
X-CSE-MsgGUID: F2pTd1wFT8uM+EXe50cxyw==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896501"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:11:32 +0100
X-CheckPoint: {677D3614-38-31397509-E321C4C4}
X-MAIL-CPID: 36E5F9A0CCB1A3BE4EBBA98E1D59E6D5_0
X-Control-Analysis: str=0001.0A682F19.677D3614.00E6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E00AE164D17;
	Tue,  7 Jan 2025 15:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736259088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQt81lT3ohtYAwl2Xf5CAr0qwa/PSJBKzCsUu5z2In4=;
	b=IyqZO+j5FUsicsd7p+hguhlDgGewHix/apTdD/ff71NZKUyyv2Iuxw7vG8gDZkfVpuISbi
	KW5UVdz9FZIprlhiLG71mW27LiKUP9bvenWMzmr817UNRTNG8ybJRBLkzBg8/OVYR8aEO1
	7XU5fAW5gT66XdxVZtk0CxqsJZkgU2DSzpwlBPbxOdJu5HcV8jEV4BV96HqUVx4aXB4C+g
	usfmqcTkP+eIGzzJItJfzBGj7O81cLpUPEy7jrzCDiI+ZbhvKxMVR/k1K4whI8rQRTEZ2e
	0rq/34Wz6CH7JhXFllHiSHJ5PWc9qay+paTVNiqzUuBaKm8nG/q1YAYXRLFmDg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: freescale: imx93-tqma9352-mba93xxca: sort pinctrl nodes
Date: Tue,  7 Jan 2025 15:11:15 +0100
Message-Id: <20250107141117.984652-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
References: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_061134_778134_85F8BBB2 
X-CRM114-Status: GOOD (  11.41  )
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

Sort the entries alphabetically.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx93-tqma9352-mba93xxca.dts    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 8e939d716aac8..861a028a1b165 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -755,12 +755,6 @@ MX93_PAD_GPIO_IO03__LPSPI6_SCK			0x051e
 		>;
 	};
 
-	pinctrl_pcf85063: pcf85063grp {
-		fsl,pins = <
-			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x1000
-		>;
-	};
-
 	pinctrl_mipi_csi: mipicsigrp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO3__CCMSRCGPCMIX_CLKO3		0x051e /* MCLK */
@@ -769,6 +763,12 @@ MX93_PAD_GPIO_IO11__GPIO2_IO11			0x1400 /* SYNC */
 		>;
 	};
 
+	pinctrl_pcf85063: pcf85063grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x1000
+		>;
+	};
+
 	pinctrl_pexp_irq: pexpirqgrp {
 		fsl,pins = <
 			/* HYS | FSEL_0 | No DSE */
@@ -783,17 +783,17 @@ MX93_PAD_GPIO_IO09__GPIO2_IO09			0x1200
 		>;
 	};
 
-	pinctrl_temp_sensor_som: tempsensorsomgrp {
+	pinctrl_tc9595: tc9595-grp {
 		fsl,pins = <
-			/* HYS | FSEL_0 | no DSE */
-			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x1000
+			/* HYS | PD | FSEL_0 | no DSE */
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1400
 		>;
 	};
 
-	pinctrl_tc9595: tc9595-grp {
+	pinctrl_temp_sensor_som: tempsensorsomgrp {
 		fsl,pins = <
-			/* HYS | PD | FSEL_0 | no DSE */
-			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1400
+			/* HYS | FSEL_0 | no DSE */
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x1000
 		>;
 	};
 
-- 
2.34.1


