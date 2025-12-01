Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF9BD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpud14AVdCVE4BqctTtx1QgtADA41ixWO6mfo6mWLNk=; b=aS1NBrbjhp1/Yt7nzVoV2Qlj7/
	HKTfz0QLlFh9d6Iy5tZIn/rVgudU4h71wKrDwl+0nyFf40/OWljtZykYhRnJlmjx5sS65hBqTj5RG
	PwTGqyE1Oe6KOCWW6vbYPj9aKIuMVaRYNNXd+F7kDnd8+r2R9gTm7JNc9lsKcPbg4OJuV2HZn/fCG
	o35NtbMeTkL88MRaGRpXrTmWFsSbYfg1tQ3XjsP23kRu7Uw6uY2PXaqNjLWNhwFwe/rN4qjK7xwbz
	3+C9uKzVLIegISVuLL+9USFYl1VwZl3B18NS9auCjeU5FCZnhojZ2SaCBhjqX7ncG2NWAagD6bnEw
	rmf3j+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1W1-00000003NJH-3tT6;
	Mon, 01 Dec 2025 10:52:21 +0000
Received: from mx-relay180-hz1.antispameurope.com ([94.100.133.63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Vz-00000003NFw-2eVA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:52:20 +0000
ARC-Authentication-Results: i=1; mx-gate180-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=jpud14AVdCVE4BqctTtx1QgtADA41ixWO6mfo6mWLNk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764586327;
 b=ZCJmNHTG8XUu8P2zuLF9pX5pIiNV2/pArXfEIAnfcQ/YHiyP5Wnms7iHCKSrVdfT1/nEi5ks
 OzSUjrjvM+nArIiwzxrzXsn3sk83F+uB0Q76Dh80yZf/YbdKJQ/Jdt6VPm3oD/JXAB+0MaocNvV
 LqL7d4BranwKDJaP/qqKAdSS/ZKib9CCsWdQyCjg8y1umEOq8HYfqEzfjCdeSMajlwVCvpEYVky
 NdFX8fAKFe7GxjBa2VZ4IioyPBBP16ce9iyvGuw6MseWM/ekMPm0x+6eZaEYDk9a6RZ+Lkr5bCO
 ySNUxXdZFVG30o1XGf3hv0m8N1aaSUj6gkjowJQiwaHSg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764586327;
 b=a6QW0IEeJOa5t95AmFRPl1eyYfB7k33O9W9PWb5OOhqUohBAg2bTAz8WHoWbkFloi2woP9CY
 XmTCRd6IM5aoJH0TKR+o29ER10zLTOXUTYNluL/MDNtWiJQy/tFiZ7Jt685gUCGv7t6pf/hRZco
 CCqckmjlPKFnicNFl1p86x4Utpaag0t74NGu7ezUlW4VnIi90vtxZtEkbpoWJZqd7QDzddXvWyX
 0O5kEv41LPYnQ0MsD49wXBZiirNpj7BygyoRSFMwVkvHQWmas+WcvFwGh2FTN51ydlhbQeKZShl
 q8MmRtT2gFp5xv67sMg4HO9Z/IjAQYX6INIseEnwdi+8g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay180-hz1.antispameurope.com;
 Mon, 01 Dec 2025 11:52:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B50C8CC0E91;
	Mon,  1 Dec 2025 11:51:53 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] irqchip/ls-extirq: Convert to platform driver
Date: Mon,  1 Dec 2025 11:51:40 +0100
Message-ID: <20251201105144.539450-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201105144.539450-1-alexander.stein@ew.tq-group.com>
References: <20251201105144.539450-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay180-hz1.antispameurope.com with 4dKghB1ZPZz2SjPb
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 877b155cd18575eb910342161cf8e7ff
X-cloud-security: scantime:2.275
DKIM-Signature: a=rsa-sha256;
 bh=jpud14AVdCVE4BqctTtx1QgtADA41ixWO6mfo6mWLNk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764586326; v=1;
 b=nne1TF35fFI4Dl8fMnLbDuXsmjz6+FQ5l1AEx8Reh1w2UAN3J3q2bZpBlpKPkQ30rN80xnFu
 I+K3+0yozTbaubAeVdTt4o6dGqDc0PmGjx/1ZrI58R4Q5ZRXvcZrcFuIuj432GJCzwLmxHdXpA6
 pcYj/cMmgD1Fe8dq5pmGLyRDDVzk8q1BSz64R+fuWoyOS4dDBrzOPFVH9O4GHn5OcyU6uZdT3T0
 +MFt8NAozefsOB4fh5VTH+iGSQu17YC0pOTdJiQVdtff0HZbTKEXtIFwyH9I8LSLgZesM9vRAFI
 kah2OuFl1vhTyotojY2Zvslqw9xbq21TYDo7Pk1ClklVA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_025219_819167_E159E2CF 
X-CRM114-Status: GOOD (  18.24  )
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

extirq maps to gic which might not be present yet when this driver is
initialized. Convert it to platform driver in order to allow probe
deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/irqchip/irq-ls-extirq.c | 40 ++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-ls-extirq.c b/drivers/irqchip/irq-ls-extirq.c
index 50a7b38381b98..cb7db9ae79087 100644
--- a/drivers/irqchip/irq-ls-extirq.c
+++ b/drivers/irqchip/irq-ls-extirq.c
@@ -168,19 +168,29 @@ ls_extirq_parse_map(struct ls_extirq_data *priv, struct device_node *node)
 	return 0;
 }
 
