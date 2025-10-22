Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2542CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rbLHC9QwAR9eOpe2xgT+y+OECBmxM2cqKB9QacBZTUs=; b=F8am3wkxxU26f94iUOvJswnQma
	Z+W2qWASF2IKI3ksJZd8KKvzw45Li7Roc5cfJ46fEMh1jv9cheqM25d9Eo9o6cVa/8mtGUg0va+Kx
	7QZw0ccJFq4+FliFTSl9NpFoD66BoGwAgkBVLZ8CynahZxm74rr7zvQJ4mUrD8CBzYxA/2/XhCsjx
	Nj97gRqPA7RkIsh1qD9fCgvs05NjdWhX3Kz1VNsxnoLobM6kMCZCJ26x5YCk9H+TfBGGMtXLsc78/
	qGZNdLVjabTSJ/JYKQRZu9thlbUballfsXYVeedXDpRDoP51rvLD3aPhOYC3aVpfSUGaljgZD6B5n
	aEuPn30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBU6a-0000000245s-1Fj0;
	Wed, 22 Oct 2025 08:22:00 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBU6X-0000000245C-2u2r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:21:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b63117fb83dso281210a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 01:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761121316; x=1761726116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbLHC9QwAR9eOpe2xgT+y+OECBmxM2cqKB9QacBZTUs=;
        b=YIEg4XMfIqPq8cdAMw6aLDJfyP5h/kACDULvkTTLzYnEP0NLVbvqojipQkW89nh9PK
         GUchUE3lIbi1/g0nz69zOwa5W5PefR6C+o3MXQJIqCzRGeA/IT4Fka022PQ/hpoLRyvV
         r++87CM7mhSiHotyqTsxeb+hbkbDMNfg8R7MpaRjx5gEB4kAPql4J4vUOIwI3a4+gy2Y
         Sgj5Ym+Dh6zaEGSl53JL8DL6HhtZn2x1zXYxFRgNm4GkB4tI3MKImVz9J4DC5bQVA2XB
         e0R/bTpjy4HiNlHqRl8jeRx+7oYbnUeVmAC3tGumWKnoJs0SdN5rat9wB8bD9gXuojj0
         bAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761121316; x=1761726116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbLHC9QwAR9eOpe2xgT+y+OECBmxM2cqKB9QacBZTUs=;
        b=xNPLA80xT9LYv6xyUtStcTbTX88aXB6WLsfkZnxkI07eqaPEDFctX4gVqi4L2zUoTy
         LiNPIDMNLj0SwybZnLgVbXy6jO+eF48nLHLLAbKI/nkskek/supZcEc1JtdOoffW+0Rr
         nyyM5omohZU00EebookjQahJZKEouQglSGCVb9cNZ6CPz+qdp4htqGNXoKCRnFpnwa+f
         RE9UyUPwIUBKMQTwV7pPv7/l6DnhrLe5+/0vWFPwg6KaiUGX7YRWsQdHnMNe8taFSHcW
         bMWut0AkasPFQBggSTwc2MziceX53HzHwUnQa7vGaL7O+LNXgvU5P68TxkeE+9M5Leik
         RtDg==
X-Gm-Message-State: AOJu0YwwWGzC/5CSUBBoze0conw3AwSDEe17VX+imRsS8wGnAJwe5+Kg
	z3dpQ4cfKrkr0uBpSkSquJykrLOHegl7DLP0UgicDybQeBHayeWzxzNZrPXxWJeVjg8I/kLR9BO
	sfX9e3w==
X-Gm-Gg: ASbGncv676u6Y1PL2ZA1js/+74/F01JV+j9sqYwbUioOqxg29K9a6KnfrP4rJD3uGL/
	s++yYKmTUlwVhG5WDiL9NQ6e8m0rtoJAD9M1IYPYo55Ecf1V9LhQ4yTKvpjGFWgeMc0e9X99tE6
	F9w9D0qG4VYRNaHZKvUskPvxmEI25cZoVemqb55soytZn4HEp/BXlPAM693b47Isl9+7yJB9N2z
	CsJwtybYCdDZjEtKvNw+xpY1lC1k2+/phcond3rivvT5kERUHfosPpWpgIgTvgIOxy6xHdWFfew
	6pY5Ly9bh7D7G8++QXfnTIZm4gFoeNqP1zEOpdkeHRUhZle2GuRhL9AmGPmUZtvvcSvzqp9X8rB
	wTRqC3mVV6aOM0HGoFHHBn8dQtvpOirwH9lLDfWZJVBXJ4KBG5sft/q7F9Ae1Ujcw6XIZWoRh16
	vlJi7nn5oNaR6/eYs9sDdGH3NGurFw8Xh5GhC2WuxmcdE5rUZswLsNMw==
