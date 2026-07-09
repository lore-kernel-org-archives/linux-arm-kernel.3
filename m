Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1313C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vu/X/SkKCf8BDgHCKFoN7Pak7eOCPEtAIjSdYOyjR7k=; b=130tqXejhnWPL6Wz3sSFkS8qLX
	+Ssh31AspwiHqSh0A9UjipFqpGKvjXP4zG1KZpiWNg0tgTfwv2qEV3Xsr8ulNExmRpE5PNCJCIZZt
	F7DohI+c8YGXN0617CoiChWNRzHKPpJc/p+waPb130fZybaxzoMtQI9AAu6RdtreydnQfNhbCArZT
	aB6TkSVQkan/HCaZR0ILzVV0ux+M9JB+UXiF38BbW1t3eV9o+LW9hg4m0wUOEgGW97rzw/IZtFgxy
	KqOnmjIv6J5Pkj04VvdjIitq1IWkGTL7Vkk+CHCXBhbkODr5YVY7a4LyEPElVXr5lWDeQqgcKh4qH
	rjoyj5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnob-00000002OuW-15Nz;
	Thu, 09 Jul 2026 12:25:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnoX-00000002Otr-3ey9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:25:15 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5b015b2d792so951294e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599911; x=1784204711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vu/X/SkKCf8BDgHCKFoN7Pak7eOCPEtAIjSdYOyjR7k=;
        b=SUhHU82CcvipNVxx5l+N0NSh5wPMa8+hrgVUlKYCgsFjf2tvtm2ldFzAdMeWy3bupQ
         Mln1DB9H6P3TnIi1PIlDWB3Z+7YBzIPgyBD3Jhz5WMfLTJueTCsV+dppMBGTIJfPq83o
         Utu96RZEyA+ogCrInOSfMWz7lY6PpgXHUkuWBoiqYj3M1C31x4cZYyNhhkPE1L7aJlPa
         GwTmTxGo/Oks0kZHt+yIjGcItvaws62I3tbSQGU1pyWkod9dwWBc2oLiUouqbf1QpEWU
         xaZWZeRd2MPLILHh6HgXJxyyihPV+BUHnEAltMYHL2hPMRXLFUmAuRD6T1zX1emODy65
         t6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599911; x=1784204711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vu/X/SkKCf8BDgHCKFoN7Pak7eOCPEtAIjSdYOyjR7k=;
        b=nZa5smadR2B6+aJO/efC8unexvqE8INy4QP6c3NuxxpRCclMAm/Dc4ucCzbmaf6Jwe
         /S819yuPdVTr8rXqfnkXUnkiSpsmdgI74uHqF7GNxMDtIKxc/i8MyfYq9iMnvq9K9/N5
         QGhiZTCf09ynkjqKvxyRDasuPUl9QSvUhk60326t9JPabGrehwtzl1z+2MC0aKPE4kBv
         4fMKDzil7gh5bRxMNOFyW9iPts6G8X8/TWDp/ETKvuZItTQs/AVxqAAg3hF4ZzRuy/Ki
         Ijm7PreQGGQXghvMtnMYAgG64fdifWGeLvEvysczDwc07aaL2Dn8PirLiZAw6fiKEudw
         5j1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqCCUuyjaxoQTpV1DrLiREbCj+g9PPpAuIL7BBTHOLuAa8Dj7bk9J3DZAYYCjfff5o/xTSF+g0vib66wwgHgZOm@lists.infradead.org
X-Gm-Message-State: AOJu0YxJy3ZSeqhWlztXEshTAZzLHTlJBjvvsf70vPbZjEew9AjC7vRj
	0zuAIwnrUh1NhWyX0OJMwj12DsB84Tzj/a4EKM7BY+ZygmQuAjuTCvkwWCS8oSiI
X-Gm-Gg: AfdE7clhyYudRG1+eXsl8F8I3W/4RJDUGkyCdlj6AAcMrJSVRjtB2S/d6bsZJE2gQvH
	e/a5qTS+XcUNurI5vjjI8+yF4Gcis8bm186uDUUJhDglBAHl61fKir1vAac4zlcgRbsBIL5Wvbo
	3fquvFlXe0k0fNaQ/NNq58lfD2+FzMfIGKwW8CeAVyupldWCRxGEimTUgqckEf+uhRfqgOgWc1L
	TyDfZfKRed57Z20bojFe8SVAsjIaY/qCVacc/FDfzMUzHSgEuYRP+Np14f+PjQ1ctjLlqzE+Dpx
	giKiuOrNjd1Ax4T5x/FvwZX0YxNi5iDDp/11PANuNCrF0ke2A8kOSh2qN/dIQAGqDx6EvIzq/gQ
	XxI8NK7gfgbpNGg1m+h6bEGJaa8Q/Itc971V9BKzcHkXvBT7K1Tg9EADkzpjddn/Ne7Kg72pjfw
	O9qVe+uMUXBKwyzGyDaEXfbBMAfGM0/8JTf48Zd9PE2NpSMWFyIl95bWx5U45jRu06T/LAuCup
X-Received: by 2002:a05:6512:2c93:b0:5b0:197b:9829 with SMTP id 2adb3069b0e04-5b0197b99b7mr332166e87.41.1783599910888;
        Thu, 09 Jul 2026 05:25:10 -0700 (PDT)
Received: from maverickamd.dyn.int.numascale.com (fwa5d93-21.bb.online.no. [88.93.147.21])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5aed13c3bf2sm5277697e87.69.2026.07.09.05.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:25:10 -0700 (PDT)
From: Steffen Persvold <spersvold@gmail.com>
To: Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steffen Persvold <spersvold@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] PCI: host-generic: Fix NULL pointer dereference on 32-bit CAM systems
Date: Thu,  9 Jul 2026 14:24:46 +0200
Message-Id: <20260709122446.3151899-1-spersvold@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_052513_974749_641A96DE 
X-CRM114-Status: GOOD (  16.30  )
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

