Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A185CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntrU9nuRet64PMVdCke1I3LrFr9q76nQfM0zFt2OtT8=; b=Ojy3x6H3UCsv+gPEWKtui30WRL
	HxU72fOE19XtBmHBOrebeo2+cBZC6y+IEganj63wHufykjb74K4UTeYnEn+JBX5MORbF9/jUVHdq7
	WAVR258tPWVOLdRmznQg3ivVmpG/7yNvx9fqIwO81rHLs+fRda4jwFwWLSMsaBw92YXZ5wfORtup2
	BuFckAo/0vMgkUzQ+8fctgHIAh4E5nfEi9dxqW1waGJjSlv8b59Fgd2OTQ4hss/AEQY/qZKPWClit
	GIU/mD6LsHS8aQaZb5gfc4WnQU+SSJvvCvElRt4EMn3zv4ejZoTmx7hNug5cJ8P9jiDMxGLiBc3ba
	y03EGhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4Z-0000000DV6T-3k85;
	Mon, 20 Oct 2025 12:33:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2T-0000000DS5I-2I59
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ntrU9nuRet64PMVdCke1I3LrFr9q76nQfM0zFt2OtT8=; b=aQp6M9lprD4CWsaGYsUtW+vq8M
	2FIBok2SU7Nm6FtoQBS1i1iCi6bDcj62YqJxmetXQugyrDPUbb1xS0ddRbkjyn0uWE3B2QPPoIAwh
	lAPxwU3wH+9mFMa6D7F+4P87lQ9wTCVH6kzLpU+GKSY2/XkZiQo0c8LRFAdL85YnhV1Duidz4o4C6
	lLmoaB48RPOMT+k4fY4OCGkYagVAPAuhW1RQf7IaOd2sx6F83PQjnhA1o3iZev4q1+gA1nXqBtW/E
	TvY/bc79b9QSuMKDc+kWAtFLFn2bpnRREnyRzBaWWhVOQVuvKXZk9HqEGQOERxaD032St4a4hwuKB
	VhNlZ0Dw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2O-000000074mQ-2aOB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70DE048AC1;
	Mon, 20 Oct 2025 12:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6DBC116C6;
	Mon, 20 Oct 2025 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963410;
	bh=Coi94hPhUXXNLgq9jnPOWHoGdCzfOo5Sym8rez8bbhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aTzGnq+27zIx6xgvRds0Cr34kpf1s+bVMyeygcLzOAyKIwrsHWRh8FTdnlZ4lvr60
	 crp7oalHILkGFU6JwMgY9vxvCOEkBMVLOiHMb7kWOU7LF50HPP/IKRTlWIFRrv8Q9G
	 +FvjH6QXOnV6nQ+D2nSxYQe8b6dB0J6mv5uB3MaRmphrWHbUWkGBlbhSEol3S3Pk1F
	 JvCj3CgVYATUObr0zITPUFpwAbxmleBKjBH3OwQXnkNJCTBUdJmLZLXu6wWPuyuuTw
	 FrD0fMV7zMrNvvbHtECTUcFlzykVwJnUF1FMcHlBr7cwrISisatBNlVB9l3Cfv1kOi
	 WQ9oeT3wGw2mw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1c-0000000FUu2-1WPA;
	Mon, 20 Oct 2025 12:30:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 04/26] platform: Add firmware-agnostic irq and affinity retrieval interface
Date: Mon, 20 Oct 2025 13:29:21 +0100
Message-ID: <20251020122944.3074811-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133058_176342_7344E00F 
X-CRM114-Status: GOOD (  20.46  )
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

Expand platform_get_irq_optional() to also return an affinity if
available, renaming it to platform_get_irq_affinity() in the
process.

platform_get_irq_optional() is preserved with its current semantics
by calling into the new helper with a NULL affinity pointer.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/base/platform.c         | 60 +++++++++++++++++++++++++++------
 include/linux/platform_device.h |  2 ++
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 09450349cf323..3a058f63ef0d3 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -150,25 +150,37 @@ devm_platform_ioremap_resource_byname(struct platform_device *pdev,
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_byname);
 #endif /* CONFIG_HAS_IOMEM */
 
