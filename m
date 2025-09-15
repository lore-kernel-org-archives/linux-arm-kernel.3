Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE34CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kYO9CEWtqqrbvM8zDMLf4ipyabmGakj2Fqqwjv1KpQ=; b=qf0WB0nlboPIY3Yxi+brD0u19K
	XYcKOXjHGFqtv5l6Oe41gK2SPOcX2VRuQC7i03E0zJygpmZuwJgD9ROIgxR3Q87fzp6/xbn9UsyDv
	6flPVjbmpsmgnSS9dHDKDkcNns50/t3ICxxt+0h5vXdV8E0h++yXVGKBFa5JP0B1vPViZ/+jWQsNW
	0tuQlBo4ac62M9WcoPecgKIoAMcFaaG/4atA0+Gnk7ofJg3t80dflSASDvz0PQ9dl7KJl5kRVJbpO
	AHpdnQqWbEKG2i3GDZw6Yu3cYplDo29CGXRsYU6PwYZ1jC55VBJjmtHllyvoYKnBxVth5ERqIWT5A
	NUtIwNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51X-00000003J6O-40HS;
	Mon, 15 Sep 2025 08:57:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51P-00000003Iw5-0ew1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EA5643A00;
	Mon, 15 Sep 2025 08:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0717C4CEFF;
	Mon, 15 Sep 2025 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757926634;
	bh=Tg++jEb0qzQoJaPtBtzDLbCLFkMuRzXyuZynLSvq9z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s8MyW1t/KY+ePpGZ7kfxfZRZBXGE5f4b73es1XFslk69eaQaAMgtMaeZGI3L8/NsK
	 KAGz3FyHUAZOTmeog5TG72kUiRUp5CsuVPy7AuLErJFu2MKSVeh+F3Li51dPbqb7LZ
	 bPXRm2bBsjYxqlVm2zUvWTj9uTLXg3D2yNm7pAb6NcUBG2B7EQUDyZ65/xtg+aFaDR
	 k6qgSiUX1HOt8GldVlOEr9GuOZ8s8cI9InmQLHrgAQ1wK4ZTW4P1ckeHFrBsmMvlQU
	 jq58QzrVRPj/0SUZHzQl7mwB8VUSiKBV3xVbgKdfUkfyfTaaL1XqRqHEzdN031SJZK
	 n7YoGq73YbgPg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy51L-00000006IHP-3rFH;
	Mon, 15 Sep 2025 08:57:11 +0000
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
Subject: [PATCH v2 03/25] of/irq: Add IRQ affinity reporting interface
Date: Mon, 15 Sep 2025 09:56:40 +0100
Message-Id: <20250915085702.519996-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915085702.519996-1-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_015715_256790_95E188A4 
X-CRM114-Status: GOOD (  13.52  )
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

Plug the irq_populate_fwspec_info() helper into the OF layer
to offer an IRQ affinity reporting function.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/of/irq.c       | 20 ++++++++++++++++++++
 include/linux/of_irq.h |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 74aaea61de13c..9a205cb033bda 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -479,6 +479,26 @@ int of_irq_get(struct device_node *dev, int index)
 }
 EXPORT_SYMBOL_GPL(of_irq_get);
 
+const struct cpumask *of_irq_get_affinity(struct device_node *dev, int index)
+{
+	struct of_phandle_args oirq;
+	struct irq_fwspec_info info;
+	struct irq_fwspec fwspec;
+	int rc;
+
+	rc = of_irq_parse_one(dev, index, &oirq);
+	if (rc)
+		return NULL;
+
+	of_phandle_args_to_fwspec(oirq.np, oirq.args, oirq.args_count,
+				  &fwspec);
+
+	if (!irq_populate_fwspec_info(&fwspec, &info))
+		return info.affinity;
+
+	return NULL;
+}
+
 /**
  * of_irq_get_byname - Decode a node's IRQ and return it as a Linux IRQ number
  * @dev: pointer to device tree node
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index a480063c9cb19..721cbdbc292df 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -43,6 +43,8 @@ extern int of_irq_parse_one(struct device_node *device, int index,
 			  struct of_phandle_args *out_irq);
 extern int of_irq_count(struct device_node *dev);
 extern int of_irq_get(struct device_node *dev, int index);
+extern const struct cpumask *of_irq_get_affinity(struct device_node *dev,
+						      int index);
 extern int of_irq_get_byname(struct device_node *dev, const char *name);
 extern int of_irq_to_resource_table(struct device_node *dev,
 		struct resource *res, int nr_irqs);
@@ -77,6 +79,11 @@ static inline int of_irq_get_byname(struct device_node *dev, const char *name)
 {
 	return 0;
 }
+static inline const struct cpumask *of_irq_get_affinity(struct device_node *dev,
+							int index)
+{
+	return NULL;
+}
 static inline int of_irq_to_resource_table(struct device_node *dev,
 					   struct resource *res, int nr_irqs)
 {
-- 
2.39.2


