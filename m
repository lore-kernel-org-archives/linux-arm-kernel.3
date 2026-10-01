Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A40DCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=; b=f0SSPdBpXMDvv8tRhpU6J7mHGd
	zfYH8tg0nUusY+RAsg0sn7pYhMMbmglUI/vmTLMuw7loYX3ANvXMVtW1XT6ZCQcA07Gjcuq9tbiHl
	O0dqSbFde1SIju21OcZ2w71GitAoQKnNsYysZHrhl2fnCvxRd63XBVvKY7Bpu99gBn7PpUGZBA/oN
	CmhQxjQ8rX2vK9tPeLmM03My4nTNIfyUYiClGTc77hrI6vOgcqHQG9MACuXrDwp8R11nLGdnEkDDW
	BdQQhmELoXD1o1pQA33ljjK+IKoM/tGRjnZNAJ9h4VnkJtGZaMk6FWxKP6B/j1Uw3JB7J2z7GiAws
	EWHTUcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNt-00000008E6N-2Kwz;
	Thu, 01 Oct 2026 08:43:21 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNq-00000008E0c-3Qhu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:43:19 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so33515435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844197; x=1791448997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=;
        b=QFPCeOK3hw1QO0P4vNlFSWgbKZiZ0szh1JrRqmkk+BD9VJ+t3pNQexgM5kDd+D/b5r
         EO37zfj38hlPzMJYqIn/0XdoJXRLtAj6UXYjQUJicKiu+e3HUXLMyuOqTad06WMBqCnX
         Ayko5fsTt1D9B87y4E9OHJqqCq0rvt5RTgvAEpvXqqH9g4U+7kasGXwBcbGRLP6IcZ82
         2lXZcm5+STwi4v4BM+8nK/ZG4XNvMEwBjbD/rrSOQboxJ5OwurvAJnz81RScueHHtWZb
         B4CoRM5J5rwzBoUwgeOaPelDHw2eQymOJiXMXixEGvakq0UDXwx/5k63Q6ynnmqiegSj
         GqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844197; x=1791448997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=;
        b=ensgNaG1zHeCNwtIfTwRCI5DUs/cmaWl82k6UUVLTt2pxzu+vpq77vwYQL9GWFCpU7
         jYZD6XgTQvEcGWwIF/ysYPfXrqjECxKkLn6rxPa+YOHTXSPdF0XTW0dtcuE3yPiRVd28
         GBRpSo9a+4JgCTx1KfBCZQapidvKZhyh1hWn6PAZ5KC9P0nuaVvoD891jbmkDAU73Tmu
         saLt3LI2cilPf+Z4og2THaa/EnTDaIVriiJKwg9ZPY9NSe7zZtsGrAhBat6J0qyMX4Tn
         7Qwk6vF9GFm/daF2REQZ8w0arKV3N2bYyxUKQMRKlR7btWxZDk6/S3n+hIR3Lq5adoLt
         Zdlw==
X-Forwarded-Encrypted: i=1; AKwUvBwH5GKRUjrt0WhvRNLQKLvWzhCwXGXL15V/E2Go5Z90am72ClvXSZsKAGJd0haoe/HilxkaZ8ZGbB7u87y7491S@lists.infradead.org
X-Gm-Message-State: AFuF++npqdB/g2XirUWxoBbsBloRlW9yfbxxykmibU4UDXvZVor8SpI/
	kxjtNRegEeKnh8zKzewCLO5c4h8ojUnBEuUCHD8WASUo+IaKrUUY7D9O
X-Gm-Gg: AYBFou1yTxbOxMiMYZrCVMvEuHGSH60iJKUnpo9Ekp9v4YP2CE60bRrKX7dyGORY1lz
	oNKplISP9WdGpQCojwA3Dkc3A2jJmG4a1qEh+w+M9mxNWSDdSNFrshVwIeu88k4dEcomOMankrG
	jvHDp5oqXgecC5KbtoXWNIHpPc4uBZfB74HwUbD4zVyOjEUJzQie4EjfSP/c3nhJwbtfNEh5TBO
	3ljspJJnSdJvTTWt5x9n8/liGBuppaCgN/lPGTEZzxBiFiibW2tfCLLbQX0Wp2mUMmzNoXzE2pS
	TLq3QnJr69Y2wsEVtqDIo4Ik0O3iZF7klMjK5bGJTo+4412pIm2YV15S2cQJo9K37caaTsKvnTK
	JExAWB7X9c95LzJ+8r9LG0mhN1e+Q2ofTAR2MJ2Kvs7WT60vAPjL6ABt/hXTEIZkx3rimowwzbr
	xSWvOkJhYdxQfwTBN/3lEbVO6wKm+u9TXRQSs/ZdZJ29/nawBj3PfyB0yUAJNhjTB8+JnX3AUvX
	mMiJ42cJumUoLUm1rWOfAKefLhTw0IRwhrj7C8JIV1ScVhYPrgB0y7RERZm7DdyjCQCTQc08Q==
X-Received: by 2002:a05:600c:46c8:b0:4a0:f0a:976a with SMTP id 5b1f17b1804b1-4a01ade9bd2mr64054025e9.13.1790844196791;
        Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:10 +0200
Subject: [PATCH 1/3] arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge
 Tied Load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
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
X-CRM114-CacheID: sfid-20261001_014318_883987_3E6F6AE0 
X-CRM114-Status: GOOD (  13.48  )
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

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with the Apalis iMX8.

The overlay is also combined with the Apalis iMX8QM V1.1 on Evaluation
Board V1.2 device tree to provide a ready-to-use DTB. The codec and its
routing are already described by the carrier device tree.

The overlay supports both Apalis iMX8QP and iMX8QM modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  6 ++++++
 .../dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso  | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9971b34f7301..2732b223eb3d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -801,13 +801,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
 imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33-dtbs += imx8mq-tqma8mq-mba8mx.dtb imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8-apalis-eval-v1.2-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
+
+imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb \
+	imx8-apalis-eval-v1.2-nau8822-btl.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 000000000000..b2f9c43d29cd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
+ * Board V1.2, combining the two loudspeaker outputs for higher output
+ * power.
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


