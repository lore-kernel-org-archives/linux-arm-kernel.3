Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30249D6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G80husZ+iTC66Jzkr/GidUl6WYziBjz7qGAQ1/cTWDA=; b=KD/JdEF5TGWJEk1KujnKuEu9fq
	yL0lskYrQ7AKUwLMWlQfZzyN27p4xr0ZbwTP+rgpWF/4sqzhKt+sxPnIkG4U5QSnd1EyEnZBjYro9
	i2Zdzm4L3tawrG34diLPuj7NCjPhSOzfqxbiIb2zPRgTB8D0Ed8D+fR2Tnrog+Gb7XqE/Nw8PbqYG
	76ClPMq3Yl0d+3FZupc2T+jB+NQyOb1gRcO7cFlUBwOg4Pjci0BhjYJ7t8CFrEFAENAjmulSLwZrS
	2+550RYUg48LlXMR9bFIpKLxH57Dn+/uYgUVh9dd3IepSu6QOMkq/iVaPp0h+jbLhfGHAoP6NDAEJ
	Z71kJ6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVplG-00000006jVa-0J8m;
	Wed, 17 Dec 2025 11:32:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVplD-00000006jUf-3iTh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:32:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83C89169C;
	Wed, 17 Dec 2025 03:31:55 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB9843F73B;
	Wed, 17 Dec 2025 03:32:00 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: [PATCH 12/12] doc: ras: describe firmware-first estatus flow
Date: Wed, 17 Dec 2025 11:28:45 +0000
Message-ID: <20251217112845.1814119-13-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_033203_968210_0F11BF04 
X-CRM114-Status: GOOD (  10.24  )
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

Add a short section to the RAS admin guide that explains how the new
estatus core and DeviceTree provider are enabled, and point readers to
the binding that describes the firmware-first CPER layout.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 Documentation/admin-guide/RAS/main.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/RAS/main.rst b/Documentation/admin-guide/RAS/main.rst
index 5a45db32c49b..adff8b4bc84b 100644
--- a/Documentation/admin-guide/RAS/main.rst
+++ b/Documentation/admin-guide/RAS/main.rst
@@ -205,6 +205,30 @@ Architecture (MCA)\ [#f3]_.
 .. [#f3] For more details about the Machine Check Architecture (MCA),
   please read Documentation/arch/x86/x86_64/machinecheck.rst at the Kernel tree.
 
+Firmware-first CPER status providers
+------------------------------------
+
+Some systems expose Common Platform Error Record (CPER) data via firmware
+interfaces instead of relying on CPU machine-check banks. The kernel routes
+those records through the shared *estatus* core:
+
+* ``CONFIG_RAS_ESTATUS_CORE`` hosts the in-kernel data movers and notifiers.
+  It is selected automatically when ACPI/APEI GHES support is enabled or when
+  the DeviceTree provider below is built.
+* ``CONFIG_RAS_ESTATUS_DT`` adds the ``drivers/ras/estatus-dt.c`` provider that
+  maps a firmware-advertised CPER status block on non-ACPI platforms. The
+  DeviceTree binding is documented in
+  ``Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml`` and describes the
+  status-buffer region and the notification signal (interrupt or polling) that
+  firmware uses to advertise new records.
+
+Once a platform describes a firmware-first provider, both ACPI GHES and the
+DeviceTree driver reuse the same code paths: CPER sections are iterated with
+``estatus_for_each_section()``, logged through ``cper_estatus_print()``, and
+handed to the RAS notifier chains that trigger memory-offline, PCIe AER, or
+vendor-specific handlers. This keeps the behaviour consistent regardless of
+whether the error source is described via ACPI tables or DeviceTree.
+
 EDAC - Error Detection And Correction
 *************************************
 
-- 
2.43.0


