Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB30FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/e5tjl72pLoATST6uvgUSXblWbJCqEWY7WIs3qpXwQ=; b=b2vjapSOcHaTiMAl5VLl5ic4wa
	mckAjx+mxoz/ezosdjie/0kVbBIyVxY9Al41EmjnvRS2VFB2kBBN9XFfh9++o42s44tDqKkqCAd2B
	o3kOuWcC1FgXCoqHzOgzlgUlz4+25wibVCA8vHeKhgq+ETiVvLPZhH9NDVNYgWWgap66T+0fTOOu7
	RnzY6ynYyFV0kWRC6VR5NALO2yPIYzW4A9INMG6B61elzNjXqVy/Q3yLNdPhOryD/4JuD1heQ9qlg
	rKCk9mDm1+CfpO3ltukpeMQDp+WkKMfxSdR7am+E+XP2coFw8bNTntcp/Kdpl//LLk4HkaJIpCjXU
	tzNMoSjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEm5e-00000005rvf-1wXX;
	Fri, 31 Oct 2025 10:10:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEm5X-00000005rt8-1JKy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:10:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-28d18e933a9so2608965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761905431; x=1762510231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/e5tjl72pLoATST6uvgUSXblWbJCqEWY7WIs3qpXwQ=;
        b=K+Cr5nYLqLrRPKZ7Jz6h4mMjZ5oJETbrTLGFA0i9D7d0SAZG3ni9YFCAyg31A3NM4t
         rqQe+fGf5B0dS0ZalS7D/UordOaTIcGfTf9NWLxYJ6zIj8YkSEk5RnTTb2wAZZ4X9CRY
         s/R+JbETu0jU5wXU/8dKUJkv1ITBeuXEFkwxXrkVqyhET+ogXtTCaZEyguDEV3HbzbCs
         EmB9uAN7+RKhFi0aQRrFk/S1DdVidZ7fKL9jVEZH3lDlB5Efg7u+JRCDuOH6P/cZpRhn
         T9Fok8CaBZaIZ7kMwEgUmcK6ktmyiem9kjnosaklfjB5lPVOTDkkrlgSWpJEdE1EX9fr
         Ixlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761905431; x=1762510231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/e5tjl72pLoATST6uvgUSXblWbJCqEWY7WIs3qpXwQ=;
        b=NrFpFCnEWcWJ57fSul1ni+chjENEzouEvOHwcmvJ5BAxRZbB2XURruNG1BR7uMt5MS
         Up8UfGW5NWGn6Yt4vxZhFbnd+AQXXKtdrFqLeJPtTkWuEuhxECormy2P49GuVgwa7a1V
         iz1wRb6+d1Cy2PIH6DY00pEwYTmfmM7kJPeuUOVIElUbd+9woxZ3d3gLQh4pbUNCZSJ2
         yH7Bxsz0psVOaqC9vzZxX1RuAceZlPD0Zn03J3dubyoyiSZa9pu+j3sT3WUDmd86lSwb
         CxojynlgUEsnGjAjn91aNNTwFl3+and4aTLmSTGaZQYW7cdMUQezaWBL1aVVh6n+jx+h
         FoIA==
X-Forwarded-Encrypted: i=1; AJvYcCVLdlNCuj2V9yJ/g9ijC5LpXpi5uxCdGtwy2RCe5sEDQWEc6lPkR7YxUstRC469IWbcCjY1jHdmZup0xlpjRYBJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxB3eHUZAvnhKKsdC96kAWAiow1aW5EL8vPepzOaUx3EYyXMTZE
	MzNlIndC8o3ZHfs7EM+kgjBCP3cRmu0C/ScCn7KiUE5TXUX//NSRZr++RLCz5CBgfQ==
X-Gm-Gg: ASbGnct7mlqFAg8nhjh9JV5ejk5wY02Ef6ha3yOgIXyuHXzz21yrV0nxncZdIzmnY/B
	es2GlC3A1TCeP61VJTVU3EbQNfLtQ81AA+nQ/WnYX6GEbxAMbTjvp1Q8q9Zlfrpe1unISYzCikm
	L/H9GY6g3eDDbt3ccTPHBXoAR3Zzd44wHk+hN9IiCH9JwKn9yaGchwh0WfmbYmWhr4RVrEygzH6
	PS0ag+3ZloIM5iMDMeTVG6J0eCoHYRhy8xQcciO9wnaHDbUe8WuytgVfd5ldRTIV5wiy0h9u3kw
	xA6JbRh2l4/iuhwfguaoT7ttqCdvQYGeLLNsSK/WtO5LLpF1LB/LxAu+awNkjJ3yQRv8WBPfNSM
	zTjyL5V7BKky4kbVrHl5DUWZUxdgfA9QHu3BQrZipzLiZOnmk5Wyi0X3/D9T5tk0Qn1kbdhZ3iT
	EUM7VacDSzXN2+fjSCLMoslCkdVIfwiVCH9NvvW3v9P3VHqjI=
X-Google-Smtp-Source: AGHT+IEBP5bjyyzwFFW9rk5+yU8llkt/2A95S3HRbdUz8eFDWn98s8uULia4xAwJsfbPjA7zk4U3Mg==
X-Received: by 2002:a17:903:38c8:b0:295:37ac:8d54 with SMTP id d9443c01a7336-29537ac8ec7mr3467745ad.9.1761905430618;
        Fri, 31 Oct 2025 03:10:30 -0700 (PDT)
Received: from adriana-dmi-upstream.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952774570bsm17458545ad.99.2025.10.31.03.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:10:30 -0700 (PDT)
From: adriana <adriana@arista.com>
To: ilias.apalodimas@linaro.org,
	ardb@kernel.org,
	trini@konsulko.com
Cc: robh@kernel.org,
	krzk@kernel.org,
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
Subject: [PATCH v4 2/2] drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT
Date: Fri, 31 Oct 2025 03:10:09 -0700
Message-ID: <20251031101009.704759-3-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031101009.704759-1-adriana@arista.com>
References: <20251031084101.701159-1-adriana@arista.com>
 <20251031101009.704759-1-adriana@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_031031_414989_58FDDC19 
X-CRM114-Status: GOOD (  19.28  )
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
index 70d39adf50dc..c29ca98f09b5 100644
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
+ * SMBIOS3 entrypoint structure via the "linux,smbios3-entrypoint"
+ * property in the /chosen node.
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
+	prop = of_get_property(chosen, "linux,smbios3-entrypoint", &len);
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