X-Google-Smtp-Source: AGHT+IEq1VTnJQxlOmueu6s2GebaKNeFLbAzcYm2sgg1sCqMQhIRzeaeT1dxwWuPL3kl8Wo0a8Ua8A==
X-Received: by 2002:a05:6a20:430a:b0:334:8d22:f94a with SMTP id adf61e73a8af0-3392f61dc01mr4867714637.1.1761121316207;
        Wed, 22 Oct 2025 01:21:56 -0700 (PDT)
Received: from adriana-show-mem3.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223cba14sm1854292a91.2.2025.10.22.01.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:21:55 -0700 (PDT)
From: adriana@arista.com
To: linux-arm-kernel@lists.infradead.org,
	jdelvare@suse.com,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	frowand.list@gmail.com
Cc: linux-kernel@vger.kernel.org,
	vasilykh@arista.com,
	Adriana Nicolae <adriana@arista.com>
Subject: [PATCH 1/1] DMI: Scan for DMI table from DTS info
Date: Wed, 22 Oct 2025 01:21:29 -0700
Message-ID: <20251022082129.138217-1-adriana@arista.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_012157_866495_87DD9015 
X-CRM114-Status: GOOD (  16.96  )
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

Some bootloaders like U-boot, particularly for the ARM architecture,
provide SMBIOS/DMI tables at a specific memory address. However, these
systems often do not boot using a full UEFI environment, which means the
kernel's standard EFI DMI scanner cannot find these tables.

The bootloader can specify the physical addresses of the SMBIOS and
SMBIOS3 tables in the /chosen node using the "linux,smbios-table" and
linux,smbios3-table properties. This patch hooks into the DMI
initialization process to read these properties, map the tables,
and parse the DMI information.

This extra scan is performed after the standard EFI check fails but
before the fallback memory scan, not to alter the order of DMI scanning
for current implementation.

Signed-off-by: Adriana Nicolae <adriana@arista.com>

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 70d39adf50dc..ea3ed40d0370 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -10,6 +10,9 @@
 #include <linux/random.h>
 #include <asm/dmi.h>
 #include <linux/unaligned.h>
+#if IS_ENABLED(CONFIG_OF)
+#include <linux/of.h>
+#endif
 
 #ifndef SMBIOS_ENTRY_POINT_SCAN_START
 #define SMBIOS_ENTRY_POINT_SCAN_START 0xF0000
@@ -670,6 +673,70 @@ static int __init dmi_smbios3_present(const u8 *buf)
 	return 1;
 }
 
+#if IS_ENABLED(CONFIG_OF)
+/**
+ * dmi_scan_from_dt - Find and parse DMI/SMBIOS tables from the Device Tree
+ *
+ * Checks if the bootloader has passed SMBIOS table addresses via the /chosen
+ * node in the Device Tree. This follows the standard kernel DT bindings and
+ * assumes a fixed 32-byte mapping for the entry point.
+ * Returns true if a valid table is found and successfully parsed.
+ */
+static bool __init dmi_scan_from_dt(void)
+{
+	struct device_node *chosen;
+	const __be64 *prop;
+	char buf[32];
+	void __iomem *p;
+	bool dmi_available = false;
+	u64 addr;
+	int len;
+
+	chosen = of_find_node_by_path("/chosen");
+	if (!chosen)
+		return false;
+
+	/* SMBIOSv3 (64-bit entry point) has priority */
+	prop = of_get_property(chosen, "linux,smbios3-table", &len);
+	if (prop && len >= sizeof(u64)) {
+		addr = be64_to_cpup(prop);
+
+		p = dmi_early_remap(addr, 32);
+		if (p == NULL)
+			goto out;
+
+		memcpy_fromio(buf, p, sizeof(buf));
+		dmi_early_unmap(p, 32);
+
+		if (!dmi_smbios3_present(buf)) {
+			dmi_available = true;
+			goto out;
+		}
+	}
+
+	prop = of_get_property(chosen, "linux,smbios-table", &len);
+	if (prop && len >= sizeof(u64)) {
+		addr = be64_to_cpup(prop);
+
+		p = dmi_early_remap(addr, 32);
+		if (p == NULL)
+			goto out;
+
+		memcpy_fromio(buf, p, sizeof(buf));
+		dmi_early_unmap(p, 32);
+
+		if (!dmi_present(buf))
+			dmi_available = true;
+	}
+
+out:
+	of_node_put(chosen);
+	return dmi_available;
+}
+#else
+static bool __init dmi_scan_from_dt(void) { return false; }
+#endif /* IS_ENABLED(CONFIG_OF) */
+
 static void __init dmi_scan_machine(void)
 {
 	char __iomem *p, *q;
@@ -718,6 +785,13 @@ static void __init dmi_scan_machine(void)
 			dmi_available = 1;
 			return;
 		}
+	} else if (IS_ENABLED(CONFIG_OF) && dmi_scan_from_dt()) {
+		/*
+		 * If EFI is not present or failed, try getting SMBIOS
+		 * tables from the Device Tree.
+		 */
+		dmi_available = 1;
+		return;
 	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
 		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
 		if (p == NULL)

