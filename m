Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC86CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P33hVjpKh+xrbXa1Sk1QVICLUiF0MUyjx6lsJrB21Jg=; b=yaLZfOejidBeaYcsFEORQafTxH
	b0FOmeM5GTrFjByoBUQDxdbg539F+/gMmfEkb3gWIur4fygAFEwg6WHZC8qLuBph8D/m6RN7V0jK3
	++xB8t01wXjHbfA8fjRA3UTlIfIOgnpT3cSz3SSfB6QQAYIXfqpdytz6M70Oh2JpDbBkyRrFSp66P
	duD9JYOAmdWoEOShA9mzKSK658iHoBMEjRm81w/LuMmIxhhIvhBeQDqNA4VRBIOX1TMqjNJ04w+0z
	eN2kioK8fniUazG5O/SQuirVFfyZScc5XlgL0aVjJ+uOq5hLAzd7w+VTBtHFbeOjTTZmKYwM180DE
	5x2Vb8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOE-00000007H3a-2Yzn;
	Mon, 19 Oct 2026 11:18:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlO8-00000007H08-2xIk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:18:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso10676695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408723; x=1793013523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P33hVjpKh+xrbXa1Sk1QVICLUiF0MUyjx6lsJrB21Jg=;
        b=YF8UVbU+nBuAf/kl+A44tFFOVlSAvousw03lWf02jerhhqaEQtFuFt6z8kM88GldgM
         6Foi3R9IoBdWyc7hMF8LvULfcui5hOnU6mWjdfabrnS8CdxP3fvM5EZyIhnd9aklQxw3
         Iy7AToN+DdMdQcNv3r8cuIHS8T0gtzM2kTK9uU+qgmAYTu7LMHCCGxT+RnVmSnxUyRhh
         PH9ikjS8gZ90yMv5bO8TYtXL0kmgNgr3BOk0dfH9Yorq2E2SuSbvZMUlHag4bt6Yl3tH
         yZ+4RphRj0XCjc3lPaiHcse3SVye+fR4tAJlI4uWFRdM/Ha48b8ynoh6JaOXn/n/4Osx
         tAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408723; x=1793013523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P33hVjpKh+xrbXa1Sk1QVICLUiF0MUyjx6lsJrB21Jg=;
        b=SpfrGVKcmzFQsPx/0Gb0lU+TBTlzV3WTVupQinzdM3z8tvgHW2Igv3XlqPoVGhd12J
         GphKQG8PEoChhmfLEtddba3fEnDN8zBCanHQtwFdLGtC6ON2FfTTcaoUTcPFiXyKYGwE
         M3kb5k2mh6BlKr9Y8OLSiRi0BGLqpILfZZX3SBTiWpoKMfM7jRWaWM/ClO+waILsqMOL
         qe9xLDv3tEjxay56kwbeAmA6+OAvVVFeSiNYmRyeaLxnCz+v6jC2agm9X7BH6LXH+zaf
         6prvSI4IBYJ6CN5BQrtooAKzk4VeDoqX95eQshvkabxrx7BuLc5wbTpiG9Q7V8XvcHsm
         1jyg==
X-Forwarded-Encrypted: i=1; AKwUvBz7KrkAoHtEyMXMEtzaoXE01MdlomYHbZaNdNQ0PphpntK9TN79t75mo+9B1tXRp75JKyDfHEXr/pO/4AABHQmj@lists.infradead.org
X-Gm-Message-State: AFq9FYKefKkDHyTrsF1LqkM/MCrKgmaNqo4FxkXMGuKBbkg6+ICIiqb+
	HvmM6U25gtI5VmaLaUIUSsW9N0bOhbZDroKRFgZQbX96vdydpBsK4um5
X-Gm-Gg: AYBFou0wNfWWGPT9m2ybKZTr6eCKgVFKqyG4ZHwES8aC5tXMZbSeUzFVPsoDXjzJWEO
	VmKk5NlImRJO6rEOoPvv+ahobk7FMHxrMTIVYbhn4zxGFeTwkz3d1Qos+Bozk7w5Fd4hH5Jwiau
	UzTBsGkMCYrBBcAocwUusH1JoFK5/mc+7NUBOKr8rwpt414iJckprHY5B4ON6vFfpa1TJrUX/wY
	EM5lhQRVYb3pfikqq3G+5SWQ/XwuIB7GqicCgjtQox/pAXZxyUhXNoCxD8BBRg5nR/tUPQUKpuJ
	hcFtUwZsG0osNTOag6PrYjvlwsMrNR0gGyes/M+AMv1gmI4eBnmr9Zws7QTfuTuo96bNUp6A0Sl
	TOSXnBHB5BxmAzM1zJCWCzM/hh+MsEuq+YV84diYGucyFzn4FvU5M2dTnXboewtrTJkrW4GO9I4
	Jo5Z4fGI6L2/YelKhw1g0AwKq7AyNCrS9QiKeEBtcsxs7yz7ldK6RetClfqfm88P/fxcwVNYH0n
	uyDidaUB8sWF3a7m6iRsZCTKCQg7XL90UGBGdUv+7NllqMPhuSNX2kkW5XMNmkaBZbG6lr0n4X8
	Ik5arFWipsTRH8lQ5uIzwQ==
