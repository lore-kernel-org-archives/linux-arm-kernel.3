Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC0D35694
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVC2WuSA6MQEeDQDC4DLfSa8QpNXNeIyPnIyMddEyYo=; b=FrJPp6fazjOTGuEzIisezngn/Q
	ms9rnCcRqtzafNtZUyi10GXmnWSKgV+dncs1LHYgr90ahanWaYaC1bVanLD4XU7J6mlP2QQML6RYQ
	yDRuRuGMTHitO/cKDSwCe8uBpoVnk8kYGeJGyiRrOGhouD944pYj0QfBO3zyZiI+jEYJqPAKURY63
	Y7Yh7/t+9GRZZr8tRXM5TQSCk1tdTUY3csDCT7lV0VdreMI5lm9MKHNFc+GIn91zAG7x9nvz4+RSi
	9NxAuKMh8JRp3rMN1YKAaIhUMUocNGFEIh4gm2tN1TEhHoOyHdURJt0nA7KJxE1zOuljqGPyR+SJk
	36gCdqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Ms-0000000Fhrx-0ZcE;
	Wed, 28 Jan 2026 08:57:42 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Me-0000000Fhnt-085H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:57:30 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3FF8E7A0035;
	Wed, 28 Jan 2026 03:57:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 28 Jan 2026 03:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769590647;
	 x=1769677047; bh=pVC2WuSA6MQEeDQDC4DLfSa8QpNXNeIyPnIyMddEyYo=; b=
	hWW2wiXa8Ln9mfbqIQnMo9f/b+9rYCVjHdMeZMEmQpuoE1ShEWSAx80xK9NL60tO
	RO+WwQ1nX8Yh6OYUvtpRtfJoeQRgGIH+XFBziuo9CIjO8jnp/OXScOj2AKsYTCOL
	I5lrDoyjBXBgXJkUIcDvdBx36vNQKpCPXcjzASkqUrwvmsBSh6Y64W3qEIgitRIp
	/6FMThMIIXXEzWg9v2whw0xiwJ1O0kpQ64lcpPGIysrvLlCHTZQPjC1+HpNCnQKo
	loOqkGisHD4kdmeD2w7b4Zo8WmBtGRWGLa18OPCEpjjx865nrvSEseK+e5xGJ7B9
	u7ZFd7nerpVMR7k7GvqQxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769590647; x=
	1769677047; bh=pVC2WuSA6MQEeDQDC4DLfSa8QpNXNeIyPnIyMddEyYo=; b=Q
	14aClBcfWydv/6x6F5Vnqhr/62ku7qMqYx9niTsL2BzUo8NOMOiyLtmPk1IpKc8k
	q6fnu+wetKqrXx0w1WQettyBWjlMCfBc48o4uSBOmhEecleSH5UfCrp3eXNqGbVQ
	PYyXRVhc2nJBUo2WwH4sZiLkg8G1NHlSktNx1ttE3btGK2sFxR0JX1fTO4QUy756
	gtKd/b5mRfju/VCxzgolwAxU8p8sVyuOr1YuHReoC4MdS/a3bpUPcHvpWXz68sPB
	7AjH4if/4AbeeMCqUuG27edtAYEeUewTxs917FUiWAxXs7qCgS2GstN1Ov4wUdNj
	YyKi8PE1NpKqwIW5yq6lA==
X-ME-Sender: <xms:d895aQhf2hJJHGdXRn82Wvmizq-SHvakt1yOr6DNMLVUvaTRjWzd_w>
    <xme:d895aU0R7YAUfMvaQvQ60F5c9whr7GC1n_1hNxTOSyxvwman-WxrlTW0_BUFSNSY9
    f9aPhU5jAkqlmpXu4vYeEFebND35EiCUlE41oLZ1sajSAnHiSUA5bU>
