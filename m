Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDCACA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=az8uo1MSqUUzA+uFMs11FJL351K6zE7Q4oadgfzKqQU=; b=pDP3PZkCEiFltpZDM9m1nawF8X
	fa+qnWJJ7985ZIAYCR2COXr8FAUjQKh+QngjKhMd7qJadMY37AUuaggB1s3EuJoLLcfpItgWcnCHq
	RXb8Q+RTaLtubSfTRge5qq743lCY5igCIWQs44q9irOzSma83bW2bJNEJdVqkgoW2JZ8JWpwNITDQ
	7QRDeN7F0I9VVm5UwOsmbSVsnAj3J1+m6P9ViJNCV1WTuejgkmBk8zA9T+zsU0v/2ohDrmgGFauWu
	R0W2h35Z3tESzDa2/Gvb3C3k2+YeWaEMv7PFaWg6dIcWTXEwMWMyLlvzFidoGbCb0AmcLiq54rC10
	oXdcSTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzIp-000000070K5-0kwu;
	Wed, 30 Sep 2026 18:45:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzIn-000000070Jc-32Vx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:45:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F41B43D02;
	Wed, 30 Sep 2026 18:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B73E1F00898;
	Wed, 30 Sep 2026 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790793913;
	bh=az8uo1MSqUUzA+uFMs11FJL351K6zE7Q4oadgfzKqQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W1oPMbDZDb9X3TZvQnW9wpA+7P3OTh5oyRYCj0nYgsvRzds8UZIOUN7twv+Mp6LN7
	 oTNJM+Kk/F8odvVkjaF3gA8jkdxhQUxjpJRli8QHEXNK+fqUNy8MU2ih2fMaIe86+6
	 Rr4g3q64Vm4QU1NIT1M39hSbR7Wy/HCsGrs1YxSPP3kHZ26trjQ8pUvReERPEkThcI
	 vIIaNzZRCL0J/7jY0NqE7eN7Njxpf1S/qmB71J5AjVKEouBf+mtKGP53iSnQRJPZ3b
	 WdwEHlhFfzY+GWieOF6xABzlTsycghPfsrbOc3hql+K1XifVYK0zy63HkFmL+0q02q
	 l5oWVukBQOM+g==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>
Subject: [PATCH v2 5/5] ACPI: bus: Drop acpi_get_first_physical_node()
Date: Wed, 30 Sep 2026 20:45:01 +0200
Message-ID: <4537440.ejJDZkT8p0@rafael.j.wysocki>
Organization: Linux Kernel Development - Intel
In-Reply-To: <4766532.LvFx2qVVIh@rafael.j.wysocki>
References: <4766532.LvFx2qVVIh@rafael.j.wysocki>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Fold acpi_get_first_physical_node() into acpi_primary_dev_companion()
that is its only remaining caller and drop its signature from the
header file.

No intentional functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---

v1 -> v2:
   * Add R-by from Sudeep

---
 drivers/acpi/bus.c   | 20 +++++---------------
 include/linux/acpi.h |  7 -------
 2 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 808c6746be14..cc6989d88645 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -809,24 +809,14 @@ struct device *acpi_bus_get_primary_device(struct acpi_device *adev)
 }
 EXPORT_SYMBOL_GPL(acpi_bus_get_primary_device);
 
-/**
- * acpi_get_first_physical_node - Find first physical node of an ACPI device
- * @adev:	ACPI device in question
- *
- * Return: First physical node of ACPI device @adev
- */
-struct device *acpi_get_first_physical_node(struct acpi_device *adev)
-{
-	guard(mutex)(&adev->physical_node_lock);
-
-	return primary_physical_device(adev);
-}
-EXPORT_SYMBOL_GPL(acpi_get_first_physical_node);
-
 static struct acpi_device *acpi_primary_dev_companion(struct acpi_device *adev,
 						      const struct device *dev)
 {
-	const struct device *phys_dev = acpi_get_first_physical_node(adev);
+	const struct device *phys_dev;
+
+	guard(mutex)(&adev->physical_node_lock);
+
+	phys_dev = primary_physical_device(adev);
 
 	return phys_dev && phys_dev == dev ? adev : NULL;
 }
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index ba5234bd93a2..6f69819f9c9a 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -105,8 +105,6 @@ static inline const char *acpi_dev_name(struct acpi_device *adev)
 	return dev_name(&adev->dev);
 }
 
-struct device *acpi_get_first_physical_node(struct acpi_device *adev);
-
 enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_PIC = 0,
 	ACPI_IRQ_MODEL_IOAPIC,
@@ -938,11 +936,6 @@ static inline const char *acpi_dev_name(struct acpi_device *adev)
 	return NULL;
 }
 
-static inline struct device *acpi_get_first_physical_node(struct acpi_device *adev)
-{
-	return NULL;
-}
-
 static inline void acpi_early_init(void) { }
 static inline void acpi_subsystem_init(void) { }
 
-- 
2.51.0





