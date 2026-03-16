Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E821FF506E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fbpvVRIIYo0Hxz9yanMj6qxUU+5nxJuF8pCU2fdjBA=; b=bkzLumxsXZohE06wpwjvaH3WKE
	ZPkBQZMJg/V7XxuQkjiEbDwlSEDygx9lKkBa8fTy/gWGJGaVlRtgf0G/QzTptUT2bhh0eqTtQ2jPD
	o+FjeIUTC7mIIZIdJuyrIV6HWnUu3dXg4I3Ly7OhwRFk7BCYkt9ujkMu8/VFscDnAEfPCQE4KnxIl
	mgm0D6IFjftQhzyDghn3nZ2JUh/IAwD0R/9a7nYPMSSGBMTYOrklBP7GmQYH6okCgxmWzo22tBjiz
	GldCTYNIv9UGXWxWjelZUAdcN179AO7dLYT89YfQ8V1Bdg0vidkHA2fSFiP56slM4Je/pbdrC0DhK
	bPYu+uDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29LY-00000004Fxh-0Gqi;
	Mon, 16 Mar 2026 14:55:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29LW-00000004Fwe-2r40
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/fbpvVRIIYo0Hxz9yanMj6qxUU+5nxJuF8pCU2fdjBA=; b=hIF7zBalbWuCq2Aj3O1joDXtjm
	VcysOD8+3qe77yycAqjjesUvRYf+kNK1VlhYo+iL9uSVly+pjG2iYZ3l85w3+gkdrmqq4Kx7myPL6
	n93noTFlPFv9/ozjwOK924DrnaN9GO5rb6ehi4KdcB+sb8e1v+6KZG52ywcl2R5bonl1p673GLpIh
	9d20t3JienzpNgcy34lvl2sHT/onfUN/852i0DG4T662ypblbBjPXxmhZE58/lC8BCctPVDdMzV7j
	Wf82/1m50Ep0eHUd4Rvdmg4SrJK7bq2g0dLPWMqcuKq5AR4/dJr1xmoC9dXEQEd8wP7f5IQ8gTkwz
	nT8ciwgA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Sl-00000006sob-12kd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=/fbpvVRIIYo0Hxz9yanMj6qxUU+5nxJuF8pCU2fdjBA=; b=jkdhjNHxr5e4o/aTy+3iWCQfq8
	HucenOyYaiq82UAOUBtc+NGHIaQH+xaxxQ5Ib8t9i0Wd4hTiiiVGOX7PbPeyKZYVsxvgIl3TRz2Xa
	nm8STPHJHmoeC1UMzYWKK4lCGMGtn4DYECKjzoJG6TxjxgHMgbXP/unC72sveqsak4avTM83Q00pA
	CAbl2nunBiTRfCm/r3+m/QlL1Zlk7vjqDRFu293MRFON0vQDEHc1f/5ms3UOQhOpyxZkV4QVSKI3U
	d8+vOyIn9XJf3gPCP33VlI+oTVwQ4hbXpXkMdDiPvR+NLr7YnYkWNn/Q2zrahsvcQr+b3lm4aCtP7
	GiXFuR/g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w28Se-000Ll9-0I;
	Mon, 16 Mar 2026 14:58:24 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w28Se-000LMt-0R;
	Mon, 16 Mar 2026 14:58:23 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 1/2] arm64: dts: mba8mx: Add DSI->LVDS bridge IRQ
Date: Mon, 16 Mar 2026 14:58:18 +0100
Message-ID: <20260316135820.760073-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27942/Mon Mar 16 07:24:14 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_135831_348614_5823BC16 
X-CRM114-Status: GOOD (  10.00  )
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

Now that the bindings supports IRQ, add the IRQ line. Add a GPIO label
as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 10d5c211b1c9b..c24ae953cbc25 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -209,7 +209,7 @@ expander0: gpio@23 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		gpio-line-names = "", "", "", "",
-				  "", "", "LVDS_BRIDGE_EN", "",
+				  "", "", "LVDS_BRIDGE_EN", "LVDS_BRIDGE_IRQ",
 				  "", "", "", "",
 				  "", "", "", "";
 
@@ -298,6 +298,8 @@ dsi_lvds_bridge: bridge@2d {
 		reg = <0x2d>;
 		enable-gpios = <&gpio_delays 0 130000 0>;
 		vcc-supply = <&reg_sn65dsi83_1v8>;
+		interrupt-parent = <&expander0>;
+		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
 		status = "disabled";
 
 		ports {
-- 
2.43.0


