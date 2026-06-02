Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AC0CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NWaQcYGDaMNAmtbxSx8JbfMXbIZL1tTWkB4ZeuUTGDI=; b=sCr+SUqFhFvTxa
	llhSMYcEtM0MH6DI5AXrkGABk3nqo7DYOX12lo0kQwitTvcCgPr/8Frs3rZbkt0QTfxoKK425FulS
	MIMEUvtCdysGaWishTEEYxJg2B2EzJXfxbWevo633UdIrqcQUwPFm9IctBlJZFPO3f+OYqsoV6M8D
	j89NN9FGwcPHNbkWcUGIZnfiflQde1FyJ8tBcaUVTRlSfYzwDrjYLH634JHDO2sEhBMEs4TpCP7we
	WYWKBuOI6yoTb0++T5UkxdEtltUefEZZD3wOthzr5so2lLbdAEutdPPqf+2vX7B9bO6DM19BhdmHG
	PR3c3kn127TFyAFXCs+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUG4O-0000000CF2K-1UdK;
	Tue, 02 Jun 2026 03:45:36 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUG4L-0000000CF1T-204f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:45:34 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A11941A4D62;
	Tue,  2 Jun 2026 05:45:29 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6E7E01A32C3;
	Tue,  2 Jun 2026 05:45:29 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 10B17180004C;
	Tue,  2 Jun 2026 11:45:26 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v5 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Tue, 02 Jun 2026 12:45:14 +0900
Message-Id: <20260602-imx95_frdm_pro-v5-0-44ca5dc30a14@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpRHmoC/23OywrCMBCF4VeRrI1MJjNp48r3EJGmTTWLXkilV
 KTvbiqI1+UZ+H7mJgYfgx/EdnUT0Y9hCF2bBq9XojwX7cnLUKUtENCAVkqGZrJ8rGPVHPvYyaz
 IK9COweYoEuqjr8P0CO4PaZ/DcOni9dEf1XJ9pvLv1KgkyLwE8GxrcMrt2qnflF0jltCIL0z4i
 zFh0oQEzjDW9In1C6dXf7BO2Bq04ChT2ppPTG/4z9u04Iw1GWYu7Nvb8zzfAeh9371hAQAA
X-Change-ID: 20260311-imx95_frdm_pro-7a8d03b50982
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780371926; l=1555;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=FV44CsHNBZkQdiY1zjysXcic83FAV+FJmsdQv+dydqI=;
 b=Nz7B1Ix9oOC1evsvCaG9to9GPr1GNf4B1Q0G9qx4XOSlJ1/+wjkhsXvNTgSEBUxR44Y4lK3y9
 Lwhhd3uo5AEDWypUWacvDPUy8IF9WcfpTRchy7NVDQu79gnbATM81bE
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_204533_655508_845077B8 
X-CRM114-Status: UNSURE (   7.71  )
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

This patchset add Devicetree support for NXP FRDM-IMX95-PRO
development board based on i.MX95 19x19 SoC.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v5:
- Rebase to imx/dt64
- Link to v4: https://lore.kernel.org/r/20260518-imx95_frdm_pro-v4-0-975346555a9b@nxp.com

Changes in v4:
- Correct underscores in node names
- Correct 'silent-gpio' of can_phy to GPIO_ACTIVE_HIGH
- Fix typo in pinctrl_pcal6416
- Link to v3: https://lore.kernel.org/r/20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com

Changes in v3:
- Change status of CAN1 to reserved
- Remove unused pinctrl
- Explain difference with i.MX95 15x15 FRDM in message
- Link to v2: https://lore.kernel.org/r/20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com

Changes in v2:
- Run dt-format to reformat the node order
- Change compatible of mqs to audio-graph-card2
- Add imx95-19x19-frdm-pro in Makefile
- Link to v1: https://lore.kernel.org/r/20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com

---
Joseph Guo (2):
      dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
      arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts

 Documentation/devicetree/bindings/arm/fsl.yaml     |    1 +
 arch/arm64/boot/dts/freescale/Makefile             |    1 +
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1021 ++++++++++++++++++++
 3 files changed, 1023 insertions(+)
---
base-commit: 6d5c00b4c747a5344dd6ce6629fb52c9a70bb443
change-id: 20260311-imx95_frdm_pro-7a8d03b50982

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


