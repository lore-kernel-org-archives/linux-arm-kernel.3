Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5363C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYOnwGjU9FvWidAAprn3NnZ89m+Pt/3YnDA4zAbg1Tk=; b=jc23Bjkqw0kS9aUpRvmLCGQd0r
	P+Djq2PBgBZo8Uo23jVkF1W04JmmzMeXp41j5QBJmjnUv2xc+Iu9u36D9YrfkoPASyMDhM5ZFsYG1
	BC6S3WyTH10chE2QyZ9/lSbSlaGPwb1XcX0A2DQ/KStnWkccTV6bVykbAVDR00rDHSupfJG85MtLI
	q7gjlJVRN2w/Vr3ba6aUbsrqXP8tJdLkhliiodUmK9S5cuKEFv88aR0YNp2TtqmBV4nOWYLi5rOt6
	0+AYRBs/fysr3VOedTVB9nwSZDd5ICgUBR8AQYTNOdfUFHnZShWk9pA+DsV5+X/8n6oYdkFAfIRho
	9GdGsfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QKl-00000000XDB-3Nrb;
	Sun, 20 Sep 2026 22:48:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QKi-00000000XC6-1JlD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:48:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 173C543CFB;
	Sun, 20 Sep 2026 22:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD261F000FF;
	Sun, 20 Sep 2026 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789944508;
	bh=qYOnwGjU9FvWidAAprn3NnZ89m+Pt/3YnDA4zAbg1Tk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SntqHsBIDlBzy6c6nUvfeBGaHWTzuEH3BZj0lSx1cipCgIKWOkqS6Q6wcVqUv8hff
	 8GOX/DOyVFj5QwcZ67mOhARf5CjbjbcmD0rA4wOcvl0Q0NzIXGaleNWCX6Icp5H8Hp
	 6iLdHbgSZXC1u5FGhjOYFv1RJzTQKcOoVEdUJlpzw+kU55BbB+zko7WMQ0iCe0Hyzh
	 i5tpPMW8v83kZUr2qCe94Av52VM9ocLC/uNrSKqNt9Sld3BMtnljz7n58TqpM/MmjO
	 fidtbujq/yrPg9yJJRSbAEHJQzZk8uEmv+4BN4PxmAsXRKiCNmNsQWrMGjZYbX4R7A
	 p4I1w9U7JnEOg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:48:09 +0200
Subject: [PATCH v3 03/18] dt-bindings: arm: Add the actual power domains on
 U8500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ux500-power-domains-v7-1-v3-3-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


