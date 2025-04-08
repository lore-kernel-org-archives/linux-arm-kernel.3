Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17313C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVNXOS2LxVQSHIpbDIVfnXE7eeQe+su9AU3LUdFEW9U=; b=SgwlYAi8u4yekvQnYNaW2+qME9
	tAp0hK3LVU643AD3OWo5xBQMw8Z1Gci85QzqT4Q99vkeNM3A/KHJIVXEHBlo4zpjTQP2bfh4wDUGN
	5dNgefT7vwS8GGdLM1U2K+p6vwTjVId7KFxGSqle2FnZs3NRP+RlzcfdyzV2tVt2XVKF7RKQSJxBA
	Yiedo3fvDf3c1GqkywqWLJgN/xhCCUU7WhJ0eah2ZwLWLha/5WqB9uUDiVSqRCq2aNorifQC96v0w
	9O24lO/p3Ufj1yHabyPj2+BSwy0lJQpFdYGzihNQryfs4oysBc90x6HeImFh2SmgIWpOG3ZlHgZos
	IBFQYbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25UW-00000003UVZ-0G18;
	Tue, 08 Apr 2025 09:43:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Iw-00000003SBw-2sBW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104698; x=1775640698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QVNXOS2LxVQSHIpbDIVfnXE7eeQe+su9AU3LUdFEW9U=;
  b=HVKMXhlF3gEYyNY40kQwb6P9Z8/fl90EqFMCbIgkDGk1yqd5sWt6kDmK
   mRdKWCZj/L60SKSGfhT28rL154yyqvOBmZJtIv1G9DTS4AkMPZr5pi3Sk
   guBJQ4rFnWtDBI/XzFD7F4UBoN/0Bae2NYrCY9y0fAzEMEM99Yvb/Fyee
   2630dWR2S4g7X3VzczuVIgChL9Avi0ZzRnaWgSVTyc+5dGqkbUjvD4iQE
   IytMz0fdT7okVbcQCW6OMzUYRlZmayZ02SkuxidBBmSBmo3Au46yGSb3H
   8vKhy3KsWHN/i88wcxUVhWJWjtWQnRW3An5fzkZrJEYLgNZFqBNjT9Dk/
   Q==;
X-CSE-ConnectionGUID: Fer817JuQEqiAbn7FiTHKg==
X-CSE-MsgGUID: 5cq2tzgmRViDP83LL+9mVg==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397375"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:37 +0200
X-CheckPoint: {67F4ECF9-2A-2417938-F0170C2B}
X-MAIL-CPID: 0D72C79C590BE6ED7C163F3117526E61_2
X-Control-Analysis: str=0001.0A006371.67F4ECF6.006A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25A2A169635;
	Tue,  8 Apr 2025 11:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVNXOS2LxVQSHIpbDIVfnXE7eeQe+su9AU3LUdFEW9U=;
	b=t68yO3LK17uQFVgtIS6VKO+YAtnSNsSsuwGom0tnJE3ho3m45+YjapyHaJqXUImaNGemvS
	hj8nLsDu65/AS9d8QwgVRxRGPCQLwf/p1HSR03klka4Z3wsFioTnFeCHu7IGrVCk/E43LY
	SX+NCJwnxS/Bw+ZL65WWCMHYuKJfAwVm8PEO+JtL3grLQ2Hj6N5WwAryzI9lLJMn53BwhX
	3lM70Gxs494XoUzZyW2G3ZP4K/V91VhlB1pZBiQdx1nZweJu1hh2tt8DmHPZ2HQef7BA3P
	w23Z3/Rdn+LAkaabzOsbAqXpP233aDsQIs3bQnqOBNrX4Xgsoc+2MGOXOKpoyQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
Date: Tue,  8 Apr 2025 11:30:51 +0200
Message-ID: <20250408093059.551700-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_023139_031135_BD1E7B01 
X-CRM114-Status: GOOD (  13.85  )
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

This adds an overlay for the supported LVDS display tianma tm070jvhg33.
The on-board RGB-to-LVDS encoder and DCU graphics chain are configured
accordingly. Add power supply as well, which had been missing all the time.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 +++++++++++++++++++
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  1 +
 3 files changed, 50 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 225a7665b8ad1..7f96de6f80224 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -8,4 +8,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-twr.dtb
 
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
+ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..e9708f3c67403
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&lvds_encoder_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
+
+&lvds_encoder {
+	status = "okay";
+};
+
+&lvds_encoder_in {
+	remote-endpoint = <&dcu_out>;
+};
+
+&lvds_encoder_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&panel_in {
+	remote-endpoint = <&lvds_encoder_out>;
+};
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 27a55fa638128..80dae0c09542d 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -147,6 +147,7 @@ hdmi_in: endpoint {
 	display: panel {
 		backlight = <&backlight_dcu>;
 		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
 		status = "disabled";
 
 		port {
-- 
2.43.0


