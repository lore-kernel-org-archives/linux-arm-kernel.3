Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EC8F9D0FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4bLz2DeulPgEmvyNR5lx2DS3qz8rea6Kq2Vy1ZOZrY=; b=ObsFSr0awNoL9Yqzh79/0im3RP
	NFhkJuE90MhJb/g2jwSty2TcFKrG/OFzYkW9fH/GmEEINEKle03u+oBZ8W2Wt7DfEfIBu3oe6M2Xr
	cKgg5dk8zvhu/NwAYesMHt+SEB2zR/zLydg2fpcWUhgKWUb1mIH8cCAV/kTPdmY47ZE8RfZ1sT9H5
	1itU+pT3QYgaytVtHtoIDb7fEev02IXXO296o8MZbYA3HTwavri6FnqVEC+fCFLfh/NV4Z9+2Lrrx
	UEUmsA7XAoav+p6xQgeiQdKZ9K/cwZSBM3IxHEAyyuKrvfC37kVuY+oigEgXZzgkL4asMQmpAzE4K
	MBCFuZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3f-00000000Dsv-2PUG;
	Tue, 14 Apr 2026 21:12:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3d-00000000DrC-05jY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d7605ec91so2430784f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201147; x=1776805947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4bLz2DeulPgEmvyNR5lx2DS3qz8rea6Kq2Vy1ZOZrY=;
        b=UZdQ7QlXl44WrrukYQj1dnAUHpTOEJzkbB6vGhYg7opbA12xElBdjIvdNl728mMHPf
         3rA5AYeAhZrOvB4VUExneikoOP+CkwDij8kqKBXTzEHSRwlFRlzAY7T0B88PVzLFXeMf
         W07HBRo+xkk0xEqVPLLVadoXu2troTTbwBMnT9MV4+UVRUiJ1o/0XkV5Ku/D5Tj1Iqp8
         gOBOsr1HA2hqjgC52rvmxtid/NgXMr1Rs8ANHmsiMeao3UJp8ZzXzi439iZzdaZtj8/+
         ozkZnNUM7Wh3CfqdEfW5xgwkXDHp6UFirEfX/5lbpYZxmqupzb3EP1xuvpvAhNsof5XX
         tlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201147; x=1776805947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r4bLz2DeulPgEmvyNR5lx2DS3qz8rea6Kq2Vy1ZOZrY=;
        b=d8pi7jkdmL7smgUC2K1wlbA3dEqoiYASU7rDIFdJztqsdQMtq9kJM6ddITMMWLIVi7
         Wmy1UXy6K5P50gc1NDA4a1zPUVT5G+dpS+3ijVMQcsHpfVjryLXnJcX2ra+SwRrjRcGe
         RgJaGLnx/+VxHY+ymUBeNG1wcHlAHj24vTHzGzIjOngy4QM5Scm1jl4snc2pfieD36Ja
         SXeFxzRHvVjDeJ3qDGIiAYjyNRMqkA9xVub+kWYFztv908g+HSL79FUFxT6nDNhWaZjL
         kyp5UDvqwPhIccYq6cU5P+m2PmWefvEyZg4BONZfj5cCFTaanOeLJOb4/LWBH9j9D0lS
         5a7g==
X-Gm-Message-State: AOJu0YzxJQPf4905ZNRhSnyIIDuz4QMZuo2K4tzrLm2mzr2slo+x3azj
	tnIQI2WIk5JGEBi6wdGfIW/liwo4SfJznKJ8fbZS3LatIbCLh5vsxrIFD0EnQY3a
X-Gm-Gg: AeBDies9suPtDBxyh3JBm77Y4scUQWqyR2uK5J4FeZWx126J4bWoZwucN633Gm0F1xP
	NCna7Ju0Km9I/vPxbmBZQJXJeYfnBAaFnP8pBmNdinvHN+GJ594cFHSp9omkNe8MhFDzGL69KJ4
	R2QGAQ1XyWQRNM0rVQ5tHL4P4pbwbasyfiSiLbKyPWla5fCnCGjlCVShGV3pHhrOriUwWSlYA8w
	XdxduVpzH0k2M6vOrUMH4enywKzLUzwl3eGPJZ6VgitsAxqmXekrmoxQz+TyfmQ7/22U3Ijj7Ra
	lbNGlq/qE1gND6EUKLFP39BIDdnnDadm62moYs3SrwRm5qy1NHhGPMS5/s2ek+n7r+FLyO3d6tm
	qU0YhsRdeHi/e8VwwseBOHKU/xyIJZb0wJevr5grI71/bptOgyFnHY6WaMIylquoFcn1HqEvszm
	pPNqdTvjPf7OHj/eErguofvJw7ev7tseSUTiREFBfZRC4=
X-Received: by 2002:a5d:5f92:0:b0:43c:fd7e:72eb with SMTP id ffacd0b85a97d-43d642cd31emr28575206f8f.41.1776201146938;
        Tue, 14 Apr 2026 14:12:26 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:26 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/8] ARM: dts: Add D-Link DWR-932M support
Date: Wed, 15 Apr 2026 00:12:10 +0300
Message-ID: <20260414211215.152850-4-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414211215.152850-1-stefandoesinger@gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141229_095580_EBA03A43 
X-CRM114-Status: GOOD (  16.66  )
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
index c29eb2dfb1b3..21f87d1e0e9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29203,6 +29203,7 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zx29.yaml
+F:	arch/arm/boot/dts/zte
 F:	arch/arm/mach-zte/
 
 SENARYTECH AUDIO CODEC DRIVER
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
index 000000000000..a062c40c467b
--- /dev/null
+++ b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
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


