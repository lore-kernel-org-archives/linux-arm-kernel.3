Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7456AECD6E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wNO6bVNJCn/Dz1MOj6U0INT3b54Rjg4i250hi3XxYk=; b=fGcictdtZXMVKFB/EYCCLF9S2G
	1VpB/gtIO3hMkF9V0IUBdzSQTo9/MtY7o66XLok8swJMT22HRc0C+xIj65ZgyAzb+qqHpDG+0E97r
	HVa4AxtD46ENkYzlW6QTT0ggrHOuzkYcn3TcdRrlRXxgOE0YQnkvOj/OfRHHiGOReP2996Pf9Mlo+
	oZd2OzShwpVn0BxE57d3ei3VL/bS8fPIWQIQoSplv26BmlkXZH6uwQOvufkJ98iaJSd2/d71v5Nug
	bWhATf3D5ltliI1C67TDTAUOoxavN2OE4+wsYK9ZNVKFQTQu1nTJN9lUhde66MySl6XfiNtKnhSmk
	WYiYTRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXg-00000000xSo-46Pb;
	Wed, 11 Feb 2026 19:06:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXe-00000000xPu-0yZG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-437711e9195so2682087f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836784; x=1771441584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wNO6bVNJCn/Dz1MOj6U0INT3b54Rjg4i250hi3XxYk=;
        b=d2q1qDqyr66YhHno9vALnvSBB36M4sSORbodvr0zwn9SVcqn+7YquG8Hqqgx3se9TT
         hPjkua1JWRtf8J7eDZlD+0Wr8hhFN3Vq//0SDLiAwzA3xwtC6gtpK3S17i6vgggYw/o7
         dqfMteAQs6k2ugR36ylUh+bx+Vk0Syuz/P530+drlSSmE/BurjMJ3kxs2ORJ7GP/bGWP
         XS+Nmj7izC4od/9LgSOTovtoBUwLpxN9oShIqcqJRZkbt7TZp0hFzyKYoT/Q8uxKbCnA
         Js0L/hVcBd1mkcEii+tfbhD53MJuqRQi3zQlM/xk2s1W+CYWCNvBDIGSSc6h2dQ1K4Lu
         n1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836784; x=1771441584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wNO6bVNJCn/Dz1MOj6U0INT3b54Rjg4i250hi3XxYk=;
        b=IfAA1SaVz9vAUO1uBmNA5PXHlBhrgXGza48JlHnxRFZrzGWnX/HfhzZbGL0+fcEB7S
         YzGpIKO1OR34CQagIVnRlkvQEoJbM6zwHqLL0I8Nzw87Obytze2DpUokBLT053hURMqV
         aOAhCZDf+yu6NCtdFQnHZdP9LzzueGzj1um0Okis1a6jEhwGv4uXO3+rjVmaCF0Ljhor
         OGfpeHF0p0AuLaK4jAD7z/KS0ZS873aCHi0kpqb11Thddy04uxyEhtXSR+o3YU7QFFzE
         47NHdMfcSADM0r1Wa21JAcgLajN6JosXtIEEy4ymG8aQ/j0I+1AiuFE3d9DTCEt/RBx1
         0PHA==
X-Forwarded-Encrypted: i=1; AJvYcCUxTLwRLUtef6d7+KRdlZjUlOrOc3VhjpaZIULrwSl6e4h19t4l/6Ms++q2UCmc9T1Wk6BQlA0dBNZEGjQfB/fz@lists.infradead.org
X-Gm-Message-State: AOJu0YzX64jVEheIUwzZOiMK+ZaiNweTapDACX4ozizAq9gH/WioVw4H
	fcLKNGZUBNKP7EHiZjeoZ2L+KSSccnce0tKrRoGMOoHTyyxKPaJkR8GP
X-Gm-Gg: AZuq6aJHTmozgcUCcud4JHDBmwn0d3l2VXjH+chRFXnoqmoxJpWw59m+NcJbS+ldVc9
	PCtREP8xgIvmt2CVXZ3YkLIfmjhUudtFoeaiqbQbatVW2ULWqi6fsZvqC2zYZHR2W2dNy+XnBvk
	opd7CPIJ03MA1QZiUvEJyaQeLHuFoWJ/cH4GDgRnO6UjIRBNJD7wOxwJiPVAMZ/LMn2tRWR+DhJ
	BAO2fxbELrsCmWMRa2kzeuLapyY6be6buhGZ/1DILPhf4X6Xbk7vrfSYCbLBGZrcTDupAbpf9Lw
	eR4XMOxukxkmFT8xXF8NKkIjjo37mnf+fXv48F2jj+QTpHKRVgx1CXBtALt3Qh6Qyp4+pqpuzET
	Jl8wlhFasfYYFwZ5UKuNIy1nn8RYRwMh7YurumJSTzirqtSjXJ+a6KLZoWuKRXPRbBQYkVPc8n4
	cPgx6y2icrpJInUnlTyMA=
X-Received: by 2002:a5d:5885:0:b0:437:719d:a740 with SMTP id ffacd0b85a97d-4378acabd4dmr760888f8f.49.1770836784090;
        Wed, 11 Feb 2026 11:06:24 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:23 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/7] dt-bindings: mediatek: Add reset controller constants for mt8167
Date: Wed, 11 Feb 2026 19:03:23 +0000
Message-ID: <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110626_293535_31C78ED0 
X-CRM114-Status: GOOD (  17.09  )
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

This file comes from the Lenovo Smart Clock kernel sources.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 include/dt-bindings/reset/mt8167-resets.h | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8167-resets.h

diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
new file mode 100644
index 000000000000..f77c2ca897cf
--- /dev/null
+++ b/include/dt-bindings/reset/mt8167-resets.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2015 MediaTek Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
+
+/* TOPRGU resets */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0 /* reset ddrphy and flash pad macro */
+#define MT8167_TOPRGU_AUD_PAD_RST		1 /* Write 1 to reset audio_tdm_in_pad,audio_tdm_pad,audio_fifo */
+#define MT8167_TOPRGU_MM_RST			2 /* Write 1 to reset MMSYS */
+#define MT8167_TOPRGU_MFG_RST			3 /* Write 1 to reset MFG */
+#define MT8167_TOPRGU_MDSYS_RST			4 /* Write 1 to reset INFRA_AO */
+#define MT8167_TOPRGU_CONN_RST			5 /* Write 1 to reset CONNSYS WDT reset */
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6 /* Write 1 to reset MM and its related pad macro(DPI,MIPI_CFG,MIPI_TX) */
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7 /* Write 1 to reset digi_mipi_tx */
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8 /* Write 1 to reset SPI_PAD_MACRO */
+#define MT8167_TOPRGU_APMIXED_RST		10 /* Write 1 to reset APMIXEDSYS */
+#define MT8167_TOPRGU_VDEC_RST			11 /* Write 1 to reset VDEC module */
+#define MT8167_TOPRGU_CONN_MCU_RST		12 /* Write 1 to reset CONNSYS */
+#define MT8167_TOPRGU_EFUSE_RST			13 /* Write 1 to reset efuse */
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14 /* Write 1 to reset pwrap_spictl module */
+#define MT8167_TOPRGU_SW_RST_NUM		15
+
+/* MMSYS resets */
+#define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */
-- 
2.43.0


