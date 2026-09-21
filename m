Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F354C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Qu1+WZY8bl4VhPrsVVKqjPgM7e+P4+6OSuarLl4alY=; b=tW6Mw9js8aXqlmzlnjCk3uSoK9
	Voxb5Lt47kM/itMBb3FYNvgUR+goHTZssybEQkQLfz/hHHrGpOGeFuy8I2xRkYGn+4uf//Lbc+wj6
	I+kfwnpZcVOGxF8YpsZhcXFW8ZUKa/O43siEklCLe3sT89h6fPwGrUyw1NXzeThv2juH4SWleJTCx
	ZPGd72HmvNRKD18plMCGF3nObL4yyxRSPyZb3yPaAb2AN5OPTTsJNeCLfN/tB/h4PHmiJz2Nquq6o
	GUUskwssFtCwklhADKMrKuVKTy2fYxylf7uMR8ShAkrgtAqsXU7BLDRH0jXLk6sNnycSnL6LDOghc
	+OUyNobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k8S-00000003HU4-0nid;
	Mon, 21 Sep 2026 19:57:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8k8Q-00000003HTb-3ejf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:57:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C280413C3;
	Mon, 21 Sep 2026 19:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159021F000FF;
	Mon, 21 Sep 2026 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790020626;
	bh=4Qu1+WZY8bl4VhPrsVVKqjPgM7e+P4+6OSuarLl4alY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M/i+lPJY5pULFbcirUNA/QJkzvftB+OzaGhSJ+ohSAGP0lnuGEqLIhwSl6D67Pq/r
	 7o+DTqC22yBwz2SebO8n/SLR1FYjGYiVUVfrCPcGA1rbenUNsUSNzjqM6yXgf8y/Z0
	 tkiFy2tJs/aUGLH+zzgrHWF8sR8pYKDGIICzUDrKtotsIX3/rWkuHSU/GX5RRM4gDm
	 bpHYi/A1p/Tzf+y4kofxlOvKBOZ7Czg5e8+Iw8ImwxKcDfsgD3qEfl4/FLtwrX0mRH
	 +566dLnYIHsqoUXNydy8WSee7i3fKAiGqkVI52Z+uQ0TXFjY9YeV6Hl+o1/oLSIZgx
	 piwixq3lxFW+A==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: [PATCH v1 17/17] ACPI: bus: Drop acpi_get_first_physical_node()
Date: Mon, 21 Sep 2026 21:56:41 +0200
Message-ID: <9732391.rMLUfLXkoz@rafael.j.wysocki>
Organization: Linux Kernel Development - Intel
In-Reply-To: <7995179.EvYhyI6sBW@rafael.j.wysocki>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
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





