Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C1EC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=; b=J6cKNDO2w3bQyIfqR45z4dmS3E
	PpSNqhv6FQZJkVy1AbZkBgpkNMA7KMy4B2HRuDRkpRtECP5ze06jjz6isjlIe5uFbTrTIr7ZviGU8
	3deaa6oCKtwltcYhlD2Qp/nJm3BTz+umIeyoQbNilqgUTg5RIATNPcK6xb+FAfbHZtb5z5zHwrfMO
	ATDmug5unx5AwyRc4RtFmdiaZi0tv0zL3+kVJLCbRH+8yIdDEy7FqAQ3eJ5r8C0ckNV1PuHnCnQIl
	0zsbUigDtCD/8fL2nEGwCA4oQYaNSJuPqT9jHlWcIInwEKysLkwmS3jX7Cx9ZR9BfwHxwsUz531j4
	f0wjGNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZX-00000005heD-3bLc;
	Tue, 22 Sep 2026 14:34:15 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91ZP-00000005haB-32u2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:34:08 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso504036866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087646; x=1790692446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=;
        b=M+B6QISmF35djZqoPW6Bh/Wpsm8HBC4nlvcMTuqJ6ZL3xD6IJWV4igDoc/dBoqvsj1
         O7lEzgCWA5jXqb4mkem/HmcyPvrsW+kNdC5w7KxmTiIBNvOLrjm3wTZ/hws/34Bj0GlS
         TI/pViGXchL6KA1cKaVKDi0zhFM79oKLapeeg/aIK+usK1vpKYGzmdD3eEXKhSiSqobd
         GoEARv5ePd98HZZA+hMPMJbMKk+KEqycqrLjLrQxUcJFDj5P0EvXP3DAwKTXqSTgGwu4
         //rIQVZEX7inu6TcMHJWsCFJGaZxGG4L6SKKmMLHJ3AdrdgEs5rwqJMge4wiS1AU0wOz
         Sf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087646; x=1790692446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JwKuwLxtS4XryhoWW3qx4Ui1MeQrSjIXNoBYuhH/9w=;
        b=djvJC9NGvvVjwIPqS9QEiSbG2NeaPjmJniN985CcFLu3TRhiKd793i140TbYU61LLO
         l4AJPMd4oz1g7Oa9eKupn9DtUyuKDSoN1vX9uHTv++scPIYtDW3qHpS1nvvgqgsdC8T9
         3/kxCA33RkKgGWE6H9C62AJ1cL+5xsD8gaV2o7EswXKWs0UYVBN8rF5JWAIj2SLJ+Z5s
         2MXgil4cuk6zPgXxCrg5BOX0q4tJvb1lJYhQ7n0uvP/FU/bM2MKkfF5jTZCL18tZafuG
         7EdiMXCZVd5LmJ28MuVT/6YD96cyyttlwHV3zQ9Ltr588xVH7/+NUTa0pk7xIXKnPRZN
         6Owg==
X-Forwarded-Encrypted: i=1; AKwUvBzi+NeOI3nHkHbDo8uv2GAbu2PJGRJHc/zd2m9Tzyhnm290rECEHFEMGxmQud9gFe6k5450UMgVAeRd29j5+/Va@lists.infradead.org
X-Gm-Message-State: AFuF++k1nLD4d/yYWlEn0cYkwbD1cYtoDMaulqVPYoo9qhjKC/nkgB0z
	yBGxd8WLSUHU8YSnCvNPpYyvbjYBObfxydGqBG9Ok4wtb5sY46YhM82Q
X-Gm-Gg: AYBFou0AYnBecPYnivUINaX28FWle6lIvpLt6ga3BeYptMfaJ06gcSOU/WWzl7hGR84
	xbrIbC8TU408uIemL7ntRHOuFIPhnG+dkKHlI864X0iE8owZT18xM+y6CjMoZqobdjjdIrji1KE
	NtiHfCVLutTACB5c5an8q8Y1e7pfhw5TXiL/lxDT1cs7Vhlos9deV3LOyd8Pk++/qJRtUUS1nIx
	WCu3uceP7eCMRg8XP5hJ/I53Jun7zI8ySksu+mbZTCXB7KJlYnnPQsnZ6+Zuc95SBacuJZQm1iu
	lLm2qKWnDbUUDwJhpVnynmPQ0kSofQnGRFgE+xF29+ExLvoORIcBc7+XZ3NExg36y1cObRxvCVm
	todsE58YQj7ZhNLKJa0/fwSNWZ40Zy5UCxDm99p/08yXmDcuoXHG6WVMICmPwGXs+uKycCMRGGn
	jHX2/ZTQHHWAi1Elj3z1a8VFod33HCBr1UcKys0tiJvDooHyPM1GIxd01YwDKK3/E8HXxGpsvZE
	6ZNjiwh16QQkw6rH6gLgQiOnsKR6SORp+DczUwh08gnIFrtG3sz50Kn8ZBnqz+qwYLaYdLMpJQ=
X-Received: by 2002:a17:906:2090:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c2a8e3b0af5mr219778566b.8.1790087646027;
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:47 +0200
Subject: [PATCH 2/4] arm64: dts: freescale: imx95-verdin: Add Cortex-M7
 UART_4 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-2-694100afb4bc@toradex.com>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_073407_785309_A4FC8CBF 
X-CRM114-Status: GOOD (  13.88  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that reserves LPUART2 so Linux does not claim the port. Firmware must
configure the UART and its pads for the intended MCU application.

The overlay is also combined with the Verdin iMX95 Development Board
device tree to provide a ready-to-use DTB for the WiFi SoM variant.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  3 +++
 arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a7ae74a706a8..c283c582d974 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -966,8 +966,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
@@ -975,6 +977,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
+imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..efe3849f262d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX95 UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0


