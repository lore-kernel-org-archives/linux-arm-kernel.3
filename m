Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B28CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFAEjrMWY0ykRF/jVrSGE7UxJKIHOGktXm16t+/fBBQ=; b=ZKXZJ8a3v2sYtH4hKWeTQBqyGh
	s5+TwAh2/qt3MlibriOfA/NXPXV93xCtAxAFaPQ/NO2IBu13XvZwEm7vBIsgnYEtm/bdH2rTnU6S1
	tTgShNkKfE4I4InMrIRmrRx+HIidaFBo9NfRxwV2TLXRCg0TzEnEsDOb4ObFa5czj3Fa+q+Zkbld4
	tsBOtMSjui+LGhskWCeGJdLzR5pvy7ke6gsgikw/RpPPbtk0gP8JI6zyZPEIkUAUISUDdctb8cpiW
	P0s0P5pEC647rjSjNnyFFyW9lwLqmHWUZI0OXGU9KLKsSKoFJIbbsOMPEMVItzT6ckYufRDB4B/C2
	Cm67SbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkho-00000005fui-1MeQ;
	Fri, 31 Oct 2025 08:41:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkhj-00000005ft3-1yGj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:41:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29301049db3so2366285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 01:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761900110; x=1762504910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFAEjrMWY0ykRF/jVrSGE7UxJKIHOGktXm16t+/fBBQ=;
        b=eHIyuS3GfZTbn/SfIL3hmgf7fXjPAuQztVQvfz5rdN29gVLYEB1yfK3VIT2pqhetSR
         ZcMweVP6x7sDTxoUv+2npSWopjTkNOovOPZW+CUmPTC/EPrfjw37HLZ5LQArWotIYeMy
         8tsAFyL/vZOHkj7eBIcGIxDKnk8BXjkX7uhYZogiKP63XLgCbNvtrIyKdSOineHVEjNC
         sbC/DTDM1lJvIx4x27okCpLdW9ZE2XRg2vltxohutRk0RxUfB9fAm1JwoLJKrTzRe42Z
         ftl3gKzQ9JmquN+NJT5/tEyEazPPCb8R5qPjTqI0x1HHlobxRB31BEe7vaZLoi9s7dfE
         gP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900110; x=1762504910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFAEjrMWY0ykRF/jVrSGE7UxJKIHOGktXm16t+/fBBQ=;
        b=KQJQkJRaPq3bTol/EuBKj9zCj9QDNWVNwVhpUukQLKBbZcm4TdNGCnd1RMk+njDsSI
         k+fW0aJEE5DSLEmE7nPkwGC5X2r9wIDplKeuH8FFWIvqeLOnwtsefy6YbgqESXPmIbQw
         2HORq4kqauI4favZLJq14BBwZ6OfgxVQ/87XY0IbXbsMphJc04kSBvGfq8i85XG8I/eE
         YhqxVCfsCMaXPhLITZOaVEXADXKTkAC8sxIlH+H/RiWs/gK5Zm5NjCQ/VGVUs5zES09s
         0m4CTIi+wncyaH8BYEL+eSTkcFyWXq/9XBtGx6ARGfOa+HhmO+9AL+4dGA73OfhmTpIU
         IsZA==
X-Forwarded-Encrypted: i=1; AJvYcCWm+TSc57mxM78S+QyX7WCoeRp3SqdaKr1ibUSM2aOTq/xXgD++bNxBAfXpgnWXJrvfvgacisWLugU+9qKzUb7p@lists.infradead.org
X-Gm-Message-State: AOJu0YzG5ta34tYu5iTB6sPheu+How/+PWSayixHs2YhgkOZN5/y9Ktp
	dofOJUMG8Z5ksA12sy4+w4iGbcvHgZerE01lSck+KwlyH/JJsJGUjmZhmzAi2rvJhw==
X-Gm-Gg: ASbGncvdqT1iL3qjXpzfL7p3r3Hc62faL7KK+v+H3t5nO+hLhg8+kzHZ1aPEGtSzx22
	5geKfDOB2MYeCewX/0AhLsDQEGpHW6wWelb3pXTgL17WXy3Y5tJdQd+vMW8FfQpsFSZ2nFwpoN+
	GOp63u3qGFRVkU9O1JUZ//aNxmAJu+C5BDP8aV5KxYV+j0Q/mtMnZr1lNA+cZNE0rJAJa1fTSi2
	mPQh9cA33mp0kS/7KPKr4pGixdq+XX83fbzty6SAGJPpfKyUHPrTXFEbRvKOy188VCqbUZdG0q6
	Yqf0ZeshHCPqvSIX9WeYTYg0exfJmpHr3lKIVUZ3G7BqKSsYb1zcuNtF4CRQWfKjwAbIf6iJ5dc
	smd2VjXLkeGztKI/dYLGOynIoVzsM7hedRcaMJdqE5JEs2SY86oWqhREbD/qq13kZI4qqkzGm74
	wZkVyeRiT9mhZAaQ4uzJtteEQAlG8lHjI56Odp8EZwAtfHLrl7K8BOO6JKIw==
X-Google-Smtp-Source: AGHT+IFFLWa19f/FrNdVnPDEN0o0mcIg80kenGGv9VHwXgspqh1uTCGkvt60mnvGNp1nA2FhcS1EEQ==
X-Received: by 2002:a17:902:c412:b0:264:cda8:7fd3 with SMTP id d9443c01a7336-2951a46d112mr24813365ad.6.1761900110413;
        Fri, 31 Oct 2025 01:41:50 -0700 (PDT)
Received: from adriana-dmi-upstream.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm15333505ad.84.2025.10.31.01.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 01:41:50 -0700 (PDT)
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
	Adriana Nicolae <adriana@arista.com>
Subject: [PATCH v3 2/2] drivers: firmware: dmi_scan: Add support for reading SMBIOS from DT
Date: Fri, 31 Oct 2025 01:41:01 -0700
Message-ID: <20251031084101.701159-3-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031084101.701159-1-adriana@arista.com>
References: <20251022114527.618908-1-adriana@arista.com>
 <20251031084101.701159-1-adriana@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_014151_523715_EC0B822C 
X-CRM114-Status: GOOD (  16.84  )
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

From: Adriana Nicolae <adriana@arista.com>

Signed-off-by: Adriana Nicolae <adriana@arista.com>
---
 drivers/firmware/dmi_scan.c | 58 +++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 70d39adf50dc..acc0e18b8d0f 100644
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
@@ -670,6 +673,54 @@ static int __init dmi_smbios3_present(const u8 *buf)
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
@@ -718,6 +769,13 @@ static void __init dmi_scan_machine(void)
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
-- 
2.51.0


