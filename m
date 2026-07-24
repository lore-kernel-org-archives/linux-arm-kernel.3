Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A44CC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kaqe66R3qWhJ5/dzgdJ4AaH835aC7AWww7mcN/p7sJY=; b=BxRXbaczYNXnHg+/oQY/2gxX9z
	aAFSeHpV8pM1mUC9uItwxx8kAfnExoLJn8S4yjYGM01FBFxUUgN0Y8NVLhgAzvMCT8g5xxIYv+mTW
	u+2qYqVr2GG+GQpqfGECtXvcktlLHxdeMKyIVptfAynSQmxZVCBuYqi1ZPFX3T+9IU3pg1k/PT3cQ
	MpO698BOROb8N8NiqoTmGJj1SKnZ9tV2LHNnid1P31MNjasuINQphT/hZQPCgRPN+UKK/FDMKxW7R
	WUlO4IO/nDKDcfcAAKsFebOFtSn9anqsGFnaJEptGZfOOdSMotrqZJ/Y5y5Tqgi6DKMNkNnyf1ma/
	V0kA32Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhf-0000000GpZe-1SPG;
	Fri, 24 Jul 2026 16:24:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhW-0000000GpVc-2mFi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:24:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4955de8797cso4865135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910281; x=1785515081; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kaqe66R3qWhJ5/dzgdJ4AaH835aC7AWww7mcN/p7sJY=;
        b=VopHos7fhY2y45JICSSUMf3GH5TpsZAeQt9Y4CEQybeGXuNawXn1FKpsq8OCG+8Rkf
         8/Q2qSBRAl2kwPiVWa0GwdhZQyf2lLRAEIrORJt1ORJ29WIxogmWYSkd+lg17iHXt4xR
         JjHfowCO5P/i05XM9Zup/cnkYtNZui8e7oAJAlyaIi0FeToknhvT6OeNJ2VBmdXrsPhS
         1cIT8rtYRdlwP7gYZq6OczbmBFxCG50aokyfCL+V12W/SDHaGcIh9QmLL7653RG19wcq
         YyTFmVPTJZl3FNV+2mjqk4MdpnWfof/393+I3Ujeewh4/cPhddpX5WyM4hSFsVMm0hcL
         DJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910281; x=1785515081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kaqe66R3qWhJ5/dzgdJ4AaH835aC7AWww7mcN/p7sJY=;
        b=bSd4drR/isXS3lHnRoxSZe6vN2PdrrTmSWLw7yWZ5n++WxrD36/hYKPDJk5fBm4zJ0
         F/GsHjEbgDvteeHi8eyJES0NJnqc4xNlZgHBhd35A57Pzk68VXy0AzD+3a5AcrepaP+Q
         l2IOP9Eu8ExWV5DhHtUMn0cwf16wHXBz6eDzewOlcd9LVEWx6RJFvtmZbSboGYLpxxY/
         xeiX4/as47KTxzMUuQRQDkPrnN9N/i+fCCJF1pVhW1+HS9RdVTO6nVjQ38/x46NOIh5Z
         jteMNK7B+Ri3ns+86c5zvvYxbGtxH0GpeJbxNUN6QiQAbQgTUSA2OUox9DKaNR/G/F/L
         8OJg==
X-Forwarded-Encrypted: i=1; AHgh+RqaBoFpi1MY71CLygaM3mOrJdspeqgfdas2XRvNV0maHVopCPW+o6+i89yMud9l9yxY6v3Sp5cfffA6PGrSao/C@lists.infradead.org
X-Gm-Message-State: AOJu0Yyspc8+O23hlbCG9Y0zu7rNExvWYrhvob+Rdyl8rOOMnhK/Dluf
	TwxzTh8e1SQoL624xSwEtdeU3rQilA8b+QVz2tbvF+WpkMwI5MyRYzJS
X-Gm-Gg: AR+sD13qUmfPDHEvOe2BXad/kNhMvSWMGurW7uqVspsW9MCNuLFAwPqxVdr6vswMgJN
	7hKzlAGIsGPpcOnRxyRQWeCcIuxdkRYVgQbd3gkQmD1HylMfTCjHtkQVXpoPc88QvDZOlZ/ufw7
	HaB/6o8wY50W/DltAd8JkQPehEmu6ZEV2hAGeySgIRWnLWDspfLxWM/U3lUoJCFFHmjaiDj57z+
	015ZsCz632KHi2AdFbpBM8FZpdym3wcfncdLe+CQxqD5tZJ2EFpcfgXs1KQJXWVgpzc4vfhaW+D
	WHrj1OvcleDUomZ7goe9WcsxLbhpcjQH5871bWG9hO4lKgO/+3rHaxm6NtU5nLllXjarSbtnoxo
	gjgtU/jKbWvT4O1NmY3WWcazLda48FxConwjfEpjOfDx5xtGX2wgcwN+fNVDxCmpAmAAft3c7LD
	sXh5D0jnUx+z1gfvjygFxtZkG6TKt/6IIAiYNQpY0FBiABKzJ1l00z4st5iYYommy0ZXow2dUmv
	TfLog==
X-Received: by 2002:a05:600c:4f44:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-49573c8d564mr98485145e9.3.1784910280700;
        Fri, 24 Jul 2026 09:24:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:27 +0200
Subject: [PATCH v2 1/7] arm64: dts: freescale: imx8mm-verdin: Add NAU8822
 Bridge Tied Load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-1-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_092442_725750_85C285EF 
X-CRM114-Status: GOOD (  12.50  )
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
index d5c2dc720197..dcc0464b4e80 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -177,6 +177,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
@@ -184,12 +185,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
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


