Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E10DCD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZaK2VHMmtg9p9ZKczMZbO5H9m/De8saV7x8KOEKEY4=; b=CUO2bdWcGock7E4CD5qd8UPen+
	hhNQGM/RMYM1Asuie1ybvLPznq9eu4tWS6kzP202v6fbpOV6HvQPsbesqSyZFSzOadg4N3Wdw2Q8U
	vqLQJzajaaVJzvmy1/JQQqC6Mn/MJrpRiKdx+hBaYH8ssb0sLzuDUj10z8e2lqdtjz/YZtJ8H14Zk
	mzn1rbXUpRba2SVDg+f1ux3wpMMhsi7j51/Vbg6DVqXg0UvlvQfTiQRYOQHm/2G6clcWm5ZP/xIKj
	27W9jCJQDzjgxmDyHczhO+ml6Gu4RWq+JsJc12C53PqU+Ft3qHsIN/641aPuPDoVqAPYzjGgqT/pB
	OrAId5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUi1b-0000000Eig6-0i3z;
	Wed, 03 Jun 2026 09:36:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUi1Z-0000000EifY-1fhs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 09:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BZaK2VHMmtg9p9ZKczMZbO5H9m/De8saV7x8KOEKEY4=; b=KJ6gUp/WoHPKJh+2f2AnVyrgL9
	t8TD3OqayRUpAQSKIJnQjIH4hIrr2/RCDESzKYTR19A8ZVwDzsmlrDT3IrovYL4xD0FfvuDu3ZErS
	IVUwKuupnnkjADiUAFbS3ha3vxXVlMJxpDlTPTsjX952pDPFmnJp/ReAnXlBwR4qUoe6f06VbSUe5
	SWpbE3HGhkQvYCTRp/giMFANzGZ2xL1LzSGvab/WpbPsOO/cSczEgjmtE5dYC8z4oS7UUmj83IJTo
	CBHKga4upFzDwyZvlDdkif1UfpKA8+71VOixcqQvQR7Jc+X6azeJzSjpOeVVIDxU/F4dNlI0ar5lI
	/k26zFmg==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUi1U-0000000BjS2-3ztF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=BZaK2VHMmtg9p9ZKczMZbO5H9m/De8saV7x8KOEKEY4=; b=T4QnKWfWMsdjwLf8PIw0nccGrG
	BULX9cqKezLixwOGCTXPG0WkmduC/w4uBUaTy4+0NoMrwQTQljo71F+HiFg90EN2Y0QMD7gOivVaX
	UNf23mtGe0IA0nkxAjsJxvGh1IcI6j6PZMiVDyA7pMNYqVMgLIGsEhS+02lZ27j6rPlZcUwhgSPQo
	yF0W0TILrbUPPkuif5e8uAN4Yi/2ddHp9wUVddAwENZ+Fv8CHp6EzgJoXbV2hB4TBU46zI0y65oce
	/EJkGZLu3X+D3BNttb08TgQ85r3hu+qfd+uivL908bW+fnnjKsgtGbiZET9oD+2xjlmX5aEnrwf0P
	YtNUblHA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUi1T-00030V-2A;
	Wed, 03 Jun 2026 11:36:27 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUi1S-000Hpl-1A;
	Wed, 03 Jun 2026 11:36:27 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8MPxS
Date: Wed,  3 Jun 2026 11:36:09 +0200
Message-ID: <20260603093621.2504490-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28019/Tue Jun  2 08:33:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_103629_243286_D9416806 
X-CRM114-Status: GOOD (  12.77  )
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

This adds an overlay for the supported LVDS display AUO G133HAN01.
Configure the video PLL frequency to exactly match typical pixel clock of
141.200 MHz.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* New to series v4

 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 ...p-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso | 74 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index dee2bea156740..3f466f102dc1d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -385,8 +385,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
 
+imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtbo
 imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtbo
 imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
new file mode 100644
index 0000000000000..9595cf4d43cd0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Martin Schmiedel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds0 {
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "auo,g133han01";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_in_lvds1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_in_lvds0>;
+			};
+		};
+
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&panel_in_lvds1>;
+			};
+		};
+	};
+};
+
+// Update VIDEO_PLL1 frequency
+&media_blk_ctrl {
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>,
+			       <988400000>;
+};
+
+&pwm3 {
+	status = "okay";
+};
-- 
2.54.0


