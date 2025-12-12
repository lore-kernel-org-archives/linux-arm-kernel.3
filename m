Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AC3D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 02:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5mgefn4dJy6dHAzSkDTjoEeB/SmNjOssQK+xns8e/ao=; b=E2MQu0hTN22JpP
	NpGbpj3ixbSqTPDBYuzgW1sqKBpQNbEX1b05i7ff5MSdzlnXF9IsTaMNJw2n3AeDF+tx+6aBd1yk4
	idFO2T0JM20YpbS7IeNYocZsqg0FQDAVEmRk3c7UULqcvSjTDGCeeKEA/yJajkaJw88pfeAndnFAU
	7601CJLDCAQkuB5HWsYN+DUzVWhEhlIDA5Gjyp4AmXGEYqu4k/qb65dSGK6AejOZ26FSv9NgaxmDi
	LEOIYXObuh7c/kx22Yhnnweq2qSDjDDuubCqdtAJHasThq/0DupwWIeLFmV9F90jM3J39r834PzKj
	tvpNlr/+yLJyrSV4GW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTswb-0000000HYOy-1Yd5;
	Fri, 12 Dec 2025 02:31:45 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTswW-0000000HYNr-2xlH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 02:31:44 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F0327201E63;
	Fri, 12 Dec 2025 03:31:36 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B95E0201E61;
	Fri, 12 Dec 2025 03:31:36 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E7A2B1800241;
	Fri, 12 Dec 2025 10:31:34 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v2 0/2] Add FRDM i.MX 91 Development board support
Date: Fri, 12 Dec 2025 11:31:32 +0900
Message-Id: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIR+O2kC/23MQQ6CMBCF4auQWVvTaYWKK+9hiAE6yCxaSGtID
 endraxd/i953w6RAlOEW7VDoI0jL76EOlUwzr1/kWBbGpRUNSJeBLvU4nMK1oneWjWoURoyVyi
 HNdDE6cAeXemZ43sJn8Pe8Lf+ZTYUUlBtGj3YqdW6ufu0nsfFQZdz/gInVthCogAAAA==
X-Change-ID: 20251114-imx91_frdm-add2b2c07e78
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Tom Zheng <haidong.zheng@nxp.com>, 
 Steven Yang <steven.yang@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765506694; l=1410;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=qZxoOpZklmk0uLrecCQ0PIkOwJOw6TGfs6nzQjEN3Jc=;
 b=k9WzHtAHy892HO1YZlrnaTyEyjFDdhH19IAAa3kvAPqGDaa5BbyQTFUSbLQ7ED2OWM5os8hgH
 sD6AwNqmtu2DwQ338HGaGwbr73Jfk7YqWMv3m9Z9QLBvG4iwqAGeCOy
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_183140_884244_DBB81A4A 
X-CRM114-Status: UNSURE (   8.28  )
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

FRDM-IMX91 board is a low cost development platform based on i.MX91 SoC:
https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91

Add device tree and dt-binding for FRDM-IMX91.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v2:
- rename compatible 'frdm-imx91' to 'imx91-11x11-frdm'
- rename 'sw-keys' to 'gpio-keys'
- rename 'user_btn' to 'button-k'
- drop lpspi3 node
- rename iomuxc 'grpsleep' to 'sleepgrp'
- move dt-binding patch before the dts patch
- add board page link in cover letter
- use CAN PHY to manage the stby gpio of flexcan2
- drop realtek property
- add pcf2131 aliase
- add bootph- property for nodes should be kept in bootloader phase
- add reset-gpio and assert for eqos and fec
- delete unused alias
- Link to v1: https://lore.kernel.org/r/20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com

---
Joseph Guo (2):
      dt-bindings: arm: imx Add FRDM-IMX91 board
      arm64: dts: freescale: Add FRDM-IMX91 basic support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 904 +++++++++++++++++++++
 3 files changed, 906 insertions(+)
---
base-commit: 73f1e611b076de705c2f1c26cfdfc5b8e96f4733
change-id: 20251114-imx91_frdm-add2b2c07e78

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>


