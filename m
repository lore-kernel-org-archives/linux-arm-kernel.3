Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E602DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9L/hLbOSJZ62/cohmFNCdfLoT09DKZ/2Z5/IUj8+nso=; b=eoladaiUn6ukx+sxD7v/XR0mMa
	GG3Qodld5WzPRrtS9u1Um5lix50KSSHMNOD0425sOzd5935MX+1AtzTGhvBd2fMkUlepDZf4f+sP9
	nA7miXXrWsqVHPqwnwVXSOKHidpYVWfegKZk81E6pmpbK5XpeK3m6NpvGMzyCLdCZPUaw3AYShZDH
	wwyQLEkRD1Z5gl4Ys6a5SN+zyTD4QPfZUwaP2awyqwbgj2uMuTPm6p2ngDkSa95pKRhVOn52nufAh
	Z1ufFfeGJKfe1+qjqM6dqveFrujWP6Nsww9lHLVPrDahlaq8tChtxjK4C8HYRamzB6713k+olNadg
	1/ZX+sQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnn1-0000000633a-1Y4R;
	Fri, 31 Oct 2025 11:59:31 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnmv-0000000632O-2c8j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:59:26 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b6cf6a03b7aso168535a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761911965; x=1762516765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9L/hLbOSJZ62/cohmFNCdfLoT09DKZ/2Z5/IUj8+nso=;
        b=Phn5CX9hqUMsEbcRiKR8kXDoFRB7hOXLfg88kAcDqGke/qRMyFVixaZIyw7EEF+VJP
         dQ+kv1SvfjwjO7XBjo5Flh/ukj3Mi2MPRIq8B87T10trWvqANy1zfazPNad77gjaRLEN
         HLJdXQ7d//H/2EABNfD4ZtlTyauXHWl8otNHW19O5pN7DJ5iI78+BXApNUuQ4Flgje/b
         0AYOUs8UsQRYfkTvFm0YY7ncUahJDjyKbvwQOn1eZvDia7uXwCkSkYLfUtePqNFy7QZ0
         Aou5AodOSaiTWAunIjphvukDqSXWLkRWCagKHy8HNu/LaPEmc2hueLRoKf/+02dsNJUz
         ZV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911965; x=1762516765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9L/hLbOSJZ62/cohmFNCdfLoT09DKZ/2Z5/IUj8+nso=;
        b=s/ie9ZIYWthrx6yepi6fOsU4uJ0p+a48FxRnWmcL9OSxiWaecEXOCczBkEVblZ9GdB
         CMLV78zBk+q1ezgZDZl/iYbGqXMM5fx4WvmgBILE8PWaDqDj8OoJvL5XpW3uN3bjCMsQ
         rO/DCBCYhw3PhGVT/gPvNmQkK6SM9xCwvK2JMMXzT6FhNApLjkPcEUBL329pWKa5Hf8T
         qtARn2YXxgiC2xCdyNw9XkctbFaPhXnVRuO98Fn0lRDLo029hIOA46svSAD6oYXZO7PZ
         xeoGuTXs/+q7zo0BOhrv7vMHWU7rTrTyshTlVlp4yrS95fIBIQNuabGCekwfnIKmdm5g
         d4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVbD8gVRuJyYmvwuFwmEKYAoYZMAQzXubL1E8E1FVT6/GErK7tTGO6a/jLlg43BF95gVVwfBQtQSmj6wBUdhvnJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxF/WjOB9yorC/4g9JChZmSv+nLHbZm8k8NNNx6C5yyW8Hh4N8Y
	nC7uG07qf93APo87SnBAPN3iLTEK11kANCyIbS6MQFj/9KvampyEBv/AAClR9xzUXw==
X-Gm-Gg: ASbGncsRYcq3R4W0XWD60i3NIJ5Ya0LXUT3dZIKoNYr5xbzr19jx5zzPQ9B/bsklrNl
	xqT/F7ffqxCxlWKyd8+vi3VAWK/vkOfpCYiNcNZd/MOOip2QJEB8m5N6zE/k5wkf2MWe7+qncFX
	qWY0rvVNP0D2eUynM81n3/RyviLXX22Bx2jiYtd0Gfk/i3wSQvDf2n0ZODp2nmTusRFn1dB/UFF
	C64meHWybGqNHojgQHOqmPPO82OI3Jl58pQ8Qg7PrlovWIGwTUbuwYeshuI6givPd95hiqy9qHC
	4L+7uToMNURxryPxtdQlMTdFroFQtJ5tDZrVTEDydxNjXi7XSiiV2W6d+Z8mv3XWqCDeV2Ch06i
	NwgfghRA/uUAKWLBarPYd074DsuB6hpwpd7zntJhX90uqnDTkY5G1kA0n+5aJ32/AcR72j/GktV
	iSCCzBccI3s0eN3S4KMXhM3BVTKUZEUbtnaXzJ