+static const struct cpumask *get_irq_affinity(struct platform_device *dev,
+					      unsigned int num)
+{
+	const struct cpumask *mask = NULL;
+#ifndef CONFIG_SPARC
+	struct fwnode_handle *fwnode = dev_fwnode(&dev->dev);
+
+	if (is_of_node(fwnode))
+		mask = of_irq_get_affinity(to_of_node(fwnode), num);
+	else if (is_acpi_device_node(fwnode))
+		mask = acpi_irq_get_affinity(ACPI_HANDLE_FWNODE(fwnode), num);
+#endif
+
+	return mask ?: cpu_possible_mask;
+}
+
 /**
- * platform_get_irq_optional - get an optional IRQ for a device
+ * platform_get_irq_affinity - get an optional IRQ and its affinity for a device
  * @dev: platform device
  * @num: IRQ number index
+ * @affinity: optional cpumask pointer to get the affinity of a per-cpu IRQ
  *
  * Gets an IRQ for a platform device. Device drivers should check the return
  * value for errors so as to not pass a negative integer value to the
- * request_irq() APIs. This is the same as platform_get_irq(), except that it
- * does not print an error message if an IRQ can not be obtained.
- *
- * For example::
- *
- *		int irq = platform_get_irq_optional(pdev, 0);
- *		if (irq < 0)
- *			return irq;
+ * request_irq() APIs. Optional affinity information is provided in the
+ * affinity pointer if available, and NULL otherwise.
  *
  * Return: non-zero IRQ number on success, negative error number on failure.
  */
-int platform_get_irq_optional(struct platform_device *dev, unsigned int num)
+int platform_get_irq_affinity(struct platform_device *dev, unsigned int num,
+			      const struct cpumask **affinity)
 {
 	int ret;
 #ifdef CONFIG_SPARC
@@ -236,8 +248,36 @@ int platform_get_irq_optional(struct platform_device *dev, unsigned int num)
 out:
 	if (WARN(!ret, "0 is an invalid IRQ number\n"))
 		return -EINVAL;
+
+	if (ret > 0 && affinity)
+		*affinity = get_irq_affinity(dev, num);
+
 	return ret;
 }
+EXPORT_SYMBOL_GPL(platform_get_irq_affinity);
+
+/**
+ * platform_get_irq_optional - get an optional IRQ for a device
+ * @dev: platform device
+ * @num: IRQ number index
+ *
+ * Gets an IRQ for a platform device. Device drivers should check the return
+ * value for errors so as to not pass a negative integer value to the
+ * request_irq() APIs. This is the same as platform_get_irq(), except that it
+ * does not print an error message if an IRQ can not be obtained.
+ *
+ * For example::
+ *
+ *		int irq = platform_get_irq_optional(pdev, 0);
+ *		if (irq < 0)
+ *			return irq;
+ *
+ * Return: non-zero IRQ number on success, negative error number on failure.
+ */
+int platform_get_irq_optional(struct platform_device *dev, unsigned int num)
+{
+	return platform_get_irq_affinity(dev, num, NULL);
+}
 EXPORT_SYMBOL_GPL(platform_get_irq_optional);
 
 /**
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 074754c23d330..ad66333ce85ce 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -102,6 +102,8 @@ devm_platform_ioremap_resource_byname(struct platform_device *pdev,
 
 extern int platform_get_irq(struct platform_device *, unsigned int);
 extern int platform_get_irq_optional(struct platform_device *, unsigned int);
+extern int platform_get_irq_affinity(struct platform_device *, unsigned int,
+				     const struct cpumask **);
 extern int platform_irq_count(struct platform_device *);
 extern int devm_platform_get_irqs_affinity(struct platform_device *dev,
 					   struct irq_affinity *affd,
-- 
2.47.3


