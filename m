Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C73DD46BFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lnap5JnTI2lL7PQO4YFS2y5PBzrQWIZi66+sIvKDZrg=; b=CeINVZg6NssExq1slRgfKh8J+K
	iNlF91bYPGw+6c6BcnDOGxOY0c1BNXkUwCa+lVdj52FDZeWjTBwhviaZdiMLU20uJMScnMjAHlvQv
	eoRnOvqmLWDXIswLAdKMFVn5ZOUZSH9KVWJoevybFrHKmDZ1fVHDoiuX5owawBTcDlW94yz+TKcy0
	sYBv1cxNG5LKovqed9zv2P8Gs6OzvV7tr+jZV+r7cAYg4C3D6DYKpM2SdSRGaFU3vJiXnZIhdJFMp
	05fFq92AP5PHMlrHv0g+uoCF4JmtUIFCNjfsFfhog386SXclM8TDJ6e6ce0b9TfQl3UFHTy3Z5wWg
	hFcA9GpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCG3-0000000GmGR-2Hx5;
	Wed, 28 Jan 2026 20:35:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFq-0000000Gm9g-2Tqd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:35:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4359a302794so204495f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632509; x=1770237309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lnap5JnTI2lL7PQO4YFS2y5PBzrQWIZi66+sIvKDZrg=;
        b=aQj7vVFs+KMfV2njsKfiwInRWsOUyw6Nn0/Jc871Uttqqv216Tc+snFfvBcY04ZQgW
         sG0otp1RGOoY2uG7i/wGUgLLtac36gRrb7GlX9MqAd4INeXzO2bOmyNA5GL9r/YJ49fN
         nVXcVqA79LdTaP97rvuZSeD6WScCCcpA65kQsRINXxryjgDK4XAoFB0/BF8TljyJiChV
         O1034ml0+Cb+pDkdzblobjxfQc/kQbf9tvFv4FmP2fKJ1F+CYVE+kc1vov8uPhewXiKG
         Mz44w/CYE/gBiDOzKlmu2z9mRPTE+ms5lxOXQ8fK8VKS/iC3ASI8iNHxGCzFGR3IEaq8
         pV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632509; x=1770237309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lnap5JnTI2lL7PQO4YFS2y5PBzrQWIZi66+sIvKDZrg=;
        b=PMnytU6N5SLy6ZuEul/Jk9psLlPsJStBQWKFZaV9BjCElXbAsRAs3TbRwqR3VpKY8d
         Z6ThY1hHGVRtU9aZueCwBfY9851PDphYifgWdyM5CdrAFjwhs6zjMeXwuMlszdi7I6JM
         l4/EhgwevqdmSqllfozoZlx2hH85cnNTFZxTeGu/yHqN5RKmZOQiqyuwKkVjNLi5B31E
         PbShODwXzr6elei9Bi1muqxdMEYCazxfEpEqt+A/pyht/pf05hFkePxm+fjsoPluDptj
         xtUHrXwgZlwHOwR+eCFbRpIheMGIIE/nBpD5YuuncZoWeaNJ80lExYjiR4eC0/0MewUB
         R5eg==
X-Gm-Message-State: AOJu0YxmQ4pAnTDO8VHmSo7sGNkpGeGH/Ghl6dlBh4qA2QUbS0HeTHiF
	m+hajrhQ/Ag4R3HbX4oVjuWiZGiWZIGsJCEW25oLJH6gjdvcLZJyrfLCixo224ic
X-Gm-Gg: AZuq6aJK3OTqJIxe/jM0Wazb5caYk5aB8KKGvBCFuWr4gme4M7cVwslLoJUPjqLUqnn
	vgCvL1tBcDrI+z74M1pvjr1Ulyz1Pda5pBLtvqPwhAHx4/eczQcQ9dKx6Ws+lZMWOt2xg8J4+xZ
	gB+NlbMzCe/XzollG6/FO7VPfLtwlch0HB+eKqEPMPyYs2xXRaoKjAe7EUG7nMckUyyV4SsobZO
	GZU+I4nzCDh/uRh8jCRAHW5c12rFcTc030Wz/noGBJl1HkWabD84e7Ox7Ma2IyOc5/GAEDgC7Tq
	f8ncNd8SnSXgLe+ZLWBI2r7fsWIyaHOiAMulkSOZqIJcuYS6RhH8ds/Txvob82p5s3bSkANxCVe
	WDnGoQ/D7sxG2rL8W7Du0jh6H2s1BRyVAmEhN8o0GCLSZkTers1C19KtKleUhs/OfAaVLckmysN
	nE+auqc9B5O1xiIlSSDHypS3Jw
X-Received: by 2002:a05:6000:2310:b0:435:db95:c2ce with SMTP id ffacd0b85a97d-435dd1cd844mr8572847f8f.55.1769632508761;
        Wed, 28 Jan 2026 12:35:08 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:08 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 3/7] ARM: dts: Add D-Link DWR-932M support.
Date: Wed, 28 Jan 2026 23:34:51 +0300
Message-ID: <20260128203455.38569-4-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123510_648116_511F5AB6 
X-CRM114-Status: GOOD (  16.00  )
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

This adds DT bindings for zx297520v3 and one board that consumes it.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS                              |  1 +
 arch/arm/boot/dts/Makefile               |  1 +
 arch/arm/boot/dts/zte/Makefile           |  3 ++
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts | 21 ++++++++++++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi    | 37 ++++++++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/dlink-dwr-932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 0989b2c6c157..2682ad06a0f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28395,6 +28395,7 @@ K:	zstd
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zx29.yaml
+F:	arch/arm/boot/dts/zte
 F:	arch/arm/mach-zte/
 
 ZSWAP COMPRESSED SWAP CACHING
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..416c24a489cd
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	dlink-dwr-932m.dtb
diff --git a/arch/arm/boot/dts/zte/dlink-dwr-932m.dts b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
new file mode 100644
index 000000000000..b38b0f2bee8b
--- /dev/null
+++ b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * D-Link DWR-932M Board
+ *
+ * (C) Copyright 2026 Stefan Dösinger
+ *
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..d6c71d52b26c
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+	};
+};
-- 
2.52.0


