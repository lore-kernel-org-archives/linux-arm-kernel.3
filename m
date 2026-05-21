Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71092CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=; b=peMtOedVLvEGwo8wrA9jKHzVVE
	sY+Fv3PrjPfR1R66QmVnsKw2W6g8vbRT0W0csM/uYtsGuEnXJn+T63HAXZtUW+S4pQZJoVfW4cV+H
	c6ojLSBS0EnPzYyUDHOjPAObaWgHFDm8kiB1F0yUz8QOO4Bcy1T+mWj5Hlwffw+t6eUuyQdVW/Eaj
	+FissH18QOmypepVXBxiRhm9sYLzCCgi1b9RnbmgFz63ap6Hu+St8DY5g14N8nVnqy9rKyv5UYgiI
	VTAiwLbydyFGlIXjWXB9fukNGj8EVOdSJL65180MBEZajfyvgha/fgGC+w2cUFtCbe1SrZXC3UHqs
	iZ6IOujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tx-00000008DgH-0ObF;
	Thu, 21 May 2026 15:01:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4ti-00000008DVA-2tfS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43fe62837baso3694406f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375677; x=1779980477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=LTHkju2ohhsdsDF0YlJnv+Kc5KnhyuqDJxhvP3SaEehWg9AThWDAAvKZwd04jV96cy
         dCVN1mfD5QGhA4DtiMbTfQUBZIYM3AiWMdjGQE/UclYh82giGrA6wMsdhBol/S+SmLCa
         S6iidM+41rNQzqrQIuAnIdYJo+y8+ieybm5+ggWkxdrJyW48CNLijRi57mNpD3Hcj32R
         I7ItcgE2jbDC5SuqVqDU8TcETXq2mcyGELleWO/5lvCz61NI+zAV7B+tH4EzHq9YDCA3
         1Ked7LvKwUU6qwdrzhg/yiOgUpV7W9nqgCU20Uy3gSSDlF7jUOjrmnV51qKTa8escjFM
         T7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375677; x=1779980477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=mseMTCq+Dg5LXXpKXMuudZKOtYMcRaRjTR/wXq6MYoL/9rohWNrNOV2+IJDk9vj1ND
         kQrTlNoDx+WSIh/hntXuL3/lvlDHizgH05QbUmFzi6Jjg3AHIqEVTaS4aaRPnF9bSWhx
         1pd6/BJmdbiGwjOzM6GAAcBbEAzGGfse0kNCkfT5PImb8IGbzHEeezLt3shKJDWZVLfp
         0sZWTG8HfSN9zlma4H0O6+qfOs+NpCG9V3Ubt4dP1VNOs0yGMF6qVNVaYIhWzyGPSMdk
         G0BeT1bxLb8aw+bI5QBcsQPiL6HWxHgbyG7Dd6x4dR3T/Ln0Gcfqqi7mfueUzTqa5u0J
         dciA==
X-Forwarded-Encrypted: i=1; AFNElJ/l6WYKOWILJuUyDLYGEyF95TZ1zO60ikDmMzCEY9RTUqCQl0lHuOxY5JnLJ0bLj0bezLix91PcvV1wcm84bAK7@lists.infradead.org
X-Gm-Message-State: AOJu0YwNvaeMlRTCJfnd6B6n/f6vPi5hP78m2ZA5Jwuy380z2Co1BFeX
	7C0JEXv6ZZmqHchrrlA1l6nwl/uKlnf4Eb2EQq/BJ+pNOikX9dqs1322
X-Gm-Gg: Acq92OGhxxLtPnYdOBf1bBC2vGmcClJGt+2VXURSAiKXyijn22h8up/rdcfAVfD5XfI
	4aTvTN7VlXXUVE2qNUbtUH+cDFAGamoKxLUSMyuxZaU72uxkY17xURwiMnBAUHSL0QUVnC62/sy
	y6GMGhW3bWzX7Y6io1Edn336llyVrxEUQ26QvKZ6TZzE2bSxmsCzvwU7FY/VLSBLCsUXCCMiiIW
	4jml7ZclrZCqVfOfHfbcKTkIufJaCUd7wpACMXsqhVlpalXrbRqVkKiShsOLzINXncoO8zECtsv
	g/eK2jBWAde593mQw/MNx0zre5wIngd29z2+Z4r2K53DyVDlHp4DuQvcGgNiyTUko9Olw5Crx1v
	vpAS7nynM4oAe2bkmVuRRrfuhnQKj+WxxpbBl9JfthLXNgE9xYl+NLUPnzHRoODZaIX7wbYxmJ8
	GGM/72Vu6ozCDIEuLXurcxRPYoVHs8MvtNmKGkdFZll8yJn9DwCybe
X-Received: by 2002:a05:600c:524d:b0:490:3893:c4f with SMTP id 5b1f17b1804b1-49038931006mr39445515e9.3.1779375676464;
        Thu, 21 May 2026 08:01:16 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:15 -0700 (PDT)
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
Subject: [PATCH v1 08/15] arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
Date: Thu, 21 May 2026 16:00:44 +0100
Message-ID: <20260521150038.103538-25-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080120_667635_CF7A5291 
X-CRM114-Status: GOOD (  14.31  )
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

Add a device tree overlay enabling Bridge Tied Load (BTL) mode on the
Nuvoton NAU8822 audio codec present on the Verdin Development Board.
In BTL mode, the two loudspeaker outputs are bridged to deliver higher
output power on the X28 speaker connector.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |  4 ++++
 .../dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso    | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 14898f8ab0e2..a1083c0b2502 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
@@ -224,6 +225,8 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
@@ -332,6 +335,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};
-- 
2.54.0


