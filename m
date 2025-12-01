Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66DFD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUdFDXOpdEHblxEFS8Klgzf9uDbkW8RYNQMN1WIjTJI=; b=IgDUH8O+54ruNP0i+I+8SNwknQ
	HFL2/giYzY+QjFrcxRtWLj1HwXth770H1U8IRNzLJK/89ehcQwk18QTtFAf0xqmoFmzedtmlEhCXJ
	RWKdzIcEhyFtIvWiirP+l14SoVnPMPr1Grm/DCd3rXMdYupa8GAy556gq9ld+OcZH+1turT0ILx3/
	Ac+FFtoTFi3FYdVPrdru+oFHQ0998qjIJPgQDieLtAzn3ilgJVVAEkDLt4iYcOCX57vKB8f8y93sB
	nsxjzxVq4f4Pva8WyCjrn/geP9t/RSyWon1li+V0TTUPQZZDqJRzjSdZoXhSMefmFQ+mMSqp8eJ7d
	KWNegviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Vy-00000003NFc-08eU;
	Mon, 01 Dec 2025 10:52:18 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Vu-00000003NDx-2jpc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:52:17 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=lUdFDXOpdEHblxEFS8Klgzf9uDbkW8RYNQMN1WIjTJI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764586325;
 b=jMYcEv8D4tO8qqnTHURFbIjgS+vyNGUkn6w8p/4WUJwsGYLtMYaDVvHMfoJhQpRTEtCFPDow
 e9IS2qP8WQtGYiZm5olZ92iGSuk3andv3jF9b59Za3pW8qgzla1dFqM9y7Gc7FnOYRirBAHKahF
 K8BJ11nTqEGIyft7uHiWw9nNh/vSb5SYJQyNcwi7hdizeaSEgWaIvYJDRedR33pyBSiXGfF82mY
 WzQbmOabn+phRx2rjC7EbmVRVVo8rvQJec+nZbdGG8LDTvllNyVGT45B+v7P7wNeM/CjVQ+pOv5
 HHric0n0BE56PR5OYzYoEEUbg9aDCPqJ+tyERYTUPf9pw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764586325;
 b=h+YO5ERa8y+2GAfTogg6x74KeG5UUtbFIkLw0jTquRV4zMdft7qHiqrebXUpQLxDaQElnsXy
 2grvBVSZoLKaj9QQKHXKpqyCk9bnvJsi+OnAkUS2XYtFiO4HrMi6zJTmCB5gzAQOb1fxyE7kN6k
 y0WjwSeHMpdSN8dYbwJ6L46rQ3H+W9GNdekx9ODhAFkirDnG1/9ObaLJw/VzWoaSWuhKeEd+xRz
 Q8dvPZgVB8s6eJEvRAEFVqfkXn99vlSu3L9E76cbPanuuyefF52m0Pt9Y37MWuEHVwBqXTsutiX
 JHI72lXGK6pAJHeNDaw9l10dlQ3cEaduCDmvKJxt3JmTw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Mon, 01 Dec 2025 11:52:05 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 96251CC0E92;
	Mon,  1 Dec 2025 11:51:54 +0100 (CET)
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
Subject: [RFC PATCH 2/3] irqchip/ls-extirq: Use managed resources
Date: Mon,  1 Dec 2025 11:51:41 +0100
Message-ID: <20251201105144.539450-3-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4dKghC0qlRz2nHk2
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 31ea3d37a4def439ed8686206906e05d
X-cloud-security: scantime:1.961
DKIM-Signature: a=rsa-sha256;
 bh=lUdFDXOpdEHblxEFS8Klgzf9uDbkW8RYNQMN1WIjTJI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764586324; v=1;
 b=XLhF6/ZTd1MfbyDfA1KrLXHT8tfihfjcT6dJXt1KJ23+GJAjT1sV8c+p6+OXe6duHo5ax/5+
 JiFPc6YXLUNj0RAm7yRnzs456h540NgjymFIPvwrKwja/6uzHtV29kE4f+pqlsSsPAU0adDqqDB
 MKFeeBFcXo0ak34QDJE2VVERbJvn5VfbdALqLc7KufCZAD2NgyXQxs9v7j+rKJcFfBmZv5MyQ1q
 ROJTLbEHjWnAiy8MF6kLRKXmvLwdrFCIZCmecwaXiXCpfpqXkRRBjwO3/czcOG82lt1NClSpHkZ
 fnw3Riu8KKZ3PfMN+QghZrUJ9J2coN6jJPtje1vditYsw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_025214_943441_13746C57 
X-CRM114-Status: GOOD (  14.20  )
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

This simplifies the error handling and probe is straight forward.
Also use dev_err_probe for even more simplification.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/irqchip/irq-ls-extirq.c | 37 ++++++++-------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/irq-ls-extirq.c b/drivers/irqchip/irq-ls-extirq.c
index cb7db9ae79087..52b8b9fc17621 100644
--- a/drivers/irqchip/irq-ls-extirq.c
+++ b/drivers/irqchip/irq-ls-extirq.c
@@ -192,26 +192,17 @@ static int ls_extirq_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return dev_err_probe(dev, -EPROBE_DEFER, "Cannot find parent domain\n");
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto err_alloc_priv;
-	}
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
 
-	/*
-	 * All extirq OF nodes are under a scfg/syscon node with
-	 * the 'ranges' property
-	 */
-	priv->intpcr = of_iomap(node, 0);
-	if (!priv->intpcr) {
-		dev_err(dev, "Cannot ioremap OF node %pOF\n", node);
-		ret = -ENOMEM;
-		goto err_iomap;
-	}
+	priv->intpcr = devm_of_iomap(dev, node, 0, NULL);
+	if (!priv->intpcr)
+		return dev_err_probe(dev, -ENOMEM, "Cannot ioremap OF node %pOF\n", node);
 
 	ret = ls_extirq_parse_map(priv, node);
 	if (ret)
-		goto err_parse_map;
+		return dev_err_probe(dev, ret, "Failed to parse IRQ map\n");
 
 	priv->big_endian = of_device_is_big_endian(node->parent);
 	priv->is_ls1021a_or_ls1043a = of_device_is_compatible(node, "fsl,ls1021a-extirq") ||
@@ -220,20 +211,10 @@ static int ls_extirq_probe(struct platform_device *pdev)
 
 	domain = irq_domain_create_hierarchy(parent_domain, 0, priv->nirq, of_fwnode_handle(node),
 					     &extirq_domain_ops, priv);
-	if (!domain) {
-		ret = -ENOMEM;
-		goto err_add_hierarchy;
-	}
+	if (!domain)
+		return dev_err_probe(dev, -ENOMEM, "Failed to add IRQ domain\n");
 
 	return 0;
-
-err_add_hierarchy:
-err_parse_map:
-	iounmap(priv->intpcr);
-err_iomap:
-	kfree(priv);
-err_alloc_priv:
-	return ret;
 }
 
 static struct platform_driver ls_extirq_driver = {
-- 
2.43.0


