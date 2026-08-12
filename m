Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39166C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFX4ZlFemljLIac8lB7IV6ALH5NUhSo+O7Eb25mdpiM=; b=M6WEwFqS9ngZryrrgxlFtLtvlD
	MXTHfE7vXuQc2gTw4ObNsF9yKMavZ4TbGZE3oPKp21fYT35xFr3RdV9GNK4ky/wWuxtkewDXE093R
	sGYdimyO2fBgik/0cIg2wNQt5hsu+SV7xo2ei4eC//vuMzCcgRtallczA0oo+knKDAsuBZb31U8+k
	aXO78nf/kiSIb6x6jhY4IvY5E5X4ELXTLdR+w6ikir50Kndh2IDqD8ymebDZV7PscM1ZHuIhMhh8t
	dr0kqoU4bPZKMVR9tYrpHdQ89jEMvd164qL6ANqg37+labU2jxnUKd2Wj7zNuDzzSZ7ro8qXfqqhz
	8f+/KwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6UL-0000000Fw2a-1MVm;
	Wed, 12 Aug 2026 10:47:13 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6UI-0000000Fw0B-0JIS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:47:11 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5FF671A000D;
	Wed, 12 Aug 2026 12:47:08 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 24D8A1A0012;
	Wed, 12 Aug 2026 12:47:08 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id CF83318000B5;
	Wed, 12 Aug 2026 18:47:05 +0800 (+08)
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
Subject: [PATCH v4 3/4] remoteproc: imx_rproc: add autoboot support for A-core
Date: Wed, 12 Aug 2026 18:46:32 +0800
Message-Id: <20260812104633.22420-4-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260812104633.22420-1-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_034710_269820_E47BCC49 
X-CRM114-Status: GOOD (  12.09  )
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

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Add autoboot support for Cortex-A Core remoteproc.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8a3de27c96b7..e8d239bef5c9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1286,7 +1286,24 @@ static int imx_rproc_sm_detect_mode(struct rproc *rproc)
 
 static int imx_rproc_psci_detect_mode(struct rproc *rproc)
 {
-	rproc->state = RPROC_OFFLINE;
+	struct imx_rproc *priv = rproc->priv;
+	unsigned int cpu;
+	int cpu_aff;
+
+	rproc->state = RPROC_DETACHED;
+	for_each_cpu(cpu, &priv->cpus) {
+		cpu_aff = psci_ops.affinity_info(cpu_logical_map(cpu), 0);
+		if (cpu_aff == PSCI_0_2_AFFINITY_LEVEL_OFF) {
+			rproc->state = RPROC_OFFLINE;
+			break;
+		}
+
+		/* in psci on state but running Linux */
+		if (cpu_online(cpu)) {
+			rproc->state = RPROC_OFFLINE;
+			break;
+		}
+	}
 
 	return 0;
 }
@@ -1391,7 +1408,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		bitmap_copy(cpumask_bits(&priv->cpus), &cpus_bits,
 				min((unsigned int)nr_cpumask_bits,
 				    (unsigned int)sizeof(unsigned long)));
-		rproc->auto_boot = false;
 	}
 
 	ret = imx_rproc_detect_mode(priv);
-- 
2.43.0


