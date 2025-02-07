Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEE5C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFW0TtEuC1R227YTpxajrq5OhUhBVT+uUuYSWlEy4yY=; b=EFSqcZDuHnzPSsr/P7R6C1hFxP
	MoFGjsVBoiO42pThmh3BRgGFSofLneGN9ZZahOAvGIHcVYx9ZTfpbyZTWjOE+PlddpSuEuN/Um22W
	4/WTGRhbiOT8f55/NQ6S4quDgNPZoHpIKreoielHmCdEyd4AN15I/kYpx89D09uoJQfGDEaHopyc1
	DlJINNM1sWRlOqNV0PvZl7zFELEClgiiitSzJgCMBKd41Cd/+4szkp6H46ztn4d7nL0GpBq12pqyJ
	+7HW/rfsdzIqF8LzB6N4r2DcLLDjCvqzfnUMpqOKZlcMYAcH7MShmpxkwY4/Do8LTcpfO4ARBFcBu
	nJGIlp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK4a-00000008snu-23RI;
	Fri, 07 Feb 2025 08:50:52 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJro-00000008qHX-1nak
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917461; x=1770453461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AFW0TtEuC1R227YTpxajrq5OhUhBVT+uUuYSWlEy4yY=;
  b=c/7HcUIgWMK5Wneci/9EZurSJe4m/bUaC+bb/jd4IgGV9g7gC1ChTndg
   YSdQ2qFVml4KctG0hyQVzWU25sJadcSj1f8b0FQcrFN5hS6vtQ7IGF+Ks
   GU9G7A0rJl9NdEPI6FU3wtUtSS+p38eRhGzHrb7HCcZt1DHRSEntEGJIh
   8Lhc9+4K3OF+VvapwXNCqsDpAm6XzoN2sR5geORm/x29GOoNE9lOc0vsu
   +0lcdcZ8jXhz7u0KjqbjRhBz8IVFG9acGpCS4orqMUIo2vlLiuFZ3CLPQ
   oso+T2I5J0xrJnMDuS0tNN1zbrs9sbv/A9F4ip3ELycGE2W5HKCfE+Y6L
   Q==;
X-CSE-ConnectionGUID: n0BqvstSTrWJTquL+npnKw==
X-CSE-MsgGUID: gNk8fwG5SPW35iu3hrjoyg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636120"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:37:18 +0100
X-CheckPoint: {67A5C626-14-2D67083E-CAF60585}
X-MAIL-CPID: 936AED959B21081A840AE6DDA0361249_0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3599168346;
	Fri,  7 Feb 2025 09:37:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFW0TtEuC1R227YTpxajrq5OhUhBVT+uUuYSWlEy4yY=;
	b=rpZ5t3j6zGVXzHvc5pVK36cwbQdd67GRr60fiDBrJBSz2RbVwYta741gGtgSDmcoe3tT0k
	qzI6wFbBqsn/Za+gwNiEPplEWOyrna3QS+zUnlrj+NCmO7PA3usGHROX8d+3XigvoHWwUT
	DxsIaYkCjDz2dEy2Bl93uEH0d00GNCzpsQCGA8Z7pv9uKdNsn5bxfHY14r61SB8wzR2usP
	zx0v7A9eed19LtAf6P3/WjHypnqQ9tV2tQzTMbv6w92MCnHgAoMWJbHTQ68FgYq+AiUqRx
	AZMm5cS1PzOP3Jp4px6a/e95aOZQJlKDCe7MnASkbSHG9KYqExF6Q7R2MDPNdA==
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
Subject: [PATCH v2 09/10] arm64: dts: imx8mq: Add i.MX8M OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:14 +0100
Message-Id: <20250207083616.1442887-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003740_761883_B8C0DE04 
X-CRM114-Status: GOOD (  11.62  )
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
 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h | 37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
new file mode 100644
index 0000000000000..d991d57816264
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MQ_OCOTP_H
+#define __DTS_IMX8MQ_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MQ_OCOTP_M4_DISABLE		20 8
+#define IMX8MQ_OCOTP_M4_MPU_DISABLE	20 9
+#define IMX8MQ_OCOTP_M4_FPU_DISABLE	20 10
+#define IMX8MQ_OCOTP_USB_OTG1_DISABLE	20 11
+#define IMX8MQ_OCOTP_USB_OTG2_DISABLE	20 12
+#define IMX8MQ_OCOTP_DOLBY_DISABLE	20 13
+#define IMX8MQ_OCOTP_VP9_DISABLE	20 18
+#define IMX8MQ_OCOTP_HEVC_DISABLE	20 19
+#define IMX8MQ_OCOTP_AVC_DISABLE	20 20
+#define IMX8MQ_OCOTP_VPU_DISABLE	20 21
+#define IMX8MQ_OCOTP_PCIE1_DISABLE	20 22
+#define IMX8MQ_OCOTP_PCIE2_DISABLE	20 23
+#define IMX8MQ_OCOTP_GPU_DISABLE	20 24
+#define IMX8MQ_OCOTP_HDMI_DISABLE	20 25
+#define IMX8MQ_OCOTP_DC_DISABLE		20 26
+#define IMX8MQ_OCOTP_HDCP_DISABLE	20 27
+#define IMX8MQ_OCOTP_MIPI_DSI_DISABLE	20 28
+#define IMX8MQ_OCOTP_ENET_DISABLE	20 29
+#define IMX8MQ_OCOTP_MIPI_CSI1_DISABLE	20 30
+#define IMX8MQ_OCOTP_MIPI_CSI2_DISABLE	20 31
+
+#endif /* __DTS_IMX8MQ_OCOTP_H */
-- 
2.34.1


