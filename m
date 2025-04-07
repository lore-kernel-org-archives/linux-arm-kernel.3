Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D13CC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NhcoKa6JL1NM9sMn3gmj98XuhFiqjkn7M2jrThtdQE=; b=NIjd701M3/xkqYoDCk7EgTNx2R
	nF+ay62rY0PpUNd/SZ0+7xkerI7Ro4mL6IodoqjdfD5kuB4RtsBf8hrEJGwea37bbuXjgj+HYJa4t
	/Iv4zUegfI2ILS1FO/1cV4BUU8M9x6Kt3+wQ/LCRGFiBU638IdVtJjWCIlDpckwgAaz4E+wNrx4Ql
	elliC71UdIUZC4L4PsLjBp+00ejoamynfXEqhqpSCRAm4zpmp0duya0oISpTW5OJC4oSZvvyRTKBw
	nG0DQuREKuUGDtw7lQSBQRBJmlv5FwTUBuGsEp/bAXnvXuur4q5/S5hV9qlptFz5wjfq5/gow8Jfr
	xYClO+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uKm-000000027cg-1KYv;
	Mon, 07 Apr 2025 21:48:48 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sql-00000001wEB-1FXn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 20:13:44 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1E9C82113E7D;
	Mon,  7 Apr 2025 13:13:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1E9C82113E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744056822;
	bh=6NhcoKa6JL1NM9sMn3gmj98XuhFiqjkn7M2jrThtdQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s0doI5BIqSvNh80G4PtEpPG/GcrIH+4KzmJAOUk4cNIarK7Qz7QqL7bK6hmnu9uJf
	 vUAOcF6S2Chpd1S4F+Kl31SqdwT50lHmnLDhmgf1cFJuXB+MRXi0rUY08gduq48ZrJ
	 oKPn1dnQodDme1eUILnPzUqDulODD1su5F/LKApQ=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lenb@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@redhat.com,
	oliver.upton@linux.dev,
	rafael@kernel.org,
	robh@kernel.org,
	rafael.j.wysocki@intel.com,
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v7 10/11] ACPI: irq: Introduce acpi_get_gsi_dispatcher()
Date: Mon,  7 Apr 2025 13:13:35 -0700
Message-ID: <20250407201336.66913-11-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407201336.66913-1-romank@linux.microsoft.com>
References: <20250407201336.66913-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_131343_429373_098824F8 
X-CRM114-Status: GOOD (  10.62  )
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

Using acpi_irq_create_hierarchy() in the cases where the code
also handles OF leads to code duplication as the ACPI subsystem
doesn't provide means to compute the IRQ domain parent whereas
the OF does.

Introduce acpi_get_gsi_dispatcher() so that the drivers relying
on both ACPI and OF may use irq_domain_create_hierarchy() in the
common code paths.

No functional changes.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/irq.c   | 16 ++++++++++++++--
 include/linux/acpi.h |  5 ++++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
index 1687483ff319..76a856c32c4d 100644
--- a/drivers/acpi/irq.c
+++ b/drivers/acpi/irq.c
@@ -12,7 +12,7 @@
 
 enum acpi_irq_model_id acpi_irq_model;
 
-static struct fwnode_handle *(*acpi_get_gsi_domain_id)(u32 gsi);
+static acpi_gsi_domain_disp_fn acpi_get_gsi_domain_id;
 static u32 (*acpi_gsi_to_irq_fallback)(u32 gsi);
 
 /**
@@ -307,12 +307,24 @@ EXPORT_SYMBOL_GPL(acpi_irq_get);
  *	for a given GSI
  */
 void __init acpi_set_irq_model(enum acpi_irq_model_id model,
-			       struct fwnode_handle *(*fn)(u32))
+			       acpi_gsi_domain_disp_fn fn)
 {
 	acpi_irq_model = model;
 	acpi_get_gsi_domain_id = fn;
 }
 
+/*
+ * acpi_get_gsi_dispatcher() - Get the GSI dispatcher function
+ *
+ * Return the dispatcher function that computes the domain fwnode for
+ * a given GSI.
+ */
+acpi_gsi_domain_disp_fn acpi_get_gsi_dispatcher(void)
+{
+	return acpi_get_gsi_domain_id;
+}
+EXPORT_SYMBOL_GPL(acpi_get_gsi_dispatcher);
+
 /**
  * acpi_set_gsi_to_irq_fallback - Register a GSI transfer
  * callback to fallback to arch specified implementation.
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4e495b29c640..1917044dea72 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -336,8 +336,11 @@ int acpi_register_gsi (struct device *dev, u32 gsi, int triggering, int polarity
 int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
 int acpi_isa_irq_to_gsi (unsigned isa_irq, u32 *gsi);
 
+typedef struct fwnode_handle *(*acpi_gsi_domain_disp_fn)(u32);
+
 void acpi_set_irq_model(enum acpi_irq_model_id model,
-			struct fwnode_handle *(*)(u32));
+			acpi_gsi_domain_disp_fn fn);
+acpi_gsi_domain_disp_fn acpi_get_gsi_dispatcher(void);
 void acpi_set_gsi_to_irq_fallback(u32 (*)(u32));
 
 struct irq_domain *acpi_irq_create_hierarchy(unsigned int flags,
-- 
2.43.0


