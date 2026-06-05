Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62319CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/bPH9nJO/zmP9XNA7k/eJKg93awmo1tL5WymrDFCak=; b=0yHNFgPCFKlTOX1LQCwJAlsxh/
	1Yrpe6C4ZSJkWgU1ECOIvAolnIH+/77P23FE3bpuqq21FUtR8wnqNDlYUmv0Xo9rIwwXAhpC2UYJN
	Imjui6D5GLFZy0diIPL5+YF9xZON6P+QQA9zroG9VvTJMJmKzfqdWnWwmVgkRkTIvibNwMFrrgf/i
	xdUglRkdvO1s4V31NZXtiPMCmtse5lv7lGVP5nA7UYKODKJcnY3+5OOobhRd2RQXqYktDoJ410Ecq
	H+1XW6u4x2gJVIkveE7YJRYmbyAQGUn9AGX2Lz0dQ/q+/ayWaZZBe3I6eDIK88AKRi9Po45qUlUM3
	kFzkQb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsP-00000000Yfv-1Zci;
	Fri, 05 Jun 2026 11:38:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsK-00000000YcJ-1nw3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:38:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-46013161068so902603f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659487; x=1781264287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/bPH9nJO/zmP9XNA7k/eJKg93awmo1tL5WymrDFCak=;
        b=Sn7WydmUxlHv2dsOu29SbGqQMKOoNGVFTcJjz+S8pZLeECIZ7AtsL7CVhhupqFLsQF
         v8YEyXKTWIMokyT30Jnx2joaWisLZ/aPIef3Pv7PYgkmMexZPUVI5mhbfrIpDCEd5NGb
         y98Y8ZPZrTcsra5MeBrz6BBky66zjikWy3kHN1ngBKvD+SyeSjqO8D0OrZVmAE0kpWhy
         q8SZzAJ6tfnThcAHtfSEDWB5/UM8qnMHAYalZez31Up5IDdhaohQpa4zU6742tKhb7VN
         Rrz8y6c5XySr8RPHtXXCLYQX90PhG5vQSHxkaMhPTlhsRIpso6eacRLiW7k03F+fBV6I
         wvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659487; x=1781264287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/bPH9nJO/zmP9XNA7k/eJKg93awmo1tL5WymrDFCak=;
        b=sofyjmxhN//exw8XQcPA4oBZJOVanNfBSj//JJs4hcKqeJHlypJzxNT/zG1TavYjH9
         HjYZ3nps6aatemYCoWicXscCfce8aor1Y1j/0m44dNihaFr4XU+Pv692yX8+Nu+XcGyX
         g4eqdfDm3fx1NBegKPMiUPa4h3cyD1TYWC1pUU8n/cwjDe1YOOVHjR1CLj2rckqrCWAJ
         WpNyHVA6234u59Z1ts5DImkugKV2lAQ++tN34w0eThyQwu/oWqO0a9zfhwHQ1Gjv717s
         J9QYTLaCTe0kwHf7nWm8anxB4cDmLMnWY79YXlyAH2RXgcocEReLgEzEm6xXkWXUAep9
         oiXQ==
X-Forwarded-Encrypted: i=1; AFNElJ89r3+88WQSqFDSjGhZzc2ZTsBVC8DARI41mwJzi4MfuZe97I8GlvJY0prCE1hXP0VN9PaDDXKmQJAJJuUjGGgR@lists.infradead.org
X-Gm-Message-State: AOJu0YxPJ0PNiEfZbH5otP+44dtBVQUy2piosM5M+Go3R4Ly9DjyZdxD
	U46EbznJLQi6Zu9nujeJz4fA8c5q8eDAIva/MPjDPvli/5Rm/hZcb2jb
X-Gm-Gg: Acq92OHVch9SMVNW+xFeGV4AON1IvHCh0zd/HMlTiChatWhITAUlCZgduga3Igqhtfo
	1WZOnZcHRku6FQKRoozraI783ym1/WlEUYf6WdL7UG1k2ve3A886g624xqMAsi5v5q84JsZn6WV
	PZ4bXa9+lia+/I3pwZzgMe2SuJa/isZ9s7nvZ3dpn5JGp3wF2ve2ergRDrcHMoncO57sXJdIYJ0
	wpRAMhTjxRmwkK10xiyl0G7p/qToy3qmwWoRQZDlFvl3/eVnrm/9pvJj9Rec5La/xbDy+V/075r
	V4X+HR9KQnKs2Ys4iH0F/s1YleTC3fqARHQe0/tciHXg4lxZY5oBAqlqPRnvkq9EOFA1MqFcuGF
	sUe2sMcTkcO0409a7S+jPsBqPUsOrR5mqicbD0RMd4hGHQZwj5Rja5FWbnyX/+hMNeHVrSyUDM8
	kIdk+ulykvFcCfEae8FzhFgyJZfM2aX8kKL8Js0Y4jlhRVfDIpxjc2OpfZ7Hbj
X-Received: by 2002:a05:6000:2081:b0:455:fbb:28bb with SMTP id ffacd0b85a97d-4603075f442mr5402974f8f.35.1780659486770;
        Fri, 05 Jun 2026 04:38:06 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Fri,  5 Jun 2026 04:36:21 -0700
Message-ID: <20260605113621.1479-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043808_503550_DEBF28C7 
X-CRM114-Status: GOOD (  16.21  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 03988f0eae30..dba191a2f790 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -637,6 +637,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -658,6 +659,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 000000000000..bc02864c6f88
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ *
+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
+ * configuration for remoteproc and audio over rpmsg.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdev0buffer>, <&vdev0vring0>,
+				<&vdev0vring1>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0",
+				      "vdev0vring1", "rsc-table";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&edma1 {
+	/* reserved for M7 */
+	dma-channel-mask = <0x40>;
+};
+
+&edma2 {
+	/* reserved for M7 and V2X */
+	dma-channel-mask = <0xf>;
+};
+
+&micfil {
+	/* reserved for M7 */
+	status = "reserved";
+};
-- 
2.43.0


