Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD7ACAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaY5cbb70+3FiAAjNfTSatmXmX0YiIVOVUVDwXpgnE4=; b=sNIYFiuk8JQ3Dpslw478xda/ft
	FEsihn/RbycR8Qa676FZMj0eJ9mvzgWkZ27Vhiin0qvcvzI245mTYxe0r7KzMtdg7xS5zcHm7vooB
	Bt59MWqQtiRN5Ul4d8T6z3K5zxxgbIa/rKjPkOcQgm2gxVUvR1k3WmJSw6vmvQ7z5HSqjjeJ/xVMA
	TYicbNZf91ep47ZjWauoceRp3MmZd4OLsSEjcNb5fdB9D1tiaakhKoePoAr+MlG2SP/s5UwhaBiN2
	Z+fK1yzvPfThUAiNSOYhirskuc3OqOWNT+llIhBihrjN4fleLlsogb1oL83k+NajT2UDNp5gdk6D+
	4MlDaaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bun-00000009hny-01Eo;
	Mon, 22 Sep 2025 08:28:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bue-00000009hfA-40D9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79B5D44C44;
	Mon, 22 Sep 2025 08:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE0BC116B1;
	Mon, 22 Sep 2025 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529724;
	bh=uObPw0S3mvMocs9YeKVqpsEPMH1H13oQXDA2ZL7fzjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RViPu+oh+Pi7lWBLz2vkZCF9YKlTi7HdzTxcjfDwADvDAYsqf864Amflf/vQRN2hZ
	 I1WuSgTKgtCBMtYiOuk1caJKYvaJ/lxKpqqUmc9JwbKhGMdERAIyXt+E/js07yMwuy
	 dQtAjUw+4FpY9XBkBIvS2eiIJSTqRzQAb24MmAwXfLOiNCIaqM3bCd0nui+5nCDVt+
	 BJmc8IOZWugNsQEDyuBdmU2oHIQ4tvsyWu3aXkr39Cpt83SsaRHQhK9pjtUHFvGVHv
	 i+WLw26pWozDuTexOcSOpr4CEXsaYkXTidoqIfyKaLnfNTeqdBX43xsOK7bbktA1DG
	 xoarUu6R2FK5w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0buc-00000008Kds-0yLT;
	Mon, 22 Sep 2025 08:28:42 +0000
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
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 02/26] ACPI: irq: Add IRQ affinity reporting interface
Date: Mon, 22 Sep 2025 09:28:09 +0100
Message-ID: <20250922082833.2038905-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012845_037242_279F6BBB 
X-CRM114-Status: GOOD (  13.84  )
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

Plug the irq_populate_fwspec_info() helper into the ACPI layer
to offer an IRQ affinity reporting function. This is currently
only supported for the CONFIG_ACPI_GENERIC_GSI configurations,
but could later be extended to legacy architectures if necessary.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/acpi/irq.c   | 19 +++++++++++++++++++
 include/linux/acpi.h |  7 +++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
index 76a856c32c4d0..d1595156c86a4 100644
--- a/drivers/acpi/irq.c
+++ b/drivers/acpi/irq.c
@@ -300,6 +300,25 @@ int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res)
 }
 EXPORT_SYMBOL_GPL(acpi_irq_get);
 
+const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
+					    unsigned int index)
+{
+	struct irq_fwspec_info info;
+	struct irq_fwspec fwspec;
+	unsigned long flags;
+
+	if (acpi_irq_parse_one(handle, index, &fwspec, &flags))
+		return NULL;
+
+	if (irq_populate_fwspec_info(&fwspec, &info))
+		return NULL;
+
+	if (!(info.flags & IRQ_FWSPEC_INFO_AFFINITY_VALID))
+		return NULL;
+
+	return info.affinity;
+}
+
 /**
  * acpi_set_irq_model - Setup the GSI irqdomain information
  * @model: the value assigned to acpi_irq_model
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 1c5bb1e887cd1..c506ae4bacc86 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1509,12 +1509,19 @@ static inline int acpi_parse_spcr(bool enable_earlycon, bool enable_console)
 
 #if IS_ENABLED(CONFIG_ACPI_GENERIC_GSI)
 int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res);
+const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
+					    unsigned int index);
 #else
 static inline
 int acpi_irq_get(acpi_handle handle, unsigned int index, struct resource *res)
 {
 	return -EINVAL;
 }
+static inline const struct cpumask *acpi_irq_get_affinity(acpi_handle handle,
+							  unsigned int index)
+{
+	return NULL;
+}
 #endif
 
 #ifdef CONFIG_ACPI_LPIT
-- 
2.47.3


