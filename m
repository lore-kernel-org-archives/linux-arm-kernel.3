Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A63CE8D43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6d2YBVRAxsxtD7aavxLd6mWyhAION966pctRhNP1ms=; b=LhAK5ZFfF60nzs5fVHmE2XYjst
	NDeDKpXvs9kkfHxl2G+quYS0/OH0F+E/bZwfyKUYndCtRvJlDn6sxAFH2VIaIjB/W+uAYEEMkD0+3
	/+LN3Am/GjXMwcCtdO/l+OgYipw2kkyXl5/J/BGIi9cPmPE4dLK8MPAIBqcIqBlJ1Yy6+SuJQ9ePr
	JG1b8GLiyZnc9fn5EsLsIugFW/d8xSB8M6V979pORgryYwyq5Sz17eDETGsqtCsy/j8x1SAxHQh7t
	lIrXmZHVDhss5Pvi5ZehnbV9YzWj/LBMsPyqZlYn5xrRZjcDdD5JtPFkMoVDrBhAsUM7TkUE3QLx5
	Rw3aCc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvbF-0000000CWLR-1S5W;
	Fri, 14 Nov 2025 15:20:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvbA-0000000CWFV-116g;
	Fri, 14 Nov 2025 15:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=m6d2YBVRAxsxtD7aavxLd6mWyhAION966pctRhNP1ms=; b=onVPbVE5DkIkF8ICd3BJWnrO/d
	j8XxhNhyoeedXPTXnDHpM4U5SN0GSJXqFc/QCorIOg3MMyoJhIHipL7+/liThhQnAHoIPrnc8B4L+
	1O2FAWp6xz4ORSJHjChraz8F9EkNk0JGlaumT0qpBJ8p4FhO27xt6rkZxJzBYnKri7Q/XTMtsLYXy
	VxnnN66F6EDzSIR/FA7nzeDZbH0AhTdX0rB0hRikvoliWzm4aN1UCmCfqqE5yezGuHccCq44Ar5fL
	q4zo4xQCcxmi4S2yACJJygUrjeE3G5OBtsQ/Q3YdaNs07xsxaI+jtCdVHZfuQ7xI9JSFzC/SvIFBk
	SKqyLZDg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJujQ-00000002ndu-3fdj;
	Fri, 14 Nov 2025 14:25:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3950343C33;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE15FC4CEF8;
	Fri, 14 Nov 2025 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133620;
	bh=rtJkcFLFc1knvqExD8Pr/+VubLNDMv/tDbYdwMGF14s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J7NFc4Yyn/swMlV5tdQe49rvyHbSNNDpj9Xeit+RnxxiQH6Rssi/CnMnyLjRyZgsp
	 rVE0Ak0prko9SwAGPhz9NFX6rpGPbIUM5cWpxcRpTRP0Lf922ew5VGPt0MGXgFxuHF
	 /SfdYaHBDcUe8EtGxdGTUiJ1D7LUi/E+nmjWyCVrhBCaG0AeiJ0oLGvjvRcOPXe5SK
	 Pm/QJMDz52N5Sz04Xz8C3IhfAAJgAJF/DhI0IpBMluJXEFbRV0SERYCrBp29DVQite
	 lHEVJRNhkMu4HBWdrHfS07jsjY60FYDPdZRqHNNIXYHGbBy9KQhG7rMqtvSRsV0Y2D
	 dRIOKEdWA2MfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B88CE8D40;
	Fri, 14 Nov 2025 15:20:19 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 14 Nov 2025 16:20:13 +0100
Subject: [PATCH v15 02/14] media: dt-bindings: video-interfaces: add
 defines for sampling modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v15-2-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763133617; l=1070;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=i0G3bjQUxPWSrwDi2kbON/7nXKFuVdlWiYyEBIeG7YY=;
 b=FEHaSk1PIArT1EGJtvOkdAjeayF31//VdjN6qurt+Wg6fMxwQlvw1u+zXDSZXD6qxpK1/ot5A
 EN9R6q1+sDrCcgH/oLObU+xd/jKbd6iw0/amM6811QvlY72UHMfqDv9
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_142457_330943_766F83F7 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 include/dt-bindings/media/video-interfaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 88b9d05d8075..0b19c9b2e627 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -20,4 +20,8 @@
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
 
+#define MEDIA_PCLK_SAMPLE_FALLING_EDGE		0
+#define MEDIA_PCLK_SAMPLE_RISING_EDGE		1
+#define MEDIA_PCLK_SAMPLE_DUAL_EDGE		2
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
2.39.5



