Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12034CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgvDf4RLDng0uvipLWv31zDG7gco8OVe3xdb0OyCHis=; b=aDdDlrcjxnwK1s9xHdBw4tf5Vw
	Xl0x5sfvPEmfhOBBupFtxhTzPYUS9CNotJb4TflLMmq4KYZEVOvaTevPlImOlUlF+814pm+Ma+dpj
	RIu8SxXfTbnhDg1cF6tAEGBYDvnGq7oQwz8W3RNxXoP8QEATAqCBs0z6Pp6XJm+drU4GRg5lH01Kn
	JaI2i9tlRM0Tnyai97HpqfrCmNes43P+uDCyFH2T85ZFVVBkTf6B5E1xa95rDINuDhuv8ag8owBpo
	TDAYif6JY35l/IZ3OnNYjieAAByIsiJMuSPobqS4n2jydr69w3Z5yIlaztLTvcQaC+oN6n+jPCNZi
	xQP/GL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ77-00000009bJF-2e7W;
	Thu, 01 Oct 2026 15:54:29 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ75-00000009bFc-13nZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:28 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af4663da5so2466836f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870065; x=1791474865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgvDf4RLDng0uvipLWv31zDG7gco8OVe3xdb0OyCHis=;
        b=Ei6fYDME/YB/yX/dh3psiQHzOGzP06EskiXZ+MGRlIPHjxwTwhbr/uA+L8W7zyGgls
         DMkcCGcsklP26eCEGoGwQsPZ+md75uFK3PnZNU6GdrxQq9OzowQI25KkCrkwkcFA4Wnj
         lKqShl6PKjSvPQl+HBxfRZsynG4jyjhx1YHOTtI1MXvLcWFEk/ozxl/V0aDgE05lZifF
         Jy6uBZ51PhL+RhUNk7Gbdns9jwBhPXySA3n+F4ywd64VKuTqi9on5pGfMSoqC47Dsy6u
         5bn1Ymewy2kSjFr1A6mGKoDxQPJffv6eGRRWZEph34SwFLQgTecjDJdzF5MoNZdy+tbD
         jIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870065; x=1791474865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgvDf4RLDng0uvipLWv31zDG7gco8OVe3xdb0OyCHis=;
        b=0rXHmzsKWdeTVjc/+ClJObvol73e8SVaFhAWVWrUfGMxfdDOwbcirz0acbeNFcYHrh
         rwWSFqlJ7vpg8DH2VwdCuJvrSBAloOqeJzIOzDtRXQuX9Ufz5X+DqCNAhhO34U2jy1Bv
         lfidN8GbS1TEGW2pQMUCySWeEHU7Nvsj5Se61yK3c7UUOZz96fcia1E8WFvOd1GldEmL
         wH0cbCkoJw0tzpOONJaNO0kmKMN5nwgMz46SPQbFcRtbZgWs5siJJwVpmZsWHIKkgS13
         ZC1MqhRyIN3DqidAYe+7trKbOC7EF4v5MdpbaK8iDF/3uF6ozxkDwAvZwbZZM9LcJlGx
         AUgw==
X-Forwarded-Encrypted: i=1; AKwUvBzYLkkjNh93Jc8VEF6x9fosFb0c8xdy2cqnrXzE+RuUWLbMiP9jg30J0mymP9+JZPbAbJsTdgJI0n3MfdB0oDlT@lists.infradead.org
X-Gm-Message-State: AFq9FYKM80XgKLqYAu8sTPoNCY//+PSxoZAdS3Xn2VMuUWUqlGUJp9lB
	/G579AvEN+EvY6bC4fOHXHZgNPquA3PwMRmJZHJ1JCCOsXSF3fwFtqx5
X-Gm-Gg: AYBFou0innL9ridc6jzDP/fmZjMucTET8dlNl9IDdO6nKakyW6ZmGjMC9HkIP8fKbrI
	U4Z4Tqu0e63Br6BE1Bm9RsHNvBfQLKsmAlPWAo50p/zgL1sM3qc1KkdY1BbcoYkEc2fvNMyolUC
	qwnwwPtaTq4S5vKoAZFNFMn/2yHdVnwxIr7U/rgUlm8T8TEyIdI0Q0rYS+bp9IqB7VaTd/kf6yw
	i+5pqOU5Ywg/nznuBYCzllTu07K7pq8OgjEhr9vu/qHwxqjOVMn/7ajxhlwfNSEP3PRhWPWJt49
	bAXZzkuGU1KCF23lPgL9DYqrIuB/h5sGy3zaUEMHFpxbf/5qA9KgG/vnbH5uss5G0wuRtiXWQ4x
	eiTcks3cb1JDXGsF0ZSBapADBJZnS9HEq5WSBrYdTeYxbX8+T0sAydVZz7apnAlRiM0VYpFyu2c
	wWr9kcXIqdLcBbpXnKwISTo3y4s8QQNiOJ/YFVGvU5E37eCQ6EkYikEZs1lp34JvBzkwAVaqJX7
	6TxBhFES2Wr7VvhPZgZlgV3Dh6nR8NZUrLRcMm5xCLsCnBWfI2Mj1x+gd010kfBzNY7odmxsKJ8
X-Received: by 2002:a05:6000:469a:b0:48a:fd90:f254 with SMTP id ffacd0b85a97d-48b1272a07amr24159f8f.28.1790870065261;
        Thu, 01 Oct 2026 08:54:25 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:24 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ARM: dts: imx6q-apalis: Add HDMI Overlay
Date: Thu,  1 Oct 2026 12:52:51 -0300
Message-ID: <20261001155412.3177428-2-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085427_331651_FA297B4D 
X-CRM114-Status: GOOD (  15.37  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the HDMI output on the Apalis iMX6.

The overlay is also combined with the various versions of the Ixora and
Evaluation Board carrier board device trees to provide ready-to-use
DTBs.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 51 +++++++++++++++++++
 .../boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso   | 13 +++++
 2 files changed, 64 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10c..32d77a59c4358 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -59,6 +59,46 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6q-apalis-eval-hdmi-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-hdmi-dtbs := \
+	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -183,15 +223,26 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-phoenix.dtb \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-hdmi.dtbo \
 	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
new file mode 100644
index 0000000000000..592bd366d94e4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable the HDMI interface on the Apalis iMX6.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};

