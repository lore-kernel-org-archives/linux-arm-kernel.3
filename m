Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB927C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQUBOPYyowxH3WcaM03g9fGKTEt+Ia5xxYG+47H3YdM=; b=HvnUslPpJ3xjefEmXp2o5GihEA
	SsMy9pD5DUdQmdRDOk19wrtmGmKsaooLvF6kzY5uIO1jnR43dmsdfFqvNvQabvRx6jnTJHXpHhB5C
	+rPPLwwS+sli3QHvtIgWDYEg+MfjYP4q/E+GyeFqbxvnOsJcw3/CzqxISekMCN7IRB+BrX56ZAAC8
	rVtjVllDWYcxP5CeAOJG0tp0KBEwu+kMa6ZwkNk+uMsPIXZ1AXD/j/Tp4euNuuUBAiYBJZV8z59Jd
	3XTXHjfS4GN3r01hPxAtrENF81mPAWanwcm+PvKx/Olwzk20rqTK3hzH5xrxwhG2cTKiIDmcCOvrR
	cWpfhPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjK-00000006gbh-0b1A;
	Mon, 07 Sep 2026 11:41:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjI-00000006gaA-0ksc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:41:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4859245e493so1496897f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781298; x=1789386098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQUBOPYyowxH3WcaM03g9fGKTEt+Ia5xxYG+47H3YdM=;
        b=f8kxdLF9dXJSUGSwLYxUY22ZgGb+8wftjNts7u4aSYD5x3iF0NAtdOVwyKIgPr98cl
         uzGyCsFVLk5PkA8yj8dDMw8vZweyFAw6geiHSMaM39qM+HQ4WUDZABmqvZ+mrV5nWgOz
         b5M+9GDXnJr/uE4JexPlZ0e1D++XGYZ/zRwjzFNZgexoxGPZ5c+rt+BFgcTwAOYB2Q6U
         xxotMx/qeJS0UOvYftD+Ac6oS+RR4e9tcOENAEVT7TMQR8VAIdlsvgLfbKVxCaLT5xFY
         Zmajj3Ptr9Pl15a0YlRVj3e6SYvVl1Yyt0DDga5yEki+qqHnNoPcxiCkXzmpT+F+sVim
         hoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781298; x=1789386098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQUBOPYyowxH3WcaM03g9fGKTEt+Ia5xxYG+47H3YdM=;
        b=RWkodE6HbQZk0nXZgYoKRCouOfssJ5X/e4BExbvAoMLx36Qv7ST1QjWmmqeWaDA/hK
         LPeXQncC4zVOEtT+JBscxhehG6ljKuxoa+Pp4RW0KetlefnoBA99eiAneYQgIVF/XkIh
         iRpdRTkBaJdRt6GvxReRsXHHMszQ6eKdt2BhgBvreXoWFsiSaGGanJEB1qP0ddfM7p1W
         uuuVtNbFQEmxaMXa4TduirUIaFC2jlNByj2bZEEhLHOL1r1eHP7VMthaSbYHQYYq9399
         E1yICJ/ePoaDRmY51Zs1KoZE7H9LHiarUXQiGCq5UcZ6IVJwOw+44Q4gspq/d1l8DBdW
         NUbg==
X-Forwarded-Encrypted: i=1; AKwUvBw3lxKMgPuXkB/SHA2zE2rKpzgVXCvHqSpRacY1QCVfzsoad2YjyzN+kFso6uYkWx5Mocc1heON73Fp6xq3ExAk@lists.infradead.org
X-Gm-Message-State: AFuF++mjpKrWPR9BbiPqJRZ8XNCUoUVcKq/+wauF9DaWEK9uwBPh89tO
	vLvTJ0pU3nli73YI6MTCM0Z9im6JIZX4SkLD+gPoKgU4KCPLVqE38D4z
X-Gm-Gg: AYBFou0WjRehX3/MK/DEODWmR6TFXWJPFoG64/UbLhcCnuFG2KqD0FPpg7SV2XGUZIq
	I1ib9m63kO4U+tWU+NOTQxUHbcXiU2wGC/9ZtV1lx0/vUJzUUeKeCL75GUgCRb8fbP+zLpWSdny
	nkQdKppBJOAXGC6zNzaRehJe+xuQwOfo0Ghj+7aPqepglFnHcdqfJzBcYGwhki5rneaX6xGWBIi
	Ljm2ciZxTPsZFElU8/eSwpRuaannAhwpUO5LsaSt2dukhtiZahn+duUKonrp8G/LSlRxbw248Kw
	ziByOn5Wr43ahxBU1OVSMPJ33wr5K26sRdTyksNsaOcRcy6xYu1otp/WiWnTSQ7+yH2XS4NjLaq
	ihWEM/ocBFi+ZR6OFB3yMP93zotOeW/hK+hlgZjs/w7JC+Zwg2P4iTWCjf1hnj3t3QaEohw2+KW
	0F9xIv8ZhQr/o5A/GxWgqkRg2huQxsNbNHKpxCPrnXCr9S6VNbo5prTVeyhha6FMsFmpzI98JZp
	2fABHJE0JyBSODfUYzD4AUG923dmCTcxm9XjldQJzdnBlUBu2hvIsRFwhYxdCE=
X-Received: by 2002:a05:6000:712:b0:485:8a47:5b9a with SMTP id ffacd0b85a97d-4858a475db8mr21110822f8f.55.1788781297779;
        Mon, 07 Sep 2026 04:41:37 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:37 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:30 +0200
Subject: [PATCH 1/4] arm64: dts: freescale: imx8mp-verdin: Add NAU8822
 Bridge Tied Load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-1-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
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
X-CRM114-CacheID: sfid-20260907_044140_247988_ADB3C6A9 
X-CRM114-Status: GOOD (  13.39  )
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

Add a device tree overlay for configuring the NAU8822 loudspeaker
outputs as a Bridge Tied Load (BTL) output on the Verdin Development
Board.

The overlay adds the codec property for the BTL-capable output
configuration, where the two loudspeaker outputs are combined for higher
output power.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 984642146dd9..8c6fdeaf12af 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -728,6 +728,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -735,12 +736,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e94c60381c4e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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
2.43.0


