Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF7CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDkmw2L/CggAWlhoCbVt+jxooREB3IRWx0YxVZmPHdY=; b=olEVCPKn6tnuI9URlOFXsvvVus
	W/AmFmraU0gHToKBkLwnq86L+++KuWzC3m2AhZq7tCk/fc1OzfesC3TjcxufRrGO4yDgXvpTY30EU
	3s/S5zUB+q92ZfkVYHfjDIFryFYDJdLB74X6QXbKAuEsUId6LWZXBevOHrdqa/xWYRE6UDeMy3DZA
	ZIe9gdF/Yb3CAZziHDCnia9DN26BUL8e5fjYgUJkjtH6hzDi/5gF9fjUFLSNX7Zi/p/NplocKKOT7
	B+/6C0ycQxlyv52gcprbBMO3fn5pBxPSO9xs1zZohao8mJRLr74N+cOe7R6r0DrcArB/B/NpzJEzB
	2CPAQrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teux1-0000000FHJK-3iCv;
	Mon, 03 Feb 2025 11:49:15 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teutA-0000000FGfx-42A9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:45:18 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so5394016a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583116; x=1739187916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDkmw2L/CggAWlhoCbVt+jxooREB3IRWx0YxVZmPHdY=;
        b=K8eQ4lyPlm4Lm5BqGmvUj0WB9PGeq76qfjYdp8rtqBievmdQ2bfiLBsdMfgriEj6oT
         j2NuCc+871xv10iytzsXPlM5hgMsV4Z6YAzuSiNL78EqUF/kyGYkHq3QHI19qvLIFGVQ
         NGvQ88E6u+CEO5cqozfTGC1qOITA11cO0dBOHYcB9MV/EewIToSSrkctpeys3jBYmB87
         vOVQQElkJkaccQklUGRVBPpUF/CDuYf5b4J7gIdVlTpTl5pInQn2paSubnPQzie7Cc7R
         /jPK8MEL1IH8DCW7AlMWi/nFveRqoS4k73+6juHpPA6a+5RmkpjLJuQ3Hes4Mkkn70kh
         bn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583116; x=1739187916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDkmw2L/CggAWlhoCbVt+jxooREB3IRWx0YxVZmPHdY=;
        b=THKay3h3sElhjhzbMI+Knk6+utuyO1EnbraiBoN+zgUxHIoyc/SPGzFQBKfUtwlZSy
         mpe1O65Zhxc6jd4gDGpBiASsbfQ8lMrFoCcT3ayGjA4pZcDldtHkHsTp7341T5Z8rdwB
         H8h3Qa0Wj/nm68BY3x5ESJJz8AUv0i/IIGl2J0qFZwcx2r/typ13sh85kvrCG4TTxleC
         uZ9kBkyfLM64IgnveHiMQQTW1EVtigrNb0w2Iwc8Ksm/icd2YKyoS2XXGMjiAOyRFcfM
         d5QFMGf+zoh07pA+qaUta+Y4Vwbjv8HG039PLqaT2dDGiCBDdAAoHbWboRTH55XilqMt
         VHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwFsPnFm13lFRKyyEyciqL5/8hs8/UtKuunPxue+OQK4Vn2Z37Xzr6cIAWSS3bH3d7dhkFIzoEgShrzQnq0zQ+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywywkh5l9npjN1eLd1kUggcUpoXwKNKKIkm1fGuYfPACVJkm4Z+
	cdzjxSdZ5XoXDbgT6MIrC2c9sCOw6hy3qd5wGdGP89LBglPAXvbh
X-Gm-Gg: ASbGnctIfSVBY5diCEULXvtKJWH6aCGMj7RgqF8a5mMfKP/NnTJ4JV4YNGwhXaxXvvf
	txEZCLNMeXmvcFEHHYO33j1DZAJNeAOhzymVw9kRW7wQmw0Ks7+zfM7LJWBIF5tslv0Yvgp725N
	6Az9U7t91gZDyUxMB14BJJzzrL1Ll7wFkLB67rQR8ymuJoNht/z/OEYQHerG7ihKkP0P1Wgr88D
	CbV4BBRTG/5AMHP7duzBNDwAKzoiTtq4snfIKflw4YX/a5axOhHu1wcfV724aStv14ghZWRejkE
	S7T4nL9zrWhx8saL
