Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B3FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHL188Nj5+yqrL8mng5guoa0IqOtyiM8dMyA+ULInrY=; b=3A/kTk8o6+hVdxLSG9SmfnurD0
	RmRv0F+mYOR5yomic1C6wawMyjuUF/bHXgThMb3b+3egL9Yivs+WGuAMlyhJNTBPXEpZHSVGfNozL
	aC+1hgoSNWTedhRLVOjblHzYJ+lfrRvzr5fP7QaoPotH1ZMNXlUeo8YwBR1u1RzhxKL/qv8YZgPam
	pH0UfdVu/EyZGdX5lsKg86Ir43qoi6Mtxw5ynMlJh3a+SvPcW40T2wWTaOyhAqlWZD9ciOXE58Xbb
	Uvg5KhgSRSk1VjQ8EUbJlpf59glcAdELBi5PbJAAoV40c9qsxL2EgA3bxBBGoR5/0gAUWlnOwml8n
	/4OdW47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fY-0000000CqXk-3NIm;
	Fri, 25 Sep 2026 07:48:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fS-0000000CqVo-22fx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:48:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E89A16022E;
	Fri, 25 Sep 2026 07:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9621F000FF;
	Fri, 25 Sep 2026 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322505;
	bh=eHL188Nj5+yqrL8mng5guoa0IqOtyiM8dMyA+ULInrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RF6xusXXm/WrUq5kBGVZ4QwW6vwZFAuBYLOJsIzpFGz8BEOQy6vRr4C1tgSv2ixZw
	 KpV0ZXJS9QeL2o1QgKLfAcGsAbxOiGo3dn8Ldrrkh4+f7m1U+Y2wLeQk4wdNleNDWc
	 8i7cCy5a29eszUz3RU00fJA+riGTPA8F8OAO5OJafnxfAqFgV6MpzN9xpSEQ53koyC
	 0l6KKY2bu9YIBKuoFcbiR22E8PlKCklUJtPmwVC0nPqdiw/xcd5+5NBf7kqLASjTZM
	 jEMRXSxBafGsJWGrKEt6vouxMZyH+qliAVxkxQiCL8VLCQhWZ+xKFuYMtsA0SHah4n
	 dYPiLQoid/NMA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:01 +0200
Subject: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Robin Murphy <robin.murphy@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 linux-watchdog@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
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

To describe and map GSIs for firmware nodes created out of ACPI static
table entries in a uniform way it is required to define some standard
properties and attach them to ACPI static fwnode as secondary nodes.

Define properties names to describe GSIs and their trigger-mode/polarity,
and implement an irq_get() callback for static fwnodes so that core code
can retrieve and map IRQs for ACPI static fwnodes in standard manner.

An empty stub for property_read_string_array() is also added, so that
the fwnode_irq_get_byname() interface falls back (through
fwnode_property_read_string_array()) to the secondary
fwnode to grab the "interrupt-names" property.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
---
 drivers/acpi/property.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/acpi.h    |  4 +++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 8ee5a1f0eb48..c609100c08db 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1766,7 +1766,74 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
 
 DECLARE_ACPI_FWNODE_OPS(acpi_device_fwnode_ops);
 DECLARE_ACPI_FWNODE_OPS(acpi_data_fwnode_ops);
-const struct fwnode_operations acpi_static_fwnode_ops;
+
+static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
+						  const char *propname,
+						  unsigned int index, u32 *value)
+{
+	u32 *values;
+	int ret, count;
+
+	count = fwnode_property_count_u32(fwnode, propname);
+	if (count < 0)
+		return count;
+
+	if (index >= count)
+		return -ENOENT;
+
+	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
+	if (!ret)
+		*value = values[index];
+
+	kfree(values);
+	return ret;
+}
+
+static int acpi_static_fwnode_read_string_array(const struct fwnode_handle *fwnode,
+						const char *propname,
+						const char **val, size_t nval)
+{
+	/* Route string handling to secondary software nodes */
+	return -EINVAL;
+}
+
+static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
+				      unsigned int index)
+{
+	u32 gsi, trigger, polarity;
+	int ret;
+
+	if (!fwnode->secondary)
+		return -ENODEV;
+
+	fwnode = fwnode->secondary;
+
+	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI,
+						index, &gsi);
+	if (ret)
+		return ret == -ENOENT ? -ENXIO : ret;
+
+	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_TRIGGER,
+						index, &trigger);
+	if (ret)
+		return ret == -ENOENT ? -ENXIO : ret;
+
+	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_POLARITY,
+						index, &polarity);
+	if (ret)
+		return ret == -ENOENT ? -ENXIO : ret;
+
+	return acpi_register_gsi(NULL, gsi, trigger, polarity);
+}
+
+const struct fwnode_operations acpi_static_fwnode_ops = {
+	.property_read_string_array = acpi_static_fwnode_read_string_array,
+	.irq_get = acpi_static_fwnode_irq_get,
+};
 
 bool is_acpi_device_node(const struct fwnode_handle *fwnode)
 {
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index ddacac812094..749cbbdcad08 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -378,6 +378,10 @@ int acpi_register_gsi (struct device *dev, u32 gsi, int triggering, int polarity
 int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
 int acpi_isa_irq_to_gsi (unsigned isa_irq, u32 *gsi);
 
+#define ACPI_IRQ_PROP_GSI		"linux,acpi-gsi"
+#define ACPI_IRQ_PROP_GSI_TRIGGER	"linux,acpi-gsi-trigger"
+#define ACPI_IRQ_PROP_GSI_POLARITY	"linux,acpi-gsi-polarity"
+
 typedef struct fwnode_handle *(*acpi_gsi_domain_disp_fn)(u32);
 typedef acpi_handle (*acpi_gsi_handle_disp_fn)(u32);
 

-- 
2.54.0


