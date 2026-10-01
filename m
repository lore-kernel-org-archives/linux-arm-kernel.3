Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C0ACA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYv6IEPxUFfI2Bv/5OKmlmckPiL2KI+pvDoljGGq1Wo=; b=dOXKxO7Nyeure32Qi5gPjD4uz/
	Ryc3kHLN6aVD3N9MTYWBbpiqsS+OL1tjgP4V4zLHnqfXkuuOqx4tWUAcDGOas7uSXXq/XhnN4fg4C
	EPQ2rEVmLILUGRsxlPZO817ywCqLh/Fjwys5F1L1jhSnNu66gYSIHQmhuNlW+Z+TVOQftQQDKX7S0
	MaY2WwfS/KCBeEJhAecYRu9AZegOKOv3e61ScrLbdgAcLVm0i3cZPwStE7mBsa+yMOJVhS45c8QQn
	1+bsH4Ws/jRDsg8LwdGs7viq/PRVvH2F7bYp0f6eW0ebx8rEYnE+RRkzB4FmSbFaWC4TY7zcFb3kP
	i+LujfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7N-00000009bYV-3Kqs;
	Thu, 01 Oct 2026 15:54:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7H-00000009bSG-49mQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 15:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gYv6IEPxUFfI2Bv/5OKmlmckPiL2KI+pvDoljGGq1Wo=; b=TxATXnOSqVtCpexMMwMGlIFKUd
	p8weNyUj/8IDbRGxd2oaOWS5uPPkBh2XChx4D375WFXAJ+GiYPEk3XQOuBtAE0vZ+NBfcHSJ8MkPw
	54OfURvK9cyIMeknuKIKbxCmSiI98MWLEcdpApQKX2ZDUiKcWw5fSAH/gGq+O9vgVerZ+lHXCHqpu
	cCmk/LyzckhBKo+13rdkXlXbjC5BIy091aYRGuMJgKHxSw1OWPB1+Uid6AX4Ebf5S1HVbfc8pDS/O
	r7ICNPnGKaTIxZkljc13qrQ70ZpqoIITqJuiRyT8pzM2y1/j9j6k+SOYyR+cajqwqYQMfzJ6vy1JM
	4HlQUxjA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCJ7E-00000005ANc-0KYl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:38 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so4168168f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870074; x=1791474874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYv6IEPxUFfI2Bv/5OKmlmckPiL2KI+pvDoljGGq1Wo=;
        b=AfweCC6GqGCg4Ztwjx8o+stx/sqdrGAO5CRZdups3TiI0tbeL34JMEam+odUvnW1gW
         xSzgXBvghHh2TZeulGBua1ssJoVblXVgHS1to+u83tUB35s/Gc+bHF94oGyBC66IZhPc
         oScUhaO6wWUD8AdK6rKpFk0/lJoIh0jZVRey8Duj7Sv6AOp21GyLm4MeNH7L0xT8jUYK
         6f2ezT9PtI5xRKRHv+m7vPfn3RHjOAP7erSA/+YvUDK8yKHa5rO4FACrxzApcbzferh1
         3dBWjNLm9Y3zB3O0PO50jfBQ9naO1hffVf5uYPRQuJtM1w305ugzUoGU8sEsEGG4siVX
         e2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870074; x=1791474874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gYv6IEPxUFfI2Bv/5OKmlmckPiL2KI+pvDoljGGq1Wo=;
        b=AncbgDar8NjBa6853h0ybBimIEV06NgpBlp9a0T4JwLZiy3udOp1QERciUI5/Etotf
         3wS02dCNeuVWldY0h0ol1oAKLF0tX/hmIvAoF/d8/vinBOZk9KLL+YBOHukGy6u3+CQC
         uFDrN8ReWC7bg9HQwsRGbu90RXBErV9f2Z9mpudPWv5tNY+jqEfH4/UpBWYIleKgXSmv
         vJbr9Npoa7w5KOMCNmVZRqpqvB5BWs+cEUejlh3bXze0HvyBRirq/kuYNPbbgNIDjqW+
         7v/RJPJRpajHYe4D4n1Jdspy6yssMn+fg39FZzmFFB0ggwuxBzi5L/HTHWgdPDB63zFI
         tbRw==
X-Forwarded-Encrypted: i=1; AKwUvBwpDm0hqNLmGRJVANWaWpcqh8fZQH9peb/SDjRaQRmeqYgvHB1fC7+a/FYyLT5UdLNnM4wgr87oxRqrrDYbu4T0@lists.infradead.org
X-Gm-Message-State: AFq9FYKHe3r5R6SNO4vjpwWLooao8ACu4k2V5XQSncCTMVyqQgaDtPfy
	//qC/pP9kgIbB54VgwK7uo6pOvBY5uRHokbV7guZIWMY9eyya/IADQMY
X-Gm-Gg: AYBFou01jCCU1Yc1+YEa8u3B7QKbIYCQU2Rm4O65COuftP5+JvCs2/EEsdbTdzEnqW+
	S0dL0LKAgOCbxXvpD08Q8iCPb6hxGdfnc1AJQ2y6By+CizF4w35fE9Y8IaAfwGuHRObhXuo65l0
	056BR1s0bdFxCxHysmV6+ustYz6fgfPvERWjvRTQPppyLzrCE5Kd/rBOD4qaUnfezeks42LWX6l
	rD3Qz/eFuR+LZeVI7XjoKAW9WCHP/Gfg1S8KhQ6dwxxWett0+VUDuJgXxU2s8ZI53hEfSnwTxrR
	IXPJpyMCLQmOR4EPSnbZJfrVszteA1Mu6P8wgOqEx+koF7rfL8X70YCPpIGauvdKoYbtQluLiPO
	GKCYosjerrHX5YYKYL462nnCzmNGU2djgh9S0+yyTpH2Z3HCPVFcAylD+AzpZXzInrMcxbmQRA3
	pXkhJFEDR/A/SWO1ElcUTPw5YwXb2rSA0LR3/1OtOuohkFr0316A96e5rSqB++A+Nj92y02sBJa
	8yhS1U5oXGtQfnY/W9eOTFJWi7a2mksWCP3WXHEw+thNh7LoJnuXrHeNFh4PzErIQ==
X-Received: by 2002:a5d:6f10:0:b0:484:3310:710c with SMTP id ffacd0b85a97d-48b12741278mr19738f8f.24.1790870074388;
        Thu, 01 Oct 2026 08:54:34 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:34 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
Date: Thu,  1 Oct 2026 12:52:56 -0300
Message-ID: <20261001155412.3177428-7-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_165436_528666_03EDE713 
X-CRM114-Status: GOOD (  16.62  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Apalis iMX6.

The overlay is also combined with the Apalis iMX6 V1.2 Evaluation Board
V1.2 device tree to provide a ready-to-use DTB. The codec and its routing
are already described by the carrier device tree.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                |  6 ++++++
 .../imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 +++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cd1b095ce06f4..cb2ad0756e7fe 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -87,6 +87,10 @@ imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-eval-v1.2-nau8822-btl-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo
+
 imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-hdmi.dtbo
@@ -238,6 +242,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
 	imx6q-apalis-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-eval-v1.2-nau8822-btl.dtbo \
 	imx6q-apalis-hdmi.dtbo \
 	imx6q-apalis-ixora.dtb \
 	imx6q-apalis-ixora-hdmi.dtb \
@@ -252,6 +257,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
 	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-nau8822-btl.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
 	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 0000000000000..b2f9c43d29cd2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
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

