Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2902BC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 21:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NhcoKa6JL1NM9sMn3gmj98XuhFiqjkn7M2jrThtdQE=; b=XFXdZvOw4VZffSVbyKC/p2SET1
	xvTs7DGTU/swWrizphAg9/rP11t6HbCYF1Lp8wMPs/wG9H5T1k9/5uIy72QV+XQpv/ItdtLuvFlCG
	n2Migs5bj8OB2sJLUQ4lJLQRW/aQihZakxJ7MMPs5tZ6U9LVaADZinJ/aQrT7Hv/PJa/ycDs04wdB
	osTxx8+h9WIRHRXGc46ri753/XKUDtCihyUv6nqBiFuhkOVrhfYesCABT419QFjRNif0oiaFrftVj
	6akHxlxCpr3JKCZeWD8CO4gn6kO2dV+Z2+Ryr+LPwE1Ux8luRsWBJ+jBfYe5woIHtb1XsUXae41N7
	k1et+xqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9W4r-00000007ciy-42u6;
	Mon, 28 Apr 2025 21:31:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vhm-00000007ZIC-2lUm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 21:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6NhcoKa6JL1NM9sMn3gmj98XuhFiqjkn7M2jrThtdQE=; b=TXcZSH5I0lWQaboLh36RQAiN50
	XGj2DgesmU9OQxOLcj9N88/rPQL5KipLuaWcOyXiUQDQTo9cPYEHFRnL6J2aWYQNH9x2G+l2r7L5O
	TQcRoC5QCJ19s0qRn3UogM9DCADnpGKtF77ieeovPp9+SdG8B45OjFY3ZqRrdrGYBM32xZNTb89g7
	EcJIjDhLaa0azducfvZbvqnDqvKj/hzqJK/ziNCNXGIpM68jiTmjyHNsgNNLwyOvmflvjuGIXijmO
	yyN6xa3ws2nVfyglrl3nOnbvVlblmoHQ7J1zH4484kww5a0OjCDFa5aPEgaoEdxX3K34C38fu/YWC
	jp652BZw==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Vhg-0000000D3Bp-2A4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 21:07:56 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 68E9E211AD1F;
	Mon, 28 Apr 2025 14:07:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 68E9E211AD1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1745874467;
	bh=6NhcoKa6JL1NM9sMn3gmj98XuhFiqjkn7M2jrThtdQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jwo1/Znv21DwhCwBkZB4bkCP3jGQY+BoKRyw9i0SnKH+c977NDRZA1JeslcM8DbHq
	 d0gSlA/QJgMEoWGPIf6suAfT1E7CtJZ7rMQZtSBLnC1X++4Xdm7IDBonL6NldD89EM
	 krWea9gXWRuVAAeJbQq9ZPvxkkv97n8QniJlU+8Y=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
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
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	linux-hyperv@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v9 10/11] ACPI: irq: Introduce acpi_get_gsi_dispatcher()
Date: Mon, 28 Apr 2025 14:07:41 -0700
Message-ID: <20250428210742.435282-11-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428210742.435282-1-romank@linux.microsoft.com>
References: <20250428210742.435282-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_220753_970666_14A85157 
X-CRM114-Status: GOOD (  10.92  )
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


