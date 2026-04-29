Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782DAFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I7MR/z7Fnuf6lduN8+Dgq6LMgxDVwtxrOLMxCB0dnek=; b=ATGVJXLosBBD12fWKif7+djuHr
	VYdMRWRBXhGW7lVrZhyBczQxB/NCfVYMag6AJ8TQSroAokyPudpwCd/9u4tXhmw1Am8+absfM+LxK
	f6c4Y2vBk4HbgqRfxCzPV6QXh0BKeJUsvpGnymBeGMZZpRJ/+uksnSYqVFLvWoFNk1IeFFINollh1
	Uo06kB52yImOaLOe7AFgoAGyLsLYNewaGE62QPFwx7PcKjJcOkiES6AR2vtxgLmGKmsf+00+SUPKT
	PlzhXa8p8URhHyXlnQ+ITiYu3jvcdNTmb3G45Ia7DGNmbcYmfiMf11bqJnB8X7QpQV948lJ1TEcTu
	pfWVH3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvHd-00000002pVI-2f7J;
	Wed, 29 Apr 2026 03:08:17 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvHb-00000002pUy-1y49
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:08:16 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 751DD202040;
	Wed, 29 Apr 2026 05:08:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3BA5E201A26;
	Wed, 29 Apr 2026 05:08:13 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D29C21800083;
	Wed, 29 Apr 2026 11:08:10 +0800 (+08)
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
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v2 0/5] remoteproc: add Cortex-A Core remoteproc support on i.MX platforms
Date: Wed, 29 Apr 2026 11:10:42 +0800
Message-Id: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_200815_667516_26F703D5 
X-CRM114-Status: UNSURE (   9.80  )
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

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

---
Changes in v2:
- Update arch/arm64/boot/dts/freescale/Makefile to add new dts

---
Hou Zhiqiang (1):
  drivers: remoteproc: imx: add autoboot support for A-core remoteproc

Jiafei Pan (4):
  dt-bindings: remoteproc: add imx-rproc-psci binding
  drivers: remoteproc: imx: add support for Cortex-A Core
  arm64: dts: imx93: Cortex-A Core remoteproc device node
  remoteproc: imx: use device node name as processor name

 .../remoteproc/fsl,imx-rproc-psci.yaml        |  64 ++++++++
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
 .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
 drivers/remoteproc/imx_rproc.c                | 152 +++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                |   2 +
 7 files changed, 311 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

-- 
2.43.0


