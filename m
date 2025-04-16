Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4948C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FScWshifJvIijnD4Sqm8C1fnkngATgObzxPdFsDLYYg=; b=p7FiMzT4/neftB8sIcjKdXJtOI
	WsjtqgjimWJmdI1i96c3hxy7hrFk7i6ENMraxV4SBxsBLgr1g2ymOD7IHouBST2pJ54CHoW9kLIjL
	eSep0OqFsIYc9PILlSvC87fl9ELpJr8nC8zUxiAfLvBx5QR7rGRrAAkR/s1CgpM3d6eZk8souo0OE
	O6YW2630cJJhyKSL9gElg3nFFCgdBWxTHGVBHG6rMyj95GpKxJWEK8iyVYPZWrXBg9Ofu5hBi1AR8
	mP9b1brA5sk8O98eU0enRKfz0thCiHZU0jo9u3Gla86FcpOTkiTIN/n4FKr+NT0+NgqpzvXmcGmSe
	kGX0Rpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Zl-0000000A3QR-02vn;
	Wed, 16 Apr 2025 15:21:21 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53kF-00000009tO9-2uHI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:28:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C421DBFC16;
	Wed, 16 Apr 2025 16:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1744813686; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FScWshifJvIijnD4Sqm8C1fnkngATgObzxPdFsDLYYg=;
	b=HHdz4cUV7+QsbsguIExtP7/+cPEszjbCZcBLkQepe1fJJGz8DZuC3jSn9x5WfCWCGNbab1
	AaBkVZ7sDyjXXn8HKjZ+YOHa/nORFP0DPkvHqKF7/3Imycl/4jHdUo9Zh+sk5w0i51fiFD
	d1YgU1sPMDuITFRA2q6IGdy66mgIueKV/GGcRKgF6rEsbOVjhgosgQucv+H4Rjz046o2vt
	zgxgJlG+uywRUfYwGnBljn2Y66DPq9SLYDQC6xVWUN9cC9sk5Ow+8mdUEYMQlZDqA4BS+y
	zJ6T/nLcz/QoIS6N3w1XfGpuDkfdKIO6mICO0Kz09k+/GK7Zk5UBUQ0WxwtKLw==
From: Frieder Schrempf <frieder@fris.de>
To: Peng Fan <peng.fan@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>
Subject: [RFC PATCH 3/5] arm64: dts: imx93: Add node for EdgeLock Enclave (ELE) firmware driver
Date: Wed, 16 Apr 2025 16:26:22 +0200
Message-ID: <20250416142715.1042363-4-frieder@fris.de>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_072807_870687_6F1407AE 
X-CRM114-Status: UNSURE (   7.06  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This adds the node for the ELE firmware driver that provides the
S400 API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 64cd0776b43d..122519648d1b 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -222,6 +222,12 @@ cm33: remoteproc-cm33 {
 		status = "disabled";
 	};
 
+	hsm0: secure-enclave {
+		compatible = "fsl,imx93-se-ele-hsm";
+		mbox-names = "tx", "rx";
+		mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+	};
+
 	mqs1: mqs1 {
 		compatible = "fsl,imx93-mqs";
 		gpr = <&aonmix_ns_gpr>;
-- 
2.49.0