X-Google-Smtp-Source: AGHT+IFZWvoFXiMlTdUILnPBlWk38ZIGkDO4sC4NvMoF/C/JxJfbOcKro3dMu3aJgXqZmV4fpcmZfQ==
X-Received: by 2002:a17:90b:2b86:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-2f83abb34femr33590973a91.9.1738583115806;
        Mon, 03 Feb 2025 03:45:15 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm9712490a91.3.2025.02.03.03.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:45:15 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 RESEND 2/2] arm64: dts: apple: Add T2 devices
Date: Mon,  3 Feb 2025 19:42:53 +0800
Message-ID: <20250203114417.16453-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
References: <20250203114417.16453-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_034517_012276_302B1C1F 
X-CRM114-Status: GOOD (  14.95  )
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

Add DTS files for the T2 SoC and the following devices based on it:

- Apple T2 MacBookPro15,2 (j132)
- Apple T2 iMacPro1,1 (j137)
- Apple T2 MacBookAir8,2 (j140a)
- Apple T2 MacBookAir8,1 (j140k)
- Apple T2 MacBookPro16,1 (j152f)
- Apple T2 MacPro7,1 (j160)
- Apple T2 Macmini8,1 (j174)
- Apple T2 iMac20,1 (j185)
- Apple T2 iMac20,2 (j185f)
- Apple T2 MacBookPro15,4 (j213)
- Apple T2 MacBookPro16,2 (j214k)
- Apple T2 MacBookPro16,4 (j215)
- Apple T2 MacBookPro16,3 (j223)
- Apple T2 MacBookAir9,1 (j230k)
- Apple T2 MacBookPro15,1 (j680)
- Apple T2 MacBookPro15,3 (j780)

The Apple T2 is an A10-based security chip found on some Intel Macs
from 2017 onwards. On models with a touchbar, the touchbar's
display is wired to it. These devices have no offical names, the
naming scheme is from libirecovery.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile            |  16 ++
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
 arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
 20 files changed, 486 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index ab6ebb53218a..4f337bff36cd 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -46,6 +46,22 @@ dtb-$(CONFIG_ARCH_APPLE) += t8011-j120.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j121.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j207.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j208.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j132.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j137.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j140a.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j140k.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j152f.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j160.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j174.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j185.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j185f.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j213.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j215.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j223.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j230k.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j214k.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j680.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j780.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8015-d201.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8015-d20.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8015-d211.dtb
