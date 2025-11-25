Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E79ED0E6C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IB2BJ+NjsePf+RBusrruQxj2A7QMZouxVFNIpo9FL7Y=; b=WF5DVjBzfKKiqAnARk4dIekcvN
	Wl198+tkRGLE58LKD0gMJKRoOY6AZztfps247wIQOM3nLj3u+f+ETH7Pj9SZtT38Z0jz70Y9LhfMn
	/q8Yd+y3rw3wxMxWgtHnWq++GTFbjjBo7Xe3NV8/kIFbE2NtGl8ORXW0hZQWil8Dya0t6DA/23N3k
	/M/sfVdwF1FJDixqCaAgAPDNRwqQoi3ARijldCQ6X7DsSMttGyFFbx/N1SbzzZ7W2mRRz5ELrfA7O
	mn+qm1MdRmxNSOld2v5/EIvi9eZmxEB0BF42TjKTlfX33U4bJy1SNVKqc7Qj4G6e2teGtwWueu2Ts
	2FikZG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqd8-0000000D9cl-0DP4;
	Tue, 25 Nov 2025 10:50:42 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqd4-0000000D9cA-1PiR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:50:40 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=IB2BJ+NjsePf+RBusrruQxj2A7QMZouxVFNIpo9FL7Y=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764067824;
 b=EIAYyYWcP2EjEgXVHiV99Q3x46WJlZbK5+o/GMlGIoxHN3ktrZnUjqH/CxF+BBRDBXGNhZmj
 AiAmWHjypv183LoziKdQvF+UQOYOYlew90V3jFInxgiq+8hQRoxxLFMgnjUdyoKU7Hqa8MFO76S
 W8Zud+CdAReJkXR6j27DJw4knGqnsWWefPs1GOcrUECI/dF6iZ1zkTTz0s1mCuPA+421IbxBAAD
 TGUsPsvyyQ2law65EwGNEprCh7DxzTqb45vTpu/KtJSTwzAYh0T0ZghKphT5rIfVRFtkgbzrzTY
 cWHG9hGmGG5F2iQuvAf9LWmNkFPSgFBah8jl2m5IfewWA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764067824;
 b=W0TgE5G0Z3R7UVha0JqrVpHbenQtVyEG9R+ICSkCc82r+tdht2FNc/LNB9I/dYCE1/lh67ib
 yfx4oXn02/El6s+MBxeNJV4X24Doqtzf1jI3XiNNOa32OUKr14W3e9dcBRbgsjcyTtBEGgV1anW
 R8IBobCPR8NBr4dTyfDF9NshGBuh8IyIIcffDi/gdhAgJXQuWIY/3woBttiBC7jMRvpnS6A2WyS
 uFmw3BMRQ1BfgtAtZs+dDhcXHH0JtO5chvDmHUNuJmbxsWcpOpe36HjVXYi1KfXbWDIqNVjgcHH
 iBDeCxRUnQVLe+OppSawb1EdwIdhbZ3ZRVtpTqGR5s07Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 25 Nov 2025 11:50:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 77AEF220B93;
	Tue, 25 Nov 2025 11:50:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: soc: imx93-media-blk-ctrl: Fix indentation
Date: Tue, 25 Nov 2025 11:50:05 +0100
Message-ID: <20251125105006.1612348-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dFzwz1Gpdz3yZQL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 61951b6827d5fb2c244f892ba8d9d357
X-cloud-security: scantime:1.869
DKIM-Signature: a=rsa-sha256;
 bh=IB2BJ+NjsePf+RBusrruQxj2A7QMZouxVFNIpo9FL7Y=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764067824; v=1;
 b=f4Cf8KYbIsAeOggRVLWvcDc5fovtC3mucsPUCcySD0n8aNHwWELByiO0Gu8DpivhK/KJxGLA
 w2YEEXOrvWvCy54DDtxvJkidvdiIseqZjvYKYjKON9gvhw7Rt41Y/KIS5epi4NtPA2JqYdBgGwY
 yKjpbkJBQ0TJZBoIBRs8UFaYFAnsmc83cnAMSHLUsXW8XhIDkFCs0P+jU4aNtPsz0U4mzAydJAL
 3kFel6SyRmFalBXytDTOjLW1Slb/Q39caoz3ywMcTHq2I2VvLm76pXAciKjGXwGCDKRDR3/28H+
 aA+ob+QGfi8jdmru8viETGXFZHhjGIyEas5qXIxJuyAhg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_025038_754115_FEB47EDC 
X-CRM114-Status: GOOD (  10.44  )
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

Indentation is 4 spaces in DT bindings.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index 34aea58094e55..3173f0c112b0a 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -96,20 +96,20 @@ examples:
     #include <dt-bindings/power/fsl,imx93-power.h>
 
     system-controller@4ac10000 {
-      compatible = "fsl,imx93-media-blk-ctrl", "syscon";
-      reg = <0x4ac10000 0x10000>;
-      power-domains = <&mediamix>;
-      clocks = <&clk IMX93_CLK_MEDIA_APB>,
-               <&clk IMX93_CLK_MEDIA_AXI>,
-               <&clk IMX93_CLK_NIC_MEDIA_GATE>,
-               <&clk IMX93_CLK_MEDIA_DISP_PIX>,
-               <&clk IMX93_CLK_CAM_PIX>,
-               <&clk IMX93_CLK_PXP_GATE>,
-               <&clk IMX93_CLK_LCDIF_GATE>,
-               <&clk IMX93_CLK_ISI_GATE>,
-               <&clk IMX93_CLK_MIPI_CSI_GATE>,
-               <&clk IMX93_CLK_MIPI_DSI_GATE>;
-               clock-names = "apb", "axi", "nic", "disp", "cam",
-                             "pxp", "lcdif", "isi", "csi", "dsi";
-      #power-domain-cells = <1>;
+        compatible = "fsl,imx93-media-blk-ctrl", "syscon";
+        reg = <0x4ac10000 0x10000>;
+        power-domains = <&mediamix>;
+        clocks = <&clk IMX93_CLK_MEDIA_APB>,
+                 <&clk IMX93_CLK_MEDIA_AXI>,
+                 <&clk IMX93_CLK_NIC_MEDIA_GATE>,
+                 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+                 <&clk IMX93_CLK_CAM_PIX>,
+                 <&clk IMX93_CLK_PXP_GATE>,
+                 <&clk IMX93_CLK_LCDIF_GATE>,
+                 <&clk IMX93_CLK_ISI_GATE>,
+                 <&clk IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clk IMX93_CLK_MIPI_DSI_GATE>;
+        clock-names = "apb", "axi", "nic", "disp", "cam",
+                      "pxp", "lcdif", "isi", "csi", "dsi";
+        #power-domain-cells = <1>;
     };
-- 
2.43.0


