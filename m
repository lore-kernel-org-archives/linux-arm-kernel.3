Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A70C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/LWAfPWuEWzhKiWZxXlhjHcR5HMgwatzZ9iqvl+8M0=; b=p6XNoLl9Cgo/PS80mwc+X+8u1L
	HCFRzHErdubSjAjCLXL9ia6FZvcf3l0JrXpI1nOyEarGtUFXVBQdG8rw2hEUV1y+nY6JKB7R4VrLI
	LKhRQMpO1tI+L4Xm0w1vxjuB70K9d+sAzSFG9QeSUfFa24p3ByzPsc0sYP2Wkq/BSrRGiBdS4wyhY
	/QYCqRcFFCqgHhrWOCar0+FtrIvabqpkPBtmTp4dNIv3q0W1g0UziMYN0OdXwjYAgfACxHda913Xu
	D72uBilG2UZkG6tPZcberQ1qQ6tOY76BY8TNL2RTrSvRJDhsdtjjPpALly4U6XnFdx09Z71ZjgfG1
	ZAgw/HEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6U7-0000000Fvwj-3f8j;
	Wed, 12 Aug 2026 10:47:02 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6U3-0000000FvvE-2QiY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:46:58 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 86981200018;
	Wed, 12 Aug 2026 12:46:51 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E29E200011;
	Wed, 12 Aug 2026 12:46:51 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id EA84018000B0;
	Wed, 12 Aug 2026 18:46:48 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v4 0/4] remoteproc: add Cortex-A Core remoteproc support on i.MX platforms
Date: Wed, 12 Aug 2026 18:46:29 +0800
Message-Id: <20260812104633.22420-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_034655_762315_5EBE4E02 
X-CRM114-Status: GOOD (  10.36  )
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

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

---
Changes in v4:
- Refined dts binding

Changes in v3:
- Fixed dt_binding_check warnings
- Updated prefix of patch subject

Changes in v2:
- Update arch/arm64/boot/dts/freescale/Makefile to add new dts


---
Hou Zhiqiang (1):
  remoteproc: imx_rproc: add autoboot support for A-core

Jiafei Pan (3):
  dt-bindings: remoteproc: add imx-rproc-psci
  remoteproc: imx_rproc: add support for Cortex-A Core
  arm64: dts: imx93: Cortex-A Core remoteproc device node

 .../remoteproc/fsl,imx-rproc-psci.yaml        |  54 +++++++
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
 .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
 drivers/remoteproc/imx_rproc.c                | 150 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.h                |   2 +
 7 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

-- 
2.43.0