-static int __init
-ls_extirq_of_init(struct device_node *node, struct device_node *parent)
+static const struct of_device_id ls_extirq_match[] = {
+	{ .compatible = "fsl,ls1021a-extirq" },
+	{ .compatible = "fsl,ls1043a-extirq" },
+	{ .compatible = "fsl,ls1088a-extirq" },
+	{}
+};
+
+static int ls_extirq_probe(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
 	struct irq_domain *domain, *parent_domain;
+	struct device *dev = &pdev->dev;
+	struct device_node *irq_parent;
 	struct ls_extirq_data *priv;
 	int ret;
 
-	parent_domain = irq_find_host(parent);
-	if (!parent_domain) {
-		pr_err("Cannot find parent domain\n");
-		ret = -ENODEV;
-		goto err_irq_find_host;
-	}
+	irq_parent = of_irq_find_parent(dev->of_node);
+	if (!irq_parent)
+		return -ENODEV;
+
+	parent_domain = irq_find_host(irq_parent);
+	if (!parent_domain)
+		return dev_err_probe(dev, -EPROBE_DEFER, "Cannot find parent domain\n");
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
@@ -194,7 +204,7 @@ ls_extirq_of_init(struct device_node *node, struct device_node *parent)
 	 */
 	priv->intpcr = of_iomap(node, 0);
 	if (!priv->intpcr) {
-		pr_err("Cannot ioremap OF node %pOF\n", node);
+		dev_err(dev, "Cannot ioremap OF node %pOF\n", node);
 		ret = -ENOMEM;
 		goto err_iomap;
 	}
@@ -223,10 +233,14 @@ ls_extirq_of_init(struct device_node *node, struct device_node *parent)
 err_iomap:
 	kfree(priv);
 err_alloc_priv:
-err_irq_find_host:
 	return ret;
 }
 
-IRQCHIP_DECLARE(ls1021a_extirq, "fsl,ls1021a-extirq", ls_extirq_of_init);
-IRQCHIP_DECLARE(ls1043a_extirq, "fsl,ls1043a-extirq", ls_extirq_of_init);
-IRQCHIP_DECLARE(ls1088a_extirq, "fsl,ls1088a-extirq", ls_extirq_of_init);
+static struct platform_driver ls_extirq_driver = {
+	.driver = {
+		.name		= "irq-ls-extirq",
+		.of_match_table	= ls_extirq_match,
+	},
+	.probe = ls_extirq_probe,
+};
+builtin_platform_driver(ls_extirq_driver);
-- 
2.43.0


