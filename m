Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C13C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAm79y7QM3RPmANHIVUvLRyIejFe0GX7u7Y2voDxIv4=; b=N2Id1yLCY+XwjDDNSTIes/6S1i
	j9oUwJzylZbqUPHr4nxYkNG56wP1XhEKJ91Ovo/WPXyjh4ptjwM4lHowWx9ThVlV/2nTCWTlAc66X
	43tO0GAZu7jHvmsOWUnBgItRw9ZO0AvEOd9qMR+rqSHBLSAfVSbJ1bEW3dBxJ+Yd+SBNL9VUCvO1G
	hR37tjbiZeYLagka3Hd/g+to/RYXqAoVkgQqMNAa1885NtqHyyhMNNaqwPoc5aES2cV3YQIyrSYYo
	dN6aSsLNs+sXNRdLZdsdjU4Tug/0odJ58/3tNy6LZVkH0CCErvV7TmWxMIumQy3VAYHcqBcKctSrU
	eguHIsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KJG-0000000HTqF-2Gov;
	Fri, 25 Apr 2025 14:45:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JB8-0000000HIPE-170T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:33:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22409077c06so34729285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587997; x=1746192797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAm79y7QM3RPmANHIVUvLRyIejFe0GX7u7Y2voDxIv4=;
        b=lW7W+TqZFuElCtaMdb1rwhrlD8nehb2fWRXN54Dha066srwx9VnrOFmeJdIh9wqzjA
         oPhjnuY2hkELog1KRLdUs/DMGR8SSNn6Q7EEym34D076y5GfRGDJDr8VinZQEts+Cd1K
         S6IRnOI++uEKPZB5iS0YoZnYHH8iC21BqBrbLy/rdhFxyUm18EfKW9m+OjqMsw9npGy5
         7g6+OdQIHLZXqIGjHQtqGjadabO3XQXr1aRUkVZ/oWdULRhLg4uxrHDahShX9Qpb3R21
         jy/O3DfuXNrnhQdQ42xYJ3BEcVnHfY4puLHeh4n+rOMIrXcfTmed2uh7guZd08jJaKW/
         4AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587997; x=1746192797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAm79y7QM3RPmANHIVUvLRyIejFe0GX7u7Y2voDxIv4=;
        b=n+An/NcIl6qvWvjPpbh3vJBNqSXXxp/wN4qbrjodox8i10YR2EVqL6qZst7b99gng7
         3Jzoe2IH3sW8LBksA0e+YgtEnZ4n6TNG6eD7KWbwviNUJ9ntTSrlzsX3/KCdTLKWgcFt
         xyGrK5Jt0bfi0JwOXIZ4KQioORLSDBjjA76Cm/A9LH/vn/LDpFJKLw9g7ybeiIVj4GnW
         hDYPOlglPZ/1SHSwUHyoq4f3FwJpT+T/mC5AGa3xKZUS/rZ/5h9t0Prfq6rfd5/xPNDS
         aQylvgyFjzg/w9OTIy7EOLm2a+rJ7zQHGWjA6yfqEHiJr1hJ4bfDgxTZidfiJC42JYM+
         WFWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlGXWGTZmxHSfOZ3CPwINkd10fo5wSJLQOA49ZsyF0FN03a0yclbkmdlx3UsVCSqWp+RkkV6oRTI0nIywIYU+y@lists.infradead.org
X-Gm-Message-State: AOJu0YztBOQ7Sz4/00/oF4LBUaaBm3RdJTwhwF3KC7D2woBsZucq5Loa
	2nAxo4wjyj3RCFMk/G7CLEIgt5UPuTcfFDk1Nj+taGnsX8ZKAr31
