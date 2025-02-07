Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E6FC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UL37XeC1hd/H2U+yhmEQrAT3CUEu9El1GzT1Hy7j0Po=; b=eETc+o1jsEZO5DFQW0ZT7eT6WF
	1ouzt0863UBNfMFYqRzxyq48LOfj+kiYTT9CCTUDuCOZ3Sz7NLQAuTfgEW7ZzEdSZnt2GxRT4fU9Q
	xBCvmQapcNG3jBN/BRXeOzYvygyFBO5Im2kDXoeMSi3fEm/ESoURHv+1oLJ4T/k57NuwM7Yvhp8uh
	ltqz9W0KLsYBmSgD4OuWl9pm/BuZUkF6E+yJ1XBThgqNzM6WZ0KXxYMftGX3CFjHB1NQyMlla71Yf
	26Lv5Me4AzRrpgZqOMwYbr+vT1JG3tap2PcZduPqWNpB+AjbqUGMB3RM1QlRoCV5pwdgoNWyn9JS+
	O16J0jRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJzB-00000008rux-2a7T;
	Fri, 07 Feb 2025 08:45:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJrR-00000008qHX-1gq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917438; x=1770453438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UL37XeC1hd/H2U+yhmEQrAT3CUEu9El1GzT1Hy7j0Po=;
  b=TwWCE1b1RAOLkqHvX5D5KZ7b9/fc/MbU3BxP+zdt43raSY4hRIxOMDn+
   sDsElYm89LOS+3ICk0ATfTH+9iLwmeX0fFgL/B+VTCnXknp8aDDZBYr8N
   ldWIS9rZj0+QrBo6BeEt+cib4HYUTDag7JZWUv+ZS/TN4oNs7L+KZP8T9
   BeO9DR7297BsyVar5m2TJGbM7JMUv/LIyRFc2zWw+c58aA7UaDy368vgl
   KZQpvmjBNZYoxwF4IAJsVcvyaYfkZYqDC5A4GwfVk9SjZq+P/Wxr9wOO5
   c8X3lUm+WxK6fGKZDYuk9F5tmUD2/G+4G1zDHgYcQcIZTVTMAsyGYA9lx
   g==;
X-CSE-ConnectionGUID: /rZ0D+G4QKOih0Hmp6hmAg==
X-CSE-MsgGUID: yPL0BN5HThW+2EuS65l4mg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636091"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:55 +0100
X-CheckPoint: {67A5C626-14-2D67083E-CAF60585}
X-MAIL-CPID: 500D698AFA798B87F8070EACC0FC3FD5_0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B070216833B;
	Fri,  7 Feb 2025 09:36:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UL37XeC1hd/H2U+yhmEQrAT3CUEu9El1GzT1Hy7j0Po=;
	b=r71H/U5Rh0uC28453S3IACjCz0EQvKknjoIN7MqaBMAmjjxQ28RjRa+zaZ0mjOhqUrQaVQ
	ZDmMpaUtpKASTsWnq8HOFVTax1NLZVj+KLZRZeeS76Q8X7Xh1a14AUYprb4MswHVD5rZ7/
	/3raXxXPd68e1ft3V1ZnC/Drv+qoZZOHF+6MR2+q4pa2G5loF68im+b1T3Y5Gc8Gdhzwmp
	UGH+5bNFGqaOEbHCWLvhBjoQ/isoWRqIfr44UxSHe3nPFwxiHpKyrohCnspXm2epOgjnJ5
	xJMO/4bWxtSwByGut6XNfdyrw5W5wabxSFNPLVvOr83xZifoAGBvFzudDnJi8g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] arm64: dts: imx8mp: Add i.MX8M Plus OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:10 +0100
Message-Id: <20250207083616.1442887-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003717_734613_1D7AE88D 
X-CRM114-Status: GOOD (  11.17  )
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

These definitions define the location of corresponding disable bits
in OCOTP peripheral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h | 42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
new file mode 100644
index 0000000000000..c9f49c61f3656
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MP_OCOTP_H
+#define __DTS_IMX8MP_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MP_OCOTP_M7_DISABLE			16 21
+#define IMX8MP_OCOTP_VPU_G1_DISABLE		16 24
+#define IMX8MP_OCOTP_VPU_G2_DISABLE		16 25
+#define IMX8MP_OCOTP_CAN_DISABLE		16 28
+#define IMX8MP_OCOTP_CAN_FD_DISABLE		16 29
+#define IMX8MP_OCOTP_VPU_VC8000E_DISABLE	16 30
+#define IMX8MP_OCOTP_IMG_ISP1_DISABLE		20 0
+#define IMX8MP_OCOTP_IMG_ISP2_DISABLE		20 1
+#define IMX8MP_OCOTP_IMG_DEWARP_DISABLE		20 2
+#define IMX8MP_OCOTP_NPU_DISABLE		20 3
+#define IMX8MP_OCOTP_AUDIO_PROCESSOR_DISABLE	20 4
+#define IMX8MP_OCOTP_ASRC_DISABLE		20 5
+#define IMX8MP_OCOTP_GPU2_DISABLE		20 6
+#define IMX8MP_OCOTP_GPU3_DISABLE		20 7
+#define IMX8MP_OCOTP_USB1_DISABLE		20 8
+#define IMX8MP_OCOTP_USB2_DISABLE		20 9
+#define IMX8MP_OCOTP_PCIE1_DISABLE		20 11
+#define IMX8MP_OCOTP_ENET1_DISABLE		20 13
+#define IMX8MP_OCOTP_ENET2_DISABLE		20 14
+#define IMX8MP_OCOTP_MIPI_CSI1_DISABLE		20 15
+#define IMX8MP_OCOTP_MIPI_CSI2_DISABLE		20 16
+#define IMX8MP_OCOTP_MIPI_DSI1_DISABLE		20 17
+#define IMX8MP_OCOTP_LVDS1_DISABLE		20 19
+#define IMX8MP_OCOTP_LVDS2_DISABLE		20 20
+#define IMX8MP_OCOTP_EARC_RX_DISABLE		20 30
+
+#endif /* __DTS_IMX8MP_OCOTP_H */
-- 
2.34.1