X-ME-Received: <xmr:d895aTfFyGM5qaSVcSeR5YBjtXFgbr6znueHl-0JC0cBdue1j8gjpJr7PUcLxQmoFTVt_VPJyVzUdHnXvfAh9g6ctD3cZiGG1sYOZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepjhesjhgrnhhnrghurd
    hnvghtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehk
    rhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuth
    hrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhi
    shhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:d895aayfDZFIWTiPEi10drzLrUgKmR5tOl4F4WAt_vDnYSl5kcDoVA>
    <xmx:d895abwaXKH79iQawnlsTVCbu2MNO3qiTWXJMtWPjzTKAV3b9fp8lg>
    <xmx:d895abYbi0zB9SbkN3TQxxM2K62RwGEqdMETOB2bFvabGn3-8vloWg>
    <xmx:d895aU1egbtwNaFUVmxjD6vD5xDNYX6JBCPkDHzQf2E0LkR4to1amA>
    <xmx:d895achweTwK9RkZT-HdzeN9lLoRwDrHDF3PDMKXHC4EEmJdDF2pNQh0>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 03:57:26 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 28 Jan 2026 09:57:09 +0100
Subject: [PATCH v2 2/2] irqchip/apple-aic: Add support for
 "apple,t8122-aic3"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-irq-apple-aic3-v2-2-b4bc8e16c997@jannau.net>
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
In-Reply-To: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3142; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=c8+y7YK8j4mLCVCoVK1eu9NeJiQU/vi7Kvi5/Rxprhw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhszK8wUZqhsXL5Y3b+uo/9jZetvjhpRrjlSronjFP7UYk
 e7rXModpSwMYlwMsmKKLEnaLzsYVtcoxtQ+CIOZw8oEMoSBi1MAJnL5LcP/4EVSM7f0vRPq1JWa
 zPBsrd3Lxy2+Jgd+SR/c+8YgK3XCVkaGm70h83eHp17d8cLyu4/2VMnftfGl10VTBW/6+IVX5s3
 mAAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_005728_116772_0E5BC435 
X-CRM114-Status: GOOD (  17.95  )
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

Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/irqchip/irq-apple-aic.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 3c70364e7cddd6ed6285595f136146ab04b897b2..4607d28f23887fb4bfe286a398d5a5b2f840e716 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -134,8 +134,12 @@
 
 #define AIC2_IRQ_CFG		0x2000
 
+/* AIC v3 registers (MMIO) */
+#define AIC3_IRQ_CFG		0x10000
+
 /*
  * AIC2 registers are laid out like this, starting at AIC2_IRQ_CFG:
+ * AIC3 registers use the same layout but start at AIC3_IRQ_CFG:
  *
  * Repeat for each die:
  *   IRQ_CFG: u32 * MAX_IRQS
@@ -293,6 +297,15 @@ static const struct aic_info aic2_info __initconst = {
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
@@ -310,6 +323,10 @@ static const struct of_device_id aic_info_match[] = {
 		.compatible = "apple,aic2",
 		.data = &aic2_info,
 	},
+	{
+		.compatible = "apple,t8122-aic3",
+		.data = &aic3_info,
+	},
 	{}
 };
 
@@ -620,7 +637,7 @@ static int aic_irq_domain_map(struct irq_domain *id, unsigned int irq,
 	u32 type = FIELD_GET(AIC_EVENT_TYPE, hw);
 	struct irq_chip *chip = &aic_chip;
 
-	if (ic->info.version == 2)
+	if (ic->info.version == 2 || ic->info.version == 3)
 		chip = &aic2_chip;
 
 	if (type == AIC_EVENT_TYPE_IRQ) {
@@ -991,7 +1008,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 
 		break;
 	}
-	case 2: {
+	case 2 ... 3: {
 		u32 info1, info3;
 
 		info1 = aic_ic_read(irqc, AIC2_INFO1);
@@ -1065,7 +1082,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 		off += irqc->info.die_stride;
 	}
 
-	if (irqc->info.version == 2) {
+	if (irqc->info.version == 2 || irqc->info.version == 3) {
 		u32 config = aic_ic_read(irqc, AIC2_CONFIG);
 
 		config |= AIC2_CONFIG_ENABLE;
@@ -1116,3 +1133,4 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 
 IRQCHIP_DECLARE(apple_aic, "apple,aic", aic_of_ic_init);
 IRQCHIP_DECLARE(apple_aic2, "apple,aic2", aic_of_ic_init);
+IRQCHIP_DECLARE(apple_aic3, "apple,t8122-aic3", aic_of_ic_init);

-- 
2.52.0


