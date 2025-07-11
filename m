Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB982C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIMcAZzl2wgTkbzBnokzygglawosdc5xNO3bETXTgVM=; b=DLtTS7bgoc4ecRNaE10qBwU//w
	bdajyn3vLYEZpUv8Jal9I5wky6vrpO53/Gtu7R4/RlX0dvhh7iNuiqm3fYumVT/hzv9EDMnxkQ1Jm
	4WMhRuDhDKrI/DDeZv1q7evzlWZaZfJuXKrJGBrWQXV/+aCAR7fCt9CdLeoG6LmDRga3yFCjaJHP3
	NL6rpWhdx0YSS7F5LPJp8jTlxPCj9Ls+YZOfP20X1yZZjIg6K7aeTALOGBwyPsL6MeT7QKI/UasDo
	GYuABpAq/Sj6bsK4ZK/CCMxjY01Zy5pjE3vNSOqhuN2P9l8KifvbnkPePpcPmnOuR/tljCbVPYOEl
	gv8LafpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKJV-0000000Fmjn-1z4P;
	Fri, 11 Jul 2025 20:25:45 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJGr-0000000Fcum-160s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 19:18:58 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id B270A2115816; Fri, 11 Jul 2025 12:18:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B270A2115816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1752261535;
	bh=IIMcAZzl2wgTkbzBnokzygglawosdc5xNO3bETXTgVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wrwsu6LNTCgtIS5fpawoc7PvXv78sQHf5s9fm0lCrHe58ADwkI5aYuQFp0uNenWyv
	 M/QtuJG8oiPtOM0vx+QCZxs7jrN83E8RiRtkK150ACtIvOJLYeD3MvzVE4ItKLKGV9
	 i5GNj9anAUvJS4lX3UBRbAbROt63hvOeDxIznpa8=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	tglx@linutronix.de,
	bhelgaas@google.com,
	romank@linux.microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH v3 3/3] PCI: hv: Use the correct hypercall for unmasking interrupts on nested
Date: Fri, 11 Jul 2025 12:18:52 -0700
Message-Id: <1752261532-7225-4-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1752261532-7225-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1752261532-7225-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_121857_353251_D2220084 
X-CRM114-Status: GOOD (  14.97  )
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
RETARGET hypercall, issue the MAP_DEVICE_INTERRUPT hypercall to L1 to
complete the setup.

Rename hv_arch_irq_unmask() to hv_irq_retarget_interrupt().

Co-developed-by: Jinank Jain <jinankjain@linux.microsoft.com>
Signed-off-by: Jinank Jain <jinankjain@linux.microsoft.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/pci-hyperv.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index 275b23af3de2..13680363ff19 100644
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
+	if (hv_root_partition())
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


