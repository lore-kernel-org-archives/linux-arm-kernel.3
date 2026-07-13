Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E211AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKRuht4Zo9grMOtpWKiMvv6L6icfupPh6mIS6dQbZRs=; b=DyNcJsBFb9rAahlEFBQEP/YI/0
	RVs+aIFkwBVUYHeOoOlYJKpxx7+qid8Tl/owRy4j83JHthHb3vAQJoZQ0m31JJeilqgb7TtRAk1so
	hRaakMZKVXb/izzyqOPQC4RWWMRIlrl1WXIM+skzc9oABFv2zYC1deMICKdJ31voP0PGW2iNlbum3
	mZO6QyQkAAL6kRgL0fj0DzEjzGAF/T+G9hGVVHwyRWjwIYDzHVrXk267ZxA2b/bAukgpt74F7Ojog
	qn2cYUVE7w03p9k4L5119uWUBUqDOiM+UHBSrXX1d2Izoby4W/iwy/bL4kSNi/UhTum50RKLgcvPr
	pvJvV6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFI-00000009j97-0Aoq;
	Mon, 13 Jul 2026 15:07:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFG-00000009j7W-16TP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QKRuht4Zo9grMOtpWKiMvv6L6icfupPh6mIS6dQbZRs=; b=eUvBfeUBIaKw5rgmCYZt9QTApw
	amrovzPi37fJgFSY0bdfk7c+3wlYJ2HbqJ713WyG7Bi9pKj0mT4HpZpsVFXP3RPhhZREIYZq2PztI
	w5u7z+mZndlOx/mVm4uOjCQLkbxXs7vOl7z9Q9PFGqR8InCWY85EYBNhvBx8SRNVHY3+EYOaAP14O
	W4ddCO6xM2rZDjLAj2oLrksVoxNvTv/bMjwXWlShO5avC3FLHxB1qf29p8p3lJ9/ua8iuQ4fsjkJm
	eUIFWt15KMmxZ/ReFdiaBJs85NN0JsVOuwqLKJLh3+5J1RonNQrZox+bZp7cXDeAJTS/aKraKpKWp
	UT3F3DOQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIFD-0000000BkxA-0V5o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:06:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493ec555a26so21391465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955213; x=1784560013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKRuht4Zo9grMOtpWKiMvv6L6icfupPh6mIS6dQbZRs=;
        b=jjgRgSvtXqBFYP1hOnktFGIOeXauIeCSSJxOw+fxaiq3vM/Y28ys4sjH88otg6SVU8
         2iekol1ff4fmxXwoNOuqtf5LGC/4H0WsYWPTuA6JPnDZ0nnH/vwMVR0r10409MriLT8U
         oa9YvHyUv5RCeQSQ9cjXAflps7mDfZF2O+xl0uSDSabz9u6JV4Qq7rbKFs2nD3hg1DUs
         nWPoQXOpVhM1LDtX7EHUbohDlTGFqT7pP0uj3UOy9A0Hkvj0AGcWH7B91bj4jPU4iI9V
         eRgck6qTG6upKzHyee9reS5b1sqUCulcTnEMM+Ax9Up9lc0kTTpIyNwzWaEOSRhNKRXA
         PYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955213; x=1784560013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKRuht4Zo9grMOtpWKiMvv6L6icfupPh6mIS6dQbZRs=;
        b=D/Wr08BnUSfmV21nxzDpyAJNWQAuol1NM2CB64gcI0X6/PC9l3OOmUXPniDF7ghOpB
         5Sm48kDagPwGccSa6gZLILAb9m9HOXVNk2UluDF0KE040EgF9xHQVWYu/VYdn/MXt6v/
         rqj8CfM92qlGKCQK+igcpgIPjPZouFd5358OSk4MvaYATAt/lqVfLyP6OoLV8A3ikeG6
         T5mnDGUUv7BLQFcUpqML1db6nxndDDUIr+yq2+z/KoLWblf1QW4DP2gt8sdDVhbmf1y+
         WYAEWRsuvy9yX4BYER3V+QS3r1LuyQv1Qin7nZYN+Q3OonWkcXDb1rodszSLXcXA3prZ
         SL8A==
X-Forwarded-Encrypted: i=1; AHgh+RoAIMVGJe8SDlfFvfaZSbQ7r2DWgRFrcAu32j1tqBGV+tWxWLjCp9Ery0f4mL3+79jyI9qN0X4X+XdXVTc7GTxe@lists.infradead.org
X-Gm-Message-State: AOJu0YzgL2IZEO0jmL7lCAQBrcUQk4ony15haSrYzrHinp+NMxhl1GhE
	//wBS7DND4f90SGT0KeqTB4MEOjWhttUiU2iklIghS0CvkTV9mHrsl93
X-Gm-Gg: AfdE7cn3vG5VdrrMy1n8QsTC1tHiwR9kYpNmSqIgdKwn4glkw/qd4rTh8/wegonezvz
	ee4LaUIqSCQC9vI/ufeZk4o/ljaLmcA/YXK8q4jhfHwr4H29ICcPKZUomYR9UsP/87+msLCETfH
	jEUSNrRIOcPBhVUTL6aBGDdzNDY3IelzL7q9etnWQ5jtZg1XSLd2mgynKJ74VUbFSszEMj3Lb0q
	FdtnByHFaQ8bMscl7zp+nWllq+TGtW2WZXNI5A18xZnslhQLwDZTBvrM3yFun82AxcM2pKFIVu0
	iA+iqOe0bOGxx63EfcDE4rg2YaeN6uYbfRlIXezpd9+BIgApgkXLUge6T+sZeOgJW0FL0sFBlI9
	QeG6kFEZXGOgmEZRcuHbT+k+lc5rVb3Yqit8ItfWZsjSzM+qbYFlQcPCaOCMrIjAVunP6yMUko+
	PhHgtpiqzWzNMFc82hBlOczcdJZaD9AbwgajjXt8aZgMj+vyczamWiK5ma6rYNyv+HL5LTX4c+N
	rgy+ks5hzwn6Lzaf+ongAFeKHM=
X-Received: by 2002:a7b:c447:0:b0:493:c548:87fb with SMTP id 5b1f17b1804b1-493f8834f07mr69080305e9.36.1783955212518;
        Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:22 +0200
Subject: [PATCH 1/8] arm64: dts: freescale: imx8mm-verdin: Add NAU8822
 Bridge Tied Load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-1-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160655_310743_28F553D8 
X-CRM114-Status: GOOD (  12.75  )
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
 .../boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 01d4ddfde098..f833e179ab3c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -176,6 +176,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
@@ -183,12 +184,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
+imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
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
2.43.0


