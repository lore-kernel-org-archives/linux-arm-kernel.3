Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEC6C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1S8+pFXHpW5Qtqd4mAyz5rzvawWhk+cuQoWwBBkzHY=; b=THFkkriBRLXnGuZBXPl8/10kQy
	Smph6908NVBxaqFfc9EciXGTYSlu/X5nB5SuZpruH+hnI1R0AIu1eQnnpjWYSwKQrLeJBcUDhuBDW
	tz4Ivy2l/K/YwAamiC03aixwokCrnxb0Lpxy5x4idZKSJOEqgYzdDMKNSkwgQsswF7AtM5YvbEFP0
	Jepatu9hy3W1+0TpE479zM3Q1ecuwUGZPIgxCYdgaHlgoGchwnDQMwFA/NzZcMpPpr5jnRym6sHFH
	f6UHP9l3x5F5LotJ0cEx5UmXi0A6hHMJPWl3TD/6BcCclbkRMuYVTCoFy3BzG0cjjD12hUqedizMs
	Ax44Ws1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJwU-00000008rPT-2T9a;
	Fri, 07 Feb 2025 08:42:30 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJrG-00000008qHX-1p4r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917427; x=1770453427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a1S8+pFXHpW5Qtqd4mAyz5rzvawWhk+cuQoWwBBkzHY=;
  b=D2dHOq+UsQLOkt6Bn1gSOx5k30YoZP4tbp5Lvf73N0iQbnNwfsgdTer5
   e26AxNIlW3qJeVPEImL7jnS7bAiMRrM9OeW0GpynDWxqCPovwXxkfZN5i
   uQpwA10PJ3FbmrCSJ8Hkvsk7GZxeLFVBtUuY+Om299VWMkpjNjAR3BRJA
   h4KefHSK9PRbXl3mDPA2tDkZfArqj7l9GhcgRCMKeoNexyQpw+vKRmWKU
   w4auWdah4qWcVauYJg6rqDxMHyQj0zG9UoTZHVTie3pkJG38HZalZX5oH
   7iDwP83SS69FB8tsdrKuG0z6oOO37YHDrwUi4l30K6RnQHXwFp/cyztZW
   w==;
X-CSE-ConnectionGUID: SibWdkl1S+y9b3n+e7uqig==
X-CSE-MsgGUID: xw/SnEJbQr6N2mBpPHPcvg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636079"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:44 +0100
X-CheckPoint: {67A5C61B-4-727D2C21-EE1B71AA}
X-MAIL-CPID: 64714A091E530C861FD836DF9D93E3AB_5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 197BC1682BC;
	Fri,  7 Feb 2025 09:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1S8+pFXHpW5Qtqd4mAyz5rzvawWhk+cuQoWwBBkzHY=;
	b=FyU2EShcawV//6bBdOofeoPWKSDffyu5W3+hU5JwaAHWw/uVv28o1Nlm0iGpgTXakqrovn
	vipTkGsTcnk5JJGDsFs/IjU+5DdxP2lZ0oSX2PG4t0yHGwxHdfOD+5dgSYjImUdXQGzq6r
	ZZ6cnhi0JVL6gX9X26nIbuv3uzllelSkptCHFeakScmTLCj2OdaEc4IxeALupNpV5H7uLI
	C28M9xw94fQeqTl6sHWlxoiHvTMsbiqAfifDpkvJD3mK+3Md7/PeYcj2tlwUtpBAcj8kro
	tjyeTpKhrPc0pyf9dVWFiVl5/eLDuf6KfxmN4SC0gOeR9nJVf9YXqfn3cDAOsw==
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
Subject: [PATCH v2 03/10] arm64: dts: imx8mn: Add i.MX8M Nano OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:08 +0100
Message-Id: <20250207083616.1442887-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003706_767404_1B030310 
X-CRM114-Status: GOOD (  11.91  )
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
 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h
new file mode 100644
index 0000000000000..43583c4a70156
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MN_OCOTP_H
+#define __DTS_IMX8MN_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MN_OCOTP_M7_DISABLE		20 8
+#define IMX8MN_OCOTP_M7_MPU_DISABLE	20 9
+#define IMX8MN_OCOTP_M7_FPU_DISABLE	20 10
+#define IMX8MN_OCOTP_USB_OTG1_DISABLE	20 11
+#define IMX8MN_OCOTP_GPU3D_DISABLE	20 24
+#define IMX8MN_OCOTP_MIPI_DSI_DISABLE	20 28
+#define IMX8MN_OCOTP_ENET_DISABLE	20 29
+#define IMX8MN_OCOTP_MIPI_CSI_DISABLE	20 30
+#define IMX8MN_OCOTP_ASRC_DISABLE	20 31
+
+#endif /* __DTS_IMX8MN_OCOTP_H */
-- 
2.34.1