X-Gm-Gg: ASbGnct1WAmfAOst+/ss4p4pz518S5kubFCcGVoJ+k/VanqW+PEKMhxgh1i2W6ElXUc
	PVIutfRemnS1OxluMZ7TnBmiLxA0LyQyazIpj9kjhO95fPaMP0nmt7jqBBZo5+LH3RtaXW/4vRO
	VePLbz5Vt2bGgrn1gtaIVYt+8XZc3GhvYo9+J+K8n3pKQ+cBYo9zKAmj33+Me+DpqZC63FdZIXZ
	0Ki1fKDUKg7v8Fu+R5zrRKYsrqaCOTrUa2wkfbbc75aKUEFvNmC37ksKiHt1Iyw5w5CKi916M+0
	03kqYYkSGkscgJR+YYfFOTsKiRSlJD17fh29I+T4J7PCkzLY3h4S
X-Google-Smtp-Source: AGHT+IFRCKNYLsTMn88S6eE8HozK3R4+9MF2EBm/8JjtspNKvuzU41OY7WQh0WJF+EnTGfyFFHPRJg==
X-Received: by 2002:a17:902:ef44:b0:21f:6bda:e492 with SMTP id d9443c01a7336-22dbf63dbdbmr41128025ad.35.1745587997277;
        Fri, 25 Apr 2025 06:33:17 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e766bsm31834165ad.149.2025.04.25.06.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:33:16 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 17:32:57 +0400
Subject: [PATCH v3 2/2] ARM: dts: vt8500: Add VIA APC Rock/Paper board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v3-2-846b0855420e@gmail.com>
References: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745587999; l=2604;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=f6XbPZl25l06W4/0lWNhLm+SfMVWRp7cUP5Uz+CFH/s=;
 b=OFwQv0Vi8+yfi8ZdAsJ39FrNTl87PTpaXCOwzfb7PZ0G/XoCqvaHmBOltA4csm4m/yHq+q/PZ
 IongmfZc8HxCfCMFYpGpo3sRqrFiT3wTbn7fqygskGZIkvd953XfY/G
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_063318_306967_C59CA9A9 
X-CRM114-Status: GOOD (  15.28  )
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

APC Rock is a development board based on WonderMedia WM8590 released
around 2013. Paper is the same board, but with the VGA port left
unpopulated, and shipped with a recycled cardboard case

Its hardware includes:
* Single-core Cortex-A9 CPU at 800 MHz
* 512MB DDR3 RAM
* 4GB NAND flash
* 8MB SPI NOR flash
* ARM Mali-400 GPU
* HDMI output (type A) capable of 1080p
* VGA output (on Rock, but not on Paper)
* 2x USB 2.0 type A
* 1x USB 2.0 OTG (microUSB connector)
* microSD slot
* 10/100M Ethernet
* 3.5mm minijack connector with combined headphones/mic
* Half-height miniPCIe slot (with only USB 2.0 signals)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/Makefile            |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi         | 11 +++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vt8500/Makefile b/arch/arm/boot/dts/vt8500/Makefile
index 255f4403af91c1d6a22416ab694b8eab44bf98a2..c5a2e57d53af4babe40fe2d79b2f8d9c1ae1b8db 100644
--- a/arch/arm/boot/dts/vt8500/Makefile
+++ b/arch/arm/boot/dts/vt8500/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_VT8500) += \
 	wm8505-ref.dtb \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
-	wm8850-w70v2.dtb
+	wm8850-w70v2.dtb \
+	wm8950a-apc-rock.dtb
diff --git a/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
new file mode 100644
index 0000000000000000000000000000000000000000..58b3c8deb4f20ae072bf1381f1dfa5e5adeb414a
--- /dev/null
+++ b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Alexey Charkov <alchark@gmail.com>
+ */
+
+/dts-v1/;
+/include/ "wm8950.dtsi"
+
+/ {
+	model = "VIA APC Rock";
+	compatible = "via,apc-rock", "wm,wm8950";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/vt8500/wm8950.dtsi b/arch/arm/boot/dts/vt8500/wm8950.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..31fba05d3c3e70b21a64d08b5cdf645102a1faf3
--- /dev/null
+++ b/arch/arm/boot/dts/vt8500/wm8950.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Alexey Charkov <alchark@gmail.com>
+ */
+
+/* No differences have been discovered vs. WM8850, but chip markings differ */
+/include/ "wm8850.dtsi"
+
+/ {
+	compatible = "wm,wm8950";
+};

-- 
2.49.0