diff --git a/arch/arm64/boot/dts/apple/t8012-j132.dts b/arch/arm64/boot/dts/apple/t8012-j132.dts
new file mode 100644
index 000000000000..778a69be18dd
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j132.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro15,2 (j132), J132, iBridge2,4
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro15,2 (j132)";
+	compatible = "apple,j132", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j137.dts b/arch/arm64/boot/dts/apple/t8012-j137.dts
new file mode 100644
index 000000000000..dbde1ad7ce14
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j137.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 iMacPro1,1 (j137), J137, iBridge2,1
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 iMacPro1,1 (j137)";
+	compatible = "apple,j137", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j140a.dts b/arch/arm64/boot/dts/apple/t8012-j140a.dts
new file mode 100644
index 000000000000..5df1ff74d2df
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j140a.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookAir8,2 (j140a), J140a, iBridge2,12
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacBookAir8,2 (j140a)";
+	compatible = "apple,j140a", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j140k.dts b/arch/arm64/boot/dts/apple/t8012-j140k.dts
new file mode 100644
index 000000000000..a0ef1585e5c2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j140k.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookAir8,1 (j140k), J140k, iBridge2,8
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacBookAir8,1 (j140k)";
+	compatible = "apple,j140k", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j152f.dts b/arch/arm64/boot/dts/apple/t8012-j152f.dts
new file mode 100644
index 000000000000..261416eaf97e
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j152f.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro16,1 (j152f), J152f, iBridge2,14
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro16,1 (j152f)";
+	compatible = "apple,j152f", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j160.dts b/arch/arm64/boot/dts/apple/t8012-j160.dts
new file mode 100644
index 000000000000..fbcc0604f4a0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j160.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacPro7,1 (j160), J160, iBridge2,6
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacPro7,1 (j160)";
+	compatible = "apple,j160", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j174.dts b/arch/arm64/boot/dts/apple/t8012-j174.dts
new file mode 100644
index 000000000000..d11c70f84a71
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j174.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 Macmini8,1 (j174), J174, iBridge2,5
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 Macmini8,1 (j174)";
+	compatible = "apple,j174", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j185.dts b/arch/arm64/boot/dts/apple/t8012-j185.dts
new file mode 100644
index 000000000000..33492f5db46d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j185.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 iMac20,1 (j185), J185, iBridge2,19
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 iMac20,1 (j185)";
+	compatible = "apple,j185", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j185f.dts b/arch/arm64/boot/dts/apple/t8012-j185f.dts
new file mode 100644
index 000000000000..3a4abdd8f7d7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j185f.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 iMac20,2 (j185f), J185f, iBridge2,20
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 iMac20,2 (j185f)";
+	compatible = "apple,j185f", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j213.dts b/arch/arm64/boot/dts/apple/t8012-j213.dts
new file mode 100644
index 000000000000..8270812b9a68
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j213.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro15,4 (j213), J213, iBridge2,10
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro15,4 (j213)";
+	compatible = "apple,j213", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j214k.dts b/arch/arm64/boot/dts/apple/t8012-j214k.dts
new file mode 100644
index 000000000000..5b8e42512060
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j214k.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro16,2 (j214k), J214k, iBridge2,16
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro16,2 (j214k)";
+	compatible = "apple,j214k", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j215.dts b/arch/arm64/boot/dts/apple/t8012-j215.dts
new file mode 100644
index 000000000000..ad574fbf7f92
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j215.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro16,4 (j215), J215, iBridge2,22
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro16,4 (j215)";
+	compatible = "apple,j215", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j223.dts b/arch/arm64/boot/dts/apple/t8012-j223.dts
new file mode 100644
index 000000000000..de75d775aac5
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j223.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro16,3 (j223), J223, iBridge2,21
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro16,3 (j223)";
+	compatible = "apple,j223", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j230k.dts b/arch/arm64/boot/dts/apple/t8012-j230k.dts
new file mode 100644
index 000000000000..4b19bc70ab0f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j230k.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookAir9,1 (j230k), J230k, iBridge2,15
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacBookAir9,1 (j230k)";
+	compatible = "apple,j230k", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j680.dts b/arch/arm64/boot/dts/apple/t8012-j680.dts
new file mode 100644
index 000000000000..aa5a72e07d3f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j680.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro15,1 (j680), J680, iBridge2,3
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro15,1 (j680)";
+	compatible = "apple,j680", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j780.dts b/arch/arm64/boot/dts/apple/t8012-j780.dts
new file mode 100644
index 000000000000..9cee891cb16d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j780.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro15,3 (j780), J780, iBridge2,7
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro15,3 (j780)";
+	compatible = "apple,j780", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
new file mode 100644
index 000000000000..36e82633bc52
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Common Device Tree for all T2 devices
+ *
+ * target-type: J132, J137, J140a, J140k, J152f, J160, J174, J185, J185f
+ * J213, J214k, J215, J223, J230k, J680, J780
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include "t8012.dtsi"
+
+/ {
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &serial0;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0";
+	};
+
+	memory@800000000 {
+		device_type = "memory";
+		reg = <0x8 0 0 0>; /* To be filled by loader */
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* To be filled by loader */
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi b/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
new file mode 100644
index 000000000000..f4a8b12437f0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Common Device Tree for T2 devices with a Touch Bar
+ *
+ * target-type: J152f, J213, J214k, J215, J223, J680, J780
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	chosen {
+		framebuffer0: framebuffer@0 {
+			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			reg = <0 0 0 0>; /* To be filled by loader */
+			/* Format properties will be added by loader */
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
new file mode 100644
index 000000000000..45d24ca091b0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T8012 "T2" SoC
+ *
+ * Other names: H9M, "Gibraltar"
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/apple-aic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/apple.h>
+
+/ {
+	interrupt-parent = <&aic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@10000 {
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x10000>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@10001 {
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x10001>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		nonposted-mmio;
+		ranges;
+
+		serial0: serial@20a600000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a600000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,t8010-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@20f100000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0f100000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 221>;
+			apple,npins = <221>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 50 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 51 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_aop: pinctrl@2100f0000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0100f0000 0x0 0x10000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 41>;
+			apple,npins = <41>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_nub: pinctrl@2111f0000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x111f0000 0x0 0x1000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_nub 0 0 19>;
+			apple,npins = <19>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 164 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 165 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 166 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2112b0000 {
+			compatible = "apple,t8010-wdt", "apple,wdt";
+			reg = <0x2 0x112b0000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 168 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_smc: pinctrl@212024000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x12024000 0x0 0x1000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_smc 0 0 81>;
+			apple,npins = <81>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>;
+			/*
+			 * SMC is not yet supported and accessing this pinctrl while SMC is
+			 * suspended results in a hang.
+			 */
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that T2 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.48.1


