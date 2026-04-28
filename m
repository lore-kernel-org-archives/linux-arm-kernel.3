Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341E9FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=91kC5zO3zGCcAGJ6WU67pwDRokQj8tFGJ/XPVn4h7s4=; b=Kwqyfloo5VoEsbXSqM2hKzMnYo
	95wl3MSD8VCH6piVZI4I8wlim7O4Cdo9VaBO0y/Cb1lO8TIm8h4jteTvgMa/vP6yswZxVU7z16Tga
	fVXmkRcFKqzTKPUCs6CASGs4jWvEDGLeekrsc3xurPmGyLEzAd6IIQOjsehQC8SBnB70gOlIyInMl
	EloqVe1wLmcTTtt/rRulK7Iu+4HH8MODDMron3pWHmoB5x0PV5TqQVP1iWXjZY1AyjS/mNh0jxTdA
	aZ9S1SiP1BZShjIzzl/34kA//EczYuzj9VlVMqgmZPjkV2mQmhQ3HL9aMtaYpaAlO1BcgE1jraI6Y
	ZdYhH2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeNx-0000000111D-3l10;
	Tue, 28 Apr 2026 09:05:41 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeNt-000000010zJ-1IFI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:05:40 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7F6021A156B;
	Tue, 28 Apr 2026 11:05:33 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 456AE1A14BC;
	Tue, 28 Apr 2026 11:05:33 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2760F1800083;
	Tue, 28 Apr 2026 17:05:31 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH 0/5] remoteproc: add Cortex-A Core remoteproc support on i.MX platforms
Date: Tue, 28 Apr 2026 17:08:14 +0800
Message-Id: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_020537_482607_DE3223F8 
X-CRM114-Status: UNSURE (   8.79  )
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

This patch series is to add remoteproc support on Cortex-A Core of i.MX platforms:
1. Adding dts binding for Cortex-A Core remoteproc
2. Enable Cortex-A Core remoteproc support in remoteproc driver
3. Adding dts example on imx93 platforms.
4. Updating remoteproc driver to use prcoessor name as device node in sys filesystem

Hou Zhiqiang (1):
  drivers: remoteproc: imx: add autoboot support for A-core remoteproc

Jiafei Pan (4):
  dt-bindings: remoteproc: add imx-rproc-psci binding
  drivers: remoteproc: imx: add support for Cortex-A Core
  arm64: dts: imx93: Cortex-A Core remoteproc device node
  remoteproc: imx: use device node name as processor name

 .../remoteproc/fsl,imx-rproc-psci.yaml        |  64 ++++++++
 .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
 .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
 drivers/remoteproc/imx_rproc.c                | 152 +++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                |   2 +
 6 files changed, 309 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

-- 
2.43.0


