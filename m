Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B974BCCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=; b=JfUyCpQV5n2mrtMSjI5RZ7VmdS
	DBbkPnlfNfYcw20nWejqa+n3edi59Kl2komq1nS3a4DnilU1SjQCTyWUIOVYcuRecCDwTRqBgjscP
	K14QFY0XyMjevpAdP4POJQxQ586hGh3q8s5Ff2Z9ZrfEjB1XbGZ3UXKxyJnNtUrgo+7qlzrUyMTxK
	f7T/eXKIJbvjaye5fK1LlyNrAMbyH4SWU063aCFkHCkh4fqWcmjg5X4jR5xBBZnwT+KL7xTO2O/wo
	eT9I0RYF0JJobLzCDBXNO8DLpUv0/ByRyc+2MgKxo2yoL/avoIkNh4dhfUZCnt0zE27rFNxMBL3xp
	6Jf7vVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOE-00000007H4P-48e9;
	Mon, 19 Oct 2026 11:18:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlOB-00000007H1L-1TZL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:18:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1168139f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408725; x=1793013525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=;
        b=EzMMhKRsHyVm7I/EhsDcgAI7tf2jtJinkU8ruvxjlx3HvYUr/PjLmJBLNL6dhWNAW0
         tt7QNJGUoASdiNVkcWMOjravLR/MbdOWv9fz/JdQP3Fl3OKnyWbu8g5hw3FR5qQ8BFuV
         xHdSbMcucozLHuiNhCFTbqnHyW6TZW6UhB6t940OyG1xQYKxfeI234sy2F6LovpodTJM
         iX3RcaQQ5TqdSglYG9Hw7h0gBA4eMbre56thzsqUNYbCmcLbxrYpxCWRuDKEGoQzlzOJ
         vMIq0F2Lmz4iWGYzOK1wvhTetdcN05ze4g0WtSqNW8hWD3D/n8lDQcvg0yDkwNHS/6/l
         zoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408725; x=1793013525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=;
        b=MEuI72RKJoVsFIHUIWgcj9b5kkMZ4KBRglxA8moQe40rdldsmQkDvv1yQPBNDoJBI7
         uT8WcqtoggJ9Gyo1MmBNJ4GdUm41LOq41V64jeycYAA4AMbMOoFk5JNkn0nhC96lDnBq
         1ce9mvgi6PfHe22bg29Lqsk3DyfFu6io/hKIPp6mJGBx/q1Msi+8E9QnXXdAY6qRV+Tz
         tRuda17/yGY0IgHfHAcQppA+LiF5Iz4HkdzuUFeDh+7S9Y8hU50jAu6089eObiW1nwR3
         C24iNOWdaH3VDzmL7GHjjePqDmxjJuiMKi3VsBuefCixHfWefEOW0Bh333HSwXVr60f7
         /UAA==
X-Forwarded-Encrypted: i=1; AKwUvBxcCO0RDhjWOb89gm4raviFpGffPl3uNQuWfyS/mk9Xk/NkqBkVIA0LxUeeFcCFwH8j5xsDpZyFQH7LbTWqUvZf@lists.infradead.org
X-Gm-Message-State: AFq9FYJpYVvtw5VNIv2K3SugZGurx0NaceMCwsN1OLTAXyravtFfil70
	5DThpZvxSC+Q2r17zcKOb/xG8eVoylZYQ144L1HeBRlOe1KGZySDZnR2
X-Gm-Gg: AYBFou1v7ODx6FBiWGV7wVzq9TSoeaF0BsdXGeI7eMSYA66x1v+4jfpF+wfTkzWPIB6
	6Nz1qaWxPcOsFmrzQH91uHDmCfGfYJscuOs5msEdPFU/lWnfzwGWNvt760tfJirvLh4hK5Dm6Cr
	029G3Hx5geU40oI7PhdJm4zxPfiq0YfuPsnu2w6l86HMY+uE9qNiYDp5I8LDw/3Y3dCioQFzE/E
	u00kq7GBnvDmk93BAN7GTmhZL+K+ndF3dN5Oo0u+UFSagZ5vuDdtBQ+cGHe0J0c78ZZOA3U+3lz
	tIg7tJkNNgZZWsKJSKbhwwAq0x/aKLkqXDD/NCeILwSG5mywcNq9ioadYy2zKCkY3QAYeQgxdOl
	LubKZ7W+bNArhKr3w7qb385o5sB7LEBfdz5fXUJo0fE9G7rRf3FXZt1vjVYd6Uq0/3ZBwy6NmqE
	UZBiq61D9f3GroFeXqAjYXC/rdkOTl5gLqcwK0fe0GYfstIHReII+pZCBbznopk8/Cq8sqlopVz
	tJfW4sNAptf6dU71PyofOtzLkTYNGmvT98ey5fesuSPTW/Tuk37pxmXrNoZNJVd338mOOYZ6gjj
	hBrnNHtKJ2juLwOl20TkDnNQEInQIuxm
X-Received: by 2002:a05:600c:858c:b0:4a1:d957:733e with SMTP id 5b1f17b1804b1-4a1d95773ccmr99705095e9.26.1792408725266;
        Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:44 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:33 +0200
Subject: [PATCH 4/5] ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch
 Display 7" Parallel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-4-e4d028727382@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=3yhzmAkS0sm6Z89eEvnHRy31Jkz9wloR2qd4ecuJsYo=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qe/r05eak5Xb/exYr29f+X5FfZ4G3D/2f5hgRefa
 sW8zA82HaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIkwRTP8M37288i/Pm6tg5eN
 VBZ6Mrlvmv3xrG/vRfbQ1jsRsTwZrYwMd/LMd85bqCL69jzn710vFGafP3zISMVverOM+IqdUcp
 /2AA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041847_445059_F906542F 
X-CRM114-Status: GOOD (  15.06  )
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

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch, handled by the touch controller on the module.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...6dl-colibri-panel-res-touch-7inch-parallel.dtso | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 4f59ef0855cb..1ea51b13ab7c 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -92,6 +92,10 @@ imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs :=
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -146,12 +150,14 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..331c81332081
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};

-- 
2.55.0


