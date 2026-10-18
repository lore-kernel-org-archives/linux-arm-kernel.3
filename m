Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307B6CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nu+Z7N/SsNbt+Rp62m67VzIkJ72Dt95OB9SPRFq2jcU=; b=QimYLIgfNgmNjsNtQiwskbAMvY
	A5j8AoS4syE7qV/Kg9CLorqe0byIL2oi7wZvzAJT/ImcbVhqI7f22pbxiPqSqYUfwxcNgoLoBFUyn
	A4JPgStCHxzYb8l37X1JDlRcb+v24Sqwn+m4Dql426UDckdkoSwIRpyDYwP3wP5rC1XSCDFbAb9x7
	CjpJuyXbIIReJUlTJqJUcBNX05exzg87qmux6336Ck9kTXSuHOopAAgRmBHugtDpIcjA/IGTlY3hi
	3BZvt9SEAtWEANWDxNCvQH+g7lg8J/GYc03Y9RrLFQm0iHvQWo3qY+hc+ziR6IQo0Ue5jgrcBhYt/
	b3eLsWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITuV-000000063Hz-0mie;
	Sun, 18 Oct 2026 16:38:59 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITuF-000000063Ce-1dyR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 16:38:45 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1792341506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nu+Z7N/SsNbt+Rp62m67VzIkJ72Dt95OB9SPRFq2jcU=;
	b=VFuol8DsFV5KTwLNNvKXHLJFpF36BUETx362coC+B0ZcAMv69EIgkBH44z1sv5Nrdd4iYP
	W9znWq7BELJopzJ6WA4bgsALNTZHwFO7dywF5li3F7UHmwx150wnnlTImZ8WFQmRw0NMU3
	Ou0qk1+gV+6aiq2GbDoDyILMZtu/daQ=
Date: Sun, 18 Oct 2026 18:38:11 +0200
Subject: [PATCH 2/2] soc: apple: sart: Add SART4 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-apple-sartv4-v1-2-1eaa5d63f6a2@cyberchaos.dev>
References: <20261018-apple-sartv4-v1-0-1eaa5d63f6a2@cyberchaos.dev>
In-Reply-To: <20261018-apple-sartv4-v1-0-1eaa5d63f6a2@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_093843_617900_8686AC43 
X-CRM114-Status: GOOD (  12.33  )
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

Add support for SART4 found on Apple M5 Pro/Max (t6050) SoCs.
This mirrors the SART3 implementation but with offsets adapted to the
new capacity.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 drivers/soc/apple/sart.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
index 66b99955b395..3be8e358248a 100644
--- a/drivers/soc/apple/sart.c
+++ b/drivers/soc/apple/sart.c
@@ -61,6 +61,18 @@
 
 #define APPLE_SART3_FLAGS_ALLOW 0xff
 
+/* SARTv4 registers */
+#define APPLE_SART4_CONFIG(idx) (0x00 + 4 * (idx))
+
+#define APPLE_SART4_PADDR(idx)	(0x60 + 4 * (idx))
+#define APPLE_SART4_PADDR_SHIFT 12
+
+#define APPLE_SART4_SIZE(idx)  (0xc0 + 4 * (idx))
+#define APPLE_SART4_SIZE_SHIFT 12
+#define APPLE_SART4_SIZE_MAX   GENMASK(29, 0)
+
+#define APPLE_SART4_FLAGS_ALLOW 0xff
+
 struct apple_sart_ops {
 	void (*get_entry)(struct apple_sart *sart, int index, u8 *flags,
 			  phys_addr_t *paddr, size_t *size);
@@ -177,6 +189,35 @@ static struct apple_sart_ops sart_ops_v3 = {
 	.size_max = APPLE_SART3_SIZE_MAX,
 };
 
+static void sart4_get_entry(struct apple_sart *sart, int index, u8 *flags,
+			    phys_addr_t *paddr, size_t *size)
+{
+	phys_addr_t paddr_ = readl(sart->regs + APPLE_SART4_PADDR(index));
+	size_t size_ = readl(sart->regs + APPLE_SART4_SIZE(index));
+
+	*flags = readl(sart->regs + APPLE_SART4_CONFIG(index));
+	*size = size_ << APPLE_SART4_SIZE_SHIFT;
+	*paddr = paddr_ << APPLE_SART4_PADDR_SHIFT;
+}
+
+static void sart4_set_entry(struct apple_sart *sart, int index, u8 flags,
+			    phys_addr_t paddr_shifted, size_t size_shifted)
+{
+	writel(paddr_shifted, sart->regs + APPLE_SART4_PADDR(index));
+	writel(size_shifted, sart->regs + APPLE_SART4_SIZE(index));
+	writel(flags, sart->regs + APPLE_SART4_CONFIG(index));
+}
+
+static struct apple_sart_ops sart_ops_v4 = {
+	.get_entry = sart4_get_entry,
+	.set_entry = sart4_set_entry,
+	.flags_allow = APPLE_SART4_FLAGS_ALLOW,
+	.size_shift = APPLE_SART4_SIZE_SHIFT,
+	.paddr_shift = APPLE_SART4_PADDR_SHIFT,
+	.size_max = APPLE_SART4_SIZE_MAX,
+};
+
+
 static int apple_sart_probe(struct platform_device *pdev)
 {
 	int i;
@@ -352,6 +393,10 @@ static void apple_sart_shutdown(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_sart_of_match[] = {
+	{
+		.compatible = "apple,t6050-sart",
+		.data = &sart_ops_v4,
+	},
 	{
 		.compatible = "apple,t6000-sart",
 		.data = &sart_ops_v3,

-- 
2.55.0


