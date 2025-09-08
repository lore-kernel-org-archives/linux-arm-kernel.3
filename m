Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C91CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxVXPsbydssbRWbmmVyB6O0Z0UzfgOwRpJAr2tyyUTg=; b=dtnpPEJ/FsuhFGaT9RMwXGnNxl
	xoUMAQHzTKoBSTUyKMGjfccdsRsa00WshpxcRVTNxs2U3QxTuuHOQ3EKM2uJA7me1L3BcPtGBLx4x
	VD4a4dlb/8JqGGxSjPg4cqdVYrBNcfMBle7qiGF7N0is8j0j9+fkwasTXr6E9/QR9bGX4yrhexhTf
	mrxhC4j4pUxOpNR3sxL+ZrXANPGGUnbTVIU5TBHJFPUl+C/aVJMUPje8e1m5yvUn7Biw4VPSesnyF
	p+ZKQnDMQaodRUbG7QDOto008bDlQbIOZwz3+6yvYWlx6AYruXValUckwW93zM6Ic6jBjtjQEnL4q
	jg8O9Stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlej-000000033DR-0LA2;
	Mon, 08 Sep 2025 23:52:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemT-00000000lNM-0rSj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE32B44A2E;
	Mon,  8 Sep 2025 16:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B01C4CEF7;
	Mon,  8 Sep 2025 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349108;
	bh=G+swjEVbqFRe3VO4Brd816oEyLNB4BZ+ieu+z8ZYXlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kHTWYSuP0bU3853OaXCg5l9DIuMvx66uOm4gpVe7T/uBz9nPeoGr0Vs4zn/L0wXgj
	 baiclTzTjvT2VJaV/Bu121IMYPe2UvqJVk5KfUES34qx6ug8fv/3jDa/F6EqIltXlv
	 F65V7TasHeaz4YdUDc4/rCsymfbwYSIsqdIKV4r7iL8JTGZnBDpcWVT9N711wKa1uR
	 px2b0BnjbDxPiUrXExgycyFU5sjVNBpeYQGpFKcKVEDMkjdc2vAyfZ6IEb7Tsswt3i
	 aBSyDl709uN/Cpz1+xnuHtUAjCDKPrgEMAHaCVv/1aYiRmLwuUul+jsY5FXB5PnHw2
	 6Vr/9lIDN+wqQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemQ-00000004NTm-2RZZ;
	Mon, 08 Sep 2025 16:31:46 +0000
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
	James Clark <james.clark@linaro.org>
Subject: [PATCH 04/25] platform: Add firmware-agnostic irq and affinity retrieval interface
Date: Mon,  8 Sep 2025 17:31:06 +0100
Message-Id: <20250908163127.2462948-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093149_292947_09988F94 
X-CRM114-Status: GOOD (  21.61  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/base/platform.c         | 60 +++++++++++++++++++++++++++------
 include/linux/platform_device.h |  2 ++
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 09450349cf323..fad33d6b2349a 100644
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
+ * platform_get_irq_affinity - get an optional IRQ and its affnity for a device
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
2.39.2


