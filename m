Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E59C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJhL3RsYBYDwWZhud+U9+49c/408+YK8Ri5w8J9rOB0=; b=tCQNw9UxZW5eq77r6/2WOlCDoI
	ETS6+GEGZCl2/e9dJ90ooiGQ2e54qzWJQi2ReUHPl7kTOu79s55F738hJ6yypHgHPbA5GCHgejIFU
	HtMrJMK6r4ACKRfPL6jMaDRWyisLCavY8ulNDiI+aweYSXTmD/LGS+/q8uTVEU8VSdOIrdDuE1Xt5
	b7vKGHgsJvZ/5FzJR3HfJ8zKdGASGLpgosNReQswTX6hpxtS/gAQwrP1IOmJY8sww6m0baIHQlMAs
	xUK1IeT+Yt5xTlPKRKwHjRNPsSyaA/tnp/IhquRMf7StHb0OdVj1znyPjHNvpamwie6sGQj19A8mv
	OYKmPPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjQ-0000000B0e6-1avR;
	Thu, 30 Jul 2026 16:35:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjH-0000000B0an-2wie
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:35:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954afac04bso26369195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429330; x=1786034130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJhL3RsYBYDwWZhud+U9+49c/408+YK8Ri5w8J9rOB0=;
        b=CIoZkiD/l+9JvHYZq64nEIG+ru/PdOtypWSZ+3C/+0UgUoc7sL2xLz0As0yrr4F3nq
         8C+QOCQ5DmQYUMZJm9Kg3yrMMc/AYkJjufuHWXVYVqCw9p/4Tg+F464jqSR3yrIRtOvQ
         p470Q209XDGYUxQtixAIDEJASY9BI4SNU0lpNfJ35fswdA0IEZ6Pag1CuGXQvh7lq6VR
         oMq+jgSTj06fSFjbsY36fzdH4wwgxoRYKxN92vOzlSKCqS4wtl3ZvOioeoCUyIdjcp65
         UVZ0o72FRar58S59O6RXvU/eSItwicD3Ixpdsm1YbdxH4AnTfb5r5Auqo4dSIdMNabRQ
         lBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429330; x=1786034130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJhL3RsYBYDwWZhud+U9+49c/408+YK8Ri5w8J9rOB0=;
        b=r0ohrlPe6bq3If96eEh56JYtP24Qo0Mc0gx2/wqU13lHnj/ezDBsqtpZX79n3TubqV
         D3L2SC2cyGlTR7+ZrQRb+KOsu5/Wqq55wTdGV+LHt7I119ZXP19g4sqcOzmq/JzSdMrK
         5W4JxipLbW2lXe8XGG7lwAvD60C8B+Eom2h5RCFYvpHZ8fYYu5klBqPy9t0WhfG7fEZo
         9oWiud9SN+x9TOiANgJL3L3NguhdMnU/xDC6GyxCUNpSP3IJMUl4DVpQC2QBf1A9pOwf
         48rHH6Yg0zrE47CB426e1Dvk5O5eQ74ITG0I/d/KYs01GlL3zG5ErHOy5fP0Chi8FQT+
         21VA==
X-Forwarded-Encrypted: i=1; AHgh+RoijSzwypBMZ1HztAcDx7MeI8lFFvBOTTgm5WTGKIbN1LflbMIlJ+2NS/T3m4Nw7nYpVUeW0F8+7kvqLLnwXnGd@lists.infradead.org
X-Gm-Message-State: AOJu0YzkW70CVTsjW7m9e/33YBcafgiLWNKfPaMxhOWUUtHKQ0/gYaop
	J0uXlKwBs4sYOzCwarCXuCm9qmJVeuDTWLn/XdsHQJRbnR9qY0aEHGnd
X-Gm-Gg: AR+sD11AqMj2+Nwu4uB99Jx6Nmev9tpn3MR8LePxvK9kbbRRrM73rEaGFoMp3ulophX
	d888SUTSgansPQR/M+iFtoC+Wpa3xg+1figjrLFXscmyaBw3nNW8z92bkbsWRiF2m4obO0qTx1E
	MBEQ2tHt9cpOMl6sE+XurCcFmkvWQlMA/LhtBYyDUFzpi8S0Cm8kOBWrxC3K7iRu1DAqw0EQ1CX
	fDf9MeLSZ5TKP5HOjWZjlf+uTu1Fdj6vmJYa3kMpm1bXy4e44WkN7C4zQLZLmdMughkVAqlFEje
	yHxiEnVZJryyZ6YZL9itaEZWqBjWW/aM2GH8mNE1gnpRiepwFPMlcWKFszqQHowL1AFl+OefvRT
	XIHiHmvbh49EAQpHhatn5ot+kjWEJeg+7XMRe4mB0lBI1BHkMgsDR7GFOhcqq8ccbovLTFrN4k+
	IYKs8H+lvZLjMo6BtBSbqMMHpcmeFpFiJVkCIqltXKURcY/vVIpRDwz1G2MGDK8aJBD+nujMCyq
	qtf23+qprH52g==
X-Received: by 2002:a05:600c:1987:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-49800ea99b0mr45414735e9.18.1785429329577;
        Thu, 30 Jul 2026 09:35:29 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:29 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Thu, 30 Jul 2026 09:34:12 -0700
Message-ID: <20260730163412.1145-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093531_783624_4E992C16 
X-CRM114-Status: GOOD (  16.34  )
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
index 95ae85ab4adf..3f98132f5a32 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,6 +707,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -729,6 +730,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
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
2.53.0