On 32-bit systems the config space is too large to ioremap in one go, so
pci_ecam_create() maps each bus segment separately and relies on the
->add_bus callback (pci_ecam_add_bus) to populate the per-bus mapping in
cfg->winp[]. pci_ecam_map_bus() then uses that mapping as the base for
every config access.

The generic ECAM ops (pci_generic_ecam_ops) already provide the ->add_bus
and ->remove_bus callbacks, but the CAM (legacy) ops in pci-host-generic.c
do not. As a result, on a 32-bit host using "pci-host-cam-generic" the
per-bus mapping is never set up and the first config read dereferences a
NULL base, crashing during bus enumeration:

[    1.430647] Unable to handle kernel NULL pointer dereference at virtual address 00000800
[    1.439441] Oops [#1]
[    1.442152] CPU: 0 PID: 1 Comm: swapper Not tainted 6.9.7+ #43
[    1.448753] Hardware name: Digilent Nexys-Video-A7 RV32 (DT)
[    1.454968] epc : pci_generic_config_read+0x40/0xb0
[    1.460652]  ra : pci_generic_config_read+0x2c/0xb0
[    1.534729] [<c038db9c>] pci_generic_config_read+0x40/0xb0
[    1.541096] [<c038da04>] pci_bus_read_config_dword+0x50/0xb0
[    1.547623] [<c0391e94>] pci_bus_generic_read_dev_vendor_id+0x3c/0x1ec
[    1.555010] [<c039245c>] pci_scan_single_device+0xa4/0x11c
[    1.561273] [<c0392570>] pci_scan_slot+0x9c/0x23c
[    1.566716] [<c039388c>] pci_scan_child_bus_extend+0x58/0x2f4
[    1.573275] [<c0393db0>] pci_scan_root_bus_bridge+0x64/0xe8
[    1.579650] [<c0393e54>] pci_host_probe+0x20/0xc8
[    1.591396] [<c03bc6f4>] pci_host_common_probe+0x144/0x1e4

Fix this by giving the CAM ops the same ->add_bus/->remove_bus callbacks.
Since pci_ecam_add_bus() and pci_ecam_remove_bus() are static to ecam.c,
move the CAM ops definition there as pci_generic_cam_ops (mirroring
pci_generic_ecam_ops) and export it for pci-host-generic.c to reference.

Fixes: 8fe55ef23387 ("PCI: Dynamically map ECAM regions")
Cc: stable@vger.kernel.org
Signed-off-by: Steffen Persvold <spersvold@gmail.com>
---
 drivers/pci/controller/pci-host-generic.c | 11 +----------
 drivers/pci/ecam.c                        | 13 +++++++++++++
 include/linux/pci-ecam.h                  |  3 +++
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pci-host-generic.c b/drivers/pci/controller/pci-host-generic.c
index c1bc0d34..9e85c6e9 100644
--- a/drivers/pci/controller/pci-host-generic.c
+++ b/drivers/pci/controller/pci-host-generic.c
@@ -16,15 +16,6 @@
 
 #include "pci-host-common.h"
 
-static const struct pci_ecam_ops gen_pci_cfg_cam_bus_ops = {
-	.bus_shift	= 16,
-	.pci_ops	= {
-		.map_bus	= pci_ecam_map_bus,
-		.read		= pci_generic_config_read,
-		.write		= pci_generic_config_write,
-	}
-};
-
 static bool pci_dw_valid_device(struct pci_bus *bus, unsigned int devfn)
 {
 	struct pci_config_window *cfg = bus->sysdata;
@@ -60,7 +51,7 @@ static const struct pci_ecam_ops pci_dw_ecam_bus_ops = {
 
 static const struct of_device_id gen_pci_of_match[] = {
 	{ .compatible = "pci-host-cam-generic",
-	  .data = &gen_pci_cfg_cam_bus_ops },
+	  .data = &pci_generic_cam_ops },
 
 	{ .compatible = "pci-host-ecam-generic",
 	  .data = &pci_generic_ecam_ops },
diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
index 119de32f..a9b3bce2 100644
--- a/drivers/pci/ecam.c
+++ b/drivers/pci/ecam.c
@@ -208,6 +208,19 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
 };
 EXPORT_SYMBOL_GPL(pci_generic_ecam_ops);
 
+/* CAM ops */
+const struct pci_ecam_ops pci_generic_cam_ops = {
+	.bus_shift	= 16,
+	.pci_ops	= {
+		.add_bus	= pci_ecam_add_bus,
+		.remove_bus	= pci_ecam_remove_bus,
+		.map_bus	= pci_ecam_map_bus,
+		.read		= pci_generic_config_read,
+		.write		= pci_generic_config_write,
+	}
+};
+EXPORT_SYMBOL_GPL(pci_generic_cam_ops);
+
 #if defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS)
 /* ECAM ops for 32-bit access only (non-compliant) */
 const struct pci_ecam_ops pci_32b_ops = {
diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
index d9306514..044f67ce 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -81,6 +81,9 @@ void __iomem *pci_ecam_map_bus(struct pci_bus *bus, unsigned int devfn,
 /* default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
 
+/* default CAM ops */
+extern const struct pci_ecam_ops pci_generic_cam_ops;
+
 #if defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS)
 extern const struct pci_ecam_ops pci_32b_ops;	/* 32-bit accesses only */
 extern const struct pci_ecam_ops pci_32b_read_ops; /* 32-bit read only */

base-commit: 53bf92818a8362815708fc7b18e6d2c6a5fc665b
-- 
2.40.1


