Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D00E63C9C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ki8yutJ6J7/iU6VRFPZXytmgyP3XS2kOORqhMGSoRJ8=; b=v4/IqQ2Far8o2BW5zErpyHE4qA
	WXretETu0b56hJSBKNouWoP6kAzHQ/AS0DZhV7bnBreWMVt1pz5yWagLpBx5EdQJYw1hPHKVfZsvO
	fKCObyjhEZ+wBe9Pw3iU36rlMn+yRmakZUdmnfmthYr8dXezHKh2whY/MSE3SBgVj54SBL2SHOAnc
	znYaUC18MsjJwXgWi6KAj6giQ4QOEZtTkEffXslQcDkhOEGCMTYUw6rALxYDFEoBaIgDWVtKRBeuh
	Yd2iIdBnKIm/42alGQXemy5+5LUMnBNiJwE8M7488+dQYQ3yTrK0m33MJna1N6OQ90eASUkl/7Tmq
	n5DyLtfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjxzN-0000000B6Ti-0dc5;
	Sun, 25 Jan 2026 11:09:05 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjxzD-0000000B6RQ-28QS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 11:08:56 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AA23D7A019A;
	Sun, 25 Jan 2026 06:08:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 25 Jan 2026 06:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769339334;
	 x=1769425734; bh=Ki8yutJ6J7/iU6VRFPZXytmgyP3XS2kOORqhMGSoRJ8=; b=
	iM8Ubei179dR31Y0pum/ku4tM7GqOCN4+00XtM0aVI/ag6XaFj7vFnYrneXltid9
	dMhnkkuvskuxGmQS5p00zN1u3h3RDBmcBaT3DYBjZhKyWkyRSlHTNC3khJxu541c
	q5TevajkIDlTFicqLCwPE4n/G0NrL6MweM7gw02y7T6CJdExLq6vexiGeGfs/SIO
	pAwU4uon4VIvI1p1Bzf7rtCXWwlY++6Y6Nq2yb9GIAEYxwmz2zkEJOT37lhI97Ny
	uhkWjX1pX8eiO6AQ+af7UbaHYg8HwjbcenUFDc8MJIm3o7kyFJaE+S0r9tk3C9zU
	Zt+jOC83tQVhrhkbYKHo6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769339334; x=
	1769425734; bh=Ki8yutJ6J7/iU6VRFPZXytmgyP3XS2kOORqhMGSoRJ8=; b=J
	M/zB7qEbScMtKB5VTgVq+QI3QBNBlQXovryHqfagffLftZTmW+Z9g/X9axYa+h8L
	/a3dDS9EvqikbPcQRGP5bYHi1yn8cTrxgr4Uk4/x4F96cJKC4q1knQUBKVpovFsy
	VdIXZqTqQuu9WmQEJ+Xi21mYbZKM7w985g9rfpnlYB/VoAJmaKue8qAqsg8dZzAp
	py+eVb7uTFqYpM53froi05jV2u4YiEhuK2lwhVG3M6diQjHqDzj2BqPo/zMgD6kJ
	lCu6bWlR9B/XQkSdwjy2eNE81hFAc/P0hGUQhfTy1CMFABCjIqP6wJdMdkCB2Maf
	q6T9Gj/Y8jcxiHrj7d31w==
X-ME-Sender: <xms:xvl1aX3qp5dhs4b_k-4Ux5VxNLOoq140pBqH8OfBrsYP8QGXj2KaiQ>
    <xme:xvl1aR6QmL1UWVUrYj6Y92eQTNjeHODscgnnMDesVlHihnx8H8bQiHFVc0jm8JW1t
    zZBJAKXQmjwy1uYGOj21LQ4QgncBbJufVo4BIecSy2_MIpHSetOZR0>
X-ME-Received: <xmr:xvl1aTSKaXPdu4CU8M-86SHe5PC1-5wJaqdNOYFpFb8XcDXlyX3McdPIinxxdOoZHZ_W2LIVKLBHu4NbxHOxXlnKh3EvXL-OBfCzWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheegieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepnhgvrghlse
    hgohhmphgrrdguvghvpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvh
    hitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xvl1aWXNuKjzZ1o6pG_8lIKDW_N3Kd3cguX2DVRVrjUVQYORjYt_gw>
    <xmx:xvl1aYHI3hSNwvWPISAfMf_MAJAye2Sjwx6W_Da0-8GBK5pbgue9aQ>
    <xmx:xvl1aZcW6upMh863jcChV976rT82vrfTWCB7pwQIpLDbLEUlUMbmuA>
    <xmx:xvl1aRpWxOQPpmtXXX4XbbV60H4Ik7SAyaIAvMpjQQeVxtI2Lx1_Mg>
    <xmx:xvl1aVmbtYZUA2tPM834gOaonMFPrAVmrn5IGI7wjryDUPKu9SZsbgjx>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jan 2026 06:08:53 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sun, 25 Jan 2026 12:08:46 +0100
