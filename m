Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8784ACD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 05:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02Y1pCsb2IfbXGeGoPoXW5OadRTKcmJFhbHDQeWin5E=; b=orLhWvVDikUunNUx1UUSpAcBnl
	a3vdg+Cbg3PCL7PycR4XVLR3eKP+kdcpvi3ShDBK118bpQ9iKQa7TcDa7lSXElApoI4JFSJro4q/H
	srxIs3yi1S+qmOxi+Zt4F0XLXPvCTlVru/QFMOWc1JB2xxNVx0qjQD8FpYbL15kpjwxw35tmc8BVi
	WGeu0Q2jXVeUB8kKJlkVD5qWyBLBjbXf7cK8ur2g1Sd0rUm9p6HbP1pKDw5Ex/ziKHLfXJ0tY/n3E
	CQW5tA+WiY4aWFLD0L5M1utH5N7GrmNUNFOLHyQHWGlZChnkojwuBGojSAum2BJaQkT7UW3dnPIZ/
	dAWyQEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4sB-00000000dH6-0JTy;
	Thu, 18 Jun 2026 05:01:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4sA-00000000dGr-18Sh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 05:01:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EC4D43369;
	Thu, 18 Jun 2026 05:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F3F1F000E9;
	Thu, 18 Jun 2026 05:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781758861;
	bh=02Y1pCsb2IfbXGeGoPoXW5OadRTKcmJFhbHDQeWin5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ia84VKjk/kDlkHMweHZPDCi200y3A+c0Wm9ojt2P5+3R4wj3M5vYOck22KHQ4sDUD
	 WeMCrLODF3vmTkvY2Ve9j6rkpdW19ldLQfRf0B1TZO83de9keFKX45j7msdzi8/Uqk
	 14PM5ZeQKccVG3NlOWAQF5tQtp3YQrWVNP+fjlUATBoPQGwHyC4Lkml1rUUvKi+4Ea
	 hVLBHB/fFElJtSyXnypa9d4F7eF+tb/o7MnGv5JDMq8bnSBYxmzRPIAKGRO4gcYfw3
	 6qu8+Jb+SE9X8iUsXVmuebvER0N2Ynn+D6xVUhU08hm/8fZPv9CSWK9R3Jc0AQHpCo
	 2R4Yt4bPHKKCA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 07:00:48 +0200
Subject: [PATCH 02/11] dt-bindings: Add the actual power domains on U8500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-ux500-power-domains-v7-1-v1-2-eb5e50b1a588@kernel.org>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This file has been left in an unfinished state just defining
the root power domain for the U8500 SoC. Fix it up by adding
the actual existing power domains in this SoC.

The PRCMU code and old regulator driver is mentioning some
*_RET domains, this means "retention" and is a state in the
domain and not a domain of its own.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/dt-bindings/arm/ux500_pm_domains.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/arm/ux500_pm_domains.h b/include/dt-bindings/arm/ux500_pm_domains.h
index 9bd764f0c9e6..1c168e59ac90 100644
--- a/include/dt-bindings/arm/ux500_pm_domains.h
+++ b/include/dt-bindings/arm/ux500_pm_domains.h
@@ -8,8 +8,23 @@
 #define _DT_BINDINGS_ARM_UX500_PM_DOMAINS_H
 
 #define DOMAIN_VAPE		0
+#define DOMAIN_VARM		1
+#define DOMAIN_VMODEM		2
+#define DOMAIN_VPLL		3
+#define DOMAIN_VSMPS1		4
+#define DOMAIN_VSMPS2		5
+#define DOMAIN_VSMPS3		6
+#define DOMAIN_VRF1		7
+#define DOMAIN_SVA_MMDSP	8
+#define DOMAIN_SVA_PIPE		9
+#define DOMAIN_SIA_MMDSP	10
+#define DOMAIN_SIA_PIPE		11
+#define DOMAIN_SGA		12
+#define DOMAIN_B2R2_MCDE	13
+#define DOMAIN_ESRAM_12		14
+#define DOMAIN_ESRAM_34		15
 
 /* Number of PM domains. */
-#define NR_DOMAINS		(DOMAIN_VAPE + 1)
+#define NR_DOMAINS		(DOMAIN_ESRAM_34 + 1)
 
 #endif

-- 
2.54.0


