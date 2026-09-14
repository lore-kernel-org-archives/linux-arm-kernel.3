Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074A9C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOCsjRkBypCPyH2YlnwYvNyuwyphb2mRtG01Ff9alSU=; b=Ogw5J2Fxe5aXdIIAXwo+TwOonf
	LVrS+Ucfl4blG4pkgjCER+ytv5uHc4TUs74i1Zj/Cly6OcnWURmZgPrqf5Rm9zB0ui+ryBbyhmbR4
	b8XUVL3gxQJyXf5GNvF0nU7VCpizF0YRgSFgN6MVc91dGGP6CuFj28yrKbAMBzm8O+ic/AsJBk4mg
	FHXDCYM1jfRgi4w4vnzGGb57IZ8SyaIxvKgQfpSRjjaLrOXIBVvEj7v39zeF4+TPBlyJ8uZm8u5sb
	JtwVw3jV/i5UC6Y/gGLyWF4u6awNfW/XvLi/AJoqr1m0T/Ql4U5s3TTh6AYRf+Xjbed4OVeyszCbm
	dYxUBtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65H7-00000003Oer-2DQ8;
	Mon, 14 Sep 2026 11:55:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Gs-00000003OYl-0DBB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:54:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EBAE40C0B;
	Mon, 14 Sep 2026 11:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A781F00893;
	Mon, 14 Sep 2026 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386889;
	bh=KOCsjRkBypCPyH2YlnwYvNyuwyphb2mRtG01Ff9alSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LP0ELdhJykW6OYeigGpKRCelEZ1nEfq9pwY2OFrFr93/JfWPot9NNyFZ7JW8bvubj
	 hmPHk9Mu+GJudg1+6Ycev3LPViRMHEYNiab2QvXdGZL8U3KSB1vRR1yFpVcE5icxRZ
	 qMsdwx3hMK72qv0nD79OO7ZL1rM2pRWpQjti9DxS9KttTrZ9CRDAhXzYkGE3ckSrAp
	 XMCRVV9ehrygpGMfB/p9/Az+bTsP7iyHUOJ6JCctAtwlF+xtloPgpr9IJ8aG/PKnw3
	 wzP7STjlzsQmameSbll1H6Aks0uZYvBrUeUuZu0R7iohjd4ZdyglPD+x+RT+bvFL1V
	 mKjE/5LlHPxHQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:31 +0200
Subject: [PATCH v2 03/20] dt-bindings: arm: Add the actual power domains on
 U8500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-3-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
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
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
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

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 include/dt-bindings/arm/ux500_pm_domains.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/dt-bindings/arm/ux500_pm_domains.h b/include/dt-bindings/arm/ux500_pm_domains.h
index 9d94801d8b89..f7a9fc101fb2 100644
--- a/include/dt-bindings/arm/ux500_pm_domains.h
+++ b/include/dt-bindings/arm/ux500_pm_domains.h
@@ -8,6 +8,21 @@
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
 
 
 #endif

-- 
2.55.0