Subject: [PATCH 2/2] irqchip/apple-aic: Add support for "apple,t8122-aic3"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
In-Reply-To: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=JvpkSqkCKQ8P/Z3/vU6T2eD2nWK9FDSzmVzke/AumI8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhszSn/tZby9xDl6768LilIW2yVLqV1/7ypnJvvh2Xs1Lv
 lftZ7pnRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIl03Gb4xZTpcODWwmDDS7FG
 29wfJQjs2+DXPG9SsE9cOrtN8iOFfkaGVWbbXiiJpjxYIb10Ql3mW6/IVcevtgvpGBjt/LfQbWo
 BHwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_030855_631082_2EE1A30A 
X-CRM114-Status: GOOD (  19.06  )
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

Introduce support for the new AICv3 hardware block in t8122 and t603x
SoCs. AICv3 is similar to AICv2 but has an increased IRQ config offset.
These MMIO offsets are coded as properties of the "aic,3" node in
Apple's device tree. The actual offsets are the same for all SoCs
starting from M3 through at least M5. So do not bother to follow suit
but use AICv3 specific defines in the driver.
The compatible string is SoC specific so future SoCs with AICv3 and
different offsets would just use their own compatible string as base and
add their new offsets.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/irqchip/irq-apple-aic.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 3c70364e7cddd6ed6285595f136146ab04b897b2..f4efc325bebad1ae6119aa4eab47819a267da207 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -54,6 +54,7 @@
 #include <linux/irqdomain.h>
 #include <linux/jump_label.h>
 #include <linux/limits.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
 #include <asm/apple_m1_pmu.h>
@@ -134,8 +135,15 @@
 
 #define AIC2_IRQ_CFG		0x2000
 
+/*
+ * AIC v3 registers (MMIO)
+ */
+
+#define AIC3_IRQ_CFG		0x10000
+
 /*
  * AIC2 registers are laid out like this, starting at AIC2_IRQ_CFG:
+ * AIC3 registers use the same layout but start at AIC3_IRQ_CFG:
  *
  * Repeat for each die:
  *   IRQ_CFG: u32 * MAX_IRQS
@@ -293,6 +301,15 @@ static const struct aic_info aic2_info __initconst = {
 	.local_fast_ipi = true,
 };
 
+static const struct aic_info aic3_info __initconst = {
+	.version	= 3,
+
+	.irq_cfg	= AIC3_IRQ_CFG,
+
+	.fast_ipi	= true,
+	.local_fast_ipi = true,
+};
+
 static const struct of_device_id aic_info_match[] = {
 	{
 		.compatible = "apple,t8103-aic",
@@ -310,6 +327,10 @@ static const struct of_device_id aic_info_match[] = {
 		.compatible = "apple,aic2",
 		.data = &aic2_info,
 	},
+	{
+		.compatible = "apple,t8122-aic3",
+		.data = &aic3_info,
+	},
 	{}
 };
 
@@ -620,7 +641,7 @@ static int aic_irq_domain_map(struct irq_domain *id, unsigned int irq,
 	u32 type = FIELD_GET(AIC_EVENT_TYPE, hw);
 	struct irq_chip *chip = &aic_chip;
 
-	if (ic->info.version == 2)
+	if (ic->info.version == 2 || ic->info.version == 3)
 		chip = &aic2_chip;
 
 	if (type == AIC_EVENT_TYPE_IRQ) {
@@ -991,6 +1012,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 
 		break;
 	}
+	case 3:
 	case 2: {
 		u32 info1, info3;
 
@@ -1065,7 +1087,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 		off += irqc->info.die_stride;
 	}
 
-	if (irqc->info.version == 2) {
+	if (irqc->info.version == 2 || irqc->info.version == 3) {
 		u32 config = aic_ic_read(irqc, AIC2_CONFIG);
 
 		config |= AIC2_CONFIG_ENABLE;
@@ -1116,3 +1138,4 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 
 IRQCHIP_DECLARE(apple_aic, "apple,aic", aic_of_ic_init);
 IRQCHIP_DECLARE(apple_aic2, "apple,aic2", aic_of_ic_init);
+IRQCHIP_DECLARE(apple_aic3, "apple,t8122-aic3", aic_of_ic_init);

-- 
2.52.0


