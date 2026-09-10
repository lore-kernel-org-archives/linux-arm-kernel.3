Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D7C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=; b=d9/8J6t36FJvz7cG1f3XmyCWu+
	shULvRYQi6tmce/tZnKYy6IYYPpnblsHKl43Bupxjeb274kNGvd5+Gdp879h132QAhcpu4pJ0iP7M
	rTbSTLICe49wNjqb2qlC7mVNM2GVSP0lm8cPE9/5ldyx0GdFahjiud77Vw3ynraApFTBT6WNZXk5d
	O6eMUBhT9U1ipkUXjBriCXwXhdW0KGGEgCQ/sV4ytwLttzBPwu/Wa/uAc9/MoOrd238rgt/ihVfvf
	QT2xGqEgV/3+LYgady8YLaZiXoNXatnIvGerUJnf9PVfI+CwCLGANmz2BTm/Oy241a7H1QNx43nYI
	x/Qh2mDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqu-0000000Eokp-2iCP;
	Thu, 10 Sep 2026 15:38:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqo-0000000EogM-2kPv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=; b=Uhxatjz11skLkyQkYensm9btDJ
	BwKUmhhcyisAW15Msoufo0FEO4N0gXaAUPq9ZdeTn64jwMo+qI+wSLwuXjrNa3ir5lwUCbR4mPXjS
	glSlDbJu/ct/RjnLMKoCkpD8WTiIkqiq44O6tEFFCa4cVKAx7nhED39x/LUbduW97pEqbczNAa9eL
	e5emW97DEi6i0rwQRM3QQVunPjO4s4BZ2MaZ+aqx77mNXEw8L/1gNLXKHoOOCSO+lpSa+1jnDukaD
	1Z2zDDTBgw/29JaiwVoCJkJ+4J1/xLGdL188TKjUb2cd1Ke5iSvJvwZI0IS4ho5hylZtsz0QxMfpl
	sYx2z/qA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gqm-00000002gVq-0HGs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:38:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso61201135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054686; x=1789659486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=;
        b=sniEuUFWOczulIcofzm1us19H95Pu+0gkJkAw5oAJN5y0a9HjRw86Dvdh7+QpqS6xr
         WyzJLvcnWtJJyKZtoenn8mS1w91QWizVGR0ltJxSkoNdP9utOPkUZSj/sIG+yuKoWXhv
         k8WooeZi7lcjcG0uM6pwfQAP46qe3XSrKUliD69F4Zbb+OdrRIBn/NMweWrZJWAYBNHc
         kXyh54v8/c2mmreLjfMZw0/L5kvxfjfLQCfnpk6/5gexguFBuri5Vbmq0R80xXtJE6Ri
         GEVB2CGdWgfZ+uObzWWceyGoHq//7aRtsEG1Me/apY/OE/Y9oN64DHtxlXMMFs994h1N
         aT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054686; x=1789659486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=;
        b=rZBeDaKRmKMQ82R2uignyQMyEhU1BYVVr84i/ars3YbxQBBmuzfMo+5A8+Y72L+tUJ
         QRJRUgS1bsx6+8dVNIwMd5/aPi0kbC9zvt4kA3PLcjlVaPgDBSxDSc6UCKPoO12LsYpI
         cOgHE3/1FEOGX5P2IYeFYBTQfOdHj+eXYJL35IOU0gUJjVySbmJd99Jb+wNq0b4RExOz
         b24EyxY6FKfTPWjYoD6MubLZAZ0Af6PzbrcNNw7xhdLYeGXnYDUiic6KwO9emrPrrw+b
         HvSps5Ya5ijFrDAG6mVq0ghbyj13K72bd19/Y+OGoSDADfMDcTKjladMAl0hDdJ27vOx
         S9vg==
X-Forwarded-Encrypted: i=1; AKwUvBx2ui67eFyLcvLK0+GPBD1CgkxJKJGRD7f60klchJPyU5aWnILKR4Ysuc9x8fOBtmGChzKYrgDj3IG4iax7sZFe@lists.infradead.org
X-Gm-Message-State: AFuF++kyE5Cw20qwSszo5OCeFqYajunBQndJcFIBUpVaQsnBjyyX3MRA
	BhD74XyEUxUjVqN8I1KCWqVDARccePILUyUFU6ouxWK1YGSdHaglVSNEhB1J1VVJ
X-Gm-Gg: AYBFou2A1KK4cuXIri/ddt00XdpiaD8Qk8Wd6FBggDvBAyyVnfU1q0BmcdxDMF8Y6ih
	5mgx+fkyTkZn2NCft+B73Kg6slChNh+yYhifjS0hg5CiwXXmc92vOfbevCdGssWCHueH5y67jAT
	Kc3wHE4NPcXYxGP1vJqS0wgCHQT08Z98MRpeJexSsucyQ+hCmNNdqtxtEZafLCDvzPXQn6djEPz
	QUeAuMhTadN3B6mHfVmt0vvz3PBwvNiVusB/zEb6OqMwjd14QUdu6J7geSDvdKTplDQ4CSilPNn
	XQxhQVTOFj0pZKjMgQbqWJOrccdXksALygALttPBMf/5AkG2OdufYgUsoVZjYG7GJYGkBQj4nAu
	s8Nh6NAS35JdA6r4jP1lKN5bfRghI71ZmnvAAf7Uv1xQQ9w1l9lkRKNWNBzMREJI6sxAejyf4id
	9c2KL7RDkg+xLxYyB5/mJsvqT6Y+UxqposkMswczflipFKahOaIPZ/TGUCSLuz0bDSRjYCRSby0
	SCZ5mUm5+94+wNzeFpXO6N+jykvgwnbVoWf1wbCBxTEjznezqPlaw53LIeL4E+qURz/MfVSjqEv
	MTCgoRR+
X-Received: by 2002:a05:600c:a49:b0:49c:fc6c:be0c with SMTP id 5b1f17b1804b1-49cffdc3823mr348668065e9.18.1789054686376;
        Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:58 +0200
Subject: [PATCH 2/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-2-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_163808_176258_B1476A2E 
X-CRM114-Status: GOOD (  13.00  )
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
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Plus Development
Board device tree to provide a ready-to-use DTB for the non-WiFi SoM
variant. UART_4 carries Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ca4fec7c1038..8b152903b4b1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -734,6 +734,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -742,6 +743,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
@@ -759,6 +761,7 @@ imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dt
 imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-uart4-mcu.dtbo
 imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..74d90b39faec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Plus UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&uart4 {
+	status = "reserved";
+};

-- 
2.43.0