X-Google-Smtp-Source: AGHT+IHpdOm2VD1n2Q7JgSULhaxQAGxS24N8LsCwk6ynnldxFPyu7tTqUMeajeJ5eRtPPaJqzMrAKg==
X-Received: by 2002:a05:6a00:3a0e:b0:781:21db:4e06 with SMTP id d2e1a72fcca58-7a7745559b4mr2256138b3a.0.1761911964694;
        Fri, 31 Oct 2025 04:59:24 -0700 (PDT)
Received: from adriana-dmi-upstream.sjc.aristanetworks.com ([74.123.28.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7dbb61839sm1973837b3a.71.2025.10.31.04.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:59:24 -0700 (PDT)
From: adriana <adriana@arista.com>
To: ilias.apalodimas@linaro.org,
	ardb@kernel.org,
	trini@konsulko.com,
	robh@kernel.org
Cc: krzk@kernel.org,
	jdelvare@suse.com,
	frowand.list@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	vasilykh@arista.com,
	arm.ebbr-discuss@arm.com,
	boot-architecture@lists.linaro.org,
	linux-efi@vger.kernel.org,
	uefi-discuss@lists.uefi.org,
	linux-arm-kernel@lists.infradead.org,
	adriana <adriana@arista.com>
Subject: [PATCH v5 1/1] drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT
Date: Fri, 31 Oct 2025 04:59:17 -0700
Message-ID: <20251031115917.713105-2-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031115917.713105-1-adriana@arista.com>
References: <20251031101009.704759-1-adriana@arista.com>
 <20251031115917.713105-1-adriana@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_045925_685466_6CFB7340 
X-CRM114-Status: GOOD (  19.27  )
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

Some bootloaders provide SMBIOS/DMI tables at a specific memory address,
particularly on non-EFI ARM platforms. The kernel's standard EFI DMI
scanner cannot find these tables.

This patch adds a fallback mechanism to the DMI scanner to read the
physical address of the SMBIOS3 entry point from the device tree.

This scan is performed only if the standard EFI check fails.

Signed-off-by: adriana <adriana@arista.com>
---
 drivers/firmware/dmi_scan.c | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 70d39adf50dc..82f1848e79fd 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -10,10 +10,12 @@
 #include <linux/random.h>
 #include <asm/dmi.h>
 #include <linux/unaligned.h>
+#include <linux/of.h>
 
 #ifndef SMBIOS_ENTRY_POINT_SCAN_START
 #define SMBIOS_ENTRY_POINT_SCAN_START 0xF0000
 #endif
+#define SMBIOS3_ENTRY_POINT_SIZE 32
 
 struct kobject *dmi_kobj;
 EXPORT_SYMBOL_GPL(dmi_kobj);
@@ -670,6 +672,51 @@ static int __init dmi_smbios3_present(const u8 *buf)
 	return 1;
 }
 
+/**
+ * dmi_scan_from_dt - Find SMBIOS3 entrypoint address via Device Tree
+ *
+ * Checks if the bootloader has passed the physical address of the
+ * SMBIOS3 entrypoint structure via the "smbios3-entrypoint" property
+ * in the /chosen node.
+ * Returns true if a valid entrypoint is found.
+ */
+static bool __init dmi_scan_from_dt(void)
+{
+	struct device_node *chosen;
+	const __be64 *prop;
+	char buf[SMBIOS3_ENTRY_POINT_SIZE];
+	void __iomem *p;
+	bool dmi_available = false;
+	u64 addr;
+	int len;
+
+	if(!IS_ENABLED(CONFIG_OF))
+		return false;
+
+	chosen = of_find_node_by_path("/chosen");
+	if (!chosen)
+		return false;
+
+	prop = of_get_property(chosen, "smbios3-entrypoint", &len);
+	if (prop && len >= sizeof(u64)) {
+		addr = be64_to_cpup(prop);
+
+		p = dmi_early_remap(addr, SMBIOS3_ENTRY_POINT_SIZE);
+		if (!p)
+			goto out;
+
+		memcpy_fromio(buf, p, sizeof(buf));
+		dmi_early_unmap(p, SMBIOS3_ENTRY_POINT_SIZE);
+
+		if (!dmi_smbios3_present(buf))
+			dmi_available = true;
+	}
+
+out:
+	of_node_put(chosen);
+	return dmi_available;
+}
+
 static void __init dmi_scan_machine(void)
 {
 	char __iomem *p, *q;
@@ -718,6 +765,13 @@ static void __init dmi_scan_machine(void)
 			dmi_available = 1;
 			return;
 		}
+	} else if (dmi_scan_from_dt()) {
+		/*
+		 * If EFI is not present or failed, try getting SMBIOS3
+		 * entrypoint from the Device Tree.
+		 */
+		dmi_available = 1;
+		return;
 	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
 		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
 		if (p == NULL)
-- 
2.51.0


