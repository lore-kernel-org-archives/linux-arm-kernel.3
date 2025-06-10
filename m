Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DBFC71134
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrmmq6rgHplubUNFiw0xmTFpMEYkMb1SFr43ITy0Ej8=; b=4WCNgWhLz4b/GnuxGXmSCGrrfO
	sKvzj8SwOzKgyw4oK+4DM5b5YzBZDgvMiUziZsk4gfXgEJWullVN0FZR6SFrLLOAy2KBQR5dTQSMu
	2v8fywknY8oyKUnI1R5SlWEuMeq56lVA9MkPop32jUGBu8L+hpVVU+kfkak5/AljM8cibn51Zv808
	IbTAipt36DcJ4K/zrnaMRE0L9dyaaZwjU1Cx48qyf9+SCoLd9zqMTJk1VlwtnippBWpQVXQ6kXVlC
	NSQdh96sbwZhsDx/K3tzAF1bnSTTwPUWFEWQ7eoKLZp8Up4w1LvpglajW2Tpg385bWpZljUGMOl08
	H8OqC72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l3-00000008EWH-0s2r;
	Tue, 10 Jun 2025 22:47:53 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Qm-00000007P47-1hMq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:02:33 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f71831abso5319715f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571350; x=1750176150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrmmq6rgHplubUNFiw0xmTFpMEYkMb1SFr43ITy0Ej8=;
        b=OtKP7jRbqcpGllXCr+aja5BHL1VTeXXo3GQ8Mp6cOh4fY9GhGd5fWqdk7N9NwkQ5rt
         gX5GCaNviJWeJznv2t2aGP1Dscnx/ENbcacZ5qYGoEJMKgEP1wwuuUWnUr3LOIzo+WT4
         ER9R+ZIQIJoa8ZPJtxwwp+pXNYwCKK4GjaIkhiI7UkdDtdgiATwSMXoi0fu5z+gMzBFD
         BK3pF9GDcz4cHKWG/ffhVgKEo0PWuWYfr2PdcPEOtP3HQ+5PKayBYYTZ9qbeiUaQHTcB
         hwIh9TRRUDofsSHF6RmG+r4beQOzalpwVhY+CMDf+xOPGYRgp03N5Iy1r3TY+B7XIJQ8
         mZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571350; x=1750176150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrmmq6rgHplubUNFiw0xmTFpMEYkMb1SFr43ITy0Ej8=;
        b=clys2oIAHrdDDyqHgdQdeLi4Frw/e5NGH5zbSyXEIgTtC4ZGOh9CI0y3k1fU4BZh3c
         /LZ40dqNy43NT9P0Ms2loyakAt/YSvTPs1NseFsjkhXqh035cVOlP9EEnIXuQ99PDpe9
         mpXVkZ3bwNNGkSuLpWKCAUz3pGJQDFT+Y7ll52reOp3/UcCT0oeo9AWwj81RSlL8ihwZ
         5S7dWEu288R0CRynBVYNw+5MXqBNwBvt5yWAyMbwZM/1zuhqS6gd+j52qPCu6ElIi5Dc
         ytzueTMVgCMxQow2ePT7OniSFyJb8oV6DfG7+tpGo4Cqwy7+wcGyXgm8TmEnXN8gNSG5
         o9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9JBUQuiPTTZENNQeGFHrM4HAj/Kt3hkVmztt3W7e+nV8oOctnUH5bUbJyt+ISCvm90aTJ7jnuDvJ4hWBJor2+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6UbsCxhioGjXJuYBm4hh5UMVGQCcopH4D/aO+DuIssZn4n9Bu
	ad/G57MSYiU1iJI16ocQAVzsH1pBI04AFb7XzlOgO/nzOYCzOMpXpyrC
X-Gm-Gg: ASbGncu4I6bowDxm/GVpVI6QOp++EFPYQ9yUj0u1ygq1YDpZ6KentcmcfuzpZLX/6oa
	r66YH8KqsT8FI1y9kJBJB4F0FkISVlICu0A7PAgMJ2/WudwkBHcbQv3O+Tw/J2lLaFPznATqN5j
	lnu3m9HRbI1c9w9ETtni9ajEpM6oIrP9OjWFuXJSdYAjimFci5jfYYcP7P+Acl33u3JXd7zEpN1
	pjt/o1E4s1op9rgrBypw3MbE8E09oqRLz7q9bVEGAP9WWQdi9qZsZSqpHy0Umx7iGgecmciJww4
	wmEY3wbrx/d8P9nf8FTNGhXt00tQ5q32ITaB0oAjdJT11FD0CtR45hn/dcIo4ZW+HbZeySjWhc9
	TLCXAC1EvIs3QWlkOUft8wTo=
X-Google-Smtp-Source: AGHT+IHhY/k+f9IJHPIEjy9iyBzhgiJ5RVh5n83hNt9ZBYYDAnqAlzarCsi43dgG5BIjB8S0cXPlDg==
X-Received: by 2002:a05:6000:4023:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a531ab6dd4mr11951972f8f.42.1749571350236;
        Tue, 10 Jun 2025 09:02:30 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:29 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue, 10 Jun 2025 12:01:51 -0400
Message-Id: <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_090232_441628_BE492D46 
X-CRM114-Status: GOOD (  15.18  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add header file with AIPSTZ-related definitions: consumer types,
master/peripheral configuration bits, and master ID definitions.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..6481c484ca37
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX8MP_AIPSTZ_MASTER		0x0
+#define IMX8MP_AIPSTZ_PERIPH		0x1
+
+/* master configuration options */
+#define IMX8MP_AIPSTZ_MPL		(1 << 0)
+#define IMX8MP_AIPSTZ_MTW		(1 << 1)
+#define IMX8MP_AIPSTZ_MTR		(1 << 2)
+#define IMX8MP_AIPSTZ_MBW		(1 << 3)
+
+/* peripheral configuration options */
+#define IMX8MP_AIPSTZ_TP		(1 << 0)
+#define IMX8MP_AIPSTZ_WP		(1 << 1)
+#define IMX8MP_AIPSTZ_SP		(1 << 2)
+#define IMX8MP_AIPSTZ_BW		(1 << 3)
+
+/* master ID definitions */
+#define IMX8MP_AIPSTZ_EDMA		0 /* AUDIOMIX EDMA */
+#define IMX8MP_AIPSTZ_CA53		1 /* Cortex-A53 cluster */
+#define IMX8MP_AIPSTZ_SDMA2		3 /* AUDIOMIX SDMA2 */
+#define IMX8MP_AIPSTZ_SDMA3		3 /* AUDIOMIX SDMA3 */
+#define IMX8MP_AIPSTZ_HIFI4		5 /* HIFI4 DSP */
+#define IMX8MP_AIPSTZ_CM7		6 /* Cortex-M7 */
+
+#endif /* __IMX8MP_AIPSTZ_H */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 307e1671eccf..9b550f225856 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
-- 
2.34.1


