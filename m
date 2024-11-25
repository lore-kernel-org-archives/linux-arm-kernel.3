Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCA3D58D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CQ95oU+0HOhQRGL6k7JlfvmEMox8VnUK+GdnjMco7Y=; b=EpEkUhsvBUhcAx8vLrJ+9Ez0se
	FO6eJAvkd27nDzuDrPY41lT/O+v6nirdBqU5BfY2PPsVzPjNBvzG6mik3krDocN52BjWTrWZrSAdA
	r7o+cR8MnNDBSXXCNd4UWKfe92SIFJfdDIBSRoVpiM9ylLdVFj+OpRGnqVay68297TyXAHrF21MLC
	CpHL8jmfaEpv2pJb49vapOYakoKlN8nsQCKVnrF+2asLDYCDz/q4vTaxb5pu1XMuV0hA8xJsQl6RZ
	uHitWxUSOgUiqjGY0wnfVtYxPMg2EfSTTEFMxa5Yw8p9w6hg5PguF/KhfO9tyyTf4dUd0Hr1DeXb0
	3dGJjmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcc0-00000008ik7-2Eo3;
	Mon, 25 Nov 2024 17:11:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcZH-00000008iC9-2fZr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:08:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA8C201B;
	Mon, 25 Nov 2024 09:08:37 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C30793F58B;
	Mon, 25 Nov 2024 09:08:05 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: ardb@kernel.org,
	broonie@kernel.org,
	sami.mujawar@arm.com,
	sudeep.holla@arm.com,
	pierre.gondois@arm.com,
	hagarhem@amazon.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	guohanjun@huawei.com,
	Jonathan.Cameron@huawei.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 2/2] efi/fdt: ignore dtb when acpi option is used with force
Date: Mon, 25 Nov 2024 17:07:58 +0000
Message-Id: <20241125170758.518943-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125170758.518943-1-yeoreum.yun@arm.com>
References: <20241125170758.518943-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_090811_714684_DB746AE7 
X-CRM114-Status: GOOD (  13.09  )
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

Since acpi=force doesn't use dt fallback, it's meaningless to load dt
from comaand line option or from configuration table.
Skip loading dt when acpi=force option is used.
otherwise it could produce unnecessary error message
while scanning dt if passed dt's format is invalid.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/efi/libstub/fdt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
index 6a337f1f8787..27291ef7c773 100644
--- a/drivers/firmware/efi/libstub/fdt.c
+++ b/drivers/firmware/efi/libstub/fdt.c
@@ -231,6 +231,8 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
 	struct exit_boot_struct priv;
 	unsigned long fdt_addr = 0;
 	unsigned long fdt_size = 0;
+	bool acpi_force = false;
+

 	if (!efi_novamap) {
 		status = efi_alloc_virtmap(&priv.runtime_map, &desc_size,
@@ -241,13 +243,17 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
 		}
 	}

+	if (strstr(cmdline_ptr, "acpi=force"))
+		acpi_force = true;
+
 	/*
 	 * Unauthenticated device tree data is a security hazard, so ignore
 	 * 'dtb=' unless UEFI Secure Boot is disabled.  We assume that secure
 	 * boot is enabled if we can't determine its state.
 	 */
 	if (!IS_ENABLED(CONFIG_EFI_ARMSTUB_DTB_LOADER) ||
-	    efi_get_secureboot() != efi_secureboot_mode_disabled) {
+	    efi_get_secureboot() != efi_secureboot_mode_disabled ||
+			acpi_force) {
 		if (strstr(cmdline_ptr, "dtb="))
 			efi_err("Ignoring DTB from command line.\n");
 	} else {
@@ -261,7 +267,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,

 	if (fdt_addr) {
 		efi_info("Using DTB from command line\n");
-	} else {
+	} else if (!acpi_force) {
 		/* Look for a device tree configuration table entry. */
 		fdt_addr = (uintptr_t)get_fdt(&fdt_size);
 		if (fdt_addr)
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


