Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84E3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlACwBlkYsz5jXiaB1uBPPwdDHwbTrrlRYMHHMPY2L0=; b=WjWcbZpe+X1XqnI2atynMlAv7A
	fV7dgtzBzYCZ3t0LUkbd5miaflssIouHI6BsqxtJpZYSia41yoSN3KmUOTKvB9ETUJY3rLWOEHSud
	w3Tni3eT0+DAf2+TIIC4GDpsKjrLK8KtUYe0kAhIW8CC54/KfhWLEBY4vLpVuLEb8tRCrVn0Rh815
	ozybFyOAQ1j3005SEYB0Pa/ekRnQHxB5q0JnTiZTfuhgSel8yQyv6mF8Yp5ShU6BmKIHnxkm+bfKU
	TVzHd+aRI/3vFPcuH2PDVCswHQ2AtrzIoHzCSDR3FymY010DpFyC4knncXvEO0LCT1aGSD3N2XaW+
	zpc0ko+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew5m-00000002JRR-1yJY;
	Wed, 01 Jul 2026 14:39:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew5k-00000002JQA-36Mp;
	Wed, 01 Jul 2026 14:39:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 62D434321D;
	Wed,  1 Jul 2026 14:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B54F1F00A3A;
	Wed,  1 Jul 2026 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916748;
	bh=vlACwBlkYsz5jXiaB1uBPPwdDHwbTrrlRYMHHMPY2L0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mgz+Ljps5aVGf6x6W5F7TdknZYM2fx/pL0xEJyyLGiJs6Q4AVv0uFkPD0KfaUyWNv
	 Ur13BMXRFD6fMLNuKuNgLWramyoQQaRIP2yrkvtbeGv72wSQLyN5v95Dk5nRVs+9Hx
	 KtCU6LfjPexTgFU9kTL5CWM6dr27W9/ASrJhB3q7tUTFYPqLH570zfykUpY63dUCUY
	 XdWvX8EShhzQk/fp7wwmg+FJIwTcZhD4G8LYIt7+A83rIX1b7lL4U4HCypoKjOpTcw
	 eV3d+buysa2lXhW+h5zPNHveS3SegmfVcHubnS/qWmpFoozDUg4lUzc1iFoM0GsN51
	 Hcg8xTJT1QI6g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 01 Jul 2026 16:38:49 +0200
Subject: [PATCH v3 1/7] ACPI: Add acpi_device_clear_dep() helper function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-1-c5562cf0fe29@kernel.org>
References: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-0-c5562cf0fe29@kernel.org>
In-Reply-To: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-0-c5562cf0fe29@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
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

Code clearing device dependencies in ACPI in drivers through

acpi_dev_clear_dependencies()

requires annoying ifdeffery to make sure it is compiled out on
!CONFIG_ACPI configurations.

Implement a wrapper function to clear device dependencies that can be used
in device drivers without conditional compilation.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
---
 include/linux/acpi.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 10d6c6c11bdf..4f950f5386d7 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -94,6 +94,12 @@ static inline void acpi_preset_companion(struct device *dev,
 	ACPI_COMPANION_SET(dev, acpi_find_child_device(parent, addr, false));
 }
 
+static inline void acpi_device_clear_dep(struct device *dev)
+{
+	if (has_acpi_companion(dev))
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+}
+
 static inline const char *acpi_dev_name(struct acpi_device *adev)
 {
 	return dev_name(&adev->dev);
@@ -908,6 +914,8 @@ static inline void acpi_preset_companion(struct device *dev,
 {
 }
 
+static inline void acpi_device_clear_dep(struct device *dev) {}
+
 static inline const char *acpi_dev_name(struct acpi_device *adev)
 {
 	return NULL;

-- 
2.34.1