X-Received: by 2002:a05:600c:4e03:b0:4a1:d292:9d9d with SMTP id 5b1f17b1804b1-4a1d7644192mr172008035e9.35.1792408722619;
        Mon, 19 Oct 2026 04:18:42 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:42 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:30 +0200
Subject: [PATCH 1/5] ARM: dts: imx6dl-colibri: Add HDMI overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-1-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4908;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=eyuD5YVz5pZ+6iyFzhrdCEKyd+hrUtsb1l1I7V+Ycuo=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qev/uAKYfWaIK3U8Phv7yfyhHzh45PsWi/l5Dmvg
 ++7Rf+ljlIWBjEuBlkxRZaMJ6qCfAohsh4czckwc1iZQIYwcHEKwES+nGb4X6R1p3Zj/ylHVRmh
 HykTfttdCNgutEn0uMJ7231RBjXSugx/+AImKrs71azQkihaKrR5xY/vSzdFOhkfXnDQQknzsLQ
 tMwA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041844_781005_DA11CA46 
X-CRM114-Status: GOOD (  15.96  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay to enable the HDMI output on the Colibri iMX6.

The HDMI interface is not available on the Colibri SODIMM connector, it
is exposed through a dedicated 24-pin FFC connector on the module. The
FFC cable connects either directly to the Colibri Evaluation Board and
Iris carrier boards, which provide their own display output connectors,
or to the Colibri HDMI Adapter, which provides an HDMI connector and can
also be used with carrier boards without a dedicated display FFC
connector, such as Aster.

The overlay is also combined with the various versions of the Aster,
Evaluation Board v3, Iris and Iris v2 carrier board device trees,
including the Colibri iMX6 V1.2 variants, to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/colibri-som-family/modules/colibri-imx6/
Link: https://developer.toradex.com/hardware/colibri-som-family/add-ons/colibri-hdmi-adapter/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/colibri-evaluation-board/
Link: https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 41 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso | 27 ++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index b5fad2ba764c..76e2ce85a4d3 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -60,6 +60,38 @@ dtb-$(CONFIG_SOC_IMX53) += \
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
 
+imx6dl-colibri-aster-hdmi-dtbs := \
+	imx6dl-colibri-aster.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-iris-hdmi-dtbs := \
+	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
+imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -92,13 +124,22 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos2_4.dtb \
 	imx6dl-aristainetos2_7.dtb \
 	imx6dl-colibri-aster.dtb \
+	imx6dl-colibri-aster-hdmi.dtb \
 	imx6dl-colibri-eval-v3.dtb \
+	imx6dl-colibri-eval-v3-hdmi.dtb \
+	imx6dl-colibri-hdmi.dtbo \
 	imx6dl-colibri-iris.dtb \
+	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
+	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso
new file mode 100644
index 000000000000..449476f9c417
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable HDMI output on Colibri iMX6 through the module's dedicated
+ * 24-pin FFC connector (X2), separate from the SODIMM connector.
+ *
+ * Connect the module's X2 using a 24-pin FFC cable to either:
+ * - Colibri HDMI Adapter X2, providing HDMI output on X1;
+ * - Colibri Evaluation Board V3 X6, providing display output on X5;
+ * - Iris / Iris V2 X2, providing display output on X4.
+ *
+ * The Colibri HDMI Adapter can also be used with carrier boards without
+ * a dedicated display FFC connector, such as Aster.
+ *
+ * https://developer.toradex.com/hardware/colibri-som-family/modules/colibri-imx6/
+ * https://developer.toradex.com/hardware/colibri-som-family/add-ons/colibri-hdmi-adapter/
+ * https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/colibri-evaluation-board/
+ * https://developer.toradex.com/hardware/colibri-som-family/carrier-boards/iris-carrier-board/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};

-- 
2.55.0


