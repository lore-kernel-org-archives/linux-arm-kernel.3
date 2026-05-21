Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A6CCD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=; b=r51j+UXgi88lFeu9/UJmyl2PP+
	zBict7dE88eYoirbqcBpeBFFf5GEgVSHvh31kpUdHio+LlbGgRkz8mhj69rmirsSVReQzSX3LniRv
	c94AUFfWbCNRkBA4OY/dddrMv2tMHL7DvE6Rw6m8KdJYpJnTaTR+bX4ea/8wokZ7t2VG/lbWa4pVZ
	Tjj6SBLYGfzEtzihJe3U+P2equ9pMrDGznLANk0Fr0cL/toWE2D7t1OsusXaCQXrU11XIm5yBEAnB
	uEKYpmmwLkvue0EhnkcqDMDVBeMrweTtli/1Ma2eokniJVqB6Fl2gbvmOcSdFC3P6lwpO0sE24c7n
	l9SoIMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tx-00000008Dgo-17uV;
	Thu, 21 May 2026 15:01:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tk-00000008DW5-3Tcz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so8202685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375679; x=1779980479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=NDwreGlAMC3Nsay+9rADhg91Ft7ayyK5aDbLggM/JcGlb4cq2MzgfvT40U1Erl870k
         G3xGnFIs9GQBAV2thFxYV1UgxSqxkoPqlQ/O01S5FYDayOW1sKB6cTOGZBPQRwbadIAB
         nJFuW23frVhPWXTKt/+CM4QczfFUVFEFgCXIZ7wq+JEti9pTXk4KO0lf+3VpZ/6gmex9
         lnDwlWwCHV3iEvDLa1ApXeKwsUTqtr+fj9QMERlhs9g5cbGfwX7mWCMlSUoJss0PxzNv
         DsTGBp6NULDwMcQSQmj4WjJCSo3Ey2wXq4N75J2v0yEe8eG+azrWzVUvswbMzvisEiAh
         iT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375679; x=1779980479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=OJJoHc0PgjZ8ZHt6BTsi063TnYwKkU2FBl2Ki8+6u4y/BumtrBJOlHp1nzFubFQnaP
         5IcQ5EVm9vcJBYRsLothZqeuWsPKa6lo/RWuq9M9iXuCpUeIZYK4UuFeN7UrwRTRC/v/
         HWQZeAWb9rPZjT6OKFXFeCflsCNhBWOH6HTjwk8bFi5D2tu+3cisuPMq/UwUKPg+5o1P
         JhUc4gfSUrUlPmzi1WSYo5LyjxJW1LOKx3GCO0wuAt2FoYUueGGWhm49eEzwg6qMIHbt
         WoWq4JAjqCCbpOjGmmCsRyuzyobWSsBDxXNPmJLaPO8aJxak9b0CcZasij0/72+2K+YD
         0eBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tP45MNuXy9yQ22NZk1PtskKIDhAGlO7j4RG/8oTFf8huSd7pAnnS2eRnyo4wBuSRaVNXVhKbfumvc38cYaXrn@lists.infradead.org
X-Gm-Message-State: AOJu0YyLJMlYFjg3JmlAJzIExfIm5rP3VLlsV/NQBDU482VJw4FWLHeV
	320XGTylRbjcKXLLPyEgGkictdnYB2Uro+KsjaC2C/gKtk1XoiOe9mhU
X-Gm-Gg: Acq92OFGDB5VRqsfdnyAFHqBXm3g4kqFBxv627s8lD6UL285OR8QnbLXK9abeUtpJOB
	nsrfrgIMgWWn9+KqGMFYnOoEZAb+wYbRcVjCWg0KEzyUobvMY6XnuexpV5WZVUFjO2zWmywNAj7
	QSY/WpYKfzCwZauA2Tw3OusCnB4Y8y9mhs4okvMN20siatDR5uWXw6rQOdBjudtrUCcBo0fywxI
	Mb7TvhCSz3QpBRBfd9w0rVgofVGswZqcH7XvBow+qbUBZ4V63GnQ90cAVx/UnytdrxVCIYCaPuY
	15Djhfmb7B4BO6dDW3gLWQIxjujs4gvP/jbJ4qWNcUA+pqWfXyeItIJmUQrA5r6FiFKNlSJv1Ad
	IwdIMjavIvCIAOlHjnsTDolY/4RT9RaM0LFvkaKaTvaiz9JArRI9kkMKyct/LokyYaOmoPHe7H+
	6wscC0WXn0HTsNZLsoo/uf0Q1vw77YZCLh3qIvTaVIRveJwtaexXxZ
X-Received: by 2002:a05:600c:8b05:b0:48f:e230:c3f8 with SMTP id 5b1f17b1804b1-490360cc5d7mr64212735e9.30.1779375678650;
        Thu, 21 May 2026 08:01:18 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:17 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 09/15] arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
Date: Thu, 21 May 2026 16:00:45 +0100
Message-ID: <20260521150038.103538-26-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080120_896721_1E5E9664 
X-CRM114-Status: GOOD (  14.21  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay reserving AM62 MCU_UART0 (Verdin UART_4) for
use by the Cortex-M4F co-processor as its debug UART.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                     |  4 ++++
 .../boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso      | 13 +++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a1083c0b2502..31c9bc1d48b1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
@@ -230,6 +231,8 @@ k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-uart4-mcu.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
@@ -337,6 +340,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
+	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..e263809cdf74
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin AM62 Cortex-M4F debug UART
+ */
+
+/dts-v1/;
+/plugin/;
+
+&mcu_uart0 {
+	status = "reserved";
+};
-- 
2.54.0


