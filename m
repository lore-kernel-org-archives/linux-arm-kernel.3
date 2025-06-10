Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6E4C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OIurZZU+W8LJhjgQv4K7OiVx/Za0G2uLpi0IQWvRSo=; b=Ed3O2qTOuAU1FE5oFcOuit/PlT
	DXTzj5QDyliXYFXw0btrrzRRipchb7ztPnyzZF+HmF5fQ5qOqCqleqaE0ROlbdAFGKefX1JyJUfNd
	++j91hAZP1zL8tyF5+vm+WQj/UXkJzW+8popUImFtng/JiorCbWfL9bGX41NCT+rzdLX1OtPZsyO5
	KC4FAWLPKXup6MPR/XzQdL41VGviGmsCIjUu6s3TvfK5O+dx1zS/nhFejsJDhg6HLCYopwf0bwIvH
	q2XRxj7GKH5TTwY2VsgswAxMGQWAQIqobUifv4OuwQQWy++dSaPksuhqMA80BYM1mP7Q/UUBzjgKU
	PNbcN04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8w8-00000008RJA-44qb;
	Wed, 11 Jun 2025 00:03:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8lO-00000008QGf-0RlL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 23:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2OIurZZU+W8LJhjgQv4K7OiVx/Za0G2uLpi0IQWvRSo=; b=LHopSWEtJbYlg0KPFX6QiKY3Ww
	Jarjc+GjsMq5s6BhUc0iia3U+iaAwZ6zOeQ1/WKTToBzWWR/iQn81KgTPGrpcukWFw7thEFHn7mXF
	ArigOCdfzRISXrqaTrxuq2sRJl0eLSwixp1AWGHTfH/4k7Uet1P9IRPp0EZD6wryljRl9363WOc6Q
	T8qrsWmAngkwSeoUbRXCULUPP0DTk+8y3HnRL6R5wtQshsEs0G0ZPiip3GLSOBoIJe5Z0lVBWlCHq
	C6UvfQbMGq/8D+IgI/ctDUOVRp8Xo5sQp+ayqs6vSjQ7pecSZvnjR5yIF7W3qeffxzba+LcDkIWNk
	Z7bCaRzQ==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8lK-0000000227F-2MiA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:52:17 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 809222115188; Tue, 10 Jun 2025 16:52:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 809222115188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749599529;
	bh=2OIurZZU+W8LJhjgQv4K7OiVx/Za0G2uLpi0IQWvRSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qMlakPqvE+vQ1DebGap+Ye6OBZa6NnUYPh3gXIJV7wyy7Wjk7E1Cby06xj9ViXuCJ
	 oWIWOHbtX2mEHM+Kc12WmLboZfDbNWLapRNElVyOCZ2qrYhpvJbUbDfFnqL7VbO365
	 a4iZJmfff5uYK258r9c3RW8w5crRqmbPT7Af8CBY=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH 4/4] PCI: hv: Use the correct hypercall for unmasking interrupts on nested
Date: Tue, 10 Jun 2025 16:52:06 -0700
Message-Id: <1749599526-19963-5-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_005214_967257_B578651B 
X-CRM114-Status: GOOD (  14.86  )
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

From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

Running as nested root on MSHV imposes a different requirement
for the pci-hyperv controller.

In this setup, the interrupt will first come to the L1 (nested) hypervisor,
which will deliver it to the appropriate root CPU. Instead of issuing the
RETARGET hypercall, we should issue the MAP_DEVICE_INTERRUPT
hypercall to L1 to complete the setup.

Rename hv_arch_irq_unmask() to hv_irq_retarget_interrupt().

Co-developed-by: Jinank Jain <jinankjain@linux.microsoft.com>
Signed-off-by: Jinank Jain <jinankjain@linux.microsoft.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 drivers/pci/controller/pci-hyperv.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index 4d25754dfe2f..0f491c802fb9 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -600,7 +600,7 @@ static unsigned int hv_msi_get_int_vector(struct irq_data *data)
 #define hv_msi_prepare		pci_msi_prepare
 
 /**
- * hv_arch_irq_unmask() - "Unmask" the IRQ by setting its current
+ * hv_irq_retarget_interrupt() - "Unmask" the IRQ by setting its current
  * affinity.
  * @data:	Describes the IRQ
  *
@@ -609,7 +609,7 @@ static unsigned int hv_msi_get_int_vector(struct irq_data *data)
  * is built out of this PCI bus's instance GUID and the function
  * number of the device.
  */
-static void hv_arch_irq_unmask(struct irq_data *data)
+static void hv_irq_retarget_interrupt(struct irq_data *data)
 {
 	struct msi_desc *msi_desc = irq_data_get_msi_desc(data);
 	struct hv_retarget_device_interrupt *params;
@@ -714,6 +714,20 @@ static void hv_arch_irq_unmask(struct irq_data *data)
 		dev_err(&hbus->hdev->device,
 			"%s() failed: %#llx", __func__, res);
 }
+
+static void hv_arch_irq_unmask(struct irq_data *data)
+{
+	if (hv_nested && hv_root_partition())
+		/*
+		 * In case of the nested root partition, the nested hypervisor
+		 * is taking care of interrupt remapping and thus the
+		 * MAP_DEVICE_INTERRUPT hypercall is required instead of
+		 * RETARGET_INTERRUPT.
+		 */
+		(void)hv_map_msi_interrupt(data, NULL);
+	else
+		hv_irq_retarget_interrupt(data);
+}
 #elif defined(CONFIG_ARM64)
 /*
  * SPI vectors to use for vPCI; arch SPIs range is [32, 1019], but leaving a bit
-- 
2.34.1


